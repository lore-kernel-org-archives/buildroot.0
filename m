Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C9AE9D404
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D757360F4D;
	Wed,  4 Feb 2026 15:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeZSNIiU1nRU; Wed,  4 Feb 2026 15:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D53A260F5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219860;
	bh=EqA9lfNPoSPDQHmq+ioqVgYYNenVrDtaXl9XKWWp02M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=T7PsPenRNV3m4gCqKWQyrmdzn62/p9Q46AcPWQmQqfNxnfJq7YVD1TxQeyGzUIXKn
	 B6+vnNLYvFUzjduUrS8ig48oEFQQ9GmdSXToE0oBTLIoU0sbRC2ywE+mc/gbBFoqKT
	 WMAaoWGGtfW2Pf/J7Whfjo8XtsJr3tkdSvyAYhKoXeose9K4fpGgwLZHCSsTwPHomS
	 r4LgIe0ASTuBLWrweNEZAe/KosGCeB6+5ZHv0QdVBRtnE7CRGfFp8zwGNOo65NNIUg
	 u+v/1T80HSVC8I/iHDIV1moQn8My1SPHUF8Jq2sVc96KtP5Rix1grkpk3zOR0wv0J+
	 UgpPpov9plTlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D53A260F5E;
	Wed,  4 Feb 2026 15:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEA8317A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7B4840C61
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSp6NW6OgSvV for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F220240C23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F220240C23
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F220240C23
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-482f2599980so42552225e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219847; x=1770824647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wrFoOBSMXz9OEi9aD2qAGE22Wf+m72wMrhCMi5nmVjk=;
 b=ahQRKMqg6+esiRcHq95PbmD83GsE1BCftaQqpc/Zv9yz61+tzpKu5MU71VJCLj96/J
 vd1rG52490+lFWdMvcgmPf5GFYw1E4/rZim+kY+NKEVNaDEHCSkcbSwhxmTICvovsGpu
 givlZWyVToo9/xLVeXy2m7NiqtmNJkEJxw996SrWBVBP7fv4YzBgt6S9SstfpttiELWr
 YDW9L+r8U3AmiPsko4tmnE/VTsft5ENB0fJLf+wtLSl5h/Il5IYPJ24iNsdZ2xWybml1
 C78UwgztpWDWjAhql0VbCljjScroJSfer0ZqEB/uy89zdX/Ia0p8RsU2ANgynhI4pdyq
 oZ4Q==
X-Gm-Message-State: AOJu0YwF+CrG8RGfzBx5Rs3HH6AVfUIwMFqov/NH610Gv6z6snkfyfzq
 hoBSitmlqR2gSpHijBzU4wZaCWwaMn3vJTGaZEQsE7v13ukPVJDYQJ0Nqk7rIUiVxum4a7Ym8yH
 Xq9FvsGluvA==
X-Gm-Gg: AZuq6aIjGJHpiJ3ESktpJ+4chwjqaFIQEMjdXz1aEr/FLuW60WD5OmNqyiRQ5gAGYeM
 XquWvYfr44vsIuNB8kucRwJvjAog2D4+65GPEjcSQif0nK+YiiZjvXtKHuysESacicLPD7XobEb
 n77vbPKIl7ksA9l5uNqLqTE2b3Q+o7ZhDVJG9t+wxIGeuB/bfID2JQd974yNkOye/s5wIlf69Sp
 1dwtF5DFxkpDIhLjFa3U3ObVnefwNCSBltO8Slk1JzNJEhltg0NWF63ypseG0fiY+LpVBHeg19q
 T8q2GALH2o8x0TLeRs9BRxkDaPR1zmHrhYJy8sD5b8VZsnG4j7qCGQt/D3iFQcwH6DNfWp4lVat
 tuY/W55Q17ToyrNyYkAFpRPTLEdgk3RBskOSnpjHcb7QDkvJqcJBHlnOw8IJIJRB8SInisu7CNX
 xKDps4W/9nAeahp+GSydwPWN7d5LmDkcc5eDQ9WMJ4+KaBu77z
X-Received: by 2002:a05:600c:1d0a:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-4830e99b3ffmr46037345e9.27.1770219846873; 
 Wed, 04 Feb 2026 07:44:06 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:33 +0100
Message-ID: <20260204154340.766528-7-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219847; x=1770824647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrFoOBSMXz9OEi9aD2qAGE22Wf+m72wMrhCMi5nmVjk=;
 b=iTkYnaJ0i0/MszpCYzijAuRs9NraSthazDd+pu+W9CmiTLNJdpIgYuEr+cu/afeVSl
 oNG9vqmNKrZlIYGeAiW2RYLWJoU7yBargJqT5bjrGaA+0LoRxw62S8vuVNjtHGX+QRlN
 +NKppBihGB4rR3RqtJdRotw/UQicY5bOyzOeFpByT8DIV8ZTWNDNjAhmrNcU7hh41YxV
 rYp4A5Mr8K5XiW/b+wIL7+azKtdwsQD3e7/v3tdf9NUX5FNVOU2ubuC9uaq0eczCC6pe
 XiPBJz0Etg1v/UXd5Hwp5S4I74P8el5kcGev8z8kWFEwuhqDRDLc7om5XP3APauKhfYX
 Q69g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iTkYnaJ0
Subject: [Buildroot] [PATCH v3 6/7] docs: update the Buildroot manual for
 kconfig variables expansion
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the update of kconfig, $VARIABLES are no longer expanded.
Update the Buildoot user manual accordingly.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/customize-outside-br.adoc | 12 ++++++------
 docs/manual/migrating.adoc            |  7 +++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 78065489d4..7e9dcd0cc4 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -153,8 +153,8 @@ The main usage of this is to store package recipes. The recommended way
 to do this is to write a +Config.in+ file that looks like:
 
 ----
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package1/Config.in"
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package2/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package1/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package2/Config.in"
 ----
 
 Then, have an +external.mk+ file that looks like:
@@ -243,10 +243,10 @@ illustration, of course):
   |     `----
   |
   |- Config.in
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/toolchain/toolchain-external-mine/Config.in.options"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-1/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-2/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/my-jpeg/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/toolchain/toolchain-external-mine/Config.in.options"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-1/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-2/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/my-jpeg/Config.in"
   |     |
   |     |config BAR_42_FLASH_ADDR
   |     |    hex "my-board flash address"
diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index d8d86d8945..fe3d34d740 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -247,3 +247,10 @@ In 2026.02, the network-manager package stopped selecting the gnutls package as
 a cryptography backend automatically. Manually enable the gnutls or libnss
 package if you require features that depend on a cryptography backend, such as
 certificate-based authentication.
+
+Following the update of the bundled kconfig programs suite, variable names
+in `source` statements must now be enclosed in parentheses. For example,
+`source "$BR2_EXTERNAL_FOO_PATH/bar"` should now be rewritten as
+`source "$(BR2_EXTERNAL_FOO_PATH)/bar"`.
+This is affecting **all buildroot externals**, which must therefore be
+updated accordingly to support Buildroot 2026.02 and upper
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
