Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44208C55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F118080C6E;
	Tue,  4 Aug 2026 12:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRBEe063GEvC; Tue,  4 Aug 2026 12:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2592680B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785848185;
	bh=r0RiXnytnHri6zCQlPdu4PHGjtOgkcylUE8McDB+/0o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NCWxHiFFARS3OJcaMY88IK9BFHzSdJGdlcyKMXfH8LVR1uTABu9LVqIVZd4u2O9Cv
	 DroAf++83PlfT/jItWesIxe5GkxkYxkqUo30CmY2tY2583eALfr83uO06pAajxPO+z
	 uCO/eusr4pFVCB+8Jp6fbHp+mF3ajP9v8duaZBAxFZXXRZ2dIkAgPdZ7so03YugP6u
	 QPKMPiRP2J/EfouiHCNf1Vl/vF3Y1SgPlXJNDXoxt74vUmTJDQ4WVopYcGIZ8knG5R
	 uIAlGwFM7YiKUC1/C7xP7vlmHh1QAG0zQQEukpv077xwQeboCrKRT9CKvY0rTE8+1s
	 OmCA5g+DQSUAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2592680B1B;
	Tue,  4 Aug 2026 12:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E54A32E
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F4198605FA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTSyFJGOhvR8 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADCFE605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADCFE605E3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADCFE605E3
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:56:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1womlo0NJZ-00A7zg; Tue, 04
 Aug 2026 14:55:57 +0200
Message-ID: <1ddf037c-f9ef-4f08-a35d-889fe0a28d69@gmx.de>
Date: Tue, 4 Aug 2026 14:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 brandon.maier@collins.com, john.ernberg@actia.se, brian.j.wood2@boeing.com,
 ju.o@free.fr, stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
References: <20260804102449.1532082-1-neal.frager@amd.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260804102449.1532082-1-neal.frager@amd.com>
X-Provags-ID: V03:K1:pi5t5FiqFIv/ZKN93qfL3S1w7Obf1YPPH/H4rYDYqHuTcybcuqq
 7+wrmv1WOMgf3yfmHubDECrz3K2fD+5JX0uAd+aTy4uGkd2uwVPdZ1dWg7iozP9Mo8kCDxQ
 jS+K2eszs3SUsB2bkj42s11tXsoWKEMzIU+6lrc15NK479ZRMYCA+RzDuSKQU+9fVv6L3HQ
 +vYxYuJRBnIscwEWDp1YQ==
UI-OutboundReport: notjunk:1;M01:P0:ZkfHkoltNaY=;vZosRDEZWz3emBA1A1bossTLrxa
 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
 7aiCkCqmPutCzqPug7+V6KHRQ1I1Ph8ViSo6s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785848157; x=1786452957; i=fiona.klute@gmx.de;
 bh=ssfwopG5RoaKqa+IFbnwfqnpMjreLwABZO7HsHG2CqE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CRSiyHTaNngPESXaqurm0KvLlKaKrZ+CBlMuqpGZG3ZCTroeLQVOAsRqL5pzQMMx
 7rSAEA+5Ox5cu1dJdmM7KC9Qk+ZjYHq3ZD4tm+QikjKgr7odXJ9P2gfeyrHKa07Np
 GdHIYZTFw91G+UQUXZW3raInOWzwqsSsy7FuM6tdsmndiDBDlq2Lrl/ug1t/4/KCr
 elxU4+0bOzG/yzNwjrrGCOBwhq18+JvmaEXp4GOC8KjEcBYc5M9LWuy0rkadS42GW
 6HgK0QEkfSC97iSpDoY/X+6yewNV61PlDSCrwPWwCoFTtJfMXbmt5NBLP85CCDhke
 h3N3ar3gGmzGvBh09Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CRSiyHTa
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add Neal Frager for xen
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.08.26 um 12:24 schrieb Neal Frager via buildroot:
> Add Neal Frager for xen and qemu-xen packages.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thank you!

> ---
>   DEVELOPERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a877140992..d8b1680c48 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2513,6 +2513,8 @@ F:	package/binutils-bare-metal/
>   F:	package/bootgen/
>   F:	package/gcc-bare-metal/
>   F:	package/newlib-bare-metal/
> +F:	package/qemu-xen/
> +F:	package/xen/
>   F:	package/xilinx-fpgautil/
>   F:	toolchain/toolchain-bare-metal-buildroot/
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
