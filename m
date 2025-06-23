Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4962DC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 15:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 081BD4053E;
	Mon, 23 Jun 2025 15:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQ_abp8XQg1o; Mon, 23 Jun 2025 15:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23D1140413
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D1140413;
	Mon, 23 Jun 2025 15:14:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F186B443
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 15:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2AA481F55
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 15:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_JJGa8LKNQ9 for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 15:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE49F82106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE49F82106
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE49F82106
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 15:14:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so38853835e9.0
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750691693; x=1751296493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1g3plen8ElaF/3RNnN5Pjp914D13LzCjrB0/fvEUv8=;
 b=TbUblMkK0jhGYeuqlYGBq/drzJtaNxyjd9HN189NrtOaO9ru7if0+czyBZYz4/1hfp
 s8o9JnkN66y4G43aM5tQCKMNze4+OZfCbGvrjv3Wnw3YXRuAblYDDuFOG8xHJOpds/Jh
 rO8UshxKmJVqIH29dPD0rSOcFwsoIsyHDbwzrxj8eXlmKag/nb0E9KPl9Q+10Gwyvp+e
 57FLreyRfXj95wz3VQrHncFV6YZsAAo2KrvYvSbEl3sUoYWlwKrPCeLL3yj9vlC1wFBz
 Acw5xaijGteU2MniKdZrmMblGPdEKlzu1gwSnFp1E1Nbjb0WyzQAmtURxA6fiYirct3P
 JhyQ==
X-Gm-Message-State: AOJu0YxjMNSqd/x1QI4BlHtd4y2KQlKkFJMvwZ/9Bk47pFtS3HuSAdDb
 pkhoTboxc8GWjzpOUHZwdi1Er7vJcRl5wvrCCLE9Q4YswuAT4+/R/tXzSklAXBnS2SE3kDtbPlC
 ATitjEbs=
X-Gm-Gg: ASbGncs4JmgTDUsJPHtXdJPQK1rXuwjEIvaebgdqpN30IylwVsadJCZsWSL7j4Nxvek
 mp9bi92Cxmbhy1SfqoIJwSYKYI9UqbaoG91NuSwFxLxXP0dWjScNxmVnzB7ZLZ9aozBSHy7rdxC
 XN7pGS0lkX2pkZ+8LaHwGQpsu44ZY//0iYWQBGpX5mK4oA3/WeszvTNRvrsbhmvLb33eHIBKqQY
 CVtpcoxz8mxJkxX45Yctfk7eE0v2AIjM3y7ET4XfiZeEWecUUDM0wnKYSi2EKDGuZiCQ7JAjGDS
 hQkLs/0dBjsFLgnZu5RHYTUVMmsblBeA1tigCQ/I2m5aZWAAIt2F3hQRZjxM3L/PMoByGA307oJ
 jCAHKNQ==
X-Google-Smtp-Source: AGHT+IFEExTqC3ZMBdeqqeK3t61iPHqgNn7Hr4HEA7TUK1pqzV894/3G1ty8dH04xHVRCmGtWkxsNQ==
X-Received: by 2002:a05:600c:c10b:b0:453:483b:626c with SMTP id
 5b1f17b1804b1-453660bf3f8mr77553185e9.23.1750691693508; 
 Mon, 23 Jun 2025 08:14:53 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d117c5f2sm9982113f8f.55.2025.06.23.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 08:14:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Mon, 23 Jun 2025 17:14:46 +0200
Message-ID: <20250623151447.59002-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750691693; x=1751296493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y1g3plen8ElaF/3RNnN5Pjp914D13LzCjrB0/fvEUv8=;
 b=BQxR1f+qxFWPrdGNJdsfuYP9Xl8KwgcuZ3eJjCBnMn+0bFmuaxUS5qzak6GNjrgE/0
 kbMAUrMs1UMKG/Rzq7kFmNR0Bl7x0HpgUfvsAP+Q85i9B4a92eYVI9U4Y1eZVclLaRlX
 p0wf4Dc2RRkZXo86F0bEk7uLtvizJlkNgvruyHgmktBkgh3G1Qxr5QjXItmNVS/ntZFI
 Pi+W33lUQWpvw1VRzjNNznKBVi/282RwldYzicWaYDk2kTjHxfCO/KQfoGZAAUR8DDU5
 1Uo3s7i14bwA3yPnsrOkwsT0M97MA9op7nJkEVxYCzMlfmqbNjXJvM62Adnle/Xw/fog
 A4LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BQxR1f+q
Subject: [Buildroot] [PATCH 1/1] utils/check-package: set the default
 ignore_filename
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

Q3VycmVudGx5LCBwa2ctc3RhdHMgZG9lcyBub3QgdXNlIHRoZSAuY2hlY2twYWNrYWdlaWdub3Jl
IGZpbGUgd2hlbiBpdApjaGVja3MgZm9yIHBhY2thZ2Ugd2FybmluZ3MuCkFzIGEgY29uc2VxdWVu
Y2UsIGl0IHJlcG9ydHMgbWFueSB3YXJuaW5ncyB0aGF0IGluIEJ1aWxkcm9vdCB3ZQphbHJlYWR5
IGRlY2lkZWQgdG8gaWdub3JlIG9uIGEgY2FzZS1ieS1jYXNlIGJhc2lzLiBJbiB0dXJuLCB0aGlz
IGxlYWRzCnRvIHBvbGx1dGlvbiBvZiB0aGUgcGtnLXN0YXRzIHJlc3VsdHMgYW5kIGRpc3RyYWN0
cyB1cyBmcm9tIHRoZSByZWFsCndhcm5pbmdzLgoKVGhlcmUgYXJlIHR3byBwb3NzaWJpbGl0aWVz
OiBlaXRoZXIgd2UgaGF2ZSB0byB0ZWxsIHBrZy1zdGF0cyB3aGljaApmaWxlIHRvIHVzZSwgb3Ig
d2UgaGF2ZSB0byBjaGFuZ2UgdGhlIGNoZWNrLXBhY2thZ2UgZGVmYXVsdC4KClVwb24gcmVhZGlu
ZyAidXRpbHMvcmVhZG1lLnR4dCIsIGl0IHR1cm5zIG91dCBpdCBpcyBhbHJlYWR5IHN1cHBvc2Vk
CnRvIHVzZSBhIGRlZmF1bHQgZmlsZSBhcyB0aGUgZm9sbG93aW5nIGlzIHNhaWQgYWJvdXQgY2hl
Y2stcGFja2FnZToKSXQgY2hlY2tzIHRoZSAuY2hlY2twYWNrYWdlaWdub3JlIGZpbGUgaWYgZXJy
b3JzIHNob3VsZCBiZSBpZ25vcmVkIGFuZAplcnJvcnMgaWYgdGhlcmUncyBhIGZpbGUgbGlzdGVk
IHRoYXQgZG9lc24ndCBwcm9kdWNlIGFuIGVycm9yLgoKVGhlIGhlbHAgdGV4dCBmb3IgJy0taWdu
b3JlLWxpc3QnIGluIGNoZWNrLXBhY2thZ2UgYWxzbyBjb25maXJtcyBpdDoKJ292ZXJyaWRlIHRo
ZSBkZWZhdWx0IGxpc3Qgb2YgaWdub3JlZCB3YXJuaW5ncycuIFRoaXMgaW5jb2hlcmVuY2UgaGFz
CmJlZW4gcHJlc2VudCBzaW5jZSB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBvcHRpb24gaW4gY29t
bWl0CmRkZjQ1ODZiMDBhOTdjNDFjNGFkNGQ1MGRhNDI4MmM2Mjk0MGMwNWIgKCJ1dGlscy9jaGVj
ay1wYWNrYWdlOgpkZWNvdXBsZSBhZGRpbmcgcnVsZXMgZnJvbSBmaXhpbmcgYWxsIGludHJlZSBm
aWxlcyIpCgpUbyBmaXggaXQsIHNldCB0aGUgZGVmYXVsdCBmaWxlbmFtZSBpbiBjaGVjay1wYWNr
YWdlIHNvIHRoYXQgaXQKbWF0Y2hlcyB0aGUgaGVscCB0ZXh0LgpUaGUgTWFrZWZpbGUgaXMgYWxz
byB1cGRhdGVkIGFjY29yZGluZ2x5LgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIE1ha2VmaWxlICAgICAgICAgICAgfCAzICst
LQogdXRpbHMvY2hlY2stcGFja2FnZSB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxl
CmluZGV4IDI2ZGIxNzY2NzQuLjRiYzBlNDY2MGQgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBi
L01ha2VmaWxlCkBAIC0xMjYwLDggKzEyNjAsNyBAQCBwcmludC12ZXJzaW9uOgogCUBlY2hvICQo
QlIyX1ZFUlNJT05fRlVMTCkKIAogY2hlY2stcGFja2FnZToKLQkkKFEpLi91dGlscy9jaGVjay1w
YWNrYWdlIGBnaXQgbHMtdHJlZSAtciAtLW5hbWUtb25seSBIRUFEYCBcCi0JCS0taWdub3JlLWxp
c3Q9JChUT1BESVIpLy5jaGVja3BhY2thZ2VpZ25vcmUKKwkkKFEpLi91dGlscy9jaGVjay1wYWNr
YWdlIGBnaXQgbHMtdHJlZSAtciAtLW5hbWUtb25seSBIRUFEYAogCiAuUEhPTlk6IC5jaGVja3Bh
Y2thZ2VpZ25vcmUKIC5jaGVja3BhY2thZ2VpZ25vcmU6CmRpZmYgLS1naXQgYS91dGlscy9jaGVj
ay1wYWNrYWdlIGIvdXRpbHMvY2hlY2stcGFja2FnZQppbmRleCBhNWVjYzJlZWQ4Li4yMTZiNDcx
MzMxIDEwMDc1NQotLS0gYS91dGlscy9jaGVjay1wYWNrYWdlCisrKyBiL3V0aWxzL2NoZWNrLXBh
Y2thZ2UKQEAgLTEwMSw2ICsxMDEsOSBAQCBkZWYgcGFyc2VfYXJncygpOgogCiAgICAgZmxhZ3Mg
PSBwYXJzZXIucGFyc2VfYXJncygpCiAKKyAgICBpZiBub3QgZmxhZ3MuaWdub3JlX2ZpbGVuYW1l
OgorICAgICAgICBmbGFncy5pZ25vcmVfZmlsZW5hbWUgPSBvcy5wYXRoLmFic3BhdGgob3MucGF0
aC5qb2luKF9fZmlsZV9fLCAiLi4vLi4vLmNoZWNrcGFja2FnZWlnbm9yZSIpKQorCiAgICAgZmxh
Z3MuaWdub3JlX2xpc3QgPSBnZXRfaWdub3JlZF9wYXJzZXJzX3Blcl9maWxlKGZsYWdzLmludHJl
ZV9vbmx5LCBmbGFncy5pZ25vcmVfZmlsZW5hbWUpCiAKICAgICBpZiBmbGFncy5mYWlsZWRfb25s
eToKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
