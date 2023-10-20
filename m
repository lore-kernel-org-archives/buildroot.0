Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16E2CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 16:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F93C705AA;
	Fri, 20 Oct 2023 16:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F93C705AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4ox_bsnE_Hj; Fri, 20 Oct 2023 16:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D09D705A4;
	Fri, 20 Oct 2023 16:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D09D705A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A49FF1BF336
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88A69433BB
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A69433BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oprk7XQ_EcSo for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 16:03:57 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB012433BA
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 16:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB012433BA
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so448676266b.1
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 09:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697817835; x=1698422635;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCfKcL7deLpwEUV08KtdDDzP7BQuA48nBFqcpHrjmzs=;
 b=FXbXlfJTARKfeSNWDsza+/W0P3fu9yKtWPpWAaCmeAy7XGrA/bxfW+dXpZmzmdhU+4
 ZYVMkj1brZZqPY5aJkrANmbWYDvkyTj4LlwYEGj/hSB2pJNBcjvMUshx9VXRBTb8J9eV
 xWCR9lOFDhRKz6EGh24GyX+E1gu+fiTZTpwiApwDXcViK8Ckk28f3mcZkBrq6XR9Eihw
 C9d1hejFOGyzlooCH67jZ5RuUuiVKS1Ly4zgARcVUUvOb9TkWpeovllX2PiHrR+I/y80
 yHHuXUJbcgSLlBfObeOih7zc/hcl9AWeWOTyOKbtzWrJCcVqUnaR4PnEDcJV5RLeSG8n
 e2ww==
X-Gm-Message-State: AOJu0YwIenipOz6Y899Dg8wvGfORyKtEFN14T2qD+elDkmCYUeiOfiLj
 Kz+sQ8pjBrQIA3jg/Iu5ZihXjw==
X-Google-Smtp-Source: AGHT+IFLy+GK++7FoolD/BZaAIN3ZlbliaIvhVyhGhFmqjKHH65ftvbGTf/fwETywvx6zCILafMMQw==
X-Received: by 2002:a17:907:97cc:b0:9a5:9f3c:961e with SMTP id
 js12-20020a17090797cc00b009a59f3c961emr2091888ejc.18.1697817834744; 
 Fri, 20 Oct 2023 09:03:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00992f2befcbcsm1762907ejc.180.2023.10.20.09.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 09:03:54 -0700 (PDT)
Message-ID: <8e121f8b-96d2-ff26-91bf-c132e9372993@mind.be>
Date: Fri, 20 Oct 2023 18:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, Andreas Naumann <dev@andin.de>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
 <PH1P110MB1603F040C26E52D79C4F01719FDBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603F040C26E52D79C4F01719FDBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697817835; x=1698422635; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCfKcL7deLpwEUV08KtdDDzP7BQuA48nBFqcpHrjmzs=;
 b=iDS+OPV407/cmCLUpqdq1O57VjqndPBPjaKlzN2NUiUEHNKXFv6va0oNU5VL1Pn1Ep
 IzDvqmzm+4tI+b/fj/aA0vgpxVctNWorKmw/VFY8jt1a3wN/0hQN8Uf8Ll4UvlUxU1pZ
 BB9GduQuzTud5FVGsaOr4IKLL9+2zqS2kih8RP5TwxhowcbIo8bG/uQ+4CYetdoUvTLH
 FzhjHDEHs0UmGO3DFHeeDsYcZU2EAUeXpFquDJYkr7JH/FW9JJ/aJEe0/vsNamjj+Odc
 vvWlUB6k3sJBPdkmt+bz01hGZNqsgVfj8E2leU3cdIcil6xCrzdBum7kYkO7+QiFheRO
 2u3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iDS+OPV4
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8xMC8yMDIzIDE3OjA5LCBWaW5jZW50IEZhemlvIHdyb3RlOgo+IEFsbAo+IAo+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBBbmRyZWFzIE5hdW1hbm4gPGRldkBh
bmRpbi5kZT4KPj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIwLCAyMDIzIDk6MzAgQU0KPj4gVG86
IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPjsgYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc7Cj4+IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT47IEFybm91dCBWYW5k
ZWNhcHBlbGxlCj4+IChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+PiBTdWJqZWN0
OiBSZTogW0J1aWxkcm9vdF0gW0V4dGVybmFsXSAtIFtQQVRDSCAwLzFdIGxpYmdwaW9kIHYyCj4+
Cj4+IEhpIFZpbmNlbnQsIGFsbCwKPj4KPj4gT24gMTkuMTAuMjMgMDk6MzQsIEVkZ2FyIEJvbmV0
IHdyb3RlOgo+Pj4gSGVsbG8hCj4+Pgo+Pj4gT24gMjAyMy0xMC0xOCwgYWJvdXQgd2hldGhlciB0
aGUgQVBJLWJyZWFraW5nIGxpYmdwaW9kIHYyIHNob3VsZCBiZSBhbgo+Pj4gdXBncmFkZSBvciBh
IG5ldyBwYWNrYWdlLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4+PiBJZiBpdCdzIGxp
a2UgIm1vc3RseSBpdCB3aWxsIHN0aWxsIHdvcmssIGJ1dCB0aGVyZSBhcmUgYSBmZXcKPj4+PiBm
dW5jdGlvbnMgdGhhdCB5b3UgbmVlZCB0byByZXBsYWNlIHdpdGggYSBuZXcgdmFyaWFudCIsIHRo
ZW4gdGhlCj4+Pj4gcHJvcGVyIGFwcHJvYWNoIGlzIGluZGVlZCB0byBmaXggdGhlIHBhY2thZ2Vz
IHRoYXQgZmFpbCB0byBidWlsZC4KPj4+PiBbLi4uXQo+Pj4+Cj4+Pj4gRm9yIGJpZ2dlciBBUEkg
Y2hhbmdlcyBbLi4uXSB3ZSBpbmRlZWQgbmVlZCBhIG5ldyBwYWNrYWdlIGxpYmdwaW9kMi4KPj4+
Cj4+PiBJJ3ZlIHdhdGNoZWQgYSB0YWxrIGJ5IEJhcnRvc3ogR29sYXN6ZXdza2kgYWJvdXQgdGhl
IG5ldyBsaWJncGlvZCxbMV0KPj4+IHRoZW4gc3RhcnRlZCBsb29raW5nIGF0IHRoZSBkb2N1bWVu
dGF0aW9uIG9mIHRoaXMgbmV3IEFQSS5bMl0gTXkKPj4+IGZlZWxpbmcgaXMgdGhhdCB0aGlzIGlz
IGEgcXVpdGUgZXh0ZW5zaXZlIHJld3JpdGUuIEEgcHJvZ3JhbSB3YW50aW5nCj4+PiB0byBzdXBw
b3J0IGJvdGggdGhlIHYxIGFuZCB0aGUgdjIgQVBJcyB3b3VsZCBuZWVkIHF1aXRlIGEgYml0IG9m
Cj4+PiBjb25kaXRpb25hbCBjb21waWxhdGlvbi4KCiAgWWVhaCwgSSBsb29rZWQgYSBiaXQgYXQg
dGhlIGhlYWRlcnMgYW5kIGl0J3MgcmVhbGx5IGEgZGlmZmVyZW50IEFQSS4KCiAgVGhhdCBtZWFu
cyBpdCByZWFsbHkgc2hvdWxkIGJlIGEgc2VwYXJhdGUgbGliZ3Bpb2QyIHBhY2thZ2UuCgogIEkg
ZG9uJ3QgdGhpbmsgdGhleSdyZSBzaWRlLWJ5LXNpZGUgaW5zdGFsbGFibGUgKHRoZXkgaGF2ZSB0
aGUgc2FtZSBoZWFkZXJzIApBRkFJQ1MpLCBzbyB0aGF0IG1lYW5zIHdlJ2xsIG5lZWQgYSBkZXBl
bmRzIG9uICFCUjJfUEFDS0FHRV9MSUJHUElPRCBvciB2aWNlIHZlcnNhLgoKPj4KPj4gSSd2ZSBn
b3QgdGhlIHNhbWUgaW1wcmVzc2lvbiBhbmQgd291bGQgdm90ZSB0byBjcmVhdGUgbGliZ3Bpb2Qy
IGZvciB0aGUgc2FtZQo+PiByZWFzb25zIEFybm91dCBzdGF0ZWQuIEV2ZW4gaWYgY29uZGl0aW9u
YWwgdXNlIGlzIHBvc3NpYmxlLCBpdCdzIG5vdCB0aGF0Cj4+IHN0cmFpZ2h0Zm9yd2FyZCBhbmQg
cmVxdWlyaW5nIHNvbWVib2R5IHRvIGltcGxlbWVudCBhbmQgcG9zc2libHkKPj4gdXBzdHJlYW0g
dGhvc2UgZm9yIHRoZSA0IGRlcGVuZGVudCBwYWNrYWdlcyBzZWVtcyBsaWtlIGNyZWF0aW5nIGEg
YmFycmllci4KPj4KPiAKPiBUaGlzIGlzIGZpbmUsIGJ1dCBpdCB3b24ndCBiZSBhIHBhaW5sZXNz
IHRyYW5zaXRpb24uIFRoZSBkb3duc2lkZSBpcyB0aGF0IGxpYmdwaW9kMgo+IHJlcXVpcmVzIExp
bnV4IDUuMTArLCBzbyBtYWtpbmcgaXQgYSBzZXBhcmF0ZSBwYWNrYWdlIGZvciB0aGF0IHB1cnBv
c2UgbWFrZXMKPiBzZW5zZS4gQnV0IGhhdmluZyBpdCBiZSBhIHNlcGFyYXRlIHBhY2thZ2UgZG9l
cyBjb21wbGljYXRlIG90aGVyIHBhY2thZ2VzCj4gdGhhdCBkZXBlbmQgb24gbGliZ3Bpb2QgYmVj
YXVzZSB0aGV5IHdpbGwgbmVlZCB0byBiZSBwYXRjaGVkIHRvIHBsYXkgbmljZSB3aXRoCj4gYm90
aCB2ZXJzaW9ucyBlaXRoZXIgd2F5LiAKCiAgTm90IG5lY2Vzc2FyaWx5LiBJZiBhIHBhY2thZ2Ug
c3VwcG9ydHMgb25seSBsaWJncGlvZDIsIHRoZW4gaXQganVzdCBzZWxlY3RzIApCUjJfUEFDS0FH
RV9MSUJHUElPRDIuIFdoaWxlIGEgcGFja2FnZSB0aGF0IHN1cHBvcnRzIGJvdGggd2lsbCBoYXZl
CgoJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdQSU9EMiBpZiAhQlIyX1BBQ0tBR0VfTElCR1BJT0QK
Cgo+IEFuZCBpdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBzZWxlY3QgbGliZ3Bpb2QyIGFuZAo+
IHRob3NlIG90aGVyIHBhY2thZ2VzIHVudGlsIHRoZXkgaGF2ZSBoYWQgcGF0Y2hlcyB3cml0dGVu
LgoKICBXZWxsLCBpdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBoYXZlIGEgYnVpbGQgdGhhdCBp
bmNsdWRlcyBhIHBhY2thZ2UgdGhhdCAKb25seSBzdXBwb3J0cyBsaWJncGlvZDIgYW5kIGFub3Ro
ZXIgcGFja2FnZSB0aGF0IHN1cHBvcnRzIG9ubHkgbGliZ3Bpb2QuIEJ1dCAKc2luY2UgdGhlcmUg
YXJlIG9ubHkgNCBkZXBlbmRlbnQgcGFja2FnZXMsIHRoYXQgaXMgcXVpdGUgdW5saWtlbHkuCgoK
Pj4gSW4gYWRkaXRpb24sIGkgdGhpbmsgdGhlIGJlaGF2aW91ciBvZiB0aGUgdG9vbHMgaGFzIGNo
YW5nZWQgYSBiaXQsIGUuZy4KPj4gYWZ0ZXIgZ3Bpb3NldCBmaW5pc2hlcyBpdCByZXR1cm5zIHRo
ZSBHUElPIHRvIHRoZSBvcmlnaW5hbCBzdGF0ZSAoYXQgbGVhc3QgdGhhdCdzCj4+IHdoYXQgSSBy
ZWNhbGwgZnJvbSB3aGF0IELDtnJnZSB0b2xkIG1lIGFib3V0IGl0KS4KPj4KPj4gU28gaWYgcGVv
cGxlIHVzZSBncGlvZ2V0L3NldCBhbmQgc28gb24gaW4gc2NyaXB0cywgdGhlIGJlaGF2aW91ciBt
b3N0IGxpa2VseQo+PiBjaGFuZ2VzIHVuZXhwZWN0ZWRseS4KPj4KPiAKPiBJTU8sIGNvbnN1bWVy
cyBvZiBCUiBzaG91bGQgYmUgcmV2aWV3aW5nIHRoZSBjaGFuZ2Vsb2dzIGFuZCBtYWtpbmcgbm90
ZSBvZgo+IGFueSB2ZXJzaW9uIGJ1bXBzIHRoYXQgY291bGQgaW1wYWN0IHRoZWlyIHdvcmtmbG93
cyBhbmQgZG9pbmcgdGhlIHRlc3RpbmcgdG8KPiBtYWtlIHN1cmUgdGhpbmdzIHN0aWxsIHdvcmsg
Zm9yIHRoZWlyIHNpdHVhdGlvbi4KPiAKPiBCUiBjYW4ndCBiZSByZXNwb25zaWJsZSBmb3IgdGhl
IGV0ZXJuYWwgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgb2YgYWxsIG9mIHRoZQo+IHRvb2xzIGl0
IHByb3ZpZGVzLgoKICBUbyBzb21lIGV4dGVudCwgQlIgX2lzXyByZXNwb25zaWJsZSBmb3IgdGhh
dC4KCiAgQW5kIHdlIF93aWxsXyByZW1vdmUgbGliZ3Bpb2QgYWZ0ZXIgc29tZSB0aW1lIC0gcHJv
YmFibHkgYSB2ZXJ5IHNob3J0IHRpbWUsIGFzIApzb29uIGFzIGFsbCBkZXBlbmRlbnQgcGFja2Fn
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQuIFRob3VnaCBJIGV4cGVjdCBpdCB3aWxsIG5ldmVyIApoYXBw
ZW4gZm9yIGFsdGVyYS1zdGFwbCBiZWNhdXNlIHVwc3RyZWFtIHNlZW1zIHRvIGJlIGRlYWQuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+PiBAVmluY2VudCwgZG8geW91IGhhdmUgdGhlIGludGVu
dCBvciBtYXliZSBldmVuIGEgcGF0Y2ggZm9yIGNyZWF0aW5nIGEKPj4gc2VwYXJhdGUgdjIgcGFj
a2FnZT8gT3RoZXJ3aXNlIG1lL0LDtnJnZSB3b3VsZCBsb29rIGludG8gY29taW5nIHVwIHdpdGgK
Pj4gb25lLgo+Pgo+IAo+IEkgd29uJ3QgaGF2ZSB0aW1lIHRvIGRvIHRoaXMgYW55IHRpbWUgc29v
bi4KPiAKPj4KPj4gcmVnYXJkcywKPj4gQW5kcmVhcwo+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
