Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F18CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 17:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECB481CE3;
	Fri, 17 Oct 2025 17:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amj5PngJf-dd; Fri, 17 Oct 2025 17:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D511A81D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D511A81D9F;
	Fri, 17 Oct 2025 17:26:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA44D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 320CA40BC8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TyaTtuXeEf6 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 17:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1594740BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1594740BCA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1594740BCA
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so19051775e9.1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760721986; x=1761326786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RD85remEyx2M3bIOSjzzk7eH5D86DdLO6hKs1KNG0nY=;
 b=vo8UZI633fyGVtTcaji5BRp1SM+kzFcbSufcukYFXrF3bCFsnQFbJQ7xIgUsXiqGHJ
 47OBxuTh1RN8WCWvdU18eqzmwwmJX5mSZKHdUd5OU3bxID4b0nOmxFl0BmjY7w2bBLuo
 Z8qguybysxa2RQ4CUNhCyZ1T6zjUf488X78aPcaxlsSqznrvSbHwDkGvHeJUJtaChkxw
 CV+yDOzO+qosEjvZ+xjrZQCpTzIiXTwjHNSfAX1oPhczRiqjcno6k2U/6r65xrOUwyVO
 jw3Si7jhMB9+pgNfX06XNp41gtA6RdXtqHNYa20+kMW+aO6pBhizCmkxiI64lViyoTZk
 2wdg==
X-Gm-Message-State: AOJu0Yy7gU8jaiOekaLyw/jthMg+imZpRnr3PiJz1hxgIoS1KtiJAgPP
 whl/ohn+0UaCh/8KplQQvoE2/TNT14aW8VYXhTxPeSbIp03W5XNmTPijlkpfqNAxwDADtbFbg1+
 xM0y2xfY=
X-Gm-Gg: ASbGncvtXc2ivkHHoaD2LRAmLaZRLfWCfncPHmPMDUdXigZ2atWn6Hpn0Z526nxDs1X
 jmi5tq30WT/GJf128mlt9gx2mvulXtrDexasZgPIQ9Yu0u4yj1MyC1CZzQxPMv0YRci9rzMb2sb
 ucvKIgupUf6Yrj1Cb4Lv5KCul8TTsXf1r+eEp8Q18v2o+0OCCaXdo2CZ2RqYckqRHHwOJPxRkBV
 d1rYI6ixlLfW7/MUYmyMh7iP9DiCCvbAEkCTRI1jDOCvtuRuJ6GpYdpxw8gjws7pag7sWcYKume
 WupGwq+PECuQ9OKXWk8Pv+fVpqIKZbivW7ft6yYLqiQlht8dBlQyWYnQKkJvJq8zhNvOpTIjiyk
 nuP+huisof6TzcMa7EPqJiY0LpEk0a1AUSysnyBbiMaoxaScfLLIBCS0OMsrwtMO8Og0Hkw9iFX
 7G4ZbUwy8meZ5SzedgvkETUnLzJLR5qq0HObKspR3u
X-Google-Smtp-Source: AGHT+IEsRyz4y54t4ZnQGEPBqAXN3T9dF6azk1bXa8ldOyZ9b1a3n5OWvGJthMi1Dvg65aVzJf6Wzw==
X-Received: by 2002:a05:600c:3b98:b0:46e:6339:79c5 with SMTP id
 5b1f17b1804b1-4711724b354mr47360315e9.5.1760721985593; 
 Fri, 17 Oct 2025 10:26:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([176.201.10.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144239f4sm92613085e9.2.2025.10.17.10.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:26:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 17 Oct 2025 19:26:20 +0200
Message-ID: <20251017172621.296710-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760721986; x=1761326786;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RD85remEyx2M3bIOSjzzk7eH5D86DdLO6hKs1KNG0nY=;
 b=M8jlAn8qo5Y0dojTE75Tddp1Xg+8Uzzrecmpyw9cxOFsv1KwLkrmSn3SGRSnGHfDjv
 q+ejHmBTn1wFKgpbrrn/4x6tiZ0+AaBlSU30vxdyCqLWi2X3aC9N6SeqCLxR4mME8bOK
 af7wFyFM+ZQI7oBfrQAqva+CnggCz10xyJqEA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=M8jlAn8q
Subject: [Buildroot] [PATCH 1/2] package/ledmon: add upstream patch to fix
 build w/ gcc-14
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

QWRkIGFuIHVwc3RyZWFtIHBhdGNoIHRvIGZpeCBhIGJ1aWxkIGlzc3VlIHJlbGF0ZWQgdG8gdWlu
dDY0X3Q6Cgp1dGlscy5jOiBJbiBmdW5jdGlvbiDigJhnZXRfdWludDY04oCZOgp1dGlscy5jOjEx
ODoxODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhzdHJfdG91bOKAmSBmcm9tIGlu
Y29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAg
MTE4IHwgICAgICAgICBzdHJfdG91bCgmZGVmdmFsLCBwLCBOVUxMLCAxNik7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICBefn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgICB8CiAgICAgIHwg
ICAgICAgICAgICAgICAgICB1aW50NjRfdCAqIHtha2EgbG9uZyBsb25nIHVuc2lnbmVkIGludCAq
fQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gdXRpbHMuYzo0ODoKdXRpbHMuaDo0MTI6Mjk6IG5vdGU6
IGV4cGVjdGVkIOKAmGxvbmcgdW5zaWduZWQgaW50ICrigJkgYnV0IGFyZ3VtZW50IGlzIG9mIHR5
cGUg4oCYdWludDY0X3QgKuKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQgKuKAmX0K
CkZpeGVzOgoKICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNTFhZjFk
N2JmNzEwNjFmMjJkNDkyMTM5NTFhNWY2YTk1NjU3MTBjMy8KClNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBwYWNr
YWdlL2xlZG1vbi8wMDAzLUNvcnJlY3QtZ2V0X3VpbnQ2NC5wYXRjaCB8IDQzICsrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbGVkbW9uLzAwMDMtQ29ycmVjdC1nZXRfdWludDY0LnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9sZWRtb24vMDAwMy1Db3JyZWN0LWdldF91aW50NjQucGF0Y2ggYi9w
YWNrYWdlL2xlZG1vbi8wMDAzLUNvcnJlY3QtZ2V0X3VpbnQ2NC5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjJkYjRjMDRhNmU1YwotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvbGVkbW9uLzAwMDMtQ29ycmVjdC1nZXRfdWludDY0LnBhdGNoCkBAIC0wLDAg
KzEsNDMgQEAKK0Zyb20gZWQ3NDdhYzM1NDBjYjM4Nzk3ZjU2NTMzZjlmNTFmNTYyN2U2Yjk5NCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFRvbnkgQXNsZXNvbiA8dGFzbGVzb25AcmVk
aGF0LmNvbT4KK0RhdGU6IFdlZCwgMjEgQXVnIDIwMjQgMTI6Mjc6MjggLTA1MDAKK1N1YmplY3Q6
IFtQQVRDSF0gQ29ycmVjdCBnZXRfdWludDY0CisKK0ZvciBsYXJnZSBpbnRlZ2VyIHZhbHVlcywg
dGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIHdpbGwgYmUKK2luY29ycmVjdC4KKworVGhlIGN1
cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgY29udmVydGluZyBzdHJpbmdzIHRvIGludGVnZXIgdmFs
dWVzCit1c2VzIGEgc2lnbmVkIGludGVnZXIgZm9yIHRoZSBpbnRlcm1lZGlhdGUgY29udmVyc2lv
biBhbmQgcGVyZm9ybXMKK2EgcmFuZ2UgY2hlY2suIFNpbmNlIGFueSB2YWx1ZSBpbiBhbiB1bnNp
Z25lZCA2NC1iaXQgaW50ZWdlciBpcyB2YWxpZCwKK3RoZSByYW5nZSBjaGVjayBzZWVtcyB1bm5l
Y2Vzc2FyeS4gVG8gbWltaWMgdGhlIHNhbWUgY29kZSBwYXRoLCB3ZSB3b3VsZAorbmVlZCBhIGxh
cmdlciBpbnRlZ2VyIHR5cGUuCisKK1NpZ25lZC1vZmYtYnk6IFRvbnkgQXNsZXNvbiA8dGFzbGVz
b25AcmVkaGF0LmNvbT4KK1NpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvbGVkbW9uL2NvbW1pdC9lZDc0N2FjMzU0MGNiMzg3OTdmNTY1MzNmOWY1MWY1NjI3ZTZi
OTk0CistLS0KKyBzcmMvbGliL3V0aWxzLmMgfCA4ICsrKysrKy0tCisgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy9saWIv
dXRpbHMuYyBiL3NyYy9saWIvdXRpbHMuYworaW5kZXggYTc5MzZjNjliMjQyLi5hNmVlMjliYTdm
MjIgMTAwNjQ0CistLS0gYS9zcmMvbGliL3V0aWxzLmMKKysrKyBiL3NyYy9saWIvdXRpbHMuYwor
QEAgLTk4LDggKzk4LDEyIEBAIHVpbnQ2NF90IGdldF91aW50NjQoY29uc3QgY2hhciAqcGF0aCwg
dWludDY0X3QgZGVmdmFsLCBjb25zdCBjaGFyICpuYW1lKQorIAlpZiAoIXApCisgCQlyZXR1cm4g
ZGVmdmFsOworIAorLQlzdHJfdG91bCgmZGVmdmFsLCBwLCBOVUxMLCAxNik7CistCXJldHVybiBk
ZWZ2YWw7CisrCWVycm5vID0gMDsKKysJdWludDY0X3QgdCA9IHN0cnRvdWxsKHAsIE5VTEwsIDE2
KTsKKysKKysJaWYgKGVycm5vKQorKwkJcmV0dXJuIGRlZnZhbDsKKysJcmV0dXJuIHQ7CisgfQor
IAorIGludCBnZXRfaW50KGNvbnN0IGNoYXIgKnBhdGgsIGludCBkZWZ2YWwsIGNvbnN0IGNoYXIg
Km5hbWUpCistLSAKKzIuNDMuMAorCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
