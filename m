Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CD4C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1837A81B72;
	Wed, 12 Jun 2024 21:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAoGtATwN7tm; Wed, 12 Jun 2024 21:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA0581AF6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA0581AF6;
	Wed, 12 Jun 2024 21:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF3E1BF368
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 21:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD7960909
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_q9c14J7UlR for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 21:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D64E060825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64E060825
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D64E060825
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 21:51:36 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CKOqhG010397; Wed, 12 Jun 2024 21:51:32 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yq8fpyu8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 21:51:32 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CLpVn1021138
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 21:51:31 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CLpUTR027156
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 21:51:30 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 8A2D89A42;
 Wed, 12 Jun 2024 16:51:30 -0500 (CDT)
Date: Wed, 12 Jun 2024 21:51:30 +0000
To: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Message-ID: <ZmoYYkE_ucIikzCg@bspbox.kirk>
Mail-Followup-To: "Frager, Neal via buildroot" <buildroot@buildroot.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-2-neal.frager@amd.com>
 <Zmnw02UInwrQx3f_@bspbox.kirk>
 <CH2PR12MB50040069C1F8476DBD4FFAF2F0C02@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB50040069C1F8476DBD4FFAF2F0C02@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120155
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120156
X-Proofpoint-ORIG-GUID: ggyWp1Fp1yaQpL_pDeDxUJc54FWp47ao
X-Proofpoint-GUID: ggyWp1Fp1yaQpL_pDeDxUJc54FWp47ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=Rccx/Xk7RwtmbFZRcBEVZUfCW7AoWHavkwUxdR3RAtU=;
 b=FK9uKZSJ6yNKczrHGaoLmYyQBxvAwabYBRm2UTFTaf9wN3t00ahGrqlCa8XRHOzV4Rbh
 Mj+UGTU5G06si0wJakqO3ZZ8BBssdEDCHEbn7bfgBoyR5IGcezU6MtaY3QZfcdFR2+dR
 i1R7ZDuCnuBTRthnurWXPumkEXOYRjEL/yvWAShI+iduSMObqLk5aPmbW/wi/JxTwjy2
 Q11uskpAN76jWrCJrBimYbSHF5h6zG9bLGjJ+gyTYEArKxXlR/xXEMflOhNCnBCNZR+V
 E7DD2RoZss4z/7reM4CYUMPC4UuJxSBemGNwagVEUI61KwOCMP6IcinF6pdMt92izN5g WQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=FK9uKZSJ
Subject: Re: [Buildroot] [PATCH v1 2/5] boot/uboot.mk: new zynqmp pmufw
 prebuilt option
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 2024.06.12 19:28, Frager, Neal via buildroot wrote:
> Hi Brandon,
> 
> > The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
> > use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
> > in the generated boot.bin.
> > 
> > If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
> > BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> > be ignored.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> >  boot/uboot/Config.in | 16 ++++++++++++++++
> >  boot/uboot/uboot.mk  |  5 +++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index d0901edc9d..9d275e8611 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
> >  
> >  if BR2_TARGET_UBOOT_ZYNQMP
> >  
> > +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> > +	bool "xilinx-prebuilt pmufw.elf"
> > +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> > +	depends on BR2_TARGET_XILINX_PREBUILT
> 
> > Since this is a ZynqMP only option. Shouldn't this depend on the
> > Xilinx-prebuilt ZynqMP choice?
> 
> >  depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP
> 
> The kria boards also use this u-boot feature as they are part of the zynqmp
> family.  I suppose we could add this?
> 
> depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP | BR2_TARGET_XILINX_PREBUILT_KRIA

Ah, I assumed this was ZynqMP specific due to the config symbol name. If
it applies to multiple product lines then I don't think it's worth
bothering.

> 
> > +	help
> > +	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
> > +	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
> > +
> > +	  U-Boot build process will generate a boot.bin (to be loaded by the
> > +	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
> > +	  in the Xilinx-specific boot format.
> > +
> > +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> > +	  prebuilt option will be ignored.
> > +
> >  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> >  	string "PMU firmware location"
> >  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> > +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> >  	help
> >  	  Location of a PMU firmware binary.
> >  
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index b9f165f041..5d12c6283b 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -436,7 +436,12 @@ endef
> >  
> >  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
> >  
> > +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
> > +UBOOT_DEPENDENCIES += xilinx-prebuilt
> > +UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
> > +else
> >  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> > +endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> >  
> >  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
> 
> > The `endif` should be moved to cover this ifneq statement. That way when
> > xilinx-prebuilt is enabled it doesn't do the "://" and readlink checks.
> 
> Does this really matter?  If BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT is set,
> then UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf, so there will never be
> a :// in UBOOT_ZYNQMP_PMUFW and the UBOOT_EXTRA_DOWNLOADS will not get set.

My intent is to make the logic easier to understand, by splitting the
custom PMUFW logic from the xilinx-prebuilt logic.

> The problem with moving the endif after the ifneq is that we still need the
> UBOOT_ZYNQMP_PMUFW_PATH to be set for the rest of the functionality to work.
> 
> UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
> 
> To avoid duplicating this line of code, keeping the endif before the ifneq
> seemed to be the cleaner solution to me.
> 

The readlink is not needed for xilinx-prebuilt as $(BINARIES_DIR) is
always an absolute path. Instead you could assign the
`$(BINARIES_DIR)/pmufw.elf` directly to `UBOOT_ZYNQMP_PMUFW_PATH`.

But the above is a nit pick, so I'm good with applying.

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> >  UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
