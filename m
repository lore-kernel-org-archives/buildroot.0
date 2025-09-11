Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816F3CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D3C404E8;
	Thu, 11 Sep 2025 21:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NH5KLbdmgRW7; Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CFC40186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CFC40186;
	Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A7B025B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C6E984D6D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfDToQwFxGLS for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70CFD84D63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70CFD84D63
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70CFD84D63
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so10895515e9.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626076; x=1758230876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P80HkeNLknQQcwGc5QkQIIiZoB0x1ZhltBYN6rui9oY=;
 b=jMz8Y8OciQyE5bqBsTbpSgIvyxgpY9p7B225BxoVzymHXvbvFKQRieb2oamdHnGq9D
 cHSwGckJYIcU/jP8/JSsxv+9ut+UFcN7lRBAJCM4JkXxyvUv8g5WTFcAb8t/G1QLnQZU
 5mLegkTrVK1UK+sxIs8vhR+Sf2AtjGxcd0duQIFo6muDiWQf3W5a9ZPD8A+PwpSdnsBg
 aaEnbQ5N8hdKcw7xEuc1Bo9IyeAxbWaScmnSyL9LhkHRA7dHbVv4+3Na9UJhJqi0YU3/
 NmtuyVY3BHW/B8w96H1t2XpVJsT4v3dPT8FNY96b/Bn51IFgAkU/xqj5rxIXRU41BqF8
 o++A==
X-Gm-Message-State: AOJu0YxWKlAoPZPAxjHqczG8ZB83MPD0vDpnrlmbx3z+NY0JMRMd7JAe
 p27o+m7DpPSoLDRl6+0/VeqmUJsvH0U8lKdn2Zs3zK1MAE2RWpKZ13ZsZbAbWwINvFGcPl3I04p
 d8PoQo3M=
X-Gm-Gg: ASbGncuIePSPsTE7+8i2JYhIySnD5RPmeU1GCSFziWdqn9ldmL7t4CRyq3RxPKwwBHb
 safV3nOlowwfbRG0aTfs9WMAssduqlL41nxJ+D3T1Qh4w+6+NY35gMFSS0j2cKkDjXM74qx9Ttg
 NLntcTrOY1WNMXbGvblAeasOdGga+7SnWSgNMGBYlLlJ93XS+L2NtQGQWjaBCFmTMvPMGSlRZZF
 5ka9RAfJDv8G4VEqsaSayIU72TZE3/yCUjnJToebMWjrUNxG1ooTPK888lEFWV7dTCEgn2P9B8E
 aGEYOi93KClR597hECdUeYFSNgbg9PQr7U6U2x86ul6qu7tv5xd1shp0o4U/dcnAh4j5/11O+MT
 1IOPm4HvL9MECutK2WJhn0Dk=
X-Google-Smtp-Source: AGHT+IFIC54MrftjNUGd52EuCbNWv16wL2essoHQL8+TkZQQEf4HE0lxCOC23ZiuIYBUPFcrm2LoYw==
X-Received: by 2002:a05:600c:1384:b0:458:b01c:8f with SMTP id
 5b1f17b1804b1-45f211cc941mr8892825e9.8.1757626075733; 
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037b922csm40576735e9.15.2025.09.11.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AFF685F838;
 Thu, 11 Sep 2025 22:27:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:42 +0100
Message-ID: <20250911212752.266940-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626076; x=1758230876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P80HkeNLknQQcwGc5QkQIIiZoB0x1ZhltBYN6rui9oY=;
 b=Fyeyg4rnFWra54pzaQsoMKt+WsxjlilYp02ee1ShKSgJFQdqHuTAkaV0Trs408c5Lu
 w0LkZWo8NHHDKdGYF2/S+uLLyO5kbNnx4UEtIHNURmfa6a7/5U+uSrcYUMSMq7QhAQgZ
 vxXg4D8dOHgFYyIiqbkS2XKMme1b2i7uZ6urvMGlNWNEbHdMG1NJomz36Ia1xjTBy955
 lgjlSjR8HQZFaOg2VZ/T7QFuBIOdBuMcCFHsRJ1Tg7/29vL0GCfnTt9F0hV5fmEam3NI
 nsoTcfK8iZb6TztvpxrX0G5IyLrybOOtfvzgJ/Q81IoeAuPDbmyIPRmC7RabXJYsnSiE
 8JwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fyeyg4rn
Subject: [Buildroot] [PATCH v5 2/9] package/kvm-unit-tests: assume AArch64
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <jesse@rivosinc.com>
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
dmVkIGZyb20gdGhlCmtlcm5lbCBpbiB2Ni4xMC4KClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8
amVzc2VAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFt
aWx5Lm9yZz4KU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPgoKLS0tCnYyCiAgLSBsZWF2ZSBCUjJfY29ydGV4X2E3NiBhbmQgQlIyX2NvcnRleF9hNzZf
YTU1IGluIHBsYWNlIGFzIGNhbiBiZQogIHVzZWQgd2l0aCBhcm0zMgp2MwogIC0gci1iCnY0CiAg
LSByZWJhc2UgZml4ZXMKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgppbmRleCAwZDY2YTA4ZGQ3Li43NTM4MzYxZGY0IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgpAQCAtMSwxMyArMSwxMyBAQAogY29uZmlnIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIAlib29sCiAJIyBPbiBBUk0sIGl0
IG5lZWRzIHZpcnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgYW5kIGxpdHRsZSBlbmRpYW4gQ1BVcwot
CWRlZmF1bHQgeSBpZiAoQlIyX2FybSB8fCBCUjJfYWFyY2g2NCkgJiYgXAorCWRlZmF1bHQgeSBp
ZiBCUjJfYXJtICYmIFwKIAkJKEJSMl9jb3J0ZXhfYTcgfHwgQlIyX2NvcnRleF9hMTIgfHwgXAog
CQlCUjJfY29ydGV4X2ExNSB8fCBCUjJfY29ydGV4X2ExNV9hNyB8fCBcCiAJCUJSMl9jb3J0ZXhf
YTE3IHx8IEJSMl9jb3J0ZXhfYTE3X2E3IHx8IFwKLQkJQlIyX2NvcnRleF9hNTUgfHwgQlIyX2Nv
cnRleF9hNzUgfHwgXAotCQlCUjJfY29ydGV4X2E3NV9hNTUgfHwgQlIyX2NvcnRleF9hNzYgfHwg
XAotCQlCUjJfY29ydGV4X2E3Nl9hNTUpCisJCUJSMl9jb3J0ZXhfYTc2IHx8IEJSMl9jb3J0ZXhf
YTc2X2E1NSApCisJIyBGb3IgQUFyY2g2NCB3ZSBjYW4gYXNzdW1lIGFsbCB2OC4wKyBzdXBwb3J0
IHZpcnR1YWxpemF0aW9uCisJZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0CiAJZGVmYXVsdCB5IGlm
IEJSMl9yaXNjdgogCWRlZmF1bHQgeSBpZiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0CiAJZGVmYXVs
dCB5IGlmIEJSMl9wb3dlcnBjNjQgfHwgQlIyX3Bvd2VycGM2NGxlCi0tIAoyLjQ3LjMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
