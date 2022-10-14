Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9081BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 22:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0881D405B4;
	Fri, 14 Oct 2022 22:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0881D405B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJeO3IFRf2qp; Fri, 14 Oct 2022 22:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E2A44051D;
	Fri, 14 Oct 2022 22:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2A44051D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 362061BF844
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1200B827A9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1200B827A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2cmdcnhv46f for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 22:21:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C245E824F4
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C245E824F4
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 22:21:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bu30so9639464wrb.8
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tnsIyz0UbUWgSU0OnBaBZUbatkrol6aXJfW1GtFm954=;
 b=2+RYlsgmNXYJTlxBtem/12oM1hf4ilavMZk2K432bLwOcSFzpDx0JUjNBbcf8wu9jt
 uCgdyRIr2pcXyr1jctOWP/UnUTQR2PQCUc0RYH/4R3DXjiqoWpYHId8Ys3dVe3NZxKPw
 ghxYoa8idUZJxxDWCIVHhwCseou1yUDgqavi+aNfYuQxAQFbu5BdnXyIRtwZLUQJPpQ/
 WCo7uDFJW17c+QfrmssTCWrBMWlvMNvDyLE921sfGaHiZWWRt8ACaSh9qtrLRtOQ0Dqf
 0KHOqrlzGl5KdkhIBnrH0h9t98k2HxkCnRL5CcFqm2n6yuJw9KnjFgQZru9LfAJyZhls
 EyRw==
X-Gm-Message-State: ACrzQf1+cJOsc+b9MB6+R9CwEX2lkzE3zO/qUTpjIEWfbUKu8DBrALV8
 f1+WFYEDl9COfNUK0zXrx5RYwqhXJqI=
X-Google-Smtp-Source: AMsMyM46p9SslxgW9efaMS+OdUSLGc+BRH2vQKZuoYULHn3LJXE6xDDSwSRZXUpNAMKXd8Zy9fUw8g==
X-Received: by 2002:a5d:49ca:0:b0:22e:3e8a:d18e with SMTP id
 t10-20020a5d49ca000000b0022e3e8ad18emr4874469wrs.380.1665786062285; 
 Fri, 14 Oct 2022 15:21:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b003c6bbe910fdsm9447446wmc.9.2022.10.14.15.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 15:21:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 00:20:51 +0200
Message-Id: <20221014222051.48942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tnsIyz0UbUWgSU0OnBaBZUbatkrol6aXJfW1GtFm954=;
 b=TIl6FAFpf5Gnk4meQUkSsho2I9QTxSQdAS46injRySL0t975tk6rdYC1/mN07aqNqW
 dMrFoYfpW2mi8Y3koDPGjQIa3eErP6ldLB0YpkFb5xJXHyuxhJL4iVaHxLDMo1aYjsOb
 iLRjTKUvqJvl1OSallzmgw+vSVfQ96Lx6Htzq5y0oBPV7koadzH5oreHy7tPbsLbnBhJ
 zvRjaAvazRy63WVFlMHTm7YIvAvbAJcCKCOY9YwzkEYoOpWq9YyIeaxIw+JX2BQ3AajD
 aO+O4qeIzsu6IgE56dCHA53EWQlwH3C/1SSF0ZklY98zUF1NH5D8Lx0Q5DkXDU14/lsD
 S0WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TIl6FAFp
Subject: [Buildroot] [PATCH 1/1] package/dbus: security bump to version
 1.12.24
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVuaWFsIG9mIHNlcnZpY2UgZml4ZXM6CgpFdmdlbnkgVmVyZXNoY2hhZ2luIGRpc2NvdmVyZWQg
c2V2ZXJhbCB3YXlzIGluIHdoaWNoIGFuIGF1dGhlbnRpY2F0ZWQKbG9jYWwgYXR0YWNrZXIgY291
bGQgY2F1c2UgYSBjcmFzaCAoZGVuaWFsIG9mIHNlcnZpY2UpIGluCmRidXMtZGFlbW9uIC0tc3lz
dGVtIG9yIGEgY3VzdG9tIERCdXNTZXJ2ZXIuIEluIHVuY29tbW9uIGNvbmZpZ3VyYXRpb25zCnRo
ZXNlIGNvdWxkIHBvdGVudGlhbGx5IGJlIGNhcnJpZWQgb3V0IGJ5IGFuIGF1dGhlbnRpY2F0ZWQg
cmVtb3RlCmF0dGFja2VyLgoK4oCiIEFuIGludmFsaWQgYXJyYXkgb2YgZml4ZWQtbGVuZ3RoIGVs
ZW1lbnRzIHdoZXJlIHRoZSBsZW5ndGggb2YgdGhlCiAgYXJyYXkgaXMgbm90IGEgbXVsdGlwbGUg
b2YgdGhlIGxlbmd0aCBvZiB0aGUgZWxlbWVudCB3b3VsZCBjYXVzZSBhbgogIGFzc2VydGlvbiBm
YWlsdXJlIGluIGRlYnVnIGJ1aWxkcyBvciBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4KICBwcm9k
dWN0aW9uIGJ1aWxkcy4gVGhpcyB3YXMgYSByZWdyZXNzaW9uIGluIHZlcnNpb24gMS4zLjAuCiAg
KGRidXMjNDEzLCBDVkUtMjAyMi00MjAxMTsgU2ltb24gTWNWaXR0aWUpCgrigKIgQSBzeW50YWN0
aWNhbGx5IGludmFsaWQgdHlwZSBzaWduYXR1cmUgd2l0aCBpbmNvcnJlY3RseSBuZXN0ZWQKICBw
YXJlbnRoZXNlcyBhbmQgY3VybHkgYnJhY2tldHMgd291bGQgY2F1c2UgYW4gYXNzZXJ0aW9uIGZh
aWx1cmUgaW4KICBkZWJ1ZyBidWlsZHMuIFNpbWlsYXIgbWVzc2FnZXMgY291bGQgcG90ZW50aWFs
bHkgcmVzdWx0IGluIGEgY3Jhc2ggb3IKICBpbmNvcnJlY3QgbWVzc2FnZSBwcm9jZXNzaW5nIGlu
IGEgcHJvZHVjdGlvbiBidWlsZCwgYWx0aG91Z2ggd2UgYXJlCiAgbm90IGF3YXJlIG9mIGEgcHJh
Y3RpY2FsIGV4YW1wbGUuIChkYnVzIzQxOCwgQ1ZFLTIwMjItNDIwMTA7CiAgU2ltb24gTWNWaXR0
aWUpCgrigKIgQSBtZXNzYWdlIGluIG5vbi1uYXRpdmUgZW5kaWFubmVzcyB3aXRoIG91dC1vZi1i
YW5kIFVuaXggZmlsZQogIGRlc2NyaXB0b3JzIHdvdWxkIGNhdXNlIGEgdXNlLWFmdGVyLWZyZWUg
YW5kIHBvc3NpYmxlIG1lbW9yeQogIGNvcnJ1cHRpb24gaW4gcHJvZHVjdGlvbiBidWlsZHMsIG9y
IGFuIGFzc2VydGlvbiBmYWlsdXJlIGluIGRlYnVnCiAgYnVpbGRzLiBUaGlzIHdhcyBhIHJlZ3Jl
c3Npb24gaW4gdmVyc2lvbiAxLjMuMC4gKGRidXMjNDE3LAogIENWRS0yMDIyLTQyMDEyOyBTaW1v
biBNY1ZpdHRpZSkKCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kYnVzL2RidXMvLS9i
bG9iL2RidXMtMS4xMi4yNC9ORVdTCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL2RidXMvZGJ1cy5oYXNoIHwg
NCArKy0tCiBwYWNrYWdlL2RidXMvZGJ1cy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kYnVz
L2RidXMuaGFzaCBiL3BhY2thZ2UvZGJ1cy9kYnVzLmhhc2gKaW5kZXggMTc2Mzk2ZmUyZi4uMTdj
NzAwMDRiYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kYnVzL2RidXMuaGFzaAorKysgYi9wYWNrYWdl
L2RidXMvZGJ1cy5oYXNoCkBAIC0xLDcgKzEsNyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0
ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQotIyBodHRwczovL2RidXMuZnJlZWRlc2t0b3Aub3Jn
L3JlbGVhc2VzL2RidXMvZGJ1cy0xLjEyLjIyLnRhci5nei5hc2MKKyMgaHR0cHM6Ly9kYnVzLmZy
ZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy9kYnVzL2RidXMtMS4xMi4yNC50YXIuZ3ouYXNjCiAjIHVz
aW5nIGtleSAzNkVDNUE2NDQ4QTRGNUVGNzlCRUZFOThFMDVBRTE0NzhGODE0QzRGCi1zaGEyNTYg
IDhkMjU3ODVjNzk4ZWM0Zjg5MmU2ZjlkMTc3ZmIwY2VlYjhiMjk4NjdiMTE5Nzk4ZjlkNTIyODU2
MWQzYWQ0NzQgIGRidXMtMS4xMi4yMi50YXIuZ3oKK3NoYTI1NiAgYmM0MmQxOTZjMTc1NmFjNTIw
ZDYxYmYzY2NkNmY0MjAxMzYxN2RlZjQ1ZGQxZTU5MWE2MDkxYWJmNTFkY2EzOCAgZGJ1cy0xLjEy
LjI0LnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwZTQ2ZjU0ZWZiMTJk
MDRhYjVjMzM3MTNiYWNkMGUxNDBjOWEzNWI1N2FlMjllMDNjODUzMjAzMjY2ZThmM2ExICBDT1BZ
SU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RidXMvZGJ1cy5tayBiL3BhY2thZ2UvZGJ1cy9kYnVz
Lm1rCmluZGV4IGEzYTIxYzFiY2MuLmIzYTc5YzQzMWQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZGJ1
cy9kYnVzLm1rCisrKyBiL3BhY2thZ2UvZGJ1cy9kYnVzLm1rCkBAIC02LDcgKzYsNyBAQAogCiAj
IFdoZW4gdXBkYXRpbmcgZGJ1cywgY2hlY2sgaWYgdGhlcmUgYXJlIGNoYW5nZXMgaW4gc2Vzc2lv
bi5jb25mIGFuZAogIyBzeXN0ZW0uY29uZiwgYW5kIHVwZGF0ZSB0aGUgdmVyc2lvbnMgaW4gdGhl
IGRidXMtYnJva2VyIHBhY2thZ2UgYWNjb3JkaW5nbHkuCi1EQlVTX1ZFUlNJT04gPSAxLjEyLjIy
CitEQlVTX1ZFUlNJT04gPSAxLjEyLjI0CiBEQlVTX1NJVEUgPSBodHRwczovL2RidXMuZnJlZWRl
c2t0b3Aub3JnL3JlbGVhc2VzL2RidXMKIERCVVNfTElDRU5TRSA9IEFGTC0yLjEgb3IgR1BMLTIu
MCsgKGxpYnJhcnksIHRvb2xzKSwgR1BMLTIuMCsgKHRvb2xzKQogREJVU19MSUNFTlNFX0ZJTEVT
ID0gQ09QWUlORwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
