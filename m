Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3043C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 19:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64E98400A6;
	Sat, 15 Jan 2022 19:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efgiyQkX4cZ9; Sat, 15 Jan 2022 19:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5170F4036E;
	Sat, 15 Jan 2022 19:31:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD1901BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B07080E17
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0mQhygxNrbn for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 19:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB5C80DA6
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 19:31:43 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id v6so16513456iom.6
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EY93A/dd54Hp0qISqikPYHo0x15rdREEiJ2qxQUd62Y=;
 b=cdpm/TE4afCClL2ZO0fn5Gt+nPm9klS1qogwmulewKwlbSz2yE+peHiH7vnxSoNAXa
 TqTL5bPrP5p+1APAv3862SOoJcZbAxlvEqaZUdMVuVzS9KAdMuyQYi6/ddaERaEW+4Hs
 OXuU2OUb7HJtzRdIZlDd9TSgoP6CktNKxo2aSclHmUt27oiVSlPd7JzSGbAFi/RSF6nf
 6xyctMb8qqj7paKnLp+fenf0MVp/62dvYmmBxkJ02AswlKfT44mJ5/4ti88nEEq7P0l0
 g3dKteaNszpc3N3RB5xd6uvYGk4JuOLqDcoRru+12LgBTbaK2KYeYLIf0rEtFYSxn1b/
 DlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EY93A/dd54Hp0qISqikPYHo0x15rdREEiJ2qxQUd62Y=;
 b=iQ+J+xyKSa4c08eyOKpJqKizu4NOTi8c4qf5B7N4X6fW+N7yJGsXr0Uca0d2hiPzme
 DaJ3XFCVXEiPIH8bI8dMvFMEDmBzEm+hD/iNagWF0YHldqNLFNBspmyLRIL8CEQPn0vV
 1hLcIGRi5s87Sch6th2H8F/4UznKefB18Vftd3ZZmHCWP8BbdotsxlSsrW5GcmzZyI0F
 lVBWgWJLOK4l/u/Xgd3h5RZeoP/AFy7JmfwOQMxnLouf+o1PEwgtHPzyzRHQcpHmxl6a
 tb4MMYpW0xVS0dt2JTFxg48V1PeslwntJNREHad4C7UTJ6IDD/eUIYf23lo71gmNM3W5
 4rYw==
X-Gm-Message-State: AOAM530GVt6APXfbjizlwrCuTQMMIJhkN/oZZ/KKBo8itqlCxWfcDZkd
 NsniF6dPbXKMqkoyUrU3mWt5LQv6WxV0NZEVEXOJbWp8
X-Google-Smtp-Source: ABdhPJwl3OIEwxno1C5ShyBRwvV21xDTFfDdlSzy22MoZ/1/vY9A4x8uudGZrGQHt7yH5RgACb+2MNslWpx4Knvvtr4=
X-Received: by 2002:a05:6638:3287:: with SMTP id
 f7mr6550774jav.121.1642275102865; 
 Sat, 15 Jan 2022 11:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
 <1a139b63-48ff-fe9e-2041-cc1724a753b2@gmail.com>
In-Reply-To: <1a139b63-48ff-fe9e-2041-cc1724a753b2@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 15 Jan 2022 20:31:31 +0100
Message-ID: <CAAXf6LUxEJQeSBytz6htfgGD7EnyipMPoPtCcgTEfnsL8gfR5Q@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWwganVlLCAxMyBlbmUgMjAyMiBhIGxhcyAyMzowNSwgUm9tYWluIE5hb3VyCig8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IEhpIFRob21hcywKPgo+IExlIDE4LzA1LzIw
MjEgw6AgMTM6MzYsIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6ljcml0IDoKPiA+IEZyb206
IFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5j
b20+Cj4gPgo+ID4gVGhlcmUgYXJlIGNhc2VzIHdoZXJlIGEgNjQtYml0IGFyY2hpdGVjdHVyZSBp
cyBydW5uaW5nIGEgNjQtYml0IGtlcm5lbCBidXQKPiA+IDMyLWJpdCB1c2Vyc3BhY2UuIEV4YW1w
bGVzIGluY2x1ZGU6Cj4gPiAgICAgKiBhYXJjaDY0IGFyY2hpdGVjdHVyZSwgd2l0aCBhYXJjaDY0
IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+ID4gICAgICogeDg2XzY0IGFyY2hp
dGVjdHVyZSwgd2l0aCB4ODZfNjQga2VybmVsIGFuZCAzMi1iaXQgKGkzODYpIHVzZXJzcGFjZQo+
ID4KPiA+IEluIEJ1aWxkcm9vdCwgdGhlIEFSQ0gvQlIyX0FSQ0ggYW5kIE5PUk1BTElaRURfQVJD
SCB2YXJpYWJsZXMgd2lsbCByZWZlciB0bwo+ID4gdGhlIDMyLWJpdCBhcmNoaXRlY3R1cmUsIGJ1
dCB0aGUga2VybmVsIG5lZWRzIHRvIGJlIGJ1aWx0IHdpdGggdGhlIDY0LWJpdAo+ID4gYXJjaGl0
ZWN0dXJlLgo+ID4KPiA+IE1ha2UgaXQgcG9zc2libGUgdG8gZGVmaW5lIHRoZSBjb3JyZWN0IGFy
Y2hpdGVjdHVyZSB0byBiZSB1c2VkIGZvciB0aGUKPiA+IGtlcm5lbCwgaW4gYSBuZXcgY29uZmln
IG9wdGlvbiAnQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFJy4gVGhlIHVzZXIgaXMKPiA+IGV4cGVj
dGVkIHRvIGtub3cgdGhlIHZhbGlkIHZhbHVlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+
ID4gLS0tCj4gPiAgTWFrZWZpbGUgICAgICAgfCAgNCArKysrCj4gPiAgYXJjaC9Db25maWcuaW4g
fCAxNSArKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+ID4gaW5kZXggYzUz
OTllOWEzNS4uZDA5Y2Y3Yzk1OCAxMDA2NDQKPiA+IC0tLSBhL01ha2VmaWxlCj4gPiArKysgYi9N
YWtlZmlsZQo+ID4gQEAgLTQzNCw3ICs0MzQsMTEgQEAgUVVJRVQgOj0gJChpZiAkKGZpbmRzdHJp
bmcgcywkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkpLC1xKQo+ID4gICMgU3RyaXAgb2Zm
IHRoZSBhbm5veWluZyBxdW90aW5nCj4gPiAgQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0FS
Q0gpKQo+ID4gIE5PUk1BTElaRURfQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5FTF9B
UkNIKSkKPiA+ICtpZmVxICgkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5FTF9BUkNIX09WRVJSSURF
KSksKQo+ID4gIEtFUk5FTF9BUkNIIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfS0VSTkVMX0FSQ0gp
KQo+ID4gK2Vsc2UKPiA+ICtLRVJORUxfQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5F
TF9BUkNIX09WRVJSSURFKSkKPiA+ICtlbmRpZgo+ID4KPiA+ICBaQ0FUIDo9ICQoY2FsbCBxc3Ry
aXAsJChCUjJfWkNBVCkpCj4gPiAgQlpDQVQgOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9CWkNBVCkp
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZpZy5pbgo+ID4gaW5k
ZXggNzU3NWFjZjQ4Yy4uYzgyMTAwZjU0MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvQ29uZmlnLmlu
Cj4gPiArKysgYi9hcmNoL0NvbmZpZy5pbgo+ID4gQEAgLTMyOSw2ICszMjksMjEgQEAgY29uZmln
IEJSMl9BUkNICj4gPiAgY29uZmlnIEJSMl9LRVJORUxfQVJDSAo+ID4gICAgICAgc3RyaW5nCj4g
Pgo+ID4gK2NvbmZpZyBCUjJfS0VSTkVMX0FSQ0hfT1ZFUlJJREUKPiA+ICsgICAgIHN0cmluZyAi
S2VybmVsIGFyY2hpdGVjdHVyZSBvdmVycmlkZSIKPgo+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBhZGQgYXJjaGl0ZWN0dXJlIGRlcGVuZGVuY2llcyBoZXJlIChCUjJfQVJDSF9JU182NCkK
Pgo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBOb3JtYWxseSwgdGhlIGNvcnJlY3Qga2VybmVs
IGFyY2hpdGVjdHVyZSB2YWx1ZSBpcyBkZXJpdmVkCj4gPiArICAgICAgIGZyb20gdGhlIHNlbGVj
dGVkIGFyY2hpdGVjdHVyZSwgYW5kIHlvdSBzaG91bGQga2VlcCB0aGlzCj4gPiArICAgICAgIG9w
dGlvbiBlbXB0eS4KPiA+ICsgICAgICAgSG93ZXZlciwgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIHlv
dSBtYXkgd2FudCB0byBlbnRlciBhIGN1c3RvbQo+ID4gKyAgICAgICB2YWx1ZSwgZm9yIGV4YW1w
bGUgd2hlbiB1c2luZyBhIDY0LWJpdCBhcmNoaXRlY3R1cmUgYnV0Cj4gPiArICAgICAgIHJ1bm5p
bmcgdXNlcnNwYWNlIGluIDMyLWJpdCBtb2RlLgo+ID4gKyAgICAgICBBcyBhbiBleGFtcGxlLCBp
biBjYXNlIG9mIGFuIHg4Nl82NCBwcm9jZXNzb3Igd2hlcmUgeW91IHdhbnQKPiA+ICsgICAgICAg
MzItYml0IHVzZXJzcGFjZSwgQlIyX0FSQ0ggd2lsbCBiZSAnaTM4NicvJ2k0ODYnLydpNjg2JyBh
bmQKPiA+ICsgICAgICAgQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFIHNob3VsZCBiZSBzZXQgdG8g
J3g4Nl82NCcuIE5vdGUgdGhhdAo+ID4gKyAgICAgICBpbiB0aGlzIGV4YW1wbGUgeW91IHdpbGwg
YWxzbyBuZWVkIGEgbXVsdGlsaWIgdG9vbGNoYWluIGFuZAo+ID4gKyAgICAgICBwYXNzICctbTMy
JyB2aWEgQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04uCj4KPiBBZGRpbmcgLW0zMiB3aWxsIGZvcmNl
IHRoZSBtdWxpdGlsaWIgdG9vbGNoYWluIHRvIHByb2R1Y2UgMzJiaXRzIGJpbmFyeS4KPiBCdXQg
LW02NCBpcyBhbHNvIGFkZGVkIHRvIHRoZSB0b29sY2hhaW4gd3JhcHBlciBmb3IgeDg2XzY0Lgo+
IE1peGluZyAtbTY0IGFuZCAtbTMyIGRvZXNuJ3Qgc2VlbXMgYSBnb29kIGlkZWEuCgpXZWxsLCB0
aGUgbGFzdCBlbnRyeSBvbiB0aGUgY29tbWFuZC1saW5lIGNvdW50cywgYW5kIHNpbmNlCkJSMl9U
QVJHRVRfT1BUSU1JWkFUSU9OIGlzIHBhc3NlZCBfYWZ0ZXJfIC1tNjQsIHRoZSAtbTMyIHdpbnMg
YXMKZXhwZWN0ZWQuCgpJdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBhdm9pZCBwYXNzaW5nIHRoZSAt
bTY0IGJ1dCB0aGVuIEkgdGhpbmsgd2UnbGwKaGF2ZSB0byBtYWtlIHNvbWUgYXNzdW1wdGlvbnMg
YWJvdXQgdGhlIHZhbHVlIG9mIEtFUk5FTF9BUkNIX09WRVJSSURFCm9yIG9ubHkgY292ZXIgc3Bl
Y2lmaWMgY2FzZXMuCgpCZXN0IHJlZ2FyZHMsClRob21hcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
