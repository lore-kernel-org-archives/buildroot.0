Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B950C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FCE4416C9;
	Mon, 18 Jul 2022 11:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FCE4416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9hO4aKvtRsw; Mon, 18 Jul 2022 11:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF304167E;
	Mon, 18 Jul 2022 11:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF304167E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF9AA1BF32E
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7DF7830C1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 11:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7DF7830C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2XxXhU4Zxot for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 11:06:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 760A081B35
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 760A081B35
 for <buildroot@busybox.net>; Mon, 18 Jul 2022 11:06:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so7090547wmb.5
 for <buildroot@busybox.net>; Mon, 18 Jul 2022 04:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf0cstnQrxJ5uWfkZtrxVZ1KBAlpAq5RvEpkuCTqVLw=;
 b=W7GtigyyXurF/ssBz8vVuPdQlsX7d1RLYXncb4FQyRCFzu6rSw6LgPyAQTdkNNfxAG
 um9RZooW21/ZYcv48fLnthHw90BhITqDRAa4+bO4uFSmIiQGJv9JqQdr04hb/qXQA2Ug
 Td7B4p3GXA2zWK7ZFqdAVzLFiQd5sahTPGA1ucFjZSfd3ie0ARPp6EgsyeoC/H9o66kj
 ElkaehPlou+1APEoBjlnp5FrfhHjaKVounmuH/xrZxX6jXwLQYlOA5dGssxrUdbn2kAS
 Jts/ko4xpSFy9cNtmzsumLc2FQrClFouCuyqXXTKNNKDTxlPiI7lyw0eXKnaxPgEKGS+
 zgVg==
X-Gm-Message-State: AJIora8wQYn/1t5hcg0ZD6+P4fSAyjqnrl2rje7HRpzspPUVRTEsw7MC
 tfNwaaUtGB347WGQr9AN/5MZyLhajBk=
X-Google-Smtp-Source: AGRyM1vDH8Ayqd/ZWIU8+WADCIeQT/KO8RZTq3er2Ln1JTyCK6gnyu+E/T8KKPHbu3PWF+ta9yBfmA==
X-Received: by 2002:a05:600c:1e8f:b0:3a3:1cfc:ba6 with SMTP id
 be15-20020a05600c1e8f00b003a31cfc0ba6mr2540155wmb.177.1658142361575; 
 Mon, 18 Jul 2022 04:06:01 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm20939189wmc.45.2022.07.18.04.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 04:06:01 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 18 Jul 2022 13:05:55 +0200
Message-Id: <20220718110555.3244059-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf0cstnQrxJ5uWfkZtrxVZ1KBAlpAq5RvEpkuCTqVLw=;
 b=Ut3aoMwIDmbnrJhSo+McRaAvTEcCJayo1BmUCgCpYC7jLPWZjgvXWCNcTA8MSvYALp
 myc7ensgbi4iXihCAAPT7CmrEaWDpLAIGnPOs/9E3N7R48nM8gTCfrEW/JnZ8RYs4C0x
 SWDzaHFwrCgVIoQZZfSCBhFgBlu3TjIDbu0VNZsqdtpkqd/6CL/O3a12AScX4JkAtrbE
 vTKOc8aJGNQU7DG5h5aOlYPx6BuVXbQ+dP+aVjO3+8IUl4YVgA7OxQTfD75KiEd9DjSu
 rGau0/S4vvIp9eK0wFsHPQVEoKD4mZK1v5KhYikExDqiG5vSG4W/EzIq8bkR95gIWW6V
 p2aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ut3aoMwI
Subject: [Buildroot] [PATCH] package/luaossl: bump to version 20220711
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index c8fa7942e..18527d99a 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ea6d624e557939e30b93355dd1dc11465e81aa38a5542ab3c04b48608ac3cd78  luaossl-20200709-0.src.rock
-sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20200709/LICENSE
+sha256 d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
+sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index d241bce85..a6283a520 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20200709
+LUAOSSL_VERSION_UPSTREAM = 20220711
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
