Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F9EC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 13:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8575081113;
	Sun, 11 Aug 2024 13:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxOkup1aXNYG; Sun, 11 Aug 2024 13:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D86A810F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D86A810F7;
	Sun, 11 Aug 2024 13:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91C3C1BF397
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0D1403AC
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 13:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHAtDnTJK-Tm for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 13:17:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D540403A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D540403A6
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D540403A6
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 13:17:08 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 700A7353DA99; Sun, 11 Aug 2024 15:17:04 +0200 (CEST)
Date: Sun, 11 Aug 2024 15:17:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zri50N1KfTZ1bLqc@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723382224; bh=stfCGcm8QnU/SQIHtja8YmPU4cPetJIAeSYda/DJnks=;
 h=Date:From:To:Subject:From;
 b=LbaRZDPf2hKCog2GkMcWQ+mfIPpe1wVuyNAky/RbrmkSfRWrn5mXzrPzrcLWJlSIO
 NWggDeP9jTb3Sk1OjP5GLiP33CMBO1do7efHlY3WYpP/34PJR3dTorioHkBPa3N4CN
 9NtYHUyvhmo/UhoQUdkxNivTZiURXKJr9BurRWDUhi5erGB+M3+q6OUp0YWLaQYN80
 SgxYkwMUh6kiQrsVv25Rp/aIuVDSBx7kz7V5OkkutBvSKu7oz5oPf4TVPHKQZWX8Le
 k24oaQl9VH0W15Omk37TaSpK6jZRt7YCwCQS7H8mOoKhbh4pyHR3c4WAHaH+Svg/W2
 Lbu9R9soiq3fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=LbaRZDPf
Subject: [Buildroot] [PATCH next] package/bind: update to 9.18.28
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Bind 9.16.x is EOL since April 2024.
See here for what version should be used in production:
https://kb.isc.org/docs/aa-01540

Remove patch 0001 as CC_FOR_BUILD is used in upstream code
to compile host utility gen.

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html

COPYRIGHT file has been updated, following Copyright holders were
added:
Copyright Joyent, Inc. and other Node contributors. All rights reserved.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore           |  1 -
 package/bind/0001-cross.patch | 34 ----------------------------------
 package/bind/bind.hash        |  8 ++++----
 package/bind/bind.mk          |  3 ++-
 4 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 package/bind/0001-cross.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fe4a16eb8..4f78f7d4aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -338,7 +338,6 @@ package/benejson/0001-c-std.patch lib_patch.Upstream
 package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch lib_patch.Upstream
 package/berkeleydb/0001-cwd-db_config.patch lib_patch.Upstream
 package/berkeleydb/0002-atomic_compare_exchange.patch lib_patch.Upstream
-package/bind/0001-cross.patch lib_patch.Upstream
 package/bind/S81named Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch lib_patch.Upstream
 package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch lib_patch.Upstream
diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
deleted file mode 100644
index f39be2f837..0000000000
--- a/package/bind/0001-cross.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 505cc9fcadda5607dc4c5bacb03928c0b35162a8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Nov 2020 17:51:38 +0100
-Subject: [PATCH] Use host compiler to build 'gen' since it's run when
- building.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Fabrice: updated for 9.11.10]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- lib/dns/Makefile.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/lib/dns/Makefile.in b/lib/dns/Makefile.in
-index 8fc4e94f26..4ac92857e0 100644
---- a/lib/dns/Makefile.in
-+++ b/lib/dns/Makefile.in
-@@ -184,10 +184,8 @@ code.h:	gen
- 	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
- 
- gen: gen.c
--	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
--	${LFS_CFLAGS} ${LFS_LDFLAGS} \
--	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
--	${BUILD_LIBS} ${LFS_LIBS}
-+	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
-+	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
- 
- timestamp: include libdns.@A@
- 	touch timestamp
--- 
-2.29.1
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 482b046c8d..feb3430a73 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
-# with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
-sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
+# Verified from https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
+# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
+sha256  e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  bind-9.18.28.tar.xz
+sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0d81ffabd6..b6a2ee272b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.48
+BIND_VERSION = 9.18.28
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
@@ -31,6 +31,7 @@ BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
 	--enable-epoll \
+	--disable-doh \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
