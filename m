Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D6C3ABA0
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 15:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEEF94024C;
	Sun, 15 Sep 2024 15:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xya934qGvtfk; Sun, 15 Sep 2024 15:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAAB404F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBAAB404F8;
	Sun, 15 Sep 2024 15:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0051BF239
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 15:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A74581266
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 15:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv6yqlPMl_w6 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 15:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6175C8116A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6175C8116A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6175C8116A
 for <buildroot@busybox.net>; Sun, 15 Sep 2024 15:05:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.92])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5D0D72003C6;
 Sun, 15 Sep 2024 17:05:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Sep 2024 17:05:50 +0200
Date: Sun, 15 Sep 2024 17:05:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zub3zqFqfAUlhCvH@landeda>
References: <20240407144250.7558-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407144250.7558-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726412755;
 bh=VsNgcBGZhsbtLk95NW7EX4+K01Y/JX1eS9JhVdBdn40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fpn31BrkKbetYa92YyqcVcGN0xLVEwY/mINTuJdJBN+EGxetllGCBhFnxCdlbvgfU
 L+YBrQGwL6X8xI0fpKW+/letk4luxTivKdZmT4VMcnp7y/jrZXnUtQ35mObuIppfT6
 A4QAkw+qCYYv9kWMngNEkK0D68aFRkvSRpWRM3pi3Z0/OkpgH7ktvOLWAIlxECfVEk
 uKwyjnS8Kwt5sggfuq4HCZTyxp+I+LB0FmOyb80lY5dnrAWRejVrT1SnXY508CN28t
 J7YPMWpFA8N7Ou6t058+WNVEJCS5CsT8q0jLau3Ayl5+67ocMo0YACzCvxgM/VGG7b
 ROY1/hacEdsSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fpn31Brk
Subject: Re: [Buildroot] [RFC PATCH 0/2] PURL pkg:cpan
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
Cc: buildroot@busybox.net, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBhbGwsCgpPbiAyMDI0LTA0LTA3IDE2OjQyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFRoaXMgc2VyaWUgZ29lcyBvbiB0aGUgdG9wIG9mIHNlcmllICJT
dXBwb3J0IFNCT00gaW4gQ3ljbG9uZURYIGZvcm1hdCIKPiBJdCBoYW5kbGVzIFBVUkwgZm9yIHRo
ZSBDUEFOIChQZXJsIHBhY2thZ2UgbWFuYWdlcikKCkFmdGVyIGRpc2N1c3NpbmcgdGhlIFBVUkwg
dG9waWMgYXQgdGhlIGRldmVsb3BwZXJzIGRheXMsIGJlY2F1c2Ugd2UgZG8Kc2VlIGEgZGlyZWN0
IHVzZSBmb3IgdGhvc2UgZm9yIG5vdzogdGhlIG9ubHkgY29uc3VtZXIgb2YgU0JPTS1saWtlIHdl
CmlkZW50aWZpZWQsIGRlcGVuZGVuY3ktdHJhY2ssIGRvZXMgbm90IGV2ZW4gbWFrZSB1c2Ugb2Yg
UFVSTHMgaW5mby4KCkJ1dCBhdCBsZWFzdCwgd2Uga25vdyBpdCdzIGdvaW5nIHRvIGJlIHJlbGF0
aXZlbHkgZWFzeXQgdG8gaGF2ZSBQVVJMIGZvcgpwZXJsIHBhY2thZ2VzLgoKUmVnYXJkcywKWWFu
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
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
