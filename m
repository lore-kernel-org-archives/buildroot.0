Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E77C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 21:03:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA60A60D42
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 21:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA60A60D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A42C5405FA;
	Sat,  9 Oct 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AU9RphDj4Ubu; Sat,  9 Oct 2021 21:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918FD405F7;
	Sat,  9 Oct 2021 21:03:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5B501BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0A0D835C8
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 21:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXKglr5_EWBi for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 21:02:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A6B282531
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 21:02:58 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z11so46068626lfj.4
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Ze6GGh0j7lDwOqRVaJEOYF5q/Wd0J5xC+atlzFVEhI=;
 b=J7nQuS7o67+RvN9XNg/mXqpKyqgJY3me2oPmiDaz27JNdA6xRqQ+GDsNaFT+pCpV/D
 y/wPby/xEyvRaGR50PlS8cXAvUrmGX5vlefYaQ+fxhqdm7KnLu8xf39xLdnBo9M/9kPI
 nXaLsBIidmLiGY3ej36qUvF7YjB4xKjEkLzDNocjqb4RV6NdVFqE5pEUeFOPOTaLOApa
 byLyDPPMI/dVOMWaZMuDnafYEO4SR3lhC4a4S98DEMxtlEFLXB5csLDliXnHqkedN3h9
 yLYKhp++8wyI07PqON72Sn6vepJSFZk8U+tCB1kuWkL5DbgkHL94e2T+sHb1uLVEFY5V
 uNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Ze6GGh0j7lDwOqRVaJEOYF5q/Wd0J5xC+atlzFVEhI=;
 b=zvT2z4iWhH3eZ9Bdbn40fjQzW3rNYcsvB/CRQJpDP78aXKcimcA/R3cN6EckJpTxBD
 /BSFU5z9MWiWZqAilXokvHzyOMTxjFnOt0aQiTHgqIGHdWN7JV3DDbpwjw7HBzCulYsQ
 lop9tpCNDZyKiPJDJhJzVkq9ArvyAdwueA1tgk/Q6gCMkNaklW5K0wrkJHPSqZFIoD/T
 w5xNS0s2LrF48OwH1XEtbvOYIqOYh/FEzM1zNdOsismYA3cyOHt4Ljg9e7fI0umotqFX
 lM7pImjs+8agyPtXl36H7xJfrYmkwkKucx+Jqlr9EEYctGx+uAOhmHmxPTFZ0SjjwhB7
 5leA==
X-Gm-Message-State: AOAM5316Zh3Z5r4er2nyxGXiXYfPk+IhpvWUd5Knm8Yzojbdbbiyq26+
 KEZ69Pmou5FSy9ewTWCJJSMdEFePZ9KKSjs2Vg4=
X-Google-Smtp-Source: ABdhPJy4ZGL6WLZm8aGOk7zQPam5xZ3qybdxglJTHII0aS6RH0D5hC8X3X4a/Ehs28ogvw2dd3x74i+rBTF/EqBrWfs=
X-Received: by 2002:a05:6512:1287:: with SMTP id
 u7mr18763371lfs.614.1633813376208; 
 Sat, 09 Oct 2021 14:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211009170242.486738-1-fontaine.fabrice@gmail.com>
 <20211009214659.30a58c90@windsurf>
In-Reply-To: <20211009214659.30a58c90@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 9 Oct 2021 23:01:54 +0200
Message-ID: <CAPi7W83-ZeLBacug7pzX=hjGz14RQEo1r-EjqDPkQ2YEitN8RA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: fix build with
 autoconf >= 2.71
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgc2FtLiA5IG9jdC4gMjAyMSDDoCAyMTo0NywgVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGVsbG8g
RmFicmljZSwKPgo+IE9uIFNhdCwgIDkgT2N0IDIwMjEgMTk6MDI6NDIgKzAyMDAKPiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEZpeCB0
aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHNpbmNlIGJ1bXAgb2YgYXV0b2NvbmYg
dG8gdmVyc2lvbgo+ID4gMi43MSBpbiBjb21taXQgZWNkNTRiNjVjMWY5OThhN2NjZDkxZjdjNTIz
ZTRmZjM4YzQ3ODFkYToKPiA+Cj4gPiBFUlJPUjogJ0lUX1BST0dfSU5UTFRPT0wnIG11c3QgYXBw
ZWFyIGluIGNvbmZpZ3VyZS5hYyBmb3IgaW50bHRvb2wgdG8gd29yay4KPiA+Cj4gPiBGaXhlczoK
PiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2U4YmVhMjZmNmIx
MmFkZjE2MzM1YjI0ODM2YTdjNWMzMTkxMWFmNmEKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIC4u
LmFjLWZpeC1hdXRvcmVjb25mLXdpdGgtYXV0b2NvbmYtMi43MS5wYXRjaCB8IDM5ICsrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RyYW5zbWlzc2lvbi8wMDAzLWNvbmZpZ3VyZS5hYy1m
aXgtYXV0b3JlY29uZi13aXRoLWF1dG9jb25mLTIuNzEucGF0Y2gKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS90cmFuc21pc3Npb24vMDAwMy1jb25maWd1cmUuYWMtZml4LWF1dG9yZWNvbmYt
d2l0aC1hdXRvY29uZi0yLjcxLnBhdGNoIGIvcGFja2FnZS90cmFuc21pc3Npb24vMDAwMy1jb25m
aWd1cmUuYWMtZml4LWF1dG9yZWNvbmYtd2l0aC1hdXRvY29uZi0yLjcxLnBhdGNoCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTUyMmY2MTFiYQo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS90cmFuc21pc3Npb24vMDAwMy1jb25maWd1cmUu
YWMtZml4LWF1dG9yZWNvbmYtd2l0aC1hdXRvY29uZi0yLjcxLnBhdGNoCj4gPiBAQCAtMCwwICsx
LDM5IEBACj4gPiArRnJvbSA4NTdhYzkxYTAzYTA5NjYwMWY2MmIzNThmYzYxMzU1ZDRjYzI1Yjli
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gK0RhdGU6IFNhdCwgOSBPY3QgMjAyMSAxODo1
MToxMyArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiBmaXggYXV0b3Jl
Y29uZiB3aXRoIGF1dG9jb25mID49IDIuNzEKPiA+ICsKPiA+ICtSZW1vdmUgdGhlIHdoaXRlc3Bh
Y2UgYmVmb3JlIElUX1BST0dfSU5UTFRPT0wgYXMgc3VnZ2VzdGVkIGluCj4gPiAraHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS9idWctYXV0b2NvbmZAZ251Lm9yZy9tc2cwNDg1MS5odG1sCj4g
PiArdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGggYXV0b2NvbmYgPj0g
Mi43MToKPiA+ICsKPiA+ICtFUlJPUjogJ0lUX1BST0dfSU5UTFRPT0wnIG11c3QgYXBwZWFyIGlu
IGNvbmZpZ3VyZS5hYyBmb3IgaW50bHRvb2wgdG8gd29yay4KPiA+ICsKPiA+ICtGaXhlczoKPiA+
ICsgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lOGJlYTI2ZjZiMTJh
ZGYxNjMzNWIyNDgzNmE3YzVjMzE5MTFhZjZhCj4gPiArCj4gPiArU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArW1Vwc3RyZWFt
IHN0YXR1czogbm90IHVwc3RyZWFtYWJsZSBhcyB1cHN0cmVhbSBzd2ljdGhlZCB0byBjbWFrZSAo
Cj4gPiAraHR0cHM6Ly9naXRodWIuY29tL3RyYW5zbWlzc2lvbi90cmFuc21pc3Npb24vaXNzdWVz
LzE1NzMpXQo+Cj4gSSBhbSByYXRoZXIgY29uZnVzZWQsIGJlY2F1c2UgSSBkb24ndCBzZWUgYW55
IGNoYW5nZXMgYmV0d2VlbiBhdXRvY29uZgo+IDIuNzAgYW5kIDIuNzEgdGhhdCBzZWVtIHRvIGV4
cGxhaW4gdGhpcywgYW5kIHRoZSBtZXNzYWdlICJFUlJPUjoKPiAnSVRfUFJPR19JTlRMVE9PTCcg
bXVzdCBhcHBlYXIgaW4gY29uZmlndXJlLmFjIGZvciBpbnRsdG9vbCB0byB3b3JrIgpJIGFzc3Vt
ZSB0aGF0IHRoZSBjdWxwcml0IG9uIGF1dG9jb25mIHNpZGUgaXM6Cmh0dHA6Ly9naXQuc2F2YW5u
YWguZ251Lm9yZy9naXR3ZWIvP3A9YXV0b2NvbmYuZ2l0O2E9Y29tbWl0O2g9YjNiM2FmODIxYTBi
OWU4MmViZTU2Yjc3YjE3MzFkMmZlNThmNTJkZQpTbyBidWlsZCBmYWlsdXJlIGlzIHJhaXNlZCBz
aW5jZSBhdXRvY29uZiAyLjcwIGFuZCBub3QgMi43MS4KPiBjb21lcyBmcm9tIGludGx0b29saXpl
LmluLCB3aGljaCBpcyBpbiBob3N0LWludGx0b29sLCB3aGljaCBoYXMgbm90Cj4gYmVlbiB1cGRh
dGVkIGZvciBhdCBsZWFzdCAyIHllYXJzIGluIEJ1aWxkcm9vdC4KQSBidWcgaGFzIGJlZW4gb3Bl
bmVkIG9uIGludGx0b29sIGJ1dCB0aGVyZSBpcyBubyB1cHN0cmVhbSByZWFjdGlvbjoKaHR0cHM6
Ly9idWdzLmxhdW5jaHBhZC5uZXQvaW50bHRvb2wvK2J1Zy8xOTIxODE2Cj4KPiA+ICtAQCAtNTU1
LDkgKzU1NSw3IEBAIGRubCBpdCBzaG91bGQgYmUgc2FmZSB0byByZS1lZGl0IDAuNDAgYmFjayBk
b3duIHRvIDAuMjMKPiA+ICsgdXNlX25scz1ubwo+ID4gKyBpZiB0ZXN0ICJ4JGVuYWJsZV9ubHMi
ID0gInh5ZXMiIDsgdGhlbgo+ID4gKyAgICAgdXNlX25scz15ZXMKPiA+ICstICAgIG00X2lmZGVm
KFtJVF9QUk9HX0lOVExUT09MXSwKPiA+ICstICAgICAgICAgICAgIFtJVF9QUk9HX0lOVExUT09M
KFswLjM1LjBdLFtuby14bWxdKV0sCj4gPiArLSAgICAgICAgICAgICBbQUNfTVNHX0VSUk9SKCIt
LWVuYWJsZS1ubHMgcmVxdWlyZXMgaW50bHRvb2wgdG8gYmUgaW5zdGFsbGVkLiIpXSkKPiA+ICsr
SVRfUFJPR19JTlRMVE9PTChbMC4zNS4wXSxbbm8teG1sXSkKPiA+ICsgICAgIEFDX0NIRUNLX0hF
QURFUlMoW2xpYmludGwuaF0pCj4gPiArICAgICBHRVRURVhUX1BBQ0tBR0U9dHJhbnNtaXNzaW9u
LWd0awo+ID4gKyAgICAgQUNfU1VCU1QoR0VUVEVYVF9QQUNLQUdFKQo+Cj4gU28geW91J3JlIGdl
dHRpbmcgcmlkIG9mIHRoZSBJVF9QUk9HX0lOVExUT09MIG00X2lmZGVmIHRlc3QgPyBJIGd1ZXNz
Cj4gaXQncyBPSyBpbiB0aGUgY29udGV4dCBvZiBCdWlsZHJvb3QsIGJlY2F1c2UgdHJhbnNtaXNz
aW9uCj4gdW5jb25kaXRpb25hbGx5IGRlcGVuZHMgb24gaG9zdC1pbnRsdG9vbCwgc28gSVRfUFJP
R19JTlRMVE9PTCB3aWxsCj4gYWx3YXlzIGJlIGF2YWlsYWJsZS4KPgo+IFRob21hcwo+IC0tCj4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
