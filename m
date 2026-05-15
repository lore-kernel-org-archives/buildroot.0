Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F71CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8312361547;
	Fri, 15 May 2026 13:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJk9QJDCCetK; Fri, 15 May 2026 13:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7960161544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778850354;
	bh=nDJYVHUd//+oSbHspiU5nfDgetfHVVXQ9WPsPnbEIMQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fUanO3hSLUxK/eUYf916wMZnYsHy9RKT2RxRCFtmqjjzPu7oh+qdDbNJxr5wAJsSj
	 Ovqk5c08S+07069NgIFFcZCbRpbxoq+2Mfv7CViKJqZIOVPvcj4IqFvnJ2ywvQ6Q7q
	 RGyEYI5selHfFHFosmZNwq4sT7fbpMm5jI9boc0EpRUTrxPrdF6niSsJ1D7fi2fj9u
	 tpaVp76Vqx6dACQ63kWm+wSagC5l4CyvdNoqZjMsX7N1Wy4Dm3/vYuvWuyfSsX13SK
	 Am3+vI7R5WIZ9JyMW2UiYecQQt41R0NGCBs46lZgGxrSjFhrWj35j2XhEJSm2TtBnF
	 3cw36paAz3eKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7960161544;
	Fri, 15 May 2026 13:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5F7D36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C034C40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSr04PtO-K_i for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10DEA40E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10DEA40E23
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10DEA40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:05:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-44b052142e1so5128287f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778850349; x=1779455149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erPQfEHN/6L5I2EZ6WUaO1HjT06W/P8uPxP8sSbFSjU=;
 b=l4baBgSp4mCrFqKLs9YWTi5uksq5Mn1rGWU9OlvkP8sbmYzmeZhIQOGPCX7DrzHhRO
 RAYhtIub/Ue7IY9xUjm+cSB8bCRYTnCxVk0JjFP2gG8FZZ1NnSPoZmQGDGeeqk0h0XiE
 6flYvcUybAcjtSNHYKoKBQTnC6AHm8PoA/lYEKir+vuEt9HTkvActvQN50QLUk+CvAsp
 B9DCXxL18VRUnXWhUCmmNEgwTc9VuOEDXMKxEiyJplk1qrJshQVYDZrgpDCMHOuCLT7O
 d10ES4d+VPQUgb2/f0wK4ydZtIeJ8gr9+gvfI6Pu8JQswiEmRGukGBinFdt8pCYrHBNE
 GOtg==
X-Gm-Message-State: AOJu0YxzNWgX3Qjy0pvUxHjeV9InPJVgRflLGwAX4tBNQY4n80IQPO7B
 SewdELF5whW5taicQZTLQLeo8pVLkbnBBHdhBrzEM9pkzoaZUIAuvRT114zG
X-Gm-Gg: Acq92OHxCbxpF/Z4OO+s5GkMcJKDRIgLb0hQDoghGxG/Qupvx4qwjp4Hf+kIGlhvx+S
 TrSW2mxeBre+pRpgy1eElSeB38fHuQoE8C4R9l+AV1bfGUXPHQVdBMxqiWBxz9k1EZIJ9ojnV4f
 cAWpWNJAfNnr2B+G1ItcPhuh6KFIGok/Vty8bENhNS8Emfp1vBuLB375jBaAhanHbqTsg9ME6lL
 T84zZQ2syc4keKpBIdk1tVj7D50GLW4Py/XJP2JZ5UNDot1fBJIO0PXOejCNEnE3nraPgpIrvjJ
 2EtS+uoPQu8RtQGmwgqwwGD7rJ0R0Hn3VhGiLutWxfNZqF5Epg+jk67ra6rTOD+Al3HE8zKfggn
 mNfThvIxCg2aJsBbT4P9CFUphwrwxEZ7G1YXeDvkNlmSkfgYi2Z1ODzdIkmH3vPgnz0dLxdAfw2
 i3PYceVvV5Kqax6aUBJRxknFBJvKn/h25PQxAN6Q==
X-Received: by 2002:a05:6000:290e:b0:43d:7b90:fa23 with SMTP id
 ffacd0b85a97d-45e5c6019bdmr5308718f8f.29.1778850347947; 
 Fri, 15 May 2026 06:05:47 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a178adsm15880087f8f.18.2026.05.15.06.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:05:47 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Fri, 15 May 2026 15:05:30 +0200
Message-ID: <20260515130543.60511-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778850349; x=1779455149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=erPQfEHN/6L5I2EZ6WUaO1HjT06W/P8uPxP8sSbFSjU=;
 b=H184+UE7R6k7Y1d4gUIjG/3vwCoh9xKeMnynxsWDBDczZ7SU1+4HWmhFtfH+5Rm/jS
 tgG9eFco0lAVL+Twnz3S+KWUEiY4jwSJzAg3MdsCcMZkvgozz2AnfAnzrizxYoymNQlz
 /vo+c4zYiKDVwGTHQs+XhH/5zLramRpcMz6WANVlV6+O5pXOAgUFyPJfV6AdF6o1d94z
 91WtHbwjjtmnpsKLi8MIJDWLVu2y+lay7D/igIvQG/66YfEdWvrYwd4NjceTEcDwrk83
 zw6nMcYED0bfK0EFU7H52AnkdLV8w7BKt5kM2x7ByX4TjU/oM2pdnaXqTXxBI6o+zNHt
 zV7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H184+UE7
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.44.3
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

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 635f5ff79a..014587cf3c 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  69a6209cb26ecba6cb9fa28d10abad328d82adaa7e79b2eb6c750e08a4500021  zellij-0.44.2-cargo5.tar.gz
+sha256  73ce7518650496ed6620ded55617991ee170d5cf75f06f23b622bc57b525498f  zellij-0.44.3-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index f1828cba78..4b4e7d6a3f 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.2
+ZELLIJ_VERSION = 0.44.3
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
