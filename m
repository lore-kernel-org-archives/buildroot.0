Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966A6C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499074139E;
	Thu, 27 Jun 2024 10:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix859NmNq7KW; Thu, 27 Jun 2024 10:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC5D414BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC5D414BD;
	Thu, 27 Jun 2024 10:34:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB3C1BF977
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B99941A92
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 10:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnxbk5PRsfE3 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 10:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=spersvold@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCB9140162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB9140162
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB9140162
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 10:34:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so22755721fa.1
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 03:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719484491; x=1720089291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BgnaNsNshl9xjg4coJOm/yVD04RZ1MjxbgwoYb2Khw0=;
 b=t4c7Vh7rMsPqvTKfqzJS7S8G+Ac39MXwK41ds4oYT8Bj0teq4fThxkxPJywmhyX8SE
 rPmaFrEaqRunqzXFAfi7PZE2fjwlM9I1iqKM7MHtWmHJf3iBMYQKNLO73SP8iFKUusVL
 +9ACMb2Fp6f3afH3I395QgdKtcgf6I6J227lyRVUpnDixdRQ+48XJJPczSczmRBXgNjl
 6119G0l3J8S3gc+iT5jFh8Dsf5gO9PbJ4yn+xlqHKSOordpc/pWYJes+g56bh0FC4mQZ
 fQeKcUABl0rkA96/ya9Vz0KDqzr43Br1XPn3u/8G02eHtbXSVeFoZBqTv85UNEBP8wdv
 cCMg==
X-Gm-Message-State: AOJu0Yzq27nBnmB9rz7jx9TBZOByqP4b23K/mIcpKZ0lWFO2Xdq9L6Ia
 0GE6qmyampXse1nEAi8FeI0noQ8OGxq8CclbR8+rC2ckpGrjsAvWw6B98w==
X-Google-Smtp-Source: AGHT+IEBXtfLHNfoaWxWD2D1kialMqUTJ3L8ehlXkUW3Tk7FcEK5cbXNCoGrN6iP093BZhD0//09bw==
X-Received: by 2002:a2e:9887:0:b0:2ea:7d8f:8d12 with SMTP id
 38308e7fff4ca-2ec595879ffmr82981241fa.48.1719484489164; 
 Thu, 27 Jun 2024 03:34:49 -0700 (PDT)
Received: from SP-RaptorLake.dyn.int.numascale.com (fwa5c4a-112.bb.online.no.
 [88.92.74.112]) by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2ee4d4ab9edsm548231fa.62.2024.06.27.03.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 03:34:48 -0700 (PDT)
From: Steffen Persvold <spersvold@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 12:34:40 +0200
Message-Id: <20240627103440.27982-1-spersvold@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719484491; x=1720089291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BgnaNsNshl9xjg4coJOm/yVD04RZ1MjxbgwoYb2Khw0=;
 b=OY36SE1UE5yqw0Cg1dYgTzTYG6sqsmkb48lp1WY/fkx4kcQcO2UJgZ0uPlVMqokqHJ
 866GxXoW0DkkQVToQPcg9rsHW1duzmXybDAmaiPIIE3jF/Xg40P+BgXI8TFTXdqxHhkA
 kQxiAEQNtyN+0irYIiPAMZsz1eMeka0geGgTsLCsmnai9jS6SJY2j9ZZO4r/ELG7+H7J
 YLDxIwchM7Ea1sIsDxMpps6ty4YOf3Aj7XUtxTIDZxKjFK6hyUGUlP+H7mxCWiuC7WC/
 v82/1UNqjHz4WRebDm11MsQ3ND1iBj/YrfRkdjB7mn6L04KZb0dn9Fs/1/wY3tR0j//1
 R/0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OY36SE1U
Subject: [Buildroot] [PATCH] dhrystone: add patch with forward declarations
 for functions
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
Cc: Steffen Persvold <spersvold@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDMTQgd2lsbCBnaXZlIGVycm9ycyBmb3IgbWlzc2luZyBmdW5jdGlvbiBkZWNsYXJhdGlvbnMg
YW5kCm1pc3NpbmcgcmV0dXJuIHR5cGVzIDoKCmRocnlfMS5jOjc1OjE6IGVycm9yOiByZXR1cm4g
dHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgWy1XaW1wbGljaXQtaW50XQogICA3NSB8IG1haW4o
aW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCBefn5+CmRocnlfMS5jOiBJbiBmdW5jdGlv
biDigJhtYWlu4oCZOgpkaHJ5XzEuYzoxNTk6NTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmFByb2NfNeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KICAxNTkgfCAgICAgUHJvY181KCk7CiAgICAgIHwgICAgIF5+fn5+fgoKU2lnbmVkLW9mZi1i
eTogU3RlZmZlbiBQZXJzdm9sZCA8c3BlcnN2b2xkQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL2Ro
cnlzdG9uZS8wMDA2LWZ3ZC1kZWNsLnBhdGNoIHwgMTIxICsrKysrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2RocnlzdG9uZS8wMDA2LWZ3ZC1kZWNsLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9kaHJ5c3RvbmUvMDAwNi1md2QtZGVjbC5wYXRjaCBiL3BhY2thZ2UvZGhyeXN0b25lLzAw
MDYtZndkLWRlY2wucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLjgz
MGE3MDRjCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9kaHJ5c3RvbmUvMDAwNi1md2QtZGVj
bC5wYXRjaApAQCAtMCwwICsxLDEyMSBAQAorZGlmZiAtLWdpdCBhL2RocnlfMS5jIGIvZGhyeV8x
LmMKK2luZGV4IDNlZDE3MTZiLi42MWMzZDkwOCAxMDA2NDQKKy0tLSBhL2RocnlfMS5jCisrKysg
Yi9kaHJ5XzEuYworQEAgLTMyLDYgKzMyLDcgQEAgaW50ICAgICAgICAgICAgIEFycl8yX0dsb2Ig
WzUwXSBbNTBdOworIGV4dGVybiBjaGFyICAgICAqbWFsbG9jICgpOworICNlbmRpZgorIEVudW1l
cmF0aW9uICAgICBGdW5jXzEgKCk7CisrQm9vbGVhbiAgICAgICAgIEZ1bmNfMiAoKTsKKyAgIC8q
IGZvcndhcmQgZGVjbGFyYXRpb24gbmVjZXNzYXJ5IHNpbmNlIEVudW1lcmF0aW9uIG1heSBub3Qg
c2ltcGx5IGJlIGludCAqLworIAorICNpZm5kZWYgUkVHCitAQCAtNzEsOCArNzIsMTcgQEAgZmxv
YXQgICAgICAgICAgIE1pY3Jvc2Vjb25kcywKKyAKKyAvKiBlbmQgb2YgdmFyaWFibGVzIGZvciB0
aW1lIG1lYXN1cmVtZW50ICovCisgCistCistbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQor
Ky8qIGZvcndhcmQgZGVjbGFyYXRpb25zICovCisrdm9pZCBQcm9jXzEgKCk7Cisrdm9pZCBQcm9j
XzIgKCk7Cisrdm9pZCBQcm9jXzMgKCk7Cisrdm9pZCBQcm9jXzQgKCk7Cisrdm9pZCBQcm9jXzUg
KCk7Cisrdm9pZCBQcm9jXzYgKCk7Cisrdm9pZCBQcm9jXzcgKCk7Cisrdm9pZCBQcm9jXzggKCk7
CisrCisraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyAvKioqKiovCisgCisgICAv
KiBtYWluIHByb2dyYW0sIGNvcnJlc3BvbmRzIHRvIHByb2NlZHVyZXMgICAgICAgICovCitAQCAt
Mjk1LDcgKzMwNSw3IEBAIG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyB9CisgCisgCist
UHJvY18xIChQdHJfVmFsX1BhcikKKyt2b2lkIFByb2NfMSAoUHRyX1ZhbF9QYXIpCisgLyoqKioq
KioqKioqKioqKioqKi8KKyAKKyBSRUcgUmVjX1BvaW50ZXIgUHRyX1ZhbF9QYXI7CitAQCAtMzI5
LDcgKzMzOSw3IEBAIFJFRyBSZWNfUG9pbnRlciBQdHJfVmFsX1BhcjsKKyB9IC8qIFByb2NfMSAq
LworIAorIAorLVByb2NfMiAoSW50X1Bhcl9SZWYpCisrdm9pZCBQcm9jXzIgKEludF9QYXJfUmVm
KQorIC8qKioqKioqKioqKioqKioqKiovCisgICAgIC8qIGV4ZWN1dGVkIG9uY2UgKi8KKyAgICAg
LyogKkludF9QYXJfUmVmID09IDEsIGJlY29tZXMgNCAqLworQEAgLTM1Miw3ICszNjIsNyBAQCBP
bmVfRmlmdHkgICAqSW50X1Bhcl9SZWY7CisgfSAvKiBQcm9jXzIgKi8KKyAKKyAKKy1Qcm9jXzMg
KFB0cl9SZWZfUGFyKQorK3ZvaWQgUHJvY18zIChQdHJfUmVmX1BhcikKKyAvKioqKioqKioqKioq
KioqKioqLworICAgICAvKiBleGVjdXRlZCBvbmNlICovCisgICAgIC8qIFB0cl9SZWZfUGFyIGJl
Y29tZXMgUHRyX0dsb2IgKi8KK0BAIC0zNjcsNyArMzc3LDcgQEAgUmVjX1BvaW50ZXIgKlB0cl9S
ZWZfUGFyOworIH0gLyogUHJvY18zICovCisgCisgCistUHJvY180ICgpIC8qIHdpdGhvdXQgcGFy
YW1ldGVycyAqLworK3ZvaWQgUHJvY180ICgpIC8qIHdpdGhvdXQgcGFyYW1ldGVycyAqLworIC8q
KioqKioqLworICAgICAvKiBleGVjdXRlZCBvbmNlICovCisgeworQEAgLTM3OSw3ICszODksNyBA
QCBQcm9jXzQgKCkgLyogd2l0aG91dCBwYXJhbWV0ZXJzICovCisgfSAvKiBQcm9jXzQgKi8KKyAK
KyAKKy1Qcm9jXzUgKCkgLyogd2l0aG91dCBwYXJhbWV0ZXJzICovCisrdm9pZCBQcm9jXzUgKCkg
Lyogd2l0aG91dCBwYXJhbWV0ZXJzICovCisgLyoqKioqKiovCisgICAgIC8qIGV4ZWN1dGVkIG9u
Y2UgKi8KKyB7CitAQCAtMzk5LDUgKzQwOSwzIEBAIHJlZ2lzdGVyIGludCAgICBsOworICAgICAg
ICAgd2hpbGUgKGwtLSkgKmQrKyA9ICpzKys7CisgfQorICNlbmRpZgorLQorLQorZGlmZiAtLWdp
dCBhL2RocnlfMi5jIGIvZGhyeV8yLmMKK2luZGV4IDYzYTNkM2VhLi4yMzQ4NmM2YyAxMDA2NDQK
Ky0tLSBhL2RocnlfMi5jCisrKysgYi9kaHJ5XzIuYworQEAgLTI2LDggKzI2LDkgQEAKKyBleHRl
cm4gIGludCAgICAgSW50X0dsb2I7CisgZXh0ZXJuICBjaGFyICAgIENoXzFfR2xvYjsKKyAKKytC
b29sZWFuIEZ1bmNfMyAoKTsKKyAKKy1Qcm9jXzYgKEVudW1fVmFsX1BhciwgRW51bV9SZWZfUGFy
KQorK3ZvaWQgUHJvY182IChFbnVtX1ZhbF9QYXIsIEVudW1fUmVmX1BhcikKKyAvKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqLworICAgICAvKiBleGVjdXRlZCBvbmNlICovCisgICAg
IC8qIEVudW1fVmFsX1BhciA9PSBJZGVudF8zLCBFbnVtX1JlZl9QYXIgYmVjb21lcyBJZGVudF8y
ICovCitAQCAtNjEsNyArNjIsNyBAQCBFbnVtZXJhdGlvbiAqRW51bV9SZWZfUGFyOworIH0gLyog
UHJvY182ICovCisgCisgCistUHJvY183IChJbnRfMV9QYXJfVmFsLCBJbnRfMl9QYXJfVmFsLCBJ
bnRfUGFyX1JlZikKKyt2b2lkIFByb2NfNyAoSW50XzFfUGFyX1ZhbCwgSW50XzJfUGFyX1ZhbCwg
SW50X1Bhcl9SZWYpCisgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKiovCisgICAgIC8qIGV4ZWN1dGVkIHRocmVlIHRpbWVzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAqLworICAgICAvKiBmaXJzdCBjYWxsOiAgICAgIEludF8xX1Bhcl9W
YWwgPT0gMiwgSW50XzJfUGFyX1ZhbCA9PSAzLCAgKi8KK0BAIC04MSw3ICs4Miw3IEBAIE9uZV9G
aWZ0eSAgICAgICpJbnRfUGFyX1JlZjsKKyB9IC8qIFByb2NfNyAqLworIAorIAorLVByb2NfOCAo
QXJyXzFfUGFyX1JlZiwgQXJyXzJfUGFyX1JlZiwgSW50XzFfUGFyX1ZhbCwgSW50XzJfUGFyX1Zh
bCkKKyt2b2lkIFByb2NfOCAoQXJyXzFfUGFyX1JlZiwgQXJyXzJfUGFyX1JlZiwgSW50XzFfUGFy
X1ZhbCwgSW50XzJfUGFyX1ZhbCkKKyAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLworICAgICAvKiBleGVjdXRlZCBv
bmNlICAgICAgKi8KKyAgICAgLyogSW50X1Bhcl9WYWxfMSA9PSAzICovCitAQCAtMTg5LDQgKzE5
MCwzIEBAIEVudW1lcmF0aW9uIEVudW1fUGFyX1ZhbDsKKyAgIGVsc2UgLyogbm90IGV4ZWN1dGVk
ICovCisgICAgIHJldHVybiAoZmFsc2UpOworIH0gLyogRnVuY18zICovCistCi0tIAoyLjQwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
