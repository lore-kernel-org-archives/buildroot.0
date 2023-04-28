Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC647C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 04:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15864405EC;
	Fri, 28 Apr 2023 04:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15864405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGzRxlufCvDV; Fri, 28 Apr 2023 04:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 137ED405F2;
	Fri, 28 Apr 2023 04:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 137ED405F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42A291BF5E9
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 04:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12EFE60F0E
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 04:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EFE60F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLBkx2rdAlQx for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 04:03:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1216560EAB
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1216560EAB
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 04:03:48 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33S26nNp000850; Thu, 27 Apr 2023 20:20:59 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mnud8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 20:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTc7sO8zM3/xu5MBqfNG/3SNj5OGcrvHPuGPsp4gt5mymaeJqmxUFyME2Zt7nco+hT9v6WstoYmEByNcJFjj4adYmIccs9CRxRToVp57gU1ljjuljsx5O0KqLECcozVPrj/4NYoF/UjjQVIGPwRFiFA826mRvXKUO2VR7lB3O9l+11CbM5TqpUXD0RFPNngWt0rChPizV3anuPOSJKI8E/mLs4+CblbYZMg9jNREOIDaIORxsWhLuyEugp2uFe39VoWhXb0URYhMmXhu8rM4ihcsNukUFEdM5DOv7ppHg6qzIyoig90tpNWq0lP5VbNKjuGLPrUGiP+erURi+MAcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mip1XLc0MerT8tBCBBS5l/7AUCGg/GREGILCkd5nWMw=;
 b=d+zyLadNcmr2le5d0L+F7AV+/kzxSr/yyDIMpFFlCFvJW6peTpMgqpA+SJAt7ZBvZIjrf/t40JbMxYwr/CSkW3o0d3MpEXHLlmo4g5kgwl7rsF4FyoqhLJXrLTu7Bv0pmuE0nm53Pi5DbKLMJhpys/XsbR40E2kFyuiSKMhD/nQrB9CUTuIf9jGMfhujOX2zd0Ae8HDqN0nUIgD1U9l60lPOYWCI/LB9gEe0gWQkE/TgHKEooAVnb8LjkPmhuEplrwI5VkcLop5bLi0yDQPcEs3E//rnlXYvLHhdGe2NLcNbnW2TqG1h8nPIqpTwQhhDA3EPYZjbD1RQvOmSEc7GzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 03:20:56 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 03:20:55 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 11:20:22 +0800
Message-Id: <20230428032022.611000-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f9a6bb-c737-4c01-825d-08db47979422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVmYQ40oqzwpKKnnfo8uQ8qorvcL8RPfNp4L/bmYgQCj8xnSSisjcj68xiu6jTZBWD7MKBh+lIepXb6MCnY8lAJuFGXqOXUbLwJ2i6N/c14AljthgIu5V310eU5RoykztzoZmQ3/LK8ZaXVpMopqwUO7PpuZZihzaMzLQVPcvFqVyP7/xvnKi88ou1zwzhSzJqEqZi8/4Qqs+g10+Omliqs05hTE/Ywm/3eh2vBRC3E0GdOV+R0fQuF1pPWAg03u+eKUzOKBqtGULTdcvizP+lh/ZYvEvuPd0cs0E3wAopgI1SkhIP0pIY0MtAXqanjKfDp3p0z7G2uTUpRN2Oq03Q47s9t6nwa3cRXPlRlY0uRba7oGRLjKOrg68SRECxmMYARZcafQiY0a1ghx83+NK8eH1IVtkbGkOyqsToY4hbq2vP4UuyYI6fRW+Kr5kA5gVPY3l9AFVSCMuU8l743ayythongfnEyCYZdjiIJEAYc5awAKTUxaoFmYYyKcywdoj56SxD1zg6tTwN2oxI5PzOK2SH7AjPMw4exQYlnPUGTeSXDMsj1xIhelVhSeHuNOfV9A8HTNukeJA8Uc+sZSDU2vOnQjOYYxP+Ve6eIz9ti5/KkjXtmuNonIqW1FC4EBwfYeo7n+sK9UTiTdc189TRUbMoyvAqoiLnNyElYslXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(451199021)(44832011)(83170400001)(6512007)(6506007)(1076003)(26005)(38350700002)(186003)(38100700002)(6486002)(41300700001)(66946007)(6916009)(52116002)(478600001)(54906003)(66556008)(6666004)(4326008)(66476007)(966005)(19273905006)(316002)(2616005)(8676002)(83380400001)(2906002)(8936002)(5660300002)(563064011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMpB8/WksOCJpgKELCrBLqkNW1GjKO/iFbmyFhFXiy1xm+u02uZo3vbWfcJr?=
 =?us-ascii?Q?TUgtHD8ifuiDknTbRYdBVuzICRDcqRsiTIP2Gqc6Rq+Pg5eMOoXbTWZXR2Ug?=
 =?us-ascii?Q?6dQc5zKIy1dYvVxPh6FBKqD8bNttoxOJTAPiHH33tmCpqdxA3ufTQ0S/BrkF?=
 =?us-ascii?Q?ZfkHDnEl9MhwFaHtZmm/8eTB9ID3EtUNrb9ekVCufYjL6vIYzmRRP0/0bTbn?=
 =?us-ascii?Q?lyH1LBNqRxQF+GbH1wjdzq2aerxlIpmkJjWFiJLnQGxedDxD+rFwCtRBs7c/?=
 =?us-ascii?Q?+GyIHifBACKGCyyEQ6unzx6H+BDSs0roo7Zzw3JLrymhwp+1TrdUbKiZ1bwU?=
 =?us-ascii?Q?XfZB9J6/NB0FhPnXrKxPzVUxEvkhHqt1PMKljzN0EP3eIJxLmsbgNEsHVYT9?=
 =?us-ascii?Q?KfJI9pos5TB7KfLjxtSQerf5tm8qSpcxOPwQfNFr5lR0I7/dFdQQCwbYK9Ze?=
 =?us-ascii?Q?WNHITYALgQcjGoUTzJBmUoi0UGcAK8MR/FnzluJvkDyscf3s3pLjyIr4OO/8?=
 =?us-ascii?Q?ndWCytLWaeH3SMM5Wt+SqhYmge8G5T6aBpEeZ+zExMLCAjaKPEzxZme/i3fj?=
 =?us-ascii?Q?FnZ6Htsl0jneIjuwIAv6QqQ+qVG/SJOzZnoJi+tZymoX1fnE7Oyjt+gMePMz?=
 =?us-ascii?Q?vlRwAEzO+6PqqQ5VuNFDgBzyGsLTTpTg5sH+9+SMMRqGi2YOrHFI9DTvc7CE?=
 =?us-ascii?Q?9uJ+gf0HDJ5t54eWwxn7t7Rk06edBNY+F7GMXO1AosIQUcGj0qUsyQ+DZ3qU?=
 =?us-ascii?Q?9PjPHX72/2xh00/KFIMcudVgVHk9HIDxqGbPShxCWYUmmbR+pYKL/nArltl+?=
 =?us-ascii?Q?+4NHTVMrdSBBOzpdA7Yj2+Dw09Of8GHY9h9yEOfAmivpxUu78afoa56RMD7V?=
 =?us-ascii?Q?QMVgtzc2N0wVB19doesZbM8p23NabCHRQ0A6uRu8uRZi1RD6fOz0hYbVcgfT?=
 =?us-ascii?Q?UlrqW7ai9Zn6wbPP/H19uE5gAqk+UY4hq4THDZ79y4cAcrsUfl2cmvgJj0Fz?=
 =?us-ascii?Q?reZIqBWuvYt+6FnWil8dtgNdmaGVZxcU9mWKO3vHJMVpawD0CHQl0p6OlAPG?=
 =?us-ascii?Q?YMHzIVIqQkju46ovqW3V9vqoZdkuNsLfQ47TQT/PKiZcfmhrEvcxjpRhJx3/?=
 =?us-ascii?Q?4klxWi5yGTQAydZPsp6M4z2QtJL29i6gFlJS63SPjKW2goFfBsBp8BPzw5Oy?=
 =?us-ascii?Q?HTzDLS65eLyDyYH6xvDeAzedwkFB6q9JSKs3U0OmwomKS+fLwyZquuOTdAX8?=
 =?us-ascii?Q?DrUKzNv7tpBFY62xhXojpMcoAXq7tbq7oJimKdwIDyd7FCVApI+BLBmvG8Xq?=
 =?us-ascii?Q?GyKoYHtkwvUxp1xaMmAFW1H+MPrP16ymFAiAG2aHKwbBjcD0idJV1tHciotp?=
 =?us-ascii?Q?l+yoeU9GWeqZMkHI+yl/qu4FZNGA7RnKQPWROhnf/DNNhqxO8sRy7wG7prn8?=
 =?us-ascii?Q?ffAAYbRIXgx1PAQPivdv+NA40mEpj7tG8JFMImAYT7+xJwR86C18Unl/kekR?=
 =?us-ascii?Q?AE0l1FPuZhh9zbALaN5NONFU5YtlOjSa+vidjZfDdFwIM57+kUJFZPJ4xjSF?=
 =?us-ascii?Q?0y/5jyksp5Xp2WBt5HateChUJsxdUVrDMaqBrCgFNKmXMUjceB0YRUHuv0la?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f9a6bb-c737-4c01-825d-08db47979422
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 03:20:55.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKZMVcXLs2whMKQ1afvc0ybvIDAXc1RWySFPY+AUIrEzkqN7P8AUcz/EqxMnfivzGaFxKkk7bGI8VVInNv4MVcrQ/t1/AJVWiwaHrt8udGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
X-Proofpoint-ORIG-GUID: cdQhAVrRJO6yOGfgsZjkx3RNTUO0pmzM
X-Proofpoint-GUID: cdQhAVrRJO6yOGfgsZjkx3RNTUO0pmzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=941 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280026
Subject: [Buildroot] [PATCH] package/dhcpcd: bump to version 10.0.1
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
Cc: John Stile <johns@msli.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Using github as package site as announced here:
https://roy.marples.name/downloads/dhcpcd/

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 532fbd467e..879c3db1af 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.1.tar.xz.distinfo
-sha256  819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c  dhcpcd-9.4.1.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.1
+sha256  6e9f6a5c47fcd8a763cfa26f1ca6eedf1e534992224a01d6c1ab8abb154af972  dhcpcd-10.0.1.tar.xz
 # Locally calculated
 sha256  4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 922d289b26..82efe10ef9 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 9.4.1
+DHCPCD_VERSION = 10.0.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
-DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
+DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
