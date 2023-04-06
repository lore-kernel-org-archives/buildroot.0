Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826C9C7618D
	for <buildroot@archiver.kernel.org>; Thu,  6 Apr 2023 10:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B267C60E29;
	Thu,  6 Apr 2023 10:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B267C60E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mappCX9zouBB; Thu,  6 Apr 2023 10:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC1D6080B;
	Thu,  6 Apr 2023 10:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC1D6080B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429F91BF48D
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 10:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7625821A8
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 10:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7625821A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcmmGwYhdiKY for <buildroot@lists.busybox.net>;
 Thu,  6 Apr 2023 10:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C57F8205D
Received: from mx0a-002c1b01.pphosted.com (mx0a-002c1b01.pphosted.com
 [148.163.151.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C57F8205D
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 10:54:23 +0000 (UTC)
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336AEJMp001716
 for <buildroot@buildroot.org>; Thu, 6 Apr 2023 03:54:22 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ppgxwt6p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 06 Apr 2023 03:54:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axfra8ktWO3OeSqugJDA8bkAkHuy5EpOoCUl/A9N0H28VsYvMFTu+9SlThxigx1AqPO1xOjcNUE4EhXL6qeOeQLle0MOUA4RO026IX4WUMnKUPsbKC9W/wXJ76miV2idhjMc6Z19g7156lMh7V2KysKGHQWrONwnTzAUoGw2rVk2JSVzMtZsfzzOgZTekl9Ougd5a52Ev4lbToE2u7D7mWaUD2y3T1m6uUhpWoK71iqFmZMv1GEoL6UDFKp/y2M2Xs2ExRERTXl9OFJs9kXs8zG0KUIOl1LZKQriECvQD+eP2Ga00cBZ7bup8WLBpkahG9XdKJAQfLgxe0t4tfr5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu/Xv6bmzJXxCpaCxxpASiEi9EZsQl3rcvTls2V+JL8=;
 b=Lu3QlJFKV2/fuKynjHFDg7gPqKVTaXHvG2HNB4mxWwHI/JMiiIWfbyqGQVZM6CqNEj8csAEbLw99ZmMQ4Inn7Wi87haU6sBoROYyAQA5bNV6QCgeyPTziDbIuCINoUN1vJejEkW7AR/N1SDjhjcU4e97ufc4KaNSEyf9mGLyT3CrpsMkqhXx6yKjIjNblQCsncgSrVpmfFPnvYTYUhQa2lw9kxRrLBFZO6FcNEuW17+FWU6/UuOjB+1yaMvMquOJ+Of5apyQl+w1YFEAa4gLbWNmRUq5P7TQLb12cjENgW/s7u5VzjQVbd/bpS9Dq1GqQHqXPg5pj9RQ6+qCFluZ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 DM8PR02MB7862.namprd02.prod.outlook.com (2603:10b6:8:21::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Thu, 6 Apr 2023 10:54:19 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::9bf9:31e5:d058:d3e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::9bf9:31e5:d058:d3e3%6]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 10:54:19 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: buildroot@buildroot.org
Date: Thu,  6 Apr 2023 10:54:12 +0000
Message-Id: <20230406105412.116596-1-simon.rowe@nutanix.com>
X-Mailer: git-send-email 2.22.3
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To DM8PR02MB8121.namprd02.prod.outlook.com
 (2603:10b6:8:1a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR02MB8121:EE_|DM8PR02MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 04577752-8db2-433d-6920-08db368d4602
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/iNozHJNoMu1OtGqzi9zMEn8vhh/q5OzBqsiBLwFyDGDEDV0riO0hPI0dfKTN8aH9nCXhd22ALXImBq0DqmwmuQOXiFjEDkvA7+xRoiSKF4OLFsaCIlQePQww+vKlvdj2/jkVULcPOaAspWFGZtrVn2QxrH67HV0yGLxUKMAwctNuyQwON2hjSyhxSMzbPY/xXbpEeX6jhw/L9jRICV4fZrupwABIZF4CwxhQ53lC4GpLBcWTNlCEBWqQ2O7usZweXzUmqHX0Mx6mMATdLrHYZWrTe5LIxLhmmVqqDg7WLJzTlPAUApo70P6fyDuJgRsTbLUlFVqkQj9KPcVbPD023PaXpba1z9QihuWHhTztk3I4jBgo0dWcme5DxflaQiBJ8MgdEoi1G576MUhqLaYFgd6UF6mOXwNY5AVa/tYkvxsnsj2xMibqVY1EowvQopnKKSVv6I8BNM8yItU7dL098UK9IycsV4xJ+Da4Y4bcMvNmcAeTpgNSB6JQAJ0bimQJOCjVhETvAzYoq+16JLqIf/Wsf8rwqGxEFIxXMmO8sW3leRa1buiHA0sh5fy10SHYsHxC7PyL/G20jBFUpqgphE+i2EY4wWjwEjgU8owOeyZPbpbbo4xVHsN7X3k5Jq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(6666004)(107886003)(52116002)(6486002)(36756003)(83380400001)(2616005)(38350700002)(86362001)(38100700002)(26005)(6512007)(1076003)(6506007)(186003)(66556008)(8676002)(44832011)(6916009)(66476007)(66946007)(316002)(2906002)(41300700001)(8936002)(4744005)(4326008)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I1xWy8Fd5Tu7nmHVDEJSHJlhBGF5PW669xjuIixymSJ43Ms3DtFWNRj7vMD+?=
 =?us-ascii?Q?ooWktG+iqOqbcJitB1QFMYyU0LOa7PPtQ7RZJS5MA+Oje30c6YUO64hN9hsy?=
 =?us-ascii?Q?oC3AICX1YXiIQqGGSuZhfOhdh181OghD0TwTTPQtZ0x1qDgyNmjenb2ULg/l?=
 =?us-ascii?Q?QDCtCCrcwd/c8F2NIEyZLfgIskAMRnOLKXT/Ht9NaJbNBX0VwArWLwH4j4w/?=
 =?us-ascii?Q?GtRuftKAc04RSxr69iObhTLJb462F9SFa8P5jkeZgXCi82VyuGgekvDxHIXt?=
 =?us-ascii?Q?QxdynYhuoTuvRJw1zmlwrslBpMQepHIBuZ9E6rlA3oHbZutML/8qZSW3hM/y?=
 =?us-ascii?Q?61Im/jkwUya9uAC/5zqGaUdAMt+WPvj7VAbhwxR2fwfe37rpJ9AseNC1pA3P?=
 =?us-ascii?Q?yzVy/lXPjNtLVPj+OMV6qJVSNfrCKBH2YbMTLv8F0PY8Y0ZIoM0roEuVZlEz?=
 =?us-ascii?Q?IRDDLil+QtQ/k3N6fhC1TBZCyBP7gEqJROC6OIzDZVO3ppJI76Y3sDPlly5K?=
 =?us-ascii?Q?pj2PcGDlRRyhftyU7dVSWbLT6B49s2RMLWUhRoDM+lsnCUKc3mT7QE5PHT5J?=
 =?us-ascii?Q?LEQJjgHhJvS7eHP0zXcwSoZGI2HvICNjbs1UIGHlFa9jg0k75T+jtW+8t44r?=
 =?us-ascii?Q?TZwBTEknP040VqM/bBA0W41HhzTWp5ogdWzo42H0sWJyaUQpfnQx3UI7o4YJ?=
 =?us-ascii?Q?qrGZlQu+8v2AGDVkpx4K1EJJGUjctUkuqQI/kWGgzhDuhxMRFuvmt/38dmqF?=
 =?us-ascii?Q?9WloRbgjrQFv1tEkbdD39Mxqj6MD6GssasL08LpRy1b6hjXZXavozp72/LxB?=
 =?us-ascii?Q?LqrRsEulm6nWasgFndKNz/Uifv7Qwyy8dSZzkZIDF3ORDB0fD+B1BIaklEIG?=
 =?us-ascii?Q?tBG2K5JNL3MqEvCzAPaIJwB0m4yssYf6CruBS+sAFWKvkNq8o4ng2M8jVmZh?=
 =?us-ascii?Q?BJRknET4zBUvIqfgStcjxnnNrsPX/Lg8zYT2We5w7XJTSa8zXJf7+5qkj98/?=
 =?us-ascii?Q?mRX1VfMn3yjK9LPQEmai/pakCAo9PLs3b9S+aU7obEmOmVN1Qj6aMvgFS3UX?=
 =?us-ascii?Q?DLsjxljTbAWV3/GGf7RFB89EbeOCCSipNHJPPsUOkYeyrfW+N7o9XQM2YFoK?=
 =?us-ascii?Q?He5KQPLL9MkvRg0lr5YRXEYb1zJwJyRc74hnTOS5x62vvkLtxUlkf7Vp/88K?=
 =?us-ascii?Q?47MmhJANgQGG4wq2xxAQjLjYk3p7BPzZC8rBIt3oaAPpUMz7gNK3wCFJJXj6?=
 =?us-ascii?Q?YKn7Db3QIBxu8dXk3/REOqnNiy5v1DsSdRHxYF323eyMuVDjCFHlNlyyXEYI?=
 =?us-ascii?Q?JuRWAEp2MXsUmePEgqjo6FU55Ff5Oo/91gISLHMk6VM0i//ttocM7dz+tt/8?=
 =?us-ascii?Q?66ple9F+NEN1xqtHdP4m4DYzM0mNuxl1UyPAXLypUWbJjrwu0NDv4ZTwLBTc?=
 =?us-ascii?Q?TXIvyc/4AHkxOEDOI2mhySMIIkBS2brpSuuUQJwEiJwGX5pfLiUY1bPdaZ//?=
 =?us-ascii?Q?jLakRpn/iPh59Eqa4PaswYEqM4dOcG7dW/7uVToGJlwJo/cLQUBaH1vDIAto?=
 =?us-ascii?Q?mgVqfiiJ6oevsX4FTmPWOPRD8fTLyKhSfQa3BvcXqNGkd7poWYGIdWjiUJ+Q?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04577752-8db2-433d-6920-08db368d4602
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 10:54:19.7892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXVCQ7N5yoH49WkpBiJEgIXTT7WXX3WX4xcEpJbszOrgcQ6XmhVumgARNrRykbTs7xozvkR4c2r0aREFss38hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7862
X-Proofpoint-GUID: UUHYvUd9CDVtN9A8cbcPKtw2wljgVXJh
X-Proofpoint-ORIG-GUID: UUHYvUd9CDVtN9A8cbcPKtw2wljgVXJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_04,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=cu/Xv6bmzJXxCpaCxxpASiEi9EZsQl3rcvTls2V+JL8=;
 b=2gwmWYDV53oWI0ITjUUwLN9JQOhwuyHZH6awsTqY66ALumgC5VS7shY/hb/kxiduse5O
 3ya/xCWxOdXRHRT3AaI3h1jhc88DAQzOlKOeB6vdVG9JM6+aXLcTpTGpofdmTf3882JT
 flMMVzaojIHZvNM14Z+7lBAp5xSb4UN1agONFBqvMzKcSfE5UUICXcW7/g5HIomas/yF
 OA6AkjoGba+dgzz3pLe4gXEom3xEjyV1Qk836m7gKJDyh09dueurq75pCqBLD/QWs1oZ
 vnMVaZKWe3xLyqI4VNzKXDC7IIkkvo2djWrl7wz3MkhAcJYuhXorziIpzRGICLWvqeIL uw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu/Xv6bmzJXxCpaCxxpASiEi9EZsQl3rcvTls2V+JL8=;
 b=fOsCtXnlihiY2xiqdi7ZWCvVx9UumtONn8wE3bJJA8TnZpuKm6neHu6vpEiUYD/Q9Rd7SIhRIkg576ms8PjVOWgo8eBsOotO2KEiY1xfXwSN1paswDjRlKe/GGV0syLGz8ZxFsl1A6cjerrse3A2d8/Ziut7qxWshugyTDuc+8wajzbHlkiFPBF4I8/r9i36GZf0xAne1c4K3DgyFh4mwELkzXYwqSXJ0nPvoOnyV2ZqP1LYgj0Ob+32GA9mg1xs8gsccpjDKxjUM4/eqDDkWWAsiejcaym8UIIjDtWvVH7vVAeD1PmbULgqBvjWqNNRf9vlDbr4hDB/6rLoHEl8LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=2gwmWYDV; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=fOsCtXnl
Subject: [Buildroot] [PATCH 1/1] package/mdadm: install udev rules
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
Cc: Simon Rowe <simon.rowe@nutanix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdadm contains various udev rules to manage RAID assembly and create
symlinks, install them if udev (or equivalent) is enabled.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 package/mdadm/mdadm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 0a2eb4e5bd..a5dfb55168 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -27,6 +27,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 MDADM_DEPENDENCIES += udev
+MDADM_INSTALL_TARGET_OPTS = install-udev
 else
 MDADM_CXFLAGS += -DNO_LIBUDEV
 endif
@@ -36,7 +37,7 @@ define MDADM_BUILD_CMDS
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin $(MDADM_INSTALL_TARGET_OPTS)
 endef
 
 $(eval $(generic-package))
-- 
2.22.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
