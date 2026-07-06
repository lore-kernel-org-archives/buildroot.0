Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA7C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 15:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F108940885;
	Mon,  6 Jul 2026 15:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG8vH7U1nDdY; Mon,  6 Jul 2026 15:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7A7408E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783353414;
	bh=BPm33aZQtWVEtrZEUi+1pflwr+w4A1fYPGZzqu/c+eQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A3L7dOUbfU53iLHrOokq+jk0dW/BPQ9lfY1fj8LN8kkYi4bn59EJNuwzF+dc4sgSW
	 LMHkcNb3Lcw/R0TA3w3MoXgK69G3yOMyq/1ZjHRStgAEzPuOWr/lUL0jVExQS3f8Eh
	 6gYdNPjIH0Yhff9QpPFxFGZ50VP2uQLbxc+sGqY2DY7sTAcrSVXQtT44wdFTLopyMm
	 4x154aP58ntaZpAXb27GdF0Wj70eW4YAGF45ZV5p5nFHNiW7BVz+S2EFRjCi4UjOtR
	 fC0kdsvFrIHUgSEaERcwuRE6baLr71H5ZkELc4GIDZPSc1A64MCanLA4nna85S+A8J
	 jkIsBdk2YbIJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7A7408E4;
	Mon,  6 Jul 2026 15:56:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4771F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAD5280B3C
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfU5sT-1jwdr for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 15:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 140CB80B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140CB80B22
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 140CB80B22
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:56:51 +0000 (UTC)
Received: from [192.168.109.38] (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE07213F854;
 Mon,  6 Jul 2026 17:56:48 +0200 (CEST)
Message-ID: <1fabc7dc-8fcf-4a94-8b2a-be8c1cada574@free.fr>
Date: Mon, 6 Jul 2026 17:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-3-nunes.philippe@free.fr>
 <aktlHr_H_GNkXLzb@L30177.local>
Content-Language: en-US
In-Reply-To: <aktlHr_H_GNkXLzb@L30177.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783353409;
 bh=/usKzCF1PWPd0v4lu/FAGSvEWJyGiq+0KS/KXHwaYdg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K/0yASaGvEEte2zsR5fvXcRgmz2/t8lpsyBE5Mz6OaeMB57rG99Akgbu5sEwHotH/
 8+SM1VeEv10eBCeqIhiAR46DxKFVeHODjyMY450a+N1yViIYJKWaXBgC+tzV0rC7Je
 L43o9cqwY5MdGWhgElhHIYj5y7HvKVVy7pTR4jwhO2lO2sRECF5C2atnPhcUEBbxEe
 2J0a2E/zusT+jMK3EdNwId3Hhvhmw/LRWVDTgQt5gXaLfN0cmFeA/RhoigRudiLVY0
 Ig8t+YAwG9jXmEQGxn/jGDPPOlVYYzuWjgG2TX2BfoMGhw6IGZdl84BbNTEkVjX8NT
 CsNVcciRbBkzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K/0yASaG
Subject: Re: [Buildroot] [PATCH 2/3] package/libqoriq-rcw: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDcvNi8yNiAxMDoxOSwgVmluY2VudCBKYXJkaW4gd3JvdGU6Cj4gSGkg
UGhpbGlwcGUsCj4KPiBUaGFua3MgZm9yIGxlYWRpbmcgdGhpcyBwYWNrYWdpbmcgaW50byBCdWls
ZHJvb3QuCj4KPiBzZWUgYmVsb3csCj4KPiBMZSAwMS8wNy8yNiAxNDoxOSwgUGhpbGlwcGUgTnVu
ZXMgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdCA6Cj4+IGxpYnFvcmlxLXJjdyBpcyBhIEMxNyByZWlt
cGxlbWVudGF0aW9uIG9mIE5YUCdzIHJjdy5weSBmb3IgdGhlCj4+IHBiaWZvcm1hdD0yIFFvcklR
IGZhbWlseSAoTFMxMDI4LCBMUzEwODgsIExTMjA4OCwgTFgyMTYwKS4gSXQgY29tcGlsZXMKPj4g
YW5kIGRlY29tcGlsZXMgUkNXIChSZXNldCBDb25maWd1cmF0aW9uIFdvcmQpIGJpbmFyaWVzIHVz
ZWQgYnkgdGhlCj4+IFNvQyBib290cm9tLCBhbmQgZXhwb3NlcyB0aGUgc2FtZSBmdW5jdGlvbmFs
aXR5IGFzIGEgcmV1c2FibGUgc2hhcmVkCj4+IGxpYnJhcnkgKyBwa2ctY29uZmlnICsgcHVibGlj
IGhlYWRlci4KPj4KPj4gQnVpbHQgYXMgYSBob3N0LW9ubHkgbWVzb24gcGFja2FnZSB3aXRoIC1E
dGVzdHM9ZmFsc2UgLURtYW49ZGlzYWJsZWQuCj4+IFRoZSB1cHN0cmVhbSB0ZXN0cy8gc3ViZGly
IGxpbmtzIGxpYmNtb2NrYSAob25seSB2YWxpZGF0ZXMgbGlicmFyeQo+PiBpbnRlcm5hbHMgLS0g
bmV2ZXIgZXhlY3V0ZWQgYnkgQnVpbGRyb290KSwgYW5kIHRoZSBtYW4tcGFnZSBzdGVwCj4+IHJl
cXVpcmVzIHBhbmRvYyAoaGVhdnkgSGFza2VsbC1ydW50aW1lIHRvb2wgdHlwaWNhbGx5IGFic2Vu
dCBmcm9tCj4+IHBhY2thZ2VycycgbWluaW1hbCBpbWFnZXMpLiBUaGUgJ3Rlc3RzJyBvcHRpb24g
bGFuZGVkIHVwc3RyZWFtIGluCj4+IHYxLjAuMSwgdGhlICdtYW4nIGZlYXR1cmUgb3B0aW9uIGlu
IHYxLjAuMjsgd2UgcGluIHRvIHYxLjAuMi4KPiBObyBuZWVkIG9mIHByb3ZpZGluZyB2ZXJzaW9u
IGhpc3Rvcnkgb24gYWxsIHRoZSB2ZXJzaW9ucyBpbnRvIHRoZSBjb21taXQgbG9nLgoKQWNrLCBk
cm9wcGVkIGluIHYyLgoKPj4gRGVwZW5kcyBvbiBob3N0LW1jcHAgZm9yIGluLXByb2Nlc3MgQyBw
cmVwcm9jZXNzb3Igc3VwcG9ydDsgdGhlCj4+IGxpYnJhcnkgdXNlcyBsaWJtY3BwIGluc3RlYWQg
b2Ygc2hlbGxpbmcgb3V0IHRvIGdjYyAtRSBzbyB0aGF0IHRoZQo+PiBwcmVwcm9jZXNzaW5nIG9m
IC5yY3cgc291cmNlcyBpcyBoZXJtZXRpYyBhbmQgc2VsZi1jb250YWluZWQuCj4+Cj4+ICsJICBV
c2VkIGJ5IHRoZSBob3N0LXFvcmlxLXJjdy1jIENMSSBmb3IgdGhlIGFjdHVhbCBjb21waWxlLAo+
PiArCSAgLS1kdW1wLCAtLWR1bXAtZmxhc2gsIGFuZCBkZWNvbXBpbGUgb3BlcmF0aW9ucy4KPiBU
aGlzIGhlbHAgaW5mb3JtYXRpb24gaXMgbm90IGZvciB0aGUgbGlicmFyeS4gU2VlIG15IG90aGVy
IGNvbW1lbnQuClJlbW92ZWQgaW4gdjIuCj4+ICsjIFNraXAgYm90aCB0aGUgY21vY2thLWJhc2Vk
IHVuaXQgdGVzdHMgYW5kIHRoZSBwYW5kb2MtcmVuZGVyZWQgbWFuCj4+ICsjIHBhZ2UuIFRoZSB0
ZXN0cy8gc3ViZGlyIGxpbmtzIGxpYmNtb2NrYSBhbmQgb25seSB2YWxpZGF0ZXMgdGhlCj4+ICsj
IGxpYnJhcnkgaW1wbGVtZW50YXRpb24gaXRzZWxmIChDUkMsIGJpdC1wYWNraW5nLCBwYXJzZS9k
ZWNvbXBpbGUKPj4gKyMgcm91bmQtdHJpcHMpOyBCdWlsZHJvb3QgbmV2ZXIgZXhlY3V0ZXMgdGhl
bS4gVGhlIG1hbi1wYWdlIHN0ZXAKPj4gKyMgcmVxdWlyZXMgcGFuZG9jLCBhIGhlYXZ5IEhhc2tl
bGwtcnVudGltZSB0b29sIHR5cGljYWxseSBhYnNlbnQKPj4gKyMgZnJvbSBwYWNrYWdlcnMnIG1p
bmltYWwgaW1hZ2VzLCBhbmQgaG9zdCBwYWNrYWdlcyBkb24ndCBpbnN0YWxsCj4+ICsjIG1hbiBw
YWdlcyBhbnl3YXkuIFRoZSAndGVzdHMnIG9wdGlvbiBsYW5kZWQgdXBzdHJlYW0gaW4gdjEuMC4x
LAo+PiArIyB0aGUgJ21hbicgZmVhdHVyZSBvcHRpb24gaW4gdjEuMC4yLgo+PiArSE9TVF9MSUJR
T1JJUV9SQ1dfQ09ORl9PUFRTID0gLUR0ZXN0cz1mYWxzZSAtRG1hbj1kaXNhYmxlZApUcmltbWVk
IHRvIGEgc2luZ2xlIGxpbmUgaW4gdjI6CiDCoCDCoCAjIHNraXAgY21vY2thLWJhc2VkIHVuaXQg
dGVzdHMgYW5kIHBhbmRvYy1nZW5lcmF0ZWQgbWFuIHBhZ2UKCkFsc28gYWRkaW5nIGEgdGFyZ2V0
IHZhcmlhbnQgKEJSMl9QQUNLQUdFX0xJQlFPUklRX1JDVykgdG8gc2F0aXNmeSBwYXRjaCAKMydz
IHRhcmdldCBidWlsZCwgd2hpY2ggbmVlZHMgbGlicW9yaXEtcmN3IGF0IHJ1bnRpbWUgZm9yIHRo
ZSAtLWR1bXAgLyAKLS1kdW1wLWZsYXNoIHJlY292ZXJ5IG1vZGVzLgoKVGhhbmtzLgoKUGhpbGlw
cGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
