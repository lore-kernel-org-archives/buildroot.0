Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB73EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC9DB40173;
	Sat, 11 Dec 2021 20:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3vM5dag6rXX; Sat, 11 Dec 2021 20:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 803134021E;
	Sat, 11 Dec 2021 20:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0C801BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F46742502
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bJaOMHO5BDe for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:44:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC0442504
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:44:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r11so39628727edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uYJao+Bp4zOWNYFDwjEKasZG6hG47qfhvyh7Av6UcC8=;
 b=V3pv5d2xcQjVEhV1wJQ8dAJcjzGEeKVTwMNagBdENhSpPMd0SlBRAmoWp8gYwYuX+p
 vbSdwdpZW3cJFolWMfq9ETQhIyUq04XqFWzwaM9gp7gkD2BZurmp0NBJAzmH6KOXBBzr
 3S6fxC30ckFN7XOdjDUVq3iSlUqL3mfuHtOsIqR6xpwvHZqkOuhIHd/3EFrEyzzJ1cBa
 hA0KQNiHOTxip609tiwJ8hhLit9ACy6zVVAI39huga3Z9R8S6YsiBY/juhSsIOx3AHB9
 Gq0eCOBurKy9M828dAhviy269XypeH9z6TndeAFxn7+5p4LLkGgubbbMHTSvSPOXQ1rB
 OZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uYJao+Bp4zOWNYFDwjEKasZG6hG47qfhvyh7Av6UcC8=;
 b=PtdlpT14ej3ru4nACN3bxAn3x22asUVKC5dLeNZi8lD0aIF4svBitFFeKExRR4Qd/h
 vTwR7MAODHNNivojWD1ZRH8kPGpVBjPYu06vNwHjFBlto+KZKEtaLyYJS6hVx0acmyJG
 DopF+y+d38Qp3dJ3QexewSEP5xfTS794qJCkUHKBRgz8tWV/3QH46LOZrfNsn4oJnodL
 CGz0CPJFUoot8bENFWOorEuFGl/c+qV04ozUfEdgP3NS/d7lnXacccjej059Nh9X2XO6
 f47jFiHLQI0KIqdSemgcRyrmVjScnR5KHwUVgKYHWPYw6YIvJDMBgTZmcs4S/+FkXMy2
 OEkg==
X-Gm-Message-State: AOAM531OzAamr5U5nN3OfRL9l8796h2qtIvPSsEry0Mo0vWPyCJ2S7Jd
 7IM9MiVTlYj7CzefVw1WUkQiag==
X-Google-Smtp-Source: ABdhPJyJfturyCxpDJCdfxvrMQNObDgkBuzVltLGJ0IskkEz7unF5iOLBCDEUSnx0aBXVyjR8yLFOA==
X-Received: by 2002:a17:907:2627:: with SMTP id
 aq7mr32941133ejc.483.1639255444830; 
 Sat, 11 Dec 2021 12:44:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id oz11sm3623366ejc.81.2021.12.11.12.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:44:04 -0800 (PST)
Message-ID: <d798a86f-7ffe-8d5f-b81b-2f0e136a6396@mind.be>
Date: Sat, 11 Dec 2021 21:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211122222519.3539534-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211122222519.3539534-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: drop first patch
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8xMS8yMDIxIDIzOjI1LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpcnN0IHBh
dGNoIGlzIG5vdCBuZWVkZWQgc2luY2UgYnVtcCB0byB2ZXJzaW9uIDAuOTkuMSBpbiBjb21taXQK
PiAyYzhlNWRkNjlmNGYyODFiMmI0OTdhZTdlYzllYzk1YzQ3ZTdjODBjIGFuZAo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9DaXNjby1UYWxvcy9jbGFtYXYvY29tbWl0LzY4OTAwNTMxNzY4MDg1NDYyN2I3
OWM3NmZmYTZlNDJhODE2MGIwZTEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICAuLi5jLWZpeC1idWlsZC1lcnJvci1k
dWUtdG8tbWlzc2luZy1zb2MucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAuLi5h
Y2t0cmFjZS1pZi11c2luZy11Q2xpYmMtd2l0aG91dC1iYS5wYXRjaH0gfCAgMAo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAzNCBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2NsYW1hdi8wMDAxLWNsYW1kc2Nhbi1wcm90by5jLWZpeC1idWlsZC1lcnJvci1kdWUtdG8tbWlz
c2luZy1zb2MucGF0Y2gKPiAgIHJlbmFtZSBwYWNrYWdlL2NsYW1hdi97MDAwMi1tYm94LWRvLW5v
dC11c2UtYmFja3RyYWNlLWlmLXVzaW5nLXVDbGliYy13aXRob3V0LWJhLnBhdGNoID0+IDAwMDEt
bWJveC1kby1ub3QtdXNlLWJhY2t0cmFjZS1pZi11c2luZy11Q2xpYmMtd2l0aG91dC1iYS5wYXRj
aH0gKDEwMCUpCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2xhbWF2LzAwMDEtY2xhbWRzY2Fu
LXByb3RvLmMtZml4LWJ1aWxkLWVycm9yLWR1ZS10by1taXNzaW5nLXNvYy5wYXRjaCBiL3BhY2th
Z2UvY2xhbWF2LzAwMDEtY2xhbWRzY2FuLXByb3RvLmMtZml4LWJ1aWxkLWVycm9yLWR1ZS10by1t
aXNzaW5nLXNvYy5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGRhYWM2
NzdlYWEuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2NsYW1hdi8wMDAxLWNsYW1kc2Nhbi1w
cm90by5jLWZpeC1idWlsZC1lcnJvci1kdWUtdG8tbWlzc2luZy1zb2MucGF0Y2gKPiArKysgL2Rl
di9udWxsCj4gQEAgLTEsMzQgKzAsMCBAQAo+IC1Gcm9tIDUyZmRhNmU2Njg5ZTIyODY2YTM5ZWM0
MjczNzEzZmI2MDM1YzM4YjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gLUZyb206IEJlcm5k
IEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KPiAtRGF0ZTogTW9uLCA3IE1heSAyMDE4
IDIzOjE0OjQ2ICswMjAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gY2xhbWRzY2FuL3Byb3RvLmM6IGZp
eCBidWlsZCBlcnJvciBkdWUgdG8gbWlzc2luZyBzb2NrYWRkcl91bgo+IC0gZGVmaW5pdGlvbgo+
IC1NSU1FLVZlcnNpb246IDEuMAo+IC1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKPiAtQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IC0KPiAtcHJvdG8uYzog
SW4gZnVuY3Rpb24g4oCYZGNvbm5lY3TigJk6Cj4gLXByb3RvLmM6ODY6Njc6IGVycm9yOiBpbnZh
bGlkIGFwcGxpY2F0aW9uIG9mIOKAmHNpemVvZuKAmSB0byBpbmNvbXBsZXRlIHR5cGUg4oCYc3Ry
dWN0IHNvY2thZGRyX3Vu4oCZCj4gLSAgICAgICAgICAgICBpZiAoY29ubmVjdChzb2NrZCwgKHN0
cnVjdCBzb2NrYWRkciAqKSZuaXhzb2NrLCBzaXplb2Yobml4c29jaykpID09IDApCj4gLQo+IC1T
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gLVVw
c3RyZWFtLXN0YXR1czogaHR0cDovL2x1cmtlci5jbGFtYXYubmV0L21lc3NhZ2UvMjAxNDA5Mjgu
MTMwODI5LjU0OTRmZDY4LmVuLmh0bWwKPiAtLS0tCj4gLSBjbGFtZHNjYW4vcHJvdG8uYyB8IDEg
Kwo+IC0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gLQo+IC1kaWZmIC0tZ2l0IGEv
Y2xhbWRzY2FuL3Byb3RvLmMgYi9jbGFtZHNjYW4vcHJvdG8uYwo+IC1pbmRleCAwMjA1ZjZkYTAu
LmQzMzk2NzMyZiAxMDA2NDQKPiAtLS0tIGEvY2xhbWRzY2FuL3Byb3RvLmMKPiAtKysrIGIvY2xh
bWRzY2FuL3Byb3RvLmMKPiAtQEAgLTQyLDYgKzQyLDcgQEAKPiAtICNpbmNsdWRlIDxzeXMvc3Rh
dC5oPgo+IC0gI2luY2x1ZGUgPGZjbnRsLmg+Cj4gLSAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4g
LSsjaW5jbHVkZSA8c3lzL3VuLmg+Cj4gLSAjaWZkZWYgSEFWRV9TWVNfU0VMRUNUX0gKPiAtICNp
bmNsdWRlIDxzeXMvc2VsZWN0Lmg+Cj4gLSAjZW5kaWYKPiAtLS0KPiAtMi4xNC4zCj4gLQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NsYW1hdi8wMDAyLW1ib3gtZG8tbm90LXVzZS1iYWNrdHJhY2Ut
aWYtdXNpbmctdUNsaWJjLXdpdGhvdXQtYmEucGF0Y2ggYi9wYWNrYWdlL2NsYW1hdi8wMDAxLW1i
b3gtZG8tbm90LXVzZS1iYWNrdHJhY2UtaWYtdXNpbmctdUNsaWJjLXdpdGhvdXQtYmEucGF0Y2gK
PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2NsYW1hdi8wMDAy
LW1ib3gtZG8tbm90LXVzZS1iYWNrdHJhY2UtaWYtdXNpbmctdUNsaWJjLXdpdGhvdXQtYmEucGF0
Y2gKPiByZW5hbWUgdG8gcGFja2FnZS9jbGFtYXYvMDAwMS1tYm94LWRvLW5vdC11c2UtYmFja3Ry
YWNlLWlmLXVzaW5nLXVDbGliYy13aXRob3V0LWJhLnBhdGNoCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
