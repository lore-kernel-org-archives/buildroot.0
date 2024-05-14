Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A173DC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 17:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB2A4148B;
	Tue, 14 May 2024 17:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxRRtmB_rdtY; Tue, 14 May 2024 17:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9CA4148D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF9CA4148D;
	Tue, 14 May 2024 17:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4666E1BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F3E94148D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvLLR64h25EQ for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 17:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA03E4148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA03E4148B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA03E4148B
 for <buildroot@buildroot.org>; Tue, 14 May 2024 17:20:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so4853801f8f.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707236; x=1716312036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LlaUtatlTfwmxWt0wCpnQ7BgaMvF4fsNtd5ZLL0QRKs=;
 b=F2sMycDwMrf5w7YGAECuEYXFW40lbgC3lQ8Ad6oGWeFmGakqn9i41FPaxZ0LJoF4mb
 AHktmwXJeK1vWC8MZgbWRC16quqHIO1IDtq6wEZZcVqjM+vCqJ0UmF67z3Wmvejfn45x
 NH6i+eS30dX3/k9jeam1xVw54aKrNpWI0wwPLVeC16C5I941gjVRX1IksYNMBYtRu6Tn
 CCKOdUq0c7q5j12fsXxtAaXNdjZeXGKdaDoqUEAIoB9ZUq92XNuPvky27ElLg7Beuksd
 PJNk2pjGcd2jUTG1H5or/tnm0o093qZ05vJo33tEN0PYRkQvsrA7OF8yM2UqvAo7ezQM
 PesQ==
X-Gm-Message-State: AOJu0YxzZdDwA1h45kuThgD4dB0QLVadWYE2M4bTP3VNUEYplSLToM/S
 wFGuO47xbJt5MZ1YBzvpOxEz6gdtieGVSH8gkYhPOaTMQt7G9tDDAPktOA==
X-Google-Smtp-Source: AGHT+IFYMKD1xH7zqtpivdmsUgi+ZV9v49Fm/1oqWNdU5txcfAydTeYI+OoQA90TpwjcaiuwXb+7Bg==
X-Received: by 2002:adf:ebc3:0:b0:346:4d41:8d5a with SMTP id
 ffacd0b85a97d-3504a954e3emr8252706f8f.56.1715707235759; 
 Tue, 14 May 2024 10:20:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896b0bsm14255685f8f.46.2024.05.14.10.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:20:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 19:20:32 +0200
Message-ID: <20240514172032.3581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707236; x=1716312036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LlaUtatlTfwmxWt0wCpnQ7BgaMvF4fsNtd5ZLL0QRKs=;
 b=NkSv5JgDwSaAb7pl2eDxWeoR9BPCOx7e4GVFMgXLd+YNwhS/PcWJpPi6NGd+6hc2iP
 /RzH5AO96iS+L55i5kJm70wQ4j5WPuZOkUyFJV8IgzG/9A3zWu+aLqgBlyEveJT1jTTL
 jMNfJTVGhD/XQjllq7nnawGenkxZA8cqhFzOjlWZuHhQROiH8qYNlOHGTvYipi9cDa5Y
 cYzD+5CQ8selH9LgNxf+nwuNJQySjJDK+IRA2U82qPlpCiiHOznz7yNpWKRqxMV4PM06
 I40qWylRT3g0/rYpTPyStwZJsRBkI6hds+7PRklL6EJs7XDptIGY/MDCN3zNr1EbVRET
 o28A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NkSv5JgD
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.18
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

Add NULL check to cJSON_SetValuestring() (CVE-2024-31755)

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 305dc0d7b8..e07ae0f7bf 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c91d1eeb7175c50d49f6ba2a25e69b46bd05cffb798382c19bfb202e467ec51c  cjson-1.7.17.tar.gz
+sha256  3aa806844a03442c00769b83e99970be70fbef03735ff898f4811dd03b9f5ee5  cjson-1.7.18.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 4719a3dc9b..35304ec618 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.17
+CJSON_VERSION = 1.7.18
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
