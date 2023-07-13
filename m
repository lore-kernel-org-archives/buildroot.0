Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D51C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADBB40155;
	Thu, 13 Jul 2023 21:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADBB40155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7bZeOb8Xj9m; Thu, 13 Jul 2023 21:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0B640872;
	Thu, 13 Jul 2023 21:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0B640872
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4731BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 227DD4179F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227DD4179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpkxoB4IUp_X for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF394179A
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AF394179A
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:34:03 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1b055511f8bso735717fac.1
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 14:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689284042; x=1691876042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoge5cCtyjWlvH/+snmP/AofMEAeUFBzoetZ7LY2Vhk=;
 b=KHG8xjyZyhueN9Q1ME2Sv1/bJ+P4hhxnIX+Rzmwbn31GSnbxkNls4ZCEjkaGxHhbi/
 KFgjjA4oWwgwP/8Asb9vU8ZVcGbPnQUNG89qHgRTvaZscDcIXH8fl00uOYWXNC/cWPGx
 WZZ9Kzkhn/ARtJMvSUCdikNYnTptz7XOkSxaUD8t9+OTtK99ivHuS8G3SysjSxi7gsYE
 aeEHTngUIJBqZkiv2oCgmvxUq+XFaPOrt3tWcsIosC4oFdufT/+Vb2GO8NbmHc45zBC4
 HMgvX5/CcdFMZluKvgLKM++bMlfc/QVuM2M3+y/dJOhakkzcSx3ro8iiR6+wupm8iYXR
 2y/g==
X-Gm-Message-State: ABy/qLY4H++xAq5XWN7+9/A3AXtD9c2/0HfO0mFzQ4whPoH2cvQwUlS8
 qRBwr6//gphSKQviho8+LcLet0Dihev3TJ/Cx4e+u+2h
X-Google-Smtp-Source: APBJJlGe+9XXeqOyaUMVsN16s6ZfbpPfT2RmHRPQhMXNCHMA+K3SU9nf0Hd7KlhfippfstBeZEW6SS6m2h5EWlbeRj0=
X-Received: by 2002:a05:6871:b0d:b0:1b7:30eb:903f with SMTP id
 fq13-20020a0568710b0d00b001b730eb903fmr747434oab.3.1689284042083; Thu, 13 Jul
 2023 14:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230713075740.328213-1-james.hilliard1@gmail.com>
 <20230713221119.0c83afa4@windsurf>
In-Reply-To: <20230713221119.0c83afa4@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Jul 2023 15:33:50 -0600
Message-ID: <CADvTj4p7uuJRz2PskUD8jgLf72VNqLgs5_yexK11d=F=7jRXqw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689284042; x=1691876042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoge5cCtyjWlvH/+snmP/AofMEAeUFBzoetZ7LY2Vhk=;
 b=jYAiJPT37xn9BpgQMAO/Fc3Z03fh7UmYlarp8JJkwFkx5T0mH6y1pyLtaTom7SqC1k
 wTOomCSKW728BX4m51AZe2jUoB0RlihILz/0oeg8d5qdmcogcYq1ogtVMBBFPGIb1ALE
 Y2Fs2Y7Ra/Buw3Qfz8+GR1fLoaxOn4UKTzkaSDXFaSBpN6I59R6pQ57TvAeNh/07wMmK
 r9ag54/A9DRZ8rW+H3fhVOzsuTzYljI2ZcaENGJUOSmM1ycT1a9aT0faeDjfvdefGjL5
 5Sj5YG2BB8aSZi7f1DKHmLB8+DZxOZ+o9a3hUIXMWXGK/EV9vO6E2LI2lB3SCiGw0g4f
 n63g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jYAiJPT3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/strace: use bundled headers
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMjoxMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxMyBKdWwgMjAyMyAw
MTo1Nzo0MCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gVGhlcmUgaXMgYSBidWcgaW4gdGhlIGNvbmZpZ3VyZSBzY3JpcHQsIHdo
aWxlIHdlIGNvdWxkIGFwcGx5IHRoZQo+ID4gdXBzdHJlYW0gcGF0Y2hpbmcgZml4aW5nIHRoaXMg
YnVnIHRoZSBiZXR0ZXIgc29sdXRpb24gaXMgdG8gc3dpdGNoCj4gPiB0byB1c2luZyB0aGUgYnVu
ZGxlZCBoZWFkZXJzIGluc3RlYWQuCj4gPgo+ID4gVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0aGF0
IHN0cmFjZSBuZWVkcyB0aGUgaGVhZGVycyBvZiB0aGUgcnVubmluZwo+ID4ga2VybmVsIHJhdGhl
ciB0aGFuIHRob3NlIHRoYXQgd2VyZSB1c2VkIHRvIGJ1aWxkIHRoZSB0b29sY2hhaW4uCj4gPgo+
ID4gVGhlIHJ1bm5pbmcga2VybmVsIGlzIG9mdGVuIG1vcmUgcmVjZW50IHRoYW4gdGhlIG9uZSB1
c2VkIGluIHRoZQo+ID4gdG9vbGNoYWluIHNvIHdlIGRvIHdhbnQgdG8gdXNlIHRoZSBtb3JlIHVw
LXRvLWRhdGUgaGVhZGVycy4KPiA+Cj4gPiBBcyBzdWNoIHdlIHNob3VsZCB1c2UgdGhlIHN0cmFj
ZSBidW5kbGVkIGhlYWRlcnMgYXMgdGhleSB3aWxsIGJlCj4gPiB0aGUgbW9zdCB1cC10by1kYXRl
IGhlYWRlcnMuCj4KPiBCdXQgdGhlbiBpc24ndCB0aGVyZSBhIGNoYW5jZSB0aGF0IHRoZSBidW5k
bGVkIGhlYWRlcnMgYXJlIHRvbyAqcmVjZW50Kgo+IGNvbXBhcmVkIHRvIHRoZSBydW5uaW5nIGtl
cm5lbD8gV2hhdCBoYXBwZW5zIGluIHRoaXMgY2FzZT8KCkkgcHJlc3VtZSBzaW5jZSBzdHJhY2Ug
aXMgdHJhY2luZyBzeXNjYWxscyBtYWRlIGJ5IG90aGVyIGFwcGxpY2F0aW9ucyB0aGF0Cml0IHNo
b3VsZG4ndCBjYXVzZSBpc3N1ZXMgYXMgaXQgd291bGQgYmUgdGhlIHRyYWNlZCBhcHBsaWNhdGlv
biBjaG9vc2luZwp0aGUgc3lzY2FsbHMgdG8gbWFrZS4KCj4KPiBUaG9tYXMKPiAtLQo+IFRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
