Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E82AC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 07:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D65A402FB;
	Thu, 18 Jul 2024 07:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynI2pjncC5zw; Thu, 18 Jul 2024 07:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DE740544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8DE740544;
	Thu, 18 Jul 2024 07:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D72FD1BF388
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 07:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B906B60B38
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 07:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDireha717_a for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 07:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=7929d93091=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C43B960BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43B960BF0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C43B960BF0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 07:05:06 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I50SeK020661;
 Thu, 18 Jul 2024 09:05:03 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40dwfky383-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2024 09:05:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49DB84002D;
 Thu, 18 Jul 2024 09:04:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95B43232E52;
 Thu, 18 Jul 2024 09:04:39 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 18 Jul
 2024 09:04:39 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.037; Thu, 18 Jul 2024 09:04:39 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Arnout Vandecappelle <arnout@mind.be>, Kory Maincent
 <kory.maincent@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] boot/optee-os: Add support to build with
 host-cmake
Thread-Index: AQHa03SSbtV0ijDXCU+rICj3Kel58bH3v7SAgARWwfc=
Date: Thu, 18 Jul 2024 07:04:39 +0000
Message-ID: <14297ba1cacf4a65ac06e155e2162a2e@foss.st.com>
References: <20240711092728.3083087-1-kory.maincent@bootlin.com>,
 <fc07c4f5-ef09-4018-b927-df092311889c@mind.be>
In-Reply-To: <fc07c4f5-ef09-4018-b927-df092311889c@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 i8ozqztnhBznvJz8il17fpX03KBvKAMhNQmydoM3zRA=; b=1BWKxxvotUxpBPHt
 NR549SsxLjHY3PgMCNSqF/OIw5MPzXH70TpFwAB8RZU2bFbiYOGxt1EjFt7p9Ii6
 Wf1fUNrh1Am5s7dRyYQnZs8eVi+UKCmfjRhfxbrhrNcWFnRDaVn6lWRD1XrFhgaw
 KZflVZl3yvIDp0zR21Mt4NJR04a/DaOV/jREki6MaKNVR6956r84B/pnXqo8sOYm
 Ne9Qhaoz0SN1CImekj1eWlvAypKOiz1tPTGG2Qz9BNiMEY3N8ZEdIkFWveOxDrG3
 iWUrr2MRv+X8UhOc6H3oaqCZnhpHHomMu8+eIvbzZ2hddQq199DCnoJ+/AkpOPTP
 BBFgUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=1BWKxxvo
Subject: Re: [Buildroot] [PATCH] boot/optee-os: Add support to build with
 host-cmake
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

Hello Arnout,

On Monday, July 15, 2024, Arnout Vandecappelle wrote:
> 
>   Etienne, since Kory is on holidays, perhaps you can answer the question below?
> 
> On 11/07/2024 11:27, Kory Maincent via buildroot wrote:
> > Some specific versions of OP-TEE need cmake on the host to build the scmi
> > firmware, like the newly release STMicroelectronics 3.19.0-stm32mp-r2
> > version.
> >
> > To allow building such OP-TEE OS versions, this commit adds the option
> > BR2_TARGET_OPTEE_OS_NEEDS_CMAKE which when enabled ensures that host-cmake
> > is built before OP-TEE OS.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >   boot/optee-os/Config.in   | 6 ++++++
> >   boot/optee-os/optee-os.mk | 4 ++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> > index 34ea993136..7870629732 100644
> > --- a/boot/optee-os/Config.in
> > +++ b/boot/optee-os/Config.in
> > @@ -91,6 +91,12 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
> >         python-cryptography. Select this option if optee-os needs
> >         python-cryptography to be built.
> >
> > +config BR2_TARGET_OPTEE_OS_NEEDS_CMAKE
> > +     bool "OP-TEE OS needs cmake"
> > +     help
> > +       Select this option if your OP-TEE OS platform configuration
> > +       requires the cmake build system to be available.
> > +
> >   config BR2_TARGET_OPTEE_OS_CORE
> >       bool "Build core"
> >       default y
> > diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> > index 33b4e2e1ab..8fa5c824da 100644
> > --- a/boot/optee-os/optee-os.mk
> > +++ b/boot/optee-os/optee-os.mk
> > @@ -30,6 +30,10 @@ endif
> >
> >   OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
> >
> > +ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_CMAKE),y)
> > +OPTEE_OS_DEPENDENCIES += host-cmake
> 
>   This should be $(BR2_CMAKE_HOST_DEPENDENCY). I fixed that.

Thanks.

> 
>   You should also check what the minimum CMake version is, and if it's higher
> than 3.18, select the corresponding BR2_HOST_CMAKE_AT_LEAST_X_Y. Etienne?
> 

OP-TEE OS needs at least CMake 3.18.3 to build the SCP-firmware part.
https://gitlab.arm.com/firmware/SCP-firmware/-/blame/v2.14.0/CMakeLists.txt#L10

Since BR seems to start from BR2_HOST_CMAKE_AT_LEAST_3_19, I guess this one already applies.
Maybe this will really need to be fixed when a more recent CMake is required.

BR,
Etienne


> 
>   Applied to master, thanks.
> 
>   Regards,
>   Arnout
> 
> 
> > +endif
> > +
> >   ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
> >   OPTEE_OS_DEPENDENCIES += host-python-cryptography
> >   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
