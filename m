Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEBBC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B5540492;
	Mon,  8 Jul 2024 21:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrNRfyn5zQ9b; Mon,  8 Jul 2024 21:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50424062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A50424062E;
	Mon,  8 Jul 2024 21:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDC171BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA75C40173
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFM7QbwEwWCG for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 215A3400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215A3400AF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 215A3400AF
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:24:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 689211BF203;
 Mon,  8 Jul 2024 21:24:41 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:24:40 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240708232440.56e59da4@windsurf>
In-Reply-To: <20240704-tipidee-v1-8-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
 <20240704-tipidee-v1-8-5ef0942b2025@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720473881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnBcBTHrwC2v5C3ppw04VDqG38MJ6WpLzC9CoC4+jTA=;
 b=YP0Vyr8JQhToPq9fsojFGLlajjK9W7nG0luazHt+azgMy0c+eEIePfrbercOr27T52Fm+Z
 WFiM0PMYlgiLb40Cetz4t6gA2/+KlPJli/GFne1wZZclGK58v7zIG5I+ggQdc2cmeWw+s0
 /iY038sVHbEvtLN8pBOfiiWt+D3Ea9X0BNg/pdHcGNC0YBdoH0+n4nlr4uYqw5DHXY98bU
 ks0pRi6NXBBh4QwD5SAw30wsz1c+/fLiruiFR+gHtJMqYjkI+6EUk4gjjLPMnWKaX679mr
 kmGSZ59hTjabZYi/Xr0ddjR3AerJ79gtXVGjVdVf1rj/GJQOsJl7Q2p+w8tkLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YP0Vyr8J
Subject: Re: [Buildroot] [PATCH 8/8] tipidee: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDA0IEp1bCAyMDI0IDIxOjQwOjM0ICswMjAwCkouIE5ldXNjaMOkZmVy
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KClRoYW5rcyBm
b3IgdGhpcyBjb250cmlidXRpb24hCgo+ICtpZiBCUjJfUEFDS0FHRV9USVBJREVFCj4gKwo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfVElQSURFRV9DT05GSUdVUkFUSU9OCj4gKwlib29sICJpbnN0YWxs
IGEgY29uZmlndXJhdGlvbiBmaWxlIHRvIC9ldGMvdGlwaWRlZS5jb25mLmNkYiIKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9IT1NUX1RJUElERUUKPiArCWhlbHAKPiArCSAgQnVpbGQgYSB0aXBpZGVl
IGNvbmZpZ3VyYXRpb24gYW5kIGluc3RhbGwgaXQgdG8gdGhlIHRhcmdldC4KPiArCj4gK2NvbmZp
ZyBCUjJfUEFDS0FHRV9USVBJREVFX0NPTkZJR1VSQVRJT05fRklMRQo+ICsJc3RyaW5nICJjb25m
aWd1cmF0aW9uIHNvdXJjZSBmaWxlIgo+ICsJZGVmYXVsdCAiJChDT05GSUdfRElSKS90aXBpZGVl
LmNvbmYiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1RJUElERUVfQ09ORklHVVJBVElPTgo+
ICsJaGVscAo+ICsJICBUaGUgY29uZmlndXJhdGlvbiBmaWxlIGluIHNvdXJjZSAodGV4dCkgZm9y
bWF0LCBkb2N1bWVudGVkIGF0Ogo+ICsKPiArCSAgaHR0cHM6Ly9za2FybmV0Lm9yZy9zb2Z0d2Fy
ZS90aXBpZGVlL3RpcGlkZWUuY29uZi5odG1sCgpJJ20gbm90IHN1cmUgdGhvc2UgY29uZmlndXJh
dGlvbiBvcHRpb25zIGFyZSByZWFsbHkgbmVlZGVkLiBXZSB1c3VhbGx5CmRvbid0IG1ha2UgdGhl
IGNvbmZpZ3VyYXRpb24gZmlsZSBjb25maWd1cmFibGUsIGFuZCBsZWF2ZSB0aGF0IHVwIHRvIGEK
cm9vdGZzLW92ZXJsYXkuIEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBjb25maWd1cmF0aW9uIGlzIGFw
cGFyZW50bHkKImNvbXBpbGVkIiwgYnV0IEkgd291bGQgcGVyaGFwcyBsZWF2ZSB0aGF0IHVwIHRv
IGJlIG92ZXJyaWRkZW4gYnkgYQpwb3N0LWJ1aWxkIHNjcmlwdD8gT3IgcGVyaGFwcyB3ZSBzaG91
bGQgZG8gdGhpcyBjb25maWd1cmF0aW9uIGZpbGUKImNvbXBpbGF0aW9uIiBhcyBhIFRBUkdFVF9G
SU5BTElaRV9IT09LUyBzbyB0aGF0IGl0IGhhcHBlbnMgYWZ0ZXIKcm9vdGZzLW92ZXJsYXkgYXJl
IGNvcGllZCwgYWxsb3dpbmcgdGhlIHVzZXIgdG8gb3ZlcnJpZGUgdGhlCmNvbmZpZ3VyYXRpb24g
ZmlsZSwgd2hpbGUgc3RpbGwgc2VlaW5nIGl0ICJjb21waWxlZCI/Cgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3RpcGlkZWUvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3RpcGlkZWUvQ29uZmlnLmlu
Lmhvc3QKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjkzZTU0OGRm
MWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS90aXBpZGVlL0NvbmZpZy5pbi5ob3N0
Cj4gQEAgLTAsMCArMSw4IEBACj4gK2NvbmZpZyBCUjJfSE9TVF9QQUNLQUdFX1RJUElERUUKPiAr
CWJvb2wgImhvc3QgdGlwaWRlZSIKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBza2FsaWJz
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU0tBTElCUwo+ICsJaGVscAo+ICsJICBUaGlzIHBhY2th
Z2UgYnVpbGRzIHRoZSB0aXBpZGVlLWNvbmZpZyB0b29sIGZvciB0aGUgaG9zdC4KPiArCj4gKwkg
IGh0dHBzOi8vc2thcm5ldC5vcmcvc29mdHdhcmUvdGlwaWRlZS8KCkknbSBub3Qgc3VyZSB3ZSBy
ZWFsbHkgbmVlZCBhIHZpc2libGUgY29uZmlnIG9wdGlvbiBmb3IgdGhpcywKaG9zdC10aXBpZGVl
IGlzIGdvaW5nIHRvIGJlIGEgZGVwZW5kZW5jeSBvZiB0aXBpZGVlIGFueXdheS4KCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rIGIvcGFja2FnZS90aXBpZGVlL3RpcGlk
ZWUubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjJmZGU3NWI4
N2QKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsKPiBA
QCAtMCwwICsxLDcyIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyB0aXBp
ZGVlCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1RJUElERUVfVkVSU0lP
TiA9IDAuMC41LjAKPiArVElQSURFRV9TSVRFID0gaHR0cHM6Ly9za2FybmV0Lm9yZy9zb2Z0d2Fy
ZS90aXBpZGVlCj4gK1RJUElERUVfTElDRU5TRSA9IElTQwo+ICtUSVBJREVFX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HCj4gK1RJUElERUVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK1RJUElERUVf
REVQRU5ERU5DSUVTID0gc2thbGlicwo+ICsKPiArVElQSURFRV9DT05GX09QVFMgPSBcCj4gKwkt
LXByZWZpeD0vIFwKClRoaXMgbG9va3Mgb2RkLCB3aHkgbm90IC0tcHJlZml4PS91c3IgPwoKVGhl
IHJlc3QgcmVhbGx5IGxvb2tzIHN1cGVyIHJlYXNvbmFibGUgdG8gbWUsIGdvb2Qgd29yayEKCkJl
c3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
