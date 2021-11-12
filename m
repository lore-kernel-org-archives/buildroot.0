Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46530C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:08:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084D161054
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 084D161054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCC0826E7;
	Fri, 12 Nov 2021 19:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdX8xLM2tc47; Fri, 12 Nov 2021 19:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350D082716;
	Fri, 12 Nov 2021 19:08:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DFF31BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D77661545
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBbwUnbn8pLO for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:07:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0C8D6151C
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:07:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d27so17240880wrb.6
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xW09nIOgbY6ZM121rp+NKdFUh7rLslp92zAM48FZxg4=;
 b=c6wLPxMsYAGWf6gJuDL1fRBGpAnq9IjTm5VPOAfXIn5S8t66bBIqM0eHArxlSo06Md
 abC9vH9nrW6vfPI7H+mAayhgQ4/lCHGQm5CKjR7G6D3JI7WZFu6knO1gl17Hber6vCe0
 1Kuy5Dnh3cSKZFJFWfk15afZdmNbTNwZUY2VmhRpVuT5Sm99lyKknalXOc0RgeXr93kC
 9V8X53BRltoh/MGX4bri4MmhZerGQRlPujIiC9GroGN3EWp6c0VDlyvjstx3fko7w6Uo
 j1FCviChnrzVecHJWqEruk8v+L+kepiWx/plzkJVLlf4T81aKBTOSasKryS7r3jNXmex
 GW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xW09nIOgbY6ZM121rp+NKdFUh7rLslp92zAM48FZxg4=;
 b=7CrI/MZQApLGoesCKJt/mLAS+Hp13/IcKhEoUl72UiawWeTZLbPOcaktzbW4UpiTEO
 P/tXtnZSvjODxNywB1YrRWk26iFWCj4xoIwAPhKkdIFzgTrkQIiLqkeJjCi4Mh9h1Pzb
 HkilQMoq4TsPUqIQsnM+bq7aL+ZEeLpVWNdtesSQ3gOkHQdRCopjU6elhOT9nzSORc4W
 ElEwAp2znBiM2txE4FV00hvVq9uuJ67s0dKwe2Cje/pKzQt0l/os50sWA8ZLb4X5TfGH
 6drKKtgJ3uZpOex1ibkWIVe13tVzbt4PkXt/S4n/h+RIB47iKjki/pgQVbHpfXv6m0cg
 eyMA==
X-Gm-Message-State: AOAM533qZhLAHtc4vM+JyzTsvb7hLLrEB/Fni/i0BGwlhNdtVu5S8+X8
 3Xu0FBpb66Uv+9SY3pxD95mGwI8PQVQ=
X-Google-Smtp-Source: ABdhPJzev4Zas+kqRYnc788E8Y6Ki04jeHZi/h43mifinyqPqKhKH1ft0ZNAoQsYB9CKbEzyyM0SEw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr20962186wrn.349.1636744020760; 
 Fri, 12 Nov 2021 11:07:00 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:07:00 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:50 +0100
Message-Id: <20211112190650.84234-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] support/testing: test_luvi: make luvi
 test reproducible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgZXhwbGFpbmVkIGJ5IErDtnJnIFsxXSwgaXRlcmF0aW9uIHdpdGggcGFpcnMoKSBkb2VzIG5v
dCByZXN1bHQgaW4gdGhlCnNhbWUgb3JkZXIgc2luY2UgbHVhaml0IDIuMS4KCkZyb20gWzJdCiJU
YWJsZSBpdGVyYXRpb24gd2l0aCBwYWlycygpIGRvZXMgbm90IHJlc3VsdCBpbiB0aGUgc2FtZSBv
cmRlcj8KClRoZSBvcmRlciBvZiB0YWJsZSBpdGVyYXRpb24gaXMgZXhwbGljaXRseSB1bmRlZmlu
ZWQgYnkgdGhlIEx1YQpsYW5ndWFnZSBzdGFuZGFyZC4gRGlmZmVyZW50IEx1YSBpbXBsZW1lbnRh
dGlvbnMgb3IgdmVyc2lvbnMgbWF5IHVzZQpkaWZmZXJlbnQgb3JkZXJzIGZvciBvdGhlcndpc2Ug
aWRlbnRpY2FsIHRhYmxlcy4gRGlmZmVyZW50IHdheXMgb2YKY29uc3RydWN0aW5nIGEgdGFibGUg
bWF5IHJlc3VsdCBpbiBkaWZmZXJlbnQgb3JkZXJzLCB0b28uIER1ZSB0bwppbXByb3ZlZCBWTSBz
ZWN1cml0eSwgTHVhSklUIDIuMSBtYXkgZXZlbiB1c2UgYSBkaWZmZXJlbnQgb3JkZXIgb24Kc2Vw
YXJhdGUgVk0gaW52b2NhdGlvbnMgb3Igd2hlbiBzdHJpbmcga2V5cyBhcmUgbmV3bHkgaW50ZXJu
ZWQuCgpJZiB5b3VyIHByb2dyYW0gcmVsaWVzIG9uIGEgZGV0ZXJtaW5pc3RpYyBvcmRlciwgaXQg
aGFzIGEgYnVnLgpSZXdyaXRlIGl0LCBzbyBpdCBkb2Vzbid0IHJlbHkgb24gdGhlIGtleSBvcmRl
ci4KT3Igc29ydCB0aGUgdGFibGUga2V5cywgaWYgeW91IG11c3QuIgoKTm90ZTogVGhlICJsdXZp
IC12IiByZXR1cm4gMjU1IGV2ZW4gb24gc3VjY2Vzcy4KClsxXSBodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIxLU5vdmVtYmVyLzYyNzkzOC5odG1sClsyXSBo
dHRwczovL2x1YWppdC5vcmcvZmFxLmh0bWwKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KQ2M6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVy
cmFkQGdhZHoub3JnPgpDYzogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9j
a3M+Ci0tLQp2MiB1c2Ugc29ydCBpbiBweXRob24gKFlhbm4pCi0tLQogc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5IHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9sdXZpLnB5CmluZGV4IGViMTVhZDMxYjUuLjRiNTUwOTE3NjIgMTAwNjQ0
Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHV2aS5weQorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x1dmkucHkKQEAgLTI1LDExICsyNSwx
MiBAQCBjbGFzcyBUZXN0THV2aShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgIGRlZiB2ZXJz
aW9uX3Rlc3Qoc2VsZik6CiAgICAgICAgIGNtZCA9ICJsdXZpIC12IgogICAgICAgICBvdXRwdXQs
IGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKLSAgICAgICAgc2VsZi5hc3NlcnRJ
bignbHV2aScsIG91dHB1dFswXSkKLSAgICAgICAgc2VsZi5hc3NlcnRJbignemxpYicsIG91dHB1
dFsxXSkKKyAgICAgICAgb3V0cHV0ID0gc29ydGVkKG91dHB1dCkKKyAgICAgICAgc2VsZi5hc3Nl
cnRJbignbGlidXYnLCBvdXRwdXRbMF0pCisgICAgICAgIHNlbGYuYXNzZXJ0SW4oJ2x1dmknLCBv
dXRwdXRbMV0pCiAgICAgICAgIHNlbGYuYXNzZXJ0SW4oJ3JleCcsIG91dHB1dFsyXSkKLSAgICAg
ICAgc2VsZi5hc3NlcnRJbignbGlidXYnLCBvdXRwdXRbM10pCi0gICAgICAgIHNlbGYuYXNzZXJ0
SW4oJ3NzbCcsIG91dHB1dFs0XSkKKyAgICAgICAgc2VsZi5hc3NlcnRJbignc3NsJywgb3V0cHV0
WzNdKQorICAgICAgICBzZWxmLmFzc2VydEluKCd6bGliJywgb3V0cHV0WzRdKQogCiAgICAgZGVm
IHRlc3RfcnVuKHNlbGYpOgogICAgICAgICBzZWxmLmxvZ2luKCkKLS0gCjIuMzEuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
