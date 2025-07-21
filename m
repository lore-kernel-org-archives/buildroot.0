Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E545EC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB9542815;
	Mon, 21 Jul 2025 15:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCWfh-1YB_ct; Mon, 21 Jul 2025 15:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB0342809
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB0342809;
	Mon, 21 Jul 2025 15:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D365127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3375583D04
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNcqbukkkjRl for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FFF783D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFF783D03
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FFF783D03
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-612b67dcb89so6217486a12.1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112902; x=1753717702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WM6tlPL4qGZXH4IorRk2SZ7A0YDer/vKOcTETFz3Fs=;
 b=MoLDjJrqROQT+AFhkBt85qo4pA7fTiaPC7A8Qe91OyqtZ5kliIthT1QfVteeBT1AgG
 XuGNV0OMh2kY/k0MxZiOxsWjfwPV1qc/5IXfgI/NG57Ah5cRfv/GYhjIjB1msTuNcAxj
 WWOuVsnnXX08h9KvSoOPM3hyX5sMusBzeuCa0rtqNWXfPT8loqfjs3AmahwU0pQMUpEl
 sIUYhtI7XPMVW9cfa65l0u7UabdPsdQlTVYBQiU4L9Hod5RQ8+wcjNmgaye7oSXNHPOi
 RkZ5tUd8eAdp7HAfhIAFGvBG7NJsS3DYJHlCJ3SUlwOQB9y50TyOvREzzDoE89396pWK
 I1ug==
X-Gm-Message-State: AOJu0YyCuP7uz2etcU8l3WCR7kCPLW6DzSUr7ywdiZ0YT9sZiVGf8KYu
 PFZJ1TadoxkxZf5qb3XDYmTYhUzEjMusdSV3/k3+bZd8hf7JcS8Fo0J7iG6ER8X3dmbjxJWFPhM
 /Rt1U
X-Gm-Gg: ASbGncueaJviCu8eIywvTOomHC6ir+GJSoZrUe2vt/yd3Yv0JSqPOBdO7KcR7WV8k/A
 qYgrgvTIwGBSlaxWxiDTJHmtjDywLtesi56c7Lis7QQV2wLsUCPXfKuflGu6BbnU9lmmcvK0jLN
 BC35m7aWHk+6zt1oyVVFGXOQ4RzcAGDorUTtCBuQq/fQmUSZJHG44wqdU2LBtDyeSlvsfsqNXDI
 BIVXT0ziDVtUaDFgKj+Pf/hw04e0LFJLEER4WQbmZXtLC4uXhlVzvZBd1VsDCiWOUK5LTh/AoeV
 yQrwFpcOPygP0vN4l7SoCtPW4WdNWCYlwiw9C8y3lH34uYCQsv+pnu+pMK2O+BUWP6TbTsy0Anc
 4ob+R2UqFLcWeb596xXh+EPQ=
X-Google-Smtp-Source: AGHT+IHvwU4WcWJq8rpWlc/vtP4tZQATQhZjVtGW0NAI7+/s6ynvhBj5kY9i/gKbRmBG9HNMcy0vLg==
X-Received: by 2002:a17:907:3a96:b0:ae3:cb50:2c6b with SMTP id
 a640c23a62f3a-ae9ce0b930emr1440265966b.38.1753112901958; 
 Mon, 21 Jul 2025 08:48:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca3005bsm699669366b.88.2025.07.21.08.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 556725F8C8;
 Mon, 21 Jul 2025 16:48:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:10 +0100
Message-ID: <20250721154812.787883-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112902; x=1753717702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1WM6tlPL4qGZXH4IorRk2SZ7A0YDer/vKOcTETFz3Fs=;
 b=R2lFaY+MYjdhXEEC5pDliY6+bZ5Gzhjn0RkYx4JeyaQo8UUbi346Lqe60XICXNJ0eq
 wXTQeEa14t3nm17DBq98gULw4buXTWkueshLW/EZoLL7UpFwNKrK0uGbs3Hnmc1tusWu
 dMxTQJDuD6sPRnL40JP4eJK/zB8j5bwBPamlfJfoi503bXzzwhI4UwwW3KyW6U6TGJo0
 053hOb2LDW05RYoSjT0RGk20mdckml77eQeBS5K4CdtiYzgYSKf53Bj5qohq7soWRB8/
 4tloU0durfPRi+iK3S7WiKa6TaXyk665eB4RdoBCEEyH7w4TvPlIEZeKKAmtQesrGovl
 hbyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=R2lFaY+M
Subject: [Buildroot] [PATCH v3 9/9] package/kvm-unit-tests: allow kvmtool to
 be used
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

Rm9yIHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29sIGlzIGFuIG9wdGlv
biB3aGljaCBtYWtlcwpmb3IgYW4gZXZlbiBzbWFsbGVyIHRlc3QgaW1hZ2UuIENyZWF0ZSBhIG5l
dyBzeW1ib2wgd2hpY2ggY2FuIGJlCmV4cGFuZGVkIHdpdGggYWRkaXRpb25hbCB0YXJnZXRzIHRo
YXQgd2lsbCBhbGxvdyB0aGUgc2tpcHBpbmcgb2YgdGhlCnNlbGVjdGlvbiBvZiBRRU1VIGlmIG5v
dCBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFy
by5vcmc+Ci0tLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gICAgICAgICB8IDkg
KysrKysrKy0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIHwgNyAr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgppbmRleCA3NzViMjUwZDVmLi5lYmE4OGI2ZDMwIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgpAQCAtMTIsNiArMTIsMTEgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIAlkZWZhdWx0IHkgaWYgQlIyX3Bv
d2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKIAlkZWZhdWx0IHkgaWYgQlIyX3MzOTB4CiAKKyMg
U29tZSBhcmNoaXRlY3R1cmVzIGNhbiB1c2Uga3ZtdG9vbCBpbnN0ZWFkIG9mIFFFTVUgdG8gbGF1
bmNoIHRoZSB0ZXN0cworY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0NBTl9VU0Vf
S1ZNVE9PTAorCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQgJiYgQlIyX1BBQ0tBR0Vf
S1ZNVE9PTAorCiBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKIAlib29sICJrdm0t
dW5pdC10ZXN0cyIKIAlkZXBlbmRzIG9uIEJSMl9IT1NUQVJDSCA9ICJ4ODZfNjQiIHx8ICFCUjJf
eDg2XzY0CkBAIC0yMSw4ICsyNiw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNU
UwogCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKIAkJICAgIEJSMl9V
Q0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCiAJCSAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJ
QkNfVVRJTFNfQ09QWSkgIyBydW50aW1lIGdldGNvbmYKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVN
VQotCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSAjIHJ1bnRpbWUgZm9yIHFlbXUtc3lz
dGVtLSRBUkNICisJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUgaWYgIUJSMl9QQUNLQUdFX0tWTV9V
TklUX1RFU1RTX0NBTl9VU0VfS1ZNVE9PTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RF
TSBpZiAhQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MICMgcnVudGlt
ZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ09SRVVUSUxTICMg
cnVudGltZSBmb3IgdGltZW91dAogCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZQog
CXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRl
c3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10
ZXN0cy5tawppbmRleCA5OTA3OTVkYjAwLi4xYTUyNTNlODY5IDEwMDY0NAotLS0gYS9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKQEAgLTM1LDYgKzM1LDEzIEBAIEtWTV9VTklUX1RFU1RT
X0NPTkZfT1BUUyA9XAogCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAogCS0tZW5k
aWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCiAKKyMgVGhlIGRlZmF1bHQgcnVubmVyIGlz
IFFFTVUgYnV0IGt2bXRvb2wgY2FuIGFsc28gYmUgdXNlZAoraWZlcSAoJChCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTSkseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXRhcmdldD1xZW11
CitlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfS1ZNVE9PTCkseSkKK0tWTV9VTklUX1RFU1RTX0NP
TkZfT1BUUyArPSAtLXRhcmdldD1rdm10b29sCitlbmRpZgorCiBpZmVxICgkKEJSMl9BUk02NF9Q
QUdFX1NJWkVfNEspLHkpCiBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS1wYWdlLXNpemU9
NGsKIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SykseSkKLS0gCjIuNDcuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
