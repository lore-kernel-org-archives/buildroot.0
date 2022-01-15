Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9311E81D7C;
	Sat, 15 Jan 2022 15:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BDs1fg5UDSW; Sat, 15 Jan 2022 15:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B461D81D7D;
	Sat, 15 Jan 2022 15:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F18C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A516607B0
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVrYF3N4frv0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51B4C6076C
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:34:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p18so11624709wmg.4
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Dcx57waKYDFbSNT8uNimyE4aERct7mtM/6s7bJNCg4=;
 b=EbeWHMGigBvFfzBmHkvC5mnZaAERzkVtZOY+MsdNmeouq88myIwU9IKVZsLco09WhX
 SydZr8isAUs0Cl1CPzoPCzmbN2ld+9UZcXc+YBcOZhrYVzHew44+g/DwCpmvzOaQVDGG
 xfgMhuLtomj5/zQA5hIPtccay4RL/nROrpI8xFxpPCY46fy1jbyUu9uBmRIxOx9/dbKF
 vadvbQ3zm7xUBmbv3sakWjrVpo3UXHDZZFp7hgqsokRRCT0uwovKLoMl2pEHlh9FiwsP
 +rTEIRhlLHF2W2+/8vtsG/IdfZRXk0hp0QD7tOsPLGtoJVgcIaoF3P6EnCRG5EonL9tb
 O/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Dcx57waKYDFbSNT8uNimyE4aERct7mtM/6s7bJNCg4=;
 b=NfTlkOKmnYdtoTt+Axh8SPI7JwePBS1Gs9QCSNowV1BM6Ni8k7AOpRCSJpbi1RePlR
 TlGE3OwT3oBrdW5uH/WNceJloDI37sgKNt4ls0CsOFudsxNHwXnK+mZzRAIsZyYxVgqr
 y/kvjNsQmT/4krMHHHGM30MRhiUE58jKOADnzl0bDtcmE6Xtx6av1bvrolF3oQKEgd9A
 f4g9KGf1QSSth7VjLh0lst2sfFI9VycKg9hJmgEst23jJfE+eeNqD+8bu2HVQ5gTm2Wz
 Us3JGR/OOGLa74j8pVv+7syBVk4AzYj5J2u+F0Xx2FrjCfrNDnZuylX/qU4CCety9kn8
 /HMQ==
X-Gm-Message-State: AOAM533d7wdMbElfpFL4CVnlHP0yG5BxBvd4IQNPpBBm4viPgALDW2Sn
 /hXHhDHebxPqnNCqGRuxGZlAEQ2Z0gE=
X-Google-Smtp-Source: ABdhPJzjzGG/4HQjbhLdAz17hk2vFxPCZuxTaSppgfBzVdnHjxtquwU4XLdhMPoP6wUa7bC4mJG6kw==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr12329948wri.679.1642260896265; 
 Sat, 15 Jan 2022 07:34:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id w6sm8846123wrq.86.2022.01.15.07.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 07:34:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:33:19 +0100
Message-Id: <20220115153319.2227752-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: fix static build with
 libgcrypt
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with libgcrypt raised since the
addition of the package in commit
663f39c88c01593855c18355a4decdceeffd884b:

configure:13665: /home/buildroot/autobuild/instance-1/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lgcrypt   >&5
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libgcrypt.a(libgcrypt_la-visibility.o): in function `gcry_err_make_from_errno':
visibility.c:(.text+0x29): undefined reference to `gpg_err_code_from_errno'

Fixes:
 - http://autobuild.buildroot.org/results/5354f7231cf08bf762e7d86fca874ce63d9a116b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ure.ac-use-pkg-config-to-find-gcrypt.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch

diff --git a/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch b/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch
new file mode 100644
index 0000000000..6db6c2ae3b
--- /dev/null
+++ b/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch
@@ -0,0 +1,50 @@
+From 727291789fa1930a3e5aa04a25e954cfa6e615d6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 15 Jan 2022 16:27:44 +0100
+Subject: [PATCH] configure.ac: use pkg-config to find gcrypt
+
+Use pkg-config to find gcrypt and avoid the following static build
+failure:
+
+configure:13642: checking for gcry_md_open in -lgcrypt
+configure:13665: /home/buildroot/autobuild/instance-1/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lgcrypt   >&5
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libgcrypt.a(libgcrypt_la-visibility.o): in function `gcry_err_make_from_errno':
+visibility.c:(.text+0x29): undefined reference to `gpg_err_code_from_errno'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5354f7231cf08bf762e7d86fca874ce63d9a116b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/52]
+---
+ configure.ac | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bcc4156ff..531e10b8d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -405,7 +405,11 @@ fi
+ dnl Checks for libraries.
+ dnl don\'t include lib if LAN not desired
+ if test x"${ac_with_encryption}" = xyes; then
+-  AC_CHECK_LIB([gcrypt], [gcry_md_open], [have_gcrypt=yes], [have_gcrypt=no])
++  PKG_CHECK_MODULES([GCRYPT], [libgcrypt], [have_gcrypt=yes], [
++     AC_CHECK_LIB([gcrypt], [gcry_md_open],
++        [have_gcrypt=yes GCRYPT_LIBS=-lgcrypt],
++        [have_gcrypt=no])
++  ])
+   if test "x${have_gcrypt}" = "xno"; then
+      AC_MSG_ERROR([libgcrypt required to build libfreeipmi])
+      AC_MSG_NOTICE([Note: libgpg-error required for libgcrypt])
+@@ -421,7 +425,6 @@ if test x"${ac_with_encryption}" = xyes; then
+   if test "x${have_gcrypt_threads}" = "xno"; then
+      AC_MSG_ERROR([libgcrypt with threads support required for libfreeipmi])
+   fi
+-  GCRYPT_LIBS=-lgcrypt
+ fi
+ AC_SUBST(GCRYPT_LIBS)
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
