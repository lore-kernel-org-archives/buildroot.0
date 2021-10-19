Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54F7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 16:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EC861372
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 16:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56EC861372
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5B4400CB;
	Tue, 19 Oct 2021 16:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDM9EeIifKFd; Tue, 19 Oct 2021 16:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F1540134;
	Tue, 19 Oct 2021 16:30:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541111BF4DA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 16:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F0240624
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 16:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNwPWn6vzvKK for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 16:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2568E4060A
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 16:30:22 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so934762oof.9
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w4HMSb/FzFn3JOFicVrW3llDKuIXerFNE9KMYcu5X4I=;
 b=WW6GurzbJIcXxhSyZnNpogX0BZVgdQp9JaKQj/Z2QGj9PFYbxmIk9GyRsgivXT8QEc
 GpYqtMtwSpbZsjufbBNMky5kZsqft22nCOse8of2GIXAVRKzSDsGga6nKFhf2PHywNnO
 sFe4w2GXS4d6xc+M0jX5pp9tK3p9JaNecpps/K5VkJ4LY9i8vYr70gLIvbYaUB8Lmolx
 tTgr1XhUrrqvhyXUV3IXFMNu+l/InfiJaWA0xXWeD6idPmxcsBKMU9PNr01b47P6aXEb
 aEDSsl31Nhwon+qe5vkhwytqrEhVj9TRpCFnUJ3PlQ2iVbkmAVzSDPZHVt+kwFunnEjH
 iJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w4HMSb/FzFn3JOFicVrW3llDKuIXerFNE9KMYcu5X4I=;
 b=D/Mcs2sj48vBw8ZjyfNH4LdewXQlAGfb0BRgaaEhlT5Dyu5PD1TZPsODYqR2eHIu+l
 +i0rSdGP3Fa0b9jajCNVylnFSHeAHbgsVxkFJL/upFkVBBmekgj58QwW53/1XxnKiFfe
 2ICnkaVuHMQCjI/iqGJdL1T4C+Mqap5FGblD7eP2UkXTZ5q0U4EJwCz0sml5PW/PPwZS
 ApLOVihg/y5wBxGKZnrnPjhHFG/opKSjg9AVHSNlGMgGu7o4fSjT5aPX+RiKIXD6Ox1V
 3NRqrYlJWQ8TkijdOcHfZL7fq9AEjcSAqxFSszzlSnsRyMvy022XqksZ2B6j1DFiHq6v
 eqSg==
X-Gm-Message-State: AOAM530LHeLJ97cGPG7phsBavVDmnylGhW8kt75S/Ep3NLNogQ/OVBNu
 CHXGaonccmK5AOPnnfhmi3vTBLiFYSUcEJ/A+G0=
X-Google-Smtp-Source: ABdhPJyKTnqg7vLx9rKcH69UlFh2e8J32XTEoj8BrozSymBZCuOM+GC60PkTAx/ksNz0k4YWGrVjILOijSl0/RFLtcs=
X-Received: by 2002:a4a:c883:: with SMTP id t3mr5610105ooq.58.1634661021232;
 Tue, 19 Oct 2021 09:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer> <20211015205044.GF368016@scaer>
In-Reply-To: <20211015205044.GF368016@scaer>
From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 19 Oct 2021 09:30:10 -0700
Message-ID: <CAFSsvmrWN=1MgFFO-O6NWG__tb2QXGMpfo+riFQfCpGfCrUK8g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IEtvcnk7CgpEbyB5b3UgcGxhbiBvbiBzdWJtaXR0aW5nIGEgcGF0Y2ggdG8gZml4IHRoaXM/
IElmIG5vdCwgSSBjYW4gZG8gc28uCkp1c3QgbGV0IG1lIGtub3chCgpBZGFtCgpPbiBGcmksIE9j
dCAxNSwgMjAyMSBhdCAxOjUwIFBNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPgo+IEvDtnJ5LCBBbGwsCj4KPiBPbiAyMDIxLTEwLTE0IDIyOjAyICswMjAw
LCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiBbLS1TTklQLS1dCj4gPiBTaWRlIG5vdGUs
IHVucmVsYXRlZCB0byB0aGlzIGlzc3VlOiB3ZSBoYXZlIGEgcGFyYWxsZWwgYnVpbGQgaXNzdWUg
d2l0aAo+ID4gZ3J1YjI6Cj4gPiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1MiAvaG9tZS95bW9yaW4v
ZGV2L2J1aWxkcm9vdC9PL2hvc3QvYmluL2k2ODYtbGludXgtZ2NjIC1FIC1ESEFWRV9DT05GSUdf
SCAtSS4gLUkuLiAgLVdhbGwgLVcgLURHUlVCX1VUSUw9MSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0
IC1JLi9pbmNsdWRlIC1ER1JVQl9GSUxFPSJ1dGlsL2dydWItZnN0ZXN0LmMiIC1JLiAtSS4uIC1J
LiAtSS4uIC1JLi4vaW5jbHVkZSAtSS4vaW5jbHVkZSAtSS4uL2dydWItY29yZS9saWIvbGliZ2Ny
eXB0LWdydWIvc3JjLyAtSS4vZ3J1Yi1jb3JlL2xpYi9nbnVsaWIgLUkuLi9ncnViLWNvcmUvbGli
L2dudWxpYiAgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklM
RV9PRkZTRVRfQklUUz02NCAtT3MgLWZuby1zdGFjay1wcm90ZWN0b3IgLURfRklMRV9PRkZTRVRf
QklUUz02NCAgIC1EJ0dSVUJfTU9EX0lOSVQoeCk9QE1BUktFUkB4QCcgLi4vdXRpbC9ncnViLWZz
dGVzdC5jIC4uL2dydWItY29yZS9rZXJuL2VtdS9ob3N0ZnMuYyAuLi8gZ3J1Yi1jb3JlL2Rpc2sv
aG9zdC5jIC4uL2dydWItY29yZS9vc2RlcC9pbml0LmMgPiBncnViX2ZzdGVzdC5wcCB8fCAocm0g
LWYgZ3J1Yl9mc3Rlc3QucHA7IGV4aXQgMSkKPiA+ICAgICAyMDIxLTEwLTE0IDIxOjQ1OjUyIC4u
L2dydWItY29yZS9rZXJuL2VtdS9ob3N0ZnMuYzoyMDoxMDogZmF0YWwgZXJyb3I6IGNvbmZpZy11
dGlsLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiA+ICAgICAyMDIxLTEwLTE0IDIxOjQ1
OjUyICAgIDIwIHwgI2luY2x1ZGUgPGNvbmZpZy11dGlsLmg+Cj4gPiAgICAgMjAyMS0xMC0xNCAy
MTo0NTo1MiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+IFstLVNOSVAtLV0KPiA+
IEJ1dCBmb3J0dW5hdGVseSwgaXQgbG9va3MgbGllayBpdCBpcyBmaXhlZCB3aXRoIHVwc3RyZWFt
IGNvbW1pdAo+ID4gNDJmNDA1NGZhZjNjIChNYWtlZmlsZTogTWFrZSBsaWJncnViLnBwIGRlcGVu
ZCBvbiBjb25maWctdXRpbC5oKS4KPgo+IEFuZCBhcHBhcmVudGx5LCB0aGlzIGlzIG5vdCBlbm91
Z2gsIGJlY2F1c2UgSSBzdGlsbCBoaXQgdGhlIGlzc3VlLCBhYm91dAo+IG9uZSBpbiBmaXZlIGJ1
aWxkcywgYWx3YXlzIHdoZW4gYnVpbGRpbmcgaTM4Ni1lZmkuLi4gOi0oCj4KPiBCdXQgZ2l2ZW4g
aG93IGludmVudGl2ZSB0aGUgZ3J1YiBidWlsZHN5c3RlbSBpcywgSSBkcmVhZCB0byBldmVyIGhh
dmUgdG8KPiBsb29rIGF0IGl0IG9uY2UgbW9yZS4uLiA6LSgKPgo+IFJlZ2FyZHMsCj4gWWFubiBF
LiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
