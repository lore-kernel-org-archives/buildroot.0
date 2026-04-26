Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888FFFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 13:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305FF4068E;
	Sun, 26 Apr 2026 13:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd_CkKmRvB_Y; Sun, 26 Apr 2026 13:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D82E4073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777210816;
	bh=owwXpoasJ1W4bziFJJkW0Imp+IVA5yQFMEnn27zaXdA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gOStNnUc8E6g5X2jJC/7XRZuAKP9aBRHeo6ItXsfPVa6ixngaP+gLAWgW+FxY4gWx
	 w4qsqPPe5vlWRnkJ5iIO0wSDwc6wo3D/g0PsYCBWWcBJLyOW1HPSAyIfTWyc/quovT
	 kDva+N/j96270U3fXnLEwFoihAeGXQ+2NIZUTkZ/8SlymEWSNSHC5AkL+l7GMKOVOr
	 m0s3Ki0cmpsQrVmyLB8hDfJwEJtKKjClJRnRZ5fSeN4pNqcnCwI6j3D0CCVXbGpdwa
	 VsZoriCb55Bi5/2V0qLFNYkUJwmK4jOCIylXAnK4kMns4BIp2+1FJuAXp7FUo2sGxr
	 aktXaXBDycqqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D82E4073A;
	Sun, 26 Apr 2026 13:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49178231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB5541FCF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sWvcgemrrDH for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 13:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E2594033C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2594033C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E2594033C
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:40:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41E77A4C0F5E;
 Sun, 26 Apr 2026 15:40:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40370)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGziV-000000005o4-1pMr;
 Sun, 26 Apr 2026 13:40:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Sun, 26 Apr 2026 15:40:11 +0200
Message-ID: <20260426134011.1367733-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777210812;
 bh=NzYxclgB3zc7vhyTJZQsN5hUUJsX+BTwsb4ZTw3fYAE=;
 h=From:To:Cc:Subject:Date:From;
 b=rDb51nBsnoLhnhoksFd4hEBP887vtRyqdXwUOuWUiEUFUXqnvCdL09hsRexoBjPME
 xdVxZdA6TJXdDUlEQasz7+OYjkkcJHEUH5624s/HnD+MAdsaLf1UTwy7vYIEGORtRZ
 M+7EqPnMpINbYJpbVtYvZr8BOKFbblZ1jfN4o5m8mwLhoBH+c4LsvFNUnztg5cSe/z
 oJR0XYlf+ufA19CuLcRETZuWJSGLB2JT5VH5heCc3IgsXFWqE1lkktGvtN/cBg6kk8
 jznmbIJx4/0SXgsKGFYfKLCBMbeln5VDk6lQzc+hbFeJsWQgKm9Rkjvdy9e/GvttN1
 YxtmyfvydZ4Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rDb51nBs
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump version to 1.4.1
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

https://github.com/meetecho/janus-gateway/blob/v1.4.1/CHANGELOG.md

Rebased patches, added Upstream: tag to patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                                  |  1 -
 package/janus-gateway/0001-disable-ssp.patch         | 12 ++++++------
 .../0002-Add-test-for-Wunused-but-set-variable.patch | 12 ++++++------
 package/janus-gateway/janus-gateway.hash             |  2 +-
 package/janus-gateway/janus-gateway.mk               |  2 +-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 30c452416e..5a24e5bc3f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -459,7 +459,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
-package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
 package/keyutils/0002-cifs.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index 0c9b006ed9..6d3d8f6ccd 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -6,14 +6,14 @@ Subject: [PATCH] Do not force SSP usage
 The toolchain may not support SSP, so do not enforce its usage, let
 the package user pass the appropriate CFLAGS to enable SSP if needed.
 
+Upstream: https://github.com/meetecho/janus-gateway/pull/1801 (rejected)
+
 Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-(rebased against v0.1.0)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v1.4.1)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-[Upstream status: rejected
-(https://github.com/meetecho/janus-gateway/pull/1801)]
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
@@ -22,14 +22,14 @@ diff --git a/configure.ac b/configure.ac
 index 257ea8c..ca17a29 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -20,7 +20,6 @@ LT_INIT
+@@ -19,7 +19,6 @@ LT_INIT
  # Common CFLAGS
  CFLAGS="$CFLAGS \
  	-fPIC \
 -	-fstack-protector-all \
  	-fstrict-aliasing \
- 	-ggdb3 \
  	-pthread \
+ 	-Wall \
 -- 
 2.20.1
 
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 4596577af3..7905bb8bf2 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -14,8 +14,8 @@ and uses it to detect if the -Wunused-but-set-variable option is
 supported, and only uses it in this case.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-(rebased against v0.1.0)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v1.4.1)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 [rebased against v1.0.3)
@@ -35,7 +35,7 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 96d361e53be0..a8bfd17c930c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -132,6 +132,7 @@ janus_CFLAGS = \
+@@ -134,6 +134,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
  	-DLOGGERDIR=\"$(loggerdir)\" \
  	-DCONFDIR=\"$(confdir)\" \
@@ -57,16 +57,16 @@ index c37c85b7ab06..5afe0ef0bbff 100644
  
  LT_PREREQ([2.2])
  LT_INIT
-@@ -65,8 +68,7 @@ cc*)
+@@ -63,8 +66,7 @@ cc*)
+ 	# Specific gcc flags
  	CFLAGS="$CFLAGS \
- 		-Wcast-align \
  		-Wno-override-init \
 -		-Wunsafe-loop-optimizations \
 -		-Wunused-but-set-variable"
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=1102
+ JANUS_VERSION=1401
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index a147a8afff..2683b32356 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f721d62a22b38ba3a341a5502f06b8b3a5a4f7bd0e9cc6c53de257fe99695e17  janus-gateway-1.1.2.tar.gz
+sha256  cba1e7aac44f4458701c5e14698e791a0eee13ecacbdacc71b4245716c442c08  janus-gateway-1.4.1.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0b4db458f6..0c10cd751a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 1.1.2
+JANUS_GATEWAY_VERSION = 1.4.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
