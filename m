Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A1CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAEF261040
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAEF261040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4439E80DC8;
	Sun, 24 Oct 2021 18:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9EnV3Vx2P7k; Sun, 24 Oct 2021 18:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD23B80EE2;
	Sun, 24 Oct 2021 18:13:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 732641BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FA9C400F5
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kErnB9d40bFq for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A78A6400F4
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:13:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id n1so6185364edd.0
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9GHzBGWh/F5Lw14o1+/dJ8CEma9y9SQB12rOJX1k6gk=;
 b=MSazbVo9NNAJ8IOJq/lWDvy6QNKnOHni8+lTYzHAnpO0yeloZdlueDINXNoRH20o9b
 2HlD8qo/Csrc1Wx+GSzgLm/q8+14oVmTh/VLDPgkmpbXKrZUIPf1KGU7FhlW1LEK+hgg
 4Km47CdKDJky4wgWvNEuvBF2zlCxlKqnJFqsSnxxXhiYs2y25TEIN/60JJbQ4+q0q9/z
 dXmYPNrlQTcXc9k4A6S4X+SpTVNEs1+MA5cMDtXVJci9NeRdyox9D95QDVhWXhao7kH5
 3eb0qZlOtZJ0tMqgGlOIAMviMzMcLMqOeGTqwI8DMsxANfDXmFyv9KAvYzrwEPq/1xGw
 KTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9GHzBGWh/F5Lw14o1+/dJ8CEma9y9SQB12rOJX1k6gk=;
 b=sCExnnpkDlbg6W6LoNd26SNUJh0RQ2aIw71TwslZRetlbsxirdjhf9Cavd63gSza7b
 iQV71U+W8zqe/wYqiTDR8YMtKEEOeg7maOdweYXNFXpcda4A17Mn6IGi1Crdt2R6fre9
 2WgHD7cGob/t0bLibiI4JCb+UXsXdt+WQnW2KYmA5vkynLAQA7JT7abuQRcb5lrB4kVH
 q082J0rFpWdsewCrhTz55DTRcT7+PomwWRRuUgjvgQ54K3hg+F23ZN10Ga1ke6RCN6Wo
 s17hHsYHNTdfWnSqFoR1Umx6nYQFKQe07m0fMYZZFZ0ch9jZf8j6ea1tog6eTn3B2/W/
 kqNQ==
X-Gm-Message-State: AOAM533kNyDJyQd+CaOF9Mn/M9NsSjm9Ih/uI5bafQO+55MLAVQbrSHA
 vMprBzjotBhT+tk/n/4zP5RjM4yrkcxGzk22
X-Google-Smtp-Source: ABdhPJwhIWbiz9MUL0qW1qv4ym3VtmmL6Kp2Qy0CANDi99bdY96QaBN5DDtzwuyRoBkFAsHlbMteZw==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr19831528edt.282.1635099196686; 
 Sun, 24 Oct 2021 11:13:16 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id v15sm7555367edi.89.2021.10.24.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:13:16 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:12:16 +0200
Message-Id: <20211024181221.2608908-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] support/testing: add new test for
 python-botocore
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcnVkaW1lbnRhcnkgdGVzdCBpbnNwaXJlZCBmcm9tIHRoZSAiVXNpbmcgYm90b2NvcmUi
IHNlY3Rpb24gaW4KdGhlIHBhY2thZ2UgUkVBRE1FIChbMV0pLgoKTm90ZSB0aGF0IGl0IGRvZXNu
J3QgdHJ5IHRvIHVzZSB0aGUgaW5zdGFudGlhdGVkIGNsaWVudCwgYXMgdGhpcyB3b3VsZApyZXF1
aXJlIGEgbmV0d29yayBjb25uZWN0aW9uIHdoZW4gdGhlIHRlc3QgcnVucy4KClsxXTogaHR0cHM6
Ly9naXRodWIuY29tL2JvdG8vYm90b2NvcmUKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxv
dHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fYm90b2NvcmUucHkgIHwgIDMgKysrCiAuLi4vdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5ICAgIHwgMTIgKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG9jb3JlLnB5CiBjcmVh
dGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
Ym90b2NvcmUucHkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9z
YW1wbGVfcHl0aG9uX2JvdG9jb3JlLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9ib3RvY29yZS5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi5jYzQwNTU5ODlmCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9ib3RvY29yZS5weQpAQCAtMCwwICsxLDMgQEAKK2lt
cG9ydCBib3RvY29yZS5zZXNzaW9uCitzZXNzaW9uID0gYm90b2NvcmUuc2Vzc2lvbi5nZXRfc2Vz
c2lvbigpCitjbGllbnQgPSBzZXNzaW9uLmNyZWF0ZV9jbGllbnQoJ2VjMicsIHJlZ2lvbl9uYW1l
PSJ1cy1lYXN0LTEiKQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fYm90b2NvcmUucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9ib3RvY29yZS5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi42MzM2YzU2NThmCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9weXRob25fYm90b2NvcmUucHkKQEAgLTAsMCArMSwxMiBAQAorZnJvbSB0
ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJhc2UKKwor
CitjbGFzcyBUZXN0UHl0aG9uUHkzQm90b2NvcmUoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKKyAg
ICBfX3Rlc3RfXyA9IFRydWUKKyAgICBjb25maWcgPSBUZXN0UHl0aG9uUGFja2FnZUJhc2UuY29u
ZmlnICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15CisgICAg
ICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9CT1RPQ09SRT15CisgICAgICAgICIiIgorICAgIHNhbXBs
ZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYm90b2NvcmUucHkiXQor
ICAgIHRpbWVvdXQgPSAxMAotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
