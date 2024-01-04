Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E06C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B54461AB1;
	Thu,  4 Jan 2024 21:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B54461AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QczRTseRmgmN; Thu,  4 Jan 2024 21:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66640615D9;
	Thu,  4 Jan 2024 21:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66640615D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5BD41BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EF6340267
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF6340267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YXG65ATMBKS for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:42:51 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 906BA401C6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906BA401C6
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d76fefd6bso8474945e9.2
 for <buildroot@buildroot.org>; Thu, 04 Jan 2024 13:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704404569; x=1705009369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0D2gW8kbgix+mlFd3ERjpwTUFSXOzo1N6kAT0lVbZs0=;
 b=eOUBf5GaPFBFmedTq8S6RORRT3a/5QP0ZHIsLoP3dfS+4CrGDheTg1wj86oONSgivt
 R7Sgn7HwbxTytzNZERcBEd82vYBkEoTR4eJbX5laGv0hOgg125R9hSIV7BJ4Wvnd/+8S
 c4BbCe7KwhioJLteSOwntFj2R+GYbIKHXSJCATlXhbnUqBLLnHzhH3UTXhNkKmKpZZcu
 65mOmWDJLFyzJhTV1SeVvGvcSEqwIAyiguGXEIyvGOa0p6SaWt9kv5Qgk5Hq82qXxEfF
 DmO4BSVd/wI020kvyc8jK/jEseWVMfHVjmxU1gg0OZ1/MqRqNQk1IG6EnTLnQ2RsNHEm
 pYig==
X-Gm-Message-State: AOJu0YyGGIYrQAcp5kLfsGvoH1ob1zVWEC4AbmJzTkix/Jqdv7USbq+i
 Q7o/uTqf96UdhzF6BlIDIw/T3qhu1gU=
X-Google-Smtp-Source: AGHT+IHwIG45e2T58M74zIV/tpRiKoEtWVVOqSNsv2ubUnsvZNBBjkDDc/lmQeiZetKsO/NOXyiKpA==
X-Received: by 2002:a05:600c:21d5:b0:40d:7505:917b with SMTP id
 x21-20020a05600c21d500b0040d7505917bmr360890wmj.34.1704404568796; 
 Thu, 04 Jan 2024 13:42:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b0040c11fbe581sm425867wmq.27.2024.01.04.13.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 13:42:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 22:42:45 +0100
Message-ID: <20240104214245.611797-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704404569; x=1705009369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0D2gW8kbgix+mlFd3ERjpwTUFSXOzo1N6kAT0lVbZs0=;
 b=le+Ju9FcpUGEGAszTkKcBugVuJJTpiRlczWa8bMrZVYHPNu7JVi0SPp18AfNhSZUyC
 Nu4pZNu1MR3B4Uvkqg9TIdxGDJK4c/uBfeYXhCX0IEvzvjkvtD7UCkUH4hvaIguySqsU
 QhycYN+x0xA9DfilP5p9RQg4EW1lsiObsvl1Gjv/hRlvkZhkKbOzkAlcBWU2if8Jb47o
 MlLj54FICQKZ47wrxadOG+5U8nP2sQfG1KNzSICf38RofIWYOZTVno3HGFNsBwsvcsVY
 awg35s1gKfnha8C/x4g3wonjTX5AHT/W2uorpGdKvbfIM+RHV7jICyWTjXhNIMBJIi2u
 DlJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=le+Ju9Fc
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.1.7
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
Cc: Julien Viard de Galbert <julien@vdg.name>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OpenVPN/easy-rsa/blob/v3.1.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easy-rsa/easy-rsa.hash | 2 +-
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index 5be651bde0..de19d8b693 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,5 +1,5 @@
 # Locally computed: (after verifying gpg sig)
-sha512  8c8d1f4baf90475d4cce334d116b7f12b82687157796b25560600b5098769226ae2f60f02982c75266b625d66b465360ffa815260ad44850923e3fbc9ba8540a  EasyRSA-3.1.1.tgz
+sha512  eb3978b07c313af148c6ae94b60e213c8b810c5974242855560b22ad949cfc094d311e4cc04a95ddd0f817bfec54971caa5289e5fc532895e1e58499d265c705  EasyRSA-3.1.7.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 4ea45506dd..7266943f5b 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.1.1
+EASY_RSA_VERSION = 3.1.7
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
