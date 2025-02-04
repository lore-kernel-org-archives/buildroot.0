Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA4AC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDFC4042E;
	Tue,  4 Feb 2025 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuoVYwfvW3W7; Tue,  4 Feb 2025 10:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBEF140687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBEF140687;
	Tue,  4 Feb 2025 10:44:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3575712A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25063400F2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7sQ6NakHjiq for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B568E400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B568E400AC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B568E400AC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:44:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso39727435e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 02:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738665877; x=1739270677;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wChCfFQ6FIy+ikPRk3ZIovssEAYfd5u01gIBJkEcelM=;
 b=BY/d3DpIN7KAFmhepyuXsGxAvH6EAG9E6YtEDzhs7vobFVYXK30ZEEc9qFfU4qka2Y
 LbWdlQouPsV8Ep6XbCFNjJtBcdKaKXvCzZ3u9SJrizLhAdzSI0GIM/dHkTPzIAwIVbqY
 8Mqb19J5huFcpYjBXtdHyXecvzIAvgW8gWXJy0M4r1EitgnKuk1EfQdohmyCDldOHsCo
 ThTPvcXoJnpBntNPlOBa3+rMc95+qC1tqsWICWwRnfICp5o950ArNBWTv6U9D/fkyFUh
 ZiaOzQzc0GVN+3apKiqy22gkaQb9MtZbfzcQEENE94G5Lie2m2th/jOy8sJpX2qNmkLn
 bayQ==
X-Gm-Message-State: AOJu0YyRAHu3LUhv1/vBC7bjy1aw/leQCVIt6/aHrn50KtEdI8nMgFTz
 S0/jXUjxWuGPDUgyicu8MINKPaqaspxkLSLOpqirfWCWKLKkJQP9XyxAODw3lVw9VhPDDcCCZGq
 SNjk=
X-Gm-Gg: ASbGncsxL7x2iQB97Wld6SCw261MgS789V1n4+62iF4nwd9zXn97e5HePJVPOAWxHSN
 7aGd2drZHTSHTT1hDHAgh8n2ataZAHWM2MCq1w8tUrjkiPPGV8NiWJkS/pYbfDBJuweaxc5xiUT
 ZcYH7YPsyeqCRjM5lbz962XwUZrjlHCIoDfujlYLpDqn6j3jNESnhdU5jw9xy7xImLdjmLy5PI3
 sgMWaR2VxQBqbXyGITFo1bQsKVo8S3IXCRCo5++Df9s9Ywd4ino/E4FaPHmgxt1gIYncVi7qsXb
 UHpd1/AfgjXbtwwRkHkpHLcOw6UfJptuqPotJdo22HPeBCY1019TQCVo
X-Google-Smtp-Source: AGHT+IHYiEV3cy0w1l5mQZgdTd3ytp2RVYhSERg9093ixD8PcJyKgCoOg4eWz174R+Q6PKOiqfh3BQ==
X-Received: by 2002:a5d:47ab:0:b0:38d:af98:c1a8 with SMTP id
 ffacd0b85a97d-38daf98c33amr764436f8f.17.1738665877597; 
 Tue, 04 Feb 2025 02:44:37 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102d2esm15661850f8f.33.2025.02.04.02.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:44:37 -0800 (PST)
Message-ID: <37c874cf-ed54-4384-8a39-63399e5f8911@smile.fr>
Date: Tue, 4 Feb 2025 11:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Michael Walle <michael@walle.cc>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>
References: <20240902112735.728574-1-michael@walle.cc>
 <ZtWx2nqI0YTpwb-P@ryzen.lan> <ZxkCUCUw5bVSlgRo@ryzen>
Content-Language: en-US
In-Reply-To: <ZxkCUCUw5bVSlgRo@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738665877; x=1739270677; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wChCfFQ6FIy+ikPRk3ZIovssEAYfd5u01gIBJkEcelM=;
 b=EzRfEbcnTmhlJ+KPXcM7RJO6mvHn1Spj7fqic2CNmOBiQpCgMmxWohkrnQXKWfz6xD
 uVOcH4v7EPwosqnEUZGJhfSV6l71TF+WbuMUWB8sP/SoUf+Qd9rITD24dph5ZtInr2R1
 S1fbAuokGJkPPVXQYjK35LTB5ml/F04S1bFiY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=EzRfEbcn
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKTGUgMjMvMTAvMjAyNCDDoCAxNjowNCwgTmlrbGFzIENhc3NlbCB2aWEgYnVpbGRy
b290IGEgw6ljcml0wqA6Cj4gT24gTW9uLCBTZXAgMDIsIDIwMjQgYXQgMDI6Mzg6NTBQTSArMDIw
MCwgTmlrbGFzIENhc3NlbCB3cm90ZToKPj4gT24gTW9uLCBTZXAgMDIsIDIwMjQgYXQgMDE6Mjc6
MzVQTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IFRoZSBsaW51eCBrZXJuZWwgY2Fu
IGJ1aWxkIGRldmljZSB0cmVlIG92ZXJsYXlzICguZHRibykgaXRzZWxmLiBBZGQKPj4+IHN1cHBv
cnQgdG8gYnVpbGQgYW5kIGNvcHkgdGhlbSBhbG9uZyB3aXRoIHRoZSBhY3R1YWwgZGV2aWNlIHRy
ZWVzLgo+Pj4gVGhlc2UgY2FuIGVpdGhlciBiZSBpbi10cmVlIGRldmljZSB0cmVlIG92ZXJsYXlz
Cj4+PiAoQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTT19OQU1FUykgb3IgdGhleSBjYW4gYmUg
cHJvdmlkZWQgb3V0c2lkZSBvZgo+Pj4gdGhlIGtlcm5lbCAoQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fRFRTX1BBVEgpLiBJbiB0aGUgbGF0dGVyIGNhc2UsIHRoZQo+Pj4gb3ZlcmxheSBzb3VyY2Ug
ZmlsZXMgd2lsbCBiZSBjb3BpZWQgaW50byB0aGUga2VybmVsIHRyZWUgZmlyc3QuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPj4+IC0tLQo+
IAo+IEhlbGxvIE1pY2hhZWwsCj4gCj4gQ29uc2lkZXJpbmcgdGhhdCB0aGlzIHBhdGNoIHN1cHBv
cnRzIGJvdGggaW4tdHJlZSBhbmQgb3V0LW9mLXRyZWUgZGV2aWNlCj4gdHJlZSBvdmVybGF5cy4K
PiAKPiBJIGp1c3Qgc2F3IHRoaXM6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
L0NBRk9ZSFpEUW1NUnVLNzZUcE9TQU9GUGRxQWI0Z3B3PUxOS2ZtcHU9c3FBRDFFTWhGZ0BtYWls
LmdtYWlsLmNvbS9ULyN1Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSzdMTkFSNGg2
TlorRDBCSytxNFZRQmVIV3BqelJCUUZROW92QnJmdE09NmRIUmNVZ0BtYWlsLmdtYWlsLmNvbS8K
PiAKPiBJdCBhcHBlYXJzIHRoYXQgaXQgd2lsbCBubyBsb25nZXIgd29yayB0byBjb3B5IG91dC1v
Zi10cmVlIHNvdXJjZSBmaWxlcwo+IGludG8gdGhlIGtlcm5lbCBkaXJlY3RvcnkgKHdoaWNoIHRo
aXMgcGF0Y2ggZG9lcykuCj4gCj4gRG9lcyBwZXJoYXBzIHRoaXMgcGF0Y2ggbmVlZCBhIFYzIHRo
YXQgZHJvcHMgc3VwcG9ydCBmb3Igb3V0LW9mLXRyZWUKPiBkZXZpY2UgdHJlZSBvdmVybGF5cz8K
CkknbGwgbWFyayB0aGlzIHBhdGNoIGFzIHN1cGVyc2VkZWQgaW4gdGhlIHBhdGNod29yayAoZHVl
IHRvIHYzIGZyb20gTmlrbGFzKS4KCkluZGVlZCwgd2UgbmVlZCB0byBmaXggZmlyc3QgdGhlIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIGlzc3VlIGZvcgpsYXRlc3QgNi4xMisga2Vy
bmVscy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gTmlr
bGFzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
