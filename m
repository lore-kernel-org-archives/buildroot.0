Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCFAC46CD3
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 11:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BC34099E;
	Wed, 20 Dec 2023 11:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BC34099E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDBVpMMUx9gm; Wed, 20 Dec 2023 11:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43085409E6;
	Wed, 20 Dec 2023 11:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43085409E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 227F81BF295
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 11:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0864640917
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 11:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0864640917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q2Pi4J_XbMD for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 11:18:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7F85408CA
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 11:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F85408CA
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BK8bV0X020665
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 03:18:45 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kkyp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 03:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6/7UnsvxEPcfst72YzOfm/m3Oo3VBWjBs0D8d8EQY8kHO6Sqx8g5baxOayyc5PocW9+XZJ0FlE46THaa3V06YwgZAPSk0iawRxsZSAWei9C3jivik+K1L5Ihji5UkQMaUnZKoCdutP7FaCO3NIYZLpgADZU1AneXy9pk/3POs/XcnamKMN4GbkVZcrsKahJiDcqsbqZPLUPOG4GWQmBU3pHAqQ1/CBYShnkSoHBkTIHhveFA616azCVDLfOEUwupTcCr/lg6PIIN3bM9BbhOU2cz5C16GQmNfRkCdrTXuwZumruNjZRQUzPTmjMfyzLmejjUOaZtui6oPKvf+NZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeK2qp/VcMlL+Eje85fAS/3DkZi/4WOdOvz0dKfiTh4=;
 b=SiNCvvONZptJhNqwnFndmDSB5KOt0VLMrgh0p5VSCjxf2vshZdZTyhvHCQjcsYxzWt60xcD5+Duk8eKtZlbaVaVRK/bNkNE7Fm9glapzaEzuIY6pByIy+Udso6iUFTQEEgw2dAR6OD6btqdMF27iJgQ8VkTmM2f7yfzxK6pv/UxhgjA6E3Bc0n0PF2sU6WRplaQSGhr9PMtlJCOD7KPMTAAFD7+17okm1sXfR3X4mhpRDy7lOpOe2jpXKCdfMCpMPh1X2BfdCPCkPZIaU5JEruQHlgzf5LV5czdRAIpOg01AtWqBjuvm60Jn798PWCLPnwv9pxz2p9WFm0Hf574J6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 11:18:42 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 11:18:42 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 19:18:28 +0800
Message-Id: <20231220111828.3421212-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: a434eb22-78c5-49a3-d644-08dc014d6c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m34cSu0xRVnpezavg0Z76QcxJjQymF6urbHNbCeItFNpe4Azcn/ETQWCD9G+8qUyi9wFMV8/iLUFs9U2DQFyTpqlF0D27GmCmh6cBtN6Kozj4fG5scJF/VnozRzNfacX52/aEIE1UmWBurIfGv5695W7q1Psu3RrIGOTbP9V5cLc2eq+JtABeireRYk7mJlDYhDs9EbR9BS6jNgDj0CvJcrAfhM9gbX+gI/0tNWQ7hnySc6TUpnRUM4rbUIA61vlVCcG3sLj4PB9rIl/AlZgn7Bso7kH1VXFfP40uqPV9Pz90HN6UpGIQ6Z8iarZuYk7rUBQ9pjEltLHq57nrWjD9XKELw8mmb+f5rgm5jZEHhl2j3/OX3OwkQeC2LCqD3kiq0E9czcPiZBZHCd+cFuw7r2MyCm9/3BkUguMpvWGk27UIlRx197fFgF9DZs4Vu4pPrUgrX+SWOBB5m2yhx6biI53IsP6PNYLIa4RwNFpPvPHhWWSjvDLdmD+qSLj52uwbVaBOjaOn+5YKwToX4+IC2mU8LBXQ/JeyU2TaYatrfiz3FD/bJHPwNLk8Q0pPftRWStBAtErspP64MSH6r4b8dz5b/qHXJzHYh53k268brs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39850400004)(396003)(376002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(2906002)(41300700001)(38100700002)(26005)(83170400001)(966005)(6506007)(6666004)(2616005)(1076003)(6512007)(478600001)(52116002)(6486002)(83380400001)(44832011)(8936002)(66946007)(66476007)(8676002)(66556008)(6916009)(38350700005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YZqC0XV0dz4Ew/P57gGcHsb49upVMLDaTuJMrBNT0zU+A6+/VSLOpv74cVz3?=
 =?us-ascii?Q?+At6CmUhGOan1GE58WUSSrc3+jb4/HmDs5h7cEvbK11NmYAOq4Rn+9fK1QGt?=
 =?us-ascii?Q?OfrdTcHgzm0su7/xpd1/rfd+z4jQLsuciuJx28XlmVj1YHCFmGBwnun7TJeI?=
 =?us-ascii?Q?cB/5mkFxHtVrAW/Yn0LZ+9r87sSLetG+1oddaYfO2zzDMqjACt3DQjI4hYas?=
 =?us-ascii?Q?+d0ufdQZr54WBCAD/0OLBDwYcKQKiJOxxss1ksuAPOCuuHeew/A2IogQOCg/?=
 =?us-ascii?Q?Cn+Wtt/9nsZ78Wr+xyRoMSHSU1r0xA8taKRnefYB+VuIiobiofL79jnHOHBJ?=
 =?us-ascii?Q?pmh7OXYTo/sxzqJmLIVPgfOTtZwzDPBAG2X0wIZo8edd/rprSZranTlbrkyY?=
 =?us-ascii?Q?ekzwWzxgyszTBXpKlLRUPCtgrwwDbg+ftDbt2gh2xNu/LLi2sKDUChk3b50z?=
 =?us-ascii?Q?5XWtbjDacZ+6RSB/mkAV8jxt/3TB9k9RQeEjURLfv/5I1r9a+YuNmPu3eSEu?=
 =?us-ascii?Q?RKNT++25elOYoaFq0fa02llx4YA26qD/85ti0Sbai3SALD1xzETagM0cOV4v?=
 =?us-ascii?Q?g/DFHmVDxiQwbHgC5ew3HufoAwQRAUQznOl7REaHzFOwp56LIsgiXVtCn51B?=
 =?us-ascii?Q?1/KOHGcvqnPw4z7uky3BakTrlysAkh1gKP+sR2MLfPYK3ATTWUOJOclc5uEV?=
 =?us-ascii?Q?L/b/5aSxzNz4Pi0Oe326erVzDp95Ibslh6D3AoKjI4hnqhZhQHX8tyKCPg7O?=
 =?us-ascii?Q?FP8KUrW2jylzBxWCtWiQ9KcmB/gwoIu93oJaf++B1ofy7r8gEhAC1VdS96RF?=
 =?us-ascii?Q?ZQbi5cXD/gTslM64MQv2sJZcQet7IVfHKqtqTbdhbNiFYB6RfNcHrZi4k5Ve?=
 =?us-ascii?Q?EXP/klnVULG2Iq5BQZkqN2hkvLK6oD1InIBLVgpzD/Wq4oMk8DXxWgLQPrgY?=
 =?us-ascii?Q?BXqE615MHm2kJKRwv9rHurLytyNfFN114MEH2I4F7S3cPumNO3TTLvN3aZQV?=
 =?us-ascii?Q?Gmb0J/4slOj9fnaanelFGNVF/X4u7yfc+dKYQyW3QEtMnx9ckBxgZ1Pgy1aA?=
 =?us-ascii?Q?/MD7+w21RmmYgN8b/pj7heqJf7OYhwBvYQQmb11OFePx6bulA/ctcJuyRnKO?=
 =?us-ascii?Q?oFMnQzaAHXUA5moIrqFVEa1nvIdUXyDIqSMiR/yT5lVPSeu4wU/3rqo2jL56?=
 =?us-ascii?Q?37JLm9vOxJ+x4KyFv/T/Ykb6N2nrcsp1z/OUYyeb0bng0tLuZjXMXaDyIlcO?=
 =?us-ascii?Q?I43IMNu5ehiD2l3Ek1DMsb2nl6Nw1HLrlYHJ1TBzyB1lv1yjqo1lA4OYEmC8?=
 =?us-ascii?Q?P3zPzBFzp1lDfQICtexr4IZAo7EKH+UFzT8oOv5RoWI3qgQvZ+hIAE8FGdGc?=
 =?us-ascii?Q?/yiVCJMFOzM2n8fNJlso+nvOKIPvkMA9Ij7boVIy8kM7UFEyZs5BGwXuTSNL?=
 =?us-ascii?Q?I95t/MIX/EOeV+WPTOpD6i1IHhZiDhQjbXAYJHXI9CmOy6+NJQMYITdIILHG?=
 =?us-ascii?Q?rhui6CNlITD4i+Alc99HIZL3RxFqLS0+PABQWbsh3J0J1yNzTl8ccBXKwRk+?=
 =?us-ascii?Q?pxPyGJM/LBDZpveiKGeJxkS1nyPCf7+Ky206GBY9XZWnHhvyPKKuIlnc0Udg?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a434eb22-78c5-49a3-d644-08dc014d6c46
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 11:18:42.3299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GZUt0ZU6DD2i/1elacFL3B3csM3MMQ7QFZGtW2Qxq4IeVmey4f8M0/G9V72JDwOX76hK35xNqldudvFWRzu2toFJT+8X97eeA1viBweJIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: mGBoa5q-yoigI-3ucQso0eUkO0fr50vD
X-Proofpoint-ORIG-GUID: mGBoa5q-yoigI-3ucQso0eUkO0fr50vD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=729 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200079
Subject: [Buildroot] [PATCH] package/unrar: bump version to 6.2.12
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

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index f0600af771..c9a5f521a4 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  55fe6ebd5e48d6655bfda3fd19b55438ca05e13c7e69772420caad9fdb68ef42  unrarsrc-6.2.10.tar.gz
+sha256  a008b5f949bca9bb4ffa1bebbfc8b3c14b89df10a10354809b845232d5f582e5  unrarsrc-6.2.12.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index ac19225937..0a61bcfcba 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.10
+UNRAR_VERSION = 6.2.12
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
