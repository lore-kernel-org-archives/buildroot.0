Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92F2C47DD9
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 22:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49FBF40118;
	Thu, 22 Feb 2024 22:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CH1skXMHLG1u; Thu, 22 Feb 2024 22:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BDF403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2BDF403F9;
	Thu, 22 Feb 2024 22:35:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35DC51BF379
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22DA8605DC
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFviFY6ITnVe for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 22:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5178605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5178605D9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5178605D9
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 22:35:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41275855dc4so1913135e9.0
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708641304; x=1709246104;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6sFk6a+eRuVcOhp5OO++mhnTfJzdKuNz+rpSNA2YVk=;
 b=Q71rg9rF1HJvDtMgtmaIru4rkc97jd36b6XyarrRInz+aY+LZOlkoXzZGuH7MmdlBK
 zkLQJ0Te8a9/zrDUZon9jBaVbjRfL0C8kP1h0gS9N4d1GnujvZGrMSqn4Ii/9IGi8tgh
 IFaD77PtmGOjC2ACKd7OrN5lChBhN3kHniLOQ/tWD+774ZjWlTwtOa6Uea61NslIs0cQ
 nOZzHeCPKhxikUToxdkkit14qSxBRYVsGbJVUovENPkBI0kL4dgp8z8f87WOvaFhv+GJ
 U77NsraWihCLdUaHpqTmAN13KDf8qT1jf4ye1z21/kVeuY/y16/bWEJ/jxINPGJeEH70
 6/pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnwSPPD8zUknS2uUBVwtQTLnVPiwFAvsE1sPeM71vFKo16Tci6wNMOUpHmqcLhqjZbNkavKYTWM5Vctg2eQZ0nx92QFKNL1A==
X-Gm-Message-State: AOJu0YyHmGAzi6mbwNZcPhMzYRwWqQJqZY6TlKd1fPY631nN5/pAyO4k
 ZBZxDzRbq3/5uPXA79KE6D7Ip84gnLYWTvG+vuPq019YyrlI8vczr3hy6WrHclA=
X-Google-Smtp-Source: AGHT+IHmbqWKnqRKMrHaAp2H732ZXRlIelO5vk3HBcSnGM2R+rbnhC/0o7Rg0fyOuQKXjRE+vkvfDw==
X-Received: by 2002:a05:600c:5012:b0:410:df8f:9ffa with SMTP id
 n18-20020a05600c501200b00410df8f9ffamr56496wmr.25.1708641303984; 
 Thu, 22 Feb 2024 14:35:03 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d4608000000b0033d6c928a95sm388689wrq.63.2024.02.22.14.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 14:35:03 -0800 (PST)
Message-ID: <e2d11fa2-be86-4d5e-a34e-c8a1c3bc3537@smile.fr>
Date: Thu, 22 Feb 2024 23:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-13-dario.binacchi@amarulasolutions.com>
 <aedf0c99-4532-4b83-a693-d49c6fc245c9@smile.fr>
In-Reply-To: <aedf0c99-4532-4b83-a693-d49c6fc245c9@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708641304; x=1709246104;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6sFk6a+eRuVcOhp5OO++mhnTfJzdKuNz+rpSNA2YVk=;
 b=u5dM17IVsEBx2R3RPaZC5fyPtdERfkoRes6RWDCrjQHPmO0rmN8vZpUpTGcxg0v4DJ
 OQ68yothAWDj37nG41deGrT4TrgAA/wsVZGoL2Nc41TfWWy8AkQjrJvlvw0grIaP4glV
 HL2bWc95h4FD8YQ1pDEaP4ReLiIIiL6KxGw8opSSCJQAee4/I6t8jyZJrjXL5X9y8mA3
 a13A47tpfljsEj0OlZ2wOnGPljECaZsKFel7bh+4PZPB8pzBouXoWg/XFX9x7QeoQWib
 Fo/RYqUMyuNlFoL/8uqgCPoPek0DO57YcUAeyP7LmMWJUw8dDi4PQQ5eewGAvaGNjqtC
 z8nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=u5dM17IV
Subject: Re: [Buildroot] [PATCH v5 12/16] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjIvMDIvMjAyNCDDoCAyMzowOSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
RGFyaW8sCj4gCj4gTGUgMjIvMDIvMjAyNCDDoCAxMToxNiwgRGFyaW8gQmluYWNjaGkgYSDDqWNy
aXTCoDoKPj4gQXMgZXhwbGFpbmVkIGluIFsxXSwgYWRkaW5nIHN1cHBvcnQgZm9yIEFNNjJ4IExQ
IFNLIGluIFUtQm9vdCwgcmVxdWlyZXMKPj4gYmlubWFuIGZvciBidWlsZGluZyBib290bG9hZGVy
IGltYWdlcy4gVGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPj4gdmFyaWFibGUgaXMgdXNl
ZCB0byBwcm92aWRlIGEgc3BhY2Utc2VwYXJhdGVkIGxpc3Qgb2YgZGlyZWN0b3JpZXMgdG8KPj4g
c2VhcmNoIGZvciBiaW5hcnkgYmxvYnMuCj4+Cj4+IEluIHRoaXMgd2F5LCB0aGUgcHJldmlvdXMg
c2V0dGluZyBiZWNvbWVzIHVubmVjZXNzYXJ5LCBzbyBsZXQncyByZW1vdmUKPj4gaXQuCj4+Cj4+
IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAy
MzEwMzAxMTAxMzguMTM0NzYwMy0zLW4teWFkYXZAdGkuY29tLwo+PiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Cj4+
IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHY1Ogo+PiAtIERyb3AgIkRNPSQoQklOQVJJRVNfRElSKS90
aS1kbS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxl
YXNlX3N0cmlwLnhlcjVmIgo+PiAgIGZyb20gVUJPT1RfTUFLRV9PUFRTLgo+Pgo+PiBubyBjaGFu
Z2VzIHNpbmNlIHYxOgo+Pgo+PiAgYm9vdC91Ym9vdC91Ym9vdC5tayB8IDIgKy0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYm9vdC91Ym9vdC91Ym9vdC5tayBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPj4gaW5kZXggZGRh
NjA2YTg4MDU5Li43MDk4MmE4NzcxOWYgMTAwNjQ0Cj4+IC0tLSBhL2Jvb3QvdWJvb3QvdWJvb3Qu
bWsKPj4gKysrIGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+PiBAQCAtMTg5LDcgKzE4OSw3IEBAIGVu
ZGlmCj4+ICBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfVElfSzNfRE0pLHkpCj4+ICBV
Qk9PVF9USV9LM19ETV9TT0NOQU1FID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVUJPT1Rf
VElfSzNfRE1fU09DTkFNRSkpCgpVQk9PVF9USV9LM19ETV9TT0NOQU1FIGlzIG5vdCB1c2VkIGFu
eW1vcmUKCldpdGggdGhlIHRpLWszIHBhY2thZ2UgaW50cm9kdWNlZCBpbiB0aGUgZm9sbG93dXAg
cGF0Y2gsIGl0IGNhbiBiZSBzaW1wbGlmZWQgdG8KKGFsb25nIHRoZSBzZXBhcmF0ZSBiaW5tYW4g
dWJvb3Qgb3B0aW9uKQoKaWZlcSAoJChCUjJfUEFDS0FHRV9USV9LMykseSkKVUJPT1RfREVQRU5E
RU5DSUVTICs9IHRpLWszLWJvb3QtZmlybXdhcmUKZW5kaWYKCj4+ICBVQk9PVF9ERVBFTkRFTkNJ
RVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+PiAtVUJPT1RfTUFLRV9PUFRTICs9IERNPSQoQklO
QVJJRVNfRElSKS90aS1kbS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3Ri
X21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmCj4+ICtVQk9PVF9NQUtFX09QVFMgKz0gQklOTUFO
X0lORElSUz0kKEJJTkFSSUVTX0RJUikKPiAKPiBCaW5tYW4gdG9vbCBpcyBub3Qgc3BlY2lmaWMg
dG8gVEkgSzMgcGxhdGZvcm0sIHNlZSBteSBwcmV2aW91cyBjb21tZW50IFsxXQo+IAo+IFsxXSBo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LUZlYnJ1YXJ5
LzY4NTk0OS5odG1sCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiAgZW5kaWYK
Pj4gIAo+PiAgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TQkkpLHkpCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
