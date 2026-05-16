Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A6FCD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6288461B2A;
	Sat, 16 May 2026 01:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9vHydb8S_Jk; Sat, 16 May 2026 01:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06361616FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895839;
	bh=SWPYVP2psrLds7ZpWQAg5guMMgTaqcrhk7FxL71kqVU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sr4RuNeQYIQJfIT0/jmyBS8J5jJIWPpPe03jBVRYLwoHJpVeMXvWuNMhgQcas2Am7
	 cfVFAL5LNpLqK0heTKedHbDa4VyhnAmV3zQb+gZ6Xv9m0sMX5NVREyAn0xm0NggqO6
	 PHrdcnI6N1h8jiNpDFtfF26Sr7DpA2+rbDYzruygzXGbJnmMoGGtAevCK3CsWmyiKm
	 XV7QQ/q9W7RI1t84kiEL2mki2L03OFCAzdaHhhnyBAR3oE0mIPNXaLqRdrd0L6Md/4
	 xdpALMrWwVKww+4KzBb6PnpO2jwWCRl7VtplEaylE0L4Ki+Z0qmPBqktzkhzWF1lY1
	 O3nH/6peEaSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06361616FB;
	Sat, 16 May 2026 01:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3668B45B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C8C041FE2
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0opnb84BKwl for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 279EF41FE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279EF41FE0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 279EF41FE0
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:54 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8353c9f24d2so235248b3a.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895833; x=1779500633;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YLcK9HSN+3vQ7lZdIoPOiMv/mUiK7jQs02z/sM9viqg=;
 b=W3lwNNBeQBUp/0QFNCE4RTRXJmX+DKCk7Fk6JKcPvvyvqUD9Zeish9ZXxT2frPe6/w
 ch5YfRsKoTSyEyFUohAg4iqPqN1LaTBT0qGBNbZd3vqD3RYdBPhmTZL7Q/lSfJXcz2NP
 +u+LBeXHxDANKblchCaqz0QZ3YyLLOhRS8k7TkFRV1YlqyaCsbIyZKl0JjtMslmDnTGq
 FE9bB2fURzi28JRYwDdzf4S5rBUsgwr4+B91m0eeJ+PLT+xTO9JowlVDZKLWxrjxbRUQ
 m0OU9lQtEawZpr1mn5vyr8CSjL9DNtNWzgxEJhBhgeIowSxFVT1rIlvYc6ic2a4G1xoX
 QBkg==
X-Gm-Message-State: AOJu0YzepT9SNhK/WVXzE9fVCvzu55h3FoqB389C9Sti/888tu3bXI5p
 bBNpPymC5+4qwpalID78Ob7L23R+mSGvSJ6jZv/WJdGbFieYX0Akga2z
X-Gm-Gg: Acq92OEeYlneP7m1T6PgQVDosJhYAgvZZiXjPj7kPedIUf/JTye5LLQZZ4EFkAb6WMj
 UxuebAHbZWkUkCbe8fFQsB82f68QiwAayX0uL9rbR5h/REPewSIAu4K6dZmbeX/HfR9S7F/73Gg
 N38eN9Jz78fu12uOMoMHo0IyPhBZkf6JLk35FxHhHOyEyIrwC4yMWKTmmz8HnRQy5UzwP9diVP9
 yoWDfFN2Doeet/P7XhhSlzP0OMWVAXKsGnMk3pQ+44cnjCIMF0cmv84Mouq5lTnn7yHbDe1m0de
 YNbt489QRaGJQ03qotP8yaa8dRvPjvSbzXL0YA4fwQhC/eEWwvxn/nV+hVCHIGZR/LHFOGJK3j/
 5rF9lEXytCT20PVr0bmc2w/ukb4g5x0v4c7VYsgqQ6yVHvTb6Wdoi8TSpES8UXdeTjJv9NlQLHV
 zyPH6/u0nMJOyk5Xy/Gj5U2uG1
X-Received: by 2002:a05:6a00:4b53:b0:82f:4f67:1ff6 with SMTP id
 d2e1a72fcca58-83f33c34fc8mr5974368b3a.4.1778895833360; 
 Fri, 15 May 2026 18:43:53 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:52 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:33 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-2-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=1108;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=ZEuDYDV81BWi7jlziwuU6dIfFn6YrhhehlzSJdn32q8=;
 b=WZgh/WsCIpahiVHP7+kXHELitAIZc71utMxEu3J6iPMip2actcOfDCm+FPKwAua6Eow5Tga/h
 9vTe2nHZv4IC7FDClBrHT/uK3dMSCRpoeHlH60MPhksr6mED7bvXyvV
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895833; x=1779500633; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLcK9HSN+3vQ7lZdIoPOiMv/mUiK7jQs02z/sM9viqg=;
 b=qNV2pQ/uebQdlGqmSxuoiBlB/on6tF9X+egv2zXCyo2tFausPynuCwe/e5NoIc23lk
 EZ3kXBAXQtQa8vqULRzLRFHTb+BKBAF3LaTo/cBUTrwx+nXmPCJ9RRw30w84reC4Ecm1
 Ciiz0H44c+3s2lMaa+oakTYGf6CsEuZL2f5AO7vYENRsnyUHkeFItw9ktNMt/e8Pvgfo
 zhkPuxFqQLnn06v04RYdW6RraaRS/N0jTqG8nQLARwWkr213FGFG/aaEwiEigGYwvT9u
 x+t2tjS64llm134NLcjZn6nSi/mJylBRoIVCA2+VsQ2J73Pttf8cY+X1x7VRAxzaxvVu
 wdTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qNV2pQ/u
Subject: [Buildroot] [PATCH v6 2/8] package/wpewebkit: fix stale libepoxy
 dependency comments
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

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/wpewebkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c8602f1de6..c4ee5a27f7 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
