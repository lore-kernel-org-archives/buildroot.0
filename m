Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A7AC88CB9
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB769411D1;
	Mon, 11 Aug 2025 14:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8ZI__u0WaeC; Mon, 11 Aug 2025 14:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9CFC40159
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9CFC40159;
	Mon, 11 Aug 2025 14:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AED6138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C8246116F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poWx61v10Ei1 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A701C610EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A701C610EC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A701C610EC
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:01:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459e210bd2dso15684105e9.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754920860; x=1755525660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WX/JX3bRHwU9A9bj1dqAnIHS5ulB2qSL52veT2tLrO0=;
 b=AxG0eGGacMZ14BXvV77a9OcUsKgvukbdQ/nlL3UW1He2549R4SLs66fQdngh6i4343
 3e6JicndxXpKsLszSQvePVmeTxRfpeh5WPOV85Cfcly/rLVjRzLT3Cs5xPXYNmDkBytc
 D9QFmnPLHUCglgFLY2U6hP4eelgfJaYk6pBEoMh+0IyL7tJezmMWRyHxhjltpgZtOXxZ
 KP/6pWGK/hIQnFSQN28kxFbjm1/Ft8npFqE4k+e7rgiv+Io7GcUFpBOFqk0d2hPbzCve
 LcPW74Wup8KxpAYtweb3LOs/kwRBgCQZ3oO31NfavL2W6b1fcaI5Hm2RWe6gTB29BlDH
 VLLg==
X-Gm-Message-State: AOJu0YzdMn1B57aIW0fENC1uejXi6LsoXCvJMQeQcc8OpZ1xK7yo595I
 yAq7di/N41PrhKj+zBbBhIzXzceUmzRsGTzEAozuGRNe2M/uS4L7Rh2FJwgw7w==
X-Gm-Gg: ASbGnct5emcL7UvoE35E9JF1iCwGnb9KGjEa5XkHDZofaLeiakTId+E3udEwQUYghAz
 ElYqLolZrQug2meGs32oZBON2S9lEqHsBWgBoKoRUAzsKPWCJIeDOyRqJRa5HGPG9nrhGm+l+H6
 H3XZ+LkfjZ7HGSa4+H6iuzMT8uVXgPikMUcwenjGI5T6AjAr99sxe3QXdmsZSEJe3IuGI0vX8HG
 Ly/LJXCmIIZV8d+sxM7aRRVZC2LN02nsen64ZY4bkISCdApP2Q6/HUIZNsWNRIi7RxhC5fD+ell
 9/MS5UDxSHFlIXcfHhxPAuXNkzBH4fwL/vcu+h9Yi/QQYshZNfj7ay477zcPdB4JNrXs04SEyj8
 8zjySVXsUlIQbmAI=
X-Google-Smtp-Source: AGHT+IHY/RgQz5WxvVquWlLEY8crC40u24PaXyCNa1IdGKwlPw4jFmw+DqaemMitFF5RSBZwr80ruA==
X-Received: by 2002:a05:600c:c089:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-459f3a7ee89mr98860195e9.10.1754920859145; 
 Mon, 11 Aug 2025 07:00:59 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:91cb:8ca9:ea79:d987])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dbba5210sm328560805e9.2.2025.08.11.07.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 07:00:58 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 16:00:30 +0200
Message-ID: <20250811140030.1043469-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811140030.1043469-1-maxime@leroys.fr>
References: <20250806132109.129355-1-maxime@leroys.fr>
 <20250811140030.1043469-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754920860; x=1755525660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WX/JX3bRHwU9A9bj1dqAnIHS5ulB2qSL52veT2tLrO0=;
 b=cbnsYbLu49mslbeyTgwB+XZ/pKKT8ZX8bTlqSvXUQrueoPC0x8yumnzuYqZj3GePYA
 pwpf6KPjuCYHm4PtmRc/1cTBldTmE2rMkruEAxeI369lfMdtvgKCancg4a7YiOtX5W9r
 PO59mpOXvOItRi44RcsVtjS7mcfvvqXYsWutlYU+FzPJvTigxDz0OSLOvay/KkBY7SoJ
 83QUoCAZ2qrJQzY82sU3qFOxx7CVg0wJoM7KzHGD4E29chM377sf3nEJ+BhQigLusa5g
 7nmypAcs7PKzbFMwUnWGjB0DRA9djtIZGM1J0COD6uYtDJXiIblaUm/1Wj7dTDXsTTrM
 Uc4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cbnsYbLu
Subject: [Buildroot] [PATCH v2 2/2] package/frr: make ECMP max configurable
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBzdHJlYW0gRlJSIGFjY2VwdHMgLS1lbmFibGUtbXVsdGlwYXRoPU4gaW4gdGhlIHJhbmdlIDHi
gJM5OTkuIEJ1aWxkcm9vdApwcmV2aW91c2x5IGhhcmRjb2RlZCAyNTYuCgpBZGQgYSBjb25maWcg
aW50ZWdlciB0byBzZXQgdGhlIG1heGltdW0gRUNNUCBwYXRocyBhdCBidWlsZCB0aW1lLCBrZWVw
aW5nCjI1NiBhcyB0aGUgZGVmYXVsdC4gTG93ZXIgdmFsdWVzIGhlbHAgbWF0Y2ggaGFyZHdhcmUg
bGltaXRzIG9yIHJlZHVjZQptZW1vcnk7IGhpZ2hlciB2YWx1ZXMgYXJlIHVzZWZ1bCBmb3Igc29m
dHdhcmUgcm91dGluZyBvciBsYWIgdGVzdGluZy4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBMZXJv
eSA8bWF4aW1lQGxlcm95cy5mcj4KLS0tCiBwYWNrYWdlL2Zyci9Db25maWcuaW4gfCA3ICsrKysr
KysKIHBhY2thZ2UvZnJyL2Zyci5tayAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvQ29uZmln
LmluIGIvcGFja2FnZS9mcnIvQ29uZmlnLmluCmluZGV4IDM2NmUwZmNhODIuLjRkY2MwODM1NWQg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJyL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2Zyci9Db25m
aWcuaW4KQEAgLTMzLDYgKzMzLDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9GUlJfQk1QCiAJaGVs
cAogCSAgQnVpbGQgQkdQIE1vbml0b3JpbmcgUHJvdG9jb2wgZGFlbW9uLgogCitjb25maWcgQlIy
X1BBQ0tBR0VfRlJSX01VTFRJUEFUSF9NQVgKKwlpbnQgIm1heGltdW0gRUNNUCBwYXRocyIKKwlk
ZWZhdWx0IDI1NgorCXJhbmdlIDEgOTk5CisJaGVscAorCSAgQ29tcGlsZSBGUlIgd2l0aCBzdXBw
b3J0IGZvciB1cCB0byB0aGlzIG1hbnkgZXF1YWwtY29zdCBuZXh0LWhvcHMgKEVDTVApLgorCiBj
b25maWcgQlIyX1BBQ0tBR0VfRlJSX05IUlBECiAJYm9vbCAiTkhSUEQgcHJvdG9jb2wiCiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0NfQVJFUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIv
cGFja2FnZS9mcnIvZnJyLm1rCmluZGV4IGZiNzQ3N2EyMTEuLmU0MWVlMzNjYWEgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvZnJyL2Zyci5taworKysgYi9wYWNrYWdlL2Zyci9mcnIubWsKQEAgLTQwLDcg
KzQwLDcgQEAgRlJSX0NPTkZfT1BUUyA9IC0td2l0aC1jbGlwcHk9JChIT1NUX0RJUikvYmluL2Ns
aXBweSBcCiAJLS13aXRoLW1vZHVsZWRpcj0vdXNyL2xpYi9mcnIvbW9kdWxlcyBcCiAJLS1lbmFi
bGUtY29uZmlnZmlsZS1tYXNrPTA2NDAgXAogCS0tZW5hYmxlLWxvZ2ZpbGUtbWFzaz0wNjQwIFwK
LQktLWVuYWJsZS1tdWx0aXBhdGg9MjU2IFwKKwktLWVuYWJsZS1tdWx0aXBhdGg9JChCUjJfUEFD
S0FHRV9GUlJfTVVMVElQQVRIX01BWCkgXAogCS0tZGlzYWJsZS1vc3BmY2xpZW50IFwKIAktLWVu
YWJsZS11c2VyPWZyciBcCiAJLS1lbmFibGUtZ3JvdXA9ZnJyIFwKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
