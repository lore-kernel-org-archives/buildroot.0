Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ED1C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7D940EF7;
	Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srCBg3rVKtmN; Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A383240EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A383240EA1;
	Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8032114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DAC640B85
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thHBP8Clq34o for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF382402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF382402BC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF382402BC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-454f426b3e5so4511895e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252249; x=1752857049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TdDHkIlG9Rs9lErobE/dpTKdleXisEfedgJpG5b7cnI=;
 b=vIL7f/UWyg/fJHutX2IFzSC/KZvJWW9atcnqrbo1bdREJImqtnKD8hko+OE0O7PRx7
 uEPFdQEs0UNQ1CmpVFHfLJ605NZHwS+cStZhZ8VC6Xk/svjAGQjqW9yq7UMMFOSr74s+
 qZTxXLEnYH4K9FjASvN4xIL2zk4NBt3voWXU2sjUBZBo3UZSXnI3eLII8VRoSQhAgEim
 Ph4ttZe48DaIk/TKLcJknKC2yG0eBfuK5Cl+HGyvaico+EjFLPd7/6Spb9gP0J8lycwW
 2FAprV/0voIlcce4JvtBK01MA99PbqDBr401EZyFuVmENBHl/akZbSWgAvNXXGWt+JBI
 8FpQ==
X-Gm-Message-State: AOJu0YwPsuxFnaDhfvc6FfoJq+catkFQTxbegliSkIDJYzIZCwik/fQP
 xbVqTE1Qa4ul6NIRdaGCwsr/1VBCbv+UIDBPYq4BkO1yMUS7b9oMRZZrX3O+ZQkjsSOz5wlNBwD
 VysPi7JE=
X-Gm-Gg: ASbGncunDBNyjtfI+goAwl7nmaC5mVJ/RzIcL96rLRpD/1WJLeYjrRnWVGokSEMPqbV
 3m3C4yu5qhOrHKGBZcVJU/XLVkX1YjlSWMdyfx/POz5sXzh3n8QPPIkDDwju0+1e3NIB2Soch5U
 7F5573SJNQIBJ7O/wHTuDRAh3yp08uVK1pn691gTK7ZQIXJTDgfTUa2S6wsWgbYmAcPXLV5V28/
 Cn+7lEqezhz2RQ0iVftKUq0cWE/ctRQzxUVcioy3UnzW1oE3G2eF/7cmfYrDR3nZs04uRJJlNBl
 jI1egrp60Cvdbcd0F/BYaqatkrFRf4RsG038vujaU1LftSs/TkLtqOWLxd0DOokdr41BiUAujJp
 hRUqV9yZVmKDLpvOt3mEJ1sg=
X-Google-Smtp-Source: AGHT+IHSRrl7DDtRiUyReyFguX6H9n+C1ctapm+HfjSaVOAc7O0AF5XNH8y4cNOE6T9nUdfgAgZuJw==
X-Received: by 2002:a05:600c:470c:b0:453:8f6:6383 with SMTP id
 5b1f17b1804b1-454ec268cd5mr37215725e9.15.1752252248798; 
 Fri, 11 Jul 2025 09:44:08 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd17b7sm4932898f8f.11.2025.07.11.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2D2E95F81E;
 Fri, 11 Jul 2025 17:44:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:43:58 +0100
Message-ID: <20250711164407.799041-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252249; x=1752857049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TdDHkIlG9Rs9lErobE/dpTKdleXisEfedgJpG5b7cnI=;
 b=yJbO8uCgOtpDhY+r5BXlmhbuQ1w0dBmdDm011FDzVzY5OuvJn5BiP/uxSHFi5/dNsk
 LjROzfdEfC4BmR4AKrHvUQeixdaS3qEtDG/3+V7L99ths/LLvZtPV80OqiaMgXWyWnnY
 pjdzpuLCZUE1i7l8EGtEBsdsYqZrB9LNy/OQ1pAjdPnOFEERlp9W02zvB2DvYnbJ/Jho
 M1ij8eY19Rj9/xtaAJAjzMAIc/+Cdx++Z/py4hx4Q/R+VDWyYlJZ35K0YhLh+ZR6G6mn
 iYjqGMZuwahTDzpTqOghgHo4+Yj66fPtoZU6wZ+WDc/Y5AKkV/FOjYEnTN99vvK5IFom
 JGeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yJbO8uCg
Subject: [Buildroot] [RFC PATCH v2 0/7] kvm-unit-tests: update deps and fine
 tune qemu
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

VGhlIGt2bS11bml0LXRlc3RzIHJlY2lwZSBpcyBhIGxpdHRsZSBvdXQgb2YgZGF0ZSB3aXRoIHRo
ZQpkZXBlbmRlbmNpZXMgaXQgbmVlZHMuIFdpdGggdGhhdCBhbmQgc29tZSB0d2Vha2luZyBvZiB0
aGUgb2YgcHJvY2Vzc29yCmRlcGVuZGVuY2llcyB3ZSBjYW4gbm93IGJ1aWxkIGt2bS11bml0LXRl
c3RzIGZvciBhcm02NC4KCkFzIGt2bS11bml0LXRlc3RzIG5lZWQgdGhlIGxpYmMgdXRpbHMgYW5k
IEkgdXNlIGV4dGVybmFsIHRvb2xpbmcgSQphZGRlZCBzdXBwb3J0IGZvciB0aGF0LgoKT24gdGhl
IHdheSBJJ3ZlIGFkZGVkIHNvbWUgbmV3IGNvbmZpZyBvcHRpb25zIGZvciBRRU1VIHNvIHlvdSBj
YW4ganVzdApzZWxlY3QgeW91ciBuYXRpdmUsIGt2bS1vbmx5IFFFTVUgYnVpbGQuCgpGaW5hbGx5
IEkndmUgYWRkZWQgYSBzaW1wbGUgdGVzdCBjYXNlIGZvciB0aGUga3ZtLXVuaXQtdGVzdHMgcGFj
a2FnZS4KCkZvciB2MgogIC0gYWRkcmVzc2VkIHJldmlldyBjb21tZW50cwogIC0gYWRkZWQgZXh0
ZXJuYWwgbGliYyB1dGlsIHN1cHBvcnQKICAtIGFkZGVkIHRlc3QgY2FzZQogIC0gcmFuIGFuZCBh
ZGRyZXNzZWQgbGludGVyIHdhcm5pbmdzCgpBbGV4LgoKQWxleCBCZW5uw6llICg3KToKICB0b29s
Y2hhaW4vZXh0ZXJuYWw6IGFsbG93IGluc3RhbGxpbmcgb2YgbGliYyB1dGlscwogIHBhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHM6IGFzc3VtZSBBQXJjaDY0IHN1cHBvcnRzIEtWTQogIHBhY2thZ2Uva3Zt
LXVuaXQtdGVzdHM6IHVwZGF0ZSBkZXBlbmRlbmNpZXMKICBwYWNrYWdlL3FlbXU6IGludHJvZHVj
ZSBrdm0gYW5kIHRjZyBzeXN0ZW0gb3B0aW9ucwogIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHM6IGJ1
bXAgdG8gMjAyNS0wNi0wNQogIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHM6IGhvbm91ciBCUjJfQVJN
NjRfUEFHRV9TSVpFCiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdCBmb3Iga3ZtLXVuaXQtdGVz
dHMKCiBib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcgICAgICAgICAgfCAgMiAr
CiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAzMiArKysr
KysrKy0tLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2ggICAg
fCAgMiArLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayAgICAgIHwg
MTAgKysrLQogcGFja2FnZS9xZW11L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgIHwg
MjMgKysrKysrKy0tCiBwYWNrYWdlL3FlbXUvcWVtdS5tayAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxNCArKysrKy0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5
ICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysKIHRvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJu
YWwvQ29uZmlnLmluICAgICAgICB8ICA3ICsrKwogLi4uL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwu
bWsgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKwogOSBmaWxlcyBjaGFuZ2VkLCAxNDIg
aW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKCi0tIAoyLjQ3LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
