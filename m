Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CBDC32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D4A6107E;
	Wed, 21 Sep 2022 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D4A6107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3jeaet_DxR2; Wed, 21 Sep 2022 21:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B32760AC3;
	Wed, 21 Sep 2022 21:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B32760AC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD31E1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 981FD40484
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981FD40484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7SFr4_2nEEF for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7CE400D2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E7CE400D2
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:01:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t14so12125894wrx.8
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pFrDkRRhNP6wrihdOJYtKfvSVEGSFW5xA4XkcLfJH4U=;
 b=Dm72vtMoXxe/VIqc0UTEHGrPAhbe4EoCXhA7IdCgM+OwDEGGGbAKhF3xhUz1iJrabF
 hnBeTxg0Kro3KbfBE5Zp1jUon8m40dot6S5u8u53Hk66HinOuae7KFwH65SZQgyHB4zn
 UwouW7S+gbdCk0/1MOY1GLiTqi4v8Igow2ufxZBGlDOUaQydZjP89xFMa/42Mf5Vbdfc
 QKGt7hE1TkY7l0C1jJOqqj9/nd0ffGiVt977bg5TEgS77PHzPEDxMkfPYk9FrMTcGarA
 2UGfyoWzZxbYs8rptjeG3lxjMqxn7d7eDI6dOnXzV6wAJoYRmN4xuFUADR+0GPTDi74x
 oxCA==
X-Gm-Message-State: ACrzQf1FBO8S+5/dTyDZiXnDZlKQYan0OvMpMl1iXj2Vz00WhOc0mRLc
 ZwbSH0viXnw1Oa551ZM7FyIy5zDw28k=
X-Google-Smtp-Source: AMsMyM5hcoQFWZBpnuHqPL10ua8qKquh/5Ayw9dF5jnEKbQln3UuUKw4cPWNB1yYMgnm3ymeDef7ug==
X-Received: by 2002:adf:f8ca:0:b0:226:e456:1896 with SMTP id
 f10-20020adff8ca000000b00226e4561896mr30347wrq.177.1663794085882; 
 Wed, 21 Sep 2022 14:01:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003b491f99a25sm5004291wmq.22.2022.09.21.14.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:01:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:01:19 +0200
Message-Id: <20220921210119.12451-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pFrDkRRhNP6wrihdOJYtKfvSVEGSFW5xA4XkcLfJH4U=;
 b=px4ceJLkB+DOF3RavbOvhWsIH7Fk+ftsNuIDVyRQ51oticqVlt8coaj1aII8LcS0Qz
 MCd/s6o8HAiSsZ2CKDTrk5gO0KUN8yXUWe8Ixg+i7qPZcb4haoTVt/HjIkWCOTm2RcRY
 Ez8lCL0nF+WhDNNT7pfE+IdPBeeKFFFLubFHCxgJGhkPiiNvLRnjWpvW8TUSD/i1GHyJ
 0f5ruYf+IYDMdjtdViwRGEEEjEWr/HNqd8o81TyX/zgwW9a56ULNMLSjR7relTM1iMJ2
 wgLyXcPtEN7gJrSbQICnqg00p2bLrlZ1veN/sKLwoBf+DFKNrRDxtTRRBNHr4Rfp6KSz
 3E9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=px4ceJLk
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file (year updated with
https://github.com/libffi/libffi/commit/41d0851fc545ff1ffd8377236d193268c8a10740)

https://github.com/libffi/libffi/releases/tag/v3.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libffi/libffi.hash | 4 ++--
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index cf1977c40d..689b5da4f1 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620  libffi-3.4.2.tar.gz
+sha256  4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8  libffi-3.4.3.tar.gz
 # License files, locally calculated
-sha256  a61d06e8f7be57928e71e800eb9273b05cb8868c484108afe41e4305bb320dde  LICENSE
+sha256  2c9c2acb9743e6b007b91350475308aee44691d96aa20eacef8e199988c8c388  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 093256a629..ecfa120c7a 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.2
+LIBFFI_VERSION = 3.4.3
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
