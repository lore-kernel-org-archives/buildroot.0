Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4BC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 14:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1527460796;
	Sat,  2 Mar 2024 14:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsMZzAVJhghx; Sat,  2 Mar 2024 14:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 150A46081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 150A46081E;
	Sat,  2 Mar 2024 14:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4931BF860
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7E1781FB1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cDOliNdYvMX for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 14:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06EA181FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EA181FA7
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06EA181FA7
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 14:21:51 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso3473843276.0
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 06:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709389311; x=1709994111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vMO1tgzQXbI0AakrJzxLh6kW2YXFwC2rpR3qkSExK0=;
 b=VDzpI3q8Nj6XeGdE/SXTHs8JNpwXv/wQp+NmCz7wPMSqVh+qrbx56b97baTcx9TeCi
 nA6P+w+o2pGB0Dtg1k6fCdn6hrFtrOgwFXOnvdaZfwlkU2QhlirHDvhHE9y5yB3vQ2j5
 GenBcY1BtrP9NmlOKMIWTcyLUyrws512Zs5T0rTkHP79d1Daku7D7+KZj5yuIbKo9VB/
 QEuHLxSt13gVVVdBaHiZCdJmuY4D8E4pGUBv5HgHn6WE3noM/un3B5kPLdQ14aX9h0/i
 g30Wu60W2XgXdKOf+2lDaMTpH9Xlt50kc91JodVq5spYgEDtQZjmO2bYnszxfd5FW+Z2
 YXDQ==
X-Gm-Message-State: AOJu0Yw6ZhMZJmGUEhtnRW0wVLmgyiubjtjG640/oEe5dF4yDq6Bjd6b
 PhXx416DBAjMWIpfN5cC2f4axu1e7h4QiMgjYmfMK0pbJKpFCkgCdGorJOkzCek4QodbYg1f6Hc
 zuVTYarOHOFU8DG28Qj4Cbz2vW6ImRnRQou7++Q==
X-Google-Smtp-Source: AGHT+IHVcdrda8TiBGEqD3vmWImdjfH/9l0Wer+LkYIKG/EO5PrnF4s60VVRD2o2HthLoHhh7WTuNnerMJYv7dYeA2M=
X-Received: by 2002:a05:6902:563:b0:dcc:6e60:7025 with SMTP id
 a3-20020a056902056300b00dcc6e607025mr4041912ybt.37.1709389310759; Sat, 02 Mar
 2024 06:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
 <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
In-Reply-To: <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 2 Mar 2024 15:21:40 +0100
Message-ID: <CABGWkvpi3jgV70jXi3Leti6+EgODiLnBCkmaYjb_qMcqEMZNmA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709389311; x=1709994111;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vMO1tgzQXbI0AakrJzxLh6kW2YXFwC2rpR3qkSExK0=;
 b=m8JpH3a8L1sHTNtmNCvohzPz56vDKi5TRSVmZoVWMv6KRnbtDFcrAibCAmYbDqFqpz
 ztd6BvWQ8o/sYOqdw5A+XUnikxxnpQreWsMTLJ8wz+DdlCX5IXOJOBXj4nTc/PutgWhH
 atm8pzS+Ag+ZB7mkKzIVD1Gt/I3z9amnekxlY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=m8JpH3a8
Subject: Re: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwsCgpPbiBTYXQsIE1hciAyLCAyMDI0IGF0IDEyOjA24oCvUE0gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGkgRGFyaW8sCj4KPiBM
ZSAwMS8wMy8yMDI0IMOgIDE0OjM2LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdCA6Cj4gPiBJbiB0
aGUgY2FzZSBvZiBTT0MgYW02NHgsIHRpLWszLXI1LWxvYWRlciBjcmVhdGVzIHRoZSBmb2xsb3dp
bmcKPiA+IHRpYm9vdDMuYmluIGZpbGVzOgo+ID4gLSBHUCAgICAtPiB0aWJvb3QzX2FtNjR4LWdw
LWV2bS5iaW4KPiA+IC0gSFMgICAgLT4gdGlib290M19hbTY0eF9zcjItaHMtZXZtLmJpbgo+ID4g
LSBIU19GUyAtPiB0aWJvb3QzX2FtNjR4X3NyMi1ocy1mcy1ldm0uYmluCj4gPgo+ID4gVGhlIHBh
dGNoIGFsbG93cyB5b3UgdG8gaWRlbnRpZnkgdGhlIGNvcnJlY3QgZmlsZSBiYXNlZCBvbiB0aGUg
U0VDX1RZUEUKPiA+IG9wdGlvbi4KPgo+IEl0IHNlZW1zIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIG1l
cmdlZCB3aXRoIHRoZSBBTTY0eCB1LWJvb3QgdmVyc2lvbiBidW1wIHNpbmNlCj4gdGktazMtcjUg
KGFrYSB1LWJvb3QpIG5vdyBwcm92aWRlIHRpYm9vdDMuYmluLgoKSSB3aWxsIHNxdWFzaCBpdCB0
byBbUEFUQ0ggMjEvMjNdIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnOiBidW1wClUtQm9v
dCB2ZXJzaW9uIHRvIDIwMjQuMDEKCj4KPiBBbHNvIG90aGVyIFRJIEszIFNvQyB2YXJpYW50IGxp
a2UgQU02NSBwcm92aWRlIGEgc3IyIGJpbmFyeToKPgo+IHRpYm9vdDMtYW02MmF4LWhzLWZzLWV2
bS5iaW4KPiB0aWJvb3QzLWFtNjJheC1ncC1ldm0uYmluCj4gdGlib290My1hbTYyYXgtaHMtZXZt
LmJpbgo+Cj4gdGlib290My1hbTYycHgtaHMtZnMtZXZtLmJpbgo+Cj4gdGlib290My1hbTYyeC1o
cy1mcy1ldm0uYmluCj4gdGlib290My1hbTYyeC1ncC1ldm0uYmluCj4gdGlib290My1hbTYyeC1o
cy1ldm0uYmluCj4KPiB0aWJvb3QzLWFtNjR4X3NyMi1ocy1mcy1ldm0uYmluCj4gdGlib290My1h
bTY0eC1ncC1ldm0uYmluCj4gdGlib290My1hbTY0eF9zcjItaHMtZXZtLmJpbgo+Cj4gdGlib290
My1hbTY1eF9zcjItZ3AtZXZtLmJpbgo+IHRpYm9vdDMtYW02NXhfc3IyLWhzLWV2bS5iaW4KPgo+
IHRpYm9vdDMtajcyMDAtZ3AtZXZtLmJpbgo+IHRpYm9vdDMtajcyMDBfc3IyLWhzLWZzLWV2bS5i
aW4KPiB0aWJvb3QzLWo3MjAwX3NyMi1ocy1ldm0uYmluCj4KPiB0aWJvb3QzLWo3MjFlLWdwLWV2
bS5iaW4KPiB0aWJvb3QzLWo3MjFlX3NyMi1ocy1mcy1ldm0uYmluCj4gdGlib290My1qNzIxZV9z
cjFfMS1ocy1ldm0uYmluCj4KPiB0aWJvb3QzLWo3MjFzMi1ncC1ldm0uYmluCj4gdGlib290My1q
NzIxczItaHMtZnMtZXZtLmJpbgo+Cj4gdGlib290My1qNzIycy1ocy1mcy1ldm0uYmluCj4KPiB0
aWJvb3QzLWo3ODRzNC1ncC1ldm0uYmluCj4gdGlib290My1qNzg0czQtaHMtZnMtZXZtLmJpbgo+
Cj4gTWF5YmUgd2UgbmVlZCB0byBpbnRyb2R1Y2UgVElfSzNfUjVfTE9BREVSX1NPQ19TVUZGSVgg
dG8gaGFuZGxlIHNyMiwgc3IxXzEgb3IgIiIgPwo+CkF0IGZpcnN0LCBJIGFsc28gdGhvdWdodCBh
Ym91dCBhIG5ldyBjb25maWd1cmF0aW9uIHRvIHNwZWNpZnkgYW4KYWRkaXRpb25hbCBzdWZmaXgs
IGJ1dCBhZnRlciB2ZXJpZnlpbmcKdGhhdCBCUjJfUEFDS0FHRV9USV9LM19TT0MgaXMgb25seSB1
c2VkIGluCmJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5taywgdGhlCmFkb3B0
ZWQgc29sdXRpb246CgotICAgICAgIGRlZmF1bHQgImFtNjR4IiAgaWYgQlIyX1BBQ0tBR0VfVElf
SzNfU09DX0FNNjRYCisgICAgICAgZGVmYXVsdCAiYW02NHgiICBpZiBCUjJfUEFDS0FHRV9USV9L
M19TT0NfQU02NFggJiYKQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAorICAgICAgIGRlZmF1
bHQgImFtNjR4X3NyMiIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WCAmJgohQlIyX1BB
Q0tBR0VfVElfSzNfU0VDVFlQRV9HUAoKc2VlbWVkIHRoZSBzaW1wbGVzdCB0byBtZS4KCkFuZCBJ
IHRoaW5rIHRoaXMgYXBwcm9hY2ggY2FuIGFsc28gYmUgdXNlZCBmb3IgdGhlIHZhcmlhbnRzIHlv
dQpsaXN0ZWQsIHNpbmNlIGZvciBlYWNoIHtTT0MsU0VDX1RZUEV9IHBhaXIKdGhlcmUgZXhpc3Rz
IG9uZSBhbmQgb25seSBvbmUgdGlib290My5iaW4uCgpGdXJ0aGVybW9yZSwgaWYgSSdtIG5vdCBt
aXNzaW5nIGFueXRoaW5nLCB0aGlzIHJlbWFpbnMgdGhlIG9ubHkKYWRqdXN0bWVudCB3ZSBuZWVk
IHRvIG1ha2Ugc2luY2UgdGhlcmUgYXJlIG5vCm90aGVyIGNvbmZpZ3VyYXRpb25zIGluIGJ1aWxk
cm9vdCBhbW9uZyB0aG9zZSB5b3UgbGlzdGVkLiBTbywgaW4gbXkKaHVtYmxlIG9waW5pb24sIGZv
ciBub3csIHRoaXMgc2hvdWxkIGJlIGZpbmUuCgpTbywgcGxlYXNlIGxldCBtZSBrbm93IGlmLCBp
biBhZGRpdGlvbiB0byBzcXVhc2hpbmcgdGhpcyBwYXRjaCBpbnRvCiJbMjEvMjNdIGNvbmZpZ3Mv
dGlfYW02NHhfc2tfZGVmY29uZmlnOgpidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEiLCBJ
IG5lZWQgdG8gbWFrZSBhbnkgb3RoZXIgYWRqdXN0bWVudHMKZm9yIHZlcnNpb24gOS4KClRoYW5r
cyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0tCj4gPgo+ID4gQWRkZWQgaW4gdjgKPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3RpLWszL0NvbmZpZy5pbiB8IDMgKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3RpLWszL0NvbmZpZy5pbiBiL3BhY2thZ2UvdGktazMvQ29uZmln
LmluCj4gPiBpbmRleCBiODU0NWI3YmNhNjIuLjljNjFmODg4MGExNSAxMDA2NDQKPiA+IC0tLSBh
L3BhY2thZ2UvdGktazMvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL3RpLWszL0NvbmZpZy5p
bgo+ID4gQEAgLTQzLDcgKzQzLDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX1RJX0szX1NPQwo+ID4g
ICAgICAgc3RyaW5nCj4gPiAgICAgICBkZWZhdWx0ICJhbTYyYXgiIGlmIEJSMl9QQUNLQUdFX1RJ
X0szX1NPQ19BTTYyQVgKPiA+ICAgICAgIGRlZmF1bHQgImFtNjJ4IiAgaWYgQlIyX1BBQ0tBR0Vf
VElfSzNfU09DX0FNNjJYCj4gPiAtICAgICBkZWZhdWx0ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdF
X1RJX0szX1NPQ19BTTY0WAo+ID4gKyAgICAgZGVmYXVsdCAiYW02NHgiICBpZiBCUjJfUEFDS0FH
RV9USV9LM19TT0NfQU02NFggJiYgQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAo+ID4gKyAg
ICAgZGVmYXVsdCAiYW02NHhfc3IyIiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjRYICYm
ICFCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX0dQCj4gPiAgICAgICBkZWZhdWx0ICJhbTY1eCIg
IGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY1WAo+ID4KPiA+ICBjb25maWcgQlIyX1BBQ0tB
R0VfVElfSzNfU0VDVFlQRQo+CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVk
IExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwK
ClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0
MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9u
cy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
