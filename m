Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2549DCDD0E2
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFA36079C;
	Tue, 22 Oct 2024 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIEFN77MYn-p; Tue, 22 Oct 2024 20:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96961607B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96961607B3;
	Tue, 22 Oct 2024 20:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1395059F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E894140319
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPWC-epcZu55 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 887CB4039B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 887CB4039B
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 887CB4039B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:15:00 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIBQ4b014778;
 Tue, 22 Oct 2024 20:14:57 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42eh42sb29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 20:14:57 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MKEtJM011071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 20:14:55 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49MKEsin013559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Oct 2024 20:14:55 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 734703026C46;
 Tue, 22 Oct 2024 15:14:54 -0500 (CDT)
Mime-Version: 1.0
Date: Tue, 22 Oct 2024 20:14:54 +0000
Message-Id: <D52LZL79C2WS.1LHI702Z0GTIY@collins.com>
Cc: "Michaelis, Adam J Collins" <adam.michaelis@collins.com>, "Buchmeyer,
 Neal Collins" <Neal.Buchmeyer@collins.com>, "Maier, Brandon L              
 Collins" <Brandon.Maier@collins.com>, "Julien Olivain" <ju.o@free.fr>,
 "Romain Naour" <romain.naour@smile.fr>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Michaelis, Adam J
 Collins via buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
 <20241022212420.4e850e1c@windsurf>
In-Reply-To: <20241022212420.4e850e1c@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_21,2024-10-22_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_21,2024-10-22_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220131
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220130
X-Proofpoint-GUID: 8upaQNKiczPiN7sp_5v0YurWIKuMCISK
X-Proofpoint-ORIG-GUID: 8upaQNKiczPiN7sp_5v0YurWIKuMCISK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_21,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=BG3YUuzyPpjNRcnJr8KEV7nReUzyAC2t21oq7veTVWo=;
 b=Md4KgowxG6BJb5RWuXw3ALOzXwVG1ygpCD6kO4maj4CX+KGItaaLeAsvtnR0bxWUrdxO
 SJWmn/DkikCiEDVqSmr6AGMtelFsvksYVLiclDnI9ReUcWXCCrPGJ8YZr7o+eEon6nAY
 1pdI/FF7J1Is/VNmEaTn3ZdfjCwhQjVhnVMp9VdmFC3Pp9bRjE9TCi9swYOeBbRQMjAn
 XeRdKidKq6F91B7tQIk3FsVzRHx4one+10pwKfPa8VpylAT+T42aB7DaKvqCpIy6/X36
 NiWMprjJbie0HXaOHhj48cTvU/PWVnCGLuzB7+gIZ/AY89Tmg8QkTw3rDwcXqYf5OTA5 gg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Md4Kgowx
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: Install artifacts to staging
 for kmod build
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue Oct 22, 2024 at 7:24 PM UTC, Thomas Petazzoni via buildroot wrote:
> Hello Adam,
>
> Thanks a lot for your patch. See below some feedback.
>
> On Tue, 22 Oct 2024 16:06:27 +0000
> "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org> wrote:
>
> > From 45b18a0b5af619fd90194634530cc75f995ea57a Mon Sep 17 00:00:00 2001
> > From: Adam Michaelis <adam.michaelis@collins.com>
> > Date: Wed, 16 Oct 2024 09:06:14 -0500
> > Subject: [PATCH v2 1/1] linux: Install artifacts to staging for kmod build
>
> Please use git send-email to send your patches, instead of sending the
> result of "git format-patch" directly in an e-mail. Indeed, otherwise
> we have two times the From:, Date:, Subject:, etc. headers.
>
> > Installing kernel build artifacts to staging so that the user could use
> > the exported SDK to build out-of-tree kernel modules.
>
> I think this could be worded a bit better. "This commit adds an option
> that allows to install to the staging directory the necessary
> files/artefacts that are needed to build out of tree kernel modules.
> This is relevant when one wants to build out of tree kernel modules
> using the Buildroot-generated SDK".
>
> > +config BR2_LINUX_KERNEL_INSTALL_STAGING
> > +       bool "Install kmod build files to staging"
> > +       help
> > +         Select this option to have the kernel files required for
> > +         out-of-tree module building installed to staging. This will
> > +         then enable module building from an exported SDK without
> > +         the full Linux build and Buildroot.
>
> I am actually wondering whether this should be an option. We don't have
> any similar option for any other package.

I think the main advantage to being an option is to keep the size of the
SDK down. This installs a large amount of the kernel source code which
appears to be hundreds of MBs.

>
> > +define LINUX_INSTALL_STAGING_CMDS
> > +       # Install artifacts needed for module builds into staging for SDK use
> > +       if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
> > +               install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
> > +               rsync --exclude "*.o" -a "$(@D)/arch/$(KERNEL_ARCH)" \
> > +                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
> > +               rsync --exclude "*.o" --exclude "*.a" -a "$(@D)/include" \
> > +                       "$(@D)/scripts" "$(@D)/certs" "$(@D)/Makefile" \
> > +                       "$(@D)/Module.symvers" "$(@D)/.config" \
> > +                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ;\
>
> This feels a bit "crappy", these manual rsyncs. Doesn't the kernel has
> some relevant make target that do the right thing?

I looked around a bit in the kernel and couldn't find anything.

I checked a few distro packages and they all seem to be variants of
this. See the following

Arch: https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/main/PKGBUILD?ref_type=heads#L133
Fedora: https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_3507
Yocto: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux/kernel-devsrc.bb#L37

I would guess the rsync copy is including far more stuff then is
actually necessary, as most of those are significantly more complicated.

Thanks,
Brandon

>
> Thanks a lot!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
