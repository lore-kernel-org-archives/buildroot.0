Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F0FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49476135F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B49476135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1DF40867;
	Thu, 21 Oct 2021 17:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgVZm1r0_GNa; Thu, 21 Oct 2021 17:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70064087A;
	Thu, 21 Oct 2021 17:46:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4E041BF955
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A291D4087A
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 756QaX4tNUCs for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 17:46:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D43840867
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 17:46:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8e5:5688:10fe:8b80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C412078038B;
 Thu, 21 Oct 2021 19:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634838383;
 bh=Wd0AEj72Jy092MT5xwX00HvhbKvfJFFuXRh8kEaa0uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3li6bZwER/+rCJxyQOE9YsteDfx/B7jUZkcOlwJKrKU11Kki6lHBwZI59pS9lcyQ
 lEKMzRHgyN3BjSDJrFHO3LMSTQ25TT+xx6ux7yRuVbChALJpp92qCbGBq6gtdr7N3s
 OCrGLi4vC7rle6nBGNSxISeGi+k6otLSiRe3sbB00cwY0BEPzOVcFgNrw65IyQXz1p
 7QvfMoXk+bgasjZ+DmdIiPRi8nEooKEkbLJvKDP0CCkHjCmIFHpkgjRy8+qDnlWhN4
 NQmkwbLbn1EMX+u5yItYKWMvMuIU+cu9K3vL1nx1pgzp1YwryJCF7ljl24yx/s2vZZ
 aj9JgzLIo4xyA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 19:46:16 +0200
Date: Thu, 21 Oct 2021 19:46:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Will Eccles <will@eccles.dev>
Message-ID: <20211021174616.GD2400@scaer>
References: <20211018203038.32453-1-will@eccles.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018203038.32453-1-will@eccles.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/openssh: reset umask when init
 script exits
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2lsbCwgQWxsLAoKT24gMjAyMS0xMC0xOCAxNjozMCAtMDQwMCwgV2lsbCBFY2NsZXMgc3Bha2Ug
dGh1c2x5Ogo+IFM1MHNzaGQgdXBkYXRlcyB1bWFzayB0byAwNzcsIGJ1dCBkb2VzIG5vdCByZXNl
dCBpdCB3aGVuIGl0IGV4aXRzLiBUaGlzCj4gcmVzdWx0cyBpbiB0aGUgcm9vdCB1c2VyJ3MgdW1h
c2sgYmVpbmcgY29uZmlndXJlZCBpbmNvcnJlY3RseSAoYXNzdW1pbmcKPiBhIGRlZmF1bHQgb2Yg
MDIyIG9yIG90aGVyd2lzZSkuIFRoaXMgcGF0Y2ggYWRkcyBhIHRyYXAgdG8gcmVzZXQgdW1hc2sK
PiB3aGVuIHRoZSBzY3JpcHQgZXhpdHMuIFRoaXMgaXMgY29udmVuaWVudCBvbiBzeXN0ZW1zIHdo
ZXJlLCBmb3IgZXhhbXBsZSwKPiBjb25maWdzIHN1Y2ggYXMgL2V0Yy9wcm9maWxlIG1heSBub3Qg
YmUgc291cmNlZCBieSB0aGUgcm9vdCB1c2VyLiBJdCBtYXkKPiBhbHNvIHByZXZlbnQgaXNzdWVz
IHdpdGggb3RoZXIgaW5pdCBzY3JpcHRzIHdoaWNoIG1heSBpbmhlcml0IHRoaXMgdW1hc2sKPiB1
bmludGVudGlvbmFsbHksIGxlYWRpbmcgdG8gaW1wcm9wZXIgcGVybWlzc2lvbnMgZWxzZXdoZXJl
IGluIHRoZQo+IHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsIEVjY2xlcyA8d2lsbEBl
Y2NsZXMuZGV2PgoKQmVzaWRlcyB3aGF0IEFybm91dCBzYWlkIChhbmQgd2hpY2ggSSBhZ3JlZSB3
aXRoKSwgSSBhbSBub3Qgc28gc3VyZSB0aGlzCnBhdGNoIGlzIGV2ZW4gdGVjaG5pY2FsbHkgY29y
cmVjdC4uLiBTZWUgYmVsb3cuLi4KCj4gLS0tCj4gQmFja3BvcnQgdG86IDIwMjEuMDIuNiwgMjAy
MS4wOC4xCj4gKFRoZXNlIGFyZSB0aGUgcmVsZWFzZXMgb24gYnVpbGRyb290Lm9yZyBhcyBvZiB0
aGlzIHdyaXRpbmcsIGJ1dCBhcyBmYXIKPiBhcyBJIGNhbiB0ZWxsLCBldmVuIHJlbGVhc2VzIGFz
IGZhciBiYWNrIGFzIDIwMTIgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLikKPiAtLS0KPiAgcGFja2Fn
ZS9vcGVuc3NoL1M1MHNzaGQgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQgYi9wYWNrYWdlL29w
ZW5zc2gvUzUwc3NoZAo+IGluZGV4IDIyZGE0MWQxY2EuLjk0Y2Y0YzE0ZTggMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQKPiArKysgYi9wYWNrYWdlL29wZW5zc2gvUzUwc3No
ZAo+IEBAIC02LDYgKzYsOCBAQAo+ICAjIE1ha2Ugc3VyZSB0aGUgc3NoLWtleWdlbiBwcm9nYW0g
ZXhpc3RzCj4gIFsgLWYgL3Vzci9iaW4vc3NoLWtleWdlbiBdIHx8IGV4aXQgMAo+ICAKPiArIyBS
ZXNldCB1bmFtZSBhdCBleGl0Cj4gK3RyYXAgInVuYW1lICQodW5hbWUpIiBFWElUCgpUaGlzIGRv
ZXMgbm90IGV2ZW4gZG8gd2hhdCB5b3Ugc2FpZCBpdCBkb2VzLiBUaGlzIGlzICd1bmFtZScsIG5v
dAondW1hc2snLi4uCgpGdXJ0aGVybW9yZSwgdGhlIGFib3ZlIGNvZGUgd291bGQgZmFpbCBhbnl3
YXk6CgogICAgJCB1bmFtZSAkKHVuYW1lKTsgZWNobyAkPwogICAgdW5hbWU6IGV4dHJhIG9wZXJh
bmQg4oCYTGludXjigJkKICAgIFRyeSAndW5hbWUgLS1oZWxwJyBmb3IgbW9yZSBpbmZvcm1hdGlv
bi4KICAgIDEKClNvLCBpZiB0aGlzIHZlcnkgcGF0Y2ggbWFrZXMgaXQgd29yayBmb3IgeW91LCB0
aGVuIHlvdXIgaXNzdWUgaXMgbm90CmFib3V0IHVtYXNrIGJlaW5nIHNldCBiZWxvdy4uLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIHVtYXNrIDA3Nwo+ICAKPiAgc3RhcnQoKSB7Cj4gLS0g
Cj4gMi4zMy4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
