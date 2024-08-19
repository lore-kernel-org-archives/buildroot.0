Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D231FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 19:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1E4401F8;
	Mon, 19 Aug 2024 19:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erVAvt9kRvyC; Mon, 19 Aug 2024 19:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE4140209
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE4140209;
	Mon, 19 Aug 2024 19:24:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83C731BF355
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EF3080FB8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-SlAK_EgFVq for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 19:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A682080FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A682080FB7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A682080FB7
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 19:24:23 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JF0WoW022776;
 Mon, 19 Aug 2024 19:24:20 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 412n89eqk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:24:19 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47JJOJd6000963
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:24:19 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47JJOItP020746
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Aug 2024 19:24:19 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id BC0523000446;
 Mon, 19 Aug 2024 14:24:18 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 19 Aug 2024 19:24:18 +0000
Message-Id: <D3K4TZGM0EY7.A2VOI329V56C@collins.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
 <20240819103226.4895c5e3@booty> <20240819104320.18538f1d@windsurf>
In-Reply-To: <20240819104320.18538f1d@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 mlxlogscore=987
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190132
X-Proofpoint-GUID: LHfQrWnMifR-yDpLd3pd1mMbXrJUDvta
X-Proofpoint-ORIG-GUID: LHfQrWnMifR-yDpLd3pd1mMbXrJUDvta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408190131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=tIuz6wF+ATsvEc3tpVcK6CuNFKxMeS9jChefp78kGSo=;
 b=H+gOb3D7HD+Sr2aGsqv6VlvIfpJN8I2kKUzTlr20579ZbFAIh9OFvFaI7GEqFxX0x0sB
 iHnON2a/utANeTEEHfdRuH5mJsKnbuIEaLE7HYArSJDDbEbz+HGyCEWkPtoy2YHbqG0e
 CEQGPw3pr7CVzz7j32SkBs09Y9JGi8aDeqQ3eptkqmlQcGbAWT8V+CxcJL1ES9qo2NSO
 omgH3gzM6Ra8phruEAilIb1eZxznKvhyL4Z4NEV6Xs+SPrSE+8Ye/jhK9gejyYW2f74N
 ah1LUvacghybxbBLyLed9Z969EMRasSrwKv8tUtAcoqBh+ZpygeEqsQG1D9EauR+kgIr nQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=H+gOb3D7
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: avoid setting
 PMUFW_INIT_FILE when not used
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: buildroot@buildroot.org, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Luca,

On Mon Aug 19, 2024 at 8:43 AM UTC, Thomas Petazzoni via buildroot wrote:
> Hello,
>
> On Mon, 19 Aug 2024 10:32:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> > I think there are two potential reasons for applying this patch:
> >
> >  1. setting an empty string lets the build finish apparently
> >     successfully, but the output binaries are not working
> >
> >  2. allowing users to set CONFIG_PMUFW_INIT_FILE in their U-Boot config
> >     and have Buildroot let it pass through
> >
> > For point 1, as I wrote earlier today I think this won't happen, based
> > on the U-Boot code.
> >
> > For point 2, which is the motivation you present in this patch, I don't
> > see a valid use case. Without a use case, I'd rather not add code to
> > uboot.mk, no matter if it is only a few lines. With a use case, I'd be
> > totally OK.
>
> My initial point was that I found it odd that:
>
> 	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")
>
> was done unconditionally. But in fact, it's done under the condition:
>
> ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>
> so I think the code is indeed fine as it is.

Sounds good to me, I don't have a use case either. I'll drop this patch
when I send the v2.

Thanks,
Brandon Maier

>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
