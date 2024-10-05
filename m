Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A8CFB421
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 16:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E826D60681;
	Sat,  5 Oct 2024 16:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeW1H86dcdWU; Sat,  5 Oct 2024 16:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE95B60686
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE95B60686;
	Sat,  5 Oct 2024 16:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4AA1BF29C
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6C84026A
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa75yc-5_HYW for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 16:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=damien.thebault@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB144401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB144401F6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB144401F6
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 16:49:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37cdb42b29dso2030571f8f.0
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 09:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728146996; x=1728751796;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nVmRrJyMykuR8cuoKcVPs6T1NMvIrpGJMieAEMetW6Y=;
 b=Yf8ma1lqsaFCPLNVJIN6W/4CeMkDEUTfhNvF/58KVcxnV60+k7mv4I5JsolJKr8YbI
 sdmO0Q6hJGv0XMP7xfsjnc4BK2fzw5vZKRRQHUkxQs7dZ0QETAceZzMd5OjMcMxGMj2p
 r3XR1UTmusjfPwcHYkEMA+gD1+JFGikPZrz6sn5dIgDag631qlBIob1gcq/VAVYa9V0+
 XS2v5Fh6nD0ss06tqGo7uXyHj4XrZP5xzR13B0mgpAA4cjA1yxt5MKPuNmUV6wB0xJYY
 YYLV5mB34zvcA9xI+rxMHOl9XSAxwdjmpN4MdSHTlOkA0pi0vjJSW121fyrqCCmS3B1H
 3XgA==
X-Gm-Message-State: AOJu0YzoVILSfK49Zf9FwdUrKkT31nyjd9cRad0fQGQ7y1U/5wbZAshR
 1RJWY3ztuvZtGoyqBp39BT4TnCwL2So4zZIn38t4WU4PaUEeNofc3Qd5M+Mw
X-Google-Smtp-Source: AGHT+IFaoRmXKIqOjzudRe+hqZMnwyi253lZ6slyK9fKLR9N7AAfr08VKzOT7mHdqoolC+0dQY8OMw==
X-Received: by 2002:a5d:5f53:0:b0:37c:f933:48a9 with SMTP id
 ffacd0b85a97d-37d0e6d317fmr4721315f8f.1.1728146996175; 
 Sat, 05 Oct 2024 09:49:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb00:8121:6900:eab9:ae3f:d132:6595?
 (2a01cb0081216900eab9ae3fd1326595.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8121:6900:eab9:ae3f:d132:6595])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1690f75bsm2076218f8f.23.2024.10.05.09.49.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 09:49:55 -0700 (PDT)
Message-ID: <6134c505-71a2-4a03-9117-20422d5213c8@gmail.com>
Date: Sat, 5 Oct 2024 18:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Damien_Th=C3=A9bault?= <damien.thebault@gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728146996; x=1728751796; darn=buildroot.org;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVmRrJyMykuR8cuoKcVPs6T1NMvIrpGJMieAEMetW6Y=;
 b=R6O/zmo6NW2OJIP3SJ4Q++DgZgLeuJ0TdFWhMhNmio920RdPi7yOQKyBsX5eVWXM81
 zPPVTuSkZyj5a+ki89czEfUABQLGKKENjW4gPvk9U8a1uPbJLGFOwJXg/wmsEMKLlvPU
 p1So0ApKa+EXKUWJiMe21bPyecma7k0B3wDJmAy7akDO2rCwJu2/zl9fOTOAoVLSmvAM
 v2SeE1rGyix8agJ0xc7uqunuxrKDpCsJsyAoGvsjwCMfsG20AU+hw1Rty1KeqS0xEBWW
 ILrXTZB8eAidLmkAfnt0r5Gh+v4t0hDvehw5mDds4XwVyBeng8hiWYcpbYp3zRlPwgNG
 7n8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R6O/zmo6
Subject: [Buildroot] [PATCH] package/linux-pam: remove flex dependency
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGludXgtcGFtIDEuMi4wIHJlbW92ZWQgdGhlIHVzZSBvZiB5eXdyYXAsIHNvIHRoZSBmbGV4IGRl
cGVuZGVuY3kgaXMgbm90Cm5lZWRlZCBub3cgKGhvc3QtZmxleCBpcyBzdGlsbCBuZWVkZWQpLgoK
U2lnbmVkLW9mZi1ieTogRGFtaWVuIFRow6liYXVsdCA8ZGFtaWVuLnRoZWJhdWx0QGdtYWlsLmNv
bT4KLS0tCiBwYWNrYWdlL2xpbnV4LXBhbS9Db25maWcuaW4gICAgfCAxIC0KIHBhY2thZ2UvbGlu
dXgtcGFtL2xpbnV4LXBhbS5tayB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1wYW0vQ29uZmln
LmluIGIvcGFja2FnZS9saW51eC1wYW0vQ29uZmlnLmluCmluZGV4IDFhYTkwNDUzMzMuLjZiMDhh
OWM0YzIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtcGFtL0NvbmZpZy5pbgorKysgYi9wYWNr
YWdlL2xpbnV4LXBhbS9Db25maWcuaW4KQEAgLTUsNyArNSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9MSU5VWF9QQU0KIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKIAlkZXBlbmRzIG9uIEJS
Ml9VU0VfTU1VICMgZm9yaygpCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF80XzkgIyBDMTEvc3RkYXRvbWljLmgKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfRkxFWAogCXNlbGVj
dCBCUjJfUEFDS0FHRV9MSUJYQ1JZUFQgaWYgQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDCiAJaGVs
cAogCSAgQSBTZWN1cml0eSBGcmFtZXdvcmsgdGhhdCBQcm92aWRlcyBBdXRoZW50aWNhdGlvbiBm
b3IKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtcGFtL2xpbnV4LXBhbS5tayBiL3BhY2thZ2Uv
bGludXgtcGFtL2xpbnV4LXBhbS5tawppbmRleCAxNDMzZWIwMGIzLi5hNWI4YzkxNTFmIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0ubWsKKysrIGIvcGFja2FnZS9saW51
eC1wYW0vbGludXgtcGFtLm1rCkBAIC0xNiw3ICsxNiw3IEBAIExJTlVYX1BBTV9DT05GX09QVFMg
PSBcCiAJLS1kaXNhYmxlLXJlZ2VuZXJhdGUtZG9jdSBcCiAJLS1lbmFibGUtc2VjdXJlZGlyPS9s
aWIvc2VjdXJpdHkgXAogCS0tbGliZGlyPS9saWIKLUxJTlVYX1BBTV9ERVBFTkRFTkNJRVMgPSBm
bGV4IGhvc3QtZmxleCBob3N0LXBrZ2NvbmYgXAorTElOVVhfUEFNX0RFUEVOREVOQ0lFUyA9IGhv
c3QtZmxleCBob3N0LXBrZ2NvbmYgXAogCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJYQ1JZUFQpLGxp
YnhjcnlwdCkgXAogCSQoVEFSR0VUX05MU19ERVBFTkRFTkNJRVMpCiBMSU5VWF9QQU1fTElDRU5T
RSA9IEJTRC0zLUNsYXVzZQotLSAKMi40Ni4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
