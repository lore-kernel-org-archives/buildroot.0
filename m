Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA58BC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 06:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6402081F27;
	Mon,  7 Apr 2025 06:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8JIaCeIGoUF; Mon,  7 Apr 2025 06:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0951B81E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0951B81E1D;
	Mon,  7 Apr 2025 06:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92ECA1F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 06:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8126381E68
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 06:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVgqsSixVinX for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 06:01:45 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.249; helo=mslow3.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43ECA81E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43ECA81E18
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43ECA81E18
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 06:01:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id DFE975818BF
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 05:45:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B81E744345;
 Mon,  7 Apr 2025 05:45:20 +0000 (UTC)
Message-ID: <11b14759-8a20-48d6-862f-c1e3c26a54b1@yoseli.org>
Date: Mon, 7 Apr 2025 07:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250314-fix-m68k-ntpl-uclibc-v1-1-086dff8d713e@yoseli.org>
 <74561b1d0fe0bdaffb6455a22dbd744a@free.fr>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <74561b1d0fe0bdaffb6455a22dbd744a@free.fr>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepteejgfekfeefheefkeejleejjefftdeggfevtddttdevjeeludeffeetvedtveeunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1744004720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNuI0a/tm6Q2NCNXtn7Wa4EXOEMGhu8zllLokP8bILE=;
 b=TAPdQPSfzcMiR81vpKKtoC4efNZOE23hSDm4wqjhjplH3QKvXajqbXA/Apz5m2kKX9cKOZ
 b5bFlhoLJ5oCLVkMOq0XVf0YejKuFohKttgcaZ4zQmBewa/hc8A0tpoNMJiw8zWP+yqQXe
 BFIOLdljwjQ/c+9YS1eYAg0G5SGpo+Y6h66B37phQiEYXVc5wWTDF1vAulFDfDz+X3+pk9
 3VWF0vT4/mOtRiVBazHylgFG9ZAoMN/xAR5rU0FlKcMPiIBpi3DHNE4rmd4x67Nxts35N1
 sMpwFlQMobtk54cAfN07qFWKOZrlrST7Ps3fKj2hOT+ScbPSjvNJbChNgUfwOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=TAPdQPSf
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix NPTL alignment on m68k
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgSnVsaWVuLAoKT24gMDYvMDQvMjAyNSAyMjoxNCwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4g
T24gMTQvMDMvMjAyNSAxMDoxNiwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6Cj4+IFRlc3Rl
ZCBvbiBRRU1VIHVzaW5nIHRoZSBxZW11X202OGtfcTgwMF9kZWZjb25maWcgY29uZmlndXJhdGlv
biwgd2l0aCBhCj4+IHN3aXRjaCBvZsKgIHRoZSB0b29sY2hhaW4gdG8gdWNsaWJjLW5nIGFuZCBl
bmFibGluZyByc3lzbG9nLgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHJlc3NlcyBhbiBpc3N1ZSB3aGVy
ZSByc3lzbG9n4oCZcyBwdGhyZWFkX2NvbmRfd2FpdCB3YXMKPj4gYnVzeS1sb29waW5nIGR1ZSB0
byBmdXRleF90aW1lNjQgcmVwZWF0ZWRseSByZXR1cm5pbmcgRUlOVkFMLiBUaGUKPj4gY29ycmVj
dGlvbiBpbiBOUFRMIGFsaWdubWVudCByZXNvbHZlcyB0aGUgMTAwJSBDUFUgdXNhZ2UgcHJvYmxl
bS4KPj4KPj4gVGhpcyBwYXRjaCBpcyBmaXhlZCB1cHN0cmVhbSBbMV0gc28gYXBwbHkgaXQgdW50
aWwgaXQgaXMgdGFnZ2VkLgo+Pgo+PiBbMV06IDI3OGFjNmIzMCAoIm02OGs6IGZpeCBhbGlnbm1l
bnQgaW4gTlBUTCBjb2RlIikKPj4KPj4gU2lnbmVkLW9mZi1ieTogSmVhbi1NaWNoZWwgSGF1dGJv
aXMgPGplYW5taWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZz4KPiAKPiBBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgo+IEZvciBpbmZvLCBJIGZpeGVkIGEgY2hlY2stcGFja2FnZSBlcnJvci4gU2Vl
Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tLyAKPiBjb21t
aXQvNTNlYWU5ODZhNWMxNWFmZDBhZGU3NDg3NWNlOTZhMWI3MGU3YzUzYgo+IAoKVGhhbmtzIGEg
bG90ICEKSk0KCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
