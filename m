Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B15FCAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6420D40FF1;
	Tue, 23 Sep 2025 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCnzv46eCfI8; Tue, 23 Sep 2025 19:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE7C40FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE7C40FA8;
	Tue, 23 Sep 2025 19:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3A0129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23C6C6102B
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2XP-XsRiBHv for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 19:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B635A6000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B635A6000A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B635A6000A
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:39:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BC59860132;
 Tue, 23 Sep 2025 21:39:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 21:39:50 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 21:39:50 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20250923135223.1062683-1-clg@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <ad8d0f2e3258b51b7075195b6eea718f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758656393;
 bh=/IU35rutdbE/pn6WBUc9iSIeB3q4tEPgE9gxU4JzVwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YPfZ6kLl9y2HGL1NY8O4dzBRM9ROCGWYQpNMQHgC4AbiyoMeIqNtRikDawBCB9v3G
 idhU5/XyfRzAq0UeIfd/+8IekQdHgZNcNh0yGuWRGh7b+8iXk+Sc+ahNirp1697FBy
 RFwCm1aWOAu5TVVseLi3VUxDWv5odaU/4AJEgT0Kca+T5HUX90WUDCIRXu3EzoV+LL
 sPhB9B/R7WWlHcKWJRiup5oBIEPnGbjlmsFIohL00D6awdg3aBTjIfodYvsHLPHKTP
 pk/5H+/L3oa9qSTrgAfSotl7b52k8y0WU+SvF6CrouDFvzO2C/vzyPHUg+VohbNVpK
 0qYXF5D5c8C2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YPfZ6kLl
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjMvMDkvMjAyNSAxNTo1MiwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gVGhpcyBjb21t
aXQgYWRkcyBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgYW5kCj4gQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklIRl9HTElCQ19TVEFCTEU9eSBpbiB0aGUK
PiBkZWZjb25maWcsIGJ1bXBzIGtlcm5lbCB0byA2LjE2LjcsIGFuZCBhZGRzIGN1c3RvbSBoYXNo
IGZpbGVzIGFuZAo+IHJlbW92ZXMgdGhlIGV4Y2VwdGlvbiBlbnRyeSBpbiAuY2hlY2twYWNrYWdl
aWdub3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5v
cmc+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkZvciBpbmZvLCBJIGFsc28g
bWFkZSBtaW5vciBmaXh1cHMuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0LzZlNWU2Zjk4ZmQ3M2JhZWI3YmFhNDAyZDZiZDI3ZWQyYTVkNzkw
MGYKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzM5
ZWE3NGZmYzdkNjM4N2FmMGEzMDQwNTQyMDA4OTYwYzdjZGJmMmYKCkJlc3QgcmVnYXJkcywKCkp1
bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
