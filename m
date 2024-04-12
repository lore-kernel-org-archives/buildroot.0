Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF9AC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BF5C40534;
	Fri, 12 Apr 2024 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iylNShxLnhIa; Fri, 12 Apr 2024 15:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 408FC405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 408FC405DD;
	Fri, 12 Apr 2024 15:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D81F1BF397
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3828A60626
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYncSDh56Dqw for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 512D5605F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512D5605F7
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 512D5605F7
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:18:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43CFIkQi102757;
 Fri, 12 Apr 2024 10:18:46 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43CFIksn022526
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2024 10:18:46 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Apr 2024 10:18:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Apr 2024 10:18:46 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43CFIkGT045448;
 Fri, 12 Apr 2024 10:18:46 -0500
Date: Fri, 12 Apr 2024 10:18:46 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20240412151846.ftaxfkbxnl4ugviz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <20240412055358.1354293-2-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412055358.1354293-2-heiko.thiery@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712935126;
 bh=RZaLc2kzA8ZM2bgWpkkVqQCm5Nzv9d+IIoao17H0yxg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WsHUedNKzPC29ZagVhqRuZCXZKWiHPe8Cj7y5tlsG6GpGdUtKwx4SHoLmrbZJOjeR
 B9O5ZOx4i5Wxna9DoPBvjzRuWWvw/e0Ueps1g6WrB2ahlF4v7K26+eu1Yi9pz1Fo2N
 bajsoaAGQgaE0rlVtr/M2aJZb7x8955E3q0gD21o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=WsHUedNK
Subject: Re: [Buildroot] [PATCH v3 2/3] boot/ti-k3-r5-loader: add dependency
 to yamllint
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On April 12, 2024 thus sayeth Heiko Thiery:
> Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
> [2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> 
> v2: accidentally resend this series as v2
>     (it's too early in the morning and no coffee yet)
> 
> v3:
>  - update URLs in the comment
> 
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
