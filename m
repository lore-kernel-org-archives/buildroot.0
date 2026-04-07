Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C070DFF5138
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B1A360E30;
	Tue,  7 Apr 2026 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbTkzumEHrHh; Tue,  7 Apr 2026 20:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3BD60E2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775593771;
	bh=apYw/zweEYuzkie4b2pruNr/Cj+2Ix3RVMB8wRwMwCI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vvs7Eh3ff+bROZzWe70Qetsn9nzFA3Un+cl0561eCxBYZIE4MHAxhTBvzIIzSLQD2
	 4LizlaG207TfXpLFXKD/LzlAhmPHf0qxzwWgEI0cm5CcLhwfQD3xIWFqVDKPVsjal3
	 c3FZxrjyMczu8oVaolABv2th3iyeL6qAkPYncaQpUp8W6q4Gq3F/BegIDiXCDxCbPj
	 mCdUAwACtzJpNfA21xnBGUi8PsiVvNnN+cqVocYTZeRNhj5vbPynQdajxMVNo0xk9G
	 5Y308Kn+AtRdJDogCNbyES/vYI28mOw0Wk15ABzOqstu8PueAVBD5W4xZmxGIRqXwL
	 EATKOP2tlx9xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3BD60E2C;
	Tue,  7 Apr 2026 20:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD082C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E92E40DEA
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEKn_3k13p6P for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBC7740DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC7740DE6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBC7740DE6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33911A4C2462;
 Tue,  7 Apr 2026 22:29:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55902)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAD36-000000000XO-2sTH;
 Tue, 07 Apr 2026 20:29:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  7 Apr 2026 22:29:19 +0200
Message-ID: <20260407202921.3557385-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775593765;
 bh=yDUvNaGOew13Mlv4oWZ4DkW50qo74mr0dNUfdszZgUo=;
 h=From:To:Cc:Subject:Date:From;
 b=tkIdu3A2puYTZLxMWnMTKyiNEGZmAlcY50AJeGDetVlV9/MfY5drmXu0FprMId49m
 Rd6V8lJm0NQFjFvt2280U2yv0UVPfHwYJIaly9+QUdcM2qrs9WV42KIPXQS0PKlk1G
 QBqPC/lpEsgUUflvkqSfgowcOQK1PqSNIjHOWCJScBSoUH7Sbj7jNzbcYVSEHwCG4I
 M+eu+QZKQofJ5xecJe/x7N026K+M/bB2I7WXfAkDIIdjGOkU15fTVSakRV0YPpavPf
 3J7dc2mv16L6r7GA8M/Iw+KfDEyzDRkakO57l84527eXTx8TqOjS+8WfbbxuDn1iPL
 yWKetdOf+kbCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tkIdu3A2
Subject: [Buildroot] [PATCH 1/3] package/daq: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As discussed on the mailinglist:
https://lists.buildroot.org/pipermail/buildroot/2026-April/799920.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...Fix-build-against-the-musl-C-library.patch | 54 -------------------
 package/daq/0002-parallel-grammar.patch       | 29 ----------
 ...-fix-incompatible-pointer-type-error.patch | 31 -----------
 package/daq/Config.in                         | 11 ----
 package/daq/daq.hash                          |  7 ---
 package/daq/daq.mk                            | 50 -----------------
 package/daq3/Config.in                        |  2 -
 11 files changed, 7 insertions(+), 188 deletions(-)
 delete mode 100644 package/daq/0001-Fix-build-against-the-musl-C-library.patch
 delete mode 100644 package/daq/0002-parallel-grammar.patch
 delete mode 100644 package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
 delete mode 100644 package/daq/Config.in
 delete mode 100644 package/daq/daq.hash
 delete mode 100644 package/daq/daq.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 6e57fb8d32..400e5895a5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -270,8 +270,6 @@ package/dahdi-tools/0002-no-perl-manpages.patch lib_patch.Upstream
 package/dante/0001-fix-sparc-compile.patch lib_patch.Upstream
 package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch lib_patch.Upstream
 package/dante/S50dante Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/daq/0001-Fix-build-against-the-musl-C-library.patch lib_patch.Upstream
-package/daq/0002-parallel-grammar.patch lib_patch.Upstream
 package/darkhttpd/S50darkhttpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch lib_patch.Upstream
 package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 078e2fdeac..25787f0588 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_DAQ
+	bool "daq removed"
+	select BR2_LEGACY
+	help
+	  The only dependee, snort, has been removed.  Look at daq3
+	  for an alternative.
+
 config BR2_PACKAGE_SNORT
 	bool "snort removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 94dfcd04e9..341d50ee2c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3048,7 +3048,6 @@ F:	package/aoetools/
 F:	package/asn1c/
 F:	package/azure-iot-sdk-c/
 F:	package/curlpp/
-F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
 F:	package/sloci-image/
diff --git a/package/Config.in b/package/Config.in
index 310410359d..263554efdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1982,7 +1982,6 @@ menu "Networking"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
-	source "package/daq/Config.in"
 	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
diff --git a/package/daq/0001-Fix-build-against-the-musl-C-library.patch b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
deleted file mode 100644
index 25f2f9c498..0000000000
--- a/package/daq/0001-Fix-build-against-the-musl-C-library.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 42efa6d76a3b52f35e576a6b941a9afb5b3879e9 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Tue, 9 Jan 2018 21:39:27 -0200
-Subject: [PATCH] Fix build against the musl C library
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- os-daq-modules/daq_ipfw.c | 2 +-
- os-daq-modules/daq_ipq.c  | 2 +-
- os-daq-modules/daq_nfq.c  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
-index 016beb06ad61..98f67717f646 100644
---- a/os-daq-modules/daq_ipfw.c
-+++ b/os-daq-modules/daq_ipfw.c
-@@ -26,7 +26,7 @@
- 
- #include <sys/types.h>
- #include <sys/time.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- #include <netinet/in.h>
- #include <sys/socket.h>
-diff --git a/os-daq-modules/daq_ipq.c b/os-daq-modules/daq_ipq.c
-index 77ec6e9505e5..b15e5cf82af0 100644
---- a/os-daq-modules/daq_ipq.c
-+++ b/os-daq-modules/daq_ipq.c
-@@ -27,7 +27,7 @@
- 
- #include <sys/types.h>
- #include <sys/time.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- #include <netinet/ip.h>
- 
-diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
-index 33021c0ec991..0df1e61c74c4 100644
---- a/os-daq-modules/daq_nfq.c
-+++ b/os-daq-modules/daq_nfq.c
-@@ -27,7 +27,7 @@
- 
- #include <sys/types.h>
- #include <sys/time.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- #include <netinet/ip.h>
- 
--- 
-1.9.1
-
diff --git a/package/daq/0002-parallel-grammar.patch b/package/daq/0002-parallel-grammar.patch
deleted file mode 100644
index ba0e256f53..0000000000
--- a/package/daq/0002-parallel-grammar.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix parallel build
-
-https://bugs.gentoo.org/673390
-
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/net-libs/daq/files/daq-2.0.6-parallel-grammar.patch
-
-Patch was sent upstream: https://seclists.org/snort/2014/q3/1016
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/sfbpf/Makefile.am
-+++ b/sfbpf/Makefile.am
-@@ -43,13 +43,14 @@
- libsfbpf_la_LDFLAGS = -version-info 0:1:0 @XCCFLAGS@
- 
- # use of $@ and $< here is a GNU idiom that borks BSD
--sf_scanner.c: $(srcdir)/scanner.l
-+sf_scanner.c: $(srcdir)/scanner.l tokdefs.h
- 	@rm -f $(srcdir)/sf_scanner.c
- 	$(srcdir)/runlex.sh $(V_LEX) -osf_scanner.c $(srcdir)/scanner.l
- 
- sf_scanner.o: sf_scanner.c tokdefs.h
- 
- tokdefs.h: sf_grammar.c
-+
- sf_grammar.c: $(srcdir)/grammar.y
- 	@rm -f sf_grammar.c tokdefs.h
- 	$(V_YACC) -d $(srcdir)/grammar.y
diff --git a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
deleted file mode 100644
index a15d325cd6..0000000000
--- a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix daq incompatible pointer type error when gcc option
-'-Wincompatible-pointer-types is set:
-
-| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
-| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
-   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
-|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
-|       |                                     ^~~~~~~~~~~
-|       |                                     |
-|       |                                     char **
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch?h=master
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- os-daq-modules/daq_nfq.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
-index 4de94b6..a6de2f3 100644
---- a/os-daq-modules/daq_nfq.c
-+++ b/os-daq-modules/daq_nfq.c
-@@ -391,7 +391,7 @@ static inline int SetPktHdr (
-     DAQ_PktHdr_t* hdr,
-     uint8_t** pkt
- ) {
--    int len = nfq_get_payload(nfad, (char**)pkt);
-+    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
- 
-     if ( len <= 0 )
-         return -1;
diff --git a/package/daq/Config.in b/package/daq/Config.in
deleted file mode 100644
index ad294abd60..0000000000
--- a/package/daq/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DAQ
-	bool "daq"
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	help
-	  DAQ is a Data Acquisition library for packet I/O from the
-	  Snort project.
-
-	  https://www.snort.org
-
-comment "daq needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/daq/daq.hash b/package/daq/daq.hash
deleted file mode 100644
index 82323ed404..0000000000
--- a/package/daq/daq.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://www.snort.org/downloads/snort/md5s
-md5  60e5ddcafb985fac7374884d28f299d1  daq-2.0.7-modified.tar.gz
-# Locally computed:
-sha256  d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279  daq-2.0.7-modified.tar.gz
-
-# Hash for license files:
-sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
deleted file mode 100644
index 27abd4d2f5..0000000000
--- a/package/daq/daq.mk
+++ /dev/null
@@ -1,50 +0,0 @@
-################################################################################
-#
-# daq
-#
-################################################################################
-
-DAQ_VERSION = 2.0.7
-# Upstream re-published a modified archive for the same 2.0.7 version, so change
-# its name locally, to avoid conflict with older BR versions which had a hash
-# for the previous archive.
-DAQ_SOURCE = daq-2.0.7-modified.tar.gz
-DAQ_SITE = https://www.snort.org/downloads/snort/daq-$(DAQ_VERSION).tar.gz?buildroot-path=filename
-DAQ_LICENSE = GPL-2.0
-DAQ_LICENSE_FILES = COPYING
-DAQ_INSTALL_STAGING = YES
-DAQ_DEPENDENCIES = host-bison host-flex
-# 0002-parallel-grammar.patch
-# 2.0.7 needs autoreconf due to configure being older than configure.ac
-DAQ_AUTORECONF = YES
-
-# disable ipq module as libipq is deprecated
-DAQ_CONF_OPTS += --disable-ipq-module
-
-# Set --with-dnet-{includes,libraries} even if ipq and nfq modules are disabled
-# otherwise daq will call 'dnet-config --cflags' and 'dnet-config --libs' which
-# will result in a build failure if libdnet is installed on host
-DAQ_CONF_OPTS += \
-	--with-dnet-includes=$(STAGING_DIR)/usr/include \
-	--with-dnet-libraries=$(STAGING_DIR)/usr/lib
-
-ifeq ($(BR2_PACKAGE_LIBDNET)$(BR2_PACKAGE_LIBNETFILTER_QUEUE),yy)
-DAQ_DEPENDENCIES += libdnet libnetfilter_queue
-DAQ_CONF_OPTS += --enable-nfq-module
-else
-DAQ_CONF_OPTS += --disable-nfq-module
-endif
-
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-DAQ_DEPENDENCIES += libpcap
-# assume these flags are available to prevent configure from running
-# test programs while cross compiling
-DAQ_CONF_ENV += \
-	ac_cv_lib_pcap_pcap_lib_version=yes \
-	daq_cv_libpcap_version_1x=yes
-DAQ_CONF_OPTS += --enable-pcap-module
-else
-DAQ_CONF_OPTS += --disable-pcap-module
-endif
-
-$(eval $(autotools-package))
diff --git a/package/daq3/Config.in b/package/daq3/Config.in
index b53e5508fd..8025e48bc7 100644
--- a/package/daq3/Config.in
+++ b/package/daq3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DAQ3
 	bool "daq3"
-	depends on !BR2_PACKAGE_DAQ
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -11,6 +10,5 @@ config BR2_PACKAGE_DAQ3
 	  https://www.snort.org
 
 comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9, threads"
-	depends on !BR2_PACKAGE_DAQ
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
