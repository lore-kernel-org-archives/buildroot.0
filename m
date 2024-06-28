Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A59C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FAB84503;
	Fri, 28 Jun 2024 13:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjyyTY5WSG17; Fri, 28 Jun 2024 13:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45AC84505
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D45AC84505;
	Fri, 28 Jun 2024 13:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE841BF2F9
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9448B84505
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 13:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCiaJrU3VUn6 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 13:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92D9984503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D9984503
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92D9984503
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 13:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB182240006;
 Fri, 28 Jun 2024 13:55:48 +0000 (UTC)
Date: Fri, 28 Jun 2024 15:55:48 +0200
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Message-ID: <20240628155548.78869c72@kmaincent-XPS-13-7390>
In-Reply-To: <8ceaf29cebab41cbb6056da65d3c1c67@foss.st.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>
 <8ceaf29cebab41cbb6056da65d3c1c67@foss.st.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719582949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4W8XJWSd+nrmIubYNNcW9Tm2UePSN0oel4R+KxEOjw=;
 b=Wi5B9UUCsixEnxfWkPw7jQ2S1bEy0bMqMaG7fx+nmN1JG8HjZbOBcGT+74OdgBLNzSVLjy
 tgEtRp8dhqBMKIPnlujx63+5ipOb45GTcn5bHzi7C2h8l6IE/LScwXoZ5haB2buFcoZi1B
 ZQcd5ePNGuUtk4hB9Jg7d0lJsAARriWhfwSkzTssJ33GgvkDqvLOKztqebrXRLzjeqIJvO
 BHC6QNpt5SMrh6ZSI7ynEY4foDsUOjjnwRpWNQYgu4/ISxWolqpMZV0pi4Qaq8KVgz2Rld
 BbYDTdiHhrNAaIj+ZY0OSMhgO+2mAWJHiCbTVe7r+dp/poQjabooJAXRjA29mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wi5B9UUC
Subject: Re: [Buildroot] [PATCH 0/3] Support custom tarball for OP-TEE
 related projects
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRXRpZW5uZSwKCk9uIE1vbiwgMjQgSnVuIDIwMjQgMDc6MDA6MDIgKzAwMDAKRXRpZW5u
ZSBDQVJSSUVSRSAtIGZvc3MgPGV0aWVubmUuY2FycmllcmVAZm9zcy5zdC5jb20+IHdyb3RlOgoK
PiBIZWxsbyBLb3J5LAo+IAo+IE9uIE1vbiwgVGh1LCAyMCBKdW4gMjAyNCAxNjozODo1MyArMDIw
MCwgS29yeSBNYWluY2VudCB3cm90ZToKPiAgWy4uLl0gIAo+IAo+IEFja2VkLWJ5IEV0aWVubmUg
Q2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAZm9zcy5zdC5jb20+IAo+IGZvciB0aGUgc2VyaWVz
LgoKSSBkb24ndCB0aGluayBwYXRjaHdvcmsgbWFuYWdlcyB0aGUgdGFncyBpbiB0aGUgY292ZXIg
bGV0dGVyLgpDb3VsZCB5b3Ugc2VuZCB5b3VyIEFja2VkLWJ5IG9uIGFsbCBwYXRjaGVzLCBwbGVh
c2U/Ck9yIG1heWJlIEkgY2FuIHNlbmQgYSB2MiB3aXRoIHlvdXIgQWNrZWQtYnkuCgpSZWdhcmRz
LAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
