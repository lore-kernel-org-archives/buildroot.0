From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Dec 2015 15:01:23 -0300
Subject: [Buildroot] [PATCH] iptables: add parallel build fix patch
Message-ID: <1451498483-23715-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5c4/5c4ca595c4bf744aa00fc58851eeccf81f9c6ecc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-xtables-config-parser.h-to-BUILT_SOURCES.patch | 39 ++++++++++++++++++++++
 package/iptables/iptables.mk                       |  2 ++
 2 files changed, 41 insertions(+)
 create mode 100644 package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch

diff --git a/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch b/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
new file mode 100644
index 0000000..761c048
--- /dev/null
+++ b/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
@@ -0,0 +1,39 @@
+From 4dc8e2aa91bd4151f7e5cd56d88d3731b4c1525e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 30 Dec 2015 14:39:35 -0300
+Subject: [PATCH] iptables: add xtables-config-parser.h to BUILT_SOURCES
+
+Otherwise other sources that use it might be built before it's ready leading
+to build failure, for example by iptables/nft.c
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: sent upstream (mailing list, no link yet)
+
+ iptables/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/iptables/Makefile.am b/iptables/Makefile.am
+index 3c0faa5..c3eb8a8 100644
+--- a/iptables/Makefile.am
++++ b/iptables/Makefile.am
+@@ -4,6 +4,8 @@ AM_CFLAGS        = ${regular_CFLAGS}
+ AM_CPPFLAGS      = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${libmnl_CFLAGS} ${libnftnl_CFLAGS} ${libnetfilter_conntrack_CFLAGS}
+ AM_YFLAGS = -d
+ 
++BUILT_SOURCES =
++
+ xtables_multi_SOURCES  = xtables-multi.c iptables-xml.c
+ xtables_multi_CFLAGS   = ${AM_CFLAGS}
+ xtables_multi_LDADD    = ../extensions/libext.a
+@@ -27,6 +29,7 @@ xtables_multi_LDADD   += ../libxtables/libxtables.la -lm
+ 
+ # nftables compatibility layer
+ if ENABLE_NFTABLES
++BUILT_SOURCES += xtables-config-parser.h
+ xtables_compat_multi_SOURCES  = xtables-compat-multi.c iptables-xml.c
+ xtables_compat_multi_CFLAGS   = ${AM_CFLAGS}
+ xtables_compat_multi_LDADD    = ../extensions/libext.a ../extensions/libext_ebt.a
+-- 
+2.4.10
+
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index da8d48b..77a9fad 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -15,6 +15,8 @@ IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
+# For 0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
+IPTABLES_AUTORECONF = YES
 
 # For connlabel match
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
-- 
2.4.10
