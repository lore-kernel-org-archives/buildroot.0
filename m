Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A63C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D560260B36;
	Fri,  7 Jan 2022 22:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-adRHpSpwoX; Fri,  7 Jan 2022 22:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3832560AFE;
	Fri,  7 Jan 2022 22:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35C151BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD92424C8
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVnFvPKR0KsZ for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2096.outbound.protection.outlook.com [40.107.212.96])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22699424BD
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeId7P4QjPKLJk1RC1ZLIuBzHD83DMNRXMglbJ6R2L7ZO/dt1380FGsmrT6cPIkXesLyoYi+9+cc5Xq0nHL31inw+RPXqyAkkflqqc9eI3M/Sf3c1lZSc7cqVx3KjLbJklI+j7iaehb5O/0TrkBN3FkKtXLYzHppuLfNzWLAHT80AwN1mcEqSQodzBGD+eaBsj940aVDE1y0GHV3p3vX884Uun232mocnLcgRqD5Qx8t/hQ/nQfu2r8Givqyw2oFVJgWnO+m+dtr8yK+Kn2lEgQN9kBkazMRL0Xm/UexjFl5VNYTf500Qbffap9F3OAcmbDlOt1fWmDpSygsleGI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7o/GeDw387QMBPHhU5ADSVUZSqk5pmFGJiB4i6G3UM=;
 b=bE5NufA1CVnlz7DXei/3P91qTO2bVJrkbrgmdreFD88ObLRHCBJwdZ8bocYp6aL5WimpLj0l+ETq2UiGfTmDPqM9WRKrCLPXoFTJxG2eSS98Oflaz2ne/aZkh5yVWtl81Z/QF6oEbZwZKpx/LdshFtrplJAYPIDb/dPl9n9bMRqgaF1mlgby8yD/3gQViJ8t8VnPTH+4lMQrt7+sOsyZaXp/NZmVtkr91bzxCapiKvo1vXhKeehMjxn1eY+Xz8Lrci1xFvDfQc6T11NOLUFURcuQz46KKaukCRwehZCZDafXQaQO2GiNi/DQHOCxpiSMSb1V1CVZgBhnrrU3zAr00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7o/GeDw387QMBPHhU5ADSVUZSqk5pmFGJiB4i6G3UM=;
 b=TztSkpafXwjx2EIBjEhP8d5OJTgecN9rxptu8f3pjEiW/MdKhibDP0k06tGeYtvZCNfujl2FfVrNsuE4N03feI7VpM0q8PIsMrcEgqnaH2XSfvcw2RYVE3EI00StsWjv0OAhqcBZ3mnXLQ7hAj7sgnpWzZV1vrgFENww0GnRGE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 22:26:55 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f%4]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 22:26:55 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 14:26:44 -0800
Message-Id: <20220107222644.1612206-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:907:1::33) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50580003-8efb-4335-a68c-08d9d22ccf10
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB56368CE18A53E717C870EF81A44D9@CO6PR10MB5636.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaflLQdd5/levhGxCu17LdxVZX//lQCG2V+pCTQ7/3LIUMqRGO1Yk7T06u1IXrNz6EoRcF+A5yqypTBAe4Ye5ej4sqUUVnNhe2QAbGhBudfsdaVwyqSG5/3ARqQpclYdOMVt72yh/RVs+Qaals4n5oCZ9As9dZ/7nBsTjAFYJisu+dmBr5wvEaAmOa44ahYqNqrLBqZnNKH5AZx6EoEuXgUdCgCxLrBEOTlaZxEeBl+K9Kd8GnXSW5ApNc85AhMFES4HLFFCrYaEc7mFEj2MeaA+CBswdiijwUB94oNi2pO5eV+cAOIRijxVmEw6DN4imWJHcB6izgzpA2N/nbHG4+/wOPUTiZ4TSWgShtObCKdryLaB5H5X0Bkj2JjH2+lPOVIzlkHA4qkAAq1Len6kImv6nV6KWLfA7YlaYZkAGXsPsIDMuPf8h9DV+vunGkk5z/KXld97vVV00omBrJOU1iscmXrr55KsiQBJ0ztgD3JpVi+jrLIkYRMR4MxeCQhPQmiScJUHrRcJsnzlWWU7JN/ULzCZapzS/bvZ9m6B30whZthbzjcrfpe+rcmNUXOi0cuGy0f5EA9u3TMXO1Rrg6riV94+FEEAKLbS8xCDR1HV49fQKxID84kaZZdTaMmON+x4Q0Bklf1CJkX25gPChed++5xNK3K11ZHQ9cIT/pMTZUR+Q554ztwxisz/UBBShNpF8F2xHK6/vnCioTAhfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(42606007)(396003)(136003)(366004)(346002)(39830400003)(2906002)(1076003)(66946007)(6666004)(8676002)(38100700002)(66556008)(38350700002)(66476007)(5660300002)(508600001)(8936002)(52116002)(186003)(83380400001)(26005)(86362001)(6506007)(6486002)(316002)(6916009)(6512007)(44832011)(2616005)(4326008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LELGD3mN1rsY4qJyJxuk4M8JLkooxBFGwKF/o2MK2OlHyFjHXXwCLrdM/bdb?=
 =?us-ascii?Q?GRNUwCR9T8T6PU8ycoU8fhMs5hhR3IHSGmx07Hs7DX1UPWhxH4Yr3Yc60VpF?=
 =?us-ascii?Q?FshgOaaSe5VwriY2B29Ftwuh0kqgIuscRpPHJvxLVT71TP59sDbKAWNIyD8L?=
 =?us-ascii?Q?QnAe/dJLKDcjZ74otfcJHLV57Vxlgbuoa1jngUBLasSfQmSNZy2w2lnrZN4d?=
 =?us-ascii?Q?9r+Izwjj9kysvjYwUYSLF+jZh3wzRln80PNH0wvAJXfIjaFHL0Qghs0qoGaS?=
 =?us-ascii?Q?Au1EeddFQwzCLCieuvtridq4YOAB3JG99MOaxSR4tsOzEkht9MK9+NB9VEGw?=
 =?us-ascii?Q?qjcZ5b77eAU+k2mg+K+XeBvoTOO6enEjMJ+FUl0LwNP1y/i+9Khr1AnHvato?=
 =?us-ascii?Q?MLd6uWHvjx5J5OE4+REWCQeDkhH7IthDuluzGgxZr/uMG06u/zNyhye9SQH/?=
 =?us-ascii?Q?3BjFI6YVgtgbrZ3rdmwmJ2nTZBWiDx8BpzTmw8wyLLznNIwombnfKL8ievJB?=
 =?us-ascii?Q?ClF75WM80sn8J1E/XU3aN4F8diJJ2v4xx3d9PTRrzF0xPJ2TDNJ3WioSejFA?=
 =?us-ascii?Q?wGoVjfKJt0t5skY8/zJn+DxUX+59kCRxDh6u2nscmgE0OTesemGHPK/jhOjf?=
 =?us-ascii?Q?7AjfEvfCiQa7nUgn7UogkUdhd+br5cXCoCVcStT/MGfWqIYXr0cbKQ1igf49?=
 =?us-ascii?Q?Pxs/56/c7Pz3u7kYlnPY7RdrCsvvGzzgPp7g73ir6TnBqqRlK+yCQzXyl/Nl?=
 =?us-ascii?Q?vqe/qvKApLdzegu7Qy1byMvr1JTS1g0yQhYFEeBgl8LchN03kE/YzxyVSWD1?=
 =?us-ascii?Q?cWwjRJb9ygwiokAk9l4/H7UZtBbiJ4SCA78AF96nwNIj6W7+3pNH2u4GEd1E?=
 =?us-ascii?Q?OYZsztdMdqMoqcpXMIECHz3pB568iIhpQKn3j0AHBtWXrgGjgw79rUkC2AEn?=
 =?us-ascii?Q?rZpda2WrAzRgIPEV/qQHv7Lqwtr75HMA9YQ1/1m7tu62quwsLZxty07hAETS?=
 =?us-ascii?Q?ncxIuut38H+sJX5+Clr5RsjQz/DIMVaOQn7ekmZUTozzvvYlhIP54/geLFRF?=
 =?us-ascii?Q?HHaWwwgko4DH1F5SqtDApAZS0NXJAtdmUGrY0amh+O+hS+MXNkBLCwVVt4Mq?=
 =?us-ascii?Q?ECeeTMB8CWFjZUztIWG+p/nEjMvMIrMhvzJRVkiJUHd7v8dlZE8M8iHzXhxJ?=
 =?us-ascii?Q?TmiVj114PYNs14+8JYf1Lk+1jfDWxNvD/80zHuW0ySRoMHU3ay9hgsmsNGHz?=
 =?us-ascii?Q?a7tEj+Q/48Hh7b3oy/vOGPYaM6xJPOPep5cj6S5WGh6K+0dR1YKLM2lR22Rs?=
 =?us-ascii?Q?+cF/Q59Dp+namjE9fvtlvNuxXkCuQ9MzanNxOMEjywcl4WXIvfckynG/waXD?=
 =?us-ascii?Q?OgUidpKNYdW78MDXI/LO4Goyo6wAGE212HBuedwebPRBWmTlRPkvp4lsRKeS?=
 =?us-ascii?Q?XKrmi2z8CPPTvMRw1Ve5nWDMNcO6go5EPFsYV2aZ4FDgOUECfrinDk28f/FY?=
 =?us-ascii?Q?AzeQ9D5jo7LFRcJ3qBQSMQDxVrzzVd0ZITRKShwZxIL5DshvsHS7OcCgQEi+?=
 =?us-ascii?Q?PndkMr6WSbsyaL86aQ43nM688GninuYJnz5IHzZY9GORoT6mNg+loLG3serN?=
 =?us-ascii?Q?l6c9mgpP54zM+of/7pzbFE8Q5CsmpxcSnvmotK67TmG/e/lDsTEqOtF3UsUM?=
 =?us-ascii?Q?DiyBBg=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50580003-8efb-4335-a68c-08d9d22ccf10
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 22:26:54.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRRYSZ9mpYKgTupKPU3vGofK+3vzqf9WBa/ESIuCJh+cj6amlaGBfw80lHzVMXecSCz/TdxjA1KcwrdWtOCCQsZgwQO/1fy39gR+l7aGWAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5636
Subject: [Buildroot] [PATCH v1 next] package/mstpd: bump version to 0.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Shortly after MSTPd was added, version 0.1.0 was released. Update to the
latest version.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/mstpd/mstpd.hash | 1 +
 package/mstpd/mstpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
index fd76b959db..64e946d6d1 100644
--- a/package/mstpd/mstpd.hash
+++ b/package/mstpd/mstpd.hash
@@ -1,4 +1,5 @@
 # locally computed
 sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
+sha256  03d1ff4ca189d54322562cb2891888768af719d2c73ceafa5f1ca96133dffeb2  mstpd-0.1.0.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
 sha256  c5cfd44652276184374adf454150d436ce958ce50acc4ef9ccb3605a5ca7a9d3  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index a870352869..907d094242 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSTPD_VERSION = 0.0.9
+MSTPD_VERSION = 0.1.0
 MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
 MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
