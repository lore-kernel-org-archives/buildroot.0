From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Nov 2017 08:41:30 -0200
Subject: [Buildroot] [PATCH 2/3] netcf: new package
In-Reply-To: <20171127104131.27975-1-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
Message-ID: <20171127104131.27975-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netcf is a cross-platform network configuration library. It takes the
description of a network interface in its own platform-independent
format and adapts the local system's network configuration to provide
that interface.

Both the ncftool utility and libnetcf are installed. The library is used
by libvirt (forthcoming package) when udev is not available.

netcf was originally hosted at fedorahosted.org, which was retired on
March 1st, 2017, so we take the code fom the Debian snapshot archive.

Five bug fixes were imported from Fedora 26. Four additional patches are
required to clean-up the code and adapt it to the Buildroot directory
hierarchy.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                                  |   1 +
 package/netcf/0001-fix-misplaced-empty.patch       |  36 +++++++
 ...002-call-aug_load-at-most-once-per-second.patch |  83 +++++++++++++++
 ...g_match-query-for-all-ifcfg-files-related.patch | 113 +++++++++++++++++++++
 ...ude-bond-element-for-bonds-with-no-slaves.patch |  56 ++++++++++
 ...erly-classify-bond-devices-with-no-slaves.patch |  35 +++++++
 ...006-netcf-transaction.sh-remove-bash-isms.patch |  50 +++++++++
 ...t-script-as-etc-init.d-S30netcf-transacti.patch |  35 +++++++
 ...08-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch |  29 ++++++
 ...LUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch |  52 ++++++++++
 package/netcf/Config.in                            |  24 +++++
 package/netcf/S30netcf-transaction                 |   9 ++
 package/netcf/netcf.hash                           |   2 +
 package/netcf/netcf.mk                             |  22 ++++
 14 files changed, 547 insertions(+)
 create mode 100644 package/netcf/0001-fix-misplaced-empty.patch
 create mode 100644 package/netcf/0002-call-aug_load-at-most-once-per-second.patch
 create mode 100644 package/netcf/0003-optimize-aug_match-query-for-all-ifcfg-files-related.patch
 create mode 100644 package/netcf/0004-linux-include-bond-element-for-bonds-with-no-slaves.patch
 create mode 100644 package/netcf/0005-Properly-classify-bond-devices-with-no-slaves.patch
 create mode 100644 package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
 create mode 100644 package/netcf/0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch
 create mode 100644 package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
 create mode 100644 package/netcf/0009-Replace-INCLUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch
 create mode 100644 package/netcf/Config.in
 create mode 100644 package/netcf/S30netcf-transaction
 create mode 100644 package/netcf/netcf.hash
 create mode 100644 package/netcf/netcf.mk

diff --git a/package/Config.in b/package/Config.in
index 86acab6427..cdfb90151a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,6 +1710,7 @@ menu "Networking applications"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
 	source "package/ndisc6/Config.in"
+	source "package/netcf/Config.in"
 	source "package/netatalk/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netcf/0001-fix-misplaced-empty.patch b/package/netcf/0001-fix-misplaced-empty.patch
new file mode 100644
index 0000000000..74a3a63d7a
--- /dev/null
+++ b/package/netcf/0001-fix-misplaced-empty.patch
@@ -0,0 +1,36 @@
+From 8e00e9c0ba6b66035defc94470ac863f04eba4b5 Mon Sep 17 00:00:00 2001
+From: Laine Stump <laine@laine.org>
+Date: Thu, 21 May 2015 11:40:53 -0400
+Subject: [PATCH 1/9] fix misplaced <empty/>
+
+When transcribing the link-speed-state bits from libvirt's
+interface.rng to netcf's, I accidentally added an "<empty/>" in the
+wrong place. It should have gone inside the definition of the <link>
+element, rather than just after <link> in the <interface> element.
+---
+ data/xml/interface.rng | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/xml/interface.rng b/data/xml/interface.rng
+index 8d70e8b..9098cc9 100644
+--- a/data/xml/interface.rng
++++ b/data/xml/interface.rng
+@@ -41,7 +41,6 @@
+         </element>
+       </optional>
+       <ref name="link-speed-state"/>
+-      <empty/>
+       <!-- FIXME: Allow (some) ethtool options -->
+     </interleave>
+   </define>
+@@ -489,6 +488,7 @@
+         <optional>
+           <attribute name="state"><ref name="link-state"/></attribute>
+         </optional>
++        <empty/>
+       </element>
+     </optional>
+   </define>
+-- 
+2.13.6
+
diff --git a/package/netcf/0002-call-aug_load-at-most-once-per-second.patch b/package/netcf/0002-call-aug_load-at-most-once-per-second.patch
new file mode 100644
index 0000000000..c4f3a308df
--- /dev/null
+++ b/package/netcf/0002-call-aug_load-at-most-once-per-second.patch
@@ -0,0 +1,83 @@
+From 9b5f4eb57af28a604cd7ac8b2c1be9e49f0b517d Mon Sep 17 00:00:00 2001
+From: Laine Stump <laine@laine.org>
+Date: Mon, 28 Sep 2015 17:11:11 -0400
+Subject: [PATCH 2/9] call aug_load() at most once per second
+
+Previously, netcf would call aug_load() at the start of each public
+API call, and rely on augeas quickly determining if the files needed
+to be reread based on checking the mtime of all files. With a large
+number of files (i.e. several hundred ifcfg files) just checking the
+mtime of all files ends up taking quite a long time; enough to turn a
+simple "virsh iface-list" of 300 bridges + 300 vlans into a 22 second
+ordeal.
+
+With this patch applied, netcf will only call aug_load() at most once
+every second, resulting in runtime for virsh iface-list going down to
+< 1 second.
+
+The trade-off is that the results of a netcf API call could be up to 1
+second out of date (but only due to changes in the config external to
+netcf). Since ifcfg files change very infrequently, this is likely
+acceptable.
+---
+ src/dutil_linux.c | 8 +++++++-
+ src/dutil_linux.h | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/dutil_linux.c b/src/dutil_linux.c
+index 0850593..24f4d95 100644
+--- a/src/dutil_linux.c
++++ b/src/dutil_linux.c
+@@ -32,6 +32,7 @@
+ #include <unistd.h>
+ #include <ctype.h>
+ #include <errno.h>
++#include <time.h>
+ 
+ #include <dirent.h>
+ #include <sys/wait.h>
+@@ -151,6 +152,7 @@ int remove_augeas_xfm_table(struct netcf *ncf,
+  */
+ augeas *get_augeas(struct netcf *ncf) {
+     int r;
++    time_t current_time;
+ 
+     if (ncf->driver->augeas == NULL) {
+         augeas *aug;
+@@ -186,9 +188,12 @@ augeas *get_augeas(struct netcf *ncf) {
+         }
+         ncf->driver->copy_augeas_xfm = 0;
+         ncf->driver->load_augeas = 1;
++        ncf->driver->load_augeas_time = 0;
+     }
+ 
+-    if (ncf->driver->load_augeas) {
++    current_time = time(NULL);
++    if (ncf->driver->load_augeas &&
++        ncf->driver->load_augeas_time != current_time) {
+         augeas *aug = ncf->driver->augeas;
+ 
+         r = aug_load(aug);
+@@ -207,6 +212,7 @@ augeas *get_augeas(struct netcf *ncf) {
+         }
+         ERR_THROW(r > 0, ncf, EOTHER, "errors in loading some config files");
+         ncf->driver->load_augeas = 0;
++        ncf->driver->load_augeas_time = current_time;
+     }
+     return ncf->driver->augeas;
+  error:
+diff --git a/src/dutil_linux.h b/src/dutil_linux.h
+index a06a15c..75ac631 100644
+--- a/src/dutil_linux.h
++++ b/src/dutil_linux.h
+@@ -41,6 +41,7 @@ struct driver {
+     struct nl_sock     *nl_sock;
+     struct nl_cache   *link_cache;
+     struct nl_cache   *addr_cache;
++    time_t             load_augeas_time;
+     unsigned int       load_augeas : 1;
+     unsigned int       copy_augeas_xfm : 1;
+     unsigned int       augeas_xfm_num_tables;
+-- 
+2.13.6
+
diff --git a/package/netcf/0003-optimize-aug_match-query-for-all-ifcfg-files-related.patch b/package/netcf/0003-optimize-aug_match-query-for-all-ifcfg-files-related.patch
new file mode 100644
index 0000000000..2d4003e450
--- /dev/null
+++ b/package/netcf/0003-optimize-aug_match-query-for-all-ifcfg-files-related.patch
@@ -0,0 +1,113 @@
+From 396e4e0698d9fb542f2eb8b32790a069e1c0df61 Mon Sep 17 00:00:00 2001
+From: Laine Stump <laine@laine.org>
+Date: Wed, 7 Oct 2015 13:49:45 -0400
+Subject: [PATCH 3/9] optimize aug_match() query for all ifcfg files related to
+ an interface
+
+This resolves:
+
+ https://bugzilla.redhat.com/show_bug.cgi?id=1269613
+
+The original augeas search term used by netcf to find, for example, all the
+ifcfg files associated with device "br1" was:
+
+     "/files/etc/sysconfig/network-scripts/*[ "
+     "DEVICE = 'br1' or BRIDGE = 'br1' or MASTER = 'br1' or MASTER = "
+     "../*[BRIDGE = 'br1']/DEVICE ]/DEVICE"
+
+This is *extremely* inefficient - on a test host with 514 host
+bridges, each with an attached vlan interface, a dumpxml of all
+toplevel interfaces took 6m40s (*after* installing an augeas that
+included augeas upstream commits a659f09a, 41e989ca, and 23d5e480
+which were all pushed after the augeas-1.4.0 release).
+
+In these two messages:
+
+ https://www.redhat.com/archives/augeas-devel/2015-October/msg00003.html
+ https://www.redhat.com/archives/augeas-devel/2015-October/msg00004.html
+
+David Lutterkort suggested changing the search term to:
+
+  "(/files/etc/sysconfig/network-scripts/*[(DEVICE|BRIDGE|MASTER) = 'br1']"
+  "|/files/etc/sysconfig/network-scripts/*[MASTER]"
+  "[MASTER = ../*[BRIDGE = 'br1']/DEVICE ])/DEVICE
+
+That's what this patch does. Testing shows that it is functionally
+equivalent, and reduces the dumpxml time in the previously described
+test from 6m40s down to 17 seconds.
+---
+ src/drv_redhat.c | 44 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/src/drv_redhat.c b/src/drv_redhat.c
+index 4935f98..092ef5c 100644
+--- a/src/drv_redhat.c
++++ b/src/drv_redhat.c
+@@ -88,6 +88,38 @@ static const struct augeas_xfm_table augeas_xfm_common =
+     { .size = ARRAY_CARDINALITY(augeas_xfm_common_pv),
+       .pv = augeas_xfm_common_pv };
+ 
++/* aug_all_related_ifcfgs() - return the count of (and optionally a list
++ * of, if matches != NULL) the paths for all ifcfg files that are
++ * related to the interface "name".
++ */
++static
++int aug_all_related_ifcfgs(struct netcf *ncf, char ***matches, const char *name) {
++    int nmatches;
++
++    /* this includes the ifcfg files for:
++     *
++     * 1) the named interface itself (DEVICE=$name)
++     *
++     * 2) any interface naming $name as a bridge it is attached to
++     *    (BRIDGE=$name)
++     *
++     * 3) any interface naming $name as the master of a bond it is
++     *    enslaved to (MASTER=$name)
++     *
++     * 4) any interface with a MASTER, where the device named as
++     *    MASTER contains a BRIDGE=$name *and* DEVICE=$itself (thus
++     *    catching ethernet devices that are enslaved to a bond that
++     *    is attached to a bridge).
++     */
++    nmatches = aug_fmt_match(ncf, matches,
++                             "(%s[(DEVICE|BRIDGE|MASTER) = '%s']"
++                             "|%s[MASTER][MASTER = ../*[BRIDGE = '%s']/DEVICE "
++                             "])/DEVICE",
++                             ifcfg_path, name, ifcfg_path, name);
++    return nmatches;
++
++}
++
+ /* Entries in a ifcfg file that tell us that the interface
+  * is not a toplevel interface
+  */
+@@ -108,12 +140,7 @@ static int is_slave(struct netcf *ncf, const char *intf) {
+ static bool has_ifcfg_file(struct netcf *ncf, const char *name) {
+     int nmatches;
+ 
+-    nmatches = aug_fmt_match(ncf, NULL,
+-                             "%s[ DEVICE = '%s'"
+-                             "    or BRIDGE = '%s'"
+-                             "    or MASTER = '%s'"
+-                             "    or MASTER = ../*[BRIDGE = '%s']/DEVICE ]/DEVICE",
+-                             ifcfg_path, name, name, name, name);
++    nmatches = aug_all_related_ifcfgs(ncf, NULL, name);
+     return nmatches > 0;
+ }
+ 
+@@ -588,10 +615,7 @@ static xmlDocPtr aug_get_xml_for_nif(struct netcf_if *nif) {
+     int ndevs = 0, nint = 0;
+ 
+     ncf = nif->ncf;
+-    ndevs = aug_fmt_match(ncf, &devs,
+-              "%s[ DEVICE = '%s' or BRIDGE = '%s' or MASTER = '%s'"
+-              "    or MASTER = ../*[BRIDGE = '%s']/DEVICE ]/DEVICE",
+-              ifcfg_path, nif->name, nif->name, nif->name, nif->name);
++    ndevs = aug_all_related_ifcfgs(ncf, &devs, nif->name);
+     ERR_BAIL(ncf);
+ 
+     nint = uniq_ifcfg_paths(ncf, ndevs, devs, &intf);
+-- 
+2.13.6
+
diff --git a/package/netcf/0004-linux-include-bond-element-for-bonds-with-no-slaves.patch b/package/netcf/0004-linux-include-bond-element-for-bonds-with-no-slaves.patch
new file mode 100644
index 0000000000..e552cff70b
--- /dev/null
+++ b/package/netcf/0004-linux-include-bond-element-for-bonds-with-no-slaves.patch
@@ -0,0 +1,56 @@
+From cfe1eb87f7f152ab5d6456ef8ecd7aab38d376fa Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Wed, 27 May 2015 19:30:25 +0200
+Subject: [PATCH 4/9] linux: include <bond> element for bonds with no slaves
+
+The missing element makes libvirt sad:
+
+  $ ncftool dumpxml --live nm-bond
+  <?xml version="1.0"?>
+  <interface name="nm-bond" type="bond">
+    <link state="unknown" speed="0"/>
+    <protocol family="ipv4">
+      <ip address="1.2.3.4" prefix="8"/>
+    </protocol>
+  </interface>
+
+  $ virsh iface-dumpxml nm-bond
+  error: XML error: bond interface misses the bond element
+
+This is analogous what was done in d32a464c (Always add <bridge> element to
+bridge if, even if no physdev is attached) for bridges.
+---
+ src/dutil_linux.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/dutil_linux.c b/src/dutil_linux.c
+index 24f4d95..022eed0 100644
+--- a/src/dutil_linux.c
++++ b/src/dutil_linux.c
+@@ -1055,9 +1055,6 @@ static void add_bond_info_cb(struct nl_object *obj,
+         || rtnl_link_get_master(iflink) != cb_data->master_ifindex)
+         return;
+ 
+-    cb_data->bond = xml_node(cb_data->doc, cb_data->root, "bond");
+-    ERR_NOMEM(cb_data->bond == NULL, ncf);
+-
+     /* XXX - if we learn where to get bridge "mode" property, set it here */
+ 
+     /* XXX - need to add node like one of these:
+@@ -1089,7 +1086,13 @@ static void add_bond_info(struct netcf *ncf,
+     if (ifindex == RTNL_LINK_NOT_FOUND)
+         return;
+ 
++    cb_data.bond = xml_node(doc, root, "bond");
++    ERR_NOMEM(cb_data.bond == NULL, ncf);
++
+     nl_cache_foreach(ncf->driver->link_cache, add_bond_info_cb, &cb_data);
++
++error:
++    return;
+ }
+ 
+ 
+-- 
+2.13.6
+
diff --git a/package/netcf/0005-Properly-classify-bond-devices-with-no-slaves.patch b/package/netcf/0005-Properly-classify-bond-devices-with-no-slaves.patch
new file mode 100644
index 0000000000..f255669dab
--- /dev/null
+++ b/package/netcf/0005-Properly-classify-bond-devices-with-no-slaves.patch
@@ -0,0 +1,35 @@
+From f3ec5157c7fc97e31c7b48e3a56da268de7e4216 Mon Sep 17 00:00:00 2001
+From: Laine Stump <laine@laine.org>
+Date: Tue, 13 Oct 2015 14:42:35 -0400
+Subject: [PATCH 5/9] Properly classify bond devices with no slaves
+
+Although initscripts only considers an interface to be a bond if it
+has slaves, there are times when setting up a bond, or testing, when a
+bond may not have any slaves (yet) but does have a BONDING_OPTS
+attribute. Previously in those situations netcf would identify the
+interface as a plain ethernet. This patch makes the check more
+inclusive - now any interface with slaves *or* with a BONDING_OPTS
+attribute is considered to be a bond.
+
+This patch was inspired by an earlier patch sent by Lubomir Rintel
+which looked for BONDING_OPTS *instead of* looking for slaves.
+---
+ data/xml/redhat-put.xsl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/xml/redhat-put.xsl b/data/xml/redhat-put.xsl
+index ed56c66..89145e5 100644
+--- a/data/xml/redhat-put.xsl
++++ b/data/xml/redhat-put.xsl
+@@ -135,7 +135,7 @@
+   </xsl:template>
+ 
+   <xsl:template name="bond-interface"
+-                match="tree[node[@label = 'DEVICE'][@value = //tree/node[@label = 'MASTER']/@value]][count(node[@label = 'BRIDGE']) = 0]">
++                match="tree[count(node[@label = 'BONDING_OPTS']) or (node[@label = 'DEVICE'][@value = //tree/node[@label = 'MASTER']/@value])][count(node[@label = 'BRIDGE']) = 0]">
+     <interface type="bond">
+       <xsl:call-template name="name-attr"/>
+       <xsl:call-template name="startmode"/>
+-- 
+2.13.6
+
diff --git a/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch b/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
new file mode 100644
index 0000000000..c25cc779af
--- /dev/null
+++ b/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
@@ -0,0 +1,50 @@
+From 91cdbd05a82be014f43d549ddcf5a67471a5f029 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 8 Oct 2017 09:36:42 -0300
+Subject: [PATCH 6/9] netcf-transaction.sh: remove bash-isms
+
+echo $"..." -> echo "..."
+echo -n $"...$a $b" -> printf "... %s %s" "$a" "$b"
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ src/netcf-transaction.sh.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/netcf-transaction.sh.in b/src/netcf-transaction.sh.in
+index c9aafdf..f668d40 100644
+--- a/src/netcf-transaction.sh.in
++++ b/src/netcf-transaction.sh.in
+@@ -197,7 +197,7 @@ change_rollback ()
+ # usage [val]
+ # Display usage string, then exit with VAL (defaults to 2).
+ usage() {
+-    echo $"Usage: $0 {change-begin|change-commit|change-rollback|snapshot-dir|start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
++    echo "Usage: $0 {change-begin|change-commit|change-rollback|snapshot-dir|start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
+     exit ${1-2}
+ }
+ 
+@@ -210,7 +210,7 @@ retval=0
+ case "$1" in
+     # commands required in all Fedora initscripts
+     start|restart|reload|force-reload|condrestart|try-restart)
+-        echo -n $"Running $prog $1: "
++        printf "Running %s %s: " "$0" "$1"
+         change_rollback
+         # ignore the "no pending transaction" error
+         test "$retval" != "$EINVALID_IN_THIS_STATE" && retval=$?
+@@ -219,9 +219,9 @@ case "$1" in
+     stop|status)
+         if test -d "$snapshotdir"
+         then
+-            echo $"There is an open transaction"
++            echo "There is an open transaction"
+         else
+-            echo $"No open transaction"
++            echo "No open transaction"
+         fi
+         ;;
+ 
+-- 
+2.13.6
+
diff --git a/package/netcf/0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch b/package/netcf/0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch
new file mode 100644
index 0000000000..5e3c553958
--- /dev/null
+++ b/package/netcf/0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch
@@ -0,0 +1,35 @@
+From e7aa162d0a14684dafa5d8316c34d19ba01ed503 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 8 Oct 2017 09:43:08 -0300
+Subject: [PATCH 7/9] Install init script as /etc/init.d/S30netcf-transaction
+
+This is for Buildroot, only.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ src/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 2f76614..ce04b43 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -138,12 +138,12 @@ BUILT_SOURCES += netcf-transaction.sh
+ 
+ if NETCF_USE_INITSCRIPTS
+ install-sysinit: netcf-transaction.init
+-	$(MKDIR_P) $(DESTDIR)$(sysconfdir)/rc.d/init.d
++	$(MKDIR_P) $(DESTDIR)$(sysconfdir)/init.d
+ 	$(INSTALL_SCRIPT) netcf-transaction.init \
+-	  $(DESTDIR)$(sysconfdir)/rc.d/init.d/netcf-transaction
++	  $(DESTDIR)$(sysconfdir)/init.d/S30netcf-transaction
+ 
+ uninstall-sysinit:
+-	rm -f $(DESTDIR)$(sysconfdir)/rc.d/init.d/netcf-transaction \
++	rm -f $(DESTDIR)$(sysconfdir)/init.d/S30netcf-transaction \
+ 	  $(DESTDIR)$(sysconfdir)/sysconfig/netcf-transaction
+ 
+ netcf-transaction.init: netcf-transaction.init.in \
+-- 
+2.13.6
+
diff --git a/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch b/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
new file mode 100644
index 0000000000..4331d84b55
--- /dev/null
+++ b/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
@@ -0,0 +1,29 @@
+From 6daa25084b553351255e8f3e6b252a446e5f88fc Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 8 Oct 2017 13:16:41 -0300
+Subject: [PATCH 8/9] configure.ac: fix AM_INIT_AUTOMAKE call
+
+Add the subdir-objects options, since the main Makefile.am references
+files in subdirectories, to silence a warning when autoreconfiguring.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 15c47cd..1ca80ef 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([gnulib/m4])
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])
++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests parallel-tests])
+ AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
+ AC_CANONICAL_HOST
+ 
+-- 
+2.13.6
+
diff --git a/package/netcf/0009-Replace-INCLUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch b/package/netcf/0009-Replace-INCLUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch
new file mode 100644
index 0000000000..c23e7a223c
--- /dev/null
+++ b/package/netcf/0009-Replace-INCLUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch
@@ -0,0 +1,52 @@
+From decbcbbea45b4511353dc5ff8cd9465d9cf8d1dd Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 8 Oct 2017 13:26:54 -0300
+Subject: [PATCH 9/9] Replace INCLUDES by AM_CPPFLAGS in some Makefile.am files
+
+Also, do not redefine AM_CPPFLAGS in gnulib/tests/Makefile.am, since
+this is already done in gnulib.mk (generated file), which Makefile.am
+includes. This silences some warnings when autoreconfiguring.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ gnulib/lib/Makefile.am   | 2 +-
+ gnulib/tests/Makefile.am | 2 --
+ tests/Makefile.am        | 2 +-
+ 3 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/gnulib/lib/Makefile.am b/gnulib/lib/Makefile.am
+index 4009220..90383ca 100644
+--- a/gnulib/lib/Makefile.am
++++ b/gnulib/lib/Makefile.am
+@@ -13,4 +13,4 @@ CLEANFILES=
+ 
+ include gnulib.mk
+ 
+-INCLUDES = $(GETTEXT_CPPFLAGS)
++AM_CPPFLAGS = $(GETTEXT_CPPFLAGS)
+diff --git a/gnulib/tests/Makefile.am b/gnulib/tests/Makefile.am
+index 3445c6d..59041bb 100644
+--- a/gnulib/tests/Makefile.am
++++ b/gnulib/tests/Makefile.am
+@@ -4,5 +4,3 @@
+ ## See COPYING.LIB for the License of this software
+ 
+ include gnulib.mk
+-
+-INCLUDES = $(GETTEXT_CPPFLAGS)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 641222d..7635c2e 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT = \
+   abs_top_builddir='$(abs_top_builddir)' \
+   abs_top_srcdir='$(abs_top_srcdir)'
+ 
+-INCLUDES = -I$(top_srcdir)/src
++AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+ TESTS=
+ check_PROGRAMS=
+-- 
+2.13.6
+
diff --git a/package/netcf/Config.in b/package/netcf/Config.in
new file mode 100644
index 0000000000..d38c2dcef0
--- /dev/null
+++ b/package/netcf/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_NETCF
+	bool "netcf"
+	depends on !BR2_arc # augeas
+	depends on !BR2_STATIC_LIBS # libnl
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # augeas
+	select BR2_PACKAGE_AUGEAS
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_READLINE
+	help
+	  netcf is a cross-platform network configuration library.
+
+	  It takes the description of a network interface in its own
+	  platform-independent format and adapts the local system's
+	  network configuration to provide that interface.
+
+	  Both the ncftool utility and libnetcf are installed.
+
+comment "netcf needs a toolchain w/ wchar"
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR
diff --git a/package/netcf/S30netcf-transaction b/package/netcf/S30netcf-transaction
new file mode 100644
index 0000000000..ad67123916
--- /dev/null
+++ b/package/netcf/S30netcf-transaction
@@ -0,0 +1,9 @@
+#!/bin/sh
+#
+# This script can save the current state of network config, and later
+# revert to that config, or commit the new config (by deleting the
+# snapshot). At boot time, if there are uncommitted changes to the
+# network config, they are reverted (and the discarded changes are
+# archived in /var/lib/netcf/network-rollback-*).
+
+exec /usr/libexec/netcf-transaction.sh "$@"
diff --git a/package/netcf/netcf.hash b/package/netcf/netcf.hash
new file mode 100644
index 0000000000..2ba2a5c204
--- /dev/null
+++ b/package/netcf/netcf.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 fd81d607795547807150dfdb82bd164ab2569369ab48a30cb6b0d010d17b127c  netcf_0.2.8.orig.tar.gz
diff --git a/package/netcf/netcf.mk b/package/netcf/netcf.mk
new file mode 100644
index 0000000000..bd2bc8715d
--- /dev/null
+++ b/package/netcf/netcf.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# netcf
+#
+################################################################################
+
+NETCF_VERSION = 0.2.8
+NETCF_SITE = http://snapshot.debian.org/archive/debian/20171007T103908Z/pool/main/n/netcf
+NETCF_SOURCE = netcf_$(NETCF_VERSION).orig.tar.gz
+NETCF_INSTALL_STAGING = YES
+NETCF_LICENSE = LGPL-2.1+
+NETCF_LICENSE_FILES = COPYING
+NETCF_DEPENDENCIES = augeas libnl libxml2 libxslt readline
+NETCF_INSTALL_STAGING = YES
+
+# 0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch
+NETCF_AUTORECONF = YES
+
+NETCF_CONF_OPTS = \
+	--with-sysinit=$(if $(BR2_INIT_SYSTEMD),systemd,$(if $(BR2_INIT_NONE),none,initscripts))
+
+$(eval $(autotools-package))
-- 
2.14.3
