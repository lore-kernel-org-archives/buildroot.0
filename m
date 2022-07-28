Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E60C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 02:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A0840A37;
	Thu, 28 Jul 2022 02:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A0840A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LQmPaSE_3q3; Thu, 28 Jul 2022 02:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 138794052D;
	Thu, 28 Jul 2022 02:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 138794052D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2421BF94B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 589F84052D
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589F84052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTcZJ6NKMiMO for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 02:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76DCC40462
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2092.outbound.protection.outlook.com [40.107.223.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76DCC40462
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 02:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e08PLRGCldXzNOyv1Z6s8O2iozNF3TGn5McSrKQ8Mza7WrBhKIVg9nCkkpkMOkKyFR+S+UtS5Bi0uPsY0hVh0p8lU2eRheStBQVPM47gbZWMYn8u4f36t51RUYa1EhH31rGD6uP/YExjUkA18PCPWFUmmJ8TfXO24O08fla3k4PWWv5vlxptvql+QqNWKOI0OopufjLZ27TqmWf7sQ3YFlRpqB6zcdHqmnNeRaL48zmUuTdwtGW6DGq1g1avDbCSJHOxge5ptYux0uZpj9KzQTDKkiEi3zpwoO3vfUMwlLhLThUbsANI9NgW/goJMnHfjsmIOtTeZPdtXDzRo54YeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvnxJvIm1qyRrBwgcjyDJHGhjTY0Xo+YVaPXsjvCt9M=;
 b=ivqXq4Ne19NQc+uLtZg7rcrHbAQGgmxL4DPKKUY3j6gWwMktUMWS3M6DFchdz5ZRrHKGQjrEWVO8CZ0gtt0vYFfIstOao6xJCazJdXTVHwcSJqJaufJ/XU5n7Paoy8Oekt0A51GcKjmPbCZMAqy1GDnqoHhnijOqu62iItlqefxmlVyu4Vx8hd+cK72BqwDJRNzMuo61qZS4QW7nPhFDV6USCHgNTgjIVldt49IE1ZJ2LGf+5rNN+86hjx6Qnm2knu4WrCmqciSQwETMAWHrcQZCMm0CNQ+DAtgOmyXkfitTKEmfUSSkiEldzMGmTkh3BYWCxR0EtCwiI9u5YhpQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from CH2PR17MB3512.namprd17.prod.outlook.com (2603:10b6:610:3b::30)
 by CY4PR17MB0950.namprd17.prod.outlook.com (2603:10b6:903:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 02:15:13 +0000
Received: from CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c]) by CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c%4]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 02:15:10 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:14:42 -0500
Message-Id: <20220728021444.135820-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To CH2PR17MB3512.namprd17.prod.outlook.com
 (2603:10b6:610:3b::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8892f0ab-e282-4a0d-7e53-08da703efe5f
X-MS-TrafficTypeDiagnostic: CY4PR17MB0950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkldQi7HA5LCgSBxbWtO7FRRBBLF6Tw3gCW8I1pr6SvQQzkue7ovNPRzFEJ1nP3FcxwHf2yYQk3NTVCXgN16E3WWEgJlju64/RsMwM5IYQh2yUDnlGxYpxO76lCnr20l4UrWH5/gJFVt3lNwAwcJdawY0GtXXCKGxQRgdFVz91z5QsthG0gYej/q1f9b3O6iny743QuwvII30JJ4bPdZSpbzwik28nN/wjIjTtrbw92EQM3W7X1PSF4QsqC7EsB0RbRk+X4ubZOI5G/8ZDqAPHdLJ87pXhqBLT7SLsYlk21rFXn4Y9Qx5kF6yH9mSbemAXFBCxQkqSb5hNDCKi3K97Y2XpVaZJg6nDfdrtIdFaSz1jNvu4RLpyO3mcfngtf92x1MW5JdEeL/kHApQb55NxIuLYcIIxr4Vc37MgbFigjNDW9TZFO21wY4Bz3szu7f1HuXfL8TEFGyEdm5TeIiz+86i9TVXKlnQ+11nsruSARcpSPFwXJRo1nKhMxH7oEE7DFkxJMi2HGw0Qk5UPCcdgAuSfMiscCreAAX7SEhOcxA2LFzSl+k4EgIM4FBaEAxo2xAWdPs7dCnp3ysm0KZVS40QcfVshF6jh52gFqU9HewpL6ZNJ8Ibs/HufOMjYC6Af7yqNZPNO6EDmdI6gwmUgO/5hM1841s1+s+Z54/JPt/2tEA2DTO0pZ9d6klmZOHj7DBAYeVkarItHQ/BaGcpQtODCnzlTO4Fo3b7pHw0dzAagLpwJPKhV5MvXgpRHlVL8SX7DiouMI0JPytCAuN8Q1Ah+kAE2Cjh0XQavSKKuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR17MB3512.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(39830400003)(346002)(366004)(38350700002)(8936002)(8676002)(54906003)(38100700002)(5660300002)(6666004)(4744005)(6486002)(316002)(66556008)(66946007)(4326008)(36756003)(186003)(6916009)(66476007)(86362001)(6506007)(478600001)(41300700001)(1076003)(26005)(52116002)(2616005)(6512007)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tLtfIK10vvkFoKUMXrfoaIzQXLQqqBajn/z4iwKSw/9Pl525faSSYOGLxgHM?=
 =?us-ascii?Q?c9th3fIkgh+hlvdx+MmHGbo5Aq0mbjOftaW3ZrtHnY+NEUqppm6/IMJKWEq3?=
 =?us-ascii?Q?0te+TiOm3vX4ThD75wrsKsbcv4bgT3DuRITshRVqaXhdejxk4hCAG4vUlgKk?=
 =?us-ascii?Q?h1qI/dA7pMRkOajyHRtRjRGrC6gHiHOVouaoUGhn8wDoBu2q68pPQzlrKySH?=
 =?us-ascii?Q?DxySAtsyJ+0yOT2PkyCgW9TTMg/Jqiu7yy2c1o7F8ATgX5djaSRo3Bx6HqNA?=
 =?us-ascii?Q?iSTdkmz5A4Bnq55DUu7wJ4K1gq21TtxYandDvzULTmawPaRqaW8JRTec9dY/?=
 =?us-ascii?Q?AtGLmmIE+6se4+yrsEMVWGREyNSZt6L8AZ4mghnrSjfVXGTPp/dsKF5lqZ+/?=
 =?us-ascii?Q?ojhawz7Owe16ZDoX6DtYX2GDZZVCEqfRyNy/KtQdic7SPkv+U3A7EI6BH7yo?=
 =?us-ascii?Q?dzbZ8ST6fx3X8ESGQsTbWbyRyLtkqFbZuUP+8bP/xIijPlrvMbqtRBOKD+q1?=
 =?us-ascii?Q?dYHfFsy0AtzyCHCgdmY06zUQn6JNmtEC6GDWi9uEc11QKhHbSXL3Yj4WOB89?=
 =?us-ascii?Q?HCkEf26hwmjK1RFriog4D8RnWicTZtmuUbp0wFHwXpiYI+oxiuQBfSwqk4pb?=
 =?us-ascii?Q?wLRvFH9vkAbAgBydsZDBOrsTqHenesVEP7v38I1f3L6QDef3NSnZGPgfiOMH?=
 =?us-ascii?Q?aRMqETJ3teAUbb9VSb3VGilKt8C30iySmjHUh2E0h34nxUZrBVf91xUJ4/ef?=
 =?us-ascii?Q?+OYVhMsP3HICPWehrEvbJHlrpbjmGSluxInoigXUPs/6wsA4YnHaqQZ0i9GY?=
 =?us-ascii?Q?8W2Thl0ZkH+0DSVIskqwhTSISQENSBLxUlIm2qHTt8JhpZRm3nrM+QmX7RlI?=
 =?us-ascii?Q?f3wrrCZfkRBZrgUwKzPSL1cIKMbqhkfz8lW/Zw8GzL7DQ8hN/qILRs/BcHdY?=
 =?us-ascii?Q?NVkEy8ZyZiSKXuPpbnGuMqMR3wsmmeh7iZfpSak7o+FdSJx5yutrrQDcYzlM?=
 =?us-ascii?Q?WSCQjGv/vx1RzIcgMESbMWaSiDHC3jOgyWYpXZ+CK/zjBE6dox01XN3jaGRx?=
 =?us-ascii?Q?1qM6kLIcGJcQwRK6ow8KtJ8n3gOoLKdILPJ7dbC+tSUoIB8P85iVPCt+sjqN?=
 =?us-ascii?Q?UmwbGXLCQYYOiciA+N2EWa5YyBO53H+a2oJDGJPN+TAvJTr/uh/r3ym2ujJb?=
 =?us-ascii?Q?Lct1Ua0kCOKho1llT4g4EWV98N+xR2SQLQtO7HQYzRR+uiE37gz2GPKwlnlY?=
 =?us-ascii?Q?iA9GODR40jOlzmmM8RzssBDGbQLbt240fFnANvxcU61RS9tabbK0mAFw0yiw?=
 =?us-ascii?Q?bMK++pQv3s7S1Cbn5sNU7yf2pLRg7uzF9koDbOiQQhJji4/H7mh0eRJ0mU+U?=
 =?us-ascii?Q?oFivUpXAAJSyKO9aMH5dVzNwMvqn2iSI2Q9cKt1GD4FYAe4QRYxLV6o9jA0/?=
 =?us-ascii?Q?UvryI+VlG64cFq9kAAV1TdhiQ9RNqZLkIZeEtdJWjelAVNUiFtLjAQxL1z/y?=
 =?us-ascii?Q?G7cetzD5Mp4uQ4/nawegmgBs18IxzvM+2fOt+YLv3aKtoPb4PfpUpZ/9mxEH?=
 =?us-ascii?Q?zBxqXX97m34pe9RTIZ12q/ivQFd0XVsbdYEntgYI?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8892f0ab-e282-4a0d-7e53-08da703efe5f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR17MB3512.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:15:10.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhQqz6zTrPnpCVv+HufN1sOjC2UKCGk2kaE2eoHsvggj4Px2PBczSBzBkI2qKnYkopE8wNrpb60duJ16UxGFhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB0950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvnxJvIm1qyRrBwgcjyDJHGhjTY0Xo+YVaPXsjvCt9M=;
 b=xwAzkM7A+t9G6FlbbvZNiXEOpCicc9M4r/urmurcq8rKoHck3SvXp87w3rrv8FZewIUAdWwEEFrtjgBcghND25h0qdGpOz37EKz6EEdj0zJjR+ZwiBKIfmZOjiaZC0s/Mai9BcFiSJOpTi3J+yKUJsMzq4/1KvxPe1JNfhqjKSM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=xwAzkM7A
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 0/2] support/scripts/pkg-stats: fix row/column
 ordering issues
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset is essentially a revision of [3/4] and republishing of [2/4]
from the previous patchset, but is published as a new patchset.

This is because I'm not sure whether you are supposed to rev patches that
have already been committed.

Sen Hastings (2):
  support/scripts/pkg-stats: fix rows with duplicate package class names
  support/scripts/pkg-stats: fixed sortGrid() performance

 support/scripts/pkg-stats | 169 ++++++++++++++++++++------------------
 1 file changed, 91 insertions(+), 78 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
