Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80258C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DE5610CA
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29DE5610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD43605E9;
	Tue, 21 Sep 2021 13:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-cOwv9wx0Xm; Tue, 21 Sep 2021 13:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1CA6067D;
	Tue, 21 Sep 2021 13:42:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 094E81BF2F5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB406401F3
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GSM9MQ-eclg for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43EE5400C1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:42:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC8F461131;
 Tue, 21 Sep 2021 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632231772;
 bh=U4Dez75I/l4IVzFnNjbekLSelaUCmIOqIu4StPkkujw=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=Qm9OfZVP3ecO83q9azt1xKXtvFhsK52PltjXKtL3Q8F19kIBGXiwR4Z2ddm+FhVZY
 S2ZNQit4oUDm4T0fcLw1F/J2LUZoDAoh/0aeU7fu8+CchgQ4vgL5kGVMrDsH/Qsc2+
 KxXF/xkg6A/bfsgtF/8g70RpwJE9qc+I8xR9h2cZN2U3wYF2lazB033j6i11wrF74C
 PaN4DvDIpuKFv8ZeGm7XuV9HSDk9ENdg/5ZNmQwVjsdwKxdwyiII+245nchoFzeq6l
 1Fckn0s1KVb+4BfTFYwecvG25y9MZApC4DI8t25JzNbpv/c6yZYDh9HeAuEo00ex3c
 zyTurXcP4xvpA==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163223176981.4283.2007173106051805069@kwain>
Date: Tue, 21 Sep 2021 15:42:49 +0200
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

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIxIDE1OjMyOjMyKQo+IE9uIFR1ZSwg
U2VwIDIxLCAyMDIxIGF0IDEwOjEyIEFNIEFudG9pbmUgVGVuYXJ0IDxbMV1hdGVuYXJ0QGtlcm5l
bC5vcmc+Cj4gd3JvdGU6Cj4gCj4gSSB0ZXN0ZWQgdG9kYXkgdG8gYnVpbGQgdGhlIHN5c3RlbSB3
aXRoIGJ1aWxkcm9vdCAyMDIxLjA1LjIod2l0aG91dAo+IHRoZSBwYXRjaCkgYW5kIGl0IHJlcHJv
ZHVjZXMgZXhhY3RseSB0aGUgc2FtZSBiZWhhdmlvdXIsCj4gcG9saWN5L21vZHVsZXMuY29uZiBk
b2Vzbid0IHJlY2VpdmUgdGhlIGxpbmUgdG8gYWN0aXZhdGUgdGhlIHNlY3VyZQo+IG1vZHVsZSwg
YW5kIGlmIEkgc2VhcmNoIGluIHBvbGljeS5jb25mIG9yIHBvbGljeS4zMiB0aHJvdWdoIHNlc2Vh
cmNoIEkKPiBmaW5kIG5vIHNpZ24gb2YgdGhlIHBvbGljaWVzIGRlZmluZWQgaW4gdGhlIG1vZHVs
ZS4gIEknbGwgYXR0ZW1wdCB0aGUKPiB1cGdyYWRlIHRvIDIwMjEuMDgsIGJ1dCB0aGF0IHdpbGwg
cmVxdWlyZSBhIGJpdCBtb3JlIHRpbWUuCgpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4ganVzdCB0ZXN0
IHdpdGggbmV3ZXIgcmVmcG9saWN5IHZlcnNpb25zLCBvdXRzaWRlCm9mIEJ1aWxkcm9vdCBhbmQg
bG9vayBhdCB0aGUgZ2VuZXJhdGVkIG1vZHVsZXMuY29uZi4gVGhpcyB3aWxsIGdpdmUgdGhlCnNh
bWUgaW5mb3JtYXRpb24gYW5kIHNob3VsZCBiZSBlYXNpZXIgdG8gZG8uIChNeSBmZWVsaW5nIGlz
IHRoaXMgd29uJ3QKY2hhbmdlIGFuZCB3ZSdsbCBoYXZlIHRvIGRpdmUgaW50byB0aGUgcmVmcG9s
aWN5IGxvZ2ljIGZvciBlbmFibGluZwptb2R1bGVzIHdoZW4gcnVubmluZyAnbWFrZSBjb25mJyku
CgpBbnRvaW5lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
