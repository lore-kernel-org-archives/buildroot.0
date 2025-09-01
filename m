Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D6DCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2037641593;
	Mon,  1 Sep 2025 09:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Epo63sduNgCK; Mon,  1 Sep 2025 09:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0268D4157E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0268D4157E;
	Mon,  1 Sep 2025 09:01:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F164D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABA3983C44;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Aa2aehEheFT; Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2379483C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2379483C4E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2379483C4E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b883aa3c9so7877455e9.2
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717293; x=1757322093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zmpunf/Ot7IIqyzBjt8DWIlCIQkJjCdHLkSFZ42fRCc=;
 b=KwX/95jmJ0a1+cTXg6sz347QV+lTh37vFiy3NgHPi9VohVS4JZczUTl/QAn7hl0rap
 PcH9BPelU4wqPUphJN2kZaY/jpNLumzoZKJhdMYj+QI5LVdqQJb/wyjaFZlZM6zFUpMP
 7wFUi1r7c5FzF4Pd7vkucy3KTwjpLeM223u0wldsARKBRTa163g4bV1+uBsVcYq6vq50
 ECL79CicvDr7Tnew+sLxjnkY87AIx22uwQg26jEpn58G9N8EEIY5SG8nQtzpyDiuH7ct
 KS1W7maZ4nFcAbVJSh/p3h+1Rdi2TyelhlhFgSSU9jZ37VbPlGM9P4xcvAztx8n73WVD
 OgiA==
X-Gm-Message-State: AOJu0YywRHoXI44bc75OpYgM+E1g4qeasZz7dSUSvSyvZN4aPzvId75B
 63UevqVn7Ld4fh1F9qrrbTbwCGXEwem0uEkKVYRsFCJYM6s8K2MD41Vjx3uL5g==
X-Gm-Gg: ASbGncsYMDhWPighufDMhN5SH68cct3eHkcYYljvmnTC4zTAVtRrUEmgUcbbn6eFsyo
 zro+CAGNBudmSQdbizEXogJJbiSv+ELIwBPoKz1bEqsxQhiGYfwwq8f0pAZ5pxCofz5s2THclew
 fXe1UQAH2o34BebsOmAGmoJVnfQbhuiiE9F9pTrTGtYxGAYakdIyZNqCbA9Mjznp6AgEGNnuK7z
 umZBt4LcgpxksD3h4kMVVoyWQSmO5JmHXeaZTyLBPPQdu5s9xjNfCd7RkaMqihqlp7VDSftjRnO
 gWhz8+94xFs/BbPPEBUmu/xV3Muf3NGlbphAMuTxEvQ4Lpn8isNPAQbA0gK1hvGxkaVlQaTr4Rb
 PVUHW01xOx7jlaLPWRZfyKp8Hm55ccYOZ
X-Google-Smtp-Source: AGHT+IHpxqTfj8CJEfqqB9br2oL/U/NCaVf70rpsyNQVx/jiT8b6qvsnFxiyI26VDXvdY1dB/GLI9g==
X-Received: by 2002:a05:600c:3546:b0:459:dc99:51bf with SMTP id
 5b1f17b1804b1-45b8557b680mr54578495e9.25.1756717292801; 
 Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:18 +0200
Message-ID: <4613a8b256629172e97d45ab26b1fda7e30b7ccb.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717293; x=1757322093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zmpunf/Ot7IIqyzBjt8DWIlCIQkJjCdHLkSFZ42fRCc=;
 b=LqALlwIVJLgucJxNoBmzZIae8Il2iQt45zoNzN/0IviLlbFAN8BjkPpsxw0w4X1XTC
 rtUHraF3Eay7PWQcFvXTzNXcEi3ntqTV4g4ighRsbZsrxVTDXsMHiZK41uVveEDlQzxo
 44Q1bj8GgrcuTyFsPFiB4t7SMY/qmccYznN5RhCMo1/FxoK0eyWDAAARmWE2hE7z8pvC
 lOrIEvPR0pGyVYPJgTTLCCk+XjtTVfeARYxH7pWKZftJK4oUtTRoaKRid+ksmmCffEDx
 Ry2D/4mBDw16bUkmC2SdwtWB4bCgt/A6YfyurGYbYzMj0FQrh36TV28TmoHnVFKufIei
 I1AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LqALlwIV
Subject: [Buildroot] [PATCH 09/18 v3] support/scripts: rename
 check-merged-usr.sh
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to need it to check merged-bin, so the naming would be
misleading as it would no longer be just about merged-usr.

Also drop the extension, it's useless.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                                              | 2 +-
 package/skeleton-custom/skeleton-custom.mk            | 2 +-
 support/scripts/{check-merged-usr.sh => check-merged} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename support/scripts/{check-merged-usr.sh => check-merged} (100%)

diff --git a/Makefile b/Makefile
index a74fcc7324..5a60e71d32 100644
--- a/Makefile
+++ b/Makefile
@@ -783,7 +783,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type overlay \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 endif # merged /usr
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index c194108307..82e1506156 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -27,7 +27,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type skeleton \
 		$(SKELETON_CUSTOM_PATH)
 endef
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged
similarity index 100%
rename from support/scripts/check-merged-usr.sh
rename to support/scripts/check-merged
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
