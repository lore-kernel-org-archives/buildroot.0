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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0D6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C988161004
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C988161004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D73401F9;
	Sat, 18 Sep 2021 20:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqDoHJc7X-Gv; Sat, 18 Sep 2021 20:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF3540108;
	Sat, 18 Sep 2021 20:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0BE1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB1C4840E1
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBON9v3pvAA0 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18FCE840D8
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:51:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4305CB0054E;
 Sat, 18 Sep 2021 22:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631998315;
 bh=0mySY/7kGsa+qM7Faz/0JNTdPuTgfdi/m5k1UAIfyZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skx57LRagCjvbEOg7Q79o6Uh96XqtSE9J9ZuK/GgV1RmQhE8+b+ofEP0ajNFzAkBZ
 K2Z0BEPSftQyUjcnj467lS7UP2+a9GihmK7S0LwBMd7q2mln4FiEwLb6+ZOvoQa6Wz
 tmbaTcmGNbu/cZM36l0yx5Pn5cElFB+LKXkcDR8OGK1Ai8ZkVgKhYL2QitJdVdWgHC
 c17/RJFGYHSvmX9ypXgl+06yxoG0PiJWf3JLgJ+FlNcBkx6oulo+aH4z1fxFiwo0VV
 dzvtglxu6M0Xp3EDnTJZzRjLDdG6LoenQLHNYAnPTCPR+EuppXMWiHL7OM6DQS6LKs
 rVO5loSGn86aw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:51:46 +0200
Date: Sat, 18 Sep 2021 22:51:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210918205146.GZ1053080@scaer>
References: <20210918070214.2527F8436A@smtp1.osuosl.org>
 <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
 <20210918102819.GJ1053080@scaer>
 <243665c1-0af1-12df-aa4f-4e6c509d13ca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <243665c1-0af1-12df-aa4f-4e6c509d13ca@gmail.com>
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

Um9tYWluLCBBbGwsCgorUGV0ZXIKCk9uIDIwMjEtMDktMTggMjI6MjUgKzAyMDAsIFJvbWFpbiBO
YW91ciBzcGFrZSB0aHVzbHk6Cj4gTGUgMTgvMDkvMjAyMSDDoCAxMjoyOCwgWWFubiBFLiBNT1JJ
TiBhIMOpY3JpdMKgOgo+ID4gT24gMjAyMS0wOS0xOCAxMDoxOSArMDIwMCwgRWRnYXIgQm9uZXQg
c3Bha2UgdGh1c2x5Ogo+ID4+IFRoZSBhdXRvYnVpbGRlciB3cm90ZToKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgIGFhcmNoNjRfZWZpIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xNTk3MjQ4Nzk4ICB8ICAgICAgCj4gPj4+ICAgICAgICBhY21l
c3lzdGVtc19hY3F1YV9hNV81MTJtYiB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvMTU5NzI0ODgwMCAgfCAgICAgIAo+ID4+IEkganVzdCB0cmllZCBv
bmUgb2YgdGhlIGZhaWxlZCBkZWZjb25maWdzIChhY21lc3lzdGVtc19hY3F1YV9hNV81MTJtYikK
PiA+PiB1c2luZyB0aGUgZXhhY3Qgc2FtZSBCdWlsZHJvb3QgY29tbWl0IGFzIHRoZSBhdXRvYnVp
bGRlciBkaWQKPiA+PiAoYzQ4MzMxOGQwOSkuIEl0IGFsbCB3ZW50IG91dCBzbW9vdGhseS4KPiA+
IElmIHlvdSBsb29rIGF0IHRoZSB0b3Agb2YgdGhlIGJ1aWxkIGxvZywgeW91J2xsIG5vdGljZSB0
aGF0IGhvc2UKPiA+IGZhaWx1cmVzIGFsbCBvY2N1ciBvbiB0aGUgZ2NjMTYwIHJ1bm5lci4KPiA+
IAo+ID4gSSdtIGFkZGluZyBSb21haW4gaW4gQ2MgOyBJSVJDLCBoZSBhbHJlYWR5IG5vdGljZWQg
c29tZXRoaW5nIGZpc2h5IGdvaW5nCj4gPiBvbiB3aXRoIGdjYzE2MC4gUm9tYWluPwo+IAo+IElu
ZGVlZCBidXQgdGhlcmUgaXMgbm90aGluZyBJIGNhbiBkby4gSSBkb24ndCBoYXZlIGFjY2VzcyB0
byB0aGlzIG1hY2hpbmUuCj4gZ2NjMTYwIGlzIG5vdCBhbiBhdXRvYnVpbGRlciBidXQgYSBnaXRs
YWIgcnVubmVyLgoKQWgsIGJ1dCBQZXRlciBhbmQgVGhvbWFzIGRvIGhhdmUgYWNjZXNzIHRvIHRo
YXQgbWFjaGluZSwgSSB0aGluayAoSQpkb24ndCksIGFuZCBJIHRoaW5rIFBldGVyIGlzIHJ1bm5p
bmcgdHRoZSBnaXRsYWIgcnVubmVyIHRoZXJlLi4uCgpQZXRlcj8KCj4gSSBiZWxpZXZlIHdlIGNh
biB1c2UgZ2l0bGFiIHNoYXJlZCBydW5uZXIgZm9yIGpvYnMgdGhhdCBjYW4gYmUgZmluaXNoZWQg
aW4gbGVzcwo+IHRoYW4gM2ggYW5kIHVzZSBvdXIgZ2l0bGFiIHJ1bm5lciBmb3IgbG9uZ2VyIGpv
YnMuCgpnY2MxNjAgaXMgbm90IGEgc2hhcmVkIHJ1bm5lcjsgaXQncyBvdXJzLCBzbyBpdCBzaG91
bGQgbm90IGJlIGltcGFjdGVkCmJ5IHRoZSBsaW1pdGF0aW9uIG9uIHNoYXJlZCBydW5uZXJzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBI
VE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0t
JwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
