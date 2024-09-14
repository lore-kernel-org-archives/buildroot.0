Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040ABC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6943403B6;
	Sat, 14 Sep 2024 22:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b306dv-c7oBY; Sat, 14 Sep 2024 22:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6872F403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6872F403C9;
	Sat, 14 Sep 2024 22:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5DEC1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B24CE80AC8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvIB_eodGcZA for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7439180AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7439180AC2
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7439180AC2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:16:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so4397754a12.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726352207; x=1726957007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kKvVMEHoeNR1rJcHnRHAKERZx3Waha8iMYN3LbqGjY=;
 b=F2DtpYNVZwEiQnBUElP1otAAsCy2orAfEAQcqoPZLMiJk9Pky+i6rtpuJMkkKuiI2X
 qomWHECswq1e25XrEJv4keRgjHrUoAWe9Z2dViHgF0wU5xf0+TgfVp7ycYGBojKTMlHN
 Kn7VolZVSK+4pzfF1k+gp+w6VAHuEOakS5Wyt7Se5FOLRwnZm6ycWMiVNRfUoRvuT0hd
 jLkQjoqvBM48FZJ/HrddFbzXEq2zsbqOGG0DNhTVC1jQnKGcLB8FHmZgQFrspfpLEdJJ
 6bhiZPCdu62YuDv1PI4Xa/dwKEsZ420K9ikS5ugjcj23940GgzQZP1h4bG5xhgP0DHMC
 YcQA==
X-Gm-Message-State: AOJu0Yy9nfOmRJOsssuv5jzzOmirNzCcl+trRCRTZelTK8z6eGjSdhmQ
 osQEdTOxG8bb/M1GJqtF6dvAhSpxay1x9+lKCuqzmKIzI9vDA/97fDHrXvkPnlC9vxfW/eTLP+E
 mWwsf2JHKnCK2HZDSKWJ3LbvxW+6MI6rq1ZTnCQ==
X-Google-Smtp-Source: AGHT+IH2vjUbl1C7kQEHTF0j+ptHA1Fc1Py61Vc+xQLkDaiz8otaxyNB1QZvkEh/ElSrkLqU7RemkV8ari1hJTNX1FQ=
X-Received: by 2002:a05:6402:27ce:b0:5c0:ab6f:652a with SMTP id
 4fb4d7f45d1cf-5c413e06ca6mr9225875a12.3.1726352206268; Sat, 14 Sep 2024
 15:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240912162232.1588976-1-sairon@sairon.cz>
 <ZuMl3F2Wga2vO-mH@landeda> <ZuMoce338wPIgE89@landeda>
In-Reply-To: <ZuMoce338wPIgE89@landeda>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Sun, 15 Sep 2024 00:16:20 +0200
Message-ID: <CAPa5EdBtTius08b_+CY16oCAY5=fSX+kfGf7qtpHXpLKGn-2+A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1726352207; x=1726957007; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kKvVMEHoeNR1rJcHnRHAKERZx3Waha8iMYN3LbqGjY=;
 b=BB9HEQVFXc0jTpHeFsSZFwp2LdFebgrQY/naHM646VIDtoxj6B8cLVoEfxy5lMWGIe
 jRoo3IqMOyLuP+v6CVIOIq3V1RvCO5pNbGAjhLyMtpxhDX+uyMfup30EOGIxx0gfJ09H
 bjjyM9NfIhgZEpZEoOsdYKHfMXZnz2eMMf8YydjzNaBxEUxT7mNrypys6lmtO/K+ZOZO
 sAm1iNPYAYb4bbNB3ELs4evOCXKDqV6g3DLFoE8/CqqqDQPRioja6BMhGlA4A4Ja2b+z
 47tbhVKUqkkt+sWWO/P3IYMX9iu8KiujGvJhmTTKj90cPfVr65UlYFXcF+KhC8ZXIJW2
 cHmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=BB9HEQVF
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: fix build with
 BR2_PACKAGE_SYSTEMD enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgZXZlcnlvbmUsCgp0aGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGF0IGFuZCBzb3Jy
eSBmb3IgbXkgbGF0ZSByZXBseS4gSSB3YXMgYWJvdXQKdG8gc2VuZCBhIGJhY2twb3J0IG9mIHRo
ZSBwYXRjaCBub3cgYnV0IEkgc2VlIEh1Z28gQ29ybmVsaXMgd2FzIGZhc3Rlcgp3aXRoIHRoZSBj
b3JyZWN0IGZpeCBhbmQgeW91IGFscmVhZHkgY29tbWl0dGVkIGl0IHRvIG1hc3RlciBhIGZldwpo
b3VycyBhZ28sIHNvIHRoYW5rIHlvdSBib3RoIQoKQ2hlZXJzLApKYW4KCgoKT24gVGh1LCAxMiBT
ZXB0IDIwMjQgYXQgMTk6NDQsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
PiB3cm90ZToKPgo+IEphbiwgQWxsLAo+Cj4gT24gMjAyNC0wOS0xMiAxOTozMyArMDIwMCwgWWFu
biBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiBPbiAyMDI0LTA5LTEyIDE4OjIyICswMjAwLCBK
YW4gxIxlcm3DoWsgc3Bha2UgdGh1c2x5Ogo+ID4gPiBBZnRlciB1cGRhdGUgdG8gdjQuMC40LCBw
cm9wcy1uZyBidWlsZCBmYWlscyBvbiBsaW5rZXIgZXJyb3IgaWYKPiA+ID4gQlIyX1BBQ0tBR0Vf
U1lTVEVNRCBpcyBlbmFibGVkOgo+ID4gPiAvYnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2Mv
eDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvMTMuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC1idWls
ZHJvb3QtbGludXgtZ251L2Jpbi9sZDogc3JjL3cubzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBz
eW1ib2wgJ3NkX3Nlc3Npb25fZ2V0X3VpZEBATElCU1lTVEVNRF8yMDknCj4gPiA+IC9idWlsZHJv
b3Qvb3V0cHV0L2hvc3QvbGliL2djYy94ODZfNjQtYnVpbGRyb290LWxpbnV4LWdudS8xMy4zLjAv
Li4vLi4vLi4vLi4veDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiAvYnVpbGRyb290
L291dHB1dC9ob3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2xpYjY0
L2xpYnN5c3RlbWQuc28uMDogZXJyb3IgYWRkaW5nIHN5bWJvbHM6IERTTyBtaXNzaW5nIGZyb20g
Y29tbWFuZCBsaW5lCj4gPiA+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0
YXR1cwo+IFstLVNOSVAtLV0KPiA+ID4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseSkK
PiA+ID4gIFBST0NQU19OR19ERVBFTkRFTkNJRVMgKz0gc3lzdGVtZAo+ID4gPiAgUFJPQ1BTX05H
X0NPTkZfT1BUUyArPSAtLXdpdGgtc3lzdGVtZAo+ID4gPiArUFJPQ1BTX05HX0xJQlMgKz0gLWxz
eXN0ZW1kCj4gWy0tU05JUC0tXQo+ID4gSW4gb3RoZXIgd29yZHMsIHRoZXJlIGlzIGFuIGlzc3Vl
IHRoYXQgbXVzdCBiZSBmaXhlZCBpbiB0aGUgcGFja2FnZSwgbm90Cj4gPiBpbiBCdWlsZHJvb3Qu
Cj4KPiBBbmQgaXQgc2VlbXMgdXBzdHJlYW0gaGFzIGFscmVhZHkgbm90aWNlZCwgYW5kIHdlIGhh
dmUgYSBwYXRjaCB0bwo+IGJhY2twb3J0Ogo+Cj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9wcm9j
cHMtbmcvcHJvY3BzLy0vY29tbWl0L2NhMDA0ZDQ2NTdkNWU4YjQ2OGE0NTUyZWRlNDI5YmU1MzE5
M2EzYTkKPgo+IChpbmNpZGVudGFsbHksIGl0J3MgdGhlIGZpcnN0IGNvbW1pdCByaWdodCBhZnRl
ciB0aGUgNC4wLjQgcmVsZWFzZS4uLiBBdAo+IGxlYXN0LCB0aGVyZSB3aWxsIGJlIG5vIGNvbmZs
aWN0ISA6LV0gKQo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
