Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B32C531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 16:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A4184156;
	Fri, 16 Aug 2024 16:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T6gg_hucBKM; Fri, 16 Aug 2024 16:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783C78445B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783C78445B;
	Fri, 16 Aug 2024 16:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E121BF5A7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05FF64072E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnjTQXzo1LYR for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 16:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1079440531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1079440531
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1079440531
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 16:39:08 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47G96CRR027129; Fri, 16 Aug 2024 16:39:05 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4123u5kqa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2024 16:39:05 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47GGd35p011211
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2024 16:39:04 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47GGd3dM011062
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 Aug 2024 16:39:03 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 92CA61002998;
 Fri, 16 Aug 2024 11:39:03 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 16 Aug 2024 16:39:03 +0000
Message-Id: <D3HHFTPQ82M3.2R73ISQI49Z2B@collins.com>
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
 <CH2PR12MB50046FA66DD021675C226330F0802@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50046FA66DD021675C226330F0802@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=539 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160117
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=492 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160117
X-Proofpoint-GUID: iS1rtizu5cLXP4cgHyFuVleKZ-FsYhgq
X-Proofpoint-ORIG-GUID: iS1rtizu5cLXP4cgHyFuVleKZ-FsYhgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=601 priorityscore=1501 spamscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408160117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=qhP24dO7XYSwaalFqvk2o6un7PWtxLYU65Ws2W7HHeM=;
 b=ryiwwAKmot/G0yJvmXvGUQVkUFsnJv7StLtYbnNky+hm02to959tDNbL8RV2reHyaV6N
 LRskYoOHZPB8fmdpYD5e56QLiGXCRwBSnWNezSAEEGFbk/m/tmHbXT+KorHzGRNR0/t2
 wklYw4Ambidf6pTiMwVaHfGf9iXG+Gl5N8PFmpSZMhDM3yMGMPIsEQ48ePPoUf6VHAZ4
 dEbQyDE++6gEJM/Tr3AQp8JOxw6/awS4Op2sbSJ23wngXisouB+BnH0d/mdsAypY2X0+
 JmQKbiZSA+7BH6g7MZOhuFPVKNqGmRYmTz21h4dQg/Cfm7RR9qCBYcTRRYkuMgZKdLxK nA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=ryiwwAKm
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_zcu10*_defconfig: fix
 parallel build of U-Boot
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu Aug 15, 2024 at 4:13 PM UTC, Frager, Neal via buildroot wrote:
> Hi Brandon,
>
> > When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled, the
> following error occurs from U-Boot.
>
> >  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: > No such file or directory
>  >    18 | #include <uuid/uuid.h>
> >        |          ^~~~~~~~~~~~~
>
> > The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enables
> > CONFIG_MKEFICAPSULE, which requires util-linux.
>
> > This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This is
> > because host-e2fsprogs requires host-util-linux, and host-util-linux
> > always builds before host-uboot when single-threaded.
>
> > Signed-off-by: Brandon Maier > <brandon.maier@collins.com>
>
> Thank you for this.
>
> Could you also submit a patch for the kria defconfigs?
>
> I am sure they need this too.

You are correct, they don't enable CONFIG_MKEFICAPSULE directly, but
enable CONFIG_EFI_CAPSULE_ON_DISK which enables it.

Sent a second patch for the kria boards.

Thanks,
Brandon Maier

>
> Reviewed-by: Neal Frager <neal.frager@amd.com>
>
> Best regards,
> Neal Frager
> AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
