Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72231C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 23:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDDFF81445;
	Sun, 21 Apr 2024 23:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fuh1mYpxIuL4; Sun, 21 Apr 2024 23:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E90B81446
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E90B81446;
	Sun, 21 Apr 2024 23:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6761BF35E
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 23:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E87A405B7
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 23:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KKbi4JFtaiY for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 23:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=wilfred.opensource@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 981634051B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 981634051B
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 981634051B
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 23:07:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c730f599abso2287030b6e.0
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 16:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713740824; x=1714345624;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/pf4VqeOuj9bkBRNrmmrf2ZbXiSc3mcjaJ15KqF7l2o=;
 b=kqX+yb1mXonidNksrVX4cAoa+i8MI3QujjGITPWI5CwHeyxGlkpZZa0kr7oLis8aED
 w+p2jbKI8Aii4ouJAfxcZm5djNd/Cy7IdO4SBgQLvDOqC9xUvY7DoyInj75CEMQz88EC
 uMVCyWmC3vuufIrK/ZSVufFJEQGAy8fAH567+bJoF5AYCi0DjNd+G7QqWzc+IEyOPhqy
 6mlpLrWLUOV35bqFrO98xry17HeJB3+M7RI7txPLrK+LmjgP1pwVGgL/8+lIjYIGESsS
 XihyPstnC5drvPEc7cbTqy0qzvh2FOSDd1mxNiigMvwxKCbu65L9AgYRuc59Sx5/z0dI
 79Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyjFahrid2oqxHPD2iR1hlfnbWAzlmliojL5G537lonpGWVl499G8jEQEaFeKwbEUFfACn+04XLzQJjJr6xaDgncWaePYlqA==
X-Gm-Message-State: AOJu0Yym8rPeEoJoA+2Wz7+NwSz2mhr+3odRar0+jtQaPwKM89dvq5JJ
 9TLB038uyz9QM0/cR4OqtZJuies3CA5UgBX7wD/QIxyjR4tUy/a+BZ+xZw==
X-Google-Smtp-Source: AGHT+IEBQ7gwTjwjz91pX6Dum/oW4f9V0q2PktxwIRp8cKSTZ2kIM7oi3+CmZXoTnhi0OJmx8p0C4w==
X-Received: by 2002:a05:6830:6f07:b0:6ec:f918:b149 with SMTP id
 ee7-20020a0568306f0700b006ecf918b149mr8273566otb.26.1713740824033; 
 Sun, 21 Apr 2024 16:07:04 -0700 (PDT)
Received: from [192.168.0.20] ([159.196.15.10])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a635a08000000b005f3d2592b5csm6433536pgb.47.2024.04.21.16.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 16:07:03 -0700 (PDT)
Message-ID: <59cce46fd3cb39a32df308475244f3cb57c0fc72.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>, buildroot@buildroot.org
Date: Mon, 22 Apr 2024 09:06:58 +1000
In-Reply-To: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713740824; x=1714345624; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/pf4VqeOuj9bkBRNrmmrf2ZbXiSc3mcjaJ15KqF7l2o=;
 b=NFXzBBIBAZRS76ij+SMepJ9tovRl95nIhmZRqm05gYJ7UeXn2FRpfE0fIQNMDOUyKr
 iL65MOy9lSGFr61G57qHubAyghIP2XJOPwv3l8TZXNs/cPjQP49yo0UiZO4Gt+rmWKOE
 23rsbUvIFeG57/VstF7xbyHsD4he6Rk03FjaNU4ZozVLfM5sme7w10+6nIDYikF5sWeJ
 JoRWmx7ZE5CbGYa5Ecz+wQApwbUCJclo7y0Wt2PQ95lUrQRw29M0nnJ1p8PPtLTBGfSr
 mjFNKq7Z0cdA7DPiOPkHiVU8yYWrvc4iVZIOD2etmXmHHbzkMYr9EUV+T3dR0G+MSN87
 yaZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NFXzBBIB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
Cc: alistair.francis@wdc.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGluZyA6KQoKT24gVHVlLCAyMDI0LTA0LTAyIGF0IDEzOjUxICsxMDAwLCBXaWxmcmVkIE1hbGxh
d2EgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lz
IDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogV2lsZnJlZCBNYWxs
YXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIFYyOsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gwqDCoMKgwqDCoMKgwqAg
LSBBZGRlZCByZXF1aXJlZCBweXRob24zIGRlcGVuZGVuY2llcwo+IMKgwqDCoMKgwqDCoMKgIC0g
Tm93IGRlcGVuZHMgb24gYHVkZXZgIGluc3RlYWQgb2Ygc2VsZWN0aW5nIGBldWRldmAKPiDCoMKg
wqDCoMKgwqDCoCAtIE5vdyBkZXBlbmRzIG9uIGBsaWJzcGRtYAo+IMKgwqDCoMKgwqDCoMKgIC0g
SG9vayBkZWZpbmUgbW92ZWQgYmVsb3cgdGhlIGhvb2ssIHN0eWxpc3RpY2FsbHkgc2ltaWxhciB0
bwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3RoZXIgcGFja2FnZXMKPiDCoMKgwqDCoMKgwqDC
oCAtIFJlbW92ZWQgY2FyZ28gcGFja2FnZSByZS12ZW5kb3JpbmcgYXMgd2UgYXJlbid0IHBhdGNo
aW5nCj4gwqDCoMKgwqDCoMKgwqAgLSBDaGFuZ2VkIGNlcnRpZmljYXRlL21hbmlmZXN0IGluc3Rh
bGxhdGlvbiBwYXRoIHRvIGJlIHN5c3RlbQo+IHdpZGUuCj4gCj4gwqBwYWNrYWdlL0NvbmZpZy5p
bsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKgcGFja2FnZS9z
cGRtLXV0aWxzL0NvbmZpZy5pbsKgwqDCoMKgwqDCoCB8IDI0ICsrKysrKysrKysrKysrKysrKysr
Cj4gwqBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5oYXNoIHzCoCAyICsrCj4gwqBwYWNr
YWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5ta8KgwqAgfCAzNgo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zcGRtLXV0aWxzL0NvbmZpZy5pbgo+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLmhhc2gKPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5tawo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggNDEw
ZmUwZjQ5My4uOTU3MmE4ODRlNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsr
KyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTI2OTgsNiArMjY5OCw3IEBAIGNvbW1lbnQgIlV0
aWxpdGllcyIKPiDCoAlzb3VyY2UgInBhY2thZ2Uvc2NyZWVuL0NvbmZpZy5pbiIKPiDCoAlzb3Vy
Y2UgInBhY2thZ2Uvc2NyZWVuZmV0Y2gvQ29uZmlnLmluIgo+IMKgCXNvdXJjZSAicGFja2FnZS9z
ZXhwZWN0L0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9zcGRtLXV0aWxzL0NvbmZpZy5p
biIKPiDCoAlzb3VyY2UgInBhY2thZ2Uvc3Vkby9Db25maWcuaW4iCj4gwqAJc291cmNlICJwYWNr
YWdlL3Rlcm1pbm9sb2d5L0NvbmZpZy5pbiIKPiDCoAlzb3VyY2UgInBhY2thZ2UvdGltZS9Db25m
aWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW4gYi9wYWNr
YWdlL3NwZG0tCj4gdXRpbHMvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi5iOTYzNjU0NTFmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uv
c3BkbS11dGlscy9Db25maWcuaW4KPiBAQCAtMCwwICsxLDI0IEBACj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9TUERNX1VUSUxTCj4gKwlib29sICJzcGRtLXV0aWxzIgo+ICsJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gKwlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBweXRob24zCj4gKwlkZXBlbmRzIG9uIEJSMl9VU0Vf
V0NIQVIgIyBldWRldgo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gKwlkZXBlbmRz
IG9uIEJSMl9VU0VfTU1VICMgZXVkZXYKPiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCU8Kg
ICMgcHl0aG9uMwo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVcKgICMgZXVkZXYsIHB5dGhvbjMK
PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX1VERVYKPiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfTElCU1BETQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9PUEVOU1NMCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUENJVVRJTFMKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9FVURFVgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTjMK
PiArCWhlbHAKPiArCcKgIFNQRE0tVXRpbHMgaXMgYSBMaW51eCBhcHBsaWNhdGlvbiBkZXNpZ25l
ZCB0byBzdXBwb3J0LAo+ICsJwqAgdGVzdCBhbmQgZGV2ZWxvcCBTUERNIHJlcXVlc3RlcnMgYW5k
IHJlc3BvbmRlcnMuCj4gKwnCoCBTUERNLVV0aWxzIHVzZXMgbGlic3BkbSBhcyB0aGUgYmFja2Vu
ZCB0byBwZXJmb3JtIFNQRE0KPiArCcKgIGNvbW11bmljYXRpb24uIFNQRE0tVXRpbHMgY3VycmVu
dGx5IHN1cHBvcnRzIHRoZQo+ICsJwqAgUENJZSBEYXRhIE9iamVjdCBFeGNoYW5nZSAoRE9FKSBD
YXBhYmlsaXR5Lgo+ICsKPiArCcKgIGh0dHBzOi8vZ2l0aHViLmNvbS93ZXN0ZXJuZGlnaXRhbGNv
cnBvcmF0aW9uL3NwZG0tdXRpbHMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcGRtLXV0aWxzL3Nw
ZG0tdXRpbHMuaGFzaCBiL3BhY2thZ2Uvc3BkbS0KPiB1dGlscy9zcGRtLXV0aWxzLmhhc2gKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmFhYTI0MzMxNWUKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMuaGFzaAo+IEBA
IC0wLDAgKzEsMiBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTbCoAo+IDNmMDZm
MDg3MjIwYjEyNjI2MmEyYmVjZjY4YzllMDZhNTlkOGQ2MTM4MTZmODJhMTY4YzgxMDkzZGUwODdk
MWHCoAo+IHNwZG0tdXRpbHMtMC4zLjAudGFyLmd6Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3Bk
bS11dGlscy9zcGRtLXV0aWxzLm1rIGIvcGFja2FnZS9zcGRtLQo+IHV0aWxzL3NwZG0tdXRpbHMu
bWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQxNzZmNjE4NzEK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWsK
PiBAQCAtMCwwICsxLDM2IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIyMjIyMjIyMjIyMjCj4gKyMKPiAr
IyBzcGRtLXV0aWxzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAjIyMjIyMjIyMjIyMKPiArCj4gK1NQ
RE1fVVRJTFNfVkVSU0lPTiA9IDAuMy4wCj4gK1NQRE1fVVRJTFNfU0lURSA9ICQoY2FsbCBnaXRo
dWIsd2VzdGVybmRpZ2l0YWxjb3Jwb3JhdGlvbixzcGRtLQo+IHV0aWxzLHYkKFNQRE1fVVRJTFNf
VkVSU0lPTikpCj4gK1NQRE1fVVRJTFNfTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlUCj4gK1NQ
RE1fVVRJTFNfREVQRU5ERU5DSUVTICs9IHBjaXV0aWxzIGxpYnNwZG0gb3BlbnNzbCB1ZGV2Cj4g
Kwo+ICsjIE5vdGUgdGhhdCB3ZSBhbHNvIGNvcHkgYHNldHVwX2NlcnRzLnNoYCBhbmQgYGdlbmVy
YXRlX2NlcnRzLnNoYC4KPiArIyBgc2V0dXBfY2VydHMuc2hgIHNoYWxsIGJlIHVzZWQgYnkgYSBy
ZXNwb25kZXIgdG8gcmVnZW5lcmF0ZSBpdCdzCj4gbXV0YWJsZQo+ICsjIGNlcnRpZmljYXRlIGNo
YWluLiBgZ2VuZXJhdGVfY2VydHMuc2hgIGNhbiBiZSB1c2VkIHRvIGdlbmVyYXRlIGEKPiBuZXcK
PiArIyBjZXJ0aWZpY2F0ZSBjaGFpbiwgd2hpY2ggbWF5YmUgdXNlZnVsIGluIHRlc3RpbmcgYW5k
IGRldmVsb3BtZW50Lgo+ICtkZWZpbmUgU1BETV9VVElMU19JTlNUQUxMX0NFUlRTCj4gKwkkKElO
U1RBTEwpIC1kIC1tIDA3NTUgJChUQVJHRVRfRElSKS91c3IvbG9jYWwvc3BkbV9jZXJ0cwo+ICsJ
Y3AgLXIgJChARCkvY2VydHMvZ2VuZXJhdGVfY2VydHMuc2gKPiAkKFRBUkdFVF9ESVIpL3Vzci9s
b2NhbC9zcGRtX2NlcnRzCj4gKwljcCAtciAkKEBEKS9jZXJ0cy9vcGVuc3NsLmNuZgo+ICQoVEFS
R0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMKPiArCWNwIC1yICQoQEQpL2NlcnRzL3NldHVw
X2NlcnRzLnNoCj4gJChUQVJHRVRfRElSKS91c3IvbG9jYWwvc3BkbV9jZXJ0cwo+ICsKPiArCSQo
SU5TVEFMTCkgLWQgLW0gMDc1NQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMv
c2xvdDAKPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2ltbXV0YWJsZS5kZXIKPiAkKFRBUkdFVF9E
SVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Nsb3QwCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9k
ZXZpY2UuY2VydC5kZXIKPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Nsb3Qw
Cj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9kZXZpY2UuZGVyCj4gJChUQVJHRVRfRElSKS91c3Iv
bG9jYWwvc3BkbV9jZXJ0cy9zbG90MAo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2aWNlLmtl
eQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMvc2xvdDAKPiArCWNwICQoQEQp
L2NlcnRzL3Nsb3QwL3BhcmFtLnBlbQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2Vy
dHMvc2xvdDAKPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2J1bmRsZV9yZXNwb25kZXIuY2VydGNo
YWluLmRlcgo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMvc2xvdDAKPiArCj4g
KwkkKElOU1RBTEwpIC1kIC1tIDA3NTUgJChUQVJHRVRfRElSKS91c3IvbG9jYWwvc3BkbV9tYW5p
ZmVzdC8KPiArCWNwICQoQEQpL21hbmlmZXN0L21hbmlmZXN0Lm91dC5jYm9yCj4gJChUQVJHRVRf
RElSKS91c3IvbG9jYWwvc3BkbV9tYW5pZmVzdC8KPiArZW5kZWYKPiArCj4gK1NQRE1fVVRJTFNf
UE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBTUERNX1VUSUxTX0lOU1RBTExfQ0VSVFMKPiAr
Cj4gKyQoZXZhbCAkKGNhcmdvLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
