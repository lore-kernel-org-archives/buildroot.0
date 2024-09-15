Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB1C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1DF940012;
	Sun, 15 Sep 2024 14:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ks3u4aWzCcFS; Sun, 15 Sep 2024 14:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC26B402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC26B402BC;
	Sun, 15 Sep 2024 14:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA96E1BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A65744059A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCRERJsO1NSA for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 842FE40352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842FE40352
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 842FE40352
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:18:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.92])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7C55C2003F7;
 Sun, 15 Sep 2024 16:18:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Sep 2024 16:18:26 +0200
Date: Sun, 15 Sep 2024 16:18:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZubssqRnLr2bP9nd@landeda>
References: <20240914152323.2630539-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914152323.2630539-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726409914;
 bh=YmBKtqQRehcDv9YpoH+20++2M2Im0sONG5nB0yuMRkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D26tuygzkIn7KVx6QoTzg33ug+8HsZwG+SydB3TTj16+mRlAI2YEWIILTzrTDwJn3
 sM0hQGm2ymBxhzJ8WhQTESyMJRrrxPTbw4MxBokdeIR9H92J3UjyO9Tjy7pjCA5ibI
 dudWhJarueV8yNhDCk90nIIAVTUAAreAVF07hqtvfouwEMk04UtbyyJPsCaUmBJqhe
 8mWsBT3h8AQY/HDLh0VwN4t9J9Qxdodj/CMqrRxgSXVU9Y3GSZnc5CnGbMhB6QIbwD
 8X2dzTyFDFtqdC3Wa0J1qgMoBundkCdc+a1MtrHvEL2y/Mg/P8jMUxwfkpi4Zz4uT3
 W6YlFNtgwZIzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D26tuygz
Subject: Re: [Buildroot] [PATCH 0/2] Add go-bin virtual package to go
 providers
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDI0LTA5LTE0IDE3OjIzICswMjAwLCBUaG9tYXMgUGVyYWxlIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFByZXZpb3VzIHBhdGNoIHNldCBhZGRpbmcgJ2dv
LWJpbicgZmFpbGVkIHRoZSB0ZXN0cyBpbiBuZXdlciBnbyB2ZXJzaW9uCj4gYmVjYXVzZSBvZiBp
bGxlZ2FsIGluc3RydWN0aW9ucy4KPiAKPiBUaGlzIHBhdGNoIHNldCBmaXggdGhlIGNyb3NzLWNv
bXBpbGF0aW9uIGlzc3VlIGNvbWluZyBmcm9tIHRoZSAnZ28tYmluJwo+IHRoaXMgd2FzIHNvbHZl
ZCBieSBzcGVjaWZpY2FsbHkgbWVudGlvbm5pbmcgdGhlIEdPQVJNIHZlcnNpb24gaW4KPiBlbnZp
cm9ubWVudCB2YXJpYWJsZSB3aGVuIGJ1aWxkaW5nIGEgZ28gcGFja2FnZSBmb3IgdGhlIHRhcmdl
dAo+IChgSE9TVF9HT19UQVJHRVRfRU5WYCkuCgpJIGFwcGxpZWQgdGhlIHNlcmllcyB3aXRoIGEg
ZmV3IGNoYW5nZXMsIHNlZSB0aGUgY29tbWl0cy4KCkkgYWxzbyBhZGRlZCB0aHJlZSBwcmVwYXJh
dG9yeSBjb21taXRzOwogICAgNTU5YmIzM2FlNyBzdXBwb3J0L3Rlc3Rpbmc6IGRvIG5vdCB1c2Ug
cy5iLm8KICAgIGU5YjA4OTNhOGUgcGFja2FnZS9nby9nby1zcmM6IHNoYXJlIGRvd25sb2FkIGRp
cmVjdG9yeSB3aXRoIGdvCiAgICA4OTMxZTlmNTM0IHN1cHBvcnQvdGVzdGluZzogc3dpdGNoIGdv
LXNyYyB0byB1c2UgZmxhbm5lbAoKVGhhbmtzIGEgbG90IGZvciB0aGlzIHdvcmshIPCfkY0KClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFRob21hcyBQZXJhbGUgKDIpOgo+ICAgcGFja2FnZS9n
by9nby1iaW46IG5ldyBob3N0LWdvIHByb3ZpZGVyCj4gICBzdXBwb3J0L3Rlc3Rpbmc6IGFkZCB0
ZXN0cyBmb3IgR28gcHJvdmlkZXJzCj4gCj4gIHBhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QgICAg
ICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrLS0tLS0tCj4gIHBhY2thZ2UvZ28vZ28t
YmluL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgfCAxMyArKysrKysrKysrKysrCj4gIHBhY2thZ2Uv
Z28vZ28tYmluL2dvLWJpbi5oYXNoICAgICAgICAgICAgfCAgOCArKysrKysrKwo+ICBwYWNrYWdl
L2dvL2dvLWJpbi9nby1iaW4ubWsgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysr
KysKPiAgcGFja2FnZS9nby9nby5tayAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4g
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ28ucHkgfCAxNCArKysrKysrKysr
KysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJpbi9Db25maWcuaW4uaG9zdAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1iaW4vZ28tYmluLmhhc2gKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYmluL2dvLWJpbi5tawo+IAo+IC0tIAo+IDIu
NDYuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
