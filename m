Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9A2C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 22:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DBD81F87;
	Mon, 19 Feb 2024 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRAGESne41Kl; Mon, 19 Feb 2024 22:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA1A81F66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA1A81F66;
	Mon, 19 Feb 2024 22:27:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 792821BF417
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 22:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 665D481F66
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 22:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOE9LdIFELRl for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 22:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D210281F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D210281F53
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D210281F53
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 22:27:44 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d228a132acso34238421fa.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 14:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708381662; x=1708986462;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RU8J0UfQWTBIeguxpkgB/Daitr9i83/YsPC5xPXVzO0=;
 b=krdOOqgdVoL09nQBB5CrmUoCOlkJZMs0s9fc9259iZcvUs2SMV8XCv81xwBouBPNHP
 ncMD5QdisY1ZxoF/o6Xdy/2g/rf5Ms9wkh0jCfE03ZT6ZGIULReERFnhZ0W2T8En/+VL
 xDv+Ri3ldLuEILmDKVWuv721A8NbKRQ43I40vMfZcrDRsXdgH52sTNLRVo++eTUmz1yT
 /r3ZjbV3O77tDK5ar72J0HAzSIseWn+L4ayznZdCX56pgzraWkvhHwRR9iayB+85Wyfb
 D3YGW1boPAWiyZOrna8AgOFmfUvWrwfQ5ujAXmHct1/uEZQqeCRRX3yrbKiLVQ9mqm6S
 9Qkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaRNNUtMXiUVqCF0B8spMTcBV33pSdOXir8YA1+JQTDt08k3s5dPN1ErrCXJhE6A4PX9g6aweve7SJvOqfxBWAEimQa/ekXw==
X-Gm-Message-State: AOJu0YyEqBPkTNvhKXqGdBUlCYAEEu5gEooFKiGfq9czhvJSi+Ks+bqR
 6zIZB6ujsiLHgzq/4oSc+Tj3Ac1U/fjm3efBBCVGz/CNRgvMCmCzX7ZXDxwfnSQ=
X-Google-Smtp-Source: AGHT+IGFqoXXRifI/LWvLCCCDAwkJjQi1gUtN8CO+AoG21Mz+so95xvti49OjYE3eHcQ4Y1eNadp8A==
X-Received: by 2002:a2e:97d7:0:b0:2d2:3085:c3ad with SMTP id
 m23-20020a2e97d7000000b002d23085c3admr4070145ljj.31.1708381662076; 
 Mon, 19 Feb 2024 14:27:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b00411ff030f06sm12946187wmg.9.2024.02.19.14.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 14:27:41 -0800 (PST)
Message-ID: <3dac4749-be3c-403a-9867-e7229f5dbf49@smile.fr>
Date: Mon, 19 Feb 2024 23:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
 <20240216200635.crek5j23p3hybg2p@dasso>
 <b3065644-f654-49fc-9560-31caa0beffbe@smile.fr>
 <20240219194207.pfonekdap7jagk3d@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240219194207.pfonekdap7jagk3d@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708381662; x=1708986462;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RU8J0UfQWTBIeguxpkgB/Daitr9i83/YsPC5xPXVzO0=;
 b=DZWDSG8c9FX1PfOt4vUlh0szFGnzYlF78/E+R8qTUkUytCOFOTnrcDK+lYPnsAovSk
 7sAZlScEWgrzofg+rGmgv65RSKPG9wVILflkkpeji0/2J3qbeQE0G6x7V9xqzFi5pxLp
 7F+HB/LdJyXUC31VyznOA8lO6wTp5t2iZ7p75eqUz6qWM9y8hbsxv+7r4YrhpEJCgjs4
 Zwqjf7A87NcKc1rd/Kl57+xfvPOdzvNAs/t717RVCrFx5endDhnD1ewuA4A7AdtUXoZR
 vT0U5bF20r54eVeMV0UGMB9qn1e7432/sG6xJMrlne1wxAnZQzIE8zbFQhrGNPH93j6E
 vKEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DZWDSG8c
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCkxlIDE5LzAyLzIwMjQgw6AgMjA6NDIsIEFuZHJlYXMgRGFubmVuYmVyZyBh
IMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBGcmksIEZlYiAxNiwgMjAyNCBhdCAxMDoz
ODo0MlBNICswMTAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IEhlbGxvIEFuZHJlYXMsCj4+Cj4+
IExlIDE2LzAyLzIwMjQgw6AgMjE6MDYsIEFuZHJlYXMgRGFubmVuYmVyZyBhIMOpY3JpdMKgOgo+
Pj4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMTE6MjA6NTBBTSArMDEwMCwgQWxleGFuZGVyIFN2
ZXJkbGluIHdyb3RlOgo+Pj4+IEhpIFJvbWFpbiwKPj4+Pgo+Pj4+IE9uIFR1ZSwgMjAyNC0wMi0x
MyBhdCAxODoyOCArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+Pj4+PiAtY2hvaWNlCj4+Pj4+
IC0JcHJvbXB0ICJTZWN1cml0eSB0eXBlIgo+Pj4+PiAtCWhlbHAKPj4+Pj4gLQnCoCBUaGUgdGFy
Z2V0IFNvQyBzZWN1cml0eSB0eXBlIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLsKgIFZhbGlkCj4+Pj4+
IC0JwqAgb3B0aW9ucyBhcmUgImdwIiBmb3IgR2VuZXJhbCBQdXJwb3NlIGRldmljZXMsICJocy1m
cyIgZm9yCj4+Pj4+IC0JwqAgSGlnaCBTZWN1cml0eSAtIEZpZWxkIFNlY3VyYWJsZSBkZXZpY2Vz
LCBvciAiaHMiIGZvciBIaWdoCj4+Pj4+IC0JwqAgU2VjdXJpdHkgLSBTZWN1cml0eSBFbmZvcmNp
bmcgZGV2aWNlcy7CoCBOb3RlIGZvciBhbGwgSGlnaAo+Pj4+PiAtCcKgIFNlY3VyaXR5IGRldmlj
ZSB2YXJpYW50cyB0aGUgVElfU0VDVVJFX0RFVl9QS0cgZW52aXJvbm1lbnRhbAo+Pj4+PiAtCcKg
IHZhcmlhYmxlIG11c3QgYmUgZGVmaW5lZCBhdCBidWlsZCB0aW1lIHBvaW50aW5nIHRvIGEgdmFs
aWQKPj4+Pj4gLQnCoCBjb3JlLXNlY2Rldi1rMyBmb2xkZXIgbG9jYXRpb24sIG90aGVyd2lzZSB0
aGUgYnVpbGQgd2lsbAo+Pj4+PiAtCcKgIGZhaWwsIHNlZQo+Pj4+PiAtCcKgIGh0dHBzOi8vZ2l0
LnRpLmNvbS9jZ2l0L3NlY3VyaXR5LWRldmVsb3BtZW50LXRvb2xzL2NvcmUtc2VjZGV2LWszCj4+
Pj4+IC0KPj4+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQ
Cj4+Pj4+IC0JYm9vbCAiZ3AiCj4+Pj4+IC0KPj4+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0sz
X0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTCj4+Pj4+IC0JYm9vbCAiaHMtZnMiCj4+Pj4+IC0KPj4+
Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4+Pj4+IC0J
Ym9vbCAiaHMiCj4+Pj4+IC0KPj4+Pj4gLWVuZGNob2ljZQo+Pj4+Cj4+Pj4gYW5vdGhlciBvYnNl
cnZhdGlvbiBJIG1hZGUganVzdCBub3c6IHByZXZpb3VzbHkgQlIyX1RBUkdFVF9USV9LM19JTUFH
RV9HRU5fU0VDVFlQRV9HUD15Cj4+Pj4gd2FzIHRoZSBkZWZhdWx0LCB3aGljaCBkaWRuJ3QgYm9v
dCBvbiBteSBIUy1GUyBTb0MuCj4+Pj4KPj4+PiBZb3UgcGF0Y2hzZXQgc3RhcnRlZCBvdXQtb2Yt
dGhlLWJveCwgd2hpY2gsIEkgY29uY2x1ZGUsIG1lYW5zLCBIUy1GUyBpcyBub3cgdGhlCj4+Pj4g
ZGVmYXVsdCBmb3IgQU02MnguIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSwgdGhv
dWdoLgo+Pj4KPj4+IEhTLUZTIHNob3VsZCBiZSB0aGUgZGVmYXVsdCBmb3IgYWxsIFRJIEFNNngg
ZGV2aWNlcy4gVGhpcyBpcyBvdXIKPj4+ICJwcm9kdWN0aW9uIHNpbGljb24iIGFuZCB3aGF0J3Mg
dXNlZCBmb3IgKGFsbW9zdCkgYWxsIHByb2plY3RzLAo+Pj4gZXNwZWNpYWxseSBuZXcgcHJvamVj
dHMuIFRoaXMgYmVpbmcgc2FpZCBoYXZpbmcgc3VwcG9ydCBmb3IgR1AgZGV2aWNlCj4+PiB2YXJp
YW50cyBzdGlsbCBpcyBkZXNpcmFibGUgZm9yIGV4aXN0aW5nIGJvYXJkcy9wcm9qZWN0cywgc3Vj
aCBhcyB0aGUKPj4+IGN1cnJlbnQgQmVhZ2xlUGxheSBib2FyZHMgKGFtb25nc3QgZWFybGllciB2
ZXJzaW9uIG9mIFRJIHN0YXJ0ZXIga2l0Cj4+PiBFVk1zIGZvciBBTTZ4KS4KPj4KPj4gVGhhbmsg
eW91LCBJIHdhcyBub3QgYXdhcmUgb2YgdGhpcy4KPj4KPj4gSSBmb3VuZCB5b3VyIHBvc3QgaW4g
dGhlIFRJIGZvcnVtIGFib3V0IHRoZSByZWNlbnQgc3dpdGNoIGZyb20gR1AgdG8gSFMtRlMKPj4g
ZGV2aWNlIGluIFlvY3RvIFsxXS4KPj4KPj4gQ3VycmVudGx5IGV4aXN0aW5nIGFtNjQvYW02MiBk
ZWZjb25maWdzIGFyZSBzdGlsbCB0YXJnZXRpbmcgR1AgZGV2aWNlcyBidXQgd2UKPj4gc2hvdWxk
IGFkZCBhZGRpdGlvbmFsIGNvbW1pdHMgdG8gZG8gdGhlIHN3aXRjaCB0byBIUy1GUy4KPj4KPj4g
V2hhdCBhYm91dCBvdGhlciBTb0Mgb2YgdGhlIEszIGFyY2hpdGVjdHVyZT8KPj4gSXMgdGhlIERS
QTgyOS9KNzIxZSBkZXZpY2Ugd2lsbCBhbHNvIHN3aXRjaCB0byBIUy1GUyBieSBkZWZhdWx0Pwo+
IAo+IEkgbmVlZGVkIHRvIGRvdWJsZS1jaGVjayB3aXRoIHRoZSB0ZWFtLCBzaW5jZSBJJ20gb25s
eSBpbnRpbWF0ZWx5Cj4gaW52b2x2ZWQgd2l0aCBBTTYyL0FNNjQvQU02NSB0eXBlIGRldmljZXMu
IEFsbCB0aGUgb3RoZXJzIGFyZSBtYW5hZ2VkIGJ5Cj4gYSBkaWZmZXJlbnQgZ3JvdXAgaW4gVEku
Cj4gCj4gU28gYmFzZWQgb24gd2hhdCBJIGZvdW5kIG91dCBoZXJlJ3MgdGhlIGZ1bGwgY29udGV4
dCBhY2Nyb3NzIFRJJ3MgSzMKPiBwbGF0Zm9ybSBvZiBkZXZpY2VzIGFuZCB0aGVpciBhc3NvY2lh
dGVkIFRJIEVWTXMgLyBTdGFydGVyIEtpdHM6Cj4gCj4gKiBBbGwgIlNpdGFyYSItYnJhbmQgU29D
cyAoQU02MngsIEFNNjQsIEFNNjV4KSBhcmUgSFMtRlMgZmlyc3QKPiAqIEFsbCAiSmFjaW50byIt
YnJhbmQgaW5kdXN0cmlhbCBTb0NzIChBTTY4LCBBTTY5IGFuZCBBTTY3KSBhcmUgYWxzbyBIUy1G
UyBmaXJzdAo+ICogQWxsIG5ldyAiSmFjaW50byItYnJhbmQgYXV0b21vdGl2ZS9vdGhlciBTb0Nz
IChKN0FFTiBvbndhcmRzKSBhcmUgSFMtRlMgZmlyc3QKPiAqIEFsbCBleGlzdGluZyAiSmFjaW50
byItYnJhbmQgU29DcyAoVERBNCwgSjcyMUUsIEo3MjAwLCBKNzIxUzIgYW5kIEo3ODRTNCkgYXJl
IEdQIGJ5IGRlZmF1bHQKPiAKPiBTbyB3aGlsZSB0aGVyZSBhcmUgc3RpbGwgYm9hcmRzIG91dCB0
aGVyZSB3aXRoIEdQIHNpbGljb24gKGxhc3QgYnVsbGV0KQo+IHRob3NlIGFyZSBwcm9iYWJseSBu
b3QgdGhlIHR5cGljYWwgdGFyZ2V0IHBsYXRmb3JtcyBmb3IgQnVpbGRyb290LCBiZWluZwo+IHZl
cnkgY29tcGxleCBhbmQgaGlnaC1lbmQgbXVsdGktY29yZSBTb0NzLCBtb3N0bHkgdXNlZCBpbiBh
dXRvbW90aXZlCj4gYXBwbGljYXRpb25zLiBUaGUgb25lIGV4Y2VwdGlvbiBoZXJlIHRoYXQgaGFz
IG1vcmUgd2VpZ2h0IGluIG15IG9wcGluaW9uCj4gaXMgdGhlIGN1cnJlbnQgQmVhZ2xlUGxheSBi
b2FyZCAoQU02MngtYmFzZWQpLCB0aG9zZSBhbHNvIGhhdmUgR1AgZGV2aWNlcwo+IG9uIHRob3Nl
IGJvYXJkcy4KCkknbSBjdXJlbnRseSB3b3JraW5nIG9uIGEgajcyMWUgU29DIGJhc2VkIGN1c3Rv
bSBib2FyZCBicmluZ3VwIGludm9sdmluZyBJUEMKY29tbXVuaWNhdGlvbiB3aXRoIG9uZSBEU1Ag
KEM2NngpLgoKV2hpbGUgaXQgd2FzIHBvc3NpYmxlIHRvIGJ1aWxkIHRoZSBEU1AgZmlybXdhcmUg
d2l0aGluIFlvY3RvIChkdW5mZWxsKSwgaXQKcmVxdWlyZWQgdG8gcGFja2FnZSB0aGUgVEktUERL
IHRvIHByb3ZpZGUgaGVhZGVycyBhbmQgbGlicmFyaWVzIGZvciB0aGUgRFNQCnByb2plY3QuIFdl
IGVuZHVwIGJ5IGJ1aWxkaW5nIHRoZSBEU1AgZmlybXdhcmUgb3V0c2lkZSBvZiBZb2N0byAoaXQg
d291bGQgYmUgdGhlCnNhbWUgd2l0aCBCdWlsZHJvb3QpLgoKSWYgdGhlIFNvQyBpcyBhdmFpbGFi
bGUgYW5kIGNhbiBydW4gTGludXgsIHRoZSB0aGUgcm9vdGZzIGNhbiBiZSBidWlsZCBieSBCdWls
ZHJvb3QuCgpBbmQgd2hhdCBhYm91dCB0aGUgQmVhZ2xlYm9hcmQtQUk2NCAoSjcyMWUpID8KCmh0
dHBzOi8vYmVhZ2xlYm9hcmQub3JnL2FpLTY0Cgo+IAo+IEFsbCB0aGlzIGJlaW5nIGJlaW5nIHNh
aWQsIEkgc3RhbmQgYnkgbXkgcHJldmlvdXMgY29tbWVudCB0aGF0IEhTLUZTCj4gc2hvdWxkIGJl
IHRoZSBkZWZhdWx0LiBBcyBmb3IgdGhlIEJlYWdsZVBsYXkgYm9hcmQgKHdoaWNoIGlzIGEgdmVy
eSBuaWNlCj4gY29tbXVuaXR5IGJvYXJkKSBhbmQgcG90ZW50aWFsbHkgc2VsZWN0ZWQgSmFjaW50
by1iYXNlZCBib2FyZHMgdGhpcwo+IGNvdWxkIHBvdGVudGlhbGx5IGJlIGhhbmRsZWQgd2l0aCBh
IGRlZGljYXRlZCBkZWZjb25maWcgb3Igc29tZSBvdGhlcgo+IEtjb25maWcgbWFnaWMgdG8gZW5h
YmxlIGEgc2VhbWxlc3MgYW5kIGVhc3kgb3V0IG9mIGJveCBleHBlcmllbmNlLgoKUGF0Y2ggd2Vs
Y29tZSB0aGVuIDopCgpJIGRvbid0IGhhdmUgb25lIGJ1dCBpdCB3b3VsZCBnbyBoYW5kIGluIGhh
bmQgd2l0aCBteSAob2xkKSBiZWFnbGVib2FyZCByZXYgQzIKKG9tYXAzNTMwKSEKCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAKPiAKPiAtLQo+IEFuZHJlYXMgRGFubmVuYmVyZwo+IFRleGFzIElu
c3RydW1lbnRzIEluYwo+IAo+IAo+IAo+IAo+IAo+IAo+IAo+Pgo+PiBGcm9tIHRoZSB1LWJvb3Qg
azMgZG9jdW1lbnRhdGlvbiwgaXQncyBub3QgY2xlYXIgd2l0Y2ggZGV2aWNlIHR5cGUgaXMgdXNl
ZCBieQo+PiBkZWZhdWx0IGFjcm9zcyBhbGwgazMgU29DLiBCeSBkZWZhdWx0IEkgd2FzIGV4cGVj
dGluZyB0aGUgR1AgdHlwZSBmb3IgYWxsIHRoZSBrMwo+PiBmYW1pbHkgKEkgd2FzIHdyb25nKS4K
Pj4KPj4gWzFdCj4+IGh0dHBzOi8vZTJlLnRpLmNvbS9zdXBwb3J0L3Byb2Nlc3NvcnMtZ3JvdXAv
cHJvY2Vzc29ycy9mL3Byb2Nlc3NvcnMtZm9ydW0vMTIxMDQ0My9mYXEtYW02MjUtZ2VuZXJhdGlu
Zy1zaXRhcmEtYW02MngtYW02MmF4LWFtNjR4LWdwLWRldmljZS1ib290YWJsZS1tbWMtc2QtY2Fy
ZC1pbWFnZXMtdXNpbmctc2RrLXY4LTYtYW5kLXlvY3RvCj4+Cj4+IFsyXQo+PiBodHRwczovL3Nv
dXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL21hc3Rlci9kb2MvYm9hcmQvdGkvazMu
cnN0P3JlZl90eXBlPWhlYWRzJnBsYWluPTEjTDEwOAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJv
bWFpbgo+Pgo+Pj4KPj4+IC0tCj4+PiBBbmRyZWFzIERhbm5lbmJlcmcKPj4+IFRleGFzIEluc3Ry
dW1lbnRzIEluYwo+Pj4KPj4+Cj4+Pj4KPj4+PiAtLSAKPj4+PiBBbGV4YW5kZXIgU3ZlcmRsaW4u
Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
