Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F879C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CB56089B;
	Mon,  8 Apr 2024 19:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA_I2rNYYZhg; Mon,  8 Apr 2024 19:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C778260AFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C778260AFF;
	Mon,  8 Apr 2024 19:15:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD9F1BF2E5
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 164A860AFF
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JILu79JIqruV for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 19:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEFC06089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEFC06089B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEFC06089B
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 19:15:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D900113F8C6;
 Mon,  8 Apr 2024 21:15:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 21:15:06 +0200
Date: Mon, 8 Apr 2024 21:15:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZhRCOocYgxC-C5GL@landeda>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240407231500.2248bc22@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407231500.2248bc22@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712603711;
 bh=+HLzJOvqAqNKHXgy7anjOst1Na/7pia8i+YsK8aPqh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TluDITxULtYKXvbitmwLp2FzaCLpB/4VE+2HtQzqPLl57X9Wd3DIh0ccS3RDhHNfV
 pwIIIChZpJ0p3XajpF9VcgKcqwloWhZiC8A18UuG7l3OKO1FWmm87BkbKwdpOtaL6L
 i9YVtLfeawWkTzIxb9HGqIEgqhdMSltMhtk8TfMITaXD4aYPRK6qqLBE5xVxUdpJHd
 415950L0T0Jo/u/uuto/oKCFGt1e0yZXeCtAFx8cvaMIfULlB0rLMCHWg5KOA68sI2
 Whfd6KIqpD0TVlpZmUE0SXFmI3y5uFsZEmdQDZYIqvy9OK1VxHCwMOcUtQm3YsdX2X
 a3B945K0zjl2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TluDITxU
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzwrIsIEFsbCwKCk9uIDIwMjQtMDQtMDcgMjM6MTUgKzAyMDAsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gVGh1LCAgNCBBcHIgMjAyNCAxNDo0
MzoyNCArMDIwMAo+IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAZXNzZW5zaXVtLmNvbT4g
d3JvdGU6Cj4gCj4gPiBUaGlzIFJGQyBwYXRjaCBzZXJpZXMgcHJvcG9zZSB0byBhZGQgc3VwcG9y
dCBmb3IgdGhlIEN5Y2xvbmVEWAo+ID4gU0JPTSBmb3JtYXQuCj4gPiAKPiA+IFRoZXJlIGlzIGEg
Z3Jvd2luZyBuZWVkIHRvIGdlbmVyYXRlIFNCT00gZnJvbSBidWlsZHJvb3QKPiA+IGNvbmZpZ3Vy
YXRpb25zLiBSaWdodCBub3csIHRoZXJlIGFyZSBkaWZmZXJlbnQgc29sdXRpb25zIGF2YWlsYWJs
ZQo+ID4gZm9yIGJ1aWxkcm9vdCB1c2VycyBgc2hvdy1pbmZvYCwgYGxlZ2FsLWluZm9gIGFuZCBg
cGtnLXN0YXRzYC4KPiA+IFRoZXkgYWxsIGdlbmVyYXRlIHNpbWlsYXIgaW5mb3JtYXRpb24gKGBz
aG93LWluZm9gIHNob3dpbmcgbW9yZSkgYnV0Cj4gPiBpbiBhIGZvcm1hdCB0aGF0IGlzIHNwZWNp
ZmljIHRvIGJ1aWxkcm9vdC4KPiAKPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIgd29yayBvbiB0aGlz
LCB0aGlzIGlzIHJlYWxseSB1c2VmdWwuCj4gCj4gTXkgaW5pdGlhbCByZWFjdGlvbiBpcyB3aGV0
aGVyIGl0IGlzIHJlYWxseSB0aGUgcmlnaHQgc29sdXRpb24gdG8gaGF2ZQo+ICJtYWtlIiBzcGl0
IG91dCB0aGUgQ3ljbG9uZURYIGZvcm1hdCwgb3Igd2hldGhlciB3ZSBzaG91bGQgdXNlICJtYWtl
Cj4gc2hvdy1pbmZvIiwgYW5kIHRoZW4gcHJvY2VzcyB0aGUgSlNPTiBvdXRwdXQgdXNpbmcgc29t
ZSBQeXRob24gc2NyaXB0Cj4gdG8gZ2VuZXJhdGUgdGhlIEN5Y2xvbmVEWCBTQm9NLiBTb21lIG9m
IHRoZSBtYW5nbGluZyBuZWVkZWQgdG8gZ2VuZXJhdGUKPiB0aGUgQ3ljbG9uZURYIHN0dWZmIGlz
IGEgYml0IHRyaWNreSB0byB3cml0ZSBpbiBtYWtlLCBhbmQgaGF2aW5nIGEKPiB1dGlsaXR5IFB5
dGhvbiBzY3JpcHQgZG9pbmcgdGhhdCB3b3JrIGJhc2VkIG9uIGEgSlNPTiBpbnB1dCB3b3VsZCBJ
Cj4gYmVsaWV2ZSBiZSBzaW1wbGVyIGFuZCBlYXNpZXIgdG8gZXh0ZW5kLiBIYXZlIHlvdSBleHBs
b3JlZCB0aGlzIGlkZWE/Cj4gCj4gT2YgY291cnNlLCBpZiAibWFrZSBzaG93LWluZm8iIGRvZXNu
J3QgcHJvdmlkZSBlbm91Z2ggaW5mb3JtYXRpb24gaW4KPiB0aGUgZ2VuZXJhdGVkIEpTT04gYmx1
cmIsIHdlIGNhbiBhbHdheXMgZXh0ZW5kIHRoYXQgd2l0aCBtb3JlCj4gaW5mb3JtYXRpb24uCgpU
aGlzIHdhcyBhbHNvIG15IHJlYWN0aW9uOiB3aGVuIEkgaW50cm9kdWNlZCBzaG93LWluZm8sIHRo
ZSBnb2FsIHdhcyB0bwpleHBvc2UgZGV0YWlscyBhYm91dCB0aGUgY3VycmVudCBjb25maWd1cmF0
aW9uLCBzbyB0aGF0IGl0IGNvdWxkIGJlCmRpZ2VzdGVkIGJ5IHZhcmlvdXMgc2NyaXB0cyB0byBn
ZW5lcmF0ZSB0aGUgcmVxdWlyZWQgU0JPTSBmb3JtYXRzLgoKSSB3b3VsZCBwcmVmZXIgdGhhdCB3
ZSBkbyBnZXQgYSBzdXBwb3J0L3NjcmlwdC9jeWNsb25lZHggc2NyaXB0IChweXRob24Kb3Igd2hh
dGV2ZXIpIHRoYXQgZ2V0cyBzaG93LWluZm8gb3V0cHV0IGFuZCBnZW5lcmF0ZXMgQ3ljbG9uZURY
IFNCT00uCgo+ID4gVGhpcyBpcyBhIGZpcnN0IHNrZXRjaCBhbmQgSSBob3BlIHRvIGdhdGhlciBj
b21tZW50cyBvbiBmdW5jdGlvbmFsaXR5Cj4gPiB0aGUgY29tbXVuaXR5IHdhbnQgbWUgdG8gaW5j
bHVkZS4gSSBhbHJlYWR5IGhhdmUgYSB0b2RvIGxpc3Qgb2YgZmVhdHVyZQo+ID4gSSBwbGFuIHRv
IHdvcmsgb246Cj4gPiAKPiA+IC0gWyBdIEZpbmQgYSBzb2x1dGlvbiB0byBoYW5kbGUgdmVyc2lv
bmluZy4gVGhlICJ2ZXJzaW9uIiBwcm9wZXJ0eQo+ID4gICAgICAgc2hvdWxkIGJlIGluY3JlbWVu
dGVkIGV2ZXJ5IFNCT00gZ2VuZXJhdGlvbi4KPiAKPiBQZXJoYXBzIGVhc2llciB0byBoYW5kbGUg
dGhpcyB3aXRoIHRoZSBQeXRob24gc2NyaXB0IGFwcHJvYWNoIHByb3Bvc2VkCj4gYWJvdmUuCgpB
bHNvIEkgZG9uJ3Qgc2VlIGhvdyB0aGF0IHZlcnNpb25pbmcgd29ya3MuCgpJZiBpdCBnZXRzIGlu
Y3JlbWVudGVkIGV2ZXJ5dGltZSB0aGUgU0JPTSBpcyBnZW5lcmF0ZWQsIHRoZW4gKHdpdGggdGhl
CmN1cnJlbnQgc3RhdGUgb2YgdGhpcyBzZXJpZXMpOgoKICAgIGdpdCBjbG9uZSBibGFibGFibGEv
YnVpbGRyb290CiAgICBtYWtlIC1DIGJ1aWxkcm9vdCBmb29fZGVmY29uZmlnCiAgICBtYWtlIC1D
IGJ1aWxkcm9vdCBjeWNsb25lZHgKICAgIG1ha2UgLUMgYnVpbGRyb290IGN5Y2xvbmVkeAoKd291
bGQgeWllbGQgdHdvIGRpZmZlcmVudCB2ZXJzaW9ucywgYWx0aG91Z2ggbm90aGluZyBjaGFuZ2Vk
IGluLWJldHdlZW4uCgpBbHNvOgoKICAgIGdpdCBjbG9uZSBibGFibGFibGEvYnVpbGRyb290CiAg
ICBtYWtlIC1DIGJ1aWxkcm9vdCBmb29fZGVmY29uZmlnCiAgICBtYWtlIC1DIGJ1aWxkcm9vdAog
ICAgbWFrZSAtQyBidWlsZHJvb3QgY3ljbG9uZWR4CiAgICBybSAtcmYgYnVpbGRyb290CiAgICBn
aXQgY2xvbmUgYmxhYmxhYmxhL2J1aWxkcm9vdAogICAgbWFrZSAtQyBidWlsZHJvb3QgZm9vX2Rl
ZmNvbmZpZwogICAgbWFrZSAtQyBidWlsZHJvb3QKICAgIG1ha2UgLUMgYnVpbGRyb290IGN5Y2xv
bmVkeAoKd291bGQgaGF2ZSB0byB5aWVsZCB0d28gZGlmZmVyZW50IHZlcnNpb25zLCBidXQgd2hl
cmUgd291bGQgdGhlICJsYXRlc3QiCnZlcnNpb24gYmUgc3RvcmVkPyBDZXJ0YWlubHkgbm90IGlu
IHRoZSB1c2VyJ3MgaG9tZSBkaXJlY3RvcnkuCgpBbmQgYXJndWFibHksIGlmIHR3byBkaWZmZXJl
bnQgcGVvcGxlIGJ1aWxkIHRoZSBjeWNsb25lZHggU0JPTSBmb3IgdGhlCnNhbWUgcHJvamVjdCwg
b24gdHdvIGRpZmZlcmVudCBtYWNoaW5lcyAod2l0aCBhbiBvdGhlcndpc2UgaWRlbnRpY2FsCmVu
dmlyb25tZW50KSwgYXQgZGlmZmVyZW50IHRpbWUsIHRoZW4gaG93IGRvIHRoZXkga25vdyB0aGUg
dmVyc2lvbiB1c2VkCmJ5IHRoZSBvdGhlcj8gVGhpcyBhbHNvIGFwcGxpZXMgdG8gInR3byBDSSBw
aXBlbGluZXMiIGluc3RlYWQgb2YgInR3bwp1c2VycyIuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
