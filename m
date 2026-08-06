Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEC7C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 808A480F30;
	Thu,  6 Aug 2026 21:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opcwtTOQGIGj; Thu,  6 Aug 2026 21:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D33680F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786051482;
	bh=SpFBxLJ+Tp8zVuabtYirl4tzB0KWVQqkhRKKnBiexoo=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Kn+aFMnMLqdmI592ospGnV9T9aF/nJ4WX3cTQ8w1stZrPZRNDeJTTJ0+yTwZPceaJ
	 3Pb+kVpzJsS/gqidasa7IYD1g20E4E3zLrxsTxMH7SHO7izz/qrzQBNpvKJ0FALgMU
	 of5BH8KiRYWGc6fxcwzgrNuiWoeLw4koGEP2qY9TzGNj7JvPtW4lbwjO4y5/yOuXt2
	 nVn/XnTX5pQUMwcUXAW27HtP6tI2+daZP7EU0QybBw7cKSBBIUYQtWA+5MZJx7+o5t
	 /E3dio248NYD9ce2ACtO+JohNkGcidr1ZRFqicIIeR3yaLedMEn2AJmGbaTDNyC3E4
	 BBCCXHmIhB0GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D33680F05;
	Thu,  6 Aug 2026 21:24:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AE8C218
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C64640234
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXx-N7M2srvW for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 21:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAE7A4022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE7A4022F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAE7A4022F
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D2DE84E41126;
 Thu,  6 Aug 2026 21:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F1965FEF7;
 Thu,  6 Aug 2026 21:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56C4311C36D4B; 
 Thu,  6 Aug 2026 23:24:30 +0200 (CEST)
Date: Thu, 06 Aug 2026 23:24:21 +0200
Message-Id: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMz3Yz84pL4kvz8nGJdC8tEU+NEM2ODtDRzJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAA/tuxJuAAAA
X-Change-ID: 20260806-host_tools-89a53a630ff7
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786051470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=aqKs/a30Tzg0k5Mfh0hkTH2JnC2vv4z4kzqWKOrMqLY=;
 b=jfzyH5VisABDct6JF39Ht3qjWubFcSxOhRXGwDb8gB74W8CVmiLQ4J/sanXHz02wx4ixw0
 XTRcTIMmPKxSODlMQiUYjh5YkWFUQRVaOFigKdVIyF0pFYIJi7x+IjeuOUes+JwQlanaCe
 9Alc5ypHx0YJQTsGUTD4d9yF+WfprS77LTvsQCn4EdVOW10tzVuqTFVGajkehPu0AnoalE
 QExTHTnHvote195f5hGqWRBJbSzDthGOrxHW7zoN/YM+14Hn1DPVIg0CnT5dtC2MErI7PQ
 G25yQCvOet1cgdLFGfQG9BkVGdCT28+94CCF6IvFdRhni//ff3+ZIbjvhAXVGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jfzyH5Vi
Subject: [Buildroot] [PATCH 0/2] package: bring two host tools
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gYnJpbmcgdHdvIG5ldyBob3N0IHBhY2th
Z2VzIHRvIGVhc2UgdGhlCmludGVncmF0aW9uIG9mIHdlYiBhcHBzIG9udG8gZW1iZWRkZWQgcGxh
dGZvcm1zOgotIHVnbGlmeWpzIChbMV0pLCB1c2VkIHRvIG1pbmlmeSBmcm9udGVuZCBhc3NldHMs
Ci0gc2FzcyAoWzJdKSwgYSBjc3MgZXh0ZW5zaW9uIGFkZGluZyBwcm9ncmFtbWF0aW9uIGZlYXR1
cmVzIHRvIGNzcy4KClRob3NlIHR3byB0b29scyBjb21lIGluIHRoZSBzaGFwZSBvZiBiaW5hcmll
cyBpbnN0YWxsZWQgaW4gdGhlIGhvc3QKZGlyZWN0b3J5LiBUaGUgdXNlIGNhc2Ugc3VwcG9ydGVk
IGJ5IHRob3NlIG5ldyBwYWNrYWdlcyBpcyB0aGUKcG9zc2liaWxpdHkgdG8gcnVuIG1pbmlfYXNz
ZXQgKFszXSkgb24gaG9zdCBkdXJpbmcgc29tZSBjdXN0b20gcGFja2FnZQpidWlsZCwgd2l0aCB1
Z2xpZnlqcyBhbmQgc2FzcyBiZWluZyB0d28gZGVwZW5kZW5jaWVzIG9mIGl0LiBUaGUgc2VyaWVz
CmRvZXMgbm90IGJyaW5nIGEgbWluaV9hc3NldCBwYWNrYWdlIHRob3VnaCwgYXMgaXQgY2FuIGJl
IGJyb3VnaHQgYnkgdGhlCmN1c3RvbSBjb21wb3NlciBmaWxlIGluIHRoZSBmaW5hbCBhcHBsaWNh
dGlvbiBwcm9qZWN0LgoKVGhpcyB1c2UgY2FzZSBraW5kIG9mIHNpbWlsYXIgdG8gd2hhdCBoYXZl
IGJlZW4gcHJvcG9zZWQgaW4gdGhlIHBhc3QKd2l0aCBCUjJfUEFDS0FHRV9IT1NUX05PREVKU19N
T0RVTEVTX0FERElUSU9OQUwgKFs0XSkuIEF0IHRoaXMgdGltZSwgdGhlCnByb3Bvc2FsIHdhcyBy
ZWplY3RlZCwgYW5kIEFybm91dCByYXRoZXIgc3VnZ2VzdGVkIHRvIGNyZWF0ZSBkZWRpY2F0ZWQK
cGFja2FnZXMgZm9yIHRoaXMga2luZCBvZiBob3N0IHRvb2xzLiBUaGlzIHNlcmllcyBmb2xsb3dz
IHRoaXMKc3VnZ2VzdGlvbiwgaG9waW5nIHRoYXQgaXQgaXMgc3RpbGwgdGhlIG1vc3QgcmVsZXZh
bnQgc29sdXRpb24sIDQgeWVhcnMKbGF0ZXIuIEFub3RoZXIgaW1wb3J0YW50IHBvaW50IHRvIG1l
bnRpb24gaXMgdGhhdCB0aGUgc2Vjb25kIHBhY2thZ2UgaXMKZmV0Y2hpbmcgc29tZSBkZXBzIChu
cG0gaW5zdGFsbCkgYXQgYnVpbGQgc3RlcCwgd2hpY2ggaXMgbm90IGlkZWFsLCBidXQKYWxzbyBz
dWdnZXN0ZWQgaW4gQXJub3V0J3MgaW5pdGlhbCBwcm9wb3NhbC4gSWYgdGhhdCdzIG5vdCBkZXNp
cmVkCmFueW1vcmUsIEknbSBvcGVuIHRvIHNvbWUgZ3VpZGFuY2UgdG8gaW1wcm92ZSB0aGlzLgoK
WzFdIGh0dHBzOi8vd3d3Lm5wbWpzLmNvbS9wYWNrYWdlL3VnbGlmeS1qcwpbMl0gaHR0cHM6Ly93
d3cubnBtanMuY29tL3BhY2thZ2Uvc2FzcwpbM10gaHR0cHM6Ly9naXRodWIuY29tL21hcmtzdG9y
eS9taW5pLWFzc2V0Cls0XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMjAx
MTkxNDA3MDMuMTI5NzgtMS10b20ubWFyY3V6emlAb3JvbGlhLmNvbS8KCi0tLQpBbGV4aXMgTG90
aG9yw6kgKDIpOgogICAgICBwYWNrYWdlL3VnbGlmeWpzOiBuZXcgcGFja2FnZQogICAgICBwYWNr
YWdlL3Nhc3M6IG5ldyBwYWNrYWdlCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArKwogcGFja2FnZS9Db25maWcuaW4uaG9zdCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogcGFja2FnZS9zYXNzL0NvbmZpZy5pbi5ob3N0
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysKIHBhY2thZ2Uvc2Fzcy9zYXNzLmhh
c2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL3Nhc3Mvc2Fz
cy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysKIHBhY2thZ2UvdWdsaWZ5anMvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgICAgICAg
IHwgIDcgKysrKysKIHBhY2thZ2UvdWdsaWZ5anMvdWdsaWZ5anMuaGFzaCAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL3VnbGlmeWpzL3VnbGlmeWpzLm1rICAgICAgICAgICAg
ICAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3Nhc3MucHkgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrCiAuLi4v
dGVzdHMvcGFja2FnZS90ZXN0X3Nhc3Mvc2FtcGxlX3Nhc3Muc2NzcyAgICAgICB8ICA3ICsrKysr
CiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3VnbGlmeWpzLnB5ICAgICB8IDIz
ICsrKysrKysrKysrKysrKysrCiAuLi4vdGVzdHMvcGFja2FnZS90ZXN0X3VnbGlmeWpzL3NhbXBs
ZV91Z2xpZnlqcy5qcyB8ICA1ICsrKysKIDEyIGZpbGVzIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25z
KCspCi0tLQpiYXNlLWNvbW1pdDogM2M1YzA1OGQxNTZkYWFiYTI5MDFlNTM5Mzk1YTg0MmQyYmFm
ZDFlNgpjaGFuZ2UtaWQ6IDIwMjYwODA2LWhvc3RfdG9vbHMtODlhNTNhNjMwZmY3CgpCZXN0IHJl
Z2FyZHMsCi0tICAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
