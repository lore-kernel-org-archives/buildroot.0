Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D7C4452B
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B9A80CE9;
	Mon, 20 Jul 2026 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4QbsPZVzGK8; Mon, 20 Jul 2026 15:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4987080CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559778;
	bh=u2R4YdfGZjd1XDzC2HZ2ZO2U6oXf4YPPkKstqRolLqU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p3GTZsmT0UCRi7v86BWdIIhOHn30zMxh+6hK+IonEUjip99AzDtJdjUX6LzoIOTdH
	 4XDJZD2lfSRHtt4HyEfp1c3RQOmA4mJHcdh2zFrf1N8XA6TTL8gEU/tyOr+lBHShuH
	 t1pAMErdm3rUA5U/uYlbKzoPXbjLSa1jgcRaSHZBCG080rbOLCJQF1MKxE7YcNc7HQ
	 3Z/JDipgKgb3HTvDD6d8k1gl2Zn8mIrcQLcWxz2pV6XaVqVFiHpQ4IBNDxv0goX1/O
	 OJQSDrAd4+qQYyagSzEJRNN0q4n9PCKf/MCAjGWOskJaZz55M8IV49gpyuH+F/dJgT
	 5ZfX/siAD/2cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4987080CDC;
	Mon, 20 Jul 2026 15:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B7D1F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151EB80CD9
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkfIA5bwTcV2 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1F9A80CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F9A80CEC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1F9A80CEC
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so6418803f8f.1
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559770; x=1785164570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ACV0SRfTkQCkX7DmCl+eGDWRRwuwepZzG8DCPUT2VQQ=;
 b=HCDz2XaGbGUHnQ5Wq/MsWicWPjr8hyQnKqzRwjAHVt/pZAsy5Lkr/hpTGFtjXo3iAI
 sA07lk7W6TVVPK3u5G6n4ko4j2j0Jc+g7CZvZZ8SkCOitdIlBaGk022a3oHz6h9/wP/v
 l666tsUs7KPORA1rgNcjOaw1cJOqlb6N88X/oTR5U3WUzdXCWRK6M8I02zU+ge1UeW/O
 lBsHWUlrYwBm9xPhD5O+CES4zW7Ttc/2mDL7YlMLCBG2oQw4TdH5lrAExNKPdkdeqJR4
 wPSfQZ5AmOu8yO2zj4i7LU/1O6b7Yf+D0Zu1wToYNIOXJaYXrDxBXiJAPCa5LOWi9vXc
 u0mg==
X-Gm-Message-State: AOJu0YzAXfXNE7zFyeewOoN19uV4FiXIBpi2kFwCBGAhcE/OndjwEf6m
 sldQvxt8fsyYj8LOUfuqABjEdKKf/FKBIHTAG2kdeGXMc/YQBRyVuXa1GwISBQ==
X-Gm-Gg: AR+sD13HLrA73ULJO8+gdnHP+hP+YbjcEGijaNr6VEMex0e2RwbTg3BLOaQhguvYzwJ
 FOK38bsLP5Fx64l1/+T9v7NvAPbB3r/6DVLwT9J8Amj8n9wxcIBnJCny+x3pqJvEXVztWV5fuo6
 UBSNZnIWW8Zlel6r9zf4dGHjFzDmK8QDrT8Kk4uZJcQYn7pxfmFa1APV8kaKI4Gqc7/0Wi+5KSn
 3kB0tb874k7ssNH1dn73tZwNkNgeDRqI9OHzxVpWakCMVPUyOpszpW2/7utuFEj6R4bAMbFX8+G
 hl2SGD7ckG/ALGVBe/+I4gWoh+uFjuZqU/Wj5CtVo8YP5QZqA8fl/6HfnyXCdYwW/A2KK51y5yh
 vXkvX5T1PaBIIaS3EQKLJcMRGYw4YOgZT765XRU3IIVCIQILTmluAwmy/NlP9QL5N16qFOg00q9
 w48BgWqQM7UL/DZHIEYkptiJ/nPUy6CRvx6tR3vBk=
X-Received: by 2002:a05:6000:46cd:b0:47f:7129:e30 with SMTP id
 ffacd0b85a97d-47f71290ea5mr5796910f8f.11.1784559769445; 
 Mon, 20 Jul 2026 08:02:49 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:48 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:34 +0200
Message-ID: <20260720150236.243961-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559770; x=1785164570; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ACV0SRfTkQCkX7DmCl+eGDWRRwuwepZzG8DCPUT2VQQ=;
 b=cQ1n4glJYHH2ACZNt7SOTeI8EIcNpoSRX00ScDy9D6ZZ8IzBB5aBsid7Nrsjavg+4v
 8IoyLyQR2bM51hTzKNWIlceGQDdZIkvGw3CGBTOKNwPpYhYAYJRtUBrJ+60hugYE0bmw
 5VNSNeYpazLr47j25w/ghnOOtQjxVB4N/IQueffER39Tj2Hvuaq1sCICODAIPZp1BV/i
 A/WYkDyP80WYDDQNvrHTwhC31COnd0mNUa5KV5tIsFAEcnUinnNkkmA6UU5imA5TDfw2
 mAK/EHCIrZc8/XpXcMVmlwI/kgwEnZ5zQYmEdY3Nljg+mRNQyCtsKEdO/G7rdyFy8xuI
 spJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cQ1n4glJ
Subject: [Buildroot] [PATCH v2 7/8] package/hare-xml: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/hare-xml/Config.in     |  8 ++++++++
 package/hare-xml/hare-xml.hash |  3 +++
 package/hare-xml/hare-xml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 5cdf0c13d..1d0dac96c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1883,6 +1883,7 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
+	source "package/hare-xml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/hare-xml/Config.in b/package/hare-xml/Config.in
new file mode 100644
index 000000000..469a9907a
--- /dev/null
+++ b/package/hare-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_XML
+	bool "hare-xml"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides XML support for Hare.
+
+	  https://git.sr.ht/~sircmpwn/hare-xml
diff --git a/package/hare-xml/hare-xml.hash b/package/hare-xml/hare-xml.hash
new file mode 100644
index 000000000..25c1f3c1d
--- /dev/null
+++ b/package/hare-xml/hare-xml.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56703cc20f70878a02f37967385e9af3659733b31c91c5f34cf819d235a20a28  hare-xml-0.25.2.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-xml/hare-xml.mk b/package/hare-xml/hare-xml.mk
new file mode 100644
index 000000000..be30fd934
--- /dev/null
+++ b/package/hare-xml/hare-xml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-xml
+#
+################################################################################
+
+HARE_XML_VERSION = 0.25.2.0
+HARE_XML_SITE_METHOD = git
+HARE_XML_SITE = https://git.sr.ht/~sircmpwn/hare-xml
+HARE_XML_LICENSE = MPL-2.0
+HARE_XML_LICENSE_FILES = COPYING
+HARE_XML_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
