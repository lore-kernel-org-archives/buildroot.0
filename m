Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB185C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6449640866;
	Sun, 15 Jan 2023 12:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6449640866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqmLnqUXWeGI; Sun, 15 Jan 2023 12:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560AF403CC;
	Sun, 15 Jan 2023 12:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560AF403CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 334DB1BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E6714167D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6714167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Bsg-vxDPAnz for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34C0415DF
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E34C0415DF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx13so3895819ejb.13
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFSOAJw0pGlVv07TmHhcOip2Zgm9qEOwLMCQf3gaYYE=;
 b=vHGna8tBLEcDiDYXhKf+H/VWOp1UhfXxOrPaoM7mL8uR2VLfP+FtYwQmxHc4CCX98u
 rTD1iRMCtz/v6znCFk19SGZ92dV02jEKIHfo6U+OmvBNSjKcTO2zvlW4OTD22g5wRnA7
 9uVfH7znbaNI+4OQ7VUYBql73920GLnoliQ7wjh8rhe3noth/SaKrEQg1loKRb4tZHYs
 gTttsUuCG2br6NS8OuwZNNKHjCpzCdqgQeNgvad3It4Q7ColDqygdVkN4/dOT+r7x+Qr
 vJrK53mxJACQxGUH1jN5ZLQq1ph1eDxjQSigafBALOUuBLhYm5Yx03906XVeBvJU0Azi
 YRhQ==
X-Gm-Message-State: AFqh2krJ1PYk6zsBqOOiRLqmAVymizLalZxM8BN/TidQStGcnp0eOtzr
 XMTDfNyjP//fkaUoENLgyU5roISjTK0=
X-Google-Smtp-Source: AMrXdXvUU568U2xVRhU9pPDNBpWYj3wSai23If3aiMbdjtafkr3aJ23m2TMOREAqmlU6T9rX/LTm0A==
X-Received: by 2002:a17:906:1414:b0:78d:f455:b5dd with SMTP id
 p20-20020a170906141400b0078df455b5ddmr69465886ejc.29.1673787184919; 
 Sun, 15 Jan 2023 04:53:04 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:04 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:46 +0100
Message-Id: <20230115125253.280257-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFSOAJw0pGlVv07TmHhcOip2Zgm9qEOwLMCQf3gaYYE=;
 b=CxHZSIzBE4VDvZr1/iOqLwwBfT6ZsOSsEXhFzPFQbk7NjKdIAJXDIXAcZuJMKH4neN
 ivWYbg6lxtYKVCJuPpazsQPu7zWhHpdC6/utWlaitF/7OAC+kth2XpROE7xgHOZrTp9c
 hz4B2+f940S2iI9n+exovxI5fzkj+xbhE7aAHgxDXvc9OyN8QU5nE1oAI5yV6I50kaya
 IPs/c9lqAs2cyjNY2QgDJrC8s3MHD5AjE9AI1Ay45WnJZcmW/hkBnHyMM/dG+DtgrYZM
 bRGRudzVjXmDv4fex/42gih5CwWrvSeO69a7FaHrB3Non51hq5mOu7pJtRqNHaF0J39o
 S1nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CxHZSIzB
Subject: [Buildroot] [PATCH 1/7] system: introduce a choice for /var
 management
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpDdXJyZW50bHks
IHdlIGhhdmUgYSBzaW5nbGUgc29sdXRpb24gdG8gaGFuZGxlIHRoZSAvdmFyIGNvbnRlbnQgb24g
YQpyZWFkLW9ubHkgcm9vdCBmaWxlc3lzdGVtLCBhbmQgdXNlcnMgY2FuIG9wdCBvdXQgb2YgdXNp
bmcgaXQuCgpXZSdyZSBnb2luZyB0byBpbnRyb2R1Y2UgYW5vdGhlciBzb2x1dGlvbiAoYmFzZWQg
b24gYW4gb3ZlcmxheWZzKSwgd2hpY2gKaXMgaW5jb21wYXRpYmxlIHdpdGggdXNpbmcgdGhlIGZh
Y3RvcnksIHNvIHdlJ2xsIGhhdmUgYSBjaG9pY2Ugb2YgdGhyZWUKbXV0dWFsbHkgZXhjbHVzaXZl
IG9wdGlvbnMuCgpJbnRyb2R1Y2UgdGhhdCBjaG9pY2Ugbm93IHdpdGgganVzdCB0aGUgZXhpc3Rp
bmcgL3ZhciBmYWN0b3J5LCBhbmQgYSBuZXcKb3B0aW9uIHRvIG9wdCBvdXQgb2YgaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+ClNpZ25lZC1v
ZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgpDYzogTm9yYmVy
dCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChF
c3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAc21pbGUuZnI+CkNjIDogSmXMgXJlzIFteSBSb3NlbiA8amVyZW15LnJvc2VuQHNtaWxl
LmZyPgpBY2tlZC1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KLS0tCiBz
eXN0ZW0vQ29uZmlnLmluIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3lzdGVt
L0NvbmZpZy5pbiBiL3N5c3RlbS9Db25maWcuaW4KaW5kZXggODA2YTc0NzMxNS4uODdkZjAzMTU0
NSAxMDA2NDQKLS0tIGEvc3lzdGVtL0NvbmZpZy5pbgorKysgYi9zeXN0ZW0vQ29uZmlnLmluCkBA
IC0xNTYsMTAgKzE1NiwxNiBAQCBlbmRjaG9pY2UKIAogaWYgQlIyX0lOSVRfU1lTVEVNRAogCi1j
b25maWcgQlIyX0lOSVRfU1lTVEVNRF9WQVJfRkFDVE9SWQotCWJvb2wgImJ1aWxkIGEgZmFjdG9y
eSB0byBwb3B1bGF0ZSBhIHRtcGZzIG9uIC92YXIiCi0JZGVmYXVsdCB5ICAjIGxlZ2FjeQorY2hv
aWNlCisJYm9vbCAiL3ZhciBtYW5hZ2VtZW50IgorCWRlZmF1bHQgQlIyX0lOSVRfU1lTVEVNRF9W
QVJfRkFDVE9SWSAgIyBsZWdhY3kKIAlkZXBlbmRzIG9uICFCUjJfVEFSR0VUX0dFTkVSSUNfUkVN
T1VOVF9ST09URlNfUlcKKwloZWxwCisJICBTZWxlY3QgaG93IEJ1aWxkcm9vdCBwcm92aWRlcyBh
IHJlYWQtd3JpdGUgL3ZhciB3aGVuIHRoZQorCSAgcm9vdGZzIGlzIG5vdCByZW1vdW50ZWQgcmVh
ZC13cml0ZS4KKworY29uZmlnIEJSMl9JTklUX1NZU1RFTURfVkFSX0ZBQ1RPUlkKKwlib29sICJi
dWlsZCBhIGZhY3RvcnkgdG8gcG9wdWxhdGUgYSB0bXBmcyIKIAloZWxwCiAJICBCdWlsZCBhIGZh
Y3Rvcnkgb2YgdGhlIGNvbnRlbnQgb2YgL3ZhciBhcyBpbnN0YWxsZWQgYnkKIAkgIHBhY2thZ2Vz
LCBtb3VudCBhIHRtcGZzIG9uIC92YXIgYXQgcnVudGltZSwgc28gdGhhdApAQCAtMTgxLDYgKzE4
NywxNiBAQCBjb25maWcgQlIyX0lOSVRfU1lTVEVNRF9WQVJfRkFDVE9SWQogCSAgdmFyLm1vdW50
IHVuaXQsIHRoYXQgb3ZlcnJpZGVzIHRoZSBXaGF0IGFuZCBUeXBlLCBhbmQgcG9zc2libHkKIAkg
IHRoZSBPcHRpb25zIGFuZCBBZnRlciwgZmllbGRzLgogCitjb25maWcgQlIyX0lOSVRfU1lTVEVN
RF9WQVJfTk9ORQorCWJvb2wgImRvIG5vdGhpbmciCisJaGVscAorCSAgQ2hvb3NlIHRoaXMgaWYg
eW91IGhhdmUgY3VzdG9tIGRpc3Bvc2l0aW9ucyAobGlrZSBvbmUgb3IgbW9yZQorCSAgb2YgYSBw
b3N0LWJ1aWxkIHNjcmlwdCwgYSBmYWtlcm9vdCBzY3JpcHQsIHN5c3RlbWQgdW5pdHMsIGFuCisJ
ICBpbml0cmFtZnMsIG9yIHNvbWV0aGluZyBlbHNlKSB0aGF0IHByZXBhcmUgL3ZhciB0byBiZSB3
cml0YWJsZQorCSAgb24gYSByZWFkLW9ubHkgcm9vdGZzLgorCitlbmRjaG9pY2UKKwogY29uZmln
IEJSMl9JTklUX1NZU1RFTURfUE9QVUxBVEVfVE1QRklMRVMKIAlib29sICJ0cmlnZ2VyIHN5c3Rl
bWQtdG1wZmlsZXMgZHVyaW5nIGJ1aWxkIgogCWRlZmF1bHQgeSAgIyBsZWdhY3kKLS0gCjIuMzku
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
