Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7552C10DC1
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 11:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 476464029B;
	Fri,  8 Dec 2023 11:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 476464029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-QSNPA-cQW1; Fri,  8 Dec 2023 11:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E6240266;
	Fri,  8 Dec 2023 11:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E6240266
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7493E1BF37A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D76740266
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D76740266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTy4S4pfEeNq for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 11:30:59 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BD0140230
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 11:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD0140230
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9fa2714e828so256169566b.1
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 03:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035057; x=1702639857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbfhbI7rjtf2nBSDEr2LJiJWNaJ6iTbtXQgZqrHYO8A=;
 b=lnNMuqGF5pGqgcvpNyMH7qw79nSoLuhSApGNK98GBrV5oDcCPVbE4vHZrigaHPo6v+
 oyp2VZzWyr+EerDLBAydMroaf8o3yx+IVQvunjQdEC9SVMBzx/0ANc/fPo15Im8Ozmua
 CW0embpwPXHKecY5vmo2pp46YxJ46+Caf0YbErBHfYD6Tle3KBVZvGMQJBYreFxEblo0
 wewxvRRwyuUWaRB6/O+FzvxRBCyt/ZMW7NygvyfwJQVhHE20FjCUeAMA5ylyDunRYQqX
 wxn5XlKiLoFJQalSvNF6qPAacXKxBtvdecRB/XeTNyVoBREYtrpVlPmU1OfHmrPr8tYi
 2o0A==
X-Gm-Message-State: AOJu0YwNly2u7cciMh+uqKy8F8dYUDwgu36ocBjD7Pf8d3uG4APpoP6a
 d5LNMaVRJ05n235m4ebn9L7YWztV7K75eBGY5RHOhXSS6SO+Kp5ykg0=
X-Google-Smtp-Source: AGHT+IFmE/voBAO9cFw9xEtWiA546Kdq5aSl4VasneQrQAmMgcotZyhf6bjCigjL+88o6CWL7LtEBDaHj7EPr47DCeI=
X-Received: by 2002:a17:907:c928:b0:9e0:5dab:a0f1 with SMTP id
 ui40-20020a170907c92800b009e05daba0f1mr2200413ejc.36.1702035057123; Fri, 08
 Dec 2023 03:30:57 -0800 (PST)
MIME-Version: 1.0
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
 <e43a1b9b-fa82-43f3-8225-e5a76ac1cbde@benettiengineering.com>
In-Reply-To: <e43a1b9b-fa82-43f3-8225-e5a76ac1cbde@benettiengineering.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 8 Dec 2023 12:30:46 +0100
Message-ID: <CAOf5uwkW9-aVA3UUTHF85De-b+zPJP9RWEaUsj+cix_M2Xn6rw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702035057; x=1702639857;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbfhbI7rjtf2nBSDEr2LJiJWNaJ6iTbtXQgZqrHYO8A=;
 b=N3c6xelWzpgiJeh67uHYT5nRgvsfbFIPj1FvOODiRJOKYcbvewxePFeI9tLE46IpJY
 4gcEPtgkQKBE5sB4VI4cjHxu7tXKcZPXAMft9V9/6tOC+98aAwbUJ4VM7lE9ZtINgk0D
 ZJS7mu+RPuZqnl2RxPvB9eT660HGUd7uQfoC0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=N3c6xelW
Subject: Re: [Buildroot] help - custom user not working
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvCgpPbiBGcmksIERlYyA4LCAyMDIzIGF0IDEyOjI54oCvUE0gR2l1bGlvIEJlbmV0
dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gSGkg
U3RlZmFubywKPgo+IE9uIDA4LzEyLzIzIDExOjQ1LCBTdGVmYW5vIENvdHRhZmF2aSB3cm90ZToK
PiA+IEhpLAo+ID4gSSdtIHRyeWluZyB0byBhZGQgYSBjdXN0b20gdXNlciB0byB0aGUgbWluaW1h
bCAicmFzcGJlcnJ5cGk0X2RlZmNvbmZpZyIKPiA+IGJ1aWxkLgo+ID4gSSdtIHVzaW5nIEJ1aWxk
cm9vdCAyMDIzLjExLCBmb2xsb3dpbmcgdGhlIG1hbnVhbCBJJ3ZlIGNyZWF0ZWQgYQo+ID4gInVz
ZXJzLnR4dCIgZmlsZSAoaW4gdGhlIGJ1aWxkcm9vdCByb290IGZvbGRlcikgd2l0aCBqdXN0IG9u
ZSBsaW5lOgo+ID4KPiA+IHBpIC0xIHBpIC0xID1yYXNwYmVycnkgL2hvbWUvcGkgL2Jpbi9zaCAt
Cj4gPgo+ID4gVGhlIGNvbmZpZyBmaWxlIGNvbnRhaW5zOgo+ID4KPiA+IEJSMl9ST09URlNfVVNF
UlNfVEFCTEVTPSJ1c2Vycy50eHQiCj4gPgo+ID4gVGhlIGJ1aWxkIGlzIHN1Y2Nlc3NmdWwgYW5k
IGxvb2tpbmcgYW5kIHRoZSAiZnVsbF91c2Vyc190YWJsZS50eHQiCj4gPiAob3V0cHV0IG9mIHRo
ZSBidWlsZCkgSSBjYW4gc2VlIHRoZSB1c2VyIGRlZmluaXRpb24gYWJvdmUuCj4gPgo+ID4gSG93
ZXZlciwgd2hlbiBJIHRyeSB0byBsb2cgb24gYXMgInBpIiBJIGdldCAiTG9naW4gaW5jb3JyZWN0
IiBlcnJvci4KPiA+Cj4gPiBJZiBJIGxvZ2luIGFzIHJvb3QgYW5kIGNoZWNrIHRoZSAvZXRjL3Bz
c3dkLCBJIERPIE5PVCBzZWUgdGhlIHVzZXIgcGkKPiA+Cj4gPiBDYW4geW91IGhlbHAgbWUgdW5k
ZXJzdGFuZCB3aGF0IGFtIEkgbWlzc2luZz8KPgo+IEkndmUgYnVpbGQgcmVwcm9kdWNlZCBoZXJl
IHdoYXQgeW91J3ZlIGRlc2NyaWJlZCBhbmQgaW4KPiByb290ZnMudGFyL2V0Yy9wYXNzd2QKPiBJ
IGNvcnJlY3RseSBmaW5kOgo+IHBpOng6MTAwOjEwMTo6L2hvbWUvcGk6L2Jpbi9zaAo+Cj4gU2lu
Y2UgaXQgYnVpbGRzIGNvcnJlY3RseSBpdCBtZWFucyBpdCBmaW5kcyB1c2Vycy50eHQgZmlsZSBp
biBCdWlsZHJvb3QKPiByb290IGZvbGRlciwgc28gZXZlcnl0aGluZyBsb29rcyBnb29kIHRvIG1l
Lgo+Cj4gSSBzdWdnZXN0IHlvdSB0byBjaGVjayByb290ZnMudGFyIGFyY2hpdmUgZm9yIHRoZSBm
aW5hbCB0YXJnZXQgcm9vdGZzLgo+IFRoaXMgaXMgYmVjYXVzZSB0YXJnZXQvIGZvbGRlciBkb2Vz
bid0IGNvbnRhaW4gdGhlIGNvbXBsZXRlIGZpbmFsIHJvb3Rmcwo+IGZpbGVzLCBmb3IgZXhhbXBs
ZSBpdCBtaXNzZXMgcGkgdXNlciBpbiB0YXJnZXQvZXRjL3Bhc3N3ZCBmaWxlLgo+CgpXZSByZXBs
aWVkIGF0IHRoZSBzYW1lIHRpbWUuIEkgaGF2ZSBkb25lIHRoZSBzYW1lIGFuZCBhZGQgbW9yZSBp
bmZvIHRvIGRlYnVnCml0Cgo+IC0tCj4gR2l1bGlvIEJlbmV0dGkKPiBDRU8mQ1RPQEJlbmV0dGkg
RW5naW5lZXJpbmcgc2FzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYg
RXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1
dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29s
dXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4g
KzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFz
b2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
