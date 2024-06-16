Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE829C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 11:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5261E4062A;
	Sun, 16 Jun 2024 11:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbykLA5jf9Np; Sun, 16 Jun 2024 11:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B5F407D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B5F407D2;
	Sun, 16 Jun 2024 11:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 411821BF2CF
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DB8B407D2
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4pHB7ovYjDl for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 11:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0BC34062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BC34062A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0BC34062A
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 11:22:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2EE0F13F861;
 Sun, 16 Jun 2024 13:22:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 13:22:29 +0200
Date: Sun, 16 Jun 2024 13:22:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <Zm7K9fkXOlLrekgS@landeda>
References: <20240613113924.3778837-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613113924.3778837-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718536952;
 bh=ayESbujvdsqI6GQUVYu13+KvETXB9r42EZm4tScUV9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5w52Me6n2QmjFkD6pOI1g1qs0NzUnHrp4GrOTt4w86jf1+Dc+XVc9cuTo5I48N2V
 dQNknbwKkF3RDgUPSJIMILFbwGnR0GP3e8IiuTMtMPj9bv4B2mxGNdp2mP+jyKQAOn
 eDG8W5spHUz8OJDXs6JAdl/owrr2ahTG0zlKRvH1DQG/Je1TCyPp3gLFRiOs34Zml2
 qEDrWqCr0o1rHRAI3JUuGURf1iviVWwQs4avbqPPOwOhnU2W+C/KSK4grIBsaPkMjM
 kNh7zFQXYBAPqqGMgyeM4EvuMCyXa6lkf3fVB0Y6WGv2UT6JKCm/702GHzOCi+Zvjj
 vUZghkhUXrP+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L5w52Me6
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build
 errors
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

WWVnb3IsIEFsbCwKCk9uIDIwMjQtMDYtMTMgMTM6MzkgKzAyMDAsIHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tIHNwYWtlIHRodXNseToKPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4gCj4gUGF0Y2hlcyB3ZXJlIHRha2VuIGZyb20gR2VudG9vOgo+
IAo+IGh0dHBzOi8vYnVncy5nZW50b28ub3JnLzkyMTQ4Nwo+IGh0dHBzOi8vZ2l0d2ViLmdlbnRv
by5vcmcvcmVwby9nZW50b28uZ2l0L3RyZWUvbmV0LWZ0cC9uY2Z0cC9maWxlcy9uY2Z0cC0zLjIu
Ny1maXgtY2xhbmcucGF0Y2gKPiAKPiBGaXhlczoKPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy8wNTg1NzhlYWU4ODVjZTZlMjA2YzI1YjVhMjRhYTExYjYyNWFkZjg4LwoK
VGhhbmsgeW91IGZvciB5b3VyIGVmZm9ydHMgaW4gaGVscGluZyBmaXggYnVpbGQgZmFpbHVyZXMh
IPCfkY0KCj4gU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgo+IC0tLQpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2Vp
Z25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggZGQxZmQzMWU4Ni4uNTJiNTA5MDAz
NCAxMDA2NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCj4gKysrIGIvLmNoZWNrcGFja2Fn
ZWlnbm9yZQo+IEBAIC0xMDY3LDYgKzEwNjcsOCBAQCBwYWNrYWdlL211c2wvMDAwMS1hdm9pZC1r
ZXJuZWwtaWZfZXRoZXIuaC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9tdXNs
LzAwMDItcGFja2FnZS1tdXNsLU1ha2Utc2NoZWR1bGVyLWZ1bmN0aW9ucy1MaW51eC1jb21wYXRp
Yi5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9uYW5vLzAwMDEtbGliLWdldHJh
bmRvbS5jLWZpeC1idWlsZC13aXRoLXVjbGliYy0xLjAuMzUucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWFtCj4gIHBhY2thZ2UvbmFub2NvbS8wMDAxLWZpeC1idWlsZC13aXRoLWdjYy0xMC5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KPiArcGFja2FnZS9uY2Z0cC8wMDAxLW5jZnRwLTMuMi43LWZpeC1n
Y2MxNC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiArcGFja2FnZS9uY2Z0cC8wMDAyLW5jZnRw
LTMuMi43LWZpeC1jbGFuZy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KCkRvIG5vdCBhZGQgYW4g
ZXhjbHVzaW9uIGZvciBuZXcgcGF0Y2hlczsgaW5zdGVhZCwgYWRkIGFuIFVwc3RyZWFtIHRhZy4K
CklmIHRoZSBwYXRjaGVzIHdlcmUgbm90IGZyb20gdXBzdHJlYW0sIHRoZW4gc3VibWl0IHRoZW0g
YW5kIGFkZCB0aGUgVVJMCnRvIHRoYXQgc3VibWlzc2lvbiBhcyBhbiBVcHN0cmVhbSB0YWc7IGlm
IHRoZSBwYXRjaGVzIGFyZSBub3Qgc3VpdGFibGUKZm9yIHVwc3RyZWFtLCB0aGVuIHN0YXRlIHNv
IGluIHRoZSBVcHN0cmVhbSB0YWcsIGFuZCBleHBsYWluIHdoeS4KClNlZSB0aGUgbWFudWFsOgog
ICAgaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2Fk
ZGl0aW9uYWxfcGF0Y2hfZG9jdW1lbnRhdGlvbgoKQ291bGQgeW91IHJld29yayB0aGlzIGFuZCBy
ZXN1Ym1pdCwgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
