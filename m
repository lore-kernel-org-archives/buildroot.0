Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68599C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 17:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99DC60F4A
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 17:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D99DC60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F70F40780;
	Fri, 17 Sep 2021 17:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmTTVpYl-PIu; Fri, 17 Sep 2021 17:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A14A40173;
	Fri, 17 Sep 2021 17:22:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 442761BF31D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 17:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4047F840AE
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 17:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gwfmto1RyWRO for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 17:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D995840A8
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 17:22:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99865610E9;
 Fri, 17 Sep 2021 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631899360;
 bh=s5uP+dULyp/S0F0gjQfGWCSfiJSdDxIt1CI/UMzs/l8=;
 h=In-Reply-To:References:From:Cc:Subject:To:Date:From;
 b=ZrujuQ2X84HeKIfFTGHfcI68YHRfCD98NGM02fB3B4uKL9EH5wVKmVNazFjGWieT5
 gNQ7Mv6OIR0q2YRkdQOwWscFQy64ri2EahM9tQubH7mnJwEEwL5RAQDm2uRR1eFe/S
 zWHOa68MBBFqteQIJtf3VGCT3r0wp5YiI7IAm1hGJFZac1PGlMuKAppzbw80CFDXoj
 IvE8nfi5Jixn4GPWWTHxjpMt89HSpJyZ5bW/wUxK0KPMn1DElVQa/joX2hX8dI+jE3
 2XD1TIj8iATLQ6yB7FUImcDnTZlON0xYnohGbYMfkfcT8cWlBt3Zw1aMP4PQc4Eirl
 +YhNaAx3yDUtA==
MIME-Version: 1.0
In-Reply-To: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
To: José Pekkarinen <jose.pekkarinen@unikie.com>, buildroot@buildroot.org
Message-ID: <163189935709.536094.10717640766848618610@kwain>
Date: Fri, 17 Sep 2021 19:22:37 +0200
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
Cc: José Pekkarinen <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gSm9zw6ksCgpRdW90aW5nIEpvc8OpIFBla2thcmluZW4gKDIwMjEtMDgtMzAgMTM6NDU6
MzEpCj4gVGhlIGN1cnJlbnQgcHJvY2Vzc2luZyBvZiB0aGUgbW9kdWxlcyBkb2Vzbid0IHdvcmsg
Zm9yCj4gY3VzdG9tIG1hZGUgcG9saWNpZXMgYXBwZW5kZWQgdGhyb3VnaCB0aGUgZXh0cmEgZGly
IG1lY2hhbmlzbSwKPiBzaW5jZSBzZWQgd29uJ3QgZmluZCBhIG1hdGNoIGZvciBjdXN0b20gbW9k
dWxlcywgaXQgd2lsbAo+IGNvbnRpbnVlIHdpdGhvdXQgdHJpZ2dlcmluZyBhbmQgZXJyb3IuIFRo
aXMgcGF0Y2ggcmVtb3Zlcwo+IGFsbCB0aGUgbW9kdWxlcyBmcm9tIG1vZHVsZXMuY29uZiBhbmQg
YWRkIHRoZW0gb25lIGJ5Cj4gb25lIHVzaW5nIFJFRlBPTElDWV9NT0RVTEVTIHZhbHVlcy4KCkkn
bSBmYWlsaW5nIHRvIHNlZSB3aGF0IHBhcnRpY3VsYXIgc2V0dXAgdGhlIGNoYW5nZSBiZWxvdyB3
b3VsZCBmaXguCgpDb3VsZCB5b3UgZWxhYm9yYXRlIG9uIHRoZSBhYm92ZT8gTWF5YmUgaW5jbHVk
aW5nIGNvbmZpZ3VyYXRpb24Kc25pcHBldHMgYW5kIGV4YW1wbGUgb2Ygc3VjaCBhIG1vZHVsZSAo
d2l0aCB0aGUgZmlsZSB0cmVlLCBzdGFydGluZyBmcm9tClJFRlBPTElDWV9FWFRSQV9NT0RVTEVT
X0RJUlMpLgoKVGhhbmtzIQpBbnRvaW5lCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JlZnBvbGlj
eS9yZWZwb2xpY3kubWsgYi9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsKPiBpbmRleCAw
MTk0NzA4YjM3Li4xYzBhMmMzMzg1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcmVmcG9saWN5L3Jl
ZnBvbGljeS5tawo+ICsrKyBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawo+IEBAIC04
NSw5ICs4NSw5IEBAIGVuZGVmCj4gICMgSW4gdGhlIGNvbnRleHQgb2YgYSBtb25vbGl0aGljIHBv
bGljeSBlbmFibGluZyBhIHBpZWNlIG9mIHRoZSBwb2xpY3kgYXMKPiAgIyAnYmFzZScgb3IgJ21v
ZHVsZScgaXMgZXF1aXZhbGVudCwgc28gd2UgZW5hYmxlIHRoZW0gYXMgJ2Jhc2UnLgo+ICBkZWZp
bmUgUkVGUE9MSUNZX0NPTkZJR1VSRV9NT0RVTEVTCj4gLSAgICAgICAkKFNFRCkgInMvID0gbW9k
dWxlLyA9IG5vL2ciICQoQEQpL3BvbGljeS9tb2R1bGVzLmNvbmYKPiArICAgICAgICQoU0VEKSAi
LyA9IG1vZHVsZS9kIiAkKEBEKS9wb2xpY3kvbW9kdWxlcy5jb25mCj4gICAgICAgICAkKGZvcmVh
Y2ggbSwkKHNvcnQgJChSRUZQT0xJQ1lfTU9EVUxFUykpLAo+IC0gICAgICAgICAgICAgICAkKFNF
RCkgIi9eJChtKSA9L2NcJChtKSA9IGJhc2UiICQoQEQpL3BvbGljeS9tb2R1bGVzLmNvbmYKPiAr
ICAgICAgICAgICAgICAgJChTRUQpICIvXiMgTW9kdWxlOiAkKG0pL2FcJChtKSA9IGJhc2UiICQo
QEQpL3BvbGljeS9tb2R1bGVzLmNvbmYKPiAgICAgICAgICkKPiAgZW5kZWYKPiAgCj4gLS0gCj4g
Mi4yNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
