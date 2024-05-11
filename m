Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7EBC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E012761632;
	Sat, 11 May 2024 07:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bP5xElLyO1K7; Sat, 11 May 2024 07:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF74616C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF74616C3;
	Sat, 11 May 2024 07:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1F711BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE1F6410B0
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5r1OaZpB21d for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 877CE410AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 877CE410AB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 877CE410AB
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:09:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B321FF802;
 Sat, 11 May 2024 07:09:36 +0000 (UTC)
Date: Sat, 11 May 2024 09:09:36 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240511090936.3f140162@windsurf>
In-Reply-To: <20240223165747.1231616-1-flavio.tapajos@newtesc.com.br>
References: <20240223165747.1231616-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715411377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaGKSZGT3+hpEQD673bslfWfIXtuJYlWhHvXZLdDfd0=;
 b=Oz51XI7+4LH07LHtNsJCkZn1KbP/BpXAdpRWfIpBC1oTxggLYQeVf3wMfBzLJgu11hPDPt
 w7jwJQF8o4xopS1KFvb59SAT2Vn/Oj2JFWQlxpnA+sEK/jzrWwNcOwwxrqGO5IIAnv0oOp
 bIpubmLxWEeKdwMlbGkn4wsDgNKQi9zzFtmBHiy8OsSBtWtoC7khSqUGTZD/K2Wn+1J+xy
 1q4kxp1i8AtSkLeowqQFHXS/sjAc4S4i1plva4Mac2nX67yxb8+iFHt4KMdeTd/FqKo4cX
 w8fARQozxOwWK3hSHMmBtx5ybe8OHFEl+T2XOpfJncP2yFpDgz7rWpU2LU4EMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oz51XI7+
Subject: Re: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288_defconfig:
 bump kernel to 6.1.79
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMyBGZWIgMjAyNCAxMzo1Nzo0NyAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IGxhdGVzdCBrZXJuZWwgTFRTICg2
LjYueCkgaXMgZmFjaW5nIHByb2JsZW1zIHdpdGggdGhlIHNkY2FyZAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0t
LQo+ICBjb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
