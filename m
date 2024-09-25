Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEC1CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A118D80B12;
	Wed, 25 Sep 2024 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmFY4JU4OpNF; Wed, 25 Sep 2024 17:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CDE8058E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CDE8058E;
	Wed, 25 Sep 2024 17:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1E6C1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD82A401F3
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s935Y2_mkxly for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4534B4012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4534B4012B
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4534B4012B
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 17:56:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a93b2070e0cso13620966b.3
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 10:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727286987; x=1727891787;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbjwxBYhnLn1u9jH7YecvF/EVpGnvixZ4uANO0VHL08=;
 b=XzjvrxVCvHC5LeeKs56u/COXXuk8RIeXcwRYE7lWIo7KmJDZ8ENbZClGkRUe6j0/b0
 3csDB+QZCuyZPOrk0Tdw/K65XOM3tjnUUA73X0eCdhrenVcsrJeAsRsCguGW+vq6fPQs
 vREjrFFgrNbZrM2n7BsPLvSy5V6VTsHm/67M0OZh2U00gmbPX7lFyRqmjH7+GDhNvDBx
 SXrv3mEbOHkvsJalQ/vVVNjas3Vva1LZR2EoNj8OLivCniPzRmWUHwtqBO7mNLSoEpXo
 SKrojEHRFiz64sJO1yMm/NmdaevXrMAQ0u53tjmTEgN5ySx44ZPpxsIJwHL5CaAvlraX
 zmTw==
X-Gm-Message-State: AOJu0YzIa+opwmtI1zjHXPu/NUa41BmcJPR5KYO3PPF5zofolQRF888p
 1TIWGO8yqxmovpWyIwSh13tWbg+fnvDTk8IfXYIMrq33IC814jr4aCH8MfQH2Gc=
X-Google-Smtp-Source: AGHT+IGtP5kmPjRmS3/2NRcvvLEJp9iRYaudVDtSWWfw/Qfq8/eg0P6nnwTbVMM1cSm5ZvEaE0l7Sw==
X-Received: by 2002:a17:907:7e84:b0:a8d:18cb:89e8 with SMTP id
 a640c23a62f3a-a93a03c1fa9mr290892066b.34.1727286987346; 
 Wed, 25 Sep 2024 10:56:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930fb413sm235075666b.187.2024.09.25.10.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 10:56:26 -0700 (PDT)
Message-ID: <fa0280c4-edb8-46a8-b202-8f78651f3e9f@mind.be>
Date: Wed, 25 Sep 2024 19:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neil Webster <jarraneil@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
 <216539b9-4730-4adc-b400-655d287a082a@mind.be>
 <a9c3d961-ceda-4092-9830-27e3c4bd114b@gmail.com>
 <9d0c3fb8-a4ac-40f1-9608-a14ab281a861@mind.be>
 <f9a209f6-cca2-4f37-83d4-faa6ab86ac36@gmail.com>
 <e52f4b06-392d-42ce-be58-3987f85b4caf@mind.be>
 <5294b549-5641-49ba-b586-4e444494f599@gmail.com>
 <07c7a1e9-fa5b-4c4e-8d97-3175d9b4a454@mind.be>
 <7be9c48f-2504-40c7-98f3-236fc205b27e@gmail.com>
 <59faceb2-6814-432b-a888-a17549fd0bf4@gmail.com>
 <f7bf494a-a398-4f29-b730-a69ac46570f2@gmail.com>
 <CAOMZO5CyhAAAvP1cViv=xdu14h4GjZ=S8eV=xO0SzcRJFPj1Pw@mail.gmail.com>
 <ec4d920c-d9a0-4185-8a8a-1c6030d19c2b@gmail.com>
Content-Language: en-GB
In-Reply-To: <ec4d920c-d9a0-4185-8a8a-1c6030d19c2b@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727286987; x=1727891787; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fbjwxBYhnLn1u9jH7YecvF/EVpGnvixZ4uANO0VHL08=;
 b=JtDdg1JGCEktN3m8UxeA1hGJfKlAZPcz+8V1Zgv+vRmbILV2bAbucrjGQ7wo9riMJl
 qZmDgFY+stto7G+X3+wfRW0S1Dl+UXTHqbVom+FtRFnHjJv7GspAOi/+Aohy6cNcze52
 jB2QCI5Hhh9ZPDDblBSlPCyrFV4Dz+jBzshFeTwah/33QwJ2dMosjc07pw4I1bDJctL5
 +awS4XMePhNadmhNR6J4qxxYY0THdKNWQB/qc2eFV/phKaFfcE2CRJKg8zsDHPEeezHk
 FVmOaMks8EMXheXCOheoKnh5JEnIWMy7OlrDjO2iruYb9/G0mR6XDj5V5ETM29xqtZOK
 jn1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JtDdg1JG
Subject: Re: [Buildroot] Variscite Dart
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wOS8yMDI0IDIxOjQ3LCBOZWlsIFdlYnN0ZXIgd3JvdGU6Cj4gVGhhbmtzIEZhYmlv
Lgo+IAo+IFRoZSB0cm91YmxlIGlzIHRoYXQgVmFyaXNjaXRlIGRvIG5vdCBzdXBwb3J0IGJ1aWxk
cm9vdCBzbyBJIGNhbid0IGdldCBhbnl0aGluZyAKPiB1c2VmdWwgb3V0IG9mIHRoZW0uIEkgaGF2
ZSB0cmllZC4gVGhleSBrZWVwIHRyeWluZyB0byBzdGVlciBtZSB0byBZb2N0by4KCiAgWW91IGNh
biBjaGVjayBpbiB0aGVpciB5b2N0byBsYXllciB0byBzZWUgd2hhdCB0aGV5IHVzZSBmb3IgVS1C
b290IGRlZmNvbmZpZy4gCkl0IHNob3VsZCBiZSBpbiB0aGUgc2FtZSAuYmJhcHBlbmQgaW4gdGhl
IHZhcmlzY2l0ZSBsYXllciB3aGVyZSB5b3UgZm91bmQgdGhlIApyZWZlcmVuY2UgdG8gdGhlIFUt
Qm9vdCBzb3VyY2UuCgogIE9yIHlvdSBjYW4gbG9vayBpbiB0aGVpciBjdXN0b20gVS1Cb290IHNv
dXJjZSBpbiB0aGUgY29uZmlncy8gZGlyZWN0b3J5LCB0aGUgCmRlZmNvbmZpZyBuYW1lIHByb2Jh
Ymx5IGlzIHNvbWV0aGluZyByZWNvZ25pemFibGUuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+
IENoZWVycywgTmVpbAo+IAo+IE9uIDIwMjQtMDktMjQgMzowOSBwLm0uLCBGYWJpbyBFc3RldmFt
IHdyb3RlOgo+PiBPbiBUdWUsIFNlcCAyNCwgMjAyNCBhdCA0OjA14oCvUE0gTmVpbCBXZWJzdGVy
IDxqYXJyYW5laWxAZ21haWwuY29tPiB3cm90ZToKPj4KPj4+IEJSMl9UQVJHRVRfVUJPT1RfQk9B
UkRfREVGQ09ORklHPSJpbXg4bW1fZXZrIgo+PiBZb3UgY2Fubm90IHVzZSB0aGUgVS1Cb290IGlt
eDhtbV9ldmtfZGVmY29uZmlnIGZvciB0aGUgaS5NWDhNTQo+PiBWYXJpc2NpdGUgRGFydCBib2Fy
ZC4KPj4KPj4gWW91IG11c3QgdXNlIGEgc3BlY2lmaWMgaS5NWDhNTSBWYXJpc2NpdGUgRGFydCBV
LUJvb3QgZGVmY29uZmlnIGluc3RlYWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
