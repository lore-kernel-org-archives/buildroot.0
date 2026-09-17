Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2FFC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E0760830;
	Thu, 17 Sep 2026 08:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A6PIAo6OCOE; Thu, 17 Sep 2026 08:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F629605E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789632142;
	b=bkSaOkJoTROljVAuRNDTbnKiQNNhlb1HBIHdCkCIqeuKR7NA/TZBOFdWdAhU3d4UXIai
	 Z9ES+8xSkxKcLNvf2BdPOs4i44JB/lSEdYF8Tc2IcSfJeoN3KGpst+Wrb+q9qxLe8c8nv
	 rzbBOmg/4CJsrvVrixrBIqI3AKi1aiSlpqrhbooNtYPceRyPjabJ6rskbArcP0e18SVNw
	 wHhmDSoViLuIqKRMcrYU0mtjmDN3UcrqHd1GEX9vVVtChqfFoqkUml5EOL2cdQlGS5SHz
	 9QoAbFIjE8KQvmmmA7PBB8ktF3u82naF0cSKXXgHTNuGNKEIr1h/B7KEInk8+XoUb8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789632142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:Message-ID:Date:
	 MIME-Version:User-Agent:To:Cc:References:Content-Language:From:
	 In-Reply-To:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=8+McsEYLjcW6LyVNoxcQ5WElUXhaGc7+0nCye1O/0h4=;
	b=KyyRkvyY53B1pNRvdYXY0o6kIgH0mBq0F6s6ukU1NkN0p7omQiEZqPzkLTd+jbJE22aL
	 RkFyFazUas6fci/cnY+MBPkP9a3lL+uZsJBpgocPtiMirPtA9SCADpHe/u7gPPoPB7jPS
	 tD4wbjEWlG2DeGeHf1eK90gwMA8lh7xR3Ll/fTWy2sAQrIs9g5kwBSTDTSetwQxLtipc4
	 XnazwxYwUV3tT6YNaPrcWGdpHsHfIz1H1yXYziJ7tM/IE9c2r6Zffl67yCBUV18FatMin
	 WmSW1B2VHUyNyO4+bSpVTedPfMPUX2fNwNGPU37PgYM2tf+RR2oyGycTZ6NyixNN/Lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789632142;
	bh=8+McsEYLjcW6LyVNoxcQ5WElUXhaGc7+0nCye1O/0h4=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCgW0jaeGwIB45IrcVpbd5lI5R1tjcYldxzn/7htLGKb+m0xyMWEZ6+sObFqb+Ya9
	 PTo0w6KOHyL4xH0Ta12xU65cCZw7UsrreMF7NMl7ltRfvNwT/qfR+A96kVIo8Epkfy
	 Ws/jE0Ne6oKs74APQ/O6OzxZRqFPC+bYikSH2S1iq/Kw3IFX6+u9Y328CzOpiT+KYV
	 qTZWp+99W9cMgU44hDMieUymWX9GJ1Is86kcAXRsQkGDF2Ml10JnPAq7h1+u28Pao1
	 84FSyjmlMV8TU9wjIh9t8zMquMg5KtNZuRDTWtnmUKn9h9D5d6BT0Rb5i3cOMpCJuy
	 uFfHAS++i2xuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F629605E5;
	Thu, 17 Sep 2026 08:02:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BEEA2EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22E05400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28ErQfVIU1qe for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:02:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D5BB2400F3
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=178.33.251.80
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789632139;
 b=DYzXurLSf0Gfvm/Mr2COeIi495uAOJnZHulz/ATeMpJmhX4VbE+tINi7m3uEIGsSMrjn
 /NEA5I9bassYlk+JOdhdc9g/7Zxu6cDSGbil7n1tetbJ6QeGQZaluxdJVX5sa1UWAZOry
 cocvvXJFZM5hOCZVXFGs6bdN/vT7MKbZOOyv+Yp6Z3zDrwVyAvtTY41wUTXD0g0s+lOmY
 JzL3d7EaROXGweNlnTSnuNn06Gzhpt5Lh92LQF7WaVXMMZJWz5V/D5H/u5YM6aJVviR3i
 FJb+T9wEqI1oL/WMjVEEonOXGTAkC4qkcQJI9jBlxPnvyU5z1mRTJIbkfw/Mp57Ys1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789632139;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=J0x0ywV/P55OT9EVT/t9DupTrA7uCC/GMacLfZFmfrw=;
 b=etWCkuKYPXRVdt4YIfyV2NSKuDaN/yNF/wAR1HYknXkub7oCdzt7zdfvFhUzZADsQlFe
 PoGq8P5O+BCspQbbRV3+32zPxzJWdylj51kUme4LQLiGSzRsPYofzDOM8B9D9QEvcINkS
 nasU45EuholkhmwFGhhxvTcCYCG9Lp6I3uqP6pgu9RADQzlvuhy6X9wGg3eVZUQbBUaMx
 gjS7cgKUOSlNklHCLUKZrcytVTrHdYXOeZjuG1GROukeB8hSOXWvDsKWsmblIpq6SBHKr
 SdE4HKxI5/umzWpt8Km73+zzKhmsmv520DmZoYYmeS1OwuLN8oY3LsFDRQFEhSlzjxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=FFJ2xiAb; 
 arc=none smtp.remote-ip=178.33.251.80
X-Greylist: delayed 71821 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Sep 2026 08:02:18 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=FFJ2xiAb
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.80;
 helo=2.mo576.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net
 [178.33.251.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5BB2400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:02:16 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.102])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4hlpBY6jN0z5vbM
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:02:13 +0000 (UTC)
Received: from ghost-submission-c7b579475-hq8vf (unknown [10.110.96.141])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A820FC0128;
 Thu, 17 Sep 2026 08:02:13 +0000 (UTC)
Received: from quimesis.be ([37.59.142.112])
 by ghost-submission-c7b579475-hq8vf with ESMTPSA
 id MfxAG4Weq2qxNjsAD4lxxw
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 17 Sep 2026 08:02:13 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-112S006e6c0f0c8-4430-4ef4-bb1b-23c12a628b54,
 8A94A716474959CFB9616324D37364D589FF58DE)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 81.245.109.59
Message-ID: <9f159817-dd6b-4f3c-bf08-8ebc357b9697@quimesis.be>
Date: Thu, 17 Sep 2026 10:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
 <20260916130840.881186-2-antoine.gennart@quimesis.be>
 <aqsIPwc1ZeVxBlb4@windsurf>
Content-Language: en-US
From: Antoine Gennart <antoine.gennart@quimesis.be>
In-Reply-To: <aqsIPwc1ZeVxBlb4@windsurf>
x-ovh-tracer-id: 11422536030371975117
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGSeaTWbwBOSHzmYErIfw6q8XowpobBO6MvOTp6bIvtR+G4kdKMGk6tzW+xjQM3ZSC00U0DNTGhZocecnsNnMXOhYaC9DAzv6OBqB+AEMEc4ZZJQyZdyBrTdOOSv9+BCLN40hwwoABNeH16ZaA114NlNWRvWB3Nu1rlZJ0tSvTGDCQ/GcW2wLwYRHtffxumWkSRjLL1JUgh1FpW8wnYEVkdUZFqPuzEoJTPADaxhu0zENPU1KG4Oa8y1qpWbUpi0ey8DgqnuHRvj7R6MNiPnGB6u46Cg1hV1aE/CYyQfuYyDbqwKp/kR6XI/NcD0pvMSe0rJ/oWpslFQ0ZXU/GG/z6qYlWjCI8YiDO6qlmDXYa78NRBrohr1YtSJ/Sdci+hBXfp/Zpq1rBW2mtXa6cBQleMf1GeDdiyaq1Wl8zvmRH9mIQrb1qUglsxvd3NS7yXlWKC9OUO5raB1Zqmc+T91WN8a5j5eulX/xpbEJ2AmnIsoVKYqqkKGcLSMI5FchIwxp9+CMbztZveoLnWbbrBedooFqUidCPGJYTXnUs061GPR8WOVzYroyhqbeDuV/Mkq/hRVgieJ9dtR+Qw7l5UXXDMQuHUwO6cdBQeW4dZ8bIX5+O+rn0QukLTxnruP2vzPeZzgkUE1MXx5tgbrSK0M7/VahA73sNKAmkBJjozD/nDGQ
DKIM-Signature: a=rsa-sha256; bh=J0x0ywV/P55OT9EVT/t9DupTrA7uCC/GMacLfZFmfrw=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789632134; v=1;
 b=FFJ2xiAb/WIEff3CBjZ2nPOkSFGngqbPN38Gr2peRjr5targb59V4osMUkWmuZ6L+ZYg07Bv
 AwpEQpMY+co8ZVn0E8oL0NtLPFAZEsv/i6vBb07v56A+Okh3admAvpd2zs9epRSkICRK9Cne877
 8kIvqI/CzgVvaO+ohyYbHmGzklSXssm2XEtSi9i6RVgGIzly4koeHIVEu+1DXSRNwxVud+OAv4U
 CogsMsVWOGbNtJAQu54MrO2mldGRPPR4NuyVBP9WEHfkc18SKgGCLFp4J0eMyVJ0/lKkQkva2Dh
 Mth8v2aNWRMFiOcI+E3dCCucdWdxyqQttxxye1Xb7Lg7A==
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

PiBIZWxsbywKPgo+IEFoLCBoZXJlIGlzIHlvdXIgUEFUQ0ggMi8yIDotKQo+Cj4gT24gV2VkLCBT
ZXAgMTYsIDIwMjYgYXQgMDM6MDg6MzlQTSArMDIwMCwgYWdlbm5hcnQgd3JvdGU6Cj4+IFRoZSBJ
VzYxMCBtb2R1bGUgaXMgYWxzbyBhdmFpbGFibGUgd2l0aCBhIFVTQiBob3N0IGludGVyZmFjZSwg
d2hpbGUgdGhlCj4+IGN1cnJlbnQgcGFja2FnZSBvbmx5IHN1cHBvcnRzIGl0cyBTRElPIGZpcm13
YXJlLgo+Pgo+PiBCdW1wIHRoZSBmaXJtd2FyZSByZWxlYXNlIHRvIGxmLTYuMTguMjBfMi4wLjAs
IHdoaWNoCj4+IHByb3ZpZGVzIHRoZSBGd0ltYWdlX0lXNjEwX1VTQiBmaXJtd2FyZSwgYW5kIGFk
ZCBhIGRlZGljYXRlZAo+PiBCUjJfUEFDS0FHRV9OWFBfQlRfV0lGSV9GSVJNV0FSRV9JVzYxMF9V
U0Igb3B0aW9uLgo+Pgo+PiBUaGUgbmV3IHJlbGVhc2UgYWxzbyBtb3ZlcyBmaXJtd2FyZSBmaWxl
cyBvdXQgb2YgdGhlIG54cC8gZGlyZWN0b3J5Cj4+IGFuZCBubyBsb25nZXIgcHJvdmlkZXMgODgw
MSBvciA4OTk3IGZpcm13YXJlLiBVcGRhdGUgdGhlIGluc3RhbGxhdGlvbgo+PiBwYXRocywgbWFr
ZSB0aGUgZXhpc3RpbmcgSVc2MTAgb3B0aW9uIGV4cGxpY2l0bHkgU0RJTywgYW5kIHJldGFpbiBs
ZWdhY3kKPj4gY29uZmlndXJhdGlvbiBoYW5kbGluZyBmb3IgcmVtb3ZlZCBvciByZW5hbWVkIG9w
dGlvbnMuCj4gTmVlZCBhIFNpZ25lZC1vZmYtYnkgbGluZSwgYW5kIGEgRnJvbTogbGluZSBwcm9w
ZXJseSBmb3JtYXR0ZWQuCkkgYWRkZWQgdGhlIFNpZ25lZC1vZmYgbGluZSBjb3JyZWN0bHkgYW5k
IHJlc2VudCB0aGUgcGF0Y2guIEl0IHNob3VsZCBiZSAKY29ycmVjdCBub3cuCj4KPiBCdXQgSSdt
IGNvbmNlcm5lZCBhYm91dCBmaXJtd2FyZSBmaWxlcyBoYXZpbmcgZGlzYXBwZWFyZWQKPiBlbnRp
cmVseS4gV2hhdCBkbyB3ZSBwcm9wb3NlIHRvIHRoZSBwZW9wbGUgd2hvIGRvIGhhdmUgODgwMSBv
ciA4OTk3Cj4gZGV2aWNlcz8gSSBtZWFuIE5YUCBtaWdodCBkZWNpZGUgdGhleSBkb24ndCBjYXJl
IGFib3V0IHRob3NlIHBlb3BsZSwKPiBidXQgdGhvc2UgcGVvcGxlIG1pZ2h0IHN0aWxsIGhhdmUg
SFcgaW4gdGhlIGZpZWxkIHRoYXQgdXNlcyB0aG9zZQo+IGRldmljZXMuIFNob3VsZCB3ZSBzdGls
bCBzdXBwb3J0IHRoZSBvbGQgTlhQIGZpcm13YXJlIHJlbGVhc2UgdG8KPiBwcm92aWRlIGFuIG9w
dGlvbiB0byB0aG9zZSBwZW9wbGU/IE9yIGFyZSB0aG9zZSBmaXJtd2FyZSBmaWxlcyBkcm9wcGVk
Cj4gYmVjYXVzZSA4ODAxIGFuZCA4ODk3IHdlcmUgbmV2ZXIgc29sZCBvbiB0aGUgbWFya2V0PwoK
SSBtdXN0IGFkbWl0IHRoYXQgSSdtIG5vdCBzdXJlIHdoeSB0aG9zZSBmaWxlcyBoYXZlIGJlZW4g
cmVtb3ZlZC4gVGhlIAptYWluIGNvbmNlcm4gSSBoYWQgd2FzIHRvIHN1cHBvcnQgdGhlIFVTQiBo
b3N0IGludGVyZmFjZSB0aGF0IEkgbmVlZGVkLiAKWW91IGFyZSByaWdodCB0aGF0IGl0IHdvdWxk
IGJlIG5pY2UgdG8gaGF2ZSBhbiBvcHRpb24gZm9yIHBlb3BsZSBzdGlsbCAKdXNpbmcgdGhlIG9s
ZCBOWFAgZmlybXdhcmUuwqAgRG8geW91IHRoaW5rIGFkZGluZyBhICJ2ZXJzaW9uIiBwYXJhbWV0
ZXIgCnRvIGFsbG93IHRvIG92ZXJ3cml0ZSB0aGUgZGVmYXVsdCB2ZXJzaW9uIHdvdWxkIGJlIHRo
ZSBjb3JyZWN0IGFwcHJvYWNoID8KCkkgd2lsbCBhbHNvIGNoZWNrIGZvciB0aGUgcmVhc29uIGZv
ciB3aGljaCB0aGV5IHJlbW92ZWQgc3VwcG9ydCBmb3IgCnRob3NlIGRldmljZXMuIElmIHRoZXkg
d2VyZSBuZXZlciBzb2xkLCBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIHRyeSB0byAKY29udGlu
dWUgc3VwcG9ydCBmb3IgdGhvc2UuCgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gVGhvbWFzCgpCZXN0
IHJlZ2FyZHMsCgpBbnRvaW5lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
