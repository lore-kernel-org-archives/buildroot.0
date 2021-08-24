Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6887C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 00:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADC46103C
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 00:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ADC46103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A29124002B;
	Wed, 25 Aug 2021 00:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URSpg5mj4Wrx; Wed, 25 Aug 2021 00:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02266400C1;
	Wed, 25 Aug 2021 00:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 633A41BF9BD
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 00:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5847E42548
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 00:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEcQ-J9CoRoR for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 00:06:51 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd15186.aruba.it (smtpcmd15186.aruba.it [62.149.156.186])
 by smtp4.osuosl.org (Postfix) with ESMTP id 067934251F
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 00:06:50 +0000 (UTC)
Received: from smtpclient.apple ([89.164.5.109])
 by Aruba Outgoing Smtp  with ESMTPA
 id IgKUm3nVpGRi4IgKUm6Iia; Wed, 25 Aug 2021 01:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629849584; bh=x8QJ4UbSfvJK+2KV2foEC+jNVJrsWxJXslrxoZCFVjM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Wr24HTbjBtg8l83qTAFxdcFaXKptLSGWBb8AuBgy22z7hB7CwWKiHDwPDY1GFb+EH
 L+okMcCwW26wVtHlGdkIjiqlaY7VPT3yS8RGUQprF99x+Uok3YFOVEWVAhdE3C5Pda
 tmeKfgqmmS8kqHpJSqRg6blWMUP8ZDLkwwFPQmx8qtGi9P8HcHa9bQYdDzOtB7F6Ye
 4ryN5detxVxKPucWXvaopYLRcdXfxoLe9nfDeg6PwXlvDaWif2MEbxFGHGhIq/hx9W
 onVZPbWxZJ+YPtfFquXUajk1f3xl1nNwBsmM30Z9is6JFkgI2Gt0KtA/ADYb2gG29T
 8f3mjIwqden/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 25 Aug 2021 01:59:41 +0200
Message-Id: <786439DF-BDB6-48DC-A913-66DAFC24CD3F@benettiengineering.com>
References: <98467939-bbe9-17c7-eba2-531e039be28f@petri.us>
In-Reply-To: <98467939-bbe9-17c7-eba2-531e039be28f@petri.us>
To: Jonah Petri <jonah@petri.us>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4xfEzctnDv/ctDa0n9PFPQQEMjPvNNCseIb9nw4TAUoPlnMTqmmQKLesrAyxjK1YHnibZm2CVGGsQxyBcDHCf0GWdkvTeulmN+1dpc/CAuZf2y67c7iq4I
 YPq+PtdlsMFH+OI91qJd004VQIz9+MT4ZBar2Vg3GbP2QHyNLCQk/dDytAJxxBGCgZ8G01X5LqMFszNRfOhw96+cjJXjc8oOhS5Ye/B93YLCLUx6tb5iWJ01
 AmN8UCsJ/FcSThDBq9dfPXkC/E3qEqb1cnlxmKfASoX3gv1BmxpHyjUgAeiSiKk3j/PQHdSbMulHez+PJ8QoaHKnTACqRroPscXsxqn8dP4MAm1Bj52FabLa
 TynCM76DhjwgQKiklRrxGltyl2cwFQ==
Subject: Re: [Buildroot] [PATCH] toolchain: handle toolchains with multiple
 ld*.so.* files
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgSm9uYWgsCgo+IElsIGdpb3JubyAyNSBhZ28gMjAyMSwgYWxsZSBvcmUgMDA6MzgsIEpvbmFo
IFBldHJpIDxqb25haEBwZXRyaS51cz4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPj4gT24gOC8yNC8y
MSA1OjAyIFBNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiBIZWxsbywKPj4gCj4+IE9uIFR1
ZSwgMjQgQXVnIDIwMjEgMTY6MzU6MzYgLTA0MDAKPj4gSm9uYWggUGV0cmkgPGpvbmFoQHBldHJp
LnVzPiB3cm90ZToKPj4gCj4+PiBTb3JyeSBmb3IgdGhlIG1pc3NpbmcgU09CIC0gSSB3aWxsIHJl
c3VibWl0LiAgVGhlIGluc3RydWN0aW9ucyBvbgo+Pj4gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rv
d25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjc3VibWl0dGluZy1wYXRjaGVzCj4+PiBtaWdodCBu
ZWVkIGEgbW9kaWZpY2F0aW9uLCBhcyBJIGZvbGxvd2VkIHRoZW0gcHJlY2lzZWx5LCBJIHRoaW5r
ISBFeHBlY3QKPj4+IGEgdjIgc2hvcnRseSB3aXRoIGEgU09CLgo+PiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ggYW5kIGdvaW5nIHRocm91Z2ggb3VyIG1hbnVhbC4gSWYgeW91IHRoaW5rCj4+IGFueXRo
aW5nIGlzIG1pc3NpbmcsIHRoZSBtYW51YWwgc291cmNlIGNvZGUgaXMgaW4gZG9jcy9tYW51YWwv
LCBzbyB5b3UKPj4gY2FuIGVhc2lseSBzZW5kIGEgcGF0Y2guCj4+IAo+PiBIb3dldmVyLCBJIHRo
aW5rIHRoaXMgcmVxdWlyZW1lbnQgZm9yIGEgU2lnbmVkLW9mZi1ieSBpcyBjbGVhcmx5IGluIG91
cgo+PiBpbnN0cnVjdGlvbnMuIFNlY3Rpb24gMjIuNS4xIG9mIG91ciBtYW51YWwgaGFzOgo+IAo+
IEhpIFRob21hcywKPiAKPiBZZXMsIHlvdSdyZSByaWdodCwgdGhlIHJlcXVpcmVtZW50IGlzIHRv
dGFsbHkgY2xlYXIuICBJIGhhdmUgc29tZSBlcnJvciBpbiBteSB1bmRlcnN0YW5kaW5nIG9mIGBn
aXQgc2VuZC1lbWFpbGAuICBJJ2xsIHN1Ym1pdCBhIGNsYXJpZmljYXRpb24gdG8gdGhlIG1hbnVh
bCBvbmNlIEkgbmFycm93IGRvd24gZXhhY3RseSB3aGF0IHdlbnQgd3JvbmcuCgpJIHRoaW5rIHRo
YXQgLi91dGlscy9nZXQtZGV2ZWxvcGVycyBpbiBidWlsZHJvb3QgZm9sZGVyIGNhbiBoZWxwIHlv
dS4KVHJ5IHRvIGNyZWF0ZSB0aGUgcGF0Y2ggd2l0aDoKZ2l0IGZvcm1hdC1wYXRjaCAtcyAtTSAt
byAuIC0xCmFuZCB0aGVuOgouL3V0aWxzL2dldC1kZXZlbG9wZXJzIDAwMDEteW91ci1wYXRjaC5w
YXRjaAoKVGhhdCB3aWxsIGdpdmUgeW91IHRoZSBnaXQgc2VuZC1tYWlsIGNvbW1hbmQgZW50aXJl
bHkgdG8gc2VuZCB5b3VyIHBhdGNoLiBBbmQgdGhlbiB5b3UgYXBwZW5kIHlvdXIgcGF0Y2ggbmFt
ZSB0byB0aGUgY29tbWFuZC4KCkJlc3QgcmVnYXJkcwpHaXVsaW8gQmVuZXR0aQoKPiAKPiBUaGFu
a3MgZm9yIGFsbCB5b3VyIHdvcmssCj4gCj4gSm9uYWgKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
