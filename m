Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA711CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 13:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 713B441436;
	Fri, 10 Oct 2025 13:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLA5atRSixVy; Fri, 10 Oct 2025 13:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C861B413F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C861B413F0;
	Fri, 10 Oct 2025 13:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 205B2226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05FA0844C4
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGhdh0sfP8fO for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 13:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F29FE844C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29FE844C3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F29FE844C3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:48:33 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 80D1A2C80CC2;
 Fri, 10 Oct 2025 15:48:31 +0200 (CEST)
Message-ID: <8c45b7ff-5056-498e-a3dd-839d9eb001d3@bubu1.eu>
Date: Fri, 10 Oct 2025 15:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
Content-Language: en-US
In-Reply-To: <20251009152813.1690704-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760104111; bh=6lE9MERO3MHVDOgtPOIWroKk4KTXFvPUqdcwzzVS3Jg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Y/YQCOJjGvQ7T+Ux0/+gj1c/GU1k9wF2v555s70PfgMVHHbBVderQReK9IT0EX2XS
 splYPlzN5H7AISCAHY0ZfL6MihigHwjsfXYjnqqJLXvpLuxiTUA/ZehnJ50lvnCkra
 UeLiP2gGmpaBjE2gqqG7kWp8svTJ6q4fscsN7K9/QL4fWd/PdukA3Tk2dbSvnvbTg0
 CvT2VNuiu8CUUbJwVLrgQUDcxGUNdRzzlfGhrTUMGwxKzBdgM4Ww5+j0XeaNxyMiyD
 dZlLNdsAZ3NGNUilKrHJWCBzdPd3TRHTZIGL6/eRAV48rqaYGk2EB6sUAsWGoYaBir
 t85DZUO/1rzPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Y/YQCOJj
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC85LzI1IDE3OjI4LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gV2hlbiBidWlsZGlu
ZyBpbiBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzCj4gKEJSMl9QRVJfUEFD
S0FHRV9ESVJFQ1RPUklFUz15KSwgYnJtYWtlIG91dHB1dCBpcyBvZnRlbiBnYXJibGVkOgo+IAo+
ICAgIDIwMjUtMTAtMDhUMTg6Mzk6MTAgPj4+IGhvc3QtZHRjIDEuNy4yIEJ1aWxkaW5nCj4gICAg
MjAyNS0xMC0wOFQxODozOToxMSBjaGVja2luZyBmb3Igc3RkaW50LmguLi4gPj4+IGhvc3QtZHRj
IDEuNy4yIEluc3RhbGxpbmcgdG8gaG9zdCBkaXJlY3RvcnkKPiAgICAyMDI1LTEwLTA4VDE4OjM5
OjEyIGNoZWNraW5nIGZvciBsaW1pdHMuaC4uLiA+Pj4gaG9zdC1nbXAgNi4zLjAgSW5zdGFsbGlu
ZyB0byBob3N0IGRpcmVjdG9yeQo+IAo+IFJlbW92ZSB0aGUgc3B1cmlvdXMgc3RyaW5nIGJldHdl
ZW4gdGhlIHRpbWVzdGFtcCBhbmQgdGhlICI+Pj4iIG1hcmtlciB0bwo+IGZpeCB0aGlzLgo+IFdl
IG5lZWQgc29tZSBleHRyYSBjYXJlIHRvIHByZXNlcnZlIHRoZSBwcmVjZWRpbmcgInRlcm0gYm9s
ZCIgc3BlY2lhbAo+IGNoYXJhY3RlcnMgc2VxdWVuY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KClJldmlld2VkLWJ5OiBNYXJjdXMgSG9mZm1hbm4g
PGJ1aWxkcm9vdEBidWJ1MS5ldT4KVGVzdGVkLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9v
dEBidWJ1MS5ldT4KCj4gLS0tCj4gICB1dGlscy9icm1ha2UgfCAzICsrLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS91
dGlscy9icm1ha2UgYi91dGlscy9icm1ha2UKPiBpbmRleCBhNGI5ZTdmYTcxLi4yYTc0ZDU4MTY3
IDEwMDc1NQo+IC0tLSBhL3V0aWxzL2JybWFrZQo+ICsrKyBiL3V0aWxzL2JybWFrZQo+IEBAIC0x
Miw3ICsxMiw4IEBAIG1haW4oKSB7Cj4gICAgICAgICAgICAgICAgcHJpbnRmICIlKCVZLSVtLSVk
VCVIOiVNOiVTKVQgJXNcbiIgLTEgIiR7bGluZX0iCj4gICAgICAgICAgICBkb25lIFwKPiAgICAg
ICAgICAgIHx0ZWUgLWEgYnIubG9nIFwKPiAtICAgICAgICAgfGdyZXAgLS1jb2xvdXI9bmV2ZXIg
LUUgJz4+PicKPiArICAgICAgICAgfGdyZXAgLS1saW5lLWJ1ZmZlcmVkIC0tY29sb3VyPW5ldmVy
IC1FICc+Pj4nIFwKPiArICAgICAgICAgfHNlZCAtRSAncy9eKFswLTlUOi1dezE5fSkgW1s6cHJp
bnQ6XV0qKC4qPj4+ICkvXDEgXDIvJwo+ICAgICAgICAgICkKPiAgICAgICByZXQ9JHs/fQo+ICAg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
