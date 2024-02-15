Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E8C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 22:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4521C41AC7;
	Thu, 15 Feb 2024 22:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3AZi0UWRqE0; Thu, 15 Feb 2024 22:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69C5405E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C69C5405E9;
	Thu, 15 Feb 2024 22:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E22D41BF2BE
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB2B40386
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pu0ydgewrHss for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 22:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32765402D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32765402D0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32765402D0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 22:32:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-511531f03f6so177034e87.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708036323; x=1708641123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x/EKKW++6Z7AW5WwoGbiYLL0s4MrISdccRRWwvXww8g=;
 b=SI30//Pv8Ks8iFvmSesv+zOMaGBQnAtudYsK+LFpLxerRcseWq5yPIjGr+6RNYKTER
 RS2KcS4XYpZKwGlSzhngH+0iEqejV5JBzI/yyw6XWIkKGl/jDGekExkJO2TNopfwjqa1
 fzHv6wHF9lyLNBkJ0EF+LSXtKA8faxabfUfCVJgAZSNIUtZNT4lRfVCnLpceMJicyzQt
 06EhjqFhJ1X/ERHEg9gFWL/pj8RRgNUgV9birSn++XDIXFQxhvz5E0ixkFSHhq0CqYdG
 9s9L8gKow8mcv3k8HAfB25xG9hZyN658VMzGTHSEAOMEPFMHSHdr/5NIIasTcfbGiRBi
 n/Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1YYCgbE6Qyle6vbBJXsZlvVkqq90QsfYzoUB23epF+TqLmNiR3715rRbV6GQ9qIAQ4pHvHgCW4B4lFuRKi9yIH3e3QLfUig==
X-Gm-Message-State: AOJu0YzsFn9CBbnX/1OtpJMi5hHNMrdDhjMUF/DH/LurrAtAbcv4f6nS
 2lnkIBivhG0kA89XCQm3v/asTaB4OEGXDsITf7OlXaKkCZzwqMx+mwikeu6f3CY=
X-Google-Smtp-Source: AGHT+IFbjvkX1rOHLN15uYD53YHxjKFNzwb1K/FYXAGxZ92war9j0P0cfiMhDU9tt+SbBR0/+xhOYA==
X-Received: by 2002:ac2:58d5:0:b0:511:69bf:d1b0 with SMTP id
 u21-20020ac258d5000000b0051169bfd1b0mr2294858lfo.51.1708036322944; 
 Thu, 15 Feb 2024 14:32:02 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a056512014100b005115fc3d7f8sm392717lfo.205.2024.02.15.14.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 14:32:02 -0800 (PST)
Message-ID: <4109841d-095a-471a-be39-1cf790a2b345@smile.fr>
Date: Thu, 15 Feb 2024 23:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
 <7e253e56-25f4-494a-98d9-e0d908517acd@smile.fr>
 <4f2fdb3c732480061d815f9f898da9fea9b77387.camel@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <4f2fdb3c732480061d815f9f898da9fea9b77387.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708036323; x=1708641123;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x/EKKW++6Z7AW5WwoGbiYLL0s4MrISdccRRWwvXww8g=;
 b=gmGLwW/u27pdzn5SF4gIv41mBo8lA6phXJVWv1Db6lJjJqv5Q1Z7IhA71+m0KXhtiT
 QdryQakIs15kSP3jiFvK1/UfG8JMqNGORtAY8BlUfx3SnRq1R2SJhXVyyyxx/muUYR+g
 Fffzp6p70m4qDGu8SnFniEz2NdYt94lHsC64piySzh8AQppqlMSHDUB1HM0cEbwyFTxp
 WOt/GF562twZJqzY4+HiI6q56H3EUSKsE390UPaqiXhS2bRygl9qtCPTPJRCa3ugmLlr
 pzbqVoTTJrNGY2wiZBdLpM2KbU6JlL9R4pkOFv/XNla9RsodWZN74/a9jJFtAlpVy/YD
 xgWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gmGLwW/u
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKTGUgMTUvMDIvMjAyNCDDoCAxOTo1MCwgQWxleGFuZGVyIFN2ZXJkbGlu
IGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFRodSwgMjAyNC0wMi0xNSBhdCAxMjoy
NiArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+Pj4gT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4
OjI4ICswMTAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+Pj4gLWNob2ljZQo+Pj4+IC0JcHJvbXB0
ICJTZWN1cml0eSB0eXBlIgo+Pj4+IC0JaGVscAo+Pj4+IC0JwqAgVGhlIHRhcmdldCBTb0Mgc2Vj
dXJpdHkgdHlwZSBvcHRpb24gZm9yIGltYWdlIGdlbi7CoCBWYWxpZAo+Pj4+IC0JwqAgb3B0aW9u
cyBhcmUgImdwIiBmb3IgR2VuZXJhbCBQdXJwb3NlIGRldmljZXMsICJocy1mcyIgZm9yCj4+Pj4g
LQnCoCBIaWdoIFNlY3VyaXR5IC0gRmllbGQgU2VjdXJhYmxlIGRldmljZXMsIG9yICJocyIgZm9y
IEhpZ2gKPj4+PiAtCcKgIFNlY3VyaXR5IC0gU2VjdXJpdHkgRW5mb3JjaW5nIGRldmljZXMuwqAg
Tm90ZSBmb3IgYWxsIEhpZ2gKPj4+PiAtCcKgIFNlY3VyaXR5IGRldmljZSB2YXJpYW50cyB0aGUg
VElfU0VDVVJFX0RFVl9QS0cgZW52aXJvbm1lbnRhbAo+Pj4+IC0JwqAgdmFyaWFibGUgbXVzdCBi
ZSBkZWZpbmVkIGF0IGJ1aWxkIHRpbWUgcG9pbnRpbmcgdG8gYSB2YWxpZAo+Pj4+IC0JwqAgY29y
ZS1zZWNkZXYtazMgZm9sZGVyIGxvY2F0aW9uLCBvdGhlcndpc2UgdGhlIGJ1aWxkIHdpbGwKPj4+
PiAtCcKgIGZhaWwsIHNlZQo+Pj4+IC0JwqAgaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvc2VjdXJp
dHktZGV2ZWxvcG1lbnQtdG9vbHMvY29yZS1zZWNkZXYtazMKPj4+PiAtCj4+Pj4gLWNvbmZpZyBC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQCj4+Pj4gLQlib29sICJncCIKPj4+
PiAtCj4+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZT
Cj4+Pj4gLQlib29sICJocy1mcyIKPj4+PiAtCj4+Pj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0sz
X0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4+Pj4gLQlib29sICJocyIKPj4+PiAtCj4+Pj4gLWVuZGNo
b2ljZQo+Pj4KPj4+IGFub3RoZXIgb2JzZXJ2YXRpb24gSSBtYWRlIGp1c3Qgbm93OiBwcmV2aW91
c2x5IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfR1A9eQo+Pj4gd2FzIHRoZSBk
ZWZhdWx0LCB3aGljaCBkaWRuJ3QgYm9vdCBvbiBteSBIUy1GUyBTb0MuCj4+Pgo+Pj4gWW91IHBh
dGNoc2V0IHN0YXJ0ZWQgb3V0LW9mLXRoZS1ib3gsIHdoaWNoLCBJIGNvbmNsdWRlLCBtZWFucywg
SFMtRlMgaXMgbm93IHRoZQo+Pj4gZGVmYXVsdCBmb3IgQU02MnguIEknbSBub3Qgc3VyZSBpZiB0
aGlzIGlzIGEgcHJvYmxlbSwgdGhvdWdoLgo+Pj4KPj4KPj4gSSBkb24ndCB0aGluayBzbywgdGhl
IGFtNjJ4IGRlZmNvbmZpZyBzaG91bGQgc3RpbGwgYmUgZm9yIEdQIFNvQyBieSBkZWZhdWx0Lgo+
IAo+IEknbSBwcmV0dHkgc3VyZSBpdCdzIEhTLUZTIGJ5IGRlZmF1bHQsIGJlY2F1c2UgR1AgKGFz
IG9mIHRvZGF5cyAibWFzdGVyIikKPiAKPj4+PiB0aS1rMy1pbWFnZS1nZW4gMDguMDYuMDAuMDA3
IEV4dHJhY3RpbmcKPiBnemlwIC1kIC1jIC9ob21lL2FsZXgvcmVtb3RlL2J1aWxkcm9vdC9kbC90
aS1rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy50YXIuZ3ogfCAvaG9tZS9h
bGV4L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL3RhciAtLXN0cmlwLWNvbXBvbmVu
dHM9MSAtQwo+IC9ob21lL2FsZXgvcmVtb3RlL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdGktazMt
aW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNyAgIC14ZiAtCj4+Pj4gdGktazMtaW1hZ2UtZ2VuIDA4LjA2
LjAwLjAwNyBQYXRjaGluZwo+Pj4+IHRpLWszLWltYWdlLWdlbiAwOC4wNi4wMC4wMDcgQ29uZmln
dXJpbmcKPiBjcCAvaG9tZS9hbGV4L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy90aS1z
eXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1mcy5iaW4gL2hvbWUvYWxleC9yZW1vdGUvYnVp
bGRyb290L291dHB1dC9idWlsZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAuMDA3Cj4gY3A6IGNh
bm5vdCBzdGF0ICcvaG9tZS9hbGV4L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy90aS1z
eXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1mcy5iaW4nOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI3MzogL2hvbWUvYWxl
eC9yZW1vdGUvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAu
MDA3Ly5zdGFtcF9jb25maWd1cmVkXSBFcnJvciAxCgpXZWlyZCwgdGhlIGdpdGxhYi1jaSBidWls
ZCBmaW5lIHdpdGggOgoKQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFPXkKQlIyX1RBUkdF
VF9USV9LM19JTUFHRV9HRU49eQojIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYy
QVggaXMgbm90IHNldAojIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYyWCBpcyBu
b3Qgc2V0CkJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTY0WD15CiMgQlIyX1RBUkdF
VF9USV9LM19JTUFHRV9HRU5fU09DX0FNNjVYIGlzIG5vdCBzZXQKQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU0VDVFlQRV9HUD15CiMgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQ
RV9IU19GUyBpcyBub3Qgc2V0CiMgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9I
UyBpcyBub3Qgc2V0CkJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQz0iYW02NHgiCkJSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEU9InRpLXNjaSIKQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU0VDVFlQRT0iZ3AiCkJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSPXkKQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfTEFURVNUX1ZFUlNJT049eQoKQU02NHg6IGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjEzNDMwNTY1MAoKU2FtZSBm
b3IgQU02Mng6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvNjEzNDMwNTYxOQoKPiAKPiBTbyBvdmVyYWxsLCBmb3IgSFMtRlMgaXQgZG9lc24ndCBsb29r
IGFzIGEgcmVncmVzc2lvbiB3aXRoIHlvdSBwYXRjaHNldCwKPiBidXQgcmF0aGVyIGFzIGltcHJv
dmVtZW50LCBldmVuIHRob3VnaCBpdCBkb2Vzbid0IGJvb3QsIGJ1dCBpdCBidWlsZHMKPiBhdCBs
ZWFzdC4uLgo+IAo+IEkgY2FuIHRyeSB0byBsb29rIHdoYXQgY291bGQgYmUgdGhlIHByb2JsZW0g
d2l0aCBVLUJvb3QgZW52aXJvbm1lbnQuLi4KPiAKWWVzIHBsZWFzZS4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
