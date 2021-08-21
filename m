Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D8FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 16:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4941C61222
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 16:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4941C61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B4C80F23;
	Sat, 21 Aug 2021 16:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHt60smNPCBT; Sat, 21 Aug 2021 16:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D52480F2B;
	Sat, 21 Aug 2021 16:28:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4623A1BF418
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354AD40379
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Go7SLyP1od6r for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 16:28:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C2CE40371
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 16:27:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed9f:1f04:306d:c1c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CEE9120039F;
 Sat, 21 Aug 2021 18:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629563276;
 bh=f+IgcTm/klEUvhmqKcIxURAqNTVJn3DPYCoI0HvMD7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UhgRoXVl6RT4x8//Epaj08OVH/s+zNuZ8bUrLrgZrp5HmhTntKcXnQG7/Z2rlu4pd
 bSy2x/TEPR1E2/VgRtZuymgqAnBleXXNbfa2vMeJjFSWe0n6mHdPL/Z70+yDTRTG1n
 rOZhrQ5xk0jjP/Iroyw6cDIzrO6AdnoRhwCuiZkb74uy9e7TSsXAqHh0WaHvkD97Lm
 c0IvUKqLWICh2gsKg0okZUOfu2OxUr9b50myvHffvnI/YWNNbZPQ8N6Crf3um+CCEu
 q7h+CP48MuCcWF7o80kpg2iusJA1WAi5VGnox8JZesK0C4x+crNqyxSZupPKdpfODJ
 5DmVFqPVwRtEg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Aug 2021 18:27:47 +0200
Date: Sat, 21 Aug 2021 18:27:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210821162747.GV27036@scaer>
References: <cover.1624911306.git.yann.morin.1998@free.fr>
 <ae1e35ca4f0557873fa25ca5205d92aa2a16dd1f.1624911306.git.yann.morin.1998@free.fr>
 <04eed532-822e-28c7-bd3d-4d9288a2bad9@mind.be>
 <4c95c45a-d650-183c-cd3a-dacff91b58fb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c95c45a-d650-183c-cd3a-dacff91b58fb@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/4 v5] utils/test-pkg: add mode to only
 prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Um9tYWluLCBBcm5vdXQsIEFsbCwKCk9uIDIwMjEtMDgtMjEgMTU6MzggKzAyMDAsIFJvbWFpbiBO
YW91ciBzcGFrZSB0aHVzbHk6Cj4gTGUgMDUvMDgvMjAyMSDDoCAyMjo0NSwgQXJub3V0IFZhbmRl
Y2FwcGVsbGUgYSDDqWNyaXTCoDoKPiA+IE9uIDI4LzA2LzIwMjEgMjI6MTUsIFlhbm4gRS4gTU9S
SU4gd3JvdGU6Cj4gPj4gQ3VycmVudGx5LCBydW5uaW5nIHRlc3QtcGtnIGlzIG9ubHkgZG9uZSBs
b2NhbGx5IG9uIHRoZSBkZXZlbG9wcGVycwo+ID4+IG1hY2hpbmUuCj4gPj4KPiA+PiBJbiBhIGZv
bGxvdyB1cCBjb21taXQsIHdlJ2xsIGFkZCB0aGUgcG9zc2liaWxpdHkgdG8gcnVuIHRlc3QtcGtn
IGluIGEKPiA+PiBnaXRsYWItY2kgcGlwZWxpbmUgYW5kLCB0byBzcGVlZCB1cCB0aGluZ3MsIHdp
dGggb25lIGpvYiBwZXIgYnVpbGRhYmxlCj4gPj4gY29uZmlndXJhdGlvbi4KPiA+Pgo+ID4+IEFz
IHN1Y2gsIHdlIHdpbGwgbmVlZCB0aGF0IHRlc3QtcGtnIG9ubHkgZXZlciBwcmVwYXJlcyB0aGUK
PiA+PiBjb25maWd1cmF0aW9uLCBhbmQgdGhhdCBpdCBkb2VzIG5vdCBidWlsZCB0aGVtLgo+ID4+
Cj4gPj4gQWRkIHN1Y2ggYSBtb2RlLCB3aXRoIGEgbmV3IG9wdGlvbiwgLS1wcmVwYXJlLW9ubHkK
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgo+ID4+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4g
Pj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4g
Pj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5k
LmJlPgo+ID4+Cj4gPj4gLS0tCj4gPj4gTm90ZTogbmFtaW5nIGlzIGhhcmQ7IG5hbWluZyBvcHRp
b25zIGlzIGhhcmRlcjsgbmFtaW5nIG9wdGlvbnMgd2l0aCBhCj4gPj4gdGVyc2UgdGVybSBpcyBl
dmVuIGhhcmRlcjsgbmFtaW5nIG9wdGlvbnMgd2l0aCBhIHRlcnNlIHRlcm0gdGhhdCBpcwo+ID4+
IHN0aWxsIG1lYW5pbmdmdWwgYW5kIGV4cGxhaW5zIHdoYXQgdGhlIG9wdGlvbiBkb2VzLCBpcyBl
dmVuIGhhcmRlciB5ZXQuCj4gPiAKPiA+ICBCdXQgZG9pbmcgaXQgaW5jb25zaXN0ZW50bHkgaXMg
ZWFzeSAoc2VlIGJlbG93KS4gOi0pCj4gPiAKPiA+ICBBbnl3YXksIHRoZXJlJ3MgYW4gZWFzeSBz
b2x1dGlvbiB0byB0aGF0ICh3aGljaCBJIGJlbGlldmUgd2Ugc2hvdWxkIGFwcGx5Cj4gPiBoZXJl
KTogZG9uJ3QgZGVmaW5lIGEgdGVyc2Ugb3B0aW9uLgoKQWgsIGJ1dCB0aGVyZSB3YXMgYSBtaXN1
bmRlcnN0YW5kaW5nOiBJIHdhcyByZWZlcmluZyB0byB0aGUgImxvbmcKb3B0aW9uIiB0aGF0IEkg
dHJpZWQgdG8ga2VlcCB0ZXJzZS4gSS5lLiBJIHN0YXJ0ZWQgb2ZmIHdpdGg6CiAgICAtLWp1c3Qt
Z2VuZXJhdGUtY29uZmlnLWZvci1sYXRlci11c2UtaW4tZ2l0bGFiLUNJLW9yLWFueW90aGVyLXN1
Y2gtQ0kKCmFuZCBldmVudHVhbGx5IHRyaWVkIHRvIHNob3J0ZW4gaXQgYXMgbXVjaCBhcyBwb3Nz
aWJsZSwgd2hpbGUgc3RpbGwKa2VlcGluZyB0aGUgbWVhbmluZywgc28gSSBlbmRlZCB1cCB3aXRo
IGp1c3Q6CiAgICAtLXByZXBhcmUtb25seQoKQXMgZm9yIHRoZSBzaG9ydCwgb25lLWNoYXIgb3B0
aW9uLCBpbmRlZWQuLCB3ZSBkb24ndCByZWFsbHkgbmVlZCBvbmUuCgo+ID4gIEkgdGhpbmsgdGVy
c2Ugb3B0aW9ucyBzaG91bGQgb25seSBiZSBkZWZpbmVkIGZvciBzdHVmZiB0aGF0IGEgaHVtYW4g
aGFzIHRvCj4gPiB0eXBlLiBJbiBzY3JpcHRzLCB0ZXJzZSBvcHRpb25zIHNob3VsZG4ndCBiZSB1
c2VkLCBiZWNhdXNlIGl0IG1ha2VzIGl0IGhhcmRlcgo+ID4gZm9yIHRoZSBwcm9ncmFtbWVyIHRv
IHVuZGVyc3RhbmQgd2hhdCB0aGUgY29tbWFuZCBkb2VzLgo+ID4gCj4gPiAgU2luY2UgcHJlcGFy
ZS1vbmx5IGlzIG1lYW50IG90IGJlIHVzZWQgYnkgc2NyaXB0LCBJIGRvbid0IHRoaW5rIGEgdGVy
c2Ugb3B0aW9uCj4gPiBpcyBuZWVkZWQuCj4gVGhhbmtzIGZvciB5b3VyIGFkdmljZS4gSW5kZWVk
IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCBhIHRlcnNlIG9wdGlvbi4KCldlIG5lZWQgYSB0ZXJzZSAi
bG9uZyBvcHRpb24iLCBidXQgd2UgZG9uO3QgbmVlZCBhIG9uZS1jaGFyICJzaG9ydApvcHRpb24i
LiA7LSkKClllcywgdGhpcyBpcyBjb25mdXNpbmcuLi4gOy0pCgo+ID4+ICsgICAgICAgICgtbHwt
LXByZXBhcmUtb25seSkKPiA+ICAgICAgICAgICAgICBeIC4uLiBidXQgdGhpcyBpcyBhbiAnbCch
Cj4gPiAgQ2xlYXJseSBzb21lb25lIGRpZG4ndCB0ZXN0IHdpdGggdGhlIHRlcnNlIG9wdGlvbi4g
Oi0pCgpZZXMsIEkgZGlkIHRlc3Qgd2l0aCB0ZXJzZSAibG9uZyBvcHRpb24iLCBidXQgbm90IHdp
dGggdGhlIG9uZS1jaGFyCiJzaG9ydCBvcHRpb24iLiBJbmRlZWQuIDstXQoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
