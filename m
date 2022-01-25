Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71D260A73;
	Tue, 25 Jan 2022 19:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKCcrZGoRF7B; Tue, 25 Jan 2022 19:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AC4607F7;
	Tue, 25 Jan 2022 19:07:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC681BF2FA
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D64240977
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbRnYGRMbzZV for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:07:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2123.outbound.protection.outlook.com [40.107.100.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9282C40951
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZeuk1TJZD18H+UI4vFYg/jYwGiwEX6yG0ljP+NiRvNM6jRyE9HLrQRFy7XDZ7tCORqDio8EyfgbhF1bJW8Of9bqpslRZ8ioSzqYq09WQS0RGV+WvGhQBPh9/87B2tgvtnLuo30L9dBm2HXiyMORnEC9Vzo4sv4NAIli3CnkpyE+SYeO7HFRDPF+UGJQ7USqjLyoQqG89P9iwwYHbkprIoszr0TSD+YQ2VBQUAj+BtEl84dWp/KNzgG/38AoOA8RJ6A1KrWAgmttK0Nbm+hJCYfZzOBX+sgQb3hC2k+mOdFUfBhZ15ZM9C2cDPeLhAGS3aH5YIZZn/Gxa3DjtsWdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq/ZRgJQvu7Wg6gZSCXN7XhdaNDdC9THSPr/We8ZxzM=;
 b=AI1pjEwyXgyWMYjmSWTEp6asSesntNx5u8xTSkV02qQoJL9sXvPCmAufc9qzdl6q0TYETnuD0kloSqaFLAVL3UZvBuD9hgK1FuXs8Dka39aUpUUxvuDUEWh2HbwjcpfVOsUxhSeUTd2gYG5EPxLml3TD+oJRPpJ6cLwEK2Dn4i3y2jsDod0S0139Sq0eDj/F2jNEedofZwfD97cYrf+qyzGykTpf6Gtro/0rKmGVU368cXY3t0GcNJLswgowVE7rAc4XvqC7n22nhw4DxkzjcECjlym2EqZ+l7RHlCcdPLLDfwDn/Dp4bhDGRWvlxRPlx+XyyzxRE0BlURTOJSn9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq/ZRgJQvu7Wg6gZSCXN7XhdaNDdC9THSPr/We8ZxzM=;
 b=KDyl0SguaMyJzCxC3mdgU5RBclMa7AvzjsiljBZ7+U3wANDoH6Gv/fdZlSqbauDw4efmZVXuGQw99UhPhoLwFIit3HZ7TNKoOGCaNC660vaHT4kJ6t7GhDs1HDdkD8jrn4xNegi30W60npg+s+xqPDwjOu1S/TIIoJwcOw9x/b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 19:07:17 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f%4]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 19:07:16 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 11:07:14 -0800
Message-Id: <20220125190714.30785-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd3d139-2282-47a9-6caa-08d9e035e70a
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5433DC815DF7761BB588330EA45F9@PH0PR10MB5433.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ul2xB7rKK6GTZMVa8b+pZUEfqj0MwTJymbt1+IWZWEivA2HLpxwhL4XH/iO6VHMPd2gS7cU3dIqJRuyHjdSnZilfgOWNcpd6uFp865jS3iSYV/tDHfiqc47gvWTyutQWt7xS/jh9XGu7H/Nz8ViQqjcGxxnsglIVnbrqW6o1SPucUUjHIc2MArFIGnBnxyzoiik2zNrqIettLh7YY23MOrpL9isvDzHJ3h2U9PkmGWywtrfQ5HarYlNpboxBEBvH1l+B3JUWWUe/owMerKAlH6MsS9ftvSnqejNlMukD1WQFhsGZnrLiI+cL+9CvyOAkBCZX+3NubAbs1Awza5k1fGBOLDxcU4I/ZSin3FUEmwvHTgC9zEb3NYE5qMb7gr+FjMO7+aSif1yXZk7Uh43LFEN50dCiNRZsJ8DbiyT7o8ui/v/bIUs0lSaXrQG4iXVzEG1hiF4/XP16KlDS1CJ4tIASSNXVxCRF7QNUwSIoD2HtScoEPS7zF/i+jZQvcAjYK9j0NPgV2Fw1jozGS3GseKYuR/Ls2jYVpmhukFwqghbVdSjQ/XI6VAP3fkR8GwY78fKHuk8C220H8W9i95OpPL6/qkJkHUByrTxok0HZ5ughQMYbou26i/v5xnUeXuTNvVOu7LOZpYPKIQ9Jq1Kt5a89cyqrtYmT0eqrEcVI7T++3wECKPdulOVwJGYkq9tSSK9W2pgYQiMmYIJtQolj4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39830400003)(396003)(346002)(376002)(42606007)(366004)(86362001)(2616005)(66476007)(8936002)(44832011)(316002)(66556008)(6506007)(66946007)(52116002)(1076003)(8676002)(2906002)(38100700002)(83380400001)(508600001)(38350700002)(6916009)(6512007)(6486002)(4744005)(186003)(26005)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7gpppuvzg03AH3Rqzy04RMGihGCnxJcBZtzmyn6eklOp0YCYtzAX0LmmgfCR?=
 =?us-ascii?Q?dAnflLC97qt1Mo41kzPtcFRIyaBpQrGv4/qGBwQ3KJGZL0BIacrWsSpkVtAZ?=
 =?us-ascii?Q?8kOFPWZjYvRmHk0AukDVJjcaaLVIkl+rsow3wCU7gEkUsyWU07pajdBGTLIZ?=
 =?us-ascii?Q?1TQUTSBKYsd1OXMG3O9PSSOfvtI9999R1e3CDwqjTiFblRymt+ppXJp13mUC?=
 =?us-ascii?Q?oHROlNtaJDs2O5My8Vppc4xZE3BwXu6UowofAzK9HdmJx9qQUBSc/apY9C5d?=
 =?us-ascii?Q?ehSCuJqiWB50WarRSPlDsFsfsyggS/g2x3KfQpKlH2szcDwiT99/JY9o8LHL?=
 =?us-ascii?Q?+tTyr9DGkv4M07OxBmQeXuG5KlJnXst1IqLpVzRHJ56R824wzXyjUkddyEKB?=
 =?us-ascii?Q?SXdMXtO/hzen1clbCEFDZ3g307EkaP8xbd9f+dDRYrxQdlb0X1OF7XjD/qy9?=
 =?us-ascii?Q?Hs3HzQhUzxif4Do2nUWnH2aAUfIgr2T3SpTHUZeh4PZavL/V0Iep6jqhVsac?=
 =?us-ascii?Q?Z/GA6KxOBuJu2OHJ+a+yTg+GgSnIHq7mLwr/dbTxd1uqWREpTmBdozdyZYWE?=
 =?us-ascii?Q?c+egrD3p+czzifCyEsTJNDeZoBS5HZLn655TCTHcDvDNxXo1mUtKa7PndqSe?=
 =?us-ascii?Q?9SnO8OJBayb0PJ+3WR1XokfLt/pLTTPcTJOMqG5biWYa9iMkiTMbgi4MAohE?=
 =?us-ascii?Q?D9pPINrHLCXdqK3lfB91n/jes7NCPAAHf0gBNRIkQ1WwWRY890u4fO5lxJfs?=
 =?us-ascii?Q?O8DZlcCstnkR//7he1H5Vx3CzZRXl4o9IqFCD2mdsGt9cj6bPQeSbUIWNu30?=
 =?us-ascii?Q?lP4j9lgHYW5PFETc8wiCEZxL4ZVb/Atoyty8o3iz+VQmETxRzo84xNjI/b4l?=
 =?us-ascii?Q?QqIKKBNqpttTeONTJjbRtwlEYBEl0zu6geKklNm8Tw2FMxC4H/zGoOC3IYhd?=
 =?us-ascii?Q?gzJC7mxBQbZAHag400m+d9o7S1kWhvAH9ox2XNBe0YAaMuLT5nrfMU4lnIdQ?=
 =?us-ascii?Q?NjguQJjGNNqg8MTJ4Bzw2PgfEIB8EFyg8RMIjFOtSMbxjWQ50l1fpnq5hAnF?=
 =?us-ascii?Q?jU4AzU2kw0LZoyRd0+yBeeYiBAw6/4Ciwmk0QVay2hrPvj3+ieF1/XKHK++e?=
 =?us-ascii?Q?m0RTsoKVPD5uA0gCYrSMOM3839uyR1J9JtH885pjLyGjke52v2omgk0BZYIK?=
 =?us-ascii?Q?HmEJyeyx8siMKStE5p02TL679NFrFw80kv/SwoRxjv9meN3rkh0mepLDsmZa?=
 =?us-ascii?Q?/iS7zzxxlugP3LelbSkdrnp4isAeH/bdXARPIKpLl77KQ2CeGKscWk4OSts9?=
 =?us-ascii?Q?p72f9HtSTw8oUaz+nefHdHRIFcQCf/SXyktBLoRSA5FwKFrKLz7kWE3D9EOa?=
 =?us-ascii?Q?xRKBsq1jP6p9fZBvoUd2955T3n8prlb4htq10oyJsWLlEH1naVVn6kg3xQCq?=
 =?us-ascii?Q?FgKC0fla8bWQYLOSazBoua7GNyQqlczPSbyPjy67/DYjvSua3/oaqeO0LlLb?=
 =?us-ascii?Q?mRldrIYrCM58IWzYHTgplBRyxwmZ3fDrnVKl0kK8rv2WhhE+XmFCvXG3Lgi7?=
 =?us-ascii?Q?bRwHTRpsK9qEssV/g53dQFYRM4+Vaf/ErKBhWXQePYbfEEQ6ulwuvo52kTPN?=
 =?us-ascii?Q?X6VYL7f/4s5zFqcltP8TjRcPgcvGo1vsTDg/dUu3/Bx9T0z6bXRmucgWrlnn?=
 =?us-ascii?Q?o9hkbA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd3d139-2282-47a9-6caa-08d9e035e70a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 19:07:16.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpZnSG1fnryZ/6q1IOean2iPLs5G8pGwbzbbHyoX1XRAGdUVPT99F0ooLBRHdmb819iX9t9zwpGPkf7ppoT5HxaUQKOAc4I+q5dYyUYNdq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5433
Subject: [Buildroot] [PATCH] support/dependencies: add suggested regex to
 sanitize PATH variable
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

WSL typically has /mnt/c/Program Files/... in the PATH variable. The
suggested command will remove anything that has spaces in PATH, which
should probably be good enough for most users who see this error.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 support/dependencies/dependencies.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..e49dfb84a5 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -41,7 +41,8 @@ case ":${PATH:-unset}:" in
 (*" "*|*"${TAB}"*|*"${NL}"*)
 	printf "\n"
 	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
-	printf "This doesn't work. Fix you PATH.\n"
+	printf "This doesn't work. Fix your PATH. You can try running:\n"
+	printf "export PATH=\$(echo \$PATH | grep -Po \"(?::|^)[^\ :]+(?=(?::|$))\" | tr -d '\\\n'; echo)\n"
 	exit 1
 	;;
 esac
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
