Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51432C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE5040B17;
	Fri, 18 Sep 2026 07:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37soGuiQcVHV; Fri, 18 Sep 2026 07:58:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8483640B0D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789718336;
	b=f62F8HnIGDHV2nn+viodCeoJPbRo3FjkQvjRC1bZdxz278LpduOynebOCqhhBLaw4Gue
	 QYFpUcaeEqkJiyvKx2bqDGDMhf5MkaD8+x4u7ghsDwJ71/MT2f5edodyniwlKbkhhkxOj
	 DntfrE98rIfN1hRAW064r4P6MHCAHbxbTkHQDyvmJqXThUrrWPC3ScG6xW75zABxAwjKn
	 KU7O1axAuQd4yEDh4JGTIu5FlgKx8GzAawuFons4Bz2eet+WqYZ0WwcjThJg5kakAB5+T
	 JrZXiw4w0FTFvBEmZVFEOwqNUOhSnkYDF+ruh0fYRWEMsiHN5nQ+7c6jdu0uHUiXRBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789718336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:Message-ID:Date:
	 MIME-Version:User-Agent:To:References:Content-Language:From:
	 In-Reply-To:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=dmv3OEhM2hlJFMO+QGa3WDIrbZDaazlGPWJkC4Wz6j0=;
	b=MjzKU01GlebfWcUbjm7t97nO3qvdI1wEXCbC/6jkcPUv5q89qdlO7P/krJlPiXAdPzQ9
	 RjZfmO4T2nrgOaxSh97RrPbH7ExUyt2w062Dk0dF7Kvt1f14CpgkK9DzovCQptQqdgpeX
	 EOEO9Kap9Ekw3LUW3Gg3Ji1HdAugwC1Rap9v1Ff7wMtdaF1B0Dstm4xKhyMEdbBRi2J4J
	 EPnF+gdUbT1SA7y0t/QxA69FSfdqOgHOLJSKJHHsyF5xu6Uz7sEqW1JkWICtT63Pc9Z+e
	 Fiiem0pXjdRvqeJEscDoULcmMol6FIueXK6x4fIztW5S4X3n78DmfYf62Izv0cGPSHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789718336;
	bh=dmv3OEhM2hlJFMO+QGa3WDIrbZDaazlGPWJkC4Wz6j0=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LK7jEuOHrySDrQOwSmT2jtVfLwzbivYmBzxmT9AUyuT8LysGU6ehsxaJGaOESu5RZ
	 rA9cXVFLMaGgrDD9Gw4LVYzjUnPvbdW5PV8ClbYQsdfUIut5OpdtUFvzCs8U8DXOV0
	 5Qk4FEClcnI5I9AMln9zfVQC0xljowjNPPX0i68iuuJ8850kiS5a1hoUw7EjjJ6+uH
	 s7biQ/vDB7GtQALz8YMYdZLGwkHphwnpdFPR1tAR+DAzv/vLuFnu7pTVv3i63u35yo
	 HFfaL0wG6iUG5+Kdn+zgt+0xTRj5FCUPFbt9I7ocO2ZhZOfocVcH5zZsePdQr8MmBs
	 Kxp+kE7nfAF8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8483640B0D;
	Fri, 18 Sep 2026 07:58:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D39B737A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA3F34044A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5He2nnGur4kf for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:58:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9A6D4400CB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=188.165.43.98
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789718333;
 b=bzz01dfAFjK0ZFIfCyU/deI/rGX13f/JcJFBLE4X0hWmGhIjvJTim7H1GswP/X6iHhto
 GLoEse6jwaHhwsAZCTbSIxLbW7TIUj6uDDWApgO98ORmNv+p9yaj0h4WCIkNPIdMBsdoK
 YEVB+TivsY8isVSUzTIv9ae7FdelMW1KvID+lzb8PkTbo0uxiRfKlD173u/8ahrJblbfc
 5qNdoLmU0GykitD1On8nXBqa7QH2GJsVBNHU277QeYk9k2rLs4DZRSLCTpTpsx2CtnhNR
 XuhvXuwUCk26pm2ALUGQ0A+gpXjL7n+3XbfGsN5R+0++mB6tgiv3xf3/15ADqHkGn2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789718333;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=PKG9kk9p0t8DzcnxWut49rACVxcGW6DCUzGU7lt/m4g=;
 b=AaaLW0nhwDtf1bxtqKmL+hSUBKUwXlNZ01Z//WnesUEIJrfGO5ZPmfcqsblkq3JgyqZX
 i5KPjhdb/KAk5DKHoYXQbyUWGkCnqPkk0uDtqAgTr0XmV5JvGkGvxX7PeIwvKDrmpCZQa
 44eQ2RzEZj4A+awcI7aiRRbET3xHXLmZTXs+etVw5g0W6Qvu9WBi3etvhBkLb8v2OU8y8
 /VE2YbOgWsAtZzHF0PXxAyYvHXnaU+JC/eVz01R3/DxDNHpVporKV/sugFZnb2Zw3p/5R
 IDB0Hwg5liQBpSToH3ewkuVHJNLiJ3VdZ0DR33hHhovjHAhMJrmHnK9d2ge1U6lpxsw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=HLiGuhOY; 
 arc=none smtp.remote-ip=188.165.43.98
X-Greylist: delayed 1473 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Sep 2026 07:58:50 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=HLiGuhOY
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.43.98;
 helo=14.mo561.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 14.mo561.mail-out.ovh.net (14.mo561.mail-out.ovh.net
 [188.165.43.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A6D4400CB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:58:49 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.110.0.199])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hmPWM2c0sz5vrl
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:51 +0000 (UTC)
Received: from ghost-submission-c7b579475-xr99f (unknown [10.111.182.20])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 14EDAC0162
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:48 +0000 (UTC)
Received: from quimesis.be ([37.59.142.100])
 by ghost-submission-c7b579475-xr99f with ESMTPSA
 id jGExMVvprGoVNTwAGrrHLQ
 (envelope-from <antoine.gennart@quimesis.be>)
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:48 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fb2eb1da-aec6-4ebb-a195-78c823fde6c3,
 9C804762B7D73FC9CA4321DB5B224E2E243E2A45)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 77.72.238.202
Message-ID: <4be576ca-9d7b-4a07-8baa-2cd353b77088@quimesis.be>
Date: Fri, 18 Sep 2026 09:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
 <20260916130840.881186-2-antoine.gennart@quimesis.be>
 <aqsIPwc1ZeVxBlb4@windsurf>
 <9f159817-dd6b-4f3c-bf08-8ebc357b9697@quimesis.be>
 <aqujyonE74-hwxq8@windsurf>
Content-Language: en-US
From: Antoine Gennart <antoine.gennart@quimesis.be>
In-Reply-To: <aqujyonE74-hwxq8@windsurf>
x-ovh-tracer-id: 16815315109703585741
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTElO12AirLECZNo/l9nC5v7Wnu+iXl22nQnUleMBV1FPg9UVy/pRHz03K+N+64ExcDI+jc9DrsfM3BRA+VOTDDxAwHZESo9ZoNEWwZc+Y3lCXLy7SoWK2dSspvdpTDCytbMN3jFHYCoQR+NhWYE+m5tTGJToN9QSlQ+j7UtBZKMrkNFssENek3mP/CtW0S1ta2tHRJLSz6Kdq/+FskMSv3nJ9/fcPDASTPa3CJnmUjuuHUl65hfLU4fTTNhAvCDISe8EYS87kTcR0gGEVUfTbC0dFLL/e4N+1bPcMoalsiovrrO0t1jyq2IAOwbCKK8gEEsmNzLoCTAWqn6Wao5BfoDYBNY8rnhZf1xXsqNZPzK+6Mb7+OkupZlifZbFKCU8tnvHyo/dl4Fvif75rygZNDzfQpn1MkUxQDBfbOLDLfbTnu/j28ydPN607Krhn7/E1AXhrlmdoxGjKUmy+U9/ul8Psov80Eeas/EOzNYoIUQveuSDee1Tmenr/pQtrrkYy6BvJbiMXyqZCE/RxA/IhX+Ui8NOoN70jwussaGftSKcAFiafDQuPMfRDH9r7qv3wM/B5FgM5IVFb43UaMzShhuOq8DcgZUoHbqwMTC4a24fdcgnBS+QVcUF05Wsvlc99O0hrfHXScXF1lhQXP/pRI7P9uIYbndnnMf6Y/B3RgW9g
DKIM-Signature: a=rsa-sha256; bh=PKG9kk9p0t8DzcnxWut49rACVxcGW6DCUzGU7lt/m4g=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789716831; v=1;
 b=HLiGuhOYumLAeyUvalxilwHwfF8/LxJehDCk6EV6BBF1EgSVh/a4OEmRSINr27bZv4lx0F/h
 f8jFgP0hApn7ghv0873QN+CTEEDpBx+C1Co0p1eDbNWcfk8G5cP6u4GYqSbg2tmctL+vl8wOLRJ
 oT39fDQWYSwOevHGIYkJeOy1Ao8iicSlPC8Wc/cUWyI1FkpmnBrk+5B9/EBqnDCvPvOGx59sdT0
 Mf0zo1MW2Yir6D6CH2yOow1nh7nKiWsmuNneUi7mQek41koRM+C01gALU0M/vUKqnFh27ynZLNu
 YbxpA9GtPsVGc5Rh/pdBCg4OusgtUYyqp+Oh7St6Q4d3A==
Subject: Re: [Buildroot] [PATCH 2/2] package/nxp-bt-wifi-firmware: add IW610
 USB support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDkvMTcvMjYgMTA6MjUsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBPbiBUaHUsIFNlcCAxNywgMjAyNiBhdCAxMDowMjoxMkFNICswMjAwLCBBbnRvaW5lIEdlbm5h
cnQgd3JvdGU6Cj4KPj4gSSBhZGRlZCB0aGUgU2lnbmVkLW9mZiBsaW5lIGNvcnJlY3RseSBhbmQg
cmVzZW50IHRoZSBwYXRjaC4gSXQgc2hvdWxkIGJlCj4+IGNvcnJlY3Qgbm93Lgo+IFRoYW5rcyEK
Pgo+PiBJIG11c3QgYWRtaXQgdGhhdCBJJ20gbm90IHN1cmUgd2h5IHRob3NlIGZpbGVzIGhhdmUg
YmVlbiByZW1vdmVkLiBUaGUgbWFpbgo+PiBjb25jZXJuIEkgaGFkIHdhcyB0byBzdXBwb3J0IHRo
ZSBVU0IgaG9zdCBpbnRlcmZhY2UgdGhhdCBJIG5lZWRlZC4gWW91IGFyZQo+PiByaWdodCB0aGF0
IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhbiBvcHRpb24gZm9yIHBlb3BsZSBzdGlsbCB1c2lu
ZyB0aGUgb2xkCj4+IE5YUCBmaXJtd2FyZS7CoCBEbyB5b3UgdGhpbmsgYWRkaW5nIGEgInZlcnNp
b24iIHBhcmFtZXRlciB0byBhbGxvdyB0bwo+PiBvdmVyd3JpdGUgdGhlIGRlZmF1bHQgdmVyc2lv
biB3b3VsZCBiZSB0aGUgY29ycmVjdCBhcHByb2FjaCA/Cj4gSSB3b3VsZCBwdXQgYSBmcmVlIGZv
cm0gdmVyc2lvbiBwYXJhbWV0ZXIsIGJ1dCBhIGNob2ljZS4uLmVuZGNob2ljZSBpbgo+IENvbmZp
Zy5pbiB0byBnaXZlIHRoZSBjaG9pY2UgYmV0d2VlbiBvbGQgdmVyc2lvbiBhbmQgbmV3IHZlcnNp
b24uCgpJIHN1cHBvc2UgeW91IG1lYW50ICJJIHdvdWxkbid0IHB1dCBhIGZyZWUgZm9ybSB2ZXJz
aW9uIHBhcmFtZXRlciIgPyAKRGVwZW5kaW5nIG9uIHRoZSByZXNwb25zZSBmcm9tIE5YUCBjb21t
dW5pdHksIEkgd2lsbCBkbyBpdC4KCj4+IEkgd2lsbCBhbHNvIGNoZWNrIGZvciB0aGUgcmVhc29u
IGZvciB3aGljaCB0aGV5IHJlbW92ZWQgc3VwcG9ydCBmb3IgdGhvc2UKPj4gZGV2aWNlcy4gSWYg
dGhleSB3ZXJlIG5ldmVyIHNvbGQsIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gdHJ5IHRvIGNv
bnRpbnVlCj4+IHN1cHBvcnQgZm9yIHRob3NlLgo+IEluZGVlZCEgRG8geW91IGhhdmUgYSByZWxl
dmFudCBjb250YWN0IGF0IE5YUCB0byBhc2sgdGhpcyAoZmFpcmx5Cj4gc3BlY2lmaWMpIHF1ZXN0
aW9uPwpJIGRvbid0IGhhdmUgYSBkaXJlY3QgY29udGFjdCB3aXRoIE5YUC4gSSBvcGVuZWQgYSB0
aWNrZXQgb24gdGhlaXIgCnBsYXRmb3JtIGFuZCBJIGFtIHdhaXRpbmcgZm9yIGEgcmVzcG9uc2U6
IApodHRwczovL2NvbW11bml0eS5ueHAuY29tL3Q1L1dpLUZpLUJsdWV0b290aC04MDItMTUtNC9R
dWVzdGlvbi1yZWdhcmRpbmctcmVtb3ZhbC1vZi1XODk5Ny1maXJtd2FyZS1mcm9tLWlteC1maXJt
d2FyZS9tLXAvMjQxNDIzNiNNNTAzNSAKCj4KPiBUaG9tYXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
