From: Joel Carlson <joelsoncarl@gmail.com>
Date: Fri, 21 Dec 2018 16:29:59 -0700
Subject: [Buildroot] [PATCH 1/1] iptables: add patch to fix symlink path of
 iptables-xml
Message-ID: <20181221232959.27895-1-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iptables-xml currently gets installed as a symlink to
${sbindir}/xtables-multi, which should have ${DESTDIR} prepended to
point to the correct binary.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
This is probably not a problem until
https://patchwork.ozlabs.org/patch/1009598/
ends up on master. Which I hope it does, as sdk generation is broken
without that series.

Anyway, if those sdk patches are applied, then without this change sdk
generation will fail as the symlink that iptables installs will point to
/usr/sbin/xtables-multi instead of
/path/to/sysroot/usr/sbin/xtables-multi

I will admit I don't fully understand autotools/automake/etc stuff very
well. When I had just the patch, the build failed with complaints about
automake version mismatch, but adding AUTORECONF=YES fixed that. I am
unsure if there is a better or more proper way.
---
 .../0002-iptables-xml-fix-symlink-path.patch  | 36 +++++++++++++++++++
 package/iptables/iptables.mk                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 package/iptables/0002-iptables-xml-fix-symlink-path.patch

diff --git a/package/iptables/0002-iptables-xml-fix-symlink-path.patch b/package/iptables/0002-iptables-xml-fix-symlink-path.patch
new file mode 100644
index 0000000000..99711bfdba
--- /dev/null
+++ b/package/iptables/0002-iptables-xml-fix-symlink-path.patch
@@ -0,0 +1,36 @@
+From ce154ab4a06d79bd5830c7f0e353635ee49a93c2 Mon Sep 17 00:00:00 2001
+From: Joel Carlson <JoelsonCarl@gmail.com>
+Date: Fri, 21 Dec 2018 15:19:38 -0700
+Subject: [PATCH iptables] iptables-xml: fix symlink path
+
+The symlinks for vx_bin_links should prepend ${DESTDIR} so it links
+against the installed xtables-multi binary if installing to a location
+specified via ${DESTDIR}.
+
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+---
+I committed this upstream to netfilter-devel at
+http://patchwork.ozlabs.org/patch/1017739/
+
+This is a modified version of that patch to work with v1.6.2 that we are
+currently grabbing.
+---
+ iptables/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/Makefile.am b/iptables/Makefile.am
+index f92cc4ff..fe5195d7 100644
+--- a/iptables/Makefile.am
++++ b/iptables/Makefile.am
+@@ -88,7 +88,7 @@ pkgconfig_DATA = xtables.pc
+ install-exec-hook:
+ 	-if test -z "${DESTDIR}"; then /sbin/ldconfig; fi;
+ 	${INSTALL} -dm0755 "${DESTDIR}${bindir}";
+-	for i in ${vx_bin_links}; do ${LN_S} -f "${sbindir}/xtables-multi" "${DESTDIR}${bindir}/$$i"; done;
++	for i in ${vx_bin_links}; do ${LN_S} -f "${DESTDIR}${sbindir}/xtables-multi" "${DESTDIR}${bindir}/$$i"; done;
+ 	for i in ${v4_sbin_links}; do ${LN_S} -f xtables-multi "${DESTDIR}${sbindir}/$$i"; done;
+ 	for i in ${v6_sbin_links}; do ${LN_S} -f xtables-multi "${DESTDIR}${sbindir}/$$i"; done;
+ 	for i in ${x_sbin_links}; do ${LN_S} -f xtables-compat-multi "${DESTDIR}${sbindir}/$$i"; done;
+-- 
+2.17.1
+
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 54494937af..71d3975f52 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -15,6 +15,7 @@ IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
+IPTABLES_AUTORECONF=YES
 
 # For connlabel match
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
-- 
2.17.1
