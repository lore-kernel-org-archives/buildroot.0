Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E730C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 09:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA38F6104F;
	Tue, 29 Jul 2025 09:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGmvtFrFGKGx; Tue, 29 Jul 2025 09:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E07C5607D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07C5607D0;
	Tue, 29 Jul 2025 09:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 333ED229
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307A8412FE
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tns5-G6hVSRP for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 09:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16D19412EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D19412EA
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16D19412EA
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:47:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso39651515e9.2
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 02:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753782463; x=1754387263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrAFp+HblrgQW+XE5eQgo29zUglUK0G7ED9VirUw9Iw=;
 b=vjDipQKVSnt/dGKF8azAaPytgvbhlnQeqLP0bmm9lPZP5EUO8Un3+evSKLkdCKdHgv
 D8yL5t89nMpTxe3M/vBalNHiDJ5t9+czqXEAt2Ai5Z1b91xuN3eAlq8ByXc/gdZzCiuO
 BmXa/gYjh+tgNOivSPFGFZfnNsTcwQYm98gyvNzSGG48IYEI+zaBq1Vc20+XAUcKjh94
 kYwCgADGTtSHFnYmbgNK+IvFhAQI0ze1Z1fGvQzUlt5uuTqTJ3Rz44tAo798MQgdD5ok
 WaH6yGNRss2ya8l7Bi/2/plT/Xd1xD4htqIedzLzjZ3gslZl0eWbdAlF+Xs+9fP8V8oy
 2dHg==
X-Gm-Message-State: AOJu0YxWSAWxNAThYnjzxunZPHGfc3wn68A+HC49prN3abLiq86UeoBq
 hNF6W0pifead81wxJhP7qIL3FE0wJC4rYUWmXmbFXy/nm4MJLg5v1VYhfd6aWanHcd08ncRHRHw
 Hjn0f
X-Gm-Gg: ASbGncutiMsHo+RCa1q2gqYivYpxjmpYtzaLmkmYb1Qjamq6L9ok9DNclTDcdG+IdbA
 fIlixLkNTZSl+q5Qwx4BbXPiV4CqNKynJYAu3ApnGGwDwcyNHbvQBhiSu0jap7Q6s7VA2jJP/Ij
 fXJl2mdXHQsFNuZW2PMACWb8zaLRWawMbQt8RndW9VrszI++53jYs46EAEl5xrgFkIbPmNXRdie
 8zpO8A5YPKH3XWYx2fI31brBewoKuZoX2OjhC8npNhIAaRj0GbOZ9iE64j/JtuN7NFsbGbJN+mX
 cuJ1omv+soVnAwCRWwLcXmOqZrS8ggTZRL/+nIGm0ggAPJps1PTqNBsgFaBPYL7yB1sfJNmLE5T
 SXaLeCUZoC8b3QG0coqC2L1HAVpcvnZJbs4v0KDJcM2be9a5Mv542vQ==
X-Google-Smtp-Source: AGHT+IEkRKTgM53vcK1Yg30SySNxdO80Hq0OKM5zNmxGbq4qXmr8R0/uF545WENsN0lGB3PQoH7iIA==
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id
 5b1f17b1804b1-45876b12ab6mr85629125e9.8.1753782462672; 
 Tue, 29 Jul 2025 02:47:42 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f686sm186376235e9.14.2025.07.29.02.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 02:47:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jul 2025 11:47:32 +0200
Message-ID: <20250729094732.165580-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728102956.81525-1-titouan.christophe@mind.be>
References: <20250728102956.81525-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753782463; x=1754387263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrAFp+HblrgQW+XE5eQgo29zUglUK0G7ED9VirUw9Iw=;
 b=RxrJDT2V0itGOw3GgYYioD+FPJKX8K7ir7JncEYfUnQGLTjPQPvdzxgFiC5vDiBg0A
 UTj+/GopVmPG9eP5ti4QF+4FsVYSnwuMTvxSlFxzLL20dbXss9hZ46Y9Ju9MTRZSRiRy
 mXzjDdQDTJI2DR2FqHubbtf84mDPsHPI2YxAZ5F/061wFEVW9nol6kG8iXpd/UdsnhnI
 xT0ZqJr0gHe7quF18/VqB7fygY5aCYgPZ4qIxbqU9jEhoivbiKT1BrHsXH/uEwQ7e5an
 FYHXS4PZOCUOH40NEt33c4qC+uM/g3+omcbRnsg0RDpzbBOMTyRqfTlsXDbFMkQQq7BS
 G7Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RxrJDT2V
Subject: [Buildroot] [PATCH v2] package/rust: add CPE_ID_VENDOR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This gives a proper cpe-id string to the Rust buildroot package,
as it can be found in the NVD database:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
    - Add link to CPE listing on NVD
    - Remove useless quotes in Make variable
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 22f3ca1455..9999475c35 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -11,6 +11,7 @@ RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
 RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+RUST_CPE_ID_VENDOR = rust-lang
 
 HOST_RUST_PROVIDES = host-rustc
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
