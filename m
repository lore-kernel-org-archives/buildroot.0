Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042DEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCBDC41561;
	Mon, 19 Jun 2023 20:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCBDC41561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dx1zqQspGPTz; Mon, 19 Jun 2023 20:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C6241560;
	Mon, 19 Jun 2023 20:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C6241560
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4200B1BF2CF
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19278818D4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19278818D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDM_P0IzaxQQ for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 119E281815
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 119E281815
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:25:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51a2c8e5a2cso5445609a12.2
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687206308; x=1689798308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oz0/h0QgK6W3cUBtOqXP00Ek5zalhAkA6dwsFPqi3Ac=;
 b=bQJR/AXVo9Fi/C3o5nS/BFU9ARgTVG3bePu6dR6acKHMolUoKWYMlG4xx8h26NCrEp
 cK8ZltdgFFEk+yPY3p2aMxBxotp8RZIdnUYEgf5YEXjoILAkQ5pQT+k2v2092KMWf7d8
 tUk1WACzm4MXV9y+Pi2nVSkJTmy3PneYjlCwSp/54zKehyerTyJi1WoBBBvh+V3eXOFR
 vm4KO97NBRTlJUSexerFLVbkz5z3s5U4Twy3MBcBX8m3Mu1Bw2QLdNigqefY6IQHf6s9
 2mLlzLnRkOrqsIPc8OJoy6nc4VN5eJWlK0n1R+L017vg1lVnEXxJn/H09JP7IhQoEcMu
 RsLA==
X-Gm-Message-State: AC+VfDwYnLrCE+cymdEkIsizM3fSrfl2Pm6lWw6QvRCPXt1wysWR4LGL
 /JH1NA5+lUKu8m/MLKPcFiytJg==
X-Google-Smtp-Source: ACHHUZ5FZtP2JZ6V8JBLetAw3Cce41FT/MFAWW4ztOPuH3B9OvgOdoRWRDUda6j09XMni1F6h3J4Og==
X-Received: by 2002:a17:907:6e88:b0:988:8536:8886 with SMTP id
 sh8-20020a1709076e8800b0098885368886mr5156487ejc.21.1687206308005; 
 Mon, 19 Jun 2023 13:25:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a170906498900b00986ad2e34f4sm140979eju.205.2023.06.19.13.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 13:25:06 -0700 (PDT)
Message-ID: <4eb0906c-47aa-7ede-2a2e-2ef4a734822f@mind.be>
Date: Mon, 19 Jun 2023 22:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-5-laurent@vivier.eu>
 <CACPK8XfZL3j9AP-hkz3mNLW=6Ryy5TMo+o95DJNZ_vWBJxE2DQ@mail.gmail.com>
 <7031315e-4906-206e-8afc-f21784b4f822@vivier.eu>
 <CACPK8Xfc7dKpb8KZfkO=QrnWzGmqFMEHE3zSBtcjXAJonAPTEA@mail.gmail.com>
In-Reply-To: <CACPK8Xfc7dKpb8KZfkO=QrnWzGmqFMEHE3zSBtcjXAJonAPTEA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687206308; x=1689798308;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oz0/h0QgK6W3cUBtOqXP00Ek5zalhAkA6dwsFPqi3Ac=;
 b=UbUBIoXjAo2WEk0VrlXCkwzNqmW9Xl1WEH+R/xRKDLF6iiUTrLzQXqufQB+A+NSrmy
 H1D4/NINF5DDz3Y8sBFFzSOaV03PLwxiggyNDQ2OcNfRIvjLd6wO4ipVoOabTwIIGK49
 0bJ21KpOtQ4quubBPu/oTZqKqe2ameldqdnjhP594wfCK7WFAY6Xc92CnK6U+Xb4igSp
 S8r5v+Ac6FoMvoSVUNFHR7GEVF9KT0Gvv+4crLS5kRjK6HW1p8W+d79r/rlRAKEVQbns
 jK7c9rImQucN3poMOJ4FHqYByHPse1V2KPjA6WVKHqAOZwIZHUBr/0wIrlvXF3z/Pr9t
 dk5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UbUBIoXj
Subject: Re: [Buildroot] [PATCH v14 4/4] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wNi8yMDIzIDA3OjIxLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24gV2VkLCAxNCBK
dW4gMjAyMyBhdCAwNjoyMiwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PiB3cm90
ZToKPj4KPj4gTGUgMTQvMDYvMjAyMyDDoCAwNDowNSwgSm9lbCBTdGFubGV5IGEgw6ljcml0IDoK
Pj4+IE9uIFR1ZSwgMTMgSnVuIDIwMjMgYXQgMTA6NTEsIExhdXJlbnQgVml2aWVyIDxsYXVyZW50
QHZpdmllci5ldT4gd3JvdGU6Cj4+Pj4KPj4+PiBQZXRpdGJvb3QgZG9lc24ndCBzdGFydCBhIHNo
ZWxsIGJ1dCBhIEdVSS4KPj4+PiBNYW5hZ2UgdGhlIG1lbnUgdG8gc3dpdGNoIHRvIHRoZSBzaGVs
bC4KPj4+Pgo+Pj4+IEVuYWJsZSB0aGUgdGVzdCBmb3IgcWVtdV9tNjhLX3ZpcnQuCj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4+Pj4g
LS0tCj4+Pj4gICAgc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weSB8IDggKysrKysr
LS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1hZ2Uu
cHkgYi9zdXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5Cj4+Pj4gaW5kZXggYmE1MGVh
NjllZTlhLi5jOTRiN2E1Yzk2OWQgMTAwNzU1Cj4+Pj4gLS0tIGEvc3VwcG9ydC9zY3JpcHRzL2Jv
b3QtcWVtdS1pbWFnZS5weQo+Pj4+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1h
Z2UucHkKPj4+PiBAQCAtMzYsNyArMzYsNyBAQCBkZWYgbWFpbigpOgo+Pj4+ICAgICAgICB0aW1l
LnNsZWVwKDEpCj4+Pj4KPj4+PiAgICAgICAgdHJ5Ogo+Pj4+IC0gICAgICAgIGNoaWxkLmV4cGVj
dChbImJ1aWxkcm9vdCBsb2dpbjoiXSwgdGltZW91dD02MDApCj4+Pj4gKyAgICAgICAgaWR4ID0g
Y2hpbGQuZXhwZWN0KFsiYnVpbGRyb290IGxvZ2luOiIsICJFeGl0IHRvIHNoZWxsIl0sIHRpbWVv
dXQ9NjAwKQo+Pj4KPj4+IFdoYXQncyBpZHggZ29pbmcgdG8gY29udGFpbiBpbiB0aGUgcGV0aXRi
b290IHZzIGdldHR5IGNhc2VzPwo+Pgo+PiBzZWUgaHR0cHM6Ly9wZXhwZWN0LnJlYWR0aGVkb2Nz
LmlvL2VuL3N0YWJsZS9hcGkvcGV4cGVjdC5odG1sI3BleHBlY3Quc3Bhd24uZXhwZWN0Cj4+Cj4+
ICJUaGlzIHJldHVybnMgdGhlIGluZGV4IGludG8gdGhlIHBhdHRlcm4gbGlzdC4iCj4+Cj4+ICJi
dWlsZHJvb3QgbG9naW46IiAtPiBpZHggPSAwCj4+ICJFeGl0IHRvIHNoZWxsIiAtPiBpZHggPSAx
Cj4gCj4gVGhhbmtzLiBQZXJoYXBzIGEgY29tbWVudCB3aGVyZSB5b3UgdGVzdCB0aGUgcmVzdWx0
cyB0byBleHBsYWluIHdoeSB3ZSB0ZXN0IDAvMS4KCiAgRXhhY3RseS4gU29tZXRoaW5nIGxpa2U6
CgojIGdldHR5IG9uIGNvbnNvbGUgLT4gImJ1aWxkcm9vdCBsb2dpbjoiID09IDAKIyBwZXRpdGJv
b3Qgb24gY29uc29sZSAtPiAiRXhpdCB0byBzaGVsbCIgPT0gMQoKCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gCj4+Pj4gLSAgICBjaGlsZC5zZW5kbGluZSgicm9vdFxyIikKPj4+PiArICAgIGlmIGlk
eCA9PSAwOgo+Pj4+ICsgICAgICAgIGNoaWxkLnNlbmRsaW5lKCJyb290XHIiKQo+Pj4+ICsgICAg
ZWxpZiBpZHggPT0gMToKPj4+PiArICAgICAgICB0aW1lLnNsZWVwKDEpCj4+Pj4gKyAgICAgICAg
Y2hpbGQuc2VuZGxpbmUoIlxyIikKPj4+Pgo+Pj4+ICAgICAgICB0cnk6Cj4+Pj4gICAgICAgICAg
ICBjaGlsZC5leHBlY3QoWyIjICJdLCB0aW1lb3V0PTYwMCkKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
