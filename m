Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D742FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:11:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C9361100
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81C9361100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CD2B40182;
	Sat, 18 Sep 2021 21:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZU7-X0R-2itX; Sat, 18 Sep 2021 21:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12BF84014B;
	Sat, 18 Sep 2021 21:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2C61BF842
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A36340135
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpATwntcMKYe for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5004840018
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:11:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 80287B004FF;
 Sat, 18 Sep 2021 23:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631999459;
 bh=jRcR6RXwk7fnOYDQb6GxUdvQOnY+05sG6iidr9zt1lw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nlihogr70kFrtBD/KDo0DT/oQ9D078GUYqvEAvNbi5FtcV3ZN3eUyJJhxzw5WiaOw
 lcjF7FQs1KW+qETcLdsZiL57uAwJgy4oQFul5CO79Ol5UMmzw1BvJ4HkS+jUaShUbJ
 XjcPoH2ty1yeuc0pmCy1qk1adzW6nPOJCzaY5xVYlhkHe+bnxFR2dDnA0cDDUl4Xhc
 XDIN1pA+uti+PYNXQIXcQnxwPhGzzT5V/kSEDy2k5mCWT8zTil7hO7nw2gUz+jhcmh
 j8PTMP1JhLGKjAkNJKyGO+/FQwEYpkUjSh9wXHWTTZ0eybmVh/8OyRdgsmDqPZe29d
 G+R8p56bMZu9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 23:10:53 +0200
Date: Sat, 18 Sep 2021 23:10:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210918211053.GB1053080@scaer>
References: <20210918070214.2527F8436A@smtp1.osuosl.org>
 <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
 <20210918102819.GJ1053080@scaer>
 <243665c1-0af1-12df-aa4f-4e6c509d13ca@gmail.com>
 <20210918205146.GZ1053080@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918205146.GZ1053080@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-09-17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Um9tYWluLCBBbGwsCgorVGhvbWFzCgpPbiAyMDIxLTA5LTE4IDIyOjUxICswMjAwLCBZYW5uIEUu
IE1PUklOIHNwYWtlIHRodXNseToKPiBPbiAyMDIxLTA5LTE4IDIyOjI1ICswMjAwLCBSb21haW4g
TmFvdXIgc3Bha2UgdGh1c2x5Ogo+ID4gTGUgMTgvMDkvMjAyMSDDoCAxMjoyOCwgWWFubiBFLiBN
T1JJTiBhIMOpY3JpdMKgOgo+ID4gPiBPbiAyMDIxLTA5LTE4IDEwOjE5ICswMjAwLCBFZGdhciBC
b25ldCBzcGFrZSB0aHVzbHk6Cj4gPiA+PiBUaGUgYXV0b2J1aWxkZXIgd3JvdGU6Cj4gPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICAgIGFhcmNoNjRfZWZpIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNTk3MjQ4Nzk4ICB8ICAgICAgCj4gPiA+Pj4g
ICAgICAgIGFjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNTk3MjQ4ODAwICB8ICAgICAgCj4gPiA+PiBJ
IGp1c3QgdHJpZWQgb25lIG9mIHRoZSBmYWlsZWQgZGVmY29uZmlncyAoYWNtZXN5c3RlbXNfYWNx
dWFfYTVfNTEybWIpCj4gPiA+PiB1c2luZyB0aGUgZXhhY3Qgc2FtZSBCdWlsZHJvb3QgY29tbWl0
IGFzIHRoZSBhdXRvYnVpbGRlciBkaWQKPiA+ID4+IChjNDgzMzE4ZDA5KS4gSXQgYWxsIHdlbnQg
b3V0IHNtb290aGx5Lgo+ID4gPiBJZiB5b3UgbG9vayBhdCB0aGUgdG9wIG9mIHRoZSBidWlsZCBs
b2csIHlvdSdsbCBub3RpY2UgdGhhdCBob3NlCj4gPiA+IGZhaWx1cmVzIGFsbCBvY2N1ciBvbiB0
aGUgZ2NjMTYwIHJ1bm5lci4KPiA+ID4gCj4gPiA+IEknbSBhZGRpbmcgUm9tYWluIGluIENjIDsg
SUlSQywgaGUgYWxyZWFkeSBub3RpY2VkIHNvbWV0aGluZyBmaXNoeSBnb2luZwo+ID4gPiBvbiB3
aXRoIGdjYzE2MC4gUm9tYWluPwo+ID4gCj4gPiBJbmRlZWQgYnV0IHRoZXJlIGlzIG5vdGhpbmcg
SSBjYW4gZG8uIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBtYWNoaW5lLgo+ID4gZ2NjMTYw
IGlzIG5vdCBhbiBhdXRvYnVpbGRlciBidXQgYSBnaXRsYWIgcnVubmVyLgo+IAo+IEFoLCBidXQg
UGV0ZXIgYW5kIFRob21hcyBkbyBoYXZlIGFjY2VzcyB0byB0aGF0IG1hY2hpbmUsIEkgdGhpbmsg
KEkKPiBkb24ndCksIGFuZCBJIHRoaW5rIFBldGVyIGlzIHJ1bm5pbmcgdHRoZSBnaXRsYWIgcnVu
bmVyIHRoZXJlLi4uCgpUaG9tYXMgaXMgcnVubmluZyBpdCBvbiBnY2MxNjAsIGFuZCBiYXNpY2Fs
bHkgc2FpZCAiZ2NjMTYwIGlzCnVucmVsaWFibGUsIEkgYWxyZWFkeSBub3RpZmllZCB0aGUgZ2Nj
IGZhcm0sIEknbGwgcGluZyB0aGVtIGFnYWluIgoKTWF5YmUgd2Ugc2hvdWxkIGp1c3QgZGVjb21p
c3Npb24gb3VyIHJ1bm5lciBvbiBnY2MxNjA/IEluZGVlZCwgYmV0dGVyCnJlbGlhYmxlIHJlc3Vs
dHMgaW4gbW9yZSB0aW1lIChvciBldmVuIG5vIHJlc3VsdCBhdCBhbGwpLCByYXRoZXIgdGhhbgpm
YWxzZSBuZWdhdGl2ZXMuLi4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
