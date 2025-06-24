Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC644C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 09:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B39E40A1B;
	Tue, 24 Jun 2025 09:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf4MqaCSVQOq; Tue, 24 Jun 2025 09:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B8840A15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B8840A15;
	Tue, 24 Jun 2025 09:09:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2927B12C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF2640600
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouitof7RRTiF for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 09:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B56AF40592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56AF40592
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B56AF40592
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 09:09:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d54214adso1240725e9.3
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 02:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750756152; x=1751360952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rqs1n3f0ZNuqi58bMrwU9A3pwxXZJsX4hpQ1V9sTJT0=;
 b=PVJFBChP+XteXJiM2tLc5iOj1idZxKPEOgSRPw76R9MzCcSOk3HtTzkLfX04s0WhPx
 8O0KUAatDWn41dsRFzA71AYB8U8DnuKzXRTTfsb0z1VF/Cze7mPBBODzHF5klKGkf/FS
 BDsS+o7kDV1sZysGNHeo4uBBWmS3H19cZ5JJrbkmJhVCEnf2VwhxIuop3jXgqbK+uYz8
 Q8aiYuMX7sP92MRtp5mmE3gi1Eb9+nG1+EKld3HIWaTPikVZcWOJhOBva8K3EMwO/6EU
 WPDoD+hp7BumRzEzvnYAhkjH4adVuMcoF3A+5f+pFQTWtRrS0093VlT8ZSYqrH6v+guw
 QBpw==
X-Gm-Message-State: AOJu0YwkeGUNGX5WcbQuC5WSCr0p2v5/2ej/3nukGnFrYgBi2HQDpxqF
 HJgE8h2fIEguMKRelzb9d5EZb6TiME+whTkQrbPqzJvDM3sA/JgbDN/8Piqcd1fqDTnLfUCECa7
 +PfbJ
X-Gm-Gg: ASbGncsghMitOxR6nSI5j0/5rqBaMYOnKszVPVzUJSqXLs/s+bU2SY+We118vP3Mcj8
 Q5j50oGpDUq/epPpMp+9rmTE0weUZphvpRi0CNzmboDOzu2LBZNzYBQ/oR7jtVzgg0uxFd0NCUs
 DncvZsG9OPdom1mp5apT2yphVoYL6AmHbGfYjjl1kgYFt+UiRGCkyHAMgTUawcBbU4LHg7Du8cB
 nCUOWvUYgLr9p56JPGPA60FNs4rkIa+6UnTSIrIK9q7qJ7cGsiA6sekizBfCG8+Vf1z6Fx1k2OM
 Lk53IFjLvHGHraSrASjLcTyCvHMNWrqpw8XGxE66BkW2RrimmAyxpZc772jV8jVCJwnyccJKXoP
 9OoBQaby8z3KAgWhT4MjCyWzv+jZzBVE2ScNeX8ZMM+MYhyTeTdqm1zGXrw==
X-Google-Smtp-Source: AGHT+IGMP6xSQM3nZrWCc7/cjoPu8fymbVRlKLI088+tdRRZUD+EqyZLqDGgaRZTSW5/ENZRObXtHg==
X-Received: by 2002:a05:600c:8594:b0:450:c210:a01b with SMTP id
 5b1f17b1804b1-453659dde88mr128691175e9.17.1750756152161; 
 Tue, 24 Jun 2025 02:09:12 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e805e0fesm1410845f8f.30.2025.06.24.02.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 02:09:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Tue, 24 Jun 2025 11:09:03 +0200
Message-ID: <20250624090905.287792-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750756152; x=1751360952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rqs1n3f0ZNuqi58bMrwU9A3pwxXZJsX4hpQ1V9sTJT0=;
 b=Z4CsnaZ/eqYB6s8AxARIuDizGgPjA0PJHs0zumps5ccgmYn5SaV2sRhYsIMDi5EsSm
 /QFrn3jsqG9gKTrjSakxaD3rr7Typ3tFNRYS8RdZfXqVewl0ekfjatDHCsL8G1D//xwa
 ejvTgQWy/rqU9akfyQh9pfmafr/QvdpngqI+rlMv0Tx+87NzuPMn5Q7lfKE/jKsKEQnZ
 EF16wnl6WX6qtkv05cgedTBEbnRBrjKURsyRLxlJEi9r11/H1S9eIG5Y7UvNHS1xjApI
 yyBWeNTka40Opqx3J5Q5Ord0FGD4cUL5keLCEEkFn0H+AaRi7ObHMA6leD+pAiU6lVVF
 +4Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z4CsnaZ/
Subject: [Buildroot] [PATCH 1/1] package/mupdf: update homepage URL
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgaG9tZXBhZ2UgVVJMIGxlYWRzIHRvIGFuIEhUVFAgNDA0IGVycm9yLgoKRml4
IGl0IGJ5IHVzaW5nIHRoZSBob21lcGFnZSBVUkwgY3VycmVudGx5IG1lbnRpb25lZCBpbiBtdXBk
ZidzIGdpdApyZXBvc2l0b3J5LgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJh
cGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbXVwZGYvQ29uZmlnLmluIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tdXBkZi9Db25maWcuaW4gYi9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgpp
bmRleCAzNGM1ZTdkNTM4Li41YzBhMTI3YTkwIDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgpAQCAtMTQsNyArMTQsNyBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfTVVQREYKIAloZWxwCiAJICBNdVBERiBpcyBhIGxpZ2h0d2VpZ2h0
IFBERiwgWFBTLCBhbmQgRS1ib29rIHZpZXdlci4KIAotCSAgaHR0cHM6Ly93d3cubXVwZGYuY29t
L2luZGV4Lmh0bWwKKwkgIGh0dHBzOi8vd3d3Lm11cGRmLmNvbS8KIAogY29tbWVudCAibXVwZGYg
bmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBnY2MgPj0gNC45IgogCWRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9IQVNfU1lOQ180Ci0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
