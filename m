Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988DBC48BC3
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 15:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFA340493;
	Wed, 21 Feb 2024 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTG6y0pToWN7; Wed, 21 Feb 2024 15:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB728416E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB728416E7;
	Wed, 21 Feb 2024 15:29:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E376D1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 15:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B473605C2
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zVUPz6kyTDY for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 15:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC5AA60E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5AA60E47
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC5AA60E47
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 15:29:27 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d1094b549cso97531141fa.3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 07:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708529365; x=1709134165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=COYWKDEUouQgpFhyFCzysafiZ1bXWRgR3PhdAPeoBYY=;
 b=ibhGVwhsEAH6ZTym/KNfYBoYQCtkpWKvCmNeh37MbRdgbpz5ms7gw6oCYy3Nt0FTeF
 IqtpVBOM2Jx3zFYe4fvzcN9b9Lp9rw4YO9KSBm6/hjtuxkp3KOy/l9ZY6Qk3rbdpKEFP
 Hyx6IiUGV1dx6tNsXnu3kBL1WmgVhblU8HA2iu1SFSuDMi4ityhfAyo8uvzs3ZTU5TTD
 brO6VNi30ClaqISJ/I89gutvJYjBESkMsGcqVDfViibsDZsJQtjOG91HKJl2PW+TUUNR
 ykBracOOAouePO6oZd+YTpoC3Zj9uaQxILFYiv34b8j086+28FCMUxVWgf5sU7Rh+TBA
 qAFw==
X-Gm-Message-State: AOJu0YxvLfTXuPX8yi108vu16nnJhDnViVTUUZb38RHkM4hnnGtp00G4
 s94/YaxdBv9jeHO5MpHa4bZYHii+q4k5Rd7TtsZ8bTogfT3OmY8oX0oXWapwfLw=
X-Google-Smtp-Source: AGHT+IHW6gh+LWM1ax9Ao2bDCQU3FaLsRr7rwujVKPzYbNiHMfUloDeGg8woLE7CaKfV5IC8LWd2bA==
X-Received: by 2002:a2e:a9a5:0:b0:2d2:2fc3:7b03 with SMTP id
 x37-20020a2ea9a5000000b002d22fc37b03mr9936020ljq.41.1708529365108; 
 Wed, 21 Feb 2024 07:29:25 -0800 (PST)
Received: from ?IPV6:2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396?
 ([2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396])
 by smtp.gmail.com with ESMTPSA id
 hi20-20020a05600c535400b00412785708e7sm1685977wmb.1.2024.02.21.07.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 07:29:24 -0800 (PST)
Message-ID: <7c4ef18e-774f-4a65-8e51-7a016ed89649@smile.fr>
Date: Wed, 21 Feb 2024 16:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
 <af65f8aa-c746-4933-859b-1724d8653e91@smile.fr>
 <CABGWkvrGiZhCq3WVOSFf=P1MxP8Vz7bAkHY8yYrx-89CGm5C5g@mail.gmail.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvrGiZhCq3WVOSFf=P1MxP8Vz7bAkHY8yYrx-89CGm5C5g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708529365; x=1709134165;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=COYWKDEUouQgpFhyFCzysafiZ1bXWRgR3PhdAPeoBYY=;
 b=rbFwO4uhznmFDm7O0Kbzy+qUuoaThoeBWFwK4dMY+fJdyU2dW3J3sMnr3oIloo+eN9
 nf9n78W5R+Cpz8R28T+tebhoVVWWiXx1AAoFSmM4HylFDOZGdK86xE7tB9CvAT858LM4
 zgYZML6W6XPXYN/fIU0EBygmZfAHrPksRZSlrSL752y0OjcBDAwUKCqEhBbkfZlTp17a
 sKK2LtM9LRPc8W+MoK1oguSvEUslPDHMXS4vNDbxfxzS++NrxxVFMmuNoT0CdNKmCIDn
 XqnNgPSS+We5lOOSspPZB5/WBGjG2pXVT4UfsXrNKu1VR5vWh7mMCJpFw5rQyWadBwcE
 Edcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rbFwO4uh
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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

SGVsbG8gRGFyaW8sCgpMZSAyMS8wMi8yMDI0IMOgIDExOjE5LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBNb24sIEZlYiAxOSwgMjAyNCBhdCAxMToxNeKA
r0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4KPj4gSGVs
bG8gRGFyaW8sCj4+Cj4+IExlIDE3LzAyLzIwMjQgw6AgMTc6MDIsIERhcmlvIEJpbmFjY2hpIGEg
w6ljcml0IDoKPj4+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3Zp
ZGUgYSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4+PiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCAr
IFUtQm9vdCBjb21iaW5hdGlvbnMsIHRvIG1vcmUgY29tcGxleAo+Pj4gYXJyYW5nZW1lbnRzIHdp
dGggbWFueSBwYXJ0cy4KPj4+Cj4+PiBUaGUgcGF0Y2ggc2V0IHRoZSBCSU5NQU5fSU5ESVJTIGVu
dmlyb25tZW50IHZhcmlhYmxlIHRvIHByb3ZpZGUgdGhlCj4+PiBkaXJlY3RvcnkgdG8gc2VhcmNo
IGZvciBiaW5hcnkgYmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPj4+
IGJpbm1hbi4KPj4+Cj4+PiBDby1kZXZlbG9wZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNo
YWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmlt
YXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pgo+
Pj4gLS0tCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2NDoKPj4+IC0gRHJvcCB0aGUgQlIyX1RBUkdFVF9U
SV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KPj4+Cj4+PiBDaGFuZ2VzIGluIHYyOgo+
Pj4gLSBDaGFuZ2UgY29tbWl0IG1lc3NhZ2UKPj4+IC0gQWRkIEJSMl9UQVJHRVRfVElfSzNfUjVf
TE9BREVSX1VTRV9CSU5NQU4gb3B0aW9uCj4+PiAtIFNlbGVjdCBwYWNrYWdlcyByZXF1aXJlZCBi
eSBiaW5tYW4gaWYKPj4+ICAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBp
cyBlbmFibGVkCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4gLS0tCj4+PiAgYm9vdC90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgMTMgKysrKysrKysrKysrLQo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+Pj4gaW5kZXggMGZmY2I4MjM1ZjJlLi4yYTEw
MDI0YWVkYWEgMTAwNjQ0Cj4+PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsKPj4+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
awo+Pj4gQEAgLTM5LDcgKzM5LDEzIEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBc
Cj4+PiAgICAgICBob3N0LXBrZ2NvbmYgXAo+Pj4gICAgICAgJChCUjJfTUFLRV9IT1NUX0RFUEVO
REVOQ1kpIFwKPj4+ICAgICAgIGhvc3QtYXJtLWdudS10b29sY2hhaW4gXAo+Pj4gLSAgICAgaG9z
dC1vcGVuc3NsCj4+PiArICAgICBob3N0LW9wZW5zc2wgXAo+Pj4gKyAgICAgaG9zdC1weXRob24t
YXR0cnMgXAo+Pj4gKyAgICAgaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4+PiArICAgICBob3N0
LXB5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zIFwKPj4+ICsgICAgIGhvc3QtcHl0aG9u
LXB5eWFtbCBcCj4+PiArICAgICBob3N0LXB5dGhvbi1yZWZlcmVuY2luZyBcCj4+PiArICAgICBo
b3N0LXB5dGhvbi1ycGRzLXB5Cj4+Cj4+IE1vc3Qgb2YgdGhlc2VzIG5ldyBkZXBlbmRlbmNpZXMg
YXJlIG5vdCB0aS1rMy1yNS1sb2FkZXIgZGVwZW5kZW5jaWVzIGJ1dAo+PiBob3N0LXB5dGhvbi1q
c29uc2NoZW1hIHJ1bnRpbWUgZGVwZW5kZW5jaWVzLgo+IAo+IEkgcmVtb3ZlZCB0aGUgcnVudGlt
ZSBkZXBlbmRlbmNpZXMgYW5kIHRyaWVkIHRvIG1vZGlmeSB0aGUgcGF0Y2ggYmFzZWQKPiBvbiB5
b3VyIGluZGljYXRpb25zIGFuZCB5b3VyIHBhdGNoCj4gKGh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4yODcyODQ5LTExLXJv
bWFpbi5uYW91ckBzbWlsZS5mci8pLAo+IGJ1dCBJJ20gZW5jb3VudGVyaW5nIGNvbXBpbGF0aW9u
IGVycm9ycyBzcGVjaWZpY2FsbHkgb24gdGhlIFB5dGhvbgo+IG1vZHVsZXMgdGhhdCB5b3UgaW5k
aWNhdGVkIGFzIHJ1bnRpbWUKPiBkZXBlbmRlbmNpZXMuCgpXaGF0J3MgdGhlIGlzc3VlPwoKTWFr
ZSBzdXJlIHRvIHRha2UgaG9zdC1weXRob24gY2hhbmdlcyBmcm9tIG15IHNlcmllcywgc29tZSBv
ZiB0aGVtIHdhcyB1cGRhdGVkCndpdGggdGhlaXIgb3duIHJ1bnRpbWUgZGVwZW5kZW5jaWVzOgoK
Rm9yIGV4YW1wbGU6Cmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4yODcyODQ5LTctcm9tYWluLm5hb3VyQHNtaWxlLmZyLwoK
IEkgdHJpZWQgdG8gY29tcGlsZSB0aV9hbTYyeF9za19kZWZjb25maWcgb24geW91ciBzZXJpZXMK
PiAoaS4gZS4gIkFkZCB0aV9qNzIxZV9za19kZWZjb25maWciKSwKPiBidXQgaXQgc2VlbXMgbGlr
ZSB0aGUgSFNGUyBvcHRpb24gaGFzIGRpc2FwcGVhcmVkLgoKSW5kZWVkLCB0aGlzIGlzIHNvbWV0
aGluZyB3ZSBuZWVkIHRvIGltcHJvdmUuCgo+IFNvIEkgbmVlZCB0byBhZGQgdGhlIHJ1bnRpbWUg
ZGVwZW5kZW5jaWVzIGFzIHdlbGwgdG8gY29tcGlsZSBjb3JyZWN0bHkuCgpDYW4geW91IHRyeSB3
aXRoIG9ubHkgcGF0Y2ggNC8yMSAocGFja2FnZS9weXRob24tYXR0cnM6IGFkZCBob3N0IHZhcmlh
bnQpIHRvCnBhdGNoIDEwLzIxIChib290L3RpLWszLXI1LWxvYWRlcjogYWRkIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4Kb3B0aW9uKS4KCk1heWJlIHVwZGF0ZSB0aGUgbGFz
dCBwYXRjaCAxMC8yMSBzaW5jZSBpdCB3YXMgc3VnZ2VzdGVkIHRvIHJlbW92ZQpCUjJfVEFSR0VU
X1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFOIG9wdGlvbiB0byBtYWtlIGJpbm1hbiB1c2UgbWFu
ZGF0b3J5IGZvcgp0aS1rMy1yNS1sb2FkZXIgcGFja2FnZS4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
Cgo+IAo+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiBEYXJpbwo+IAo+Pgo+PiBOb3RlOiBob3N0LXB5
dGhvbi1qc29uc2NoZW1hIGRlcGVuZHMgb24KPj4gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJH
RVRfQVJDSF9TVVBQT1JUUyBkdWUgdG8gaXRzIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbgo+PiBob3N0
LXB5dGhvbi1ycGRzLXB5Lgo+Pgo+Pj4KPj4+ICBUSV9LM19SNV9MT0FERVJfTUFLRSA9ICQoQlIy
X01BS0UpCj4+PiAgVElfSzNfUjVfTE9BREVSX01BS0VfRU5WID0gJChUQVJHRVRfTUFLRV9FTlYp
Cj4+PiBAQCAtNDksNiArNTUsMTAgQEAgVElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVQRU5ERU5D
SUVTID0gXAo+Pj4gICAgICAgJChCUjJfQklTT05fSE9TVF9ERVBFTkRFTkNZKSBcCj4+PiAgICAg
ICAkKEJSMl9GTEVYX0hPU1RfREVQRU5ERU5DWSkKPj4+Cj4+PiAraWZlcSAoJChCUjJfVEFSR0VU
X1VCT09UX05FRURTX1BZTElCRkRUKSx5KQo+Pgo+PiBJdCdzIGEgdS1ib290IHBhY2thZ2UgY29u
ZmlnIG9wdGlvbi4ganVzdCBhZGQgaG9zdC1weXRob24tcHlsaWJmZHQgdGhlIGRlcGVuZGVuY3ku
Cj4+Cj4+PiArVElfSzNfUjVfTE9BREVSX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1weWxp
YmZkdAo+Pj4gK2VuZGlmCj4+PiArCj4+PiAgaWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9VU0VfREVGQ09ORklHKSx5KQo+Pj4gIFRJX0szX1I1X0xPQURFUl9LQ09ORklHX0RFRkNP
TkZJRyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9E
RUZDT05GSUcpKV9kZWZjb25maWcKPj4+ICBlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9USV9LM19S
NV9MT0FERVJfVVNFX0NVU1RPTV9DT05GSUcpLHkpCj4+PiBAQCAtNTgsNiArNjgsNyBAQCBUSV9L
M19SNV9MT0FERVJfTUFLRV9PUFRTID0gXAo+Pj4gICAgICAgQ1JPU1NfQ09NUElMRT0kKEhPU1Rf
RElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+Pj4gICAgICAgQVJDSD1hcm0gXAo+Pj4gICAgICAg
SE9TVENDPSIkKEhPU1RDQykgJChzdWJzdCAtSS8sLWlzeXN0ZW0gLywkKHN1YnN0IC1JIC8sLWlz
eXN0ZW0gLywkKEhPU1RfQ0ZMQUdTKSkpIiBcCj4+PiArICAgICBCSU5NQU5fSU5ESVJTPSQoQklO
QVJJRVNfRElSKSBcCj4+Cj4+IEkgc3VnZ2VzdGVkIHRvIGFkZCBCUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9VU0VfQklOTUFOIGJ1dCBpbmRlZWQgd2Ugc2hvdWxkCj4+IHVzZSBiaW5tYW4gdW5j
b25kaXRpb25hbGx5IGZvciB0aS1rMy1yNS1sb2FkZXIgcGFja2FnZS4KPj4KPj4gaHR0cDovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjEzMTcyODE3
LjI4NzI4NDktMTEtcm9tYWluLm5hb3VyQHNtaWxlLmZyLwo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+
IFJvbWFpbgo+Pgo+Pgo+Pj4gICAgICAgSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPj4+
Cj4+PiAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4+Cj4gCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
