Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2987EC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48E080DCE;
	Sun, 16 Aug 2026 19:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4mSQOKgiUvE; Sun, 16 Aug 2026 19:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF16980DB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786910202;
	bh=9NON8FTr1wXzpDSc5LD22E9S4K25wmsu38nmmOPrpZY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZOsiDvdMG56DaHYNG3fE/Wg5yJMPIb3DkR1sr23Fjh/LpS+dL7t/q9VtmB4tPkuq
	 Fm/LUnzwLOQxiebU3strzH1UShFzKTw7Lhgtdzk6WwF8pbtwySahxkVZrWAMxH0Vdi
	 auK2OYmvONf30mnzNsjRJg9/JT9sdl+yV57Qbr3iA7Dw14vLWZVugnFV00zS0D0aCr
	 76KOwEjlPMV/c3xaAad0OOgjk4fCZO4fqntykKzhF6r8epjATacSct5LbwiCD0s8/n
	 IjvjtG0LwYwDjGxd54sylYLeFI6eI9gqL9CmFdquHOkJ0eGgb6gDcVeumLPJCL2nHR
	 wHwNPxyzfUDEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF16980DB3;
	Sun, 16 Aug 2026 19:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE157336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43F5605F8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfWj1DOyN6C9 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:56:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3D15605F5
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D15605F5
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=puIJGNpq
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D15605F5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso26260075e9.3
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786910198; x=1787514998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qtu7dvKA50AvRKzsJZv/9dItxzJ+g/epyfe08Hf3W/k=;
 b=puIJGNpq/nAsjtJcW6Qaf8hiXLbd2UYewefKZX8deNiTxfsOW3FkKZd/RFAhrGv9U5
 VC2n6qHXl2qlixdTSVd9taUrmSaTE0e8gvnmMcW8ZDQm96Qq2doXFqggUULAweA9Cbrc
 JSM6Z+sOKt+l87H1osRcxK9C7c/bAY/Fq5j/sx8/Pl3xyfjNFQXvnErxaHWyOQlyWXiB
 i5EuOCqY/fKJ68fC5/SehVxUBke0QVVquSh8PIoaBtRUfAU//7WAevD5lxdi7T8jO0nk
 U6Uqd6WcqNBeIGiktbiP3CUmJiu8a2iQZgFaWwN2EpVp+9OiEiO+z2yczcfLi3zJV39W
 p6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786910198; x=1787514998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qtu7dvKA50AvRKzsJZv/9dItxzJ+g/epyfe08Hf3W/k=;
 b=CnKrmh5fQV4ND+VScwpQMTC94JxHqLBj1LNirSSzTZbd4WARVNLFBj90oBvfl7Cqr8
 omu61qwIbndGiV4a2mqikQU1Pvp63nroQiNhIrZ2iMlXGGd/BVlyJgOchb2DVdwKIc2V
 IYQp6SAWK3MYebFUvCPBO+mEyFL5zW4VFTgG8QXOLW1p9RuIEuri4DSCX0U4pbJy5agq
 BaPI8e5+yKQwPAQcoly6P1RfshY/0JnZ4cE/pnEp6j8DNqa+Db+6xW9U0Z0iHjNbGAtR
 00uFRHg+QhdFzkQqiMpcEAYMUIxTqo+UQzMjDQGH6bgNX27UROeWfNgYPL+b57LNN2oF
 a5Zw==
X-Gm-Message-State: AOJu0YyIB+nLrBuKPGM3y0N/MBiwGc8WZyeNCNuHnODpbLKsouj83eB7
 MMn+K0HTFbSk1TbfAzpaPFt5UJD46pMLtycGHPVOIrja9ZDORF60yHNRtv3/iPmJqTc=
X-Gm-Gg: AR+sD12R/SnIX78Zgzl/0rn1FH9+oqxK2Z0tBcggJtpioRyLa3RuzaxWwpNbokFuxwz
 0RrAFajsXrmygVAZdQBx1yKMhIgofOY1WEljc4XXdXZIeoW2q7YYNiBwaenIFgrsOzjFpZ7zCK/
 VaYlRVZQiLQ/VFGJKJsA+lGJDeov11rMwp9tHG8bZGoECDIOGtTGJEJYDzmofXwuT+fRQn6k7rg
 cDq4QXU2m0ZMaPI0Epvp6fxU55Bb6i7kJz6Z+/y1kuEIsLCIjWPC/Z+zJjGJZvr1cuetHw3xXH/
 CMKxKvyXFy5AhSovojWfEBzhxL2yjxcjpk/GUAWDVRl1N/08RPnzL15qy4s25ImRzUpAY2gK/j9
 fx7a4dDehnuF82xRn2xvDjB1QcY4hY27D+pvWk/lU/adDKL8gdVVDEje2A15ZIFuwf2JpDPWwcj
 sVxQBNyX7rduwOFYITn68SAuKk1wKwgyFDpEKv/ZWSD7i/hu39hAfCASUfI9QubXuLag==
X-Received: by 2002:a05:600c:8b6b:b0:499:8f9f:e9ee with SMTP id
 5b1f17b1804b1-4998f9febbdmr215124445e9.7.1786910198439; 
 Sun, 16 Aug 2026 12:56:38 -0700 (PDT)
Received: from localhost ([37.101.131.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999611bf65sm65199265e9.13.2026.08.16.12.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:56:38 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 21:56:08 +0200
Message-ID: <20260816195616.279864-3-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816195616.279864-1-mattianarducci1@gmail.com>
References: <20260816195616.279864-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/gensio: add portaudio optional
 dependency
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

Portaudio is an optional dependency which is enabled by default since
version 2.7.3 when alsa-lib is not available:
https://github.com/cminyard/gensio/commit/71eef5e3cef2232eed85c5cb604bdf5fe3ebf580

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0c3ca5e03b..40cb0df514 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -62,6 +62,13 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GENSIO_DEPENDENCIES += portaudio
+GENSIO_CONF_OPTS += --with-portaudio
+else
+GENSIO_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GENSIO_CONF_ENV += LIBS=-latomic
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
