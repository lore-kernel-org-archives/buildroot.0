Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288DCC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E43A6131E;
	Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQ-Vfm2M-LdM; Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB935613FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB935613FB;
	Mon, 21 Jul 2025 15:48:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 861B2127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5711283D04
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zn2-a4pTQ-UN for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6195683D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6195683D03
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6195683D03
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso884314766b.2
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112896; x=1753717696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blyT8piBvQ5+KV8kKrGc0A4fbG3f8gkDj/0RGUxwbfI=;
 b=IWfKgkdwszlgVAR9+ufrjPgpqyrC/A3slLB27iClsUKBGeeX2wsk9pU/t2zupRsAUb
 I8h0Rl1FmVOxei5MSzZr2eTN0+diZ+eqRsa0+un+i6lG3XySkl78Q17aHrUivC2IaV2T
 nVm75oItbXDfVxSsTpxY7CYeJQ0lUBtLR/Uu/OxXKJrTE9rtkElBt6XQ5w9WDOm3H7Y/
 pjw1moPWoFrgr5H1nXkn1a7kY7Td0IPhgQ26o6/CIGXUPkdfg+GmeNcWCzoktcldVqjg
 o+6NSZRh5d0ffV6UsLs1dRlTgJDdOhMHrhTYjPlyW0jbY6AGy8DPs0/TPUKNPsgaVyxD
 c1QA==
X-Gm-Message-State: AOJu0YyQKxcdserta04Q8G6gdu++8/DkWUROnKaouZCaZrdi/irrDUOk
 gweqSt08Z0BN3lZBkwQHi/7AGiqUjXimJqrmdyrFxzAPMXuNOUWWX3RG2AJ1PoRfgs1b187VFtX
 elWq4
X-Gm-Gg: ASbGncuQg457FMkwS3yRMGPKplbcpUZDE4K9561DjKrMWIv9oNcXTy83KB0SwEPbdRo
 ClOs5MUuJnJ7ZUzHwEIuCvbbYrJzG8B4Wn3DJUAA1xl6rzp4NzA+8cahQOJblhMpbflrzqWuU4c
 QsE4xWnI2DQxtUeHDpxO6g/vrc1qBc2XTL9xhofiRvieCCGwrcsw+TFnZnT4NvtE8P1tZtwBtfQ
 jK7QaGKORPxm2E8v1QJeE/AdZiTVa4plgiKyoUsdMxcHRBIIrTPZPOisZiAeIch7vbs3Pnyv0ft
 V2Vohnc4G8xC0ghOM60bgreilTYiTqXbzpPIf41j3bUcZlf8NSd42aq5GWN8bW6T4UASVQVGfeD
 GdAotkkjO0fImsmg3t0ItOLc=
X-Google-Smtp-Source: AGHT+IGMmTLARp/Ic9jsmx1qVK2ZFPBqAGAYFXICm/5w1jDSom2W6hRsY9EbFaiBXeJU3hTUBCAR9A==
X-Received: by 2002:a17:906:4fd2:b0:aec:6e14:25fa with SMTP id
 a640c23a62f3a-aec6e1427a2mr1214806766b.55.1753112895858; 
 Mon, 21 Jul 2025 08:48:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca7ea53sm698667666b.133.2025.07.21.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 428CA5F88F;
 Mon, 21 Jul 2025 16:48:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:03 +0100
Message-ID: <20250721154812.787883-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112896; x=1753717696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blyT8piBvQ5+KV8kKrGc0A4fbG3f8gkDj/0RGUxwbfI=;
 b=cymDCcoplRznN7gl5fvRBuTeoEY2P69HOgc8W3CVaSbDYmlkyr+0I1G4aNQyq7Rr40
 qxgfD7OAKrvpeiG6aKLXP/f5XYs5mjoU3SXWcsXiEM+MctLVXseQAF3QFI2Sgy/a1jvv
 TE7Bh9Up9+Ca6SwImDo9nfk44vivPEDpjdM2spl3uxkRyXwxOFHewP9z4bRDlAfGJBgs
 G2P4HmIQ0Q115Y5afMffxVZPnC4ByT2DXL3qzhK1gBqOnXuzOfB2AfC2hrUnoBnI7SLu
 AHeQT8yF72zwc5Zkfr3ZtFs7ZmgQLciqFtyD0Ay+rn8vYhrjvTW19ScByY1/qlHYBMZV
 JElQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=cymDCcop
Subject: [Buildroot] [PATCH v3 2/9] package/kvm-unit-tests: assume AArch64
 supports KVM
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWx0aG91Z2ggaXQgaXMgcG9zc2libGUgdG8gY29uZmlndXJlIGFuIEFBcmNoNjQgQ1BVIHdpdGhv
dXQgc3VwcG9ydApmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2
ZSBzdXBwb3J0ZWQKdmlydHVhbGlzYXRpb24gZnJvbSB0aGUgc3RhcnQuCgpJZiB3ZSByZWFsbHkg
d2FudGVkIHRvIGJlIHN0cmljdCB3ZSBjb3VsZCBibGFja2xpc3Qga25vd24gbm9uLUVMMiBDUFVz
CmJ1dCBBRkFJQ1QgYWxsIHRoZSBjdXJyZW50IG9uZXMgaW4gdGhlIGNvbmZpZyBoYXZlIEVMMi4K
Ckkgc2hvdWxkIGFsc28gbm90ZSBLVk0gb24gQXJtIGlzIGRlcHJlY2F0ZWQgYW5kIHdhcyByZW1v
dmVkIGZyb20gdGhlCmtlcm5lbCBpbiB2Ni4xMC4KClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8
aHV0aEB0dXhmYW1pbHkub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+CgotLS0KdjIKICAtIGxlYXZlIEJSMl9jb3J0ZXhfYTc2IGFuZCBCUjJf
Y29ydGV4X2E3Nl9hNTUgaW4gcGxhY2UgYXMgY2FuIGJlCiAgdXNlZCB3aXRoIGFybTMyCnYzCiAg
LSByLWIKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDggKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL0NvbmZpZy5pbgppbmRleCAwMmVhOGRkNThjLi44N2IwNzVjNGI5IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL0NvbmZpZy5pbgpAQCAtMSwxMyArMSwxMyBAQAogY29uZmlnIEJSMl9QQUNLQUdFX0tW
TV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIAlib29sCiAJIyBPbiBBUk0sIGl0IG5lZWRzIHZp
cnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgYW5kIGxpdHRsZSBlbmRpYW4gQ1BVcwotCWRlZmF1bHQg
eSBpZiAoQlIyX2FybSB8fCBCUjJfYWFyY2g2NCkgJiYgXAorCWRlZmF1bHQgeSBpZiBCUjJfYXJt
ICYmIFwKIAkJKEJSMl9jb3J0ZXhfYTcgfHwgQlIyX2NvcnRleF9hMTIgfHwgXAogCQlCUjJfY29y
dGV4X2ExNSB8fCBCUjJfY29ydGV4X2ExNV9hNyB8fCBcCiAJCUJSMl9jb3J0ZXhfYTE3IHx8IEJS
Ml9jb3J0ZXhfYTE3X2E3IHx8IFwKLQkJQlIyX2NvcnRleF9hNTUgfHwgQlIyX2NvcnRleF9hNzUg
fHwgXAotCQlCUjJfY29ydGV4X2E3NV9hNTUgfHwgQlIyX2NvcnRleF9hNzYgfHwgXAotCQlCUjJf
Y29ydGV4X2E3Nl9hNTUpCisJCUJSMl9jb3J0ZXhfYTc2IHx8IEJSMl9jb3J0ZXhfYTc2X2E1NSAp
CisJIyBGb3IgQUFyY2g2NCB3ZSBjYW4gYXNzdW1lIGFsbCB2OC4wKyBzdXBwb3J0IHZpcnR1YWxp
emF0aW9uCisJZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0CiAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2
IHx8IEJSMl94ODZfNjQKIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJw
YzY0bGUKIAlkZWZhdWx0IHkgaWYgQlIyX3MzOTB4Ci0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
