Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A02C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 06:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604E96077D;
	Tue, 29 Aug 2023 06:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604E96077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvKgIB_rR7Ue; Tue, 29 Aug 2023 06:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BA060792;
	Tue, 29 Aug 2023 06:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BA060792
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD64B1BF41D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 06:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B934057F
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 06:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B934057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoZFsjq7hViO for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 06:55:59 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44ADC400C7
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 06:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44ADC400C7
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso528235666b.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 23:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693292157; x=1693896957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jH/oFTolRO8oZtvptlwoLsSenXaAyJDaiIAZLmT22co=;
 b=GsPVb4CDw/+s87XF/0tEtepqK1a59Ao36JQIX1hluk+v5AvpffY4Ih5KngUbmzgJmv
 0EAhd+0VxlJJtVP3zbAN8fOlUqXN76WNyzXD6vQLrNxBR1/imyMIEBrF3qoJOTv/wapg
 1rUZrZJq3ZXtD7giCdVGMFyXx7s/Wone/gUJyrKpedW6vk+os2iiRWl2SfDZ/dPCTpAJ
 QD7InAmkS+4lh4CtGtll557nXGbPYgfOsFSB4FjhPzQfmTz33zlkEHhnSSOvlc91uznI
 UVoZh3gWYW5762sUm9uvYHmknBEBAzdJE6vI1kd6T8A7ctYqMy4H4zmFcm5hrpiRaES6
 n0gg==
X-Gm-Message-State: AOJu0YyeUDRloZtrv6wZ75gZApoQY+kahijvY9eOhKMqTNKqXxtgLHsP
 e6K+80Whth95D56AxS2c5lO+xUdPZFjZgwA0PxU=
X-Google-Smtp-Source: AGHT+IEjmIbZS2DgC33Hs7fDeFLZSPbmffks4CxGIr5amgna8BiK1O+AS8RViah6VLygSjzRkOb36w==
X-Received: by 2002:a17:906:5dac:b0:9a5:b630:a92a with SMTP id
 n12-20020a1709065dac00b009a5b630a92amr2812196ejv.8.1693292157015; 
 Mon, 28 Aug 2023 23:55:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a1709062dc100b0098921e1b064sm5555228eji.181.2023.08.28.23.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 23:55:56 -0700 (PDT)
Message-ID: <de12ed97-6da8-cf14-08e4-9b99099f6fd4@mind.be>
Date: Tue, 29 Aug 2023 08:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Robert Smigielski <ptdropper@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk> <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
 <87msyb548w.fsf@48ers.dk>
 <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
In-Reply-To: <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693292157; x=1693896957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jH/oFTolRO8oZtvptlwoLsSenXaAyJDaiIAZLmT22co=;
 b=Xe9l75n1j2HtbpXWgFBucTKooo9b6f8y03x4lEZNViN3UEtVwom0wjkORMxPNsHYZq
 OhKkWHX3ndUNU/PE170hqr9rH/gs2iZRzcKjIR025/NAqZuy0Pz1C5mDltwEg2tLxVGY
 2N0DU/eQA3Co3c+Xg99OeKgv+w3ENfxpy3eSUClwlxbLwYDxFBW0kkEIVakExwgNWmTf
 TFtRJAMDxMwmRUFKyZAON88YpckG/yK3NhjKjwugWci4CE5MlR9UQNQfMN0U8u2kp4mw
 Ggsv9sJ3Ey4UMGkyq1ser/E3UZEgjz8vTTBVStvXEW1vyUB4eyMaIqdzwvsXAdfyAfaO
 3RBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xe9l75n1
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wOC8yMDIzIDAxOjE5LCBSb2JlcnQgU21pZ2llbHNraSB3cm90ZToKPiAKPiAKPiAg
ICAgIMKgPsKgIEkgdGhpbmsgUm9iZXJ0IGlzIG5vdCBuZWNlc3NhcmlseSBwcmltYXJpbHkgY29u
Y2VybmVkIHdpdGggZmluZGluZwo+ICAgICAgwqA+wqAgdnVsbmVyYWJpbGl0aWVzLCBidXQgcmF0
aGVyIHdpdGggY29uc3RydWN0aW5nIGEgbWVhbmluZ2Z1bCBhbmQKPiAgICAgIMKgPiBhY2N1cmF0
ZSBTQm9NICh3aGljaCBpcyB3aGF0IGRlcGVuZGVuY3l0cmFjayBkb2VzKS4KPiAKPiAgICAgVHJ1
ZS4gVGhlIG1vbml0b3Jpbmcgc3R1ZmYgc2VlbXMgcXVpdGUgaW50ZXJlc3RpbmcgZm9yIHZ1bG5l
cmFiaWxpdGllcwo+ICAgICB0aG91Z2guCj4gCj4gCj4gWWVzIEkgYW0gY29uY2VybmVkIHdpdGgg
Y3JlYXRpbmcgYSB2YWxpZCBDeWNsb25lRFggb2ZmaWNpYWwgU0JPTSBmb3IgdXNlIGluIAo+IG90
aGVyIHByb2plY3RzIGFzIGFuIGlucHV0LiBGb3IgZXhhbXBsZSB0YWtlIHRoZSBvdXRwdXQgZmls
ZSA8cHJvZHVjdD4uanNvbsKgYXMgCj4gaW5wdXQgdG8gRGVwZW5kZW5jeSBUcmFjay4gSXQgZG9l
cyB3b3JrLiBUaGF0IGlzIGV4YWN0bHkgd2hhdCBJIG5lZWQgZm9yIG15IAo+IGRhaWx5IHdvcmsu
Cj4gCj4gICAgIE9LLiBJdCBkb2Vzbid0IHNvdW5kIGxpa2UgaXQgd2lsbCBicmluZyBhIGxvdCBv
ZiBhZHZhbnRhZ2VzIGZvciB0aGUKPiAgICAgZWZmb3J0IHRvIG1haW50YWluIFBVUkwgaWRlbnRp
ZmllcnMgOi8KCiAgRnJvbSBhIHB1cmUgdnVsbmVyYWJpbGl0aWVzIHRyYWNraW5nIHBvaW50IG9m
IHZpZXcsIGl0IG1heSBzZWVtIGl0IGRvZXNuJ3QuIApIb3dldmVyLCBJIGV4cGVjdCB0aGF0IHRo
ZXJlIGFyZSB2dWxuZXJhYmlsaXRpZXMgdGhhdCBhcmUgdHJhY2tlZCBpbiBPU1YgZm9yIAplY29z
eXN0ZW1zIGxpa2UgUHlQSSwgR28sIGFuZCBjcmF0ZXMuaW8sIHdoaWNoIGRvbid0IGhhdmUgYSBj
b3JyZXNwb25kaW5nIENWRSBvciAKd2hlcmUgdGhlIENQRSBpbmZvcm1hdGlvbiBpcyBpbmFjY3Vy
YXRlL2luY29ycmVjdC4gQW5kIEknbSB2ZXJ5IHN1cmUgdGhhdCB0aGVyZSAKYXJlIHZ1bG5lcmFi
aWxpdGllcyB0aGF0IGFyZSBmb3VuZCBieSBPU1MtRnV6eiB3aGljaCBkb24ndCBnZXQgYSBDVkUg
KEkgdGhpbmsgCk9TUy1GdXp6IG5ldmVyIGNyZWF0ZXMgQ1ZFcyB0aGVtc2VsdmVzLCB0aGV5IGV4
cGVjdCB0aGUgcGFja2FnZSBtYWludGFpbmVycyB0byAKZG8gdGhhdCkuIE9mIGNvdXJzZSwgdGhl
IHF1ZXN0aW9uIGlzIGhvdyB2YWx1YWJsZSB0aG9zZSBPU1MtRnV6eiB2dWxuZXJhYmlsaXR5IApy
ZXBvcnRzIGFyZTogdGhleSBqdXN0IGhhdmUgYSByZXByb2R1Y2VyLCBubyBhbmFseXNpcyBvZiB0
aGUgcmlzayBvciBpbXBhY3QuCgogIEFueXdheTogY3JlYXRpbmcgYSBwdXJsIGJhc2VkIG9uIHRo
ZSBQeVBJLCBHbyBhbmQgY3JhdGVzLmlvIGVjb3N5c3RlbXMgYmFzZWQgCm9uIHRoZSBpbmZvcm1h
dGlvbiBhbHJlYWR5IGluIEJ1aWxkcm9vdCBzaG91bGQgYmUgcmF0aGVyIHRyaXZpYWwsIGFuZCBp
dCBoYXMgdmFsdWUuCgoKPiAgRnJvbSBteSB2aWV3IHBvaW50IC0gaWYgQnVpbGRyb290IHN1cHBv
cnRzIFBVUkwgSSB3aWxsIGFkZCB0aGF0IGRhdGEgdG8gbXkgCj4gcHJvamVjdC4gSWYgbm90LCB0
aGF0IGlzIG9rYXkuCj4gCj4gCj4gICAgICDCoD4gZWFjaCB3aXRoIGEgZGlzdGluY3QgUFVSTC4g
V2UgY291bGQgc3RhcnQgb3VyIG93biBuYW1lc3BhY2UsIGJ1dAo+ICAgICAgwqA+IHRoYXQncyBr
aW5kIG9mIHBvaW50bGVzcyB1bmxlc3Mgd2UgYWxzbyBpc3N1ZSBhZHZpc29yaWVzLi4uCj4gCj4g
Cj4gWWVzLCBCdWlsZHJvb3QgY291bGQgY29uc2lkZXIgaXRzZWxmIGEgcGFja2FnZSBtYW5hZ2Vy
LCBiZWNhdXNlIGl0IGRvZXMgdGhhdC4gCj4gVGhhdCBpZGVhIGlzIGEgcG9zc2liaWxpdHkuCgog
IElNSE8sIHRob3VnaCwgdGhlIGlkZWEgdGhhdCBhIHBhY2thZ2UgbWFuYWdlciBjcmVhdGVzIGEg
bmFtZXNwYWNlIGlzIG5vdCB2ZXJ5IAp2YWx1YWJsZS4gSXQgc2hvdWxkIGJlIHVwIHRvIHRoZSBh
Y3R1YWwgcGFja2FnZSBtYWludGFpbmVycyB0byBkZWNpZGUgd2hpY2ggCmVjb3N5c3RlbSB0aGV5
IGJlbG9uZyB0by4KCgoKPiAgICAgSSBndWVzcyB3ZSBzaG91bGQgdXNlIHRoZSBvbmUgbWF0Y2hp
bmcgd2hlcmUgd2UgZ2V0IHRoZSBzb3VyY2UgY29kZSBmcm9tCj4gICAgIChpZiBhbnkpLiBUaGUg
Y3ljbG9uZWR4IHRvb2wgdXNlcyBhICJnZW5lcmljIgo+ICAgICBwa2c6Z2VuZXJpYy8kbmFtZT9k
b3dubG9hZF91cmw9JHNpdGUvJHRhcmJhbGwsIHNvIHdlIGNvdWxkIGRlZmF1bHQgdG8KPiAgICAg
dGhhdCBhbmQganVzdCB1c2UgcHlwaS9naXRodWIvd2hhdGV2ZXIgZm9yIHRoZSBzcGVjaWFsIGNh
c2VzIHdoZXJlIHRoZXJlCj4gICAgIGlzIGEgbW9yZSBhY2N1cmF0ZSBvbmUKCiAgRXhhY3RseS4K
Cj4gWWVzLCB0aGUgdG9vbCBJIHdyb3RlIHVzZXMgdGhlICJnZW5lcmljIsKgIHBhY2thZ2UuIFRo
ZXJlIGlzIGEgcGxhY2UgaG9sZGVywqBvdXQgCj4gdGhlcmUgaW4gUFVSTCBmb3IgQnVpbGRyb290
IGlmIHlvdSB3YW50IHRvIGdvIHRoYXQgd2F5IGluIHRoZSBmdXR1cmUuCgogIEFzIEkgd3JvdGUg
YWJvdmU6IEkgZG9uJ3QgdGhpbmsgdGhhdCBnZW5lcmljIHBsYWNlaG9sZGVyIGlzIHZlcnkgdmFs
dWFibGUuIApBbHRob3VnaCwgaXQgZG9lcyBnaXZlIHlvdSBhIHVuaWZpZWQgVVJJIHNjaGVtZSB0
aGF0IHBvaW50cyB5b3UgdG8gdGhlIGV4YWN0IApzb3VyY2UgYW5kIHZlcnNpb24gdGhhdCB3YXMg
dXNlZC4gQnV0IGJlY2F1c2UgaXQncyBub3QgYSB1bmlxdWUgaWRlbnRpZmllciwgaS5lLiAKdGhl
cmUgYXJlIG1hbnkgZGlmZmVyZW50IFBVUklzIHRoYXQgcG9pbnQgdG8gZXhhY3RseSB0aGUgc2Ft
ZSBzb3VyY2UuIEUuZy4gZm9yIApnaXRodWIgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgdGFyYmFs
bHMsIHRoZXJlJ3MgYSBiaXQgb2YgZnJlZWRvbSBpbiBob3cgeW91IApjb25zdHJ1Y3QgdGhlIHRh
cmJhbGwgbmFtZSBhbmQgd2UgYWN0dWFsbHkgbWFrZSB1c2Ugb2YgdGhhdCBmcmVlZG9tLiBUaGlz
IG1lYW5zIAp0aGF0IHlvdSBjYW5ub3QgY29tcGFyZSBnZW5lcmljIFBVUklzIGZyb20gZGlmZmVy
ZW50IHNvdXJjZXMgYW5kIGV4cGVjdCB0aGVtIHRvIApoYXZlIGEgbWVhbmluZ2Z1bCBtYXRjaC4g
U28gaXQncyBubyB1c2UgZm9yIHZ1bG5lcmFiaWxpdHkgdHJhY2tpbmcuCgogIEJUVywgaXMgdGhp
cyAiZ2VuZXJpYyIgbmFtZXNwYWNlIHNvbWV0aGluZyBvZmZpY2lhbCBvciBzb21ldGhpbmcgeW91
IGludmVudGVkPwoKCj4gICAgICDCoD7CoCBUaGVyZSdzIGJ5IHRoZSB3YXkgYW5vdGhlciBpc3N1
ZSAod2hpY2ggYWxzbyBleGlzdHMgZm9yIHRoZSBDUEUtYmFzZWQKPiAgICAgIMKgPsKgIGFwcHJv
YWNoKTogb3VyICJCb00iIGZvciB0aGUgY2FyZ28gYW5kIGdvIHBhY2thZ2VzIGlzIG5vdCBjb3Jy
ZWN0OiB3ZQo+ICAgICAgwqA+IHZlbmRvciB0aGUgZGVwZW5kZW5jaWVzLCBidXQgdGhleSdyZSBu
b3QgdGFrZW4gaW50byBhY2NvdW50IGluIHRoZQo+ICAgICAgwqA+IEJvTS4gVGhlIHRhcmJhbGwg
d2UgcHV0IGluIGxlZ2FsLWluZm8gZG9lcyBpbmNsdWRlIHRoZSB2ZW5kb3JlZAo+ICAgICAgwqA+
IGRlcGVuZGVuY2llcywgYnV0IHRoZXkncmUgbm90IG1lbnRpb25lZCBpbiB0aGUgbWFuaWZlc3Qs
IGFuZCB3ZSBkb24ndAo+ICAgICAgwqA+IHNjYW4gdGhlaXIgdnVsbmVyYWJpbGl0aWVzLgo+IAo+
IAo+IElmIGRhdGEgaXMgbm90IGluIHRoZSBsZWdhbC1pbmZvLCB0aGVuIG5vIHByb2JsZW0sIHRo
ZSBDeWNsb25lRFgtQnVpbGRyb290IAo+IHByb2plY3Qgd2lsbCBub3Qgc2VlIGl0LsKgIE5vdGUg
dGhhdCBDeWNsb25lRFggaGFzIHN1cHBvcnQgZm9yIGNhcmdvIGFuZCBmb3IgZ28gCj4gYWxyZWFk
eS4gTWF5YmUgdGhhdCBjYW4gaGVscC4KCiAgSSBkb24ndCB0aGluayB0aGVyZSdzIGEgdG9vbCB0
aGF0IHlvdSBjYW4gZmVlZCB0aGUgQ3ljbG9uZURYIFNCb00gYW5kIHRoYXQgCndpbGwgYWRkIGFs
bCB0aGUgbWlzc2luZyBnby9jcmF0ZXMgZGVwZW5kZW5jaWVzIHRvIGl0LiBUaGVyZSBhcmUgdG9v
bHMgdGhhdCBkbyAKdGhpcyBiYXNlZCBvbiB0aGUgc291cmNlLCB0aG91Z2guCgogIEhvd2V2ZXIs
IGl0J3Mgbm90IF90aGF0XyBkaWZmaWN1bHQgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJvbSB3
aXRoaW4gCmJ1aWxkcm9vdC4gV2hlbiB3ZSBkbyB0aGUgdmVuZG9yaW5nIGluIHRoZSBkb3dubG9h
ZCBzdGVwLCB3ZSBjYW4gYXNrIHRoZSAKZG93bmxvYWQgdG9vbCAoY2FyZ28gLyBnbyBtb2QpIHRv
IGFsc28gY3JlYXRlIGEgbWFuaWZlc3Qgb2YgdGhlIHZlbmRvcmVkIApkZXBlbmRlbmNpZXMuIElu
IGZhY3QsIEkgdGhpbmsgdGhleSBkbyB0aGF0IGF1dG9tYXRpY2FsbHkuIFNvIGl0J3MgImp1c3Qi
IGEgCm1hdHRlciBvZiBwYXJzaW5nIHRoaXMgbWFuaWZlc3QgYW5kIGluY2x1ZGluZyBpdCBpbiB0
aGUgU0JvTS4KCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
