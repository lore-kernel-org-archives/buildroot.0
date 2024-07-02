Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69AEC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7048381132;
	Tue,  2 Jul 2024 19:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1nypuU8o95j; Tue,  2 Jul 2024 19:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0A38117F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0A38117F;
	Tue,  2 Jul 2024 19:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14FCD1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F40C460685
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVcYIicHzyl9 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4EDD60BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EDD60BF0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4EDD60BF0
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:42:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52e829086f3so4904256e87.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949358; x=1720554158;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v2yfhItSlA4eTyhsrpMvZZVYwCk2TVZtRRXBMDFTC0E=;
 b=K0YkVhHAFuGMGptXKnJrwurh4h6AlGAyFbC2FDD+6U+pfaWjwRthu4KIaU5bhwdmDW
 PyBFmgLnY3CDmbQZd7Sl/XtvVstCTdr91Ptdh59XrdQJDNEly8F7qtvSS5++2BGHfUn8
 GKO5rca0qIlgB5vUsj4E7ohWoxV5UJcGb3vaGiI8bOtfVrKG7T1/1bHtqoXlf+Slx/pX
 Ox+6c5BcnYuN9XA1jiYB3MQGTXTZhvICV0E4tdhpWpynTJr13yYIzB5HYLgGXjgB/ADO
 9q3b6xFvS67G+b4hyLc70GK1102JDmJ5jw/LQe8xAlNooxWijVCkQTcGL123EdNdKdro
 ar3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvalK757OD97oWcfFLqa8tlgs6xAJVDc4E1Ze8jpD0SWFAFtBHwf1X5Qekw0AUxNviCMxqUt3Ob7/BMZVCaQBKAlzdlZWpQ==
X-Gm-Message-State: AOJu0Yy3EXWY8NB2UQ/8qPJo/LPYAY3l8PljtNzuVHS9r7pbtYIA1Ly9
 BbZc9nt2ZriPptQvhB9y59zNibI07tuf+yBe6WInHr2DDfz6APSycwJKcsdWTrA=
X-Google-Smtp-Source: AGHT+IHdB/ow+RE1tfdxdT8LVK07cEj4Jntv93wYx0htd6tPDGxsm00I538wmk+aT9KGePCqYkYGXA==
X-Received: by 2002:a05:6512:2350:b0:52e:830f:38a7 with SMTP id
 2adb3069b0e04-52e830f390cmr7088672e87.21.1719949358503; 
 Tue, 02 Jul 2024 12:42:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257d0d38bbsm126673805e9.38.2024.07.02.12.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:42:38 -0700 (PDT)
Message-ID: <a9c11437-750f-4283-8dd8-2bafafeeab51@mind.be>
Date: Tue, 2 Jul 2024 21:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702133655.2425922-1-dario.binacchi@amarulasolutions.com>
 <20240702133655.2425922-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702133655.2425922-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949358; x=1720554158; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v2yfhItSlA4eTyhsrpMvZZVYwCk2TVZtRRXBMDFTC0E=;
 b=FszqxMu9R1vz8eZ178CfnXu7Hh3ex3F/IhowcaJIXVrWMa05/2RklxnycwrsOoYtJ/
 upYGm9J0F/fBEKVvIZ40uy1Gh+A2tMhojIO6xm6wx5iTcDsBa0aZ59XoIEZFI7P2FR74
 Oqu9qeXX1D+M3D40N/Jc3Kqjnp4xdjXeOWhzIb8WIgKf+zv5aCdeKtXndxkmeERvaA4k
 orngMCCkzAlvxucihod/NziQs2FO2oH4Cem37onXW7hY5pFXF9otcePpYTwAJ06H7gjg
 /pVYZcKDMQohDsof22P2SbFeRzuvZH6FM+WGHUUCB0BfV9pyfMecOuCsDIatZwJdEojA
 FG9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FszqxMu9
Subject: Re: [Buildroot] [PATCH 2/2] package/libmad: drop GCC's
 "-fforce-mem" option
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
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wNy8yMDI0IDE1OjM2LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBUaGUgY29tbWl0
IGZpeGVzIHRoZSBmb2xsb3dpbmcgY29tcGlsYXRpb24gZXJyb3I6Cj4gCj4gICAgICBpNjg2LWJ1
aWxkcm9vdC1saW51eC1nbnUtZ2NjLmJyX3JlYWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFu
ZC1saW5lIG9wdGlvbiDigJgtZmZvcmNlLW1lbeKAmQo+IAo+ICBGcm9tIEdDQyA0LjMgcmVsZWFz
ZSBub3RlcyBbMV06Cj4gCj4gICAgICBUaGUgLWZmb3JjZS1tZW0gb3B0aW9uIGhhcyBiZWVuIHJl
bW92ZWQgYmVjYXVzZSBpdCBoYXMgaGFkIG5vIGVmZmVjdAo+ICAgICAgaW4gdGhlIGxhc3QgZmV3
IEdDQyByZWxlYXNlcy4KPiAKPiBbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtNC4zL2NoYW5n
ZXMuaHRtbAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgIC4uLi8wMDAzLWRyb3AtR0NDLWZmb3JjZS1t
ZW0tb3B0aW9uLnBhdGNoICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9s
aWJtYWQvMDAwMy1kcm9wLUdDQy1mZm9yY2UtbWVtLW9wdGlvbi5wYXRjaAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYm1hZC8wMDAzLWRyb3AtR0NDLWZmb3JjZS1tZW0tb3B0aW9uLnBhdGNo
IGIvcGFja2FnZS9saWJtYWQvMDAwMy1kcm9wLUdDQy1mZm9yY2UtbWVtLW9wdGlvbi5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kYzgzMmFjNzA1MTQK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJtYWQvMDAwMy1kcm9wLUdDQy1mZm9y
Y2UtbWVtLW9wdGlvbi5wYXRjaAo+IEBAIC0wLDAgKzEsMTggQEAKPiArY29uZmlndXJlLmFjOiBk
cm9wIEdDQyAiLWZmb3JjZS1tZW0iIG9wdGlvbgo+ICsKPiArQXMgcmVwb3J0ZWQgYXQgWzFdLCB0
aGUgb3B0aW9uIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB2ZXJzaW9uIDQuMyBvZiBHQ0MuCj4gKwo+
ICtbMV0gaHR0cHM6Ly9lei5hbmFsb2cuY29tL2RzcC9zb2Z0d2FyZS1hbmQtZGV2ZWxvcG1lbnQt
dG9vbHMvbGludXgtYmxhY2tmaW4vbGludXgtYnVnLWFyY2hpdmUvdy9kb2N1bWVudHMvNzQ2MC81
NjI2LWJ1aWxkLWxpYi1tYWQtZmFpbC1hdC1vcHRpb24tLWZmb3JjZS1tZW0td2l0aC1nY2MtNC0z
Cj4gK1NpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiArVXBzdHJlYW06IE4vQSBbQnVpbGRyb290IHNwZWNpZmljXQoKICBU
aGlzIGlzIG5vdCBCdWlsZHJvb3Qgc3BlY2lmaWMgYXQgYWxsLCBhbnlvbmUgdXNpbmcgbGlibWFk
IGF0IHRoaXMgdGltZSBpcyAKZ29pbmcgdG8gaGl0IHRoZSBpc3N1ZS4KCiAgU28gSSd2ZSBjaGFu
Z2VkIHRoaXMgdG8gVXBzdHJlYW06IERlYWQKCiAgV2hpY2ggaXMgYWxzbyBub3QgZW50aXJlbHkg
dHJ1ZSBiZWNhdXNlIHRoZXJlJ3MgYSBmb3JrIGF0IFsxXSwgYnV0IE9LLgoKCiAgV2l0aCB0aGF0
IGNoYW5nZSwgYXBwbGllZCBib3RoIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9zZXplcm8vbGlibWFkCgoKPiArCj4gKy0tLSBs
aWJtYWQtMC4xNS4xYi1vcmlnL2NvbmZpZ3VyZS5hYwkyMDI0LTA3LTAyIDE0OjI2OjQwLjY1Nzk4
NDc5MSArMDIwMAo+ICsrKysgbGlibWFkLTAuMTUuMWIvY29uZmlndXJlLmFjCTIwMjQtMDctMDIg
MTQ6Mjc6MDcuMDk4MTk4OTk3ICswMjAwCj4gK0BAIC0xNDAsNyArMTQwLDYgQEAKPiArICAgICBj
YXNlICIkb3B0aW1pemUiIGluCj4gKyAJLU98Ii1PICIqKQo+ICsgCSAgICBvcHRpbWl6ZT0iLU8i
Cj4gKy0JICAgIG9wdGltaXplPSIkb3B0aW1pemUgLWZmb3JjZS1tZW0iCj4gKyAJICAgIG9wdGlt
aXplPSIkb3B0aW1pemUgLWZmb3JjZS1hZGRyIgo+ICsgCSAgICA6ICN4IG9wdGltaXplPSIkb3B0
aW1pemUgLWZpbmxpbmUtZnVuY3Rpb25zIgo+ICsgCSAgICA6ICMtIG9wdGltaXplPSIkb3B0aW1p
emUgLWZzdHJlbmd0aC1yZWR1Y2UiCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
