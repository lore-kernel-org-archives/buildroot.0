Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BCAC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 03:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE8B42050;
	Fri, 28 Apr 2023 03:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE8B42050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbJPIHUSOUZ6; Fri, 28 Apr 2023 03:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2DC4204E;
	Fri, 28 Apr 2023 03:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2DC4204E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478491BF5E9
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 03:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 272D44204E
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 03:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 272D44204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Z-8mvzkoD28 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 03:31:59 +0000 (UTC)
X-Greylist: delayed 00:10:58 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0004204C
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB0004204C
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 03:31:58 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33S3Ba88026289; Thu, 27 Apr 2023 20:31:58 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4av5p2a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 20:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmKp7iZ+fT3VMq1c7qAliBiGDWyfoOh6wIoa83+ImJQAMTVrOJHOg6QQrrfWpuASVb/FRsG/UzBEg5NsADAPsIqxCdPoK8d1ckmUi6UmcRyT3Rd/I7H/hkAwoJAIkRA5n7g0Cj5YzOdvNtJ58YSI4KMvVOtgAquDhf7U/afHpdsUWDIRDpbZxkY4yR7uhwgUeeLvKkRn/2V+8CNSwTiiYHFUQ1KtYhmqvciYRMW4p7CR+N83R+BRUTDQs2JeH6IgMI6pMnKyne9IYOAtGe3VVWdCwL3iagoj8CfdA7lBbMd71WMEDD3Ge8RR8yzLabXZ3ygZmrh4BzfDMKBHioSZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mip1XLc0MerT8tBCBBS5l/7AUCGg/GREGILCkd5nWMw=;
 b=U8F/HArNgTIqnSGe3dAV0abb8nejSzk5Jy26qK1XKnsJG8SvpY4R0z/azDrEAQ1i35V4Oeqof9qqHZL4tngFmxbZUdCub6eOs6TqD7Vizap8wgf92v7LxTlxdaKusRLARrYEN5bOb+8jOWiYcwX1tqCGVnrCx8hR3yESsRHAnm9IZtjuX77T1geH9qQE9mIkn6hoBOxQoG8nWe9vFsu9HnNbO7EMMoMQfEq6GgtkemwkNT1ltue3guL1PFB/tlc7ccPlC67fYIQSlwgRoAB2uDdoxGbkXd9O1LdJwIMtgCN+uXwcYchD5Xy62vK0v3v97byOE33QPAfWogdVeNubRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 03:31:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 03:31:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 11:31:37 +0800
Message-Id: <20230428033137.620562-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:3::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 29873cf3-49dd-4917-46f4-08db47991cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPWTYROwLxgC6nC1CD++sPzwXhXCRQ6cxJdLkvBeGUBGFwtUDL5T2jTIDwk0cJSJlgPBMsdZd3+TJAM7bsE0Owz93havoFaT0TWWNnoIfkHm5WvVTFFVrCjV0DnMXyOW4qglvIRUx1fTYh0SWETcS24TyNWym9Ok8pBAuFbtzLbzYc6oz3+9kNA9d7e04BslVAl7hQqhCDMDWEHR4ePOPW3UXjAIwyfkTQRwnHW2G1IjyREYIaFPAhhy90vTldLJfKPOXTWGWuB9TYGRK9vxE9He1tmh9fuOD83hicCw9NMw2lKZbaqXNLUIBnhUoiGIOGuz+7BbSoiG1FcIBq0TllGRnSkbN/+pxTpYCP18GHXRWhDiIQr6NH96zV+0Cq6vZC5ndsXMnsbe9ixFkFke36P4aGTPAIVlzhVDQDZOte2IZyeDQWb3m0oUaDt1zZ5HhFbTOZSkMLKJs7U52+ILaxdfNe1VgKKUzG/90h7a8h3UyuUL3rM+lyrPlSTTseN/Vu1khGBwVzVVEw6NVMzbdGyLX0xg2t7y9czjBIQ2pf8fQKj3KzOYl8DB365EX047g24UQocCsQdgzqlqeITVk+1c1EQBoEU4g5rfrcuquYdm4eUru5t1/8lHrom1RBTAhoBvzKUEmotyoVaVRgvBau2tfgrxIg0Rvb/66AXfLOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(451199021)(26005)(1076003)(6506007)(6512007)(186003)(54906003)(478600001)(19273905006)(6666004)(966005)(52116002)(5660300002)(8936002)(8676002)(6486002)(41300700001)(66946007)(44832011)(2906002)(6916009)(38100700002)(38350700002)(66476007)(66556008)(316002)(4326008)(83170400001)(2616005)(83380400001)(563064011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JaQXrAa8qTPc5IffLs6rZSwYVzGPGPyE1D0q/ctWJjRVcEkXGCnh/b9EYhQ6?=
 =?us-ascii?Q?oJZHKZ1h9a0PytIBm68NPzeo793p3guucYbVXK66CuK9rs1+8yiBBJETTUw4?=
 =?us-ascii?Q?EJxyPJpazMwby2qd4y6Am5xr9M4ozUeFaV4nRhPZee2HQHXVCgvw3IwFv5zr?=
 =?us-ascii?Q?wo2vRFphzYJliQ3ZCorBFPOZ5Le+LA0B37Ai7ULgC3TIQrK8qvWBzOr5wGPh?=
 =?us-ascii?Q?qzpeigI7VmK3ZdS4eC1bnCEQt40+33a4g6UfdTAe5808yA6O4e0TpQOC+blE?=
 =?us-ascii?Q?nCZHnu2tCUnRLsV7zd0BKuSE4zKR0MQYFwU8ourGnJ2h+EEtOlUcJUAM6aD9?=
 =?us-ascii?Q?i4hu1+VLc1b8jktcxjyNxgQkEnxJn66etz6o1f1gZjK/i0k8YTWwdDrWPow1?=
 =?us-ascii?Q?b2c1IRoWGrEInWCkYmmsdb2N0VMxRTghfR3vKdoo4aCeoWValwqp3ZFoqF/7?=
 =?us-ascii?Q?bZxT7hQgW4wqE0+zeMzo+S4ouIhJ8O1QoDO1j38Wffj2+KTle5AXVQ9CajsZ?=
 =?us-ascii?Q?xoYkEJJCBp2k/mJfxalIneSXxuyVDrHo3Vag6fIrIRwiSLQc9ygV425rmbVZ?=
 =?us-ascii?Q?Lk64u68IWZQa2odGX6DzMG7isHUOnn4dREed76zQ41TgE0qBNYnZx0rFqmK4?=
 =?us-ascii?Q?TED+WCs6VlSDnNsR8kngCdYIjsW7CaOTFGSVl8u+C9v0RqVv1mLSVUrEpUxg?=
 =?us-ascii?Q?8TaAzDYSWg61f6H274bdvsuf4Sy0cZ3lgcuouWUt6PUlSbfaiL98Jnrjr0Sw?=
 =?us-ascii?Q?CRwz7LVKY7iUOfSs0Hh4R+ncUsVqmOrUGTD8Q9+DClS462eICb6/s8LC5Wtd?=
 =?us-ascii?Q?vBfz2kb1UnF0CarsQEV7gKM1z5Bq/VSfx0TyDIf5EqsSQ5WgZswUlBlDsuiB?=
 =?us-ascii?Q?ejXN6DzXs0GPwPgZjouCIBxTXiXmway61wkiSEVarhL26xcXWohxZwd2j1Vx?=
 =?us-ascii?Q?up2jc0kefh7ki0azUjtMH4RIRLWGqPw/a1yyVAvrSHwaU8mPpliOaIWqnptz?=
 =?us-ascii?Q?kJzcLmLcSvRag33kU0f016uLmQ7pbJz5+u53vwyLrgxCjdUN2Qe1Y1t2PA3V?=
 =?us-ascii?Q?UqUophrksK9ZNZ3tn+2j0xVx72COnyy1C/y6st7Ez+yWkvbzGOJbWfXPHR4M?=
 =?us-ascii?Q?u5s8SV/bQtbYje7NwX0aMhOS5Xai06u/a5FLSxBVv+0UP8Pf/XLOtuJ9PTJo?=
 =?us-ascii?Q?oSe/+FOHv3TAfbHgafOSFVPnl8iXXnO1Ypf3WrXd/a3oBv8ntnrw4uluTXDr?=
 =?us-ascii?Q?OgwalYdrIyI8k/j0V9KVX0EPXWkrbxe3Jy5Bu6cT0qxueQ8UwAmRjNKUVjq2?=
 =?us-ascii?Q?SoX+1z0uYgf0KfGRKzkPP4sxS7wncnEuFrQNQWqyh5FHxZWdKRlvuI3LlfIu?=
 =?us-ascii?Q?hZdIxCcOoPWoYZdLy8zjWWrqL0EWbkidC6n0oOfnLQ1i7NaGmAsMKZlFtQZH?=
 =?us-ascii?Q?fTkQmbth2f90eo+ylBUVtSH8ifdrPqAFYokQ70NIxrQ2oaqnp+KO7kvSkrBR?=
 =?us-ascii?Q?Gjy78NYuCXxVaKjlKToSBlzmSD5CuOM9+tcolB9Za6fT6YM/gJPWJwZXs0Lz?=
 =?us-ascii?Q?/ynZOdizBAz8if0w6Yk85Na/zA0FwCAt0UzL6TKfNW1xxrV89pTRDw8/Ydyb?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29873cf3-49dd-4917-46f4-08db47991cc9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 03:31:54.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ye7RxCnznuu0n0sd/rY4UdQDEA+g6lT8vDulsp3TArTgH31hBaLGJOCb6e5Ix8MeCLiMSmo6ufAlbYGNu3G/5iMXTcOvURzRyQ6DFhlHm1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-Proofpoint-GUID: ktOiML4F6CKfwhBpEmLEJ4pbaxcWOCux
X-Proofpoint-ORIG-GUID: ktOiML4F6CKfwhBpEmLEJ4pbaxcWOCux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 mlxlogscore=941 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304280027
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.1
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
