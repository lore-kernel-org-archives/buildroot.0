Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05E7C5320E
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 10:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FD3440132;
	Sat, 24 Aug 2024 10:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DolYP2SE5_fQ; Sat, 24 Aug 2024 10:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBC12401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBC12401F6;
	Sat, 24 Aug 2024 10:36:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8911BF288
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 10:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D6EA6061C
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 10:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dGpxle1HOJd for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 10:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C47D60619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C47D60619
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C47D60619
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 10:36:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5bf068aebe5so3857326a12.0
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 03:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724495801; x=1725100601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWNRg6t+eLXu/bemjcsoAj7cKLvdNka83lM2gp1Ry20=;
 b=fnQ03R+vsgNvLRwybRU08XcAJy8WKIkZLqFejZTuvbkV9w8eta7C0Mu6vs9Bu9xqHR
 YOEq4FSwuKNokkJ21bLynaY0hyYSrBFaIqJ3XoxsdzUqTRbCr2/a3Dao2Y7CrfQd3ctu
 H3xToUMEdWRGvvMLhRd3tpndVLRNL0MtgdXrASMX6Hp5W5CU+lE5jX978reXk8SJIz/b
 uprKZ8dhKOEda6tPtNBqcO5iB94xAaiFRv/i1Ob9ljImCvydr57CLkWS10SGkjPCVxoq
 S5V1xca71wtMB9p4DuKsE6kglJFa2R9P4dA9zkzaiIXClhDgYA8qIjs2tTnP4KbotGip
 MG3Q==
X-Gm-Message-State: AOJu0YzycxKwHS2DcuXCkU6PmwNJCoikbDQYjfOSuk3LJ72hhZiaSX3T
 dMCOKhH16DJPbAOoKh4gGIhzCBMmz/RFdZYvoboOJgbG9MJAe7ejdc9SFasZUcbFUOOxc9wqmfj
 LX7k=
X-Google-Smtp-Source: AGHT+IGM9wBKJbkGHA9wGwh/sdWlb6P+4H4OqXUeZgEsSbWzOFzG5df9xGup2vEpVsBpGlDoeQtiiQ==
X-Received: by 2002:a17:907:e269:b0:a86:6858:8a8f with SMTP id
 a640c23a62f3a-a86a519cb57mr380520066b.26.1724495800987; 
 Sat, 24 Aug 2024 03:36:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4378e4sm381883866b.109.2024.08.24.03.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 03:36:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 12:36:33 +0200
Message-ID: <20240824103634.1955431-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724495801; x=1725100601;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SWNRg6t+eLXu/bemjcsoAj7cKLvdNka83lM2gp1Ry20=;
 b=JV+fXiRu57HNzr/TH0sf8HX+Os/BUbe5Kv9f1B2in2pKY4S8AayXUht4uTqi1WiYVy
 j4zoC+8857pQmyeac1EMdzSCN/637dxUSzTK7JSdIbcb1JeU+BaiAxUbQ5B7v4RR6X8D
 xNzpbNJInb2qbkF9vXu7YfNUr/bmmfSOFxP6Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JV+fXiRu
Subject: [Buildroot] [PATCH RFC 1/2] package/pkg-download: set
 BR_NO_CHECK_HASH_FOR properly
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The hash check failure highlighted by test [1] reveals that
BR_NO_CHECK_HASH_FOR in package/pkg-download.mk is not correctly set
when the BR2_DOWNLOAD_FORCE_CHECK_HASHES option is enabled. The test
output shows that an attempt is made to perform a hash check on the
enterprise-numbers.txt file even though the ipmitool package has
excluded it from such verification:

...
IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
...

The setting of BR_NO_CHECK_HASH_FOR used by support/download/dl-wrapper
cannot be overridden by BR2_DOWNLOAD_FORCE_CHECK_HASHES because it
represents an exception that is required even when forcing hash checks
on all packages. Applying this patch shows that in the specific test,
the hash check is performed for ipmitool-1_8_19.tar.gz but not for
enterprise-numbers.txt

[1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca01ff67a59e..a41bd9d4c0ad 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -118,7 +118,7 @@ define DOWNLOAD
 	$(Q)$(DOWNLOAD_SET_UMASK) $(EXTRA_ENV) \
 	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
-	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
+	BR_NO_CHECK_HASH_FOR="$(BR_NO_CHECK_HASH_FOR)" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
