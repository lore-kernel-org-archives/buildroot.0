Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E41C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:52:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B2E60F26
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98B2E60F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B944403EE;
	Mon, 20 Sep 2021 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgV90B8k6upy; Mon, 20 Sep 2021 13:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C84CC403D8;
	Mon, 20 Sep 2021 13:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9B01BF297
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44DA740171
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZcD5JOl7eam for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 13:52:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90AE340101
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 13:52:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA6E460FA0;
 Mon, 20 Sep 2021 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632145968;
 bh=/LVpb5SbOi7xkWWDRB036dgPBd/AxNBXk6tdZmWhFio=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=mL92BKGTcLYRWI9EvR2QGIoH6UHFsEjUOvbCpndgvzllY7QA9fRdcVd0UdST7BNn9
 /A/bnumnivbxrt/TV1XTJO3SRYIvy7XOKtchIPKnr330qnkYfAhmMZCMIRkZqlVLar
 X2+k9wdNIhY53kUshrRf+3sm15uW4VK4fhlEL4CODnyMiRIXxvksrn4udvKguR2too
 W40Yf5+apEvoumjBMF0MOy/2o5ii3rJigbJSrKqPtU1rILqR/BX5CjNkql498w4KVj
 ikdC5XGn5MyQqE/RnA86ZBLFichg8J/sa+gpCJuftdru5FajNUMlGKIVpTPDhG/g78
 GNtpV0bh/HtNw==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163214596519.4283.5229631383777844599@kwain>
Date: Mon, 20 Sep 2021 15:52:45 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIwIDE1OjM5OjEzKQo+ICAgIE9uIE1v
biwgU2VwIDIwLCAyMDIxIGF0IDQ6MjEgUE0gQW50b2luZSBUZW5hcnQgPFsxXWF0ZW5hcnRAa2Vy
bmVsLm9yZz4KPiAgICB3cm90ZToKPiAKPiAgICAgIFRoZSBsb2dpYyBpcyB0aGUgZm9sbG93aW5n
IGluIEJ1aWxkcm9vdCBmb3IgZXh0cmEgbW9kdWxlczoKPiAKPiAgICAgIDEuIFRoZSBtb2R1bGVz
IGFyZSByc3luY2VkIGluIHBvbGljeS9tb2R1bGVzL2J1aWxkcm9vZC8uCj4gICAgICAyLiBJZiBu
b3QgYWxyZWFkeSB0aGVyZSwgYSBtZXRhZGF0YS54bWwgZmlsZSBpcyBhZGRlZC4KPiAgICAgIDMu
IFRoZSByZWZwb2xpY3kgYnVpbGQgc3lzdGVtIGlzIHVzZWRbMl0gdG8gZ2VuZXJhdGUgbW9kdWxl
cy5jb25mIHVzaW5nCj4gICAgICDCoCDCoGFsbCBtb2R1bGVzIG1hdGNoaW5nICdwb2xpY3kvbW9k
dWxlcy8qLyoudGUnLgo+ICAgICAgNC4gQWxsIG1vZHVsZXMgaW4gbW9kdWxlcy5jb25mIGFyZSBk
aXNhYmxlZCBhbmQgdGhlbiBvbmx5IHRoZSBvbmVzIGluCj4gICAgICDCoCDCoFJFRlBPTElDWV9N
T0RVTEVTIGFyZSBlbmFibGVkLgo+IAo+ICAgICAgSXQgbG9va3MgbGlrZSBtb3JlIG9mIGEgcmVm
cG9saWN5L21vZHVsZSBpc3N1ZSB0aGFuIGEgQnVpbGRyb290IG9uZToKPiAgICAgIHN0ZXBzIDEg
YW5kIDIgc2VlbSB0byB3b3JrLCBidXQgbm90IHN0ZXAgMy4gSWYgeW91IHJldHJpZXZlIHRoZQo+
ICAgICAgcmVmcG9saWN5IHByb2plY3Qgb3V0c2lkZSBvZiBCdWlscm9vdCBhbmQgbWltaWMgdGhl
IGFib3ZlIHN0ZXBzLCBhcmUKPiAgICAgIHlvdXIgbW9kdWxlcyBsaXN0ZWQgaW4gbW9kdWxlcy5j
b25mPyBJZiBub3QgdGhhdCBtaWdodCBiZSBhIGdvb2QKPiAgICAgIHN0YXJ0aW5nIHBvaW50LiBJ
IGRvbid0IGhhdmUgYSBiZXR0ZXIgaWRlYSBmb3Igbm93Li4uCj4gCj4gICAgSSBkaWQsIGFuZCB0
aGlzIGlzIGhvdyBtb2R1bGVzLmNvbmYgbG9va3MgbGlrZSB3aGVuCj4gICAgaXQgY29tZXMgdG8g
dGhlIHNlY3Rpb24gb2YgbXkgbW9kdWxlOgo+ICAgIFsuLi5dCj4gICAgIyBNb2R1bGU6IHhzY3Jl
ZW5zYXZlcgo+ICAgICMKPiAgICAjIE1vZHVsYXIgc2NyZWVuIHNhdmVyIGFuZCBsb2NrZXIgZm9y
IFgxMS4KPiAgICAjIMKgCj4gICAgeHNjcmVlbnNhdmVyID0gbW9kdWxlCj4gCj4gICAgIyBMYXll
cjogYnVpbGRyb290Cj4gICAgIyBNb2R1bGU6IHNlY3VyZQo+ICAgICMKPiAgICAjIExheWVyOiBr
ZXJuZWwKPiAgICAjIE1vZHVsZTogc3RvcmFnZQo+ICAgIFsuLi5dwqAKPiAKPiAgICBOb3csIHJl
YWRpbmcgdGhlIElOU1RBTEwgZmlsZSwgaXQgc2F5cyB0aGUgZm9sbG93aW5nOgo+ICAgIElmIHlv
dSBkbyBub3QgaGF2ZSBhIG1vZHVsZXMuY29uZiwgb25lIGNhbiBiZSBnZW5lcmF0ZWQ6Cj4gCj4g
ICAgwqAgwqBtYWtlIGNvbmYKPiAKPiAgICBUaGlzIHdpbGwgY3JlYXRlIGEgZGVmYXVsdCBtb2R1
bGVzLmNvbmYuCj4gCj4gICAgVGhpcyBkZWZhdWx0IG1ha2VzIG1lIHRoaW5rIGl0IGltcGxpZXMg
eW91J2QgbmVlZCB0bwo+ICAgIGFjdGl2YXRlIHlvdXIgb3duIG1vZHVsZXMgaWYgdGhleSBhcmUg
dGhlcmUsIGFuZCB3aHkgSSBiZWxpZXZlCj4gICAgYnVpbGRyb290IHdvdWxkIHJlcXVpcmUgdGhh
dCBleHRyYSBsb2dpYy4gcmVmcG9saWN5IHByb2plY3QgbWF5Cj4gICAgc3RhbmQgZm9yIGxldHRp
bmcgdXNlcnMgYWRkIHRoZWlyIG93biwgYnV0IG5vdCB0YWtpbmcgcGFydCBvbgo+ICAgIGl0IHRo
ZWlyc2VsdmVzLgoKUmVwcm9kdWNpbmcgbG9jYWxseSB0aGUgbW9kdWxlcyB3ZXJlIGNvcnJlY3Rs
eSBsaXN0ZWQgYW5kIGVuYWJsZWQuCkhvd2V2ZXIgbG9va2luZyBhdCB0aGUgbW9kdWxlcy5jb25m
IGdlbmVyYXRlZCBvbiB5b3VyIG1hY2hpbmUsIHlvdXIKbW9kdWxlcycgZG9jdW1lbnRhdGlvbiBp
cyBpbmNsdWRlZCBidXQgdGhlIG1vZHVsZXMgYXJlbid0IGVuYWJsZWQgKGFzCm1vZHVsZXMpIGJ5
IGRlZmF1bHQuIFRoZXJlIG1pZ2h0IGJlIHNvbWUgcnVsZXMgaW4gdGhlIHJlZnBvbGljeSBidWls
ZApzeXN0ZW0gdGhhdCBjYW4gZXhwbGFpbiBzdWNoIGEgZGlmZmVyZW5jZS4KCkkgdGhpbmsgdGhl
IGlzc3VlIGNvbWVzIGRvd24gdG8gdW5kZXJzdGFuZGluZyBob3cgbW9kdWxlcyBhcmUgc2VsZWN0
ZWQKdG8gYmUgZW5hYmxlZCBieSBkZWZhdWx0IChvciBub3QgZW5hYmxlZCksIGFuZCB3aHkgeW91
ciBtb2R1bGVzIGFyZQppbXBhY3RlZC4gKFRoZW4gdGhlcmUgbWlnaHQgYmUgc29tZXRoaW5nIHRv
IGltcHJvdmUgaW4gQnVpbGRyb290KS4KClRoYW5rcyEKQW50b2luZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
