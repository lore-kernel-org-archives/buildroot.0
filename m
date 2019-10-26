From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:14:33 +0200
Subject: [Buildroot] [git commit] package/systemd: bump version to 243
Message-ID: <20191026140805.9F4DD8853F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb402832a9458cda8272625bbeb395f112436420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added config option for new systemd-pstore feature.

Removed patches that have been committed upstream.

Added symlinks required to enable some services.

After extensive discussion with upstream it does not seem there is any
acceptable option to have symlink installation handled on their side.

The recommended solution from upstream is to have systemctl handle
service installation, however this has a number of downsides such as
requiring us to build a host-systemd just to install a few symlinks.

Since we already customize service installation it is simpler for us
to create the symlinks ourselves, this will also simplify service
customization on our side as we will not need to disable any systemd
default services in cases where we need to make customizations.

In addition using systemctl would introduce a minimum host headers
dependency in which we don't have the infrastructure to handle
properly.

The downside to this approach is that we need to track service creation
changes from upstream ourselves, however this is relatively straightforward
and since upstream service file locations are relatively stable regressions
should be limited. This will mostly be a concern in regards to adding
support for new systemd features.

Details:
https://github.com/systemd/systemd/issues/12767
https://github.com/systemd/systemd/pull/12164
https://github.com/systemd/systemd/pull/12769
https://github.com/systemd/systemd/pull/12775

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-install-don-t-use-ln-relative.patch       |  26 +--
 ...-message-paths-longer-than-BUS_PATH_SIZE_.patch |  53 ------
 ...mporary-strings-to-hold-dbus-paths-on-the.patch | 194 ---------------------
 ...eson-drop-misplaced-Wl-undefined-argument.patch |  51 ------
 package/systemd/Config.in                          |  10 ++
 package/systemd/systemd.hash                       |   2 +-
 package/systemd/systemd.mk                         |  89 +++++++++-
 7 files changed, 109 insertions(+), 316 deletions(-)

diff --git a/package/systemd/0001-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
index d00a8db63f..2bde36c774 100644
--- a/package/systemd/0001-install-don-t-use-ln-relative.patch
+++ b/package/systemd/0001-install-don-t-use-ln-relative.patch
@@ -1,4 +1,4 @@
-From 7f4a12d25bbb5859d266f32f7a3d794bb62c354e Mon Sep 17 00:00:00 2001
+From 006b1d65fd5ea6555fcb72054ecc20234f4175db Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Sun, 31 Dec 2017 12:46:04 -0500
 Subject: [PATCH] install: don't use ln --relative
@@ -30,10 +30,10 @@ Signed-off-by: Trent Piepho <tpiepho@impinj.com>
  3 files changed, 7 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 04331dd41..359042c04 100644
+index e5ceb1e169..9d3c746da4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -628,7 +628,7 @@ endforeach
+@@ -580,7 +580,7 @@ endforeach
  conf.set_quoted('TELINIT', get_option('telinit-path'))
  
  if run_command('ln', '--relative', '--help').returncode() != 0
@@ -43,32 +43,32 @@ index 04331dd41..359042c04 100644
  
  ############################################################
 diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
-index 501cd43d4..25e7f89fd 100755
+index da0d13a341..4917eff7d1 100755
 --- a/tools/meson-make-symlink.sh
 +++ b/tools/meson-make-symlink.sh
 @@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
  if [ "$(dirname $1)" = . ]; then
-         ln -vfs -T "$1" "${DESTDIR:-}$2"
+     ln -vfs -T "$1" "${DESTDIR:-}$2"
  else
--        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
-+        dds="$( dirname "$2" |sed -r -e 's:/+[^/]+:../:g; s:/$::' )"
-+        ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
+-    ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
++    dds="$( dirname "$2" |sed -r -e 's:/+[^/]+:../:g; s:/$::' )"
++    ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
  fi
 diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
-index 70f7172ae..bb8155075 100755
+index a483d75b86..4642673d98 100755
 --- a/units/meson-add-wants.sh
 +++ b/units/meson-add-wants.sh
 @@ -14,7 +14,7 @@ case "$target" in
-                 ;;
+         ;;
  esac
  
 -unitpath="${DESTDIR:-}${unitdir}/${unit}"
 +unitpath="${unitdir}/${unit}"
  
  case "$target" in
-         */)
+     */)
 @@ -25,4 +25,6 @@ case "$target" in
-                 ;;
+         ;;
  esac
  
 -ln -vfs --relative "$unitpath" "$dir"
@@ -76,5 +76,5 @@ index 70f7172ae..bb8155075 100755
 +dds="$(printf "%s" "${linkdir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::')"
 +ln -vfs "$dds$unitpath" "$dir"
 -- 
-2.14.4
+2.20.1
 
diff --git a/package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch b/package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
deleted file mode 100644
index 2de3b71b5c..0000000000
--- a/package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From febef5e18558c114f4fb7c94f6c8ed3520c50cdf Mon Sep 17 00:00:00 2001
-From: Riccardo Schirone <rschiron@redhat.com>
-Date: Mon, 4 Feb 2019 14:29:09 +0100
-Subject: [PATCH] Refuse dbus message paths longer than BUS_PATH_SIZE_MAX
- limit.
-
-Even though the dbus specification does not enforce any length limit on the
-path of a dbus message, having to analyze too long strings in PID1 may be
-time-consuming and it may have security impacts.
-
-In any case, the limit is set so high that real-life applications should not
-have a problem with it.
-
-(cherry picked from commit 61397a60d98e368a5720b37e83f3169e3eb511c4)
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 61397a60d98
-
- src/libsystemd/sd-bus/bus-internal.c | 2 +-
- src/libsystemd/sd-bus/bus-internal.h | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-internal.c b/src/libsystemd/sd-bus/bus-internal.c
-index 40acae213381..598b7f110c73 100644
---- a/src/libsystemd/sd-bus/bus-internal.c
-+++ b/src/libsystemd/sd-bus/bus-internal.c
-@@ -43,7 +43,7 @@ bool object_path_is_valid(const char *p) {
-         if (slash)
-                 return false;
- 
--        return true;
-+        return (q - p) <= BUS_PATH_SIZE_MAX;
- }
- 
- char* object_path_startswith(const char *a, const char *b) {
-diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
-index f208b294d8f1..a8d61bf72a4e 100644
---- a/src/libsystemd/sd-bus/bus-internal.h
-+++ b/src/libsystemd/sd-bus/bus-internal.h
-@@ -332,6 +332,10 @@ struct sd_bus {
- 
- #define BUS_MESSAGE_SIZE_MAX (128*1024*1024)
- #define BUS_AUTH_SIZE_MAX (64*1024)
-+/* Note that the D-Bus specification states that bus paths shall have no size limit. We enforce here one
-+ * anyway, since truly unbounded strings are a security problem. The limit we pick is relatively large however,
-+ * to not clash unnecessarily with real-life applications. */
-+#define BUS_PATH_SIZE_MAX (64*1024)
- 
- #define BUS_CONTAINER_DEPTH 128
- 
--- 
-2.20.1
-
diff --git a/package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch b/package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
deleted file mode 100644
index 007b806c09..0000000000
--- a/package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 9e3f5a77226d5320270c92df001f6c79be735af3 Mon Sep 17 00:00:00 2001
-From: Riccardo Schirone <rschiron@redhat.com>
-Date: Mon, 4 Feb 2019 14:29:28 +0100
-Subject: [PATCH] Allocate temporary strings to hold dbus paths on the heap
-
-Paths are limited to BUS_PATH_SIZE_MAX but the maximum size is anyway too big
-to be allocated on the stack, so let's switch to the heap where there is a
-clear way to understand if the allocation fails.
-
-(cherry picked from commit f519a19bcd5afe674a9b8fc462cd77d8bad403c1)
-[baruch: backport to v240]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Adam: Update for v241]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/libsystemd/sd-bus/bus-objects.c | 68 +++++++++++++++++++++++------
- 1 file changed, 54 insertions(+), 14 deletions(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 58329f3fe78..54b977418e0 100644
---- a/src/libsystemd/sd-bus/bus-objects.c
-+++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -1133,7 +1133,8 @@ static int object_manager_serialize_path_and_fallbacks(
-                 const char *path,
-                 sd_bus_error *error) {
- 
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -1149,7 +1150,12 @@ static int object_manager_serialize_path_and_fallbacks(
-                 return 0;
- 
-         /* Second, add fallback vtables registered for any of the prefixes */
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
-                 if (r < 0)
-@@ -1345,6 +1351,7 @@ static int object_find_and_run(
- }
- 
- int bus_process_object(sd_bus *bus, sd_bus_message *m) {
-+        _cleanup_free_ char *prefix = NULL;
-         int r;
-         size_t pl;
-         bool found_object = false;
-@@ -1369,9 +1376,12 @@ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
-         assert(m->member);
- 
-         pl = strlen(m->path);
--        do {
--                char prefix[pl+1];
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
- 
-+        do {
-                 bus->nodes_modified = false;
- 
-                 r = object_find_and_run(bus, m, m->path, false, &found_object);
-@@ -1498,9 +1508,15 @@ static int bus_find_parent_object_manager(sd_bus *bus, struct node **out, const
- 
-         n = hashmap_get(bus->nodes, path);
-         if (!n) {
--                char *prefix;
-+                _cleanup_free_ char *prefix = NULL;
-+                size_t pl;
-+
-+                pl = strlen(path);
-+                assert(pl <= BUS_PATH_SIZE_MAX);
-+                prefix = new(char, pl + 1);
-+                if (!prefix)
-+                        return -ENOMEM;
- 
--                prefix = newa(char, strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         n = hashmap_get(bus->nodes, prefix);
-                         if (n)
-@@ -2083,8 +2099,9 @@ _public_ int sd_bus_emit_properties_changed_strv(
-                 const char *interface,
-                 char **names) {
- 
-+        _cleanup_free_ char *prefix = NULL;
-         bool found_interface = false;
--        char *prefix;
-+        size_t pl;
-         int r;
- 
-         assert_return(bus, -EINVAL);
-@@ -2105,6 +2122,12 @@ _public_ int sd_bus_emit_properties_changed_strv(
- 
-         BUS_DONT_DESTROY(bus);
- 
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         do {
-                 bus->nodes_modified = false;
- 
-@@ -2114,7 +2137,6 @@ _public_ int sd_bus_emit_properties_changed_strv(
-                 if (bus->nodes_modified)
-                         continue;
- 
--                prefix = newa(char, strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
-                         if (r != 0)
-@@ -2246,7 +2268,8 @@ static int object_added_append_all_prefix(
- 
- static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2291,7 +2314,12 @@ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *p
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2430,7 +2458,8 @@ static int object_removed_append_all_prefix(
- 
- static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2462,7 +2491,12 @@ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2612,7 +2646,8 @@ static int interfaces_added_append_one(
-                 const char *path,
-                 const char *interface) {
- 
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2626,7 +2661,12 @@ static int interfaces_added_append_one(
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
-                 if (r != 0)
--- 
-2.20.1
-
diff --git a/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch b/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch
deleted file mode 100644
index 52ef811494..0000000000
--- a/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 700805f6c546f2adb79059614f3747f7b5474325 Mon Sep 17 00:00:00 2001
-From: Jussi Pakkanen <jpakkane@gmail.com>
-Date: Sat, 6 Apr 2019 21:59:06 +0200
-Subject: [PATCH] meson: drop misplaced -Wl,--undefined argument
-
-Ld's man page says the following:
-
-  -u symbol
-  --undefined=symbol
-
-  Force symbol to be entered in the output file as an undefined symbol. Doing
-  this may, for example, trigger linking of additional modules from standard
-  libraries. -u may be repeated with different option arguments to enter
-  additional undefined symbols. This option is equivalent to the "EXTERN"
-  linker script command.
-
-  If this option is being used to force additional modules to be pulled into
-  the link, and if it is an error for the symbol to remain undefined, then the
-  option --require-defined should be used instead.
-
-This would imply that it always requires an argument, which this does not
-pass. Thus it will grab the next argument on the command line as its
-argument. Before it took one of the many -lrt args (presumably) and now it
-grabs something other random linker argument and things break.
-
-[zj: this line was added in the first version of the meson configuration back
-in 5c23128daba7236a6080383b2a5649033cfef85c. AFAICT, this was a mistake. No
-such flag appeared in Makefile.am at the time.]
-
-https://github.com/mesonbuild/meson/issues/5113
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/systemd/systemd/commit/700805f6c546f2adb79059614f3747f7b5474325]
----
- meson.build | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 287125f0107..79195c97484 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1606,8 +1606,7 @@ foreach tuple : [['myhostname', 'ENABLE_NSS_MYHOSTNAME'],
-                         # Note that we link NSS modules with '-z nodelete' so that mempools never get orphaned
-                         link_args : ['-Wl,-z,nodelete',
-                                      '-shared',
--                                     '-Wl,--version-script=' + version_script_arg,
--                                     '-Wl,--undefined'],
-+                                     '-Wl,--version-script=' + version_script_arg],
-                         link_with : [libsystemd_static,
-                                      libbasic],
-                         dependencies : [threads,
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ad72a269ef..601398bf96 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -161,6 +161,16 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
+config BR2_PACKAGE_SYSTEMD_PSTORE
+	bool "enable pstore support"
+	default y
+	help
+	  When this features is enabled, additional tools and services
+	  are built to support archiving contents of the persistent
+	  storage filesytem.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-pstore.html
+
 config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	bool "enable firstboot support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index c769d48959..bc8edfcdba 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	b2561a8e1d10a2c248253f0dda31a85dd6d69f2b54177de55e02cd1d2778316e  	systemd-241.tar.gz
+sha256	0611843c2407f8b125b1b7cb93533bdebd4ccf91c99dffa64ec61556a258c7d1  	systemd-243.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	d9356b277440f21730426592c27170d034a39954ab5154dfba1cc3cbf7b22935	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b6aac6dc53..5961d98b22 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 241
+SYSTEMD_VERSION = 243
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
@@ -24,7 +24,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
-	-Dlibcryptsetup=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
@@ -52,6 +51,12 @@ endif
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 SYSTEMD_DEPENDENCIES += audit
 SYSTEMD_CONF_OPTS += -Daudit=true
+define SYSTEMD_INSTALL_SERVICE_AUDIT
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/auditd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
+endef
+
 else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
@@ -59,6 +64,11 @@ endif
 ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
 SYSTEMD_DEPENDENCIES += cryptsetup
 SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true
+define SYSTEMD_INSTALL_TARGET_CRYPTSETUP
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/remote-cryptsetup.target \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-cryptsetup.target
+endef
 else
 SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false
 endif
@@ -259,6 +269,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
 SYSTEMD_CONF_OPTS += -Dmachined=true
+define SYSTEMD_INSTALL_TARGET_MACHINED
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/machines.target \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/machines.target
+endef
 else
 SYSTEMD_CONF_OPTS += -Dmachined=false
 endif
@@ -300,6 +315,17 @@ else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
+SYSTEMD_CONF_OPTS += -Dpstore=true
+define SYSTEMD_INSTALL_SERVICE_PSTORE
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/systemd-remount-fs.service.wants
+	ln -sf ../../../../lib/systemd/system/systemd-pstore.service \
+		$(TARGET_DIR)/etc/systemd/system/systemd-remount-fs.service.wants/systemd-pstore.service
+endef
+else
+SYSTEMD_CONF_OPTS += -Dpstore=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
 SYSTEMD_DEPENDENCIES += polkit
@@ -310,6 +336,24 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
+define SYSTEMD_INSTALL_SOCKET_NETWORKD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-networkd.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/systemd-networkd.socket
+endef
+define SYSTEMD_INSTALL_SERVICE_NETWORKD
+	ln -sf ../../../lib/systemd/system/systemd-networkd.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.network1.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-networkd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/systemd-networkd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-online.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-networkd-wait-online.service \
+		$(TARGET_DIR)/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-pre.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-network-generator.service \
+		$(TARGET_DIR)/etc/systemd/system/network-pre.target.wants/systemd-network-generator.service
+endef
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
@@ -329,6 +373,13 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+define SYSTEMD_INSTALL_SERVICE_RESOLVED
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../lib/systemd/system/systemd-resolved.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.resolve1.service
+	ln -sf ../../../../lib/systemd/system/systemd-resolved.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/systemd-resolved.service
+endef
 else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
@@ -336,10 +387,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
-define SYSTEMD_INSTALL_SERVICE_TIMESYNC
+define SYSTEMD_INSTALL_SERVICE_TIMESYNCD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
 		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
+	ln -sf ../../../../lib/systemd/system/systemd-time-wait-sync.service \
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
+	ln -sf ../../../lib/systemd/system/systemd-timesyncd.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.timesync1.service
 endef
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
@@ -398,6 +453,11 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/shutdown
 	ln -fs ../../../lib/systemd/system/multi-user.target \
 		$(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs ../../../lib/systemd/system/reboot.target \
+		$(TARGET_DIR)/etc/systemd/system/ctrl-alt-del.target
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/remote-fs.target \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-fs.target
 endef
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
@@ -405,6 +465,9 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
+	SYSTEMD_INSTALL_TARGET_MACHINED \
+	SYSTEMD_INSTALL_SOCKET_NETWORKD \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
@@ -449,6 +512,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 		TARGET="serial-getty at .service"; \
 		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
 	fi; \
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
 	ln -fs ../../../../lib/systemd/system/$${TARGET} \
 		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
 	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
@@ -458,11 +522,28 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 endef
 endif
 
+define SYSTEMD_INSTALL_SERVICE_AUTOVT
+	ln -sf ../../../lib/systemd/system/getty at .service \
+		$(TARGET_DIR)/lib/systemd/system/autovt at .service
+endef
+
+define SYSTEMD_INSTALL_SERVICE_BOOT_CHECK
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires
+	ln -sf ../../../../lib/systemd/system/systemd-boot-check-no-failures.service \
+		$(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
+endef
+
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_DISABLE_SERVICE_TTY1)
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
-	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
+	$(SYSTEMD_INSTALL_SERVICE_AUTOVT)
+	$(SYSTEMD_INSTALL_SERVICE_RESOLVED)
+	$(SYSTEMD_INSTALL_SERVICE_TIMESYNCD)
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
+	$(SYSTEMD_INSTALL_SERVICE_PSTORE)
+	$(SYSTEMD_INSTALL_SERVICE_NETWORKD)
+	$(SYSTEMD_INSTALL_SERVICE_AUDIT)
+	$(SYSTEMD_INSTALL_SERVICE_BOOT_CHECK)
 endef
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
