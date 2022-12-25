Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91DC4167B
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECFF0403C8;
	Sun, 25 Dec 2022 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECFF0403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeOJq3sxrDh5; Sun, 25 Dec 2022 22:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7AF404F7;
	Sun, 25 Dec 2022 22:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7AF404F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD7DA1BF381
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A856781319
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A856781319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ti_lTHmcaalQ for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 22:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC66812F4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC66812F4
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 22:08:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso6731031wmo.1
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 14:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kSFUTuyRrugCOG4tOUjn1UQRwmCard/wqLlpwimx1Rw=;
 b=3b69qAg4T+icO8/jU4FJS/gHjBCMLSGW51CXb0wZbZkwD+o6fHLamox5KbMCbADux1
 kXSLIv5bWbQN5WBy6j/u6rshhCfm+W053S5flohiAMG6dwHxE4ZjHtXS2oQehcbQtW3R
 pk/vDSaGsOulF8f2LrIhjUyZhBMpYoeDdtP8lRyffNVZQgJ28V9rATXvXt+fVR/iWkP8
 rAprdKriWsigk0NqB44ijS6oAhIkBopTT5DAqI3A8R2GyXUevGgNFTxMPH3Ubl2PI082
 h4vbrOHyzQ1lowP/djdje0qDj3FW6VNBZ255Fr7uChLmrEPjQ+F2T7EfEvq6PRdF6xTw
 wFaQ==
X-Gm-Message-State: AFqh2kpupdBIkM9h5Q1VreQgV0g4J39kPnGQyt3X4o7NxyT9ld5IaBqc
 uqW38c5TbPpZztf5LZhHO4H97PssbG8=
X-Google-Smtp-Source: AMrXdXtMdYr4tI934FENrBfWEusALkXajSgiCXD3xQIoRIyB0rGT16lbUMGyHCjHAvAH0v8oHYPzfw==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id
 be12-20020a05600c1e8c00b003d62952679bmr11643113wmb.34.1672006106045; 
 Sun, 25 Dec 2022 14:08:26 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:bc00:ef48:c4a5:90b])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1cf614000000b003cf4d99fd2asm11835446wmc.6.2022.12.25.14.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 14:08:25 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 23:08:22 +0100
Message-Id: <2f9e844a3580077442585e16a137eb5a9161121e.1672006091.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672006091.git.yann.morin.1998@free.fr>
References: <cover.1672006091.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSFUTuyRrugCOG4tOUjn1UQRwmCard/wqLlpwimx1Rw=;
 b=Om90JQ1oH5E6moBkacCjcwIDmwwxr5XBFowPWNJIuh9fOn4d8F4ANBkJTwTPmz/NNq
 6l5YvPitmX35LZIxmsd3k/QXfW7wsln1RWXTzP8KZs3Ipi10Lavs6TqzE2k5DRCWNRZL
 weKXIGbehoCHwhemvasKlJngStdu3KDPVm0rJegRlm3KJiYoJFF+NSTR42xBJd0uy2kp
 NTMghSLVQGAgVcMX37dPht+63LAuA8e2Zi5SFQN+6YIX/EgDjA2obfvKmwWTCGCt3Q01
 rqNp97WCqz0iyNj7E4MiFHE46ORKbws1Z8NVbI/yTM27gKwmeu77VOjc39+C8I/Cw7Oc
 GUeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Om90JQ1o
Subject: [Buildroot] [PATCH 1/3 v4] system: introduce a choice for /var
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
bWQtdG1wZmlsZXMgZHVyaW5nIGJ1aWxkIgogCWRlZmF1bHQgeSAgIyBsZWdhY3kKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
