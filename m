Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C3C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 18:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093D882948;
	Fri,  5 Aug 2022 18:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093D882948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e938tYHP8LmY; Fri,  5 Aug 2022 18:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD388261C;
	Fri,  5 Aug 2022 18:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD388261C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20C121BF3A3
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079B060E09
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079B060E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjqZLEBIv7Nz for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 18:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D9460B43
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2137.outbound.protection.outlook.com [40.107.102.137])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23D9460B43
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 18:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brp3g+9XtHPzr14CgvgwOhZDJrolZgSVZEIF047jHIkShAImOHetDdKh1PxEIyKvkRaxcJJDGF2QysUe93mfR7wsB9IjyIamgYxaJqHGSgPS+LGSbqM7rt9n7SXKPxDJEOCukjBHmU/MDn87XTx0ooSH1e2ReVlyNDf5ZB+gyJmCBddz5HmhBwm27y3/OvsC8o+kipxVmX9kLrXv+T+nDVlsctvLJZSYU7Qolz2uX9OQEX0E1ponbbI4BzxxAgCxGLWpDnb1KSG5weeEglran3QodsgJMmUeWX3XzwanXR9Nz6SohaUFED4Nu1GjjB8gmqrl48MZCIFePYrSbxNFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOp0gRH7wbBv66Ul9Np0xVJrr3Wlp3yiLTbL3yypwgg=;
 b=DhLA43P2f/M6itOuMggZ3RJIn8ActDHgkk+gcLHQUzjejHw81IBWewzuxKBTUtEKdMfwxuO4FXQQ7tjrMW3LZko1QJ5zHOd3MwEOeM8SDFEHMPhyI4hoxVQez6QjPK1c2eIzm1eeb56BWwIXTdijBLTDxWUFkkEEg7yRerd2vfez4s/JabddIofKEobdaxGG6ID3Zw8AaWccAnNayK7EwZe7eyc7033rQC11UmbPAM0YMvZh1iq2rG6oL9KnKbQCovhl/3kioYOemxHPQGULBG6E1DyDPGYfz08/KSymkoHdQGXf4PV2tiwr24SZsHIweRMJDSoi3Mnp6aUZSLZnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MW4PR17MB4451.namprd17.prod.outlook.com (2603:10b6:303:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 18:58:42 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 18:58:41 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 13:58:19 -0500
Message-Id: <20220805185821.261049-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN6PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:805:de::24) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9745779-aa9e-48c2-08ec-08da7714834b
X-MS-TrafficTypeDiagnostic: MW4PR17MB4451:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjWaW3zMNp2NcPUdU0qRn5bLAeMKGEK4IZuN4kaagGJBo147PTASyNAf0yvuVx6EY2Hc3yeplFsLIGtlw37b5Fkio22lzcFLyQZTkHq28TMXSm53ueSgUwBfZWzXz6LtlLpcGsqumud5f+qpVYuIsWQZZS2g1d56Dyb4RVZNfbA2YKVvnra7ds58OkpvIeJk5nEarIij53zktqtlBWa/c/DT5lA55mZHNf3Tdxy4YPUI8nFbkqx9sUbRbNfSiuASdI869XmPTbegpDsJQxocf+zwF//ueCP0ud6TF62gIO0Hz+qCezz1dnGw+eV8JF4SM9a5nMptJ6PtYqc1nrCiCVogT1lzeqQRmA4BNG7uCJDwJPiG7EcOMMibYfSVNb/xrTeAiLMImVQgEBVxVb1ud9D5aGO7fIBa5aPeYujT8pr32yZANptwoux7Ciz6nKcPGIfxQKdor+fYXeM0VFHK6jtIHEV26lV6XmwuUsfF+brW3jfBtD7j5ZgoShMP5oLPxpljWFSAoTjneBeOZepCLP2GUQEyjEfNzfU045Cd1CiIfDwLiwwT+rN5HfTIyBxUNyoEn+G+6zfliZvQGuoJOZThl8m8Hdwqo0nRM8JzybBxSYcq9POJbGWNR3U71zLGeTF1hwWrlryBwjPwSwT84lnTcxB+Wmm65ho+K8FP5GoIvulznLDVgWopFoFq94H0pjSdmdJgjZjknFMnm6x8JHUD5eWg3YNp8Fogsp4/ArVdGUvLR2fEh5++QLYXZJyXinaO2yUNfNQx766bo/S0fuxjNB0V3Zy+srmP5ZuHnaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(136003)(39830400003)(396003)(52116002)(1076003)(107886003)(2616005)(186003)(5660300002)(6666004)(6512007)(41300700001)(6506007)(26005)(4744005)(36756003)(8936002)(6916009)(6486002)(478600001)(86362001)(83380400001)(2906002)(8676002)(316002)(38350700002)(38100700002)(4326008)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJ364rqrIz31hOeJOtPqQatIwovXao0UEp4WfKa97jSbapdw6LFnlUtGtyTD?=
 =?us-ascii?Q?eTHlYTlVV7T6UcSvBLhEcvGmcQq2t6RYu8lZMVgynOTXxgN4fB2XVOVIW4vm?=
 =?us-ascii?Q?K9oyF8JPkqs85A13kKN8oqonWrxYbybBEyteKTdGs8B7qA/5GEW3NxR/H78w?=
 =?us-ascii?Q?6MI8ECUNBBYXi+23YqRkuALePFGNNmLd62k6TlQvmMobYseXDVc2ErqoJ30k?=
 =?us-ascii?Q?HHHT24fs7K16HGPWWCHdAMWLmeuJR84tRaSi8ivRpKSD+iIiEVndqNIOPqbu?=
 =?us-ascii?Q?/qSTEAix2LQ6t3da07ZuF4LX5jps1q0Afix2Smff1o4MeQN4H3gZXZO7GcQr?=
 =?us-ascii?Q?sFFxSc6QinZ93Jc8yGrJ5N/6E/6naJxQk5Q/d0mbDgXCo0Ftusc+T91QSTjs?=
 =?us-ascii?Q?OezjThHbCnHpQSKlELNFfQRFfqul0DVoeFcQFp/0s/vwMEZtcmk9zyutBwR+?=
 =?us-ascii?Q?AIWtCUAjxqRazlLbDu4qPrdx56H090HXi0aZZ9hMI2LAfltdgon6G8kLIOc1?=
 =?us-ascii?Q?bahf8uF1mE+9VpJFx8Gf0RTdMAq/ry6aVkClel6nqk2sTfqK6L6cyID+VA3s?=
 =?us-ascii?Q?GpteabcD9Pvb41rUgZgfV/aLy3Yan5C5HG5GbL7a+ALwgWADw1uN57uSkdph?=
 =?us-ascii?Q?iySKjZTwypqcnhbU2IOZty5S7OukJp9H+PomdzaGjS8aDysoPsY43ALcoNlA?=
 =?us-ascii?Q?a2/bRwmwpcDTJ5O7PzDhThCDEba01MuQcqUzFedN4YS/gS0NhQKSVeEvp+zK?=
 =?us-ascii?Q?TOlGfBb25k4zJ2LFxIaK2c4tzzmUyBUTl5AL3qlaaljgHoyTs/UZGcFMtyRF?=
 =?us-ascii?Q?bHY4z6lgaET2bIFGEiZKwyV23P9jkPAV36PjTS+BZ4KphxaoiM+fsqAYlqw5?=
 =?us-ascii?Q?KHeEbYNoD5BPljNL7HSeA/HzNa/er2R7gDCEVzG0Kxf3nZadZTUqs1F7ZoKh?=
 =?us-ascii?Q?RmcDhErk0AAdd/6ZtJ9hrk1JqN8xBbBgWrVRA1iZgdWM08zgEDentHdr/N+C?=
 =?us-ascii?Q?7PDePMU/wziHGP9SQhZY6uzjybbXJyjqzztramBkDzOWjPa0TtRLG9NurzFw?=
 =?us-ascii?Q?8x/EDnU76jYLpZPQPYOKiqXSPN3Lzg1zI548FpRTU3Vdc0e1ojmyoHU8IIdQ?=
 =?us-ascii?Q?Xh9mxk19D7srcmwcIPO5hq4m65U8b43WY9dWcq3/mYW8GGxXawdtkQeD3TnR?=
 =?us-ascii?Q?7UJnRPzih74gdkKDMAFNt3CIztM9lou5FoAKMaAvv3TYhpCVYJevh60elyAx?=
 =?us-ascii?Q?bX/g531To943X3Io8L00AA4QDRd8U2jr+e3ErfaFYIX/RZpWMXGGXG15RsUJ?=
 =?us-ascii?Q?q7S3LU0ONyTCgZQHKbXb04KPPMqaoi78B29wVryNK34VNABN2WI2hYMJGlR7?=
 =?us-ascii?Q?iRq7gvjBSojld/XdpyQTZ8iiLaNNJvQaj8+NHMfaGmkENnBGkfRU6j4PBPNo?=
 =?us-ascii?Q?Bqf0amW8t1OS1Cqh6sE9eRs0DyeQy/lyl8fnM1G9qmUO3CJbjZrf+c0K2myJ?=
 =?us-ascii?Q?3uye0/kVs11SmX27W7KTz5T2shX7RaSviUKhPqCJ+a9Baeqz6cwyl+opiKN8?=
 =?us-ascii?Q?pbTLb3lrCNekMEkpbnjckIxn+OJS9IA8x9qqQPUP?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9745779-aa9e-48c2-08ec-08da7714834b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 18:58:41.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MuWQUhquJ+P7lmMMgXjeOvYh9psxkjpUBR/MX/DymD2FoCOTX0fjss2EoYj6VvS+Ybv8A4ykkHD5/rM52zq4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4451
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOp0gRH7wbBv66Ul9Np0xVJrr3Wlp3yiLTbL3yypwgg=;
 b=WJ6qZqBdD8vBatRG7TMiRGpLnZmaQz+BVD2uNdv7rPoie96xq2RViBjvQ3i8q9DgADZlsbfFRdhmTL9w5WG7NvGuaDl4obC/BNRtyUImokLta/dcJGeElxbc7GH4vGR6y/5NigmXKa9ujTB1HJ0zpaGTBpWBz+00xnGUUOm9RNg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=WJ6qZqBd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 0/2] support/scripts/pkg-stats: reduce size of
 HTML output
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

pkg-stats.html has unfortunately ballooned in size, almost entirely due
to the classes I was applying to cells for use in sortGrid().

This patch series cuts the size (in bytes) of the markup back down to
sortable.js days, and even does a little bit better :-)

Sen Hastings (2):
  support/scripts/pkg-stats: move to procedurally generated row/column
    clases
  support/scripts/pkg-stats: optimize CSS selector usage

 support/scripts/pkg-stats | 238 ++++++++++++++++++--------------------
 1 file changed, 111 insertions(+), 127 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
