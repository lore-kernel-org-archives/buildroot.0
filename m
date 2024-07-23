Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE32C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0733D40374;
	Tue, 23 Jul 2024 13:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIr-neAr0od1; Tue, 23 Jul 2024 13:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D091D40A9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D091D40A9C;
	Tue, 23 Jul 2024 13:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29C6C1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1698240318
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bnqSZkyjYJM for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAB484030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB484030C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAB484030C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:21:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso39594415e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 06:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721740860; x=1722345660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eCRMiIuRvT1U8yEQsCu4Ddt3YGF+dkL74xG/JLm0AUw=;
 b=LhuMyDKTJgK5pCamMxskRtZ5kyEuog23dgiOrQo3rTmNhgC751Qd/ARqIlVR3dL2Vt
 zCCnmNN8brIHk/QngM+JINiNsQRBjqb+4W7BbIqoNApkjm6W+wBgmvHhWqrGAhBXsOY9
 HbMjLUf5yxEUd6QngPV5cijH7CB0yzfQL+yxXhw1X5GznIZ050EKpM4RFIRyXdW17f+q
 b2v1sIN0pPGAIFXpwzSr6YrTyS93sI1yJoAdXnUAjOx7OsZCYuUAQFIhE0OTlassdiYx
 dpfS+zul0UYmPRxvkoBD6KU1imu6bfjerjO+F2xPXttHNp2CLRNSr54UK30KR7CBFXhl
 0UBQ==
X-Gm-Message-State: AOJu0Yw9fZdIeIkigkaBVHmSkg0B7Tb+XUIcIN7UE/mNdGGUwr1PSyRM
 zZ2e1qPOMpwmgSgA/4Zmq5D6bS3st++3WCwnhIsLVksZuwECrg+kZYm4cg==
X-Google-Smtp-Source: AGHT+IHcsPFJDY3BfOlehICeJ1kza5Wzxy5Xgc3OIEsPvyfrDE0Gq85LcUhW3uZ8HEIDFoeg4o3VLw==
X-Received: by 2002:a05:600c:3ba4:b0:426:5dd0:a1ee with SMTP id
 5b1f17b1804b1-427ecfce9c9mr21523695e9.2.1721740860203; 
 Tue, 23 Jul 2024 06:21:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa09bsm176477735e9.7.2024.07.23.06.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:20:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:20:58 +0200
Message-ID: <20240723132058.629476-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721740860; x=1722345660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eCRMiIuRvT1U8yEQsCu4Ddt3YGF+dkL74xG/JLm0AUw=;
 b=CizKV4I4faVvVjs6cxQrIJClr/uEa2gydQIJDl+FRe6kW95spZ67AWRrDiEsh40RYD
 +vVWXij1tuQN1lNTBvasd0OoADBuWQQpIywLHNWJUV4zr0LFQELRGRrooJKeWL+FazpB
 W+V2+ijMiLAz6v1EGciZ+soGNBAsVIv/QHTRAugNtIKmYAAT4ZLAwpVqKaH7guXjr3Nf
 t2RwBoAoeLVc/s2ppy8psSSluh2KrC8UnKkORpJyzqNyD1bT6GJJvbw2CaAOsCuVwJYo
 zqIGTtdC3RMBRKFAPZ3FUZGiYQhzBXX+4mY3ez8vEyvIDq113QjArCPgMbm5mH71Lktn
 NfLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CizKV4I4
Subject: [Buildroot] [PATCH 1/1] package/pistache: needs NPTL
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

pistache needs NPTL as it unconditionally uses pthread_setname_np since
https://github.com/pistacheio/pistache/commit/b283c32963a7cb0500cf69555d320a6e9e252850
resulting in the following uclibc build failure since commit
82e61bed8208857d5d13c384c89086c4dd4e1e79:

../src/common/reactor.cc: In lambda function:
../src/common/reactor.cc:512:25: error: 'pthread_setname_np' was not declared in this scope; did you mean 'pthread_setcanceltype'?
  512 |                         pthread_setname_np(pthread_self(),
      |                         ^~~~~~~~~~~~~~~~~~
      |                         pthread_setcanceltype

Fixes: 82e61bed8208857d5d13c384c89086c4dd4e1e79
 - http://autobuild.buildroot.org/results/b2b22e4f9684aca0246650673fd8c33019712ddf
 - http://autobuild.buildroot.org/results/1597bfe2a57cd3aef54d331447dd81cae020d434

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pistache/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index ca2d2833cd..e66c24d86d 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PISTACHE
 	bool "pistache"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17, std::optional
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_RAPIDJSON
 	help
@@ -12,8 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		   !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
