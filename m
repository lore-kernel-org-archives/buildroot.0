Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAB1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA48408EA;
	Wed, 27 Jul 2022 15:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA48408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsBrXFiGkgaA; Wed, 27 Jul 2022 15:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D1E40135;
	Wed, 27 Jul 2022 15:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D1E40135
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3CDD1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC9460E35
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC9460E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHxjOcHMpwyb for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:48:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B7D460AA4
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B7D460AA4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPf4XmVFJjGC7QTUR72y78xZrTLnGbJK7PjxqSpDgF4jY+BQU255nLDVegy/21806Va7iNMrse8/F7d6N5ceSOsfodlIRJZmLXgnXgbz333iuxmAe/7+JoRxgkuL1Y/+OS/HxtoSkEKS9mxwIc6r/qvK9Wyj8y1QbIDBDriNsPKUbDZKxBDOj+Zx4Hhy/s9Rn/28fmatsUsGthppoMdjVE5wtW8kegMS9y9ai+ckG2u7mczA/oJuZ36qIq5wkLpPwt6dsmiX+vyuX49NyGnXrt86T6Gvk1c89odHYbbUcEAqxMzu81iHQxyyCnGPVEvEPp6R6xB1keW4SruzMBay5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tK2oWxYNFdCeuytZ2nWLoD8nFjNqFtuL1HZmQsaE0g=;
 b=JH97CYpDwrJscV6v9U4xbSZv1Zf3G8CzFecMB7k33msB4R2NMosEGZSbp02QheKabi82os9XMGisv0KSZgIzgVr9nAvfbyTV2/C9jWIA1Qnqk64coACqq3OWl2lZ/+U+AEblWP128JTM2ti275H+5ep0ostTvjjWIClceKnDB0Xn5C/lsC1ABQqa5TDf0eDFvMGA88QYC9Q+5qCS0zHi+Cuzct8h9b6/YNNSmvhmTKhXDRlMc8dno6Vk4GUPvQK9QK1xstPEnsLHlj4ntLOsHvBUuTQHQmDqbvc38dQFcNpdssWZ3CsKBN7T32ndKXSAl759ndAQe89+2gKlZ6pb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by CY4PR17MB1077.namprd17.prod.outlook.com (2603:10b6:903:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 15:48:35 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:48:35 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:48:20 -0500
Message-Id: <20220727154820.1379908-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA0PR11CA0204.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::29) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a95abf-cce4-4a75-a409-08da6fe7771e
X-MS-TrafficTypeDiagnostic: CY4PR17MB1077:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5PY42yhrBhU2Ww2H2l2BCYRFP0Jfjg9+L11vdRGtxF/SOM6/xxj6CU3zeVB+eaCvBP39dRt3iUZEX85whvAS/GYcF1FTqwZD/tHRjyxM9j/aitGGbe7IE76g9qDNeM58KnyqcdXr91izwyAfRrg0iq6LUE4eAmbAfKAXEMIcEwHzXaW5FZg2ecUMd2MxGTswcN7Jd85xeGk1rAtPyMTFH0jBFTPIoPAjUlwyf05GbF2h/OJBGHvrOsggFIYKd8+DiooGX2M7kR6J+r6iEqZkQ2Xo+der+ZvG5CY97LNe+SplAdvbb9wS8FwCiRRS4pVjwdiG2qnM+gV+Rn+R+Kslj3IlbUtPw4jqb5Zj3Uj79YtOqyafxXRnAX9Lw00h3g7wg7urNon8S5f9N32v0dLkLfP7UyRbAI8DebxljJgH8JfzskVxSqjuqb5PD4DmAvzlNWzKFvaoKWE9MNYiakD5UUwTg7uKAyLgQmWacqmXtD79Mp/AkGINg6t56NhebNziIHSxOqj2m+XHp3RVtzfHPlrxLAhUbwSp2XYUg0tU0Nf5jGb20el0zV6ynqztS0VTz8mu9UMrZXwAEtYEmkt0iPEUIKO2zgHvuJvfwTHjMPhP74QBdDLIira/BjG747XafsUrITDF48bhXVKq+LdfdJB+Ugt7GHlmVQS2y0XMYGNNLSpyxsYpdf8a0fkW6AHAEHwjcSFG3w3CoIZ9Usb7Yx4H7UIN0F+cwHgo9R9H2crDBmSKXhdsJeGev3s+/3LlzUMTosDFL8UKQOH6KhqtHwRDKzPrAfdokD2s5w7Xp8BluiEBOR+7esuTReOr1LY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(39830400003)(396003)(366004)(1076003)(107886003)(38100700002)(6506007)(52116002)(38350700002)(6486002)(66476007)(2906002)(2616005)(86362001)(4744005)(26005)(6512007)(15650500001)(478600001)(6666004)(36756003)(186003)(5660300002)(8936002)(41300700001)(83380400001)(316002)(8676002)(6916009)(4326008)(66556008)(66946007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7p0soIv10TIWrBrtyQMHpyOT2fZGY3CI+Jfn6ktwBkyQfWxPpjM/I/MCcWXg?=
 =?us-ascii?Q?MbMSq4wFgGQ1xGrrNPeA3leHbBKBzLS2K3dVQfez3rAbupTS7vZT8yfTmIMO?=
 =?us-ascii?Q?UGjTvbW2NsVoN9+68o+6Jaj4Ui/jjh6Rxv3iW+QUmoeHzMo44YjN1/crKSwC?=
 =?us-ascii?Q?UDQwpiStFXvr712LY4SjA6rBIxgYLMozTS8IVuJ3CJApnRsJyAbn3hpL4muO?=
 =?us-ascii?Q?oxbvnuB8W3X+NfEFZVQgqKkOAyUOtHnwtC/gzwkemaFygFnCdsnwx66hzg25?=
 =?us-ascii?Q?CH79vxkqjNnTXolNCM1/wn0NQG1YKahFSaWKA3tbGv6d+tXVuiOHXGk/5NOB?=
 =?us-ascii?Q?p0Q73NX/297pzgxHZpFDeKxsvW+a2xwRiQRyKwR7Vfrge8w8luBhbaKXFnL8?=
 =?us-ascii?Q?Xq7reZhq2Ii/PoP6WkFNQ8D7Z2Bmyd7D5qcdoTXyM5PLs/RiAHfEHBeSbmwp?=
 =?us-ascii?Q?goEbE1yNr69Sgno4ipsYYcxV7co/hCGQYU/xmZ4Sk//G5/NMI0WL0JnhWDdn?=
 =?us-ascii?Q?pDh/VhlmszhZ8X99dchs8kGr1i8y12bsl8aSuCZgs1H3e1rGPL/Is/kE5ybH?=
 =?us-ascii?Q?s3EQ88x+Y3DsQsYzxYajHwiOXPVG0w1JQIBK9l3+xvSpBnexsTWOryQ1Cp7I?=
 =?us-ascii?Q?1sG8kaYXpOTW1BWV0R117WrJWbAcwpCs3VZK4L8tnooIOit9Kedzcde4avdq?=
 =?us-ascii?Q?6XWPMMf/kpazbYNdtoo+bLN9szD8MWc6rzdeihGOG3xl+m922pgcZAynFb4T?=
 =?us-ascii?Q?IGIcpFqdYo3sagBAtcnZSmn9DA8BiUwUiWJEUmxke4xO75CDcJQ/d7Wdk9oQ?=
 =?us-ascii?Q?znFiDutqh58cbIvo2ubPZa1mSy2BvFiV2q7bIBHif1rqh5hbmj0fF55w7W4l?=
 =?us-ascii?Q?tVVhvl8clgVFlPEMaTajUHYB1BEi8vsgZOeao6UDYthoqjCMG33fF4AM9Dzf?=
 =?us-ascii?Q?of6tWtSo761v+mmaIuHGzSqEZgyBTRu3E1eDXs69BvoPBsC3EWNz7h0zHRMO?=
 =?us-ascii?Q?kDUlHu3msX6ghE+IlfySvwTRJNTsgxYKqi72Vlocp4fU61Uh1y7g6QdtcS/r?=
 =?us-ascii?Q?l+NOpnhp17FKcWkxILAX/zejPbkqE3BaKnDCVstyf4awY1UamXsU4gZnxjRH?=
 =?us-ascii?Q?lr4PrNGaz0UoKCSomySi1nb74LAjbw0Daq4UR+ditjRxOjCARb6iAluaP+V+?=
 =?us-ascii?Q?kStlhGaa+r+DZOtxbF/2Y4lTxYJX6gPiccdkqOHvSSWsmZYR9eqd0vgZBocv?=
 =?us-ascii?Q?nN5NRhKjqafYDSTQEgRkFIGOY216J71VY2pJPBzBttFuHbJTKnzJZCWOP87y?=
 =?us-ascii?Q?axRxg2Zj/Ic35BNascRFfQea7nav0Qwv+2z0r6qmWuG8yv3AZN14dBUvKlBA?=
 =?us-ascii?Q?x5OR4clBJrcw6FY/iJs9kse4eZU4S4lTqHA/goG+p4RsqaAptYHZzhZH6PpX?=
 =?us-ascii?Q?LB5R56fk75Uc2E8V2XSzo3P8m1MpSNDp+0V7RbfICSQlFlwDW1kD6qsJ4fQm?=
 =?us-ascii?Q?r5O85QjAbo79r2e2uw/Rx4+6e78skOuavcI6Ogb1VBMIkg+Z164Zatl6jhVD?=
 =?us-ascii?Q?FQAG1LvSu8BgBlPe937moX6kBbfCH0xANKSaKlrM?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a95abf-cce4-4a75-a409-08da6fe7771e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:48:35.4690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKfQ7OkWyuwWciLLCYxIpoDX5a9G0HRVcgAjpNtz6EOKZt4sojo9c8WMsvSHYlzS+R19J5hblwfq4UaKuB/gcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB1077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tK2oWxYNFdCeuytZ2nWLoD8nFjNqFtuL1HZmQsaE0g=;
 b=FbELKrXLJTLzwzCGpVRYUL0fhbNEgNwF8OfVvJjdfY7TEpGHCsAYebjLbFsCZMUo77lmp4drZm2xm7/XvN/f+WBrnKYAQSCiCbAdjAxOVfh5StSst3Z9Nn31afhBvLcmN3weQ7KPh95uxk/TrCMiwGSyddM12Q7ou/llYog9+UM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=FbELKrXL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: updated
 copyright notice
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pretty straightforward. Adds my name to copyright notice.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e6a1bb849e..4e4520ad72 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 
 # Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+# Copyright (C) 2022 by Sen Hastings <sen@phobosdpl.com>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
