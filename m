Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446CCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 07:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2298404FF;
	Thu,  2 Jun 2022 07:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Qi0rvW4jSDv; Thu,  2 Jun 2022 07:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C530740289;
	Thu,  2 Jun 2022 07:35:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D47401BF855
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 07:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A05607CA
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxoz_rDqJQxS for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 07:35:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60D7B607C0
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 07:35:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q1so4367350ljb.5
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unikie.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V8RLP5j7C6mPeqUzn+HzYV5cAfKjn5jerbAG8ZvgRjk=;
 b=f6gaLEZUaSqQZfsGINYFoAUT/RUSAHGvDaO9KTRF38zQauZTG1JLRDSWN7iTadMuXy
 b2JmNX1xiAgT293bvG0bD2wtRupV+sQ9/WicCli133sTC/1y+QjyEnktfQQ6jsWv+odX
 s/+V8m0svCLlNd+wJkBEsfQ0JvzgzzSwH4ZzXGR/UBld5T99Cyq2OkcKhOceVQt8vlf7
 nt8RfMZ0TS1ti3FRGEMKEu7x+5oHstMq4gkSjuN1M16Xd0PVW79orU7CTJUuR2Gb/SAR
 6PvFsp+Eo9rDS1rvZlMpb2AB1JSd2S0RJNuPd7sbEGx15FNdgZIfv/O+QX+esDQ7KY6P
 nU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V8RLP5j7C6mPeqUzn+HzYV5cAfKjn5jerbAG8ZvgRjk=;
 b=0VCe0VPEuqmW/iybc0V8B2DWfIGj4Soz+1yTSav7B0l37+kaYZcOBgU2eEwAYdMSR/
 l6kyvVybxL4Sy9MBlpN22xKItJUGlww9SxfTYxJwLQztBu40/rBOUqBX7uC1THK8MO09
 sGBlAlTWiHDevV+wJjSOWqu7QKnr5/1ZOVVCCxwFTSGFqZD20G5tLeSDchwVkxyv19+8
 d6mX8RD9YpnkCik7COhm26/3BBX0ZLycf1rAm2JT7aEVs08vqlNcMm6+PI0z8cQDvG+S
 HdV+cpWz50ik2LLuIiBQlkg4dserQLaQU/bM3zgP0n9FLvZ/QqBhZk7xWqg+s8jYzK8Q
 0/Cw==
X-Gm-Message-State: AOAM530TXMRlkoN4UmomKrHKzJYb+gQ3iGvIzFoMPdxnmqV/0uFBYmm1
 xRat5Vu9fs299L9YTlfPt/d+IXqeKbrM6O9nIpfDbQ==
X-Google-Smtp-Source: ABdhPJxtxYdb7JqjeuqhGyHiJDAdM00j1wJiGCEQPbWH6KO+f5Q2tIp/eGJ7OKsaPfcqnl2HRSDAeA==
X-Received: by 2002:a05:651c:90b:b0:254:1c1:7f95 with SMTP id
 e11-20020a05651c090b00b0025401c17f95mr25718231ljq.267.1654155347902; 
 Thu, 02 Jun 2022 00:35:47 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (91-157-106-8.elisa-laajakaista.fi. [91.157.106.8])
 by smtp.googlemail.com with ESMTPSA id
 be34-20020a056512252200b0047255d2111csm881510lfb.75.2022.06.02.00.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:35:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 10:35:46 +0300
Message-Id: <20220602073546.557932-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-alembic: new package
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
From: =?utf-8?q?Jos=C3=A9_Pekkarinen_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5j
b20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
KwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFj
a2FnZS9weXRob24tYWxlbWJpYy9Db25maWcuaW4gICAgICAgICAgIHwgIDcgKysrKysrKwogcGFj
a2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5oYXNoIHwgIDUgKysrKysKIHBhY2th
Z2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMubWsgICB8IDE0ICsrKysrKysrKysrKysr
CiA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3B5dGhvbi1hbGVtYmljL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMubWsKCmRpZmYgLS1naXQgYS9E
RVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBjMzM5NTlmYTQ1Li4yODJmZWI4YWRmIDEwMDY0
NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE1MzgsNiArMTUzOCw3IEBA
IE46CUpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgogRjoJcGFj
a2FnZS9hbGZyZWQvCiBGOglwYWNrYWdlL2JteDcvCiBGOglwYWNrYWdlL3B5dGhvbi1hZXhwZWN0
LworRjoJcGFja2FnZS9weXRob24tYWxlbWJpYy8KIEY6CXBhY2thZ2Uvc29mdGhzbTIvCiBGOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2FleHBlY3QucHkKIEY6
CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2FleHBlY3QucHkKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggODg5
MjEzNDEzMy4uNTg2NmVkNjllOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9Db25maWcuaW4KQEAgLTkyOSw2ICs5MjksNyBAQCBtZW51ICJFeHRlcm5hbCBweXRo
b24gbW9kdWxlcyIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFpb3J3bG9jay9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1haW9zaWduYWwvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9weXRob24tYWlvemlwa2luL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWFsZW1iaWMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tYWxzYWF1ZGlv
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFuc2ljb2xvcnMvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9weXRob24tYXJnaC9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1hbGVtYmljL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMv
Q29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE1M2RkZTdm
N2YKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1hbGVtYmljL0NvbmZpZy5pbgpA
QCAtMCwwICsxLDcgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQUxFTUJJQworCWJvb2wg
InB5dGhvbi1hbGVtYmljIgorCWhlbHAKKwkgIEFsZW1iaWMgaXMgYSBkYXRhYmFzZSBtaWdyYXRp
b25zIHRvb2wgd3JpdHRlbiBieSB0aGUgYXV0aG9yCisJICBvZiBTUUxBbGNoZW15LgorCisJICBo
dHRwczovL2FsZW1iaWMuc3FsYWxjaGVteS5vcmcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0
aG9uLWFsZW1iaWMuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44
ZjVjYmI2ZmEzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRo
b24tYWxlbWJpYy5oYXNoCkBAIC0wLDAgKzEsNSBAQAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBz
Oi8vcHlwaS5vcmcvcHlwaS9hbGVtYmljL2pzb24KK21kNSAgNDRlODIzNDFhNmVlMGE0MmY2M2Rj
MWY1MWNhZjkxZTYgIGFsZW1iaWMtMS43LjcudGFyLmd6CitzaGEyNTYgIDQ5NjEyNDgxNzNlYWQ3
Y2U4YTIxZWZiM2RlMzc4ZjEzYjgzOThlNjYzMGZhYjBlYjI1OGRjNzRhOGFmMjRjNTggIGFsZW1i
aWMtMS43LjcudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hh
MjU2ICBmMGUzZjdhNTA4MDg3OWNjYWU3OTg4ODJkOWJlZTNkNDhmZTMzNWQwYmFkODRjYThlZWM4
NmZhNTk0Mzc1ZWEwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1hbGVtYmlj
L3B5dGhvbi1hbGVtYmljLm1rIGIvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJp
Yy5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44YmEzMjY0N2FiCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5t
awpAQCAtMCwwICsxLDE0IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBweXRob24t
YWxlbWJpYworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX0FMRU1CSUNfVkVS
U0lPTiA9IDEuNy43CitQWVRIT05fQUxFTUJJQ19TT1VSQ0UgPSBhbGVtYmljLSQoUFlUSE9OX0FM
RU1CSUNfVkVSU0lPTikudGFyLmd6CitQWVRIT05fQUxFTUJJQ19TSVRFID0gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzMwL2I5LzU1MjZiNDNhNGM1NGQxNzdhYjE0YWYw
YWY0YjVjMzFkNzNkYjMzZDFhZDNlMzA5NzZkM2IwMjNlMDU5NAorUFlUSE9OX0FMRU1CSUNfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9BTEVNQklDX0xJQ0VOU0UgPSBNSVQKK1BZVEhP
Tl9BTEVNQklDX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCisKKyQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
