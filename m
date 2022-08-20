Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C2C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 12:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285A04188B;
	Sat, 20 Aug 2022 12:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285A04188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95FjbMR43CPe; Sat, 20 Aug 2022 12:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D6C41748;
	Sat, 20 Aug 2022 12:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D6C41748
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D97E01BF2B0
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C50404FE
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C50404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btMOy6itzcUd for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 12:11:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF514015A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF514015A
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 12:11:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id h1so3372896wmd.3
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 05:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=TOzvjDxnYtQgLv1+Oid+t7winuExat2fQ73biDcz28w=;
 b=yh6KMOQVgoNVw1ZzOQwEAdrQ91pew9G0EqZ3Q/61zgavMms0PkSeuo55jZAiNcQBPz
 7XHyXv+FCSkuaLZCZjrGywNKQiX9cs3KduSsJoz7Ey9qjdgdFvIzdSha7Meus/RekSNU
 J0TMfwYlGYLFhLOl0831SIa76EQ4UIguzJcCPJ98OV63F5p6+005BwRdiuUIktMUVuD/
 J4bQD3nb+87NaQqSGAomX0zMndpZ3JdPa9sxa+oPeOF/x0sVUkpy4YtVI65Nndk7ESSt
 ThkKj20iDtbPBYt/x3Pl5d49ncMlTs+CKLbg8Gtt0CrFcdS4BxKISKjRyCo/nfpC8inz
 5IGQ==
X-Gm-Message-State: ACgBeo33Ka5Kzr0AD659Bp7WDpmUl+YbgQqIb5h2v4iAwBfkl47cd9f6
 /BrL885FPobeRMeRW/PtATiVQSiHYwk=
X-Google-Smtp-Source: AA6agR4KxXS0SWanRYG6YAwDACGvZJlMHfacBwDcV8cNb/mTztZNxLW9LoBSSvICd4O7vIfsPeBSeA==
X-Received: by 2002:a05:600c:1d89:b0:3a5:c1db:21c6 with SMTP id
 p9-20020a05600c1d8900b003a5c1db21c6mr6841727wms.174.1660997500054; 
 Sat, 20 Aug 2022 05:11:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003a5bd9448e5sm8063773wmm.28.2022.08.20.05.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 05:11:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 14:11:36 +0200
Message-Id: <20220820121136.138738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=TOzvjDxnYtQgLv1+Oid+t7winuExat2fQ73biDcz28w=;
 b=mULM6sQYU5YP7I2sv34k6z/IukvKyVKwFe/2jukPIRR2L0eke2iyt5Lm++N5dBooGT
 Qi2uhzX3NhC/zDOdibTKMh+rhIU9A4vYfomyImqOr5yf4QHY+zJQsvHMFTrG9ACmPLkx
 Q5WQ53vYigaNNwAC9vQlSrHJ++EbZjOrxJt+9fkGyQZBPacVXsBXHkSdNUFf7h7Tiu2B
 RroRtgz7tMK5ysE/FON0cW6ps6eCN/iYRWRjxQN4EaCVyN3+b/hZAG2rgtwuPUInkD3P
 ZDfkrIkSnExr4V9vkxOpC/cxmR1284RSffc4S2B9M16yc02fU6xFVzJbSq6MFsNQAE6t
 IK9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mULM6sQY
Subject: [Buildroot] [PATCH 1/1] package/usbguard: needs gcc >= 8
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e and
https://github.com/USBGuard/usbguard/commit/4b4551023e3298a3639d2c52c559556dbe8d2d54:

checking whether we need to link to -lstdc++fs for PEGTL explicitly... ERROR
configure: error: Link test failed both with and without -lstdc++fs; something is broken, please check file config.log for details.

Fixes:
 - http://autobuild.buildroot.org/results/511c47802ce171caeeb9919371c58e6ad2d11a78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 4c3dc7f2c2..59f8ddd305 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
@@ -18,9 +18,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
