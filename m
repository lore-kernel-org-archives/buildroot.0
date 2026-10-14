Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D5C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 17:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD6660791;
	Wed, 14 Oct 2026 17:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYm7d--C3-SF; Wed, 14 Oct 2026 17:11:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7BF986080A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791997879;
	b=PSO79VdgcVLgAv30tsyI3Wc1C0YBgTFBJeUPYWA7Kul1YCtpI/mPqvYHUsTnVCxZOvaF
	 Y2y0iYqPlYlrd0riFZ9UmsXiR8Jk6B2fuqVgHVTB5hAEkFqONyd7R4p/nxi0ygSI8iTQv
	 HHbLDtRUu/InI94RCo429f2BYvL94pM+tH6dmb9m/NW7hcDzQYZ4j3+jYNjC2GIakreuH
	 dsnAzXOTOqZ1hS3/vNToiGPbwWmWuGqmxr3NGEW5t+GfCWosF3A5pCzmZRhYHtpOJHMVE
	 88lpcuHykKTz1oTV01K1iumNGDwKFJuH8khO8q6Tl/Rk2a6nG35VXGj8fo76Y4ZUC0A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791997879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 MIME-Version:Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sFtsek6oZFUF3uoBS45We4x/m3d0/p3SiezbWWcE988=;
	b=a+l5qKiQoDnn6YCF3eKFNATFG+XiRqLXwsragZj9KCl6/sP48MnQEpRT8j57DFp6YsSe
	 guruI7rALu8yHayTTxQsIJ94aDCBNSQ8m4ruOjk7/CR3hsWqVJzcSr/B+k9h+nmoWUvIi
	 bNUDhMGiLsAA2+ojvbVNRFTzfzY2vLlcnnSPm2SKleA2/jElwS23YYVN5Oa+HYbO/pFJz
	 pNFkZhei3W8MlU6wbutzhrTcsfiyga9R1oJVlin6in5GdA2R2F1NSv/IUapDyIY6um/k+
	 DQSGlEpNo6ciIdzK7RO9nS+PaYA30M5MBffWCxTX46j3fkZAX/HhrKNpGz6n/xAd4RQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791997879;
	bh=sFtsek6oZFUF3uoBS45We4x/m3d0/p3SiezbWWcE988=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pdsbnm+UVO7jmJk2H05hQQ1vrG9roU/zSkvmjVDot8hGpyxTfQiOJUZQ0JfkglJD/
	 I8yJDJsWsafO0dKP1es/XLUSkCdEeGQugklQPKU2a2yUy5hVZuuXgnrnxIeYs9M5NQ
	 +04QwbpKdcmHjI3w/s1mqQZ+nuD1dp0YU1Jf1hGSmbbq6KaeXuN6u4GebRcUggZJuu
	 vaZ8WsElzsg0IQWpSkDZ91sOPm67uOKYdlpEkNa26SsNqwTDqAblyguBdTvOH9Vg4V
	 4kMKMvky3PqF73WSnV48YuOtBZjLkhCTilCCJAkuOu+/1FtgMwMC8C//EloKWmNtTB
	 ivc9s86aWSNoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF986080A;
	Wed, 14 Oct 2026 17:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BED58A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B025B4036E
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IO570QS_SIkP for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A179C401A3
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791997876;
 b=LjJD/FdM3sj6kFvi0jkNJrBZGAEH7k1cEnX1Vam5kGXse5aaBGpYqXsx+AsYnWp8P8XI
 IAaCOLmAOEylMoVzTe3ijTAGlBteBqVcaWa0b6FoQyRE7Xl3MU6QsNKS8QfJo7t8ver4o
 GVHMis5smOfNIAlD9qnZMB0tX25lBIbOr/n0d8JT9HeRhGntVlSunTNBhZX/WwqXrH/HR
 XRGiha5L5WUq2P6vfE4BNQIxBzDOyS5MbhjuEpRHIjW4j5hhhUuxPIGgfSXlYegyKU/PF
 20NWlZQXYzwzyyhGg+iuKPIuzJZM/fdhU+fui2RufN5ATktpl3Nhu9/+JRpPfYxmKig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791997876;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
 References:In-Reply-To:To:CC:X-Mailer:X-EOPAttributedMessage:
 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=UiAyP36+4AcHSJu8d4bTmlDJIQ+v6PHhgdA45KL4iDQ=;
 b=JEFDoMV6p1O+gi9XmHgYPpqwwCjIE8TaittZFYutEe2ayFWHl61UJijY2J3+0R4q0JEl
 lVRm96H4dk0rVVFHI5zOsA2oSndf9ieJjjdPaoMbcKYVY2tFepk8RFEbo3zz2VKsa2kzL
 y2S0xuXPxIkB9xZ+DlcncjsXXxyr3o3TKBIQcXcFKSkFgxACkG0AD2F5RhQ9AeG3tAqGV
 S6ok/2DETkI1ULkolqgyy863U0wDk2Uu7gHqZ2HJT0dS+BCtELSXsWJio9zKPb8iRqnj1
 PdTa4gAKjVrZYz2OuyR5IJMu68J5lEMXLzNkDRQq6FZ1TkM2NNi7UqwpXTMrZXbV07A==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=FXWisLuO; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=EljkCVfL; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A179C401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:14 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69EEb4kX3893427; Wed, 14 Oct 2026 12:11:14 -0500
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h9ys55761-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 12:11:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Quq+RH/7vmIO4DMndSOVlXEpnUI+FuLVE0T9HEyB1VIznm9Ctd0Hp5w+t+4lue/ExRFqOnHHMv5ZaOtl54dTx98BOlOeEosgdYMaRu81zpnHlQbnK/EScxLteAmD0LRLOS+8KCdKL9zghepF2lvIDdmiSdOcO5PehW5Y+YZvGx9HBctIaFgQncwUgT/0Ci/81mpv/5JOwirwaH4gxBWdgnOoepl7tSAP+t9YuttFbWhMS1Sj2ZonGNV7DvuMBsojufZP97+N9emIk5rD0mDsu3XkD2ZJ5Xij2CmL1qrfxSviBzeipK4aW1V5Zils8Eu5rA7R+62Sr6Q6oXIcvpK/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiAyP36+4AcHSJu8d4bTmlDJIQ+v6PHhgdA45KL4iDQ=;
 b=N9JEU6P4K5Nd18iMOzDLY8yMZEKRzdT/mhRTEAO0bxR9I5PoEEoetsqelkXPAMOWaPs4NsYqETQANTvJ3IAxkWYx8DGv+dAOBeCFYhugC2H1q3gCFSqfJUd3OLI4OvE0g0MCEm0mrrhgB4MIQ4IIQUhZ7fVbFjhKdMFWwVg+Uthhz17YWYDMl6OVi6fB0XcPVp1PjvlvfHCLwtpUpPqjuOnL/4C/sdN0tbSLEMvRCQK5IR0vLjhpgnGHGTkrg4xnuIeEKwGk0gVU5VZAD/vTrQPXN0lik4wdeykJh6r+wR8QJvv/ZwKJ0faDpTBzyjDxFV1JgRmhxGxFKMYDRsuGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from SJ0PR05CA0150.namprd05.prod.outlook.com (2603:10b6:a03:33d::35)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Wed, 14 Oct
 2026 17:11:07 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::8a) by SJ0PR05CA0150.outlook.office365.com
 (2603:10b6:a03:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 17:11:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 17:11:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 12:10:15 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EHAFna2717085;
 Wed, 14 Oct 2026 12:10:15 -0500
Date: Wed, 14 Oct 2026 12:10:11 -0500
MIME-Version: 1.0
Message-ID: <20261014-uboot-fixes-v1-1-2676fd37a97a@ti.com>
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
In-Reply-To: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|MW4PR10MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 062d8929-3818-45a5-fb8f-08df2a162206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|261009223027099003|56012099006|261009221227099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: AXONmb6SQ9LOW+F9D1+xfS4uaOTZdvExBmMdWHFAlMftxyoJhJQrQsnUpI1FdH86+nIscM8Y0K6N5VAf2V8s6YmSwgJV5i3nIZshS8tHkJl+A5oygvNwnf7C/j9K/XKRA3YGMKH6Jjuw0OM26N7P+7konQQVUP/b1jIoAETDpdRexeXvcJ0rBo5isCnP8pBob6R7Xm7GFVwJzpx4vN8zd57pN8V+V8NJ4NVzc33vGKh+949DuruEnTz/s/Ch4VOg3pH3wKrkwxrx7Gh3c0GeM7hKy00aXkW/MwD3l0W2KeSYAjsqF8gYLTuRjp7ZDPAhMGixdtXnfhyYI9KBHu4BgbioywDZ46R5q37VZKN+oFacTQqZFOFlgTxEI96OueAfj55IO7mL8wWHPAcKlxbAcqaD5qgvo+qW2vbbGumebX/ALOnBx40pt2hm1DfEmC8mG7BzB8mHkouPhlXrijucAiXUg2cFO5XixnOizQUiP0KlKjSPwtbye71Ysv/WT5Hie3TUoPegy2MLf9S4l/QSzJ6K8V1WyG0cxKPedbiHaRtBX/xPb+zYq5fxr3QX61RMXnZXGaQWLdYNkUiGkxL73AbA1EUDDiUx/3DFxqpTrMm9foVHEZqp/Zuv9k//CB2CFZJXcO46rn4LTWqtdRgFFy+7Z9xgPRI3MdzVqEYPyCsLdd8PJsQJgTRJTTMNuAb15LWx++U916SPGMqc90fG2Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(261009223027099003)(56012099006)(261009221227099003)(22082099003)(18002099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6EaFbN/DSakFPXrjNNU/CNLrhLtb2oaYGU5+j+ctFg2Vr/WD895P+PTWYJeLKuA3ao0XIymrKLpYnCkerKKqdAHz//jqd7U07xfusF/KyO5C99qZjjv0gISXkad7t3H7CxV4TQoCUXdBlLaon648ByV4JiCaKy2Wupxxgf+csK1Ti8qElCL3bIRtUk/2CEPPR9IAhRKxmocWaZfK75cxOKvu7S4jtnJm0tl942V9YsQxNCrmsGNRbJz0JKk3kX65YUiU9325CsF45Mu54yrcM0X+T7oIzYQu6kM4hIpIDsAv5TNHrfV2YIkpnH7AVCGVnDTVXLyy3CS4aL9tFFkfiRR9HPTtaCmN3dDqxYNFHbf+4Jl8x3p6iVRyJaa45UizZA3MA/tk5fXsqQGF7pdyYA6TDNN0G78sYH3G73t6iIEa6fLFrPr2Bj6xUWFEKULE
X-Exchange-RoutingPolicyChecked: rK0Obl1tpS+kV0xZzNeMs6y9qbaxHbIywnQK5KzRXoG55LqUg29PWXh0GFUXaGa5fiCwUuBUJtRj7LEvN5Wdf7oFPs5DGgUNhKVBIZfBHbOd28RibRhq9uW7wFCN/amt75oWLPeGQj1ApKUdX0lYQ0jgCv0a7LhDhmAPTvd43RKJpRAdd0paRuuDMvq3tR8FaigjDktn7byMlK/YCWzCPIWAwIHMUiIbYgGGEHAXKC5KJixiHcAqhEus5GwnZj8s7RcXm8X2jaAXgA1bqxE/J2dOCWplg7yv1hM9s/SXTmkijS/jnCsVkWga2CCjB3rVSZ6iTudaLD7sPJEZ02/NCg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:11:05.7126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 062d8929-3818-45a5-fb8f-08df2a162206
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Authority-Analysis: v=2.4 cv=ANGCXYlm c=1 sm=1 tr=0 ts=6acfb7b1 cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=-gtsS_FzhULYpJHwdC4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: wONxofVRMzdIMHTudNrPVd4kz0loPxbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXwTMvhi6zdsd+
 fGziB9ajf1qKDoDvOTITvkQRj8OioiCaDG57lxFfmqw20Fyw5xHPzz2tZDEAaWtCNdZYaa6LGs/
 3YyzffdUkmFAzfGtso6mm95CJk6RdtA=
X-Proofpoint-GUID: wONxofVRMzdIMHTudNrPVd4kz0loPxbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX+FKX9o1QEyI8
 bmnf4vGBFDl71Qq6/1ya68UI8CC36bxgV3x3Wu+bMypnVGtBnobie1O4ZoJxjNxwOae4AhWkW7Q
 ATREpCCct6eRI0Ahe57ucjhL4IGCFpVK8AX4Rd9PbCaecste+K1Bdgyuconkfw63kliaPOgwTBE
 fu55+632/jcr1xCzO/SV1aO+kPaY9e4lKqWAr+zRPg1BvjhxVNrXkL4Wt3b0CUXhFB/wb4vDgHX
 u0HCSAmYXwG1rBdTQ2Q7q7MN4eUeYQigZgKtdJ1iqWXHdTM6PboEnKgKK/Oz07wZsyY0a9DyD4A
 uIJQpo74Toa6h4oLJSpN1LQv7JYBXMPN9uu11KRwyMv/il8z1lBspSFfUiTrh8CteILhDK2IpCG
 qP/ss2sA4Kv40/w8b/7UxsNJymHU/8mrHqErCCwYqPiDlGZ428jgeOaQSP481fjEwfqo/Ii9isZ
 biPVQOxkUhORbiKOMUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068
Subject: [Buildroot] [PATCH 1/4] configs/ti_am62ax_sk: bump tfa,
 linux and uboot versions
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0aGUgYW02MmF4LXNrIHJlZmVyZW5jZSBib2FyZCB0byB1c2UgdGhlIGxhdGVzdCBzdGFi
bGUgdGZhLCB1Ym9vdAphbmQgbGludXgga2VybmVsIHJlbGVhc2VzIHRvIHB1bGwgaW4gdGhlIGxh
dGVzdCBidWcgZml4ZXMgYW5kIGZlYXR1cmVzLgoKQmVjYXVzZSBzd2lnIDQuNS4wIHJlbW92ZXMg
c3VwcG9ydCBmb3IgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSB3ZSBuZWVkIHRvCmJhY2twb3J0IGEg
cGF0Y2ggZm9yIFUtQm9vdCB0byByZW1vdmUgdGhlIFB5dGhvbiAyIG1hY3JvcyBpdCB1c2VzIHRv
CmdlbmVyYXRlIHRoZSBmaW5hbCBmaW1yd2FyZSBpbWFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBCcnlh
biBCcmF0dGxvZiA8YmJAdGkuY29tPgotLS0KIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0t
dHJ1c3RlZC1maXJtd2FyZS5oYXNoIHwgIDIgKy0KIGJvYXJkL3RpL2FtNjJheC1zay9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgIHwgIDIgKy0KIC4uLnBsYWNlLXJlbW92ZWQtU1dJRy1Q
eXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKwog
Li4ucGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggfCA2NSAr
KysrKysrKysrKysrKysrKysrKysrCiBib2FyZC90aS9hbTYyYXgtc2svcGF0Y2hlcy91Ym9vdC91
Ym9vdC5oYXNoICAgICAgICB8ICAyICstCiBjb25maWdzL3RpX2FtNjJheF9za19kZWZjb25maWcg
ICAgICAgICAgICAgICAgICAgICB8ICA4ICstLQogNiBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyYXgtc2sv
cGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoIGIv
Ym9hcmQvdGkvYW02MmF4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0
ZWQtZmlybXdhcmUuaGFzaAppbmRleCA4Yjc3ZTFmMTY1M2EuLjJlMjRiY2QwZGU1YiAxMDA2NDQK
LS0tIGEvYm9hcmQvdGkvYW02MmF4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJt
LXRydXN0ZWQtZmlybXdhcmUuaGFzaAorKysgYi9ib2FyZC90aS9hbTYyYXgtc2svcGF0Y2hlcy9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCkBAIC0xLDIgKzEs
MiBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYzBmMjNjY2M3MWM0OTk4OWU5YWQy
MzhhY2YzMzQ0NzNjMTdiN2M4OGY3OWEyMGM4MjljM2Q0NDNlMzc5NGEyMiAgYXJtLXRydXN0ZWQt
ZmlybXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oKK3NoYTI1NiAgYjgwN2Q4YmYxOTBiN2M0NmI0MjYw
NzI5YjRiYmUyZjdkZjgzY2QxMDg2ZWRjYjE4MWQ2NjU5NWFlNjU5OGQyMyAgYXJtLXRydXN0ZWQt
ZmlybXdhcmUtdjIuMTUuMC1naXQ0LnRhci5negpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02MmF4
LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJkL3RpL2FtNjJheC1zay9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKaW5kZXggNTNlYjE0Mzg5NDViLi4yMjliMDliMzU1OGYgMTAwNjQ0
Ci0tLSBhL2JvYXJkL3RpL2FtNjJheC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKKysrIGIv
Ym9hcmQvdGkvYW02MmF4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaApAQCAtMSwyICsxLDIg
QEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDc3NDY5ODQyMmVlNTRjNWYxZTcwNDQ1
NmYzN2M2NWMwNmI1MWI0ZTlhOGIwODY2ZjM0NTgwZDg2ZmVmOGUyMjYgIGxpbnV4LTYuMTAudGFy
Lnh6CitzaGEyNTYgIDJmZWFhNzA0NTNlOTFmNTQxYmU2YTVjOTA3OGQ4MTY4ZTA4MWFmNDVhM2Q5
NzE4MDU0ODUwNTM4Y2ZmMmViZjMgIGxpbnV4LTcuMi4xMC50YXIueHoKZGlmZiAtLWdpdCBhL2Jv
YXJkL3RpL2FtNjJheC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJl
cGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90
aS9hbTYyYXgtc2svcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvMDAwMS1weWxpYmZkdC1SZXBsYWNl
LXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTViMTQ4ZWM1NWE1Ci0tLSAvZGV2L251bGwKKysr
IGIvYm9hcmQvdGkvYW02MmF4LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyLzAwMDEtcHlsaWJm
ZHQtUmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaApAQCAt
MCwwICsxLDY1IEBACitGcm9tIDUyNzExNWVmNjc4M2NlYzQ5ZTU2MTBjNTIzYzEyNGIzOTkwMTEz
NjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBKYWlwYXVsIENoZWVybmFtIDxqYWlw
YXVsLmNoZWVybmFtQGVzdC50ZWNoPgorRGF0ZTogVHVlLCAxMSBBdWcgMjAyNiAxNTozNDozMyAr
MDIwMAorU3ViamVjdDogW1BBVENIXSBweWxpYmZkdDogUmVwbGFjZSByZW1vdmVkIFNXSUcgUHl0
aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworU1dJRyA0LjUuMCByZW1vdmVkIFB5dGhvbiAyIGNvbXBhdGliaWxpdHkgbWFjcm9z
IChQeUludF8qLCBQeVN0cmluZ18qKQorZnJvbSBpdHMgcnVudGltZSBoZWFkZXIgcHloZWFkLnN3
ZyAoc2VlIGNvbW1pdCA3OWY3YTJiN2NiN2QpLiBSZXBsYWNlCit0aGVtIHdpdGggdGhlaXIgUHl0
aG9uIDMgQyBBUEkgZXF1aXZhbGVudHM6CisKKy0gUHlTdHJpbmdfRnJvbVN0cmluZyAtPiBQeVVu
aWNvZGVfRnJvbVN0cmluZworLSBQeVN0cmluZ19Bc1N0cmluZyAtPiBQeUJ5dGVzX0FzU3RyaW5n
CistIFB5SW50X0FzTG9uZyAtPiBQeUxvbmdfQXNMb25nCisKK1RoZSByZXBsYWNlbWVudHMgYXJl
IHNhZmUgc2luY2UgdGhlIG1hY3JvcyB3ZXJlIGFscmVhZHkgYWxpYXNlZCB0bwordGhlc2UgZXhh
Y3QgZnVuY3Rpb25zIGluIFNXSUcncyBQeXRob24gMyBjb2RlIHBhdGguCisKK1RoaXMgaXMgYSBi
YWNrcG9ydCBvZiBkdGMgY29tbWl0IDUwMDhkMWQ2YTM1NiAoInB5bGliZmR0OiBSZXBsYWNlCity
ZW1vdmVkIFNXSUcgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MiKS4KKworU2lnbmVkLW9m
Zi1ieTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KK1Jldmll
d2VkLWJ5OiBKw6lyw6ltaWUgRGF1dGhlcmliZXMgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxp
bi5jb20+CitUZXN0ZWQtYnk6IErDqXLDqW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVy
aWJlc0Bib290bGluLmNvbT4KK1NpZ25lZC1vZmYtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmlu
c29uQGdtYWlsLmNvbT4KK1Jldmlld2VkLWJ5OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBn
bWFpbC5jb20+CistLS0KKyBzY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIHwg
NiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCBi
L3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKK2luZGV4IGU0NjU5NDg5YTk2
YWIuLjMyNmExNWM3OTQxZTMgMTAwNjQ0CistLS0gYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJm
ZHQuaV9zaGlwcGVkCisrKysgYi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVk
CitAQCAtMTAzMyw3ICsxMDMzLDcgQEAgdHlwZWRlZiB1aW50MzJfdCBmZHQzMl90OworIAlQeU9i
amVjdCAqYnVmZjsKKyAKKyAJaWYgKCQxKSB7CistCQlyZXN1bHRvYmogPSBQeVN0cmluZ19Gcm9t
U3RyaW5nKAorKwkJcmVzdWx0b2JqID0gUHlVbmljb2RlX0Zyb21TdHJpbmcoCisgCQkJZmR0X3N0
cmluZyhmZHQxLCBmZHQzMl90b19jcHUoJDEtPm5hbWVvZmYpKSk7CisgCQlidWZmID0gUHlCeXRl
QXJyYXlfRnJvbVN0cmluZ0FuZFNpemUoCisgCQkJKGNvbnN0IGNoYXIgKikoJDEgKyAxKSwgZmR0
MzJfdG9fY3B1KCQxLT5sZW4pKTsKK0BAIC0xMDY0LDEzICsxMDY0LDEzIEBAIHR5cGVkZWYgdWlu
dDMyX3QgZmR0MzJfdDsKKyAgICAgICAgIH0KKyAgICAgICAgICQxID0gUHlCeXRlc19Bc1N0cmlu
ZygkaW5wdXQpOworICAgICAlI2Vsc2UKKy0gICAgICAgICQxID0gUHlTdHJpbmdfQXNTdHJpbmco
JGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKysgICAgICAgICQxID0gUHlCeXRlc19Bc1N0cmlu
ZygkaW5wdXQpOyAgIC8qIGNoYXIgKnN0ciAqLworICAgICAlI2VuZGlmCisgfQorIAorIC8qIHR5
cGVtYXBzIHVzZWQgZm9yIGZkdF9uZXh0X25vZGUoKSAqLworICV0eXBlbWFwKGluLCBudW1pbnB1
dHM9MSkgaW50ICpkZXB0aCAoaW50IGRlcHRoKSB7CistICAgZGVwdGggPSAoaW50KSBQeUludF9B
c0xvbmcoJGlucHV0KTsKKysgICBkZXB0aCA9IChpbnQpIFB5TG9uZ19Bc0xvbmcoJGlucHV0KTsK
KyAgICAkMSA9ICZkZXB0aDsKKyB9CisgCisKK2Jhc2UtY29tbWl0OiAxMjYyZTUwYTM0YTBlMDFm
OTc0ZThkOTA5YzViMjU1ZjhmYTcxOTllCistLSAKKzIuNTUuMAorCmRpZmYgLS1naXQgYS9ib2Fy
ZC90aS9hbTYyYXgtc2svcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3Zl
ZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90aS9hbTYyYXgtc2sv
cGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0y
LWNvbXBhdGliaWxpdHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi5lNWIxNDhlYzU1YTUKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTYyYXgtc2sv
cGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0y
LWNvbXBhdGliaWxpdHkucGF0Y2gKQEAgLTAsMCArMSw2NSBAQAorRnJvbSA1MjcxMTVlZjY3ODNj
ZWM0OWU1NjEwYzUyM2MxMjRiMzk5MDExMzYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KK0RhdGU6IFR1
ZSwgMTEgQXVnIDIwMjYgMTU6MzQ6MzMgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gcHlsaWJmZHQ6
IFJlcGxhY2UgcmVtb3ZlZCBTV0lHIFB5dGhvbiAyIGNvbXBhdGliaWxpdHkgbWFjcm9zCitNSU1F
LVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1NXSUcgNC41LjAgcmVtb3ZlZCBQeXRo
b24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyAoUHlJbnRfKiwgUHlTdHJpbmdfKikKK2Zyb20gaXRz
IHJ1bnRpbWUgaGVhZGVyIHB5aGVhZC5zd2cgKHNlZSBjb21taXQgNzlmN2EyYjdjYjdkKS4gUmVw
bGFjZQordGhlbSB3aXRoIHRoZWlyIFB5dGhvbiAzIEMgQVBJIGVxdWl2YWxlbnRzOgorCistIFB5
U3RyaW5nX0Zyb21TdHJpbmcgLT4gUHlVbmljb2RlX0Zyb21TdHJpbmcKKy0gUHlTdHJpbmdfQXNT
dHJpbmcgLT4gUHlCeXRlc19Bc1N0cmluZworLSBQeUludF9Bc0xvbmcgLT4gUHlMb25nX0FzTG9u
ZworCitUaGUgcmVwbGFjZW1lbnRzIGFyZSBzYWZlIHNpbmNlIHRoZSBtYWNyb3Mgd2VyZSBhbHJl
YWR5IGFsaWFzZWQgdG8KK3RoZXNlIGV4YWN0IGZ1bmN0aW9ucyBpbiBTV0lHJ3MgUHl0aG9uIDMg
Y29kZSBwYXRoLgorCitUaGlzIGlzIGEgYmFja3BvcnQgb2YgZHRjIGNvbW1pdCA1MDA4ZDFkNmEz
NTYgKCJweWxpYmZkdDogUmVwbGFjZQorcmVtb3ZlZCBTV0lHIFB5dGhvbiAyIGNvbXBhdGliaWxp
dHkgbWFjcm9zIikuCisKK1NpZ25lZC1vZmYtYnk6IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwu
Y2hlZXJuYW1AZXN0LnRlY2g+CitSZXZpZXdlZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxq
ZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorVGVzdGVkLWJ5OiBKw6lyw6ltaWUgRGF1
dGhlcmliZXMgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxpbi5jb20+CitTaWduZWQtb2ZmLWJ5
OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBnbWFpbC5jb20+CitSZXZpZXdlZC1ieTogUGV0
ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29tPgorLS0tCisgc2NyaXB0cy9kdGMvcHls
aWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NjcmlwdHMvZHRjL3B5
bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgYi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9z
aGlwcGVkCitpbmRleCBlNDY1OTQ4OWE5NmFiLi4zMjZhMTVjNzk0MWUzIDEwMDY0NAorLS0tIGEv
c2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorKysrIGIvc2NyaXB0cy9kdGMv
cHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorQEAgLTEwMzMsNyArMTAzMyw3IEBAIHR5cGVkZWYg
dWludDMyX3QgZmR0MzJfdDsKKyAJUHlPYmplY3QgKmJ1ZmY7CisgCisgCWlmICgkMSkgeworLQkJ
cmVzdWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKKysJCXJlc3VsdG9iaiA9IFB5VW5pY29k
ZV9Gcm9tU3RyaW5nKAorIAkJCWZkdF9zdHJpbmcoZmR0MSwgZmR0MzJfdG9fY3B1KCQxLT5uYW1l
b2ZmKSkpOworIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21TdHJpbmdBbmRTaXplKAorIAkJCShj
b25zdCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgkMS0+bGVuKSk7CitAQCAtMTA2NCwx
MyArMTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMyX3Q7CisgICAgICAgICB9CisgICAg
ICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsKKyAgICAgJSNlbHNlCistICAgICAg
ICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCisrICAg
ICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKyAg
ICAgJSNlbmRpZgorIH0KKyAKKyAvKiB0eXBlbWFwcyB1c2VkIGZvciBmZHRfbmV4dF9ub2RlKCkg
Ki8KKyAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAqZGVwdGggKGludCBkZXB0aCkgewor
LSAgIGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1dCk7CisrICAgZGVwdGggPSAoaW50
KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7CisgICAgJDEgPSAmZGVwdGg7CisgfQorIAorCitiYXNl
LWNvbW1pdDogMTI2MmU1MGEzNGEwZTAxZjk3NGU4ZDkwOWM1YjI1NWY4ZmE3MTk5ZQorLS0gCisy
LjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02MmF4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCBiL2JvYXJkL3RpL2FtNjJheC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKaW5k
ZXggZmU5YjRmNTNkYzYzLi5mZjZlNGVkMmUyZjYgMTAwNjQ0Ci0tLSBhL2JvYXJkL3RpL2FtNjJh
eC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKKysrIGIvYm9hcmQvdGkvYW02MmF4LXNrL3Bh
dGNoZXMvdWJvb3QvdWJvb3QuaGFzaApAQCAtMSwyICsxLDIgQEAKICMgTG9jYWxseSBjYWxjdWxh
dGVkCi1zaGEyNTYgIGY1OTFkYTlhYjkwZWYzZDZiM2QxNzM3NjZkMGRkZmY5MGM0ZWQ3MzMwNjgw
ODk3NDg2MTE3ZGYzOTBkODNjOGYgIHUtYm9vdC0yMDI0LjA3LnRhci5iejIKK3NoYTI1NiAgNzhl
OGJmYzM4MmZlMzg4ZjliNTVhYTFkYWY4YzU2MzUyMmEwMzc3NzliNWQ0YzM0OWQxNDE1ZTM4MWYx
MjQzZSAgdS1ib290LTIwMjYuMDcudGFyLmJ6MgpkaWZmIC0tZ2l0IGEvY29uZmlncy90aV9hbTYy
YXhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTYyYXhfc2tfZGVmY29uZmlnCmluZGV4IGRh
NjBkOTM0MzVmMS4uYTRjMzVhMTA2ZTYzIDEwMDY0NAotLS0gYS9jb25maWdzL3RpX2FtNjJheF9z
a19kZWZjb25maWcKKysrIGIvY29uZmlncy90aV9hbTYyYXhfc2tfZGVmY29uZmlnCkBAIC0xMCw3
ICsxMCw3IEBAIEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1
MjAwbjggLWQgazMtYW02MmE3LXNrLmR0YiAtbCBhbTYyCiBCUjJfUk9PVEZTX1BPU1RfSU1BR0Vf
U0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RpL2FtNjJheC1zay9nZW5pbWFnZS5jZmciCiBCUjJfTElO
VVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMCIKK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjcuMi4xMCIKIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVG
QVVMVF9DT05GSUc9eQogQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJv
YXJkL3RpL2FtNjJheC1zay9saW51eC5jb25maWciCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQ
T1JUPXkKQEAgLTIwLDcgKzIwLDcgQEAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKIEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMjU2TSIKIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkU9eQogQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15
Ci1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2
Mi4xMSIKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9InYyLjE1LjAiCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJr
MyIKIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JPQVJEPSJsaXRlIgog
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMyX09QVEVFPXkKQEAgLTI4LDEyICsy
OCwxMiBAQCBCUjJfVEFSR0VUX09QVEVFX09TPXkKIEJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZP
Uk09ImszLWFtNjJ4IgogQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9eQogQlIyX1RBUkdFVF9U
SV9LM19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJT049eQotQlIyX1RBUkdFVF9USV9LM19SNV9MT0FE
RVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDciCitCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNi4wNyIKIEJSMl9UQVJHRVRfVElfSzNfUjVf
TE9BREVSX0JPQVJEX0RFRkNPTkZJRz0iYW02MmF4X2V2bV9yNSIKIEJSMl9UQVJHRVRfVUJPT1Q9
eQogQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjIwMjQuMDciCitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2
LjA3IgogQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNjJheF9ldm1fYTUzIgog
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVO
U1NMPXkKCi0tIAoyLjU1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
