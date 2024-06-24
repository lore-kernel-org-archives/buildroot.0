Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CE8C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26E780EA3;
	Mon, 24 Jun 2024 07:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw7Ys7onetMJ; Mon, 24 Jun 2024 07:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DC580EB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1DC580EB0;
	Mon, 24 Jun 2024 07:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F07471BF4D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6EB605EE
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTO-Bg5dxh2R for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:19:06 +0000 (UTC)
X-Greylist: delayed 1122 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jun 2024 07:19:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8ACF605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8ACF605C3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=6905ba6747=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8ACF605C3
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 07:19:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NFJBmX011277;
 Mon, 24 Jun 2024 09:00:21 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860bff1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 09:00:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A45E340045;
 Mon, 24 Jun 2024 09:00:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99C7C210758;
 Mon, 24 Jun 2024 09:00:02 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 09:00:02 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.035; Mon, 24 Jun 2024 09:00:02 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Kory Maincent <kory.maincent@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 0/3] Support custom tarball for OP-TEE related projects
Thread-Index: AQHawx+eZCdsGc5luU62hYn4uO3MwrHWgEpC
Date: Mon, 24 Jun 2024 07:00:02 +0000
Message-ID: <8ceaf29cebab41cbb6056da65d3c1c67@foss.st.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>
In-Reply-To: <20240620143853.1259543-1-kory.maincent@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_06,2024-06-21_01,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tWdcSPTkc+iUEyHYt/iuh4UCJk2bWvXn4um53NxD+Ko=; b=h/Rw2iMQqO79ojBZ
 VQez1o7Kb/2B4qCLfoAcjUyt9rWaXaFZlD9y28eGJdeHSBa49661RxnLNuAyoNay
 1SoJcpJUm1ugUOH/8kVe+F+wb4CBlyXzepLCKgrwZR48dD96jZk1E7bcyRp3dD8O
 tv+jsz11jowqOBAm8mXHb9wjLt1aGFSQ2GFwt81Pbzwfq+sBZtc4r9peLELloNEC
 UVElP73IuKiVejl56c3BUvZoq9JjwvFz0SXMa7e/IrkVGO0fRIrzuZhuGVl5f3MV
 PycvNzY179M2fPJ9B/QBFTLfVfqZyAXBJ7Wgbf0Of//0bLhc6nv1qMiVmVoaL62E
 3hao7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=h/Rw2iMQ
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kory,

On Mon, Thu, 20 Jun 2024 16:38:53 +0200, Kory Maincent wrote:
> 
> OP-TEE OS supports custom tarballs, but the optee-client, optee-test,
> and optee-examples projects do not. This might cause version mismatches
> between OP-TEE OS and these related projects.
> 
> This patch series adds support for custom tarball URLs to address these
> potential issues.
> 
> Kory Maincent (3):
>   package/optee-client: Add support for custom tarball
>   package/optee-test: Add support for custom tarball
>   package/optee-examples: Add support for custom tarball

Acked-by Etienne Carriere <etienne.carriere@foss.st.com> 
for the series.


> 
>  package/optee-client/Config.in           | 38 +++++++++++++++++++++
>  package/optee-client/optee-client.mk     | 24 ++++++++++++--
>  package/optee-examples/Config.in         | 42 ++++++++++++++++++++++++
>  package/optee-examples/optee-examples.mk | 26 +++++++++++++--
>  package/optee-test/Config.in             | 41 +++++++++++++++++++++++
>  package/optee-test/optee-test.mk         | 23 +++++++++++--
>  6 files changed, 188 insertions(+), 6 deletions(-)
> 
> --
> 2.25.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
