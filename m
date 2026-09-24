Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F55C98317
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 11:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6627740DC2;
	Thu, 24 Sep 2026 11:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf5tbXi7rPoR; Thu, 24 Sep 2026 11:21:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 56B8940AEF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790248919;
	b=j0UrzRkL1W86sCM5Mn8VtbswJ38AMQS9qsxolKSO8f18WxSFwQxu5e6m0qvcXrvECgZp
	 +vTxZ+RKKMWII8SduGBQYfepl9kAr/stokWq0Bg1rnc1PqMbtr63paosNSFSgdH4wIXPZ
	 yZ2Tr+uAgaG89G/jHs7GvBcFlo9PC3xUxRPVn1m8Tr+P7WxPaamY96DB8bwS3xtNrW7rN
	 aVJHQYipFTa9lVAC1ud9mJWYEMRH9bDEUW7yZgt2F9vr6d/YmvBMGJGCyrQo1cLXOMbml
	 llU3NKTGAmxpVOutKDnynWVi0pVelajFUNS89fjvtd+ea5sKbg/S7eT8EdLRAMn02QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790248919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-OVh-ClientIp:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:
	 DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=BL7mYFkcQnjyvXiL3k9oUfgxU+mq6WBpPIMpkam9t50=;
	b=P8/ktHy7DjYa6k/s3Qt8uDJM/p95h1c7OCn8qM/cJGcBqv7ZS4FyOUghyNqIeTcgApvf
	 vGB5vfMLmdkwfj02blrkacrKi+mTmW+i9EJ0c4bl+PA23mzpFNPvSeXzW5no9FnOy9eoc
	 dspMxdbRecN/8LxBBS749nbGVPtP6DtBE+kKKZQ4+pha+d+vWJQi3h/cQ7rkgvI/vc7Cn
	 Ou5sq3fWVhcLd+Q+tXqZ58O/hPZ9eCUtzLWH39ZuCiBmR09n6qmMdgGuxP0eJKRffcptR
	 hLZGogLQLl/Swm0Cn0ljQVV3mcjr7ib+8d1EWxCeQ9f2koV68+1Rg0/5bvzRiN1745g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790248919;
	bh=BL7mYFkcQnjyvXiL3k9oUfgxU+mq6WBpPIMpkam9t50=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5mRg+MlaG4/bTzZfEZurvXKvgOJTWCzQRAIDtDk2EKoqtwlZTtLdfZlH90h4jmwp
	 jaqCuqFrZGMkhR4m7tW7cEoUCn+t/30v0plHLZBTbv65wInOFB+Hal/F3jd8qJUCI6
	 nsbKEpUVFU35LPArGkKrgIf/Bp6Cy2o7sIrzQ5EIP+f0BMpWyY/WqsaQ+1EsnfwhWO
	 gJIyUL6BrZrbRIIgyEnOtfYYE4TGNZm3Qf9kGk78eZ+SzsfvjVixqJfdTABwGxWD+N
	 n5sqONFD6dVB0yuTtJMSfJmlCSFS6qGo4NoF0bnqDQqVz/+FHXSSdFr1J6CJXOj017
	 aKcTplfAo7ygA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B8940AEF;
	Thu, 24 Sep 2026 11:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4AE392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 11:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD1434041B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 11:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cF3b9KSYiBkT for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 11:21:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BF6E540390
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=46.105.40.29
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790248916;
 b=kn2lAUUPupz/+obG3cJ9HtKe3EFzziN8TqwzjaCmlZRym9t30QB44mYjtigLkDxvQcGq
 fzV4nmPygpXo8lqZdLunrR14DHCu3rcOK/mCTkY52r1q+WQC7tey9xFFr4t4iTMpSTORm
 H38EkE7NZP7/gwqnz4eJGW1NOY+qf36tagMEYgFyCCm+iJdQMxx3lBYV4XqQfREohQNKg
 VgWSRNiZai7pRh72p4VdIIypFHXwo+m7MGU1A35B3QNF2rDJn9l65Kh/1GfLQLdDGGA2N
 5rj4yzBSYZG9975ZGXxSPqupSn5MJRIqHvN+ENYnxA2iRvRxlETpEeGTj/hOF/KV8Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790248916;
 h=Received-SPF:Received:Received:Received:X-OVh-ClientIp:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=6bHiwfZrvPfBafDNEtQdJLKWRvEzoysXWWuh52vDoXs=;
 b=Jboicu6FLYYehYUpSyQdoEfPq1Jx+YiIVAvzlfzRMUxhpQUOiJtZmMMcBJCCLOklaiN7
 b3oq0gX115xN5qADP/qmLYqEtc5t1/eTF6l9Gy8di6blX2+Z5GxXX9eKVkc1dnxmlba45
 BxG9l5WVxxTCx5BwwmX09Zi2W9NEv6lr6tg8nrvS0VuJ9nhe2wLjRZhuG+mgW+tSDZ4i/
 62vC6a4l8U6847RPBUtVZ0xGzmsoFqqugNLCW9zAqwVlL8XjIgzcTTJklpPVKuMB/UKy1
 1SY+SOFRlpJ5CRKiaMHq5R0H6t0NLvi2wSGo0txfcv66cJY3HHlzuxty7bWyQOALW1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=PeFWQ9J1; 
 arc=none smtp.remote-ip=46.105.40.29
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.29;
 helo=14.mo584.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=PeFWQ9J1
Received: from 14.mo584.mail-out.ovh.net (14.mo584.mail-out.ovh.net
 [46.105.40.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF6E540390
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 11:21:53 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.249.107])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4hrBHg0DXYz8Thk
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 11:21:51 +0000 (UTC)
Received: from ghost-submission-c7b579475-66w5s (unknown [10.108.54.121])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D32F2C1471;
 Thu, 24 Sep 2026 11:21:50 +0000 (UTC)
Received: from quimesis.be ([37.59.142.113])
 by ghost-submission-c7b579475-66w5s with ESMTPSA
 id JEFJJs4HtWrkFwkA1RU0ew
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 24 Sep 2026 11:21:50 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-113S0071e3d857c-68de-4a24-b771-38e60c5450dd,
 FA8029E7E9D240A2AEDD3F7834B89D1FA17FBBE2)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 77.72.238.202
Message-ID: <7548e43b-a1d3-4d14-ae8b-483e971bd26d@quimesis.be>
Date: Thu, 24 Sep 2026 13:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
 <20260916130840.881186-2-antoine.gennart@quimesis.be>
 <aqsIPwc1ZeVxBlb4@windsurf>
 <9f159817-dd6b-4f3c-bf08-8ebc357b9697@quimesis.be>
 <aqujyonE74-hwxq8@windsurf>
Content-Language: en-US
From: Antoine Gennart <antoine.gennart@quimesis.be>
In-Reply-To: <aqujyonE74-hwxq8@windsurf>
x-ovh-tracer-id: 562668482046136269
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE06ZIKbcxiaj+jV/s1zyaL+oe813UnQDGtQRv8POS+yN1n+3kFdZcQFARd7WVt1Q0jho0nmvcGK/yQc3ihARBQyLUOBJdfpjjzcLWUqKXopt4gtM3kny88YL+et7ophg4gpOd5fk9pNou2hhAAz2pzvFemXLiaA9Hf7LakJjALHX3jHqgmOTa5C5IcE3B+u6eJNQnFJ9M/5dCf+wWafg5V47OwVFXLwXZy7nBs3TghJ/jjRGc13uEQGK9vxMO9vSBXlsYbYVUuQ5ODYwIrEPXv8hyWyDmymeKF2NaLhiQ0I8lnKyzz2GSoJZtt0cDvBRWDfOz4dXf43tNCevSlxkSMSeox9sSUPuBmILW8GeEv4U+iwzWwkTj5njUp9HxyOhIq5FRpzv5kcVdkYKO+W5GXoRJQwSbqsUTNPwSc/JXC/JLp/uphDWoPdtfT1wtRiqPo5/LEn1ccEymG3Wg93NHzqOkBkylKuyvwUDSQdr2fv4G5ZDSkejEBlQR4LsHI42WiKKYUhKjOMw3U1xevf1Svj+kOeZTH8GQGloxMu6rjjvmyvDaqVT27yUTxMUbFy9TQ0/0rRmg/BLyz7vuximA+h7eQMxqD3+17xWbt2P2PMjM8Jyu9QWcJu/5itpRQeWHeitr5w4dpvP2OMe2Am1ECDrYV61BF4X5ukVOFWwbmPw
DKIM-Signature: a=rsa-sha256; bh=6bHiwfZrvPfBafDNEtQdJLKWRvEzoysXWWuh52vDoXs=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1790248911; v=1;
 b=PeFWQ9J1CXdEdfwW3RgZeOFIP1O4Y80MntQH5x44LmmG4zflBeoIFlngPSW2Y9k3Nnlz07Ov
 7pQVFHrlPUq1kEhCkCOXdQqUI45F0p7cjraq7yp+Y3RuIDSlQlGj+uUIFenJ/fqZUAs2i9t31qC
 iCXnd1Sk9YQIG8ku3WhfK5c/zWtGdWApA7xS7tnTaxKA6qqrT3Fk0TAAGC2I9CfkqpbtxF/3zB7
 b8z/Aeukyb4IJ3R1bOeBOIOSMNkLGpcpBtqXYV4T46kK5+1OlrLHbm9aLRKtQ8CZgSxxj1YqPV3
 pAkJL6jjzQXRUVdJb37eLwwE4M6Jd6nRhjKdseHxq1mhw==
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
b24uCkkgc3VwcG9zZSB5b3UgbWVhbnQgIkkgd291bGRuJ3QgcHV0IGEgZnJlZSBmb3JtIHZlcnNp
b24gcGFyYW1ldGVyIiA/IApEZXBlbmRpbmcgb24gdGhlIHJlc3BvbnNlIGZyb20gTlhQIGNvbW11
bml0eSAoc2VlIGJlbG93KSwgSSB3aWxsIGRvIGl0Lgo+Cj4+IEkgd2lsbCBhbHNvIGNoZWNrIGZv
ciB0aGUgcmVhc29uIGZvciB3aGljaCB0aGV5IHJlbW92ZWQgc3VwcG9ydCBmb3IgdGhvc2UKPj4g
ZGV2aWNlcy4gSWYgdGhleSB3ZXJlIG5ldmVyIHNvbGQsIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2Ug
dG8gdHJ5IHRvIGNvbnRpbnVlCj4+IHN1cHBvcnQgZm9yIHRob3NlLgo+IEluZGVlZCEgRG8geW91
IGhhdmUgYSByZWxldmFudCBjb250YWN0IGF0IE5YUCB0byBhc2sgdGhpcyAoZmFpcmx5Cj4gc3Bl
Y2lmaWMpIHF1ZXN0aW9uPwoKSSBkb24ndCBoYXZlIGEgZGlyZWN0IGNvbnRhY3Qgd2l0aCBOWFAu
IEkgb3BlbmVkIGEgdGlja2V0IG9uIHRoZWlyIApwbGF0Zm9ybSBhbmQgZ290IGEgcmVzcG9uc2Ug
OiAKaHR0cHM6Ly9jb21tdW5pdHkubnhwLmNvbS90NS9XaS1GaS1CbHVldG9vdGgtODAyLTE1LTQv
UXVlc3Rpb24tcmVnYXJkaW5nLXJlbW92YWwtb2YtVzg5OTctZmlybXdhcmUtZnJvbS1pbXgtZmly
bXdhcmUvbS1wLzI0MTQyMzYjTTUwMzUKCkhvd2V2ZXIgSSBhbSBub3Qgc3VyZSBhYm91dCB3aGF0
IEkgc2hvdWxkIGRvIHRvIHRha2UgaXQgaW50byBhY2NvdW50IGluIApidWlsZHJvb3QuIFRoZXkg
Y3JlYXRlZCBhIGN1c3RvbSAiaG90Zml4IiBicmFuY2ggZm9yIHRoZSBzcGVjaWZpYyAKZmVhdHVy
ZSBvZiB0aGUgdzg5OTcgYnV0IHRvbGQgbWUgdGhhdCB0aGUgbWFzdGVyIGJyYW5jaCB3aWxsIG5v
dCByZWNlaXZlIApmdXJ0aGVyIHN1cHBvcnQgZm9yIHRoaXMgZGV2aWNlLiBTbyB0aGF0IG1lYW5z
IHRoYXQgd2UgbmVlZCB0byBtYWtlIHN1cmUgCnRoYXQgYSB1c2VyIG1heSBzZWxlY3QgYW4gb2xk
ZXIgdmVyc2lvbiBvZiB0aGUgaW14LWZpcm13YXJlIGFuZCBtd2lmaWV4IAp3aGVuIHN1cHBvcnQg
Zm9yIHRob3NlIGRldmljZXMgaXMgcmVxdWlyZWQgPyBBbnkgaGludCB0byBoZWxwIG1lIAp1bmRl
cnN0YW5kIHdoYXQgSSBzaG91bGQgZG8gaGVyZSB3b3VsZCBiZSBhcHByZWNpYXRlZC4KCj4gVGhv
bWFzCkFudG9pbmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
