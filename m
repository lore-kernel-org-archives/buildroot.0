Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 619DC40189;
	Sat,  4 Nov 2023 18:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619DC40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdZN0FyuQkpK; Sat,  4 Nov 2023 18:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42395402E0;
	Sat,  4 Nov 2023 18:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42395402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28F441BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C33402E0
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C33402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vGjZ8Tf4Biu for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:29:51 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D177840189
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D177840189
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-777745f1541so213749885a.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 11:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699122589; x=1699727389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Z9hHWo4gPLQEByp82BlVoWfjZzeIEzx7oIdVSNDxy4=;
 b=s3Cswqv42AsbxfmDaOgpqItdWymTW9Ghl97X5X+CaPegnUUpCwaNcUpbjjNCAqhxC8
 jpvRH0gH9AK1qPThPz7OY5EUGhYX/yC7HRnPfp2ShrXseAvNpUj+p26vcya2bVlspJue
 a9iiInB+H9E9e/bi9hzRD557nOJ7Inl0VdHj6uqqwgvm1ei7FmEsgRb0eLVIzOgH5V/2
 vI0K9wqq/vMgdBp2aWKkHcElpN2HcG6VK3/ozzEQyDZ5/kJHEqjY7SFvZMR6d0apnUFd
 5BwY4pfQr65XRH2+bOCLslyxLbgAfW0g5eC3RxmhQQbcf6azsK3y2d2P42VJG88sq00y
 JfSA==
X-Gm-Message-State: AOJu0Yy9bOOBLyD6oM5X6pknDqiGfP6z0BCidckpOvbDae5kXwye7Hjg
 BPsPrqjiFDgWWy+EcAgYBek5IQ==
X-Google-Smtp-Source: AGHT+IEdyfGxs8SUCAN8QWTuZXaYFNPaP832ITP3qVMQ9Xb6yRzlrXPt2qG8TJTact+Dtryz5ukUIw==
X-Received: by 2002:a05:620a:4d8f:b0:777:6d:b877 with SMTP id
 uw15-20020a05620a4d8f00b00777006db877mr20973919qkn.68.1699122589515; 
 Sat, 04 Nov 2023 11:29:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a37c401000000b0076f058f5834sm1762290qki.61.2023.11.04.11.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 11:29:49 -0700 (PDT)
Message-ID: <3ec6d683-1939-4116-b363-53b986deca95@mind.be>
Date: Sat, 4 Nov 2023 19:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-20-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-20-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699122589; x=1699727389; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Z9hHWo4gPLQEByp82BlVoWfjZzeIEzx7oIdVSNDxy4=;
 b=azf48EYAXapR3pPPH0BglxD6olVikHtRLMNCdUJDe6yyDn8g0ZyhKpWOzY6+RMkODD
 g9yVqmhrnRmoxEvuCi0u8qyHnLvTZJvSw+9xRITtN2f4hy9eesrtPMPuRtbIY5nlHIyx
 QXs9vZZFRn1OJFlZi3meAjnAeKjOuXyJhl7is8vklIXcSGDyUJHdIEJhWIPQO/BDRss2
 Akd0bEcL+j87xFkti0M9JShF6HQ25ZTHnl074+znc0f80rtG/3IkH6BRg97I8FapPN5t
 SqDp9tHMv5NNDtSu4HNEeCXVG45VkrEoJJSrTFUQNUznPc8t5HJqZoyp/fKtvZrzSgoU
 pfcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=azf48EYA
Subject: Re: [Buildroot] [PATCH 19/30] package/libftdi: add patch to move
 from distutils to sysconfig
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBBZGFtLAoKICBRdWl0ZSBhIGZldyB0aGluZ3Mgd2VudCB3cm9uZyB3aXRoIHRoaXMgcGF0
Y2guLi4gT3RoZXIgdGhhbiBpdCBiZWluZyB0aGUgd3JvbmcgCnBhY2thZ2UsIGFzIG5vdGVkIGJ5
IFllZ29yLCB0aGVyZSBhcmUgc29tZSBtb3JlIGRldGFpbHM6CgpPbiAyNi8xMC8yMDIzIDExOjI2
LCBBZGFtIER1c2tldHQgd3JvdGU6Cj4gSW4gcHJlcGVyYXRpb24gb2YgcHl0aG9uIDMuMTIuMCwg
ZGlzdHV0aWxzIGhhcyBiZWVuIHJlbW92ZWQgY29tcGxldGVseS4KPiBUaGlzIGlzIGEgcGF0Y2gg
dGFrZW4gZnJvbSB0aGUgRmVkb3JhIDM5IFJQTTogbGliZnRkaS0xLjUtMTAuZmMzOS54ODZfNjQu
Cj4gCj4gVXBzdHJlYW0gY29tbWl0OiBhYmQxOWI3MjFmN2U5YjRkNTE0ZWQzMTllY2UxNzNlYmM3
YjFlYTcyCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1h
cnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gICAuLi4wMDMtbW92ZS1mcm9tLWRpc3R1dGlscy10
by1zeXNjb25maWcucGF0Y2ggfCAzMiArKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hh
bmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGli
ZnRkaS8wMDAzLW1vdmUtZnJvbS1kaXN0dXRpbHMtdG8tc3lzY29uZmlnLnBhdGNoCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliZnRkaS8wMDAzLW1vdmUtZnJvbS1kaXN0dXRpbHMtdG8tc3lz
Y29uZmlnLnBhdGNoIGIvcGFja2FnZS9saWJmdGRpLzAwMDMtbW92ZS1mcm9tLWRpc3R1dGlscy10
by1zeXNjb25maWcucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmNiMTc5YzdjZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJmdGRpLzAw
MDMtbW92ZS1mcm9tLWRpc3R1dGlscy10by1zeXNjb25maWcucGF0Y2gKPiBAQCAtMCwwICsxLDMy
IEBACj4gK0Zyb20gODcyY2Q0ODA5OTBlNjUzNmQyY2Y0ODU2ODYyNzkwM2ViZjVhY2JlYiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRGFuIEhvciA8ZGFuQGRhbm55LmN6PgoKICBU
aGUgZ3V5IGlzIGNhbGxlZCBEYW4gSG9yw6FrLiBJIGRvbid0IGtub3cgaG93IHlvdSBtYW5hZ2Vk
IHRvIGdldCB0aGlzIHdyb25nIC0gCnN1cHBvc2VkbHkgeW91IHRvb2sgdGhlIHBhdGNoIGZyb20g
RmVkb3JlLCBidXQgdGhlcmUgaXQncyByZWNvcmRlZCBwcm9wZXJseSB3aXRoIAo9P1VURi04PyBz
dHVmZi4KCj4gK0RhdGU6IFR1ZSwgMjQgT2N0IDIwMjMgMTA6MzY6MDkgKzAyMDAKCiAgVGhpcyBp
cyByZWFsbHkgd2VpcmQuLi4gVGhlIHBhdGNoIGlzIGFjdHVhbGx5IGRhdGVkIERlY2VtYmVyIDE5
LCAyMDIyLiBJdCBnb3QgCmNvbW1pdHRlZCB0byBsaWJmdGRpMSBvbiBPY3RvYmVyIDI0LCBidXQg
YXQgMTc6MzMgKzAyMDAuCgo+ICtTdWJqZWN0OiBbUEFUQ0hdIG1vdmUgZnJvbSBkaXN0dXRpbHMg
dG8gc3lzY29uZmlnCj4gKwo+ICtUaGUgZGlzdHV0aWxzIG1vZHVsZSB3YXMgZGVwcmVjYXRlZCBp
biBQeXRob24gMy4xMCwgdGh1cyBzd2l0Y2ggdG8gdGhlCj4gK3N5c2NvbmZpZyBtb2R1bGUgaW5z
dGVhZC4KCiAgVGhlIGNvbW1pdCBtZXNzYWdlIHdhcyBjaGFuZ2VkIHNsaWdodGx5IHdoZW4gaXQg
d2FzIHNlbnQgdXBzdHJlYW0uCgo+ICsKPiArVXBzdHJlYW06IGNvbW1pdHRlZCBhYmQxOWI3MjFm
N2U5YjRkNTE0ZWQzMTllY2UxNzNlYmM3YjFlYTcyCgogIEl0J3MgZWFzaWVyIGZvciBwZW9wbGUg
aWYgeW91IHB1dCBhIFVSTC4KCiAgQWxzbywgSSB0aGluayB0aGlzIHNob3VsZCBiZSBwdXQgYWZ0
ZXIgdGhlIGF1dGhvciBzaWdub2ZmLiBIb3dldmVyLi4uCgo+ICsKPiArU2lnbmVkLW9mZi1ieTog
RGFuIEhvciA8ZGFuQGRhbm55LmN6PgoKICBUaGUgYXV0aG9yIGRpZG4ndCBhY3R1YWxseSBhZGQg
YSBzaWdub2ZmISBQbGVhc2UgZG9uJ3QgYWRkIG9uZSBpZiBpdCBkb2Vzbid0IApleGlzdC4KCgog
IEFueXdheSwgSSBmaXhlZCBhbGwgb2YgdGhhdCB1cCBhbmQgYXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gK1NpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0
dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICstLS0KPiArIHB5dGhvbi9D
TWFrZUxpc3RzLnR4dCB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3B5dGhvbi9DTWFrZUxpc3RzLnR4dCBi
L3B5dGhvbi9DTWFrZUxpc3RzLnR4dAo+ICtpbmRleCA1YjZmNDIwLi4xOWNlNTAwIDEwMDY0NAo+
ICstLS0gYS9weXRob24vQ01ha2VMaXN0cy50eHQKPiArKysrIGIvcHl0aG9uL0NNYWtlTGlzdHMu
dHh0Cj4gK0BAIC00Miw3ICs0Miw3IEBAIGVuZGlmICgpCj4gKwo+ICsgc2V0X3RhcmdldF9wcm9w
ZXJ0aWVzICggJHtTV0lHX01PRFVMRV9mdGRpMV9SRUFMX05BTUV9IFBST1BFUlRJRVMgTk9fU09O
QU1FIE9OICkKPiArCj4gKy1leGVjdXRlX3Byb2Nlc3MgKCBDT01NQU5EICR7UFlUSE9OX0VYRUNV
VEFCTEV9IC1jICJmcm9tIGRpc3R1dGlscyBpbXBvcnQgc3lzY29uZmlnOyBwcmludCggc3lzY29u
ZmlnLmdldF9weXRob25fbGliKCBwbGF0X3NwZWNpZmljPVRydWUsIHByZWZpeD0nJHtDTUFLRV9J
TlNUQUxMX1BSRUZJWH0nICkgKSIKPiArK2V4ZWN1dGVfcHJvY2VzcyAoIENPTU1BTkQgJHtQWVRI
T05fRVhFQ1VUQUJMRX0gLWMgImltcG9ydCBzeXNjb25maWc7IHByaW50KCBzeXNjb25maWcuZ2V0
X3BhdGgoICdwbGF0bGliJywgdmFycz17J3BsYXRiYXNlJzogJyR7Q01BS0VfSU5TVEFMTF9QUkVG
SVh9J30gKSApIgo+ICsgICAgICAgICAgICAgICAgICAgT1VUUFVUX1ZBUklBQkxFIF9BQlNfUFlU
SE9OX01PRFVMRV9QQVRICj4gKyAgICAgICAgICAgICAgICAgICBPVVRQVVRfU1RSSVBfVFJBSUxJ
TkdfV0hJVEVTUEFDRSApCj4gKwo+ICstLQo+ICsyLjQxLjAKPiArCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
