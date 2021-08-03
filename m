Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353C1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:22:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB4460524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBB4460524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71788440E;
	Wed,  4 Aug 2021 01:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvnDKTGDtJUj; Wed,  4 Aug 2021 01:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C12A843D6;
	Wed,  4 Aug 2021 01:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA2E31BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B905783B19
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpwwATvWT0_m for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:58:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E35382F19
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:58:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u13so303732lje.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=39T4m8lB2kbl7KSFlH9B3nSrF9drrV2QsrncljkkfT4=;
 b=lxmRyi4hLpi/sCUROv1GzXy7N4QlUbDgUObGMEEDzEcp71Wz0YISr+yF/Bz8sGsy1u
 uQhF8wqLrOkQVe/G9witaFrdQTzcVG280MqVV/qZb+Qr1aO5aTKP3AMLFHFkhS4P9Pw1
 +LIJ9hLYb0VwD67IFa/lgRoRMIkYvbYLeSIn+ByTjIduvokpl2mEuppdfTRcyXG5pkGy
 16O3tZPyXw4BWJ7fM18PfCvia10e62Apg8CXTaDyT5eMUUcjFj20cKgfxgBj1izkuyrq
 3OZnepL62OAUb4O8Oc27wQSVE/2An/63it9MD0BTQUhudXAW/GaRmSpa02KB/n1yLYov
 dH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=39T4m8lB2kbl7KSFlH9B3nSrF9drrV2QsrncljkkfT4=;
 b=sKOQCZMotxAVXAWCiUeRa+e7h1+UOx69Te/kLBSPvLYwhMz3QHqWyGUvpDVPlcS8mz
 RsB6Sci7eNW7GSTapR2ZQXF8z+Yuzf+eedS5a1C05MWFgrbEtZNKUjL62CUImeWaqus7
 tA1FCbgzeXgucxHnGE9bMc67waUhO79h74YaCuU5yitJ47Ypacz8m1M8ijUiOjdyjNMK
 c/7US1nrPbmSLtolOtHBzrhEE76+QHyR5qh69A5ZPhQ+HFFNmXX6nIQZStciOZnZZxEM
 thGE+287Hh79aTLlmYHidgL0ZbGaws0jRPk4xrsoVpJyOkKz+SMUAW8qwaDkUWkZfoUz
 M7Kw==
X-Gm-Message-State: AOAM532jPhUQhRLblCxUsof7fu14++6GxrxV3IORzzPzs2xGpUB41dQA
 xlvcHRfg73PRHgMi689e3edEG5KXADfTm1GaHDk=
X-Google-Smtp-Source: ABdhPJw7BKHoo/l8zcCLOUBNGXBJ6NcGT6daQbXnOGzNohxIvEz6luh+fdhlHHUDDjZma3ZQxEkfzq97vga4aNPdkMM=
X-Received: by 2002:a2e:a78c:: with SMTP id c12mr15831876ljf.319.1628027894612; 
 Tue, 03 Aug 2021 14:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210803135041.4090636-1-fontaine.fabrice@gmail.com>
 <a660a2ce-35b3-6c07-1432-64808fda5002@mind.be>
In-Reply-To: <a660a2ce-35b3-6c07-1432-64808fda5002@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Aug 2021 23:58:03 +0200
Message-ID: <CAPi7W81uM9Trn3vW6gF9QmVo7+8NjN04K5wEo2J9ieHdKOE7GA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgbWFyLiAzIGFvw7t0IDIwMjEgw6AgMjM6NDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDAzLzA4LzIwMjEgMTU6NTAsIEZhYnJp
Y2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBGaXhlczoKPiA+ICAtIE5vIGF1dG9idWlsZGVyIGZhaWx1
cmVzIHlldAo+Cj4gIFRoYXQncyBleHRyZW1lbHkgdW5saWtlbHksIHdpdGggSmFtZXMncyBhdXRv
YnVpbGRlcnMgdGhlcmUgc2hvdWxkIGJlIGRvemVucwo+IGFscmVhZHkgYWZ0ZXIgYSBzaW5nbGUg
ZGF5LiBBcmUgeW91IHN1cmUgdGhhdCB0aGUgYnVpbGQgZmFpbHMgZm9yIHRoaXMgcGFja2FnZT8K
WWVzLCBJJ20gc3VyZSwgSSByYW4gaW50byB0aGlzIGZhaWx1cmUgb24gbXkgbG9jYWwgbWFjaGlu
ZS4KVGhlIGF1dG9idWlsZGVycyB3aWxsIHJ1biBpbnRvIGl0IGFmdGVyIGEgZmV3IGRheXMgbm93
IHRoYXQgbGlib2RiIGhhcwpiZWVuIGZpeGVkIGxlc3MgdGhhbiBhIGRheSBhZ28gd2l0aAo2OWQy
ZDFkOTFlNDRkNmJjODA2OTBiODI4MTFkMDQ0N2U4MWVkMzFiLgo+Cj4gIFNhbWUgZm9yIGxpYm9k
Yi1ib29zdC4KPgo+ICBXZSBjYW4gbGV0IHRoaXMgc29hayBmb3IgYSBmZXcgZGF5cyBhbmQgc2Vl
IGlmIGF1dG9idWlsZGVyIGZhaWx1cmVzIHR1cm4gdXAuIE9yCj4geW91IGNhbiBzaW1wbHkgY29w
eSZwYXN0ZSB0aGUgZXJyb3IgZnJvbSBhIG1hbnVhbCBidWlsZC4KPgo+ICBSZWdhcmRzLAo+ICBB
cm5vdXQKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9saWJvZGItbXlzcWwvbGli
b2RiLW15c3FsLm1rIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9kYi1teXNx
bC9saWJvZGItbXlzcWwubWsgYi9wYWNrYWdlL2xpYm9kYi1teXNxbC9saWJvZGItbXlzcWwubWsK
PiA+IGluZGV4IGE5MDQwYzY1ZjguLjg4YjZmNGNiMzEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L2xpYm9kYi1teXNxbC9saWJvZGItbXlzcWwubWsKPiA+ICsrKyBiL3BhY2thZ2UvbGlib2RiLW15
c3FsL2xpYm9kYi1teXNxbC5tawo+ID4gQEAgLTEyLDYgKzEyLDggQEAgTElCT0RCX01ZU1FMX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+ID4gIExJQk9EQl9NWVNRTF9MSUNFTlNFID0gR1BMLTIuMAo+
ID4gIExJQk9EQl9NWVNRTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gIExJQk9EQl9NWVNR
TF9ERVBFTkRFTkNJRVMgPSBsaWJvZGIgbXlzcWwKPiA+IC1MSUJPREJfTVlTUUxfQ09ORl9FTlYg
PSBMSUJTPWAkKFNUQUdJTkdfRElSKS91c3IvYmluL215c3FsX2NvbmZpZyAtLWxpYnNgCj4gPiAr
TElCT0RCX01ZU1FMX0NPTkZfRU5WID0gXAo+ID4gKyAgICAgQ1hYRkxBR1M9IiQoVEFSR0VUX0NY
WEZMQUdTKSAtc3RkPWMrKzExIiBcCj4gPiArICAgICBMSUJTPWAkKFNUQUdJTkdfRElSKS91c3Iv
YmluL215c3FsX2NvbmZpZyAtLWxpYnNgCj4gPgo+ID4gICQoZXZhbCAkKGF1dG90b29scy1wYWNr
YWdlKSkKPiA+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
