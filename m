Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF64C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 08:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9553861875
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 08:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9553861875
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3792E84048;
	Thu, 30 Sep 2021 08:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eG0lx4o5Xh5C; Thu, 30 Sep 2021 08:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8039983F31;
	Thu, 30 Sep 2021 08:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E235D1BF3E8
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 08:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC54040330
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 08:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XN5yhcFns_vL for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 08:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A819740200
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 08:58:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 537F261881;
 Thu, 30 Sep 2021 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632992325;
 bh=cV4cywS904rSm9ynmGnxuHNtWzsJwGYJkk5jiH1S4XM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=lTZWEtXf5KNAP7/21uWdJS5qCgbi67iM+ck+FfiYQT4fRGjgAsn3Zws40bSGBGVs9
 p9vZ6MkKsJxCQx1+yfnq++MmosLDU5QBNugdnoggag4bYP97yn+IoEkTpquxIQ6V0p
 cxjKjWywOdOJBb+SngqivzZsz8imr6GF3yU1m2xjYx5Ud3sZcS14XSadIek51kgHjh
 vm46U+goZJu5vEPZQgp1LouOdHqj1+OTnT0fOyPsixQGR3BpSQt/gPP2AhiZ/daFHc
 OK06eCuitRnhez/BK8/GaZEpq38padLVDbwH4XTzw+nh6iPE1l5VEwt7v9LP2Tv69z
 3xq4qmneQhnjQ==
MIME-Version: 1.0
In-Reply-To: <20210907125841.509792-1-jose.pekkarinen@unikie.com>
References: <20210907125841.509792-1-jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
To: José Pekkarinen <jose.pekkarinen@unikie.com>, buildroot@buildroot.org
Message-ID: <163299232288.3047.15888178110434706206@kwain>
Date: Thu, 30 Sep 2021 10:58:42 +0200
Subject: Re: [Buildroot] [PATCH] package/policycoreutils: Add service to
 handle selinux autorelabel
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
Cc: José Pekkarinen <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpRdW90aW5nIEpvc8OpIFBla2thcmluZW4gKDIwMjEtMDktMDcgMTQ6NTg6
NDEpCj4gVGhpcyBwYXRjaCBhZGRzIGEgc3lzdGVtIHNlcnZpY2UgdG8gY2hlY2sgd2hldGhlciB0
aGUKPiBhdXRvcmVsYWJlbCB2aWEgaXMgcmVxdWVzdGVkIG9yIG5vdCwgYW5kIHByb2R1Y2UgdGhl
Cj4gbGFiZWxpbmcgb2YgdGhlIHN5c3RlbSB1bmRlciB0aGUgbG9hZGVkIGZpbmFsIGtlcm5lbCwK
PiBpbmNsdWRpbmcgYXV0b21hdGljYWxseSBwb3B1bGF0ZWQgZnMgYnkgdGhlIGtlcm5lbC4KCkkg
ZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgY29ycmVjdCBmaXggbm9yIGl0IGNhbiB3b3JrIGFjcm9z
cyByZWJvb3RzCndpdGhvdXQgcmVsYWJlbGxpbmcgdGhlIHdob2xlIHN5c3RlbSBlYWNoIHRpbWUu
IFJlbGFiZWxsaW5nIHRoZSBlbnRpcmUKc3lzdGVtIGlzIHVzdWFsbHkgZG9uZSBpbiBkaXN0cm9z
IHdoZW4gdXBkYXRpbmcgdGhlIHBvbGljeSBidXQgaGVyZSBpbgpCdWlsZHJvb3QgdGhlIHBvbGlj
eSBpcyB0aWVkIHRvIGEgZ2l2ZW4gaW1hZ2UgdmVyc2lvbiBhbmQgYW4gdXBkYXRlIGluCnRoZSBw
b2xpY3kgc2hvdWxkIGNvbWUgd2l0aCBhIG5ldyBpbWFnZS4KCk5vdywgSSdtIG5vdCBzYXlpbmcg
dGhlcmUgaXMgbm8gaXNzdWUuIFdoZW4gdXNpbmcgZGV2dG1wZnMgKG90aGVyd2lzZQovZGV2IGlz
IGFscmVhZHkgbGFiZWxlZCBhdCBidWlsZCB0aW1lKSBkZXZpY2Ugbm9kZXMgaGF2ZSBhIGRlZmF1
bHQgbGFiZWwKdGhhdCBtaWdodCBub3QgbWF0Y2ggdGhlIGxvYWRlZCBwb2xpY3kuIFRoZSBsYWJl
bGxpbmcgaGFzIHRvIGJlIGRvbmUgYnkKYW4gdXNlcnNwYWNlIGRhZW1vbiwgdXN1YWxseSB1ZGV2
IChidXQgcmVzdG9yZWNvbmQgY291bGQgd29yayB3aXRoIHRoZQpyaWdodCBjb25maWcpLiBUaGlz
IGlzIG5lZWRlZCBhcyBuZXcgZGV2aWNlcyBtaWdodCBhcHBlYXIgbGF0ZXIuCgpUaGUgaXNzdWUg
aGVyZSBJIGJlbGlldmUgaXMgdGhlcmUgaXMgYSBnYXAgYmV0d2VlbiBkZXZ0bXBmcyBpcyBtb3Vu
dGVkCmFuZCB1ZGV2IHN0YXJ0cywgd2hpbGUgb3RoZXIgZGFlbW9ucyBzdGFydCBhY2Nlc3Npbmcg
aXQuIFdoYXQgaXMgdXN1YWxseQpkb25lIElJUkMgaXMgdG8gcnVuIHJlc3RvcmVjb24gb24gL2Rl
diByaWdodCBhZnRlciBpdCBpcyBtb3VudGVkLiBJZiBJJ20Kbm90IG1pc3Rha2VuIHN5c3RlbWQg
ZG9lcyBzb21ldGhpbmcgc2ltaWxhciBieSBkZWZhdWx0LgoKVGhpcyBuZWVkcyBpbnZlc3RpZ2F0
aW9uIGJ1dCBJIGhvcGUgdGhlIGFib3ZlIGdhdmUgc29tZSBwb2ludGVycy4KClRoYW5rcywKQW50
b2luZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
