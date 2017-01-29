From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:44:23 +0100
Subject: [Buildroot] [git commit] iptables: bump to version 1.6.1
Message-ID: <20170129134440.968E981EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08a15442bf053705e4147eed74e1e4e8e80b5ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed the 3 patches as they have been added into the latest
version.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: drop autoreconf, no longer needed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptables/0001-fix-build-with-musl.patch    | 67 ----------------------
 ...-xtables-config-parser.h-to-BUILT_SOURCES.patch | 39 -------------
 .../0003-extensions-added-AR-substitution.patch    | 33 -----------
 package/iptables/iptables.hash                     |  6 +-
 package/iptables/iptables.mk                       |  5 +-
 5 files changed, 4 insertions(+), 146 deletions(-)

diff --git a/package/iptables/0001-fix-build-with-musl.patch b/package/iptables/0001-fix-build-with-musl.patch
deleted file mode 100644
index d5e0c2e..0000000
--- a/package/iptables/0001-fix-build-with-musl.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 2f2fde48594ec34e93ab409cd83442efe58e10ad Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Mon, 31 Aug 2015 15:24:44 +0100
-Subject: [PATCH 3/3] fix build with musl
-
-Add needed headers they are just not needed for glibc6+ but also
-for musl
-Define additional TCOPTS if not there
-
-u_initX types are in sys/types.h be explicit about it
-
-Upstream-Status: Pending
-
-bh: this is a copy of the patch at the link below, modified to remove
-the changes to include/libiptc/ipt_kernel_headers.h as these are
-already integrated in the upstream tree. See :
-
-http://lists.openembedded.org/pipermail/openembedded-core/2015-April/103613.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- extensions/libxt_TCPOPTSTRIP.c           | 15 +++++++++++++++
- include/linux/netfilter_ipv4/ip_tables.h |  1 +
- 2 files changed, 16 insertions(+)
-
-diff --git a/extensions/libxt_TCPOPTSTRIP.c b/extensions/libxt_TCPOPTSTRIP.c
-index 6897857..8a170b2 100644
---- a/extensions/libxt_TCPOPTSTRIP.c
-+++ b/extensions/libxt_TCPOPTSTRIP.c
-@@ -12,6 +12,21 @@
- #ifndef TCPOPT_MD5SIG
- #	define TCPOPT_MD5SIG 19
- #endif
-+#ifndef TCPOPT_MAXSEG
-+#	define TCPOPT_MAXSEG 2
-+#endif
-+#ifndef TCPOPT_WINDOW
-+#	define TCPOPT_WINDOW 3
-+#endif
-+#ifndef TCPOPT_SACK_PERMITTED
-+#	define TCPOPT_SACK_PERMITTED 4
-+#endif
-+#ifndef TCPOPT_SACK
-+#	define TCPOPT_SACK 5
-+#endif
-+#ifndef TCPOPT_TIMESTAMP
-+#	define TCPOPT_TIMESTAMP 8
-+#endif
- 
- enum {
- 	O_STRIP_OPTION = 0,
-diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
-index 57fd82a..4807246 100644
---- a/include/linux/netfilter_ipv4/ip_tables.h
-+++ b/include/linux/netfilter_ipv4/ip_tables.h
-@@ -15,6 +15,7 @@
- #ifndef _IPTABLES_H
- #define _IPTABLES_H
- 
-+#include <sys/types.h>
- #include <linux/types.h>
- 
- #include <linux/netfilter_ipv4.h>
--- 
-2.4.3
-
diff --git a/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch b/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
deleted file mode 100644
index 761c048..0000000
--- a/package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4dc8e2aa91bd4151f7e5cd56d88d3731b4c1525e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 30 Dec 2015 14:39:35 -0300
-Subject: [PATCH] iptables: add xtables-config-parser.h to BUILT_SOURCES
-
-Otherwise other sources that use it might be built before it's ready leading
-to build failure, for example by iptables/nft.c
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: sent upstream (mailing list, no link yet)
-
- iptables/Makefile.am | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/iptables/Makefile.am b/iptables/Makefile.am
-index 3c0faa5..c3eb8a8 100644
---- a/iptables/Makefile.am
-+++ b/iptables/Makefile.am
-@@ -4,6 +4,8 @@ AM_CFLAGS        = ${regular_CFLAGS}
- AM_CPPFLAGS      = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${libmnl_CFLAGS} ${libnftnl_CFLAGS} ${libnetfilter_conntrack_CFLAGS}
- AM_YFLAGS = -d
- 
-+BUILT_SOURCES =
-+
- xtables_multi_SOURCES  = xtables-multi.c iptables-xml.c
- xtables_multi_CFLAGS   = ${AM_CFLAGS}
- xtables_multi_LDADD    = ../extensions/libext.a
-@@ -27,6 +29,7 @@ xtables_multi_LDADD   += ../libxtables/libxtables.la -lm
- 
- # nftables compatibility layer
- if ENABLE_NFTABLES
-+BUILT_SOURCES += xtables-config-parser.h
- xtables_compat_multi_SOURCES  = xtables-compat-multi.c iptables-xml.c
- xtables_compat_multi_CFLAGS   = ${AM_CFLAGS}
- xtables_compat_multi_LDADD    = ../extensions/libext.a ../extensions/libext_ebt.a
--- 
-2.4.10
-
diff --git a/package/iptables/0003-extensions-added-AR-substitution.patch b/package/iptables/0003-extensions-added-AR-substitution.patch
deleted file mode 100644
index b522ba7..0000000
--- a/package/iptables/0003-extensions-added-AR-substitution.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From eca9b91b832dfc27d0e1a6d08e2ce4878f229373 Mon Sep 17 00:00:00 2001
-From: Jordan Yelloz <jordan@yelloz.me>
-Date: Fri, 24 Jun 2016 12:18:45 -0700
-Subject: [PATCH] extensions: added AR substitution
-
-This is to ensure that the correct AR is run in cross-compile jobs.
-Often a cross-compile build will succeed without this change but it
-fails on my Gentoo Linux system when I have binutils installed with the
-"multitarget" USE flag.
-This change substitues AR with the autotools-supplied AR for the
-extensions subdirectory.
-
-Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- extensions/GNUmakefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
-index 53be2cd..33b06ef 100644
---- a/extensions/GNUmakefile.in
-+++ b/extensions/GNUmakefile.in
-@@ -11,6 +11,7 @@ libdir       = @libdir@
- libexecdir   = @libexecdir@
- xtlibdir     = @xtlibdir@
- 
-+AR                 = @AR@
- CC                 = @CC@
- CCLD               = ${CC}
- CFLAGS             = @CFLAGS@
--- 
-2.7.4
-
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 18d8b44..b673c8a 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.6.0.tar.bz2.{md5sum,sha1sum}
-md5	27ba3451cb622467fc9267a176f19a31 	iptables-1.6.0.tar.bz2
-sha1	21a694e75b0d6863cc001f85fb15915d12b8cc22	iptables-1.6.0.tar.bz2
+# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.6.1.tar.bz2.{md5sum,sha1sum}
+md5	ab38a33806b6182c6f53d6afb4619add	iptables-1.6.1.tar.bz2
+sha1	b2592490ca7a6c2cd0f069e167a4337c86acdf91	iptables-1.6.1.tar.bz2
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a8ebec8..90fab34 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.6.0
+IPTABLES_VERSION = 1.6.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
@@ -15,9 +15,6 @@ IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
-# For 0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
-# and 0003-extensions-added-AR-substitution.patch
-IPTABLES_AUTORECONF = YES
 
 # For connlabel match
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
