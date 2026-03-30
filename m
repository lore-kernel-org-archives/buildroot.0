Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A561061B07
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED0040CD7;
	Mon, 30 Mar 2026 14:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDoRm5AnxaJ9; Mon, 30 Mar 2026 14:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8909640CA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774881977;
	bh=k6uInHpIsyVNOh66SglZ7mslhhy8b2/D0eavScE/mIM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fy/0LFmP6UolEvOLPe4mIXEZ9lh7JYlqz4ddU5amwjdc2VmetuWgl6pN/09nqaZ5o
	 PKSuOrmqlwIH17gTHUu8tCHETWo69znxxz98RKFSkOSyYmI6J1bROoFz7JLle7opOV
	 7Vila+we5qNVR2yBsx5R+rDFcJHlhURNwTUPUPOCBLzqdPEpMXm6ABSbdv3do8x3TG
	 DCy0AY/e7QGaOZVfjbatG+bunDbGTYk3HR541nKL/eOrfE6kzsC9J04O+hFvYrHAJc
	 WT/GFOF6pOMceIC6qRUhr4h6Rkauvp8qzAGmC51tz/Dx1NoBZv5kW96ZHAPRgIA7vo
	 XyGi5Sf2XlB7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8909640CA1;
	Mon, 30 Mar 2026 14:46:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F2733B
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475A740485
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJyiB73d0iPM for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 853EE40484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853EE40484
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 853EE40484
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-8cfc085395fso479395985a.2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 07:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774881972; x=1775486772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0HuqfgcREYsAXvdAwy0OGuyzRMBC/DurNM4IF/JPKYg=;
 b=KGoFF4/X6cKXKOaSsoc1rS8KtJ+4ENvxRxEEXVTo2G6CmNsTmeD8X9zN0yL3301MKV
 bBbOxVO7WvW0dCa38j0yksN0ZcNPDRVcEGFYpsnehf9N1pOta82y8MDTLVUcr18NItRq
 Db1pZESikXJ5cKAIC75/JQtpkZpiljqwdxyL7sIMlI+125q7BNBqkwFbEKCEWTlKqvjE
 LNFj9l9YQVmq+J0pC6VqpdL0pCBPvvZbFSiQNSggw0DqphAjUUwEOJxBbqv52WmOQzCf
 Toz1VIdvJsBIk1FGKADwUnxpJtnj3FPt/Mmu+DiaNkLg50O7b7W8bawCpLKwSRWg07tY
 84Qw==
X-Gm-Message-State: AOJu0YyW6ld271+DNZlrVcy34PcXWkBHutIrMmZD0L1cvUjyNSd9ZDvz
 janxqi2PAiQZDJpNlDmlJD96zp/EEXbaByccOuAfx2sSdyRlJ+8XwpD8LJECGGUO
X-Gm-Gg: ATEYQzxnqte/jIVuO1xUBNE/4D1Dk1JUJmg/aOMLSOZwp5PZn1/rNlsmYQgseYnfHTU
 r01fXEQwaTpl+G+oncLohx7JoigMuWB8DwWbbO/EIg+r1FLfAgybjoX3650sb27MWZ31iKC6aeL
 i/lA+fA2ulNa7zl1PFICaTfwpcJidJ43+SNHXLcVbypj1syMoa+A8k3zKueSQs7H0JwP+04Yj6q
 k19S4VY7Xcwv2984tCpRcIOY/ZHD/ulOp5p7uUlMySUDhnPsUNaDjzqem64F8IyyufX0dbKG07V
 oPHLx07SMC532uTNtp+XPC/8U06TXMQH+X3/lEivGao4mdiIMwtDZ6YK714Enb0TGViT7Ky/iDG
 Wh/RihdNAw7QAMBdmTzBDdfW7/+tKWW2VDLkQUrXt1KDQ/i33EzTZzbxTW9Y6k7trJlPxX6ORPZ
 oB9wOgk7srpnZ2kyFl5VLxow==
X-Received: by 2002:a05:620a:2802:b0:8cf:c08e:5f43 with SMTP id
 af79cd13be357-8d01c8430bbmr1588116385a.63.1774881972261; 
 Mon, 30 Mar 2026 07:46:12 -0700 (PDT)
Received: from adicarlo.nyc ([2603:7000:4000:24ab:21e:4fff:feac:60a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8d0280629e9sm716467085a.32.2026.03.30.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 07:46:09 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id B657EA98244;
 Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id A85628C; Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Mon, 30 Mar 2026 10:45:52 -0400
Message-ID: <20260330144553.2525883-4-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
References: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
 <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774881972; x=1775486772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HuqfgcREYsAXvdAwy0OGuyzRMBC/DurNM4IF/JPKYg=;
 b=oLgIum1RJcWi+5VnQuDAH2EumeFQCvrLTb7tqUC/Ct1MXkIEUO6dS5J6IVziBh+di/
 /N57rJcliK8Oz5kI9VcvHw4zNrVPMxrx3uCyaKd0RiCz8ZQ8/4PrRPpDAR8ShabgNd8T
 YRmxOm2uTmWUVtzeRbTQvaJcJWU53mWqlYUTIh489Rm71V+3zfHO+ipYmUJftgrok0Wu
 glHflUwNPMxVvlRXP4+QwBzTv83/1eKb0pJXHOp5FkaM9Pk6Avod4YxJ9a/GB7UN12tP
 GhyrBXIY+ySuhyv0QiTwDnC0/CDg8dfhHF9QOdvHX84VxpZaNRBaJCHovE0INlb1L7h5
 zySg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oLgIum1R
Subject: [Buildroot] [PATCH v2 3/3] package/gst1-plugins-bad: presence of
 libgudev enables udev support
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

If the buildroot packages libgudev (BR2_PACKAGE_LIBGUDEV) is enabled,
enable udev support in various plugins.  Also bring libgudev into the
build dependencies, so they are there when required.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e488fa3c2d..bd2061a7d5 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -77,7 +77,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dunixfd=disabled \
-	-Dudev=disabled \
 	-Duvcgadget=disabled \
 	-Dvulkan=disabled \
 	-Dx11=disabled \
@@ -111,6 +110,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
 GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=enabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
