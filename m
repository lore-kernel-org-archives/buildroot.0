From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Sep 2013 21:44:33 +0200
Subject: [Buildroot] [git commit] iptables: bump to version 1.4.20
Message-ID: <20130901194715.9C0299B666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24606a241660c4128fddceca88a17374d7f935c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables-01-fix-static-link.patch |   67 ++++++++++++++++++++
 package/iptables/iptables.mk                       |    8 ++-
 2 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/package/iptables/iptables-01-fix-static-link.patch b/package/iptables/iptables-01-fix-static-link.patch
new file mode 100644
index 0000000..d4bcfa6
--- /dev/null
+++ b/package/iptables/iptables-01-fix-static-link.patch
@@ -0,0 +1,67 @@
+From 76e230e41947576efb96e86e605bb84015cdb287 Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@inai.de>
+Date: Tue, 13 Aug 2013 19:02:06 +0000
+Subject: iptables: link against libnetfilter_conntrack
+
+Linking currently fails in --enable-static case:
+
+../extensions/libext.a(libxt_connlabel.o): In function `connlabel_get_name':
+iptables/extensions/libxt_connlabel.c:57: undefined reference to `nfct_labelmap_get_name'
+[..]
+It's libxtables.la(libxt_connlabel.o) using libnetfilter_conntrack.
+
+If libnetfilter_conntrack is not found, @libnetfilter_conntrack_CFLAGS@
+and @libnetfilter_conntrack_LIBS@ (and their ${} ones) should be empty,
+therefore producing no harm to include unconditionally.
+
+Reported-and-tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+---
+diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
+index 14e7c57..780e715 100644
+--- a/extensions/GNUmakefile.in
++++ b/extensions/GNUmakefile.in
+@@ -21,7 +21,7 @@ regular_CPPFLAGS   = @regular_CPPFLAGS@
+ kinclude_CPPFLAGS  = @kinclude_CPPFLAGS@
+ 
+ AM_CFLAGS       = ${regular_CFLAGS}
+-AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS}
++AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} @libnetfilter_conntrack_CFLAGS@
+ AM_DEPFLAGS     = -Wp,-MMD,$(@D)/.$(@F).d,-MT,$@
+ AM_LDFLAGS      = @noundef_LDFLAGS@
+ 
+@@ -93,7 +93,7 @@ lib%.so: lib%.oo
+ 	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
+ 
+ lib%.oo: ${srcdir}/lib%.c
+-	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} ${$*_CFLAGADD} -o $@ -c $<;
++	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
+ 
+ libxt_NOTRACK.so: libxt_CT.so
+ 	ln -fs $< $@
+@@ -103,9 +103,7 @@ libxt_state.so: libxt_conntrack.so
+ # Need the LIBADDs in iptables/Makefile.am too for libxtables_la_LIBADD
+ xt_RATEEST_LIBADD   = -lm
+ xt_statistic_LIBADD = -lm
+- at HAVE_LIBNETFILTER_CONNTRACK_TRUE@xt_connlabel_LIBADD = @libnetfilter_conntrack_LIBS@
+-
+-@HAVE_LIBNETFILTER_CONNTRACK_TRUE@xt_connlabel_CFLAGADD = @libnetfilter_conntrack_CFLAGS@
++xt_connlabel_LIBADD = @libnetfilter_conntrack_LIBS@
+ 
+ #
+ #	Static bits
+diff --git a/libxtables/Makefile.am b/libxtables/Makefile.am
+index c5795fe..4267cb5 100644
+--- a/libxtables/Makefile.am
++++ b/libxtables/Makefile.am
+@@ -10,7 +10,7 @@ libxtables_la_LIBADD  =
+ if ENABLE_STATIC
+ # With --enable-static, shipped extensions are linked into the main executable,
+ # so we need all the LIBADDs here too
+-libxtables_la_LIBADD += -lm
++libxtables_la_LIBADD += -lm ${libnetfilter_conntrack_LIBS}
+ endif
+ if ENABLE_SHARED
+ libxtables_la_CFLAGS  = ${AM_CFLAGS}
+--
+cgit v0.9.2
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index f548cb9..13ad0ca 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.4.19.1
+IPTABLES_VERSION = 1.4.20
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-IPTABLES_DEPENDENCIES = host-pkgconf
+IPTABLES_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
-
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
+# Because of iptables-01-fix-static-link.patch
+IPTABLES_AUTORECONF = YES
 
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables
