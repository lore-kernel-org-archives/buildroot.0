Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60335C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 15:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1514C844AF;
	Thu, 20 Jun 2024 15:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1xfUbxE-NIZ; Thu, 20 Jun 2024 15:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F96844B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F96844B3;
	Thu, 20 Jun 2024 15:41:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 590461BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 15:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44337844AF
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 15:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl0jMmrJEK68 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 15:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 738D184498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738D184498
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738D184498
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 15:41:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KFfeqW127979;
 Thu, 20 Jun 2024 10:41:40 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KFfeEv039539
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2024 10:41:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 10:41:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 10:41:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KFfeHU081079;
 Thu, 20 Jun 2024 10:41:40 -0500
Date: Thu, 20 Jun 2024 10:41:40 -0500
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Message-ID: <20240620154140.cyqqxxfn5mwdmmur@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718898100;
 bh=iW/B4UH8ugk2SjZ2f262yXeA42pKnMGPnj1dI/B2Czw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PSZnQ8+VukxscTazGrhzgTLCTVVokYYzDh3xYBo7PjSqDWQORXdoBpOezULCs9RAV
 IpBdWEFwF2VIzrB3quxqvOKi21fSc/QfKXEHb830nWezIcG0406qZvIhXAaUem/XEh
 BiEkkARZgeozfm0BJmIzupO1BNAWxIFqdjJVuEi4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PSZnQ8+V
Subject: Re: [Buildroot] [PATCH 0/2] board/ti/am6{2,
 4}x-sk: update custom hashes
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gSnVuZSAyMCwgMjAyNCB0aHVzIHNheWV0aCBHZXJvIFNjaHfDpHJpY2tlIHZpYSBidWlsZHJv
b3Q6Cj4gVGhlIGZvbGxvd2luZyB0d28gY29tbWl0cyBidW1wZWQgdGhlIHUtYm9vdCB2ZXJzaW9u
LCBidXQgbWlzc2VkIHVwZGF0aW5nCj4gdGhlIGN1c3RvbSBoYXNoZXM6Cj4gCj4gICBjYzI5MTBh
N2RiIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiB1cGRhdGUgVS1Cb290IHRvIHYyMDI0
LjA0Cj4gICA3ZWZkNzU4NjdjIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnOiB1cGRhdGUg
VS1Cb290IHRvIHYyMDI0LjA0Cj4gCj4gR2VuZXJhdGVkIHdpdGgKPiAKPiAgIC4vdXRpbHMvYWRk
LWN1c3RvbS1oYXNoZXMKPiAKPiBCdWlsZCBzdWNjZWVkZWQgc2luY2UgdS1ib290IGxhdGVzdCBp
cyBjdXJyZW5seSBhbHNvIHYyMDI0LjA0LCBidXQgdGhpcwo+IHdpbGwgYnJlYWsgaW4gdGhlIGZ1
dHVyZS4KPiAKPiAtLQo+IEdlcm8gU2Nod8Okcmlja2UgKDIpOgo+ICAgYm9hcmQvdGkvYW02Mngt
c2s6IHVwZGF0ZSBjdXN0b20gaGFzaGVzCj4gICBib2FyZC90aS9hbTY0eC1zazogdXBkYXRlIGN1
c3RvbSBoYXNoZXMKCk5pY2UgY2F0Y2ghIFRoYW5rIHlvdQoKUmV2aWV3ZWQtYnk6IEJyeWFuIEJy
YXR0bG9mIDxiYkB0aS5jb20+Cgp+QnJ5YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
