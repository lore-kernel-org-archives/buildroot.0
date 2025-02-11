Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BFC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62E740358;
	Tue, 11 Feb 2025 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSbaogMnhZXa; Tue, 11 Feb 2025 16:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC54403E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC54403E6;
	Tue, 11 Feb 2025 16:27:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF402C2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD80C40253
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esfmDAdCUASC for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 16:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBFB8411AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFB8411AF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBFB8411AF
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:27:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so1317706f8f.3
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 08:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291235; x=1739896035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OHXP/kdzTSUXHuUSUE25uZlu7SjlOOasIALqf/0/htk=;
 b=ghC43kDWJ9uLMf3NQUZwJ/J1zRlVrZwGeBxOvOqtwaLZ5keYsxYLKM2GD37z+5NFJv
 g5ymJmi91rxKroYHQQaDWCDSLYawRkQuhycowY7+Sb38AmlHSXQLqJ/05EzURXtYELbk
 nBNhSvj9hiQ2LU0M9M6b9OfFOnnWPmyFQkjE8NvvNcKhfoz1ETzQwpL+biU2GskFOg3b
 38ZWpqI/haHux+cyFBb6FgN5AcX7K4Pj7MJG6Fd2krkHPzxidjQiRB7avZIqkqbhUUxb
 zMx0UXRqbSu2f4FJHm3bSrh/zxD7l5qraQpIcqvrwTwTZ/O6VH0wEy3ByKau/y7qi8l/
 t1/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcwiaGWKbGvwa+a/pB+zBwVI8gz7HKYzm7io1ustgAeRgSbOe7canYh3ZkgFRyIfJlkUvsJwFCaBQ=@buildroot.org
X-Gm-Message-State: AOJu0YysZKO8lg1I8aPMotw6JL8Z+d9TsREE5Bfvj5CLIvlKL+jptDIz
 mZFy7BAThKLzEnZnpeVVQRDMu57FInk6iToBMX2N5ns8ipNmXRNM1AiT63dz3MU=
X-Gm-Gg: ASbGncujfWLBeRPiDLOWy6ivzee87HOAoJtK0d+k1ntB4YhzyN9c+pRpHci0pCfQgsx
 i82YDrzIYdSKOhxYtZlT4w3W83C0bXR3jVHXAuz5iY25EHLLDgMGDoGd4FpTVbnMgfx2gtNm0l3
 MBvL/UZjm2v6MmTQ2YerUvVDtF/JO1QrkRwidEdvGRTpGRplzFfUCDZrUGQ7EkpQGyJ1kXKXYTh
 gdvUOvFNLi6a2evys2wcBBOx+JeVUZG2AoMEyh5OyBIy0OX1xc5JlGYRtaTRECgu1rSv3IR4l2+
 gL9iTGY3QJF0QyYymMLPa6AcuHMMjw9Yl0VT+Y6ljRAT5lJxGpBrgNQ5bgXlEdt6kLQUpOXEyk9
 4znHs5EYWpClgX/U6rsS9p/KTc8VtZ+9OLDaNUzpSoKXPxIPdJgo=
X-Google-Smtp-Source: AGHT+IH0ndNhlcbsm4la6n/8KMoTs5GnZpr4V5AQ8LkbHbSDzTqTL9bGE56Ts8BVBHla7K2biX8RSw==
X-Received: by 2002:a05:6000:1a8d:b0:38d:db8b:f505 with SMTP id
 ffacd0b85a97d-38ddb8bf70dmr8010872f8f.17.1739291234938; 
 Tue, 11 Feb 2025 08:27:14 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd3dcca71sm9890402f8f.76.2025.02.11.08.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:27:14 -0800 (PST)
Message-ID: <ae9ec0e5-a561-4a26-a657-32d93b282b8f@smile.fr>
Date: Tue, 11 Feb 2025 17:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-2-jamie.gibbons@microchip.com>
Content-Language: en-US
In-Reply-To: <20250121090513.3375533-2-jamie.gibbons@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739291235; x=1739896035; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OHXP/kdzTSUXHuUSUE25uZlu7SjlOOasIALqf/0/htk=;
 b=3OhNyovKg6yUi3bVbczesmy/nRI7lpbJANk1ULUmxCmql+MRCpZiP7I47PEIajOuda
 Z0OFWFHI+5MQX0S38WxyB6PO9bkIpBQIf1jAO0pRuDqF1QZTZ6/L3cPp3nNUQY5t1LcS
 +Dfcob9Ihq4Uo51q1f5hDKHjd/7a5IvwWI7t0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3OhNyovK
Subject: Re: [Buildroot] [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
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

SGVsbG8gSmFtaWUsIEFsbCwKClNvcnJ5IGZvciB0aGUgZGVsYXkgdG8gcmV2aWV3IHlvdXIgc2Vy
aWVzLgoKTGUgMjEvMDEvMjAyNSDDoCAxMDowNSwgSmFtaWUgR2liYm9ucyB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gRm9sbG93aW5nIHRoZSBhZGRpdGlvbiBvZiB0aGUgZmlybXdhcmUgdXBs
b2FkIEFQSSBpbiBsaW51eCB2Ni42LCB1c2luZwo+IGRlYnVnZnMgZm9yIGZpcm13YXJlIHVwZGF0
aW5nIGhhcyBiZWVuIHJlbW92ZWQuIFVwZGF0ZSB0aGUKPiB1cGRhdGUtZ2F0ZXdhcmUgc2NyaXB0
IHRvIHVzZSB0aGUgZmlybXdhcmUgdXBsb2FkIEFQSSB3aXRoIHN5c2ZzIGFuZAo+IGVuYWJsZSBh
cHBseWluZyB0aGUgb3ZlcmxheXMgZHVyaW5nIGJvb3QuCj4gVGhlIGZ3X3VwbG9hZCBpbnRlcmZh
Y2UgY2FuIGRldGVjdCB3aGVuIHRoZXJlIGlzIGFuIG92ZXJsYXkgZmlsZSBhbmQKPiB3aWxsIHdy
aXRlIGl0IGNvcnJlY3RseS4gVXNlIHRoaXMgZnVuY3Rpb25hbGl0eSB0byB3cml0ZSB0aGUgb3Zl
cmxheQo+IGZpbGUgYW5kIHJlbW92ZSBkZCBjb21tYW5kIHJlbGF0ZWQgY29kZS4KCkRvZXMgaXQg
bWVhbnMgdGhhdCB0aGUgdXBkYXRlLWdhdGV3YXJlLnNoIHNjcmlwdCBkb2Vzbid0IHdvcmsgc2lu
Y2UgdGhlIHVwZGF0ZQp0byA2LjYga2VybmVsPwoKSWYgc28sIHBsZWFzZSBhZGQgYSBGaXhlcyB0
YWc6CgogIEZpeGVzOiA4Y2U5N2ZkNTUwZDYgKCJjb25maWdzL2JlYWdsZXZfZmlyZTogYnVtcCBM
aW51eCBhbmQgVS1Cb290IikKCj4gCj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFtaWUgR2liYm9ucyA8amFt
aWUuZ2liYm9uc0BtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBib2FyZC9iZWFnbGVib2FyZC9iZWFn
bGV2X2ZpcmUvYm9vdC5jbWQgICAgICAgfCAgMSArCj4gIC4uLi91c3Ivc2hhcmUvbWljcm9jaGlw
L3VwZGF0ZS1nYXRld2FyZS5zaCAgICB8IDUxICsrKysrKysrKysrKysrLS0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAgbW9kZSBjaGFu
Z2UgMTAwNjQ0ID0+IDEwMDc1NSBib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZz
LW92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kIGIvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kCj4gaW5kZXggMDVmNDg1OGJhYy4uMTQw
MjQ1OGQ4YiAxMDA2NDQKPiAtLS0gYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9v
dC5jbWQKPiArKysgYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWQKPiBA
QCAtMTIsNCArMTIsNSBAQCBib290bSBsb2Fkb3MgJHtzY3JpcHRhZGRyfTsKPiAgYm9vdG0gcmFt
ZGlzazsKPiAgYm9vdG0gcHJlcDsKPiAgZmR0IHNldCAvc29jL2V0aGVybmV0QDIwMTEwMDAwIG1h
Yy1hZGRyZXNzICR7YmVhZ2xldmZpcmVfbWFjX2FkZHIwfTsKPiArcnVuIGRlc2lnbl9vdmVybGF5
czsKCmRlc2lnbl9vdmVybGF5cyBzZWVtcyByZWxhdGVkIHRvIGRldmljZXRyZWUgb3ZlcmxheSBz
dXBwb3J0IGJ1dApCUjJfTElOVVhfS0VSTkVMX0RUQl9PVkVSTEFZX1NVUFBPUlQgaXMgb25seSBl
bmFibGVkIGluIHRoZSBmb2xsb3dpbmcgcGF0Y2ggKDIvMykuCgo+ICBib290bSBnbzsKPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy1vdmVybGF5L3Vz
ci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoIGIvYm9hcmQvYmVhZ2xlYm9hcmQv
YmVhZ2xldl9maXJlL3Jvb3Rmcy1vdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdh
dGV3YXJlLnNoCj4gb2xkIG1vZGUgMTAwNjQ0Cj4gbmV3IG1vZGUgMTAwNzU1Cj4gaW5kZXggZjQ1
NTAzN2I2MC4uMjQ5YzViZDI2MAo+IC0tLSBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmly
ZS9yb290ZnMtb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaAo+
ICsrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtb3ZlcmxheS91c3Iv
c2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaAo+IEBAIC0xMywyMCArMTMsNDcgQEAg
ZmkKPiAgY3AgIiQxIi9tcGZzX2R0Ym8uc3BpIC9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaQo+
ICBjcCAiJDEiL21wZnNfYml0c3RyZWFtLnNwaSAvbGliL2Zpcm13YXJlL21wZnNfYml0c3RyZWFt
LnNwaQo+ICAKPiAtbW91bnQgLXQgZGVidWdmcyBub25lIC9zeXMva2VybmVsL2RlYnVnCj4gLQo+
ICAjIFRyYXNoIGV4aXN0aW5nIGRldmljZSB0cmVlIG92ZXJsYXkgaW4gY2FzZSB0aGUgcmVzdCBv
ZiB0aGUgcHJvY2VzcyBmYWlsczoKPiAtZmxhc2hfZXJhc2UgL2Rldi9tdGQwIDAgMTAyNAo+ICtm
bGFzaF9lcmFzZSAvZGV2L210ZDAgMCAxNgo+ICAKPiAtIyAjIFdyaXRlIGRldmljZSB0cmVlIG92
ZXJsYXkKPiAtZGQgaWY9L2xpYi9maXJtd2FyZS9tcGZzX2R0Ym8uc3BpIG9mPS9kZXYvbXRkMCBz
ZWVrPTEwMjQKPiArIyBJbml0aWF0ZSBGUEdBIHVwZGF0ZSBmb3IgZHRibwo+ICtlY2hvIDEgPiAv
c3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZwo+ICAKPiAtIyBGYWtl
IHRoZSBwcmVzZW5jZSBvZiBhIGdvbGRlbiBpbWFnZSBmb3Igbm93Lgo+IC1kZCBpZj0vZGV2L3pl
cm8gb2Y9L2Rldi9tdGQwIGNvdW50PTQgYnM9MQo+ICsjIFdyaXRlIGRldmljZSB0cmVlIG92ZXJs
YXkKPiArY2F0IC9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaSA+IC9zeXMvY2xhc3MvZmlybXdh
cmUvbXBmcy1hdXRvLXVwZGF0ZS9kYXRhCj4gKwo+ICsjIFNpZ25hbCBjb21wbGV0aW9uIGZvciBk
dGJvIGxvYWQKPiArZWNobyAwID4gL3N5cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tdXBkYXRl
L2xvYWRpbmcKPiAgCj4gLSMgSW5pdGlhdGUgRlBHQSB1cGRhdGUuCj4gLWVjaG8gMSA+IC9zeXMv
a2VybmVsL2RlYnVnL2ZwZ2EvbWljcm9jaGlwX2V4ZWNfdXBkYXRlCgpUaGlzIGxpbmUgc2hvdWxk
IG5vdCB3b3JrIG9uIDYuNiBrZXJuZWwgc2luY2UgZGVidWdmcyBmb3IgZmlybXdhcmUgdXBkYXRp
bmcKcmVtb3ZhbC4gQWRkaW5nIGEgbGluayB0byB0aGUga2VybmVsIGNvbW1pdCBkb2luZyB0aGlz
IGNoYW5nZSB3b3VsZCBiZSBncmVhdC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArd2hpbGUg
WyAiJChjYXQgL3N5cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tdXBkYXRlL3N0YXR1cykiICE9
ICJpZGxlIiBdOyBkbwo+ICsgICAgIyBEbyBub3RoaW5nLCBqdXN0IGtlZXAgY2hlY2tpbmcKPiAr
ICAgIHNsZWVwIDEKPiArZG9uZQo+ICAKPiAtIyBSZWJvb3QgTGludXggZm9yIHRoZSBnYXRld2Fy
ZSB1cGRhdGUgdG8gdGFrZSBlZmZlY3QuCj4gLSMgRlBHQSByZXByb2dyYW1taW5nIHRha2VzIHBs
YWNlcyBiZXR3ZWVuIExpbnV4IHNodXQtZG93biBhbmQgSFNTIHJlc3RhcnRpbmcgdGhlIGJvYXJk
Lgo+IC1yZWJvb3QKPiArIyBGYWtlIHRoZSBwcmVzZW5jZSBvZiBhIGdvbGRlbiBpbWFnZSBmb3Ig
bm93Lgo+ICtkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9tdGQwIGNvdW50PTEgYnM9NAo+ICsKPiAr
IyBJbml0aWF0ZSBGUEdBIHVwZGF0ZSBmb3IgYml0c3RyZWFtCj4gK2VjaG8gMSA+IC9zeXMvY2xh
c3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9sb2FkaW5nCj4gKwo+ICsjIFdyaXRlIHRoZSBm
aXJtd2FyZSBpbWFnZSB0byB0aGUgZGF0YSBzeXNmcyBmaWxlCj4gK2NhdCAvbGliL2Zpcm13YXJl
L21wZnNfYml0c3RyZWFtLnNwaSA+IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0
ZS9kYXRhCj4gKwo+ICsjIFNpZ25hbCBjb21wbGV0aW9uIGZvciBiaXRzdHJlYW0gbG9hZAo+ICtl
Y2hvIDAgPiAvc3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZwo+ICsK
PiArd2hpbGUgWyAiJChjYXQgL3N5cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tdXBkYXRlL3N0
YXR1cykiICE9ICJpZGxlIiBdOyBkbwo+ICsgICAgIyBEbyBub3RoaW5nLCBqdXN0IGtlZXAgY2hl
Y2tpbmcKPiArICAgIHNsZWVwIDEKPiArZG9uZQo+ICsKPiArIyBXaGVuIHRoZSBzdGF0dXMgaXMg
J2lkbGUnIGFuZCBubyBlcnJvciBoYXMgb2NjdXJlZCwgcmVib290IHRoZSBzeXN0ZW0gZm9yCj4g
KyMgdGhlIGdhdGV3YXJlIHVwZGF0ZSB0byB0YWtlIGVmZmVjdC4gRlBHQSByZXByb2dyYW1taW5n
IHRha2VzIHBsYWNlcyBiZXR3ZWVuCj4gKyMgTGludXggc2h1dC1kb3duIGFuZCBIU1MgcmVzdGFy
dGluZyB0aGUgYm9hcmQuCj4gK2lmIFsgIiQoY2F0IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1h
dXRvLXVwZGF0ZS9lcnJvcikiID0gIiIgXTsgdGhlbgo+ICsgICAgZWNobyAiRlBHQSB1cGRhdGUg
cmVhZHkuIFJlYm9vdGluZy4iCj4gKyAgICByZWJvb3QKPiArZWxzZQo+ICsgICAgZWNobyAiRlBH
QSB1cGRhdGUgZmFpbGVkIHdpdGggc3RhdHVzOiAkKGNhdCAvc3lzL2NsYXNzL2Zpcm13YXJlL21w
ZnMtYXV0by11cGRhdGUvZXJyb3IpIgo+ICsgICAgZXhpdCAxCj4gK2ZpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
