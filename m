Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E5C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 05:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705AA60C0A;
	Tue,  8 Nov 2022 05:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705AA60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlwPB6oAYtWe; Tue,  8 Nov 2022 05:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9274560AE4;
	Tue,  8 Nov 2022 05:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9274560AE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256111BF37B
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 05:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8EA260AE4
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 05:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8EA260AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMn9IhRbhvR2 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 05:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A559607D1
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A559607D1
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 05:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpPt+3fMojY159hkl4K+GkO3xiNFusGsUiwR288SPoO9sKkFmA2jADqJ5D5y8ZPsxy4VgdjG21L8TW9Jl1VY+eiA+j7iUe1erlb7ih0aqtEUjbB4J/QUMP50LhK/VEXAZleLFvDXkWiIzyXTmXzPpFbazJncn/9ZjEx6s+ioKxISoZRle025g2tqYcTUSlDfHzDYytgjUgsUwZerfv5AK5ltRFNYuGUpj6S0DKgchNoewTVimQZtZleKohmo8eTIUocOKlvE4I/5WBqext3lKaDHG8sBAtyb76MkU6U5fLCHtVn62QAWjDDGyJJL4UZfenkeZkELfNzJbhgIEH1B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+je5AMRI/ifG7LQjRrOgYJ1z0vTxK9tzJJQ2UV5+Ycg=;
 b=JoZGYxdeZ7UrhQvsEZ3jhFg9TNFmXCICC3zIZR/cYrc41RqYK0qLQw99HpoqJI59FQHC0tEZzrR5FOgHXU6OtxssKfL+U9WxQ6ZsPJ9xjFfDMjNG+kmkp8h1UlFO0ebLx0GFPWcYCgOmBltG81bwcpb9urYTzru6joa01QZkTfTyIXHS1yfDuf0/zyv5RC4dA5drOO9vv3Ravb8iQ3Wu4usq7+8Ea9176YnNGPAtt2MW1ZQXFi8oQN4WbYLDbsFCT9pbdd9nSpW7cwel2f9bmv7EroXWz6vThqFD5Rafi/mJv1HmoSnfq/5d7grTQiYr17TzphP4+j8bQbBYnkbvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 05:11:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 05:11:10 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump to Xilinx
 2022.2
Thread-Index: AQHY43o+2LYwfoDimkyOqi3u5mUWxK40ma4g
Date: Tue, 8 Nov 2022 05:11:10 +0000
Message-ID: <CH2PR12MB5004B091AF1E86EB7E50152AF03F9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
In-Reply-To: <20221019051823.26706-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6929:EE_
x-ms-office365-filtering-correlation-id: b9607206-a0b0-40f6-e177-08dac147a685
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wA5vQt/RtegRTIGXVTdQ5vLBDFPAiGGOExjlclPeQYb0lsunrlGLe1aXJQhEcOxIkipSbedjo8oXnxgk/0XzQO9BmCypa89x9Z98hlANrx4GbMmw9TUc41nV0OLUPpbScXLWl1hP8kvn5Y5I93e3TzRDLGNdqfGsnP10xdHqxS3Yxc20ga18bUYajoxy9CWIpH3p4/XqqPJxfB+B8uVLOVyB/7hgx62I1w5xd/ZXpD8FBQWP4l0VqjQhLGp4yHZLK/Ht0bR0E0zji63CsucHk/FTiz2tHAJN6Yay7/pA4dZVZAGKu7LW/8kQyPs+gx5c5jGZUF707lFtdK1PtWSjoTh78dVgm7Pq5Efq6syX4E9l3UKEWKUwr9ybSAylXXJ9wCKh3Wfml6zLJtAfDeex/rkLF7kmV0O62iEW9x0F3CU5Pp/17AjFR2MEcyTUYu+SVKw5zabPuDWfzcAyYrJlXeUYUAQTHplpnlORZYvYLHZ9CsKjhTWZsFIbPV+w//TzDcThM5/8qTOG9VT9f2zFrLmD8TXoLdAOSxaNDMCkod74F3sBy4n4NvoQPFUCzk2JqjLbtsIp0d1hrBIe4BHht6UcvzJKu6HmOEhv6Bx9w0lJnGVgjSor4wlzzYqVooOq5IRJG1ljR4O5ipLc60LrhrjLA2VBjjjk3kusomp4pNJ/75q4MuB354fH/QYiipxHDHvp1uYzmgIsywMWfPjvv+AYWf/9vOHft7yWVzI1oeuqxVg9L+iJ0ut+U/gCXGc9wYw9zNFJF4Vl9UoV/7k63A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199015)(186003)(26005)(9686003)(6506007)(7696005)(83380400001)(122000001)(2906002)(55016003)(54906003)(6916009)(478600001)(76116006)(41300700001)(52536014)(5660300002)(8936002)(4326008)(316002)(66946007)(66556008)(64756008)(66476007)(8676002)(71200400001)(66446008)(38100700002)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ycdEm3sN2NmDtpqsT/pTAU4bFzSJm2ULpYZLywsmUXmrFVovd8Ekxrvzx3iH?=
 =?us-ascii?Q?uEAqs0xheBjwrHl634uCL+IX8wVbSkEnCSoxkdNFtAgV7EjAgqfv6RvhUhNU?=
 =?us-ascii?Q?WVl1W5i5m+iFlKf46Wxa9KrvxG8//qRnysA8jxDCdNMvFHEfOZt1FkduLUsT?=
 =?us-ascii?Q?BGgGhxKQ2uTvp/jANLCxEYXo9smWNgckkLIcRYqnvmw5WzVuIK3utaX/wePC?=
 =?us-ascii?Q?sxpK1wppLxg5cHZeVtLI1Ucdtjfk+aXV5e8e4IesKCC7HpiCBUhwsSlwgoF1?=
 =?us-ascii?Q?4Z5v2NnWs8fejOzjP3ie6WOMY9MzaZZejK8Eko3SWyMJIPo6FloGgHgBunL7?=
 =?us-ascii?Q?6RxRhrXwrB0fHy8arPhGz9CpDbw5qsy5OtLCuBCsae9BphL8oryGYYDoCD1j?=
 =?us-ascii?Q?4TdiqulIabcYzIMlckFaXXjHCwKO4ayxTDAW+a04NcbdsGEQjEwzRg85h8nE?=
 =?us-ascii?Q?jyaevyH1SdGjVD3QunletxEpxVoqvnyfLASv1upbxsbQLhZxUGqnUCZ8JgdL?=
 =?us-ascii?Q?FP2d4rCfQVcmZJl1UJyTm70mMKRCax+q9OBOQIYSNTnMfucv3tnX4qvLXQoT?=
 =?us-ascii?Q?WLSU3ys9yFiYR4CaP0pMEScxip3OfP4QNd5B6+CwvnDTH9M5K9bxe161m7gY?=
 =?us-ascii?Q?Cxhaac7vFES1xzbAuI2dMGtHXalkfPCrhWroMh+K8OYeyub7qm56//8FqxkM?=
 =?us-ascii?Q?rqOmR7WY3/VU9tG0vi7H1AlmzdP+sM/G1d9PbYHtdWNbIj7f10Y2uk8LzOea?=
 =?us-ascii?Q?6yfOBmLWVXr6zMfS5Ie20no0k+s3E1vRRTiSX1BEztEV0FhBHp1IKRjJUVLh?=
 =?us-ascii?Q?uI6ER1xkQRoKdyoSk94ArjLcq+DYudoFxumc3vLKW8nAgl6ZG9Hqfh55LCYN?=
 =?us-ascii?Q?UQRPSG835tlD/HegzMDZZjt5sC07gusRc6paFqqWAlaggIDNiP6Zm6G6Unr3?=
 =?us-ascii?Q?0RpgPd3em0UyxRmNYtH6mbQpVs4J7ZDCC2RS3860fyrtJDHd1CEq2JL4GKlS?=
 =?us-ascii?Q?UVm9szgCTijZ9aebqosbZggEI+bCE569xfO6Ct3v4+n53YB3A761pG8faLcU?=
 =?us-ascii?Q?5jXNnD1xjm8VWEZA+8Tl5qmmxHdJYruC2/vbst3tf8rMthMP7/Y6KIMGJpfE?=
 =?us-ascii?Q?xyLiOXpaJRAjhqJ+sokPyRgAiGFbVHgTENagT+B6/8tt9K5jlhzgPvQbphmQ?=
 =?us-ascii?Q?Ku7rFmSGRJ1nafMp5r04zig6DOl1KFrQnVwdizs+acyLk0G+ZF/XP+vQf9w/?=
 =?us-ascii?Q?xoWqWq0uZyIuvb5jxr7XZ34yVg3ndhm+sWbTLnpf1qOUsfPgRdYeaCRLC4Dn?=
 =?us-ascii?Q?xxQWYK461SUTu3QkAkUFOjca9/iCHYy82yIhRi77+ikyz5Sk/PDpZjrgomHQ?=
 =?us-ascii?Q?TTzVvBLL5biIGcLXqx+rPRvp/2l4LY/FKAAExSsuhKgc9JDRaa2Y5PqK3Ctt?=
 =?us-ascii?Q?28uRTGAcZA9cCfUb9nLQI6ol+77cP67VQuCaxvE6W6f0dHiJThMer810s6lG?=
 =?us-ascii?Q?5tZNqAAltep4A/RREWa2z77V8nrvxT6TQGvH34FgFUMnJls1SIuULZ98+wqo?=
 =?us-ascii?Q?VIrRludXlUT3nafdaRQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9607206-a0b0-40f6-e177-08dac147a685
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 05:11:10.6352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGI45vYr0WkJwv4VBQUgGsv8Vvupjo7WJ6YmkyG+nFqSGZlGx08XkGK1SbAMnwxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+je5AMRI/ifG7LQjRrOgYJ1z0vTxK9tzJJQ2UV5+Ycg=;
 b=PMvK8MPRcrqlrjUxfuBkUxr1LLp50gJMbudgH/FrJQ1bp8sNs8EQFSrkzIR/Eob+PGZVOUQ9CRmjANiIkaQs+kElWiUkgfFLpdlZPhikgbTO2YaBEjFq0E02CcrFKJQiF6wYtVvRkHeJU8Ny8qmO8nf28wHyx3BiRWv5l6tMzmg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PMvK8MPR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump
 to Xilinx 2022.2
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder regarding this patch set.  Does anyone have any feedback?
---
This patch bumps the zc706 to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig index 82c47be7a5..e9b9e0264c 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y  BR2_TARGET_UBOOT=y  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
--
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
