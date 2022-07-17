Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F9C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 15:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BEF4408AE;
	Sun, 17 Jul 2022 15:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BEF4408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQuzHupQlvGY; Sun, 17 Jul 2022 15:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD91B408A5;
	Sun, 17 Jul 2022 15:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD91B408A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0381BF5A7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0429C82F39
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0429C82F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8JAj9UjqdMH for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 15:57:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18FCB82F0F
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2092.outbound.protection.outlook.com [40.92.40.92])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18FCB82F0F
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 15:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0+Sx5IVphN3xp4x68XghGkAXTQiaDgPYik+neEtO6fYz6urwqw5maGw8/t5/GWBsM0YJlJhJRvwGqqDAOqPGo8AbF0vh7jNCOzuRuRz5uUTUffzgHSCf3bdkfUVHyClGX5SR7wcBbj57hol5FXVGOxgIEWQAnTYkC8634glwWGd61QxVlHX/+4RPighReBZLBHMufO+slMX7XH5Yq63EU/RlBvsg7C3Hp5H6RMyUUl/Mtldh3MfObESpvu6G2iB24/k3St3Ct8ymCIuE8rD5a7x+GIgoppfkvTHN3UX9LNZUwMqeO8FJuyIaIR5WRunY1HDDYrg+Zh8uoI0niYanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz/mhM475l9ofmZ8a3VCJllNXpTSut+riZAz/vUjaVs=;
 b=aGou1SuzEXsPFP/XRMItFH3gj1iX203KpXIHl1BZUtPPIwydtbSrZFw+KOlG6q6SG75JLjUyUVX8buDf8TyyQ+5bd/aSUDa62NN9ri8ud8lQDdnAsHtYnmdvwy73BZXyu6FJ6KjfvF1hMjtOfCXgDKYXtoR5n3+BE4/+4aBDiIQfmN9FbD00M8KUddBuf4SHqe7BKY4QdUZ+qfoNNcehnga/kcfDwc9IeTURS/49SDGf+geqxDmKFqK8Lj2YjCahh3IfMBuuiZenn31U2dTnPhTcc2vQjDbZCV5hFPoi4Pt3GAn3x90/crQjTgxhYin3gApkoI14a6YI77WgzeUUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR06MB4805.namprd06.prod.outlook.com (2603:10b6:a03:79::18)
 by PH0PR06MB7190.namprd06.prod.outlook.com (2603:10b6:510:20::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Sun, 17 Jul
 2022 15:57:46 +0000
Received: from BYAPR06MB4805.namprd06.prod.outlook.com
 ([fe80::4015:8eba:fb50:8410]) by BYAPR06MB4805.namprd06.prod.outlook.com
 ([fe80::4015:8eba:fb50:8410%5]) with mapi id 15.20.5438.014; Sun, 17 Jul 2022
 15:57:46 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 11:57:11 -0400
Message-ID: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.33.1.windows.1
X-TMN: [cJYlF6brb9phAHn44Tbqb1tBHTMQXs2RsH76iRRD6Gw4zdgmK9Es2lKWzFTdleWYpVGoagnpOHg=]
X-ClientProxiedBy: YQBPR0101CA0339.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::29) To BYAPR06MB4805.namprd06.prod.outlook.com
 (2603:10b6:a03:79::18)
X-Microsoft-Original-Message-ID: <20220717155711.2371-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47edd238-8b83-4e38-2096-08da680d16f7
X-MS-Exchange-SLBlob-MailProps: qY7UPrLqMbbXqqjSzObHHNXRO1vMBi9gGWbMwucR4IP/z37i6ZCWCFjLvls2CDp2hyylnDzFP0wsaSLrnEZxeB0EYhCICA3rjyL0aPv6M+ULkfu5+u7iqjcfDMLS6SRtBz4jC0hvmhsFZoS0OejBBV553styjACR/5IM75jRlFm9kLcPO47PrKQ0ZmeTsAzrDd0Hbsh2kaPGprwNL3F+s7XOBKzozvFt9y6RGJUiWj44/2u7Q1vrgRkpY3ACsR/TgIR10EPPa35iE/vpmKEigZzo0SX0SD+a10xwMXhLrEb5wJnea3MyGT6SRtTK76WoTLLAGMiXPF9Kd2ngcCi5tPyb//HSVaPOdKHitwHwRjnqI2TLZb+XtK+YepsLL5LJGCjE+ZVs/1+4Qih0KdZLPO8qE96FqNbut0ne2tw/hjko9Lq8kZ1b+nT48i0Xch0DWyipucvmZi6R8YWC9QUs1P5JP2k9faR14+2uvyTzt62MZGEQAyVaO4j5i/lEN1VHcEqod8o9b9ow4/v4pHzxI/iNVZ+jaqUjez4yM6mwoDYX5OWOXVMENAoSKgpS5VFpx55M55OrDuKjJHaPThBwKNNEtHkXntd4gSULYRn7s5zMJAly7GH1y4i7h4SdiBE22KFUHZeFB6mU4dXveBCY1d8Ih5MIxbFFtEGCRmEl6qnw21lWOfMM2KsJB+oEHCAO6g/xNjf3lF8ynrX6sWm/2Q==
X-MS-TrafficTypeDiagnostic: PH0PR06MB7190:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +imYFfsum+f4UevAWc9Qo1aS1xiiRS/+nvM3aueYNcqU1UN6tbH152XSI38X1aa8YKVBVXHZIOip2AGxlV38HteWAuqCBoO4ytg5OqPZ5EUy1a2wjSx3xfXBeH6DjKkmPGR9aubOpc6GxsUNXKqERgBSp5qq3L2IPhR/vfmwlOc0CglApgswehUS516VKBy+8CXNcy/9eMHTy1tEY/6EJNJom6Mbt3c7JHaBUzf+gOP+R+T4+zFfOpVLEhHG+bjtb2PTxLeyBVz/gs3iyHoncMB0A/SHxQH9vQhBX6JJoAXz2QZz5k0PV/prF0+Y7xmJzGUPLw7jO5ad46J+GMJsk7QmhnA5mcBvXvnoj8ERNulg4+L6Db3DAkR6vvrCrcyR448CgD01y/X7Q85Qs5VvRWMqh9P26CVjvGhoROTCEd0xkGUHISN2WPp7VSQzHCxSXAt3w6MoqOXm8lvtJvfciUlIZC00lIL/JA5PhSqHeFfvLrPyXMdRICkj6hzc0alUX/D/ipKg6eBRCygNsN7tTyJmw2sQadCxbzW364JSqOOi8BpMB7B41x3hp49imqq3DBKFCVDDiPGPeFcmombJL9PDJ76yWoRfdoYjZSp34046n0mUUenwr9lSZjBJr1xqzzE4+j/touKdtZvb/34lNw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uW2X4UhEaq0drKn5h7oKd9u76cz46AGyYIIO3gEpuEEDjwTZ/NOP2SSu9xpQ?=
 =?us-ascii?Q?emKbmnfb7xgbJ8k7aJJSKmRdoGMbTr7EWesAt9Y1BKRXXE7cZjf4vA8jwBy9?=
 =?us-ascii?Q?JJaPdE+KtbJQUT/lgpmMehRqMRhU4SJ8Ir3Gdhy/v+LCR9KeJ9n9UUT5uaQ+?=
 =?us-ascii?Q?vafy0N0ElXiLdkHNKmNX6VdBpAEEkdZmg0ctN8MP4GE6byXvpeIjEmySgOsl?=
 =?us-ascii?Q?ENtKvKpfrQXs3u/bUcfi96h7rxb6bL3tjaZi1+ZqhknIab24lXChpWnKziF2?=
 =?us-ascii?Q?qUA82WCg3DcytEyr6acbkOQ/84cj0KQoCl+/oz5DG78V1raEzQJ3vkDAVtAA?=
 =?us-ascii?Q?76Vblt1gLs/LgF1eNht+k4oZvEZYRy+1qzDpKs4i3vf8Mx3Ev9mh002qQfTn?=
 =?us-ascii?Q?7McX7jZjZralzsw9BNe19xkeQrAbm9pNqmKaeBQ6ld408RcxHFPioRPGX9yR?=
 =?us-ascii?Q?BhMX2icNCOj890IriPmPtmS7Llj6yhCaEoRv7spapL6JwY9Rq5gP9RijUHY4?=
 =?us-ascii?Q?oDlWE9FZ3g8UiXybh6jppvDOCopsb9eHFlKGI/QHXZCwWZ0EbFihjCYHNdbs?=
 =?us-ascii?Q?HMJTG4sWeJFa0K8z94rbj09UlZR2M5YSYk5ajynbLEW4KDTtXXGE/kVR0xDj?=
 =?us-ascii?Q?g95ENUz5GLec3iRcYRyR+uGWiYG6d87qrOS7X7yEfJWo1Wg1vo57CBOzyi1f?=
 =?us-ascii?Q?5muB5GxuZXzmc4ufcZVlwIVdmNgz9zlgsGJGL1/vcG4pLafvcvfVsPhFv+Gj?=
 =?us-ascii?Q?4ZF6gKZZuK2euZUB9Pc4MiRcFI1IYiRgOEK/R9XvjoTDEih248ZjkplNzLTP?=
 =?us-ascii?Q?zRkFh6PVTbLUou5dB3Onx9EMiCxGRiRSqpTKHIRysYEffYhWcpIs7pz0yNdM?=
 =?us-ascii?Q?x1RrzZ09eCkGdP6s9hEbmDxYUV/kPjtzFORvEabvuKuKgOrr10ScQvqMKrbm?=
 =?us-ascii?Q?jG6NOCs70TDNC8jb+u/BVh3Ph9f1QSHiwatF/SYR72HFbipTEw/mb3yfCZip?=
 =?us-ascii?Q?QEt3T0KmbuD2dxy37RTdhVAufJAm9OwGHALT0kALG/QuIshxK5W132UNMP0Z?=
 =?us-ascii?Q?+nGCGJRFJUmpp+p4rSGJW+ZpHhV4v6YaeBZTkQ+gaFCTwX8GizZ+lEEfPPR6?=
 =?us-ascii?Q?PBoLupRoFAwEuFcdTlycvmMBx6aBqhB4p/DNnsu62Bmu+FwcwwLZSs8eIEPE?=
 =?us-ascii?Q?iVXMRvazmjXXRttntbb+Cu4/7o39miG71NldiH2IOmeRVNQTNHf9hKy1aCEq?=
 =?us-ascii?Q?ZB5CKcRs5sE1IQw5jcbjpaDrMla/jlOuVQ926AdtlE2lOwiXfBI8mrfPqQMm?=
 =?us-ascii?Q?fv/b7AavbbFoFUgvkxfHlMK9pnlE6PIXiodyrOKvfaj6PcM4gxrS1s7nJ92P?=
 =?us-ascii?Q?NKLp1gE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 47edd238-8b83-4e38-2096-08da680d16f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR06MB4805.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2022 15:57:45.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB7190
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz/mhM475l9ofmZ8a3VCJllNXpTSut+riZAz/vUjaVs=;
 b=FyOLdv7tjnPaaOGgzI3Gx7cK0aZv7ZoqOyIYJjMQ345Pt+Bh6pIm4ZyPtgenOa2nVXhQOg23LrcEk8AsCOCkUwqqjoflOGPPvye4nQ2eOGj1w8R2bPhSE1hzveQMkK5M2lhhCCfAFOT8GknUCZiik0s8Ji1vE7yKaWId/JMatDtBDbTBm3xExFFdYiH0CIEYxVDyBbZqgyRpE8H2DYTPny9DhbM1MbQniTz7xJPKBrRSuhA2keS4PgbMBPJnwJapXNoYc91iUXbQiZFJgFyY7JLBpuVpB1obSBfuujuIHsR2EXFzOmD7PeK4S5EV8M/6ImHOi/579ekZ35kN0E9GOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=FyOLdv7t
Subject: [Buildroot] [PATCH 1/1] board/qemu/post-image.sh: flexible qemu
 launch options
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
Cc: James Knight <james.d.knight@live.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tweaking the generated QEMU launch helper script to provide more
flexibility for users. These changes provide:

- The ability to forward command line options directly to QEMU. When
   invoking `start-qemu.sh`, users can forward arguments by adding a
   double dash (`--`) into the argument set, and any trailing arguments
   will be forwarded into QEMU. For example, `start-qemu.sh -- --help`.
- The ability to use a host system's QEMU. While a Buildroot generated
   QEMU should work for most cases, a developer may wish to use the
   system's QEMU for options which may not have been configured in the
   Buildroot's QEMU build (e.g. configuring a different display mode).

The original implementation supported a "serial-only" command line
argument to help run in a non-graphical mode for some use cases. These
changes try to promote a newly added `--serial-only` argument to drive
this mode; that being said, a `serial-only` argument will still be
accepted for backwards compatibility.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 board/qemu/post-image.sh | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 88f0413496..f303211569 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -47,14 +47,27 @@ cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
 	BINARIES_DIR="\${0%/*}/"
 	cd \${BINARIES_DIR}
 
-	if [ "\${1}" = "serial-only" ]; then
+	mode_host=0
+	mode_serial=0
+	while [[ \$1 == -* ]]; do
+	    case "\$1" in
+	    --host) mode_host=1; shift;;
+	    --serial-only|serial-only) mode_serial=1; shift;;
+	    --) shift; break;;
+	    -*) echo "unknown option: \$1" 1>&2; exit 1;;
+	    esac
+	done
+
+	if [ \$mode_serial -eq 1 ]; then
 	    EXTRA_ARGS='${SERIAL_ARGS}'
 	else
 	    EXTRA_ARGS='${DEFAULT_ARGS}'
 	fi
 
-	export PATH="${HOST_DIR}/bin:\${PATH}"
-	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
+	if [ \$mode_host -ne 1 ]; then
+	    export PATH="${HOST_DIR}/bin:\${PATH}"
+	fi
+	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS} "\$@"
 	)
 _EOF_
 
-- 
2.33.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
