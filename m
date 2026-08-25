Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326A8C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 14:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB7880BA3;
	Tue, 25 Aug 2026 14:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBBuMmRpXC3y; Tue, 25 Aug 2026 14:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787668263;
	bh=dU7pyLwNCCSFFwxFe6kI1P0uMQxM3Hi0jWwx9ori1UE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6D/LSLaxfnwf5/wLS7lu2B8BYRek6nC82jLSXeTwE/8iIH4w9xJvlhWXG2wgVI6n
	 54CfMgIkTP4wSYPH7s9m35tkS0C7yYW1s10dbmZ07ZJDS81zBPHk5WTvblafEPXw0y
	 7bXMCFC9C7GHezVyYaUI09B0GLVx/iy6Wb8OYtm0YKzP22Hv4+Yeis7CxJAJVWgE7Y
	 BknKEGxBnU20uwRy0p9M37hF7QLuzKKk0llcol4Sdpui5cU262+tsk4aGaC6rscQ2R
	 SVAft1rm2ueN/XooYxEPUu7lVtozam9u59Jt8oCfCwD9+XYnMsq6CmHn5G3d5w7u8Y
	 n+8OHr4Joqa1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DD980CDB;
	Tue, 25 Aug 2026 14:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0201118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C67B2400F9
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYGg06y8oFyE for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 14:31:00 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=VetZ7rfy
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9533140092
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:30:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so43603325e9.0
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787668256; x=1788273056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=VetZ7rfyz6Kfl5Gv/HIOfuDVUNJPF+t8vlUnlsA6ga3vk6yMUEO1NHcudvglIDKLSA
 VlYUav8TjArtbm3dB+CvNS9h9R7+Uu1OodNfIkdvzbrpbJ5gUXc0W8ebD/4lus0NGZwl
 t2TOryXd6ueO/pGroeFCZfoCQHkZLgXRLVloE0e1motXrJQf3ZdtBEnOwCMZGHAMRsRX
 FWlvr1k0ywkKTfMwIpJ49xxqsz2aLsjfc5ZsRufr+exap9HxxuyMnBJep+x6RjQwdwgO
 Q2c28D7Xc8C/JpCMJGmFLYlkNaW5USuklLdpN+LKeUbEExpNN8IotLXfr3EbwbV/zVkM
 MpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787668256; x=1788273056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=Em7qWzshoEkaUrpAS6tVM9W8caE//p+ZtRJW6N5kljutP3r8Pko/NZPdbNVT/dH7is
 3iA2+wc6DVTP25HnJA8c5CA0ta+iRB2ZTXqqLeRDlSMI8vSSF+dJR27JMoVicS/H6US6
 TRxHva55RQyHTjIQLXX8ILfthD65S/0PAudOilUQF8XOypShZYb7Y6fqu9+kKlNh1Iug
 Fa/t6XGHR4sLlsUXthp8/mIEVOu6k//cTIafrx7jiKyXhRExsqM6XUxgnd8PJtJDkB9A
 A/7LyH3FEh9bDzJ/UQqz0K4WnkBZGwcJcXRvnCLIehbzsEnTqtZkmYNd8l4VrEdAap7Q
 8bAA==
X-Gm-Message-State: AFuF++lJHH7gYd/j25HrhZ5v3ENOjKl+TBFFQWR7vkptwMiAWxvzbyYB
 i1ZJZ2gmrnMLKiCRiKJ1BJG4iV5YjpNu462UnmVil9DZircOlLTdL9h1tAXQtO3kxYASCy8H26u
 4G7wt
X-Gm-Gg: AR+sD122his0iXkFenzAdn68UNtpe0MZ286b/28o2QC/+VONzRS+qJl2HLmRtqa706l
 FF560SxOSYMUoqkL4XTjLI1FePNoaUwLnT9yre4FdKVlYXkjlN/lvdWcKPAO22jstaiwFECBAJ4
 isUlGxNzEmxCIWSygV8fYGtxaPJN/EZy95rRPaoRh+BX6i6wDTOL8A5oSXn97hjtsyNrhbBhjPR
 m2+ym+EyiNAvWzNlR68NUuvbXmEMtFVjUjEJEiZEteoBNrTR4attdlvOv9TlS0fSqvIU72hrHe8
 ADgVV8t7tEKGKo8EpBVv4qYz4IKjTpR7wh7+ASUyL24SFMEJ39ANLmRMY6O9UEkeUgzhrcIeN4k
 a5JawK2oH/chhfLMpwr3eLLZg0+ApDE378t8sGCh42jbPvgGe+PRrYR36JqCxYYFNQ02Citpwnh
 cAH9O5x5zopldME0+RssG5MjHDSFaB2x7Pidv3wut8gGNNH123SfDq9S9884Ru68+AQ8bWHPCmn
 fmTxS9zw1BDkjrYDgaUpiku57ZpVxEJh4AtSTtsjkqFc6YtBGSr2ZceKfmM6E+W
X-Received: by 2002:a05:600c:1914:b0:499:7a19:408b with SMTP id
 5b1f17b1804b1-499c3302280mr279060975e9.11.1787668256059; 
 Tue, 25 Aug 2026 07:30:56 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9bfd2aesm11936196f8f.21.2026.08.25.07.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 07:30:55 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue, 25 Aug 2026 16:30:31 +0200
Message-ID: <20260825143045.3860877-2-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
References: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Avoid double-free on x86-64 systems with no
 cmdline set
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

Upstream: https://github.com/rauc/rauc/pull/2028

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...i-slot-bootname-to-avoid-double-free.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch

diff --git a/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
new file mode 100644
index 0000000000..a062844659
--- /dev/null
+++ b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
@@ -0,0 +1,39 @@
+From 1b17578e90b2929e1a7ed1f3eec8d3b5f663b673 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Fri, 21 Aug 2026 16:37:45 +0200
+Subject: [PATCH] Duplicate efi slot bootname to avoid double free
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 2 +-
+ test/bootchooser.c    | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 19224118..8b0cf820 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -630,7 +630,7 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 	RaucSlot *slot = NULL;
+ 	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+ 		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-			return slot->bootname;
++			return g_strdup(slot->bootname);
+ 		}
+ 	}
+ 
+diff --git a/test/bootchooser.c b/test/bootchooser.c
+index 43c45397..c35a78f1 100644
+--- a/test/bootchooser.c
++++ b/test/bootchooser.c
+@@ -970,6 +970,7 @@ bootname=system1\n";
+ 
+ 	bootname = r_boot_get_current_bootname(r_context()->config, "", &error);
+ 	g_assert_nonnull(bootname);
++	g_clear_pointer(&bootname, g_free);
+ }
+ 
+ /* If the underlying 'efibootmgr --bootorder ...' call fails (e.g. the
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
