Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879CFE7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 09:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B53041289;
	Mon, 13 Jan 2025 09:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3MG2qIJD8Dk; Mon, 13 Jan 2025 09:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 060094128A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060094128A;
	Mon, 13 Jan 2025 09:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A08C595D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 09:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80FA661132
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 09:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtC3xSL725aq for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 09:02:35 +0000 (UTC)
X-Greylist: delayed 3394 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 Jan 2025 09:02:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC5956111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC5956111D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=31083e9d08=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC5956111D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 09:02:33 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2Li9G024977;
 Mon, 13 Jan 2025 09:05:56 +0100
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444333kc0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 09:05:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A74B84004F;
 Mon, 13 Jan 2025 09:05:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D372022C007;
 Mon, 13 Jan 2025 09:04:16 +0100 (CET)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:04:16 +0100
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Mon, 13 Jan 2025 09:04:16 +0100
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Julien Olivain <ju.o@free.fr>, =?iso-8859-1?Q?Vincent_Stehl=E9?=
 <vincent.stehle@arm.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] boot/optee-os: add custom version option
Thread-Index: AQHbUvIG4db9wgfxb0SYuwTS9NvbGbMNeFIAgAcBiU0=
Date: Mon, 13 Jan 2025 08:04:16 +0000
Message-ID: <2b42675830d448ca94f18b1ab3938824@foss.st.com>
References: <20241220151531.59770-1-vincent.stehle@arm.com>,
 <b5403f615bdbba4f0571fdefc5d16849@free.fr>
In-Reply-To: <b5403f615bdbba4f0571fdefc5d16849@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Pn30ABcXIXED9oOkLAsOjuPTGmT5TBC/OnEIWkY6Fd4=; b=0PxgA1LCBy8y3Zmp
 JoPvuNvtOUE6XI/Dr+9pVa1PPZd8aDZ391rFcO8Y3mPh1au3rlD+PbK7YJJEn/+B
 c7xORXHRckKQn1Ceba3Xu58yOTB2cdtq836DdsAlkD6qK8K5txMjMoKD0RWkw6Ne
 Ag8KqtZrdjj9nIpQTWbfuWs3n4Ek1r4Y/7n1JfuQrB61nslZaavF+7wpi5gnpDMh
 xPHRgt8EG4kVA+AG6kBcQ4pT8b0h63UXKAUGadFNAW4wYLrGwi4geWZSnL5lyNNn
 QKPanPWCqif7nNUXaGUZd+RzRRgzvQErtFStthL8b7p7vGadt3O+RyVrWD+IK6Ks
 GeMq2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=0PxgA1LC
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add custom version option
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien, Vincent,

On Wednesday, January 8, 2025, Julien Olivain wrote:
> Hi Vincent, =C9tienne,
>
> On 20/12/2024 16:15, Vincent Stehl=E9 wrote:
> > Add custom version option, to enable easily specifying an official
> > OP-TEE
> > version to use.
> > This is similar to what is done in other packages, such as linux, uboot
> > or
> > arm-trusted-firmware.
> >
> > Signed-off-by: Vincent Stehl=E9 <vincent.stehle@arm.com>
> > Cc: =C9tienne Carri=E8re <etienne.carriere@foss.st.com>
> =

> I applied this patch to master, thanks.
> =

> Do you think the same logic should also be added to the optee-client,
> optee-examples and optee-test packages?
>
>
> I currently believe so.

I do also since O-TEE test source tree should be synced with OP-TEE OS sour=
ce tree.

Best regards,
Etienne

> =

> Best regards,
> =

> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
