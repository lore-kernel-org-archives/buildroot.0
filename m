Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE50C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD00440597;
	Mon, 15 Jul 2024 15:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K38uQadqIhbE; Mon, 15 Jul 2024 15:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF30240647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF30240647;
	Mon, 15 Jul 2024 15:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99DA41BF3B5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 15:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9288240647
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 15:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ntEdnDpiYo5 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 15:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2117640597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2117640597
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2117640597
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 15:22:49 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46FDjGkC013120; Mon, 15 Jul 2024 15:22:47 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bh64es60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 15:22:47 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FFMieb010392
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 15:22:45 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46FFMhVN015009
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Jul 2024 15:22:44 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id CFEFA3000445;
 Mon, 15 Jul 2024 10:22:43 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 15 Jul 2024 15:22:43 +0000
Message-Id: <D2Q7RY7OPU0I.2KCWEGO4SYQX5@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, "Kory Maincent"
 <kory.maincent@bootlin.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240710152941.334195-1-kory.maincent@bootlin.com>
 <d9fcfe9b-7b11-42ee-9773-b9620d720135@mind.be>
In-Reply-To: <d9fcfe9b-7b11-42ee-9773-b9620d720135@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150121
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150121
X-Proofpoint-GUID: LYWgnZlOi_1SvPYiXDJrltvAznlmm_Cx
X-Proofpoint-ORIG-GUID: LYWgnZlOi_1SvPYiXDJrltvAznlmm_Cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=6nbXWu7V4W9lqxl5zE7aihFYveV3PNCh6ZGoCJCSbCk=;
 b=LP2wxG0rojqP42yw5EFd9oFTjsyROlwUzIGU6ZjVA0PnPqaq9+0FWZlNk9kz659w+kCC
 gy5YL+1aXeKBiO+Ks74r4jotAkkyQ7cz7S8nyTfQNSukTXU8R/tnZfmrv5QxMflAzpgI
 4ndKUJO7yfmc0elGq0FdAoAdv74tl13/B54039tqgpf3QdyozV9eMtI6w+WwzROMPiHZ
 gq9xMuxg4t7cYEvYSwhNKMQgHrLfNhT1KNEajJkefiSOLqxOVuhBW5sOujMZ1RgrqzVX
 vOX0dyUSU9GocesGQaDkb/oHUB4kBy+VQSWtqTusQGwgpuRdOqGtu2A9CxwXQCnK1XRv jg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=LP2wxG0r
Subject: Re: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Kory,

On Mon Jul 15, 2024 at 2:07 PM UTC, Arnout Vandecappelle via buildroot wrote:
>
>
> On 10/07/2024 17:29, Kory Maincent via buildroot wrote:
> > Linux organizes devicetree files under vendor subdirectories for arm and
> > arm64 architectures, such as arch/<arch>/boot/dts/<vendor>/. The
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was only copying devicetree files to
> > arch/<arch>/boot/dts/, which is incompatible with the vendor
> > subdirectory structure.
>
>   I don't see what the problem is though? If a DT is put in
> arch/<arch>/boot/dts, it can still be built with the current Buildroot.
>
>   The only thing you need to do is to make sure to do
>
> #include "vendor/cpu.dtsi"
>
> instead of
>
> #include "cpu.dtsi"
>
>   The in-tree DTSes don't have the vendor/ part in the include, of course, but
> for custom DTSes you can do what you want, right?

This does work, I do this for Xilinx devicetrees which go into a
'xilinx' vendor directory.

>
>   I'm going to mark it as Rejected for now, but feel free to resubmit if there
> is a good reason to have this feature.

This does solve one problem for me. I compile the same devicetree into
Linux and U-Boot. But Linux migrated the Xilinx devicetrees into a
'xilinx/' vendor directory. But U-Boot has not made the same migration
as their Makefiles don't support dts sub-directories. So the #include
path is the only thing different between the Linux and U-Boot
devicetrees.

I work around it for now by patching a symlink into U-Boot
'arch/arm/dts/xilinx -> ./'.

Though ideally U-Boot would be updated to use the same devicetree layout
as Linux.

Thanks,
Brandon

>
>
> > This patch adds support for using a directory in
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH that matches the vendor subdirectory name.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >   linux/Config.in |  4 +++-
> >   linux/linux.mk  | 14 +++++++++++---
> >   2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/linux/Config.in b/linux/Config.in
> > index 34057a4893..6ca615cae3 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -423,7 +423,9 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
> >   	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
> >   	  Source Include (.dtsi) files, separated by spaces. These files
> >   	  will be copied to the kernel sources and the .dts files will
> > -	  be compiled from there.
> > +	  be compiled from there. You can also use a directory which
> > +	  name match the vendor name as in
> > +	  arch/<arch>/boot/dts/<vendor>/
>
>   I think the explanation could be better:
>
> 	  Starting from Linux 6.5, the device trees are put in a <vendor>
> 	  subdirectory. To emulate this, you can put custom device trees
> 	  in a directory with that same <vendor> name, and specify the
> 	  path to that directory here instead of to individual dts files.
>
>   I feel this is pretty complicated for a user to understand though...
>
> >
> >   config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
> >   	bool "Keep the directory name of the Device Tree"
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 16d9f19470..07d4ddf7f3 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -198,7 +198,15 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
> >   # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
> >   # copied to arch/<arch>/boot/dts, but only the .dts files will
> >   # actually be generated as .dtb.
> > -LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> > +# In case we are copying a vendor dts subdirectory as in
> > +# arch/<arch>/boot/dts/<vendor>/ we have to append the wildcard to the
> > +# folder to list the devicetree.
> > +LINUX_KERNEL_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
> > +ifneq ($(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/.*),)
>
>   You don't actually need the * here.
>
>   Also, better use positive logic (ifeq instead of ifneq, and swap the branches).
>
> > +LINUX_DTS_NAME += $(addprefix $(notdir $(LINUX_KERNEL_CUSTOM_DTS_PATH))/,$(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/*)))))
> > +else
> > +LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)))))
>
>   This is also getting pretty complicated, could it be refactored so there are a
> bit more common parts? Something like:
>
> ifeq ($(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/.),)
> LINUX_CUSTOM_DTS_FILES = $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/*))
> LINUX_CUSTOM_DTS_PREFIX = $(notdir $(LINUX_KERNEL_CUSTOM_DTS_PATH))/
> else
> LINUX_CUSTOM_DTS_FILES = $(LINUX_KERNEL_CUSTOM_DTS_PATH)
> endif
> LINUX_DTS_NAME += $(addprefix $(LINUX_CUSTOM_DTS_PREFIX),$(basename $(filter
> %.dts,$(LINUX_CUSTOM_DTS_FILES))))
>
> (parenthesis added in an email editor so probably unbalanced :-)
>
>   Regards,
>   Arnout
>
> > +endif
> >
> >   LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
> >
> > @@ -505,8 +513,8 @@ endif
> >   #   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
> >   define LINUX_BUILD_CMDS
> >   	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> > -	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
> > -		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
> > +	$(foreach dts,$(LINUX_KERNEL_CUSTOM_DTS_PATH), \
> > +		cp -rf $(dts) $(LINUX_ARCH_PATH)/boot/dts/
> >   	)
> >   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
> >   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
