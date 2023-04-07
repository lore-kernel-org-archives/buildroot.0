Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C30C6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 05:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1B5615F3;
	Fri,  7 Apr 2023 05:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1B5615F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdfh5ed5MrU6; Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D472D615EF;
	Fri,  7 Apr 2023 05:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D472D615EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFAE1C2E20
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BCF9615EF
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCF9615EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNu-Re9sfk7K for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 05:21:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E6560FD9
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2082d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::82d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15E6560FD9
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 05:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha4FfZssJz3LgU1J7ljjkycR07ynONPnjXxOL+X0GO6xmqkzji+WKSWNe+tM7TlOIxAspjKiQXQ9z3WmUd1ONoDXsXIREBumbKx4y0/WEidmZwAlslVEqK/8Ycbrfc/QVYiTnp/CB41cF04jXkPg+cuQIQzo5cxSUbVPJIDZrbcgr2/iv6mqHga+o5YtYEYI+Qtfqpd2R+HQbwv5IBUsVs4DNyNssSjwlOk+OJAiEQA3Xos1s6fToTR8BEvokyFD3J1eXEbl9zmR4fejk9k4w3Z1arI5wJPLiaVhj1oxi7PlVhChDEh1mA/A78EWw1TVaehKwb5YSckuKCGBQ1xVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMcHNGNCQyl+gXNgvb7krDA80XyACghNQTD94mKE1qs=;
 b=XLXqMKo2HBiTRfeFSrtNEy4D9wwi7jWJ25GBJYzsMlvsWJ9Ylp2IeJvBOzsuszx0eaG5acdadpeNT+LexxojvpDBhLLxlxSCgHZn9LCMKn6z/fHQUADgxlajh1Ol92TV2sCjsDKicnYpUSUIRrdyID2NB66W5mc/XcqQf+Nkx1LswRnn/MY6i20UCGcYZ6Kl5yvROsy6HyMOEC3c0HHnMZ9f998bA+U/2k/sXdq/Y/ak3+DXtqSP8Jwz3hKbPDs9Xkit/XhsnT5J+Nnj85N3/Gj5nm8iul8zQ6d5Xa1bsmSXUyGnfyXWMYgQTHV8Jkr9LDZfU30YfW7sMkswkyT9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH8P221MB1016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 05:21:28 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 05:21:28 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri,  7 Apr 2023 01:21:06 -0400
Message-ID: <SN4P221MB0682D9AC28AB53863A652575A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [WAqu5K3K8dQbcH4OQ6bUTW+fx5Yska20B2uPGqd/XG0=]
X-ClientProxiedBy: YQBPR0101CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::13) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230407052108.1696-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH8P221MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2f6595-3efb-4721-3121-08db3727f0b4
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmovywdyt6JbrF6Sw9xOtJaeV3F3C1UZiBHU1QMVUt8LesJPx7oHxbtAR5H4xyFuwKJ/8GT3Fp16+FYBVo+N8lBt/4vmlYHsgntBl+DPO3UhbigLiSyQbjfvSYKoEjfk2yY7O/jlZpz0lkPXNrjcnqi3ZTigCg1Gqpa/LWUq7LdW0/LNvRLtlCkgvRhXgdrXtGe7bsaFg79VfEz7gGScHTQvrvKc9MBzc18nQyCJzpcruwBUeKXcvnstAcWdUqtVi3yx9aSh+wMNYLEin/nO8cDQzx2yKUi6oX9yLGxEBEUMCA6otpiZfBjZ9pDCTuQOn9zOStPjC54RqmNgD2zbFVKURVHADDTpGDJ7c2e6Nr2aDYDE0swWeXCP/qAbHUoAE9H4ULN9K2QbZOkG0/tls4jDSJj7nKFLwzt29oZjWB7LEBbdLrNnFJh09tB6LdVD5xp9/xRqByCr5HkfutvpKtkKcuDAqLRtydwuC10yilv9XRkNG0J6rY7KWF5J57hQj42fHFWxMLaJ14WrX3dkHyebt+IYwaBd1cjBUeU6HFwzrzvMihyaXI57C55fqgqiXkeYs3ey/BWCtZ+gD/KmofTQmygzuAEFLmf0+xoej1UhmT7ga7IFZTTJqIPOgIa+NLpdX5EjdfGXq/OuVsiPl4ZRvqSBrwGO59mP/UpECLi/oFPdN6NHgopo26YyFCZEqrikjdDd4g5M/uEOT8dcBWLlAhUNZV+HFi1X/m7/MoeuKImikpMEM/PhJB+gFXEhWBs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RiNY6wfsOCwaVqy0n1+yW91TN+lHBOWLc1e7fOzG/KArzg0dasUbR1UicpX7ZVAo96vvFrJCCbsn4rYEihO5557vhe7u2xAKGnSmNdUofYl+HmFXHoYoDz92GQWBV9P38t7eYIo5xoX3omuxv0NFnC0imEvZ7Xf8mYpVRbCFP58VHImlsrUOBaJ0EEpi+GoiWMG9s95L3qm+OGXexdZ+rMgvviV7AXM+TvkTVcccHGUSooPXCZlvECCkDjcaIERvoGbU988v3RR5mQwWHOuK90SxBhAbJtNTTVCTeLhc0pVjdzLjXsChtFGOgcWDRSFqoCs2W5/JXyog6rDRMQEIsiuiPvgJa9iaV2nhjwghRlcsm0K7zq4sscYoOF0ErbffQuCtwMheARyRyiPQVItXOlIgMn8UXAOpVTBqfmK57G3E4rx8e99848r6sbOArClKa6/NENRj1mHM1VxH0J9v5+pOeP2/fidlhcn+QdHUBVktZHZ8aIjdGWWin3hW0k/YCYD0jp/DWHJ0zyL1mm6csr/tPY3SziG0C1CEWpo3hEGUb0Wu8oXhyRXCv0CXd8US3e91vvRc5CLpeCbJ2Evz//VLZ+BCwvFYklhfsQHmCawbsUGMXxmy/qwzTMl02AUe
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?64yUODKgg0deGgJhOpbPqjQCVPxEqOp0IUWZSETFvCU3jQF8YLrWc2yHW+eM?=
 =?us-ascii?Q?B4AP1vGkOPl4CIR8IoztFOiVsQuaF03Pwgiqdau2Jp/k0Xug7zX71pLXyG7n?=
 =?us-ascii?Q?jub8T6UehkUCtLHY14yIWKGGCeyTmpQL1+RuLBL+z22xVvNoH0teEwYBd/aw?=
 =?us-ascii?Q?1ZK8Eo07WHtp9moT+sQP/oei0QgGQ5d51RX7knhbVQrmDHJjAOt4mf8hBxox?=
 =?us-ascii?Q?+BbGQCO274kroJJmWYxyU3/KSzo/3izM5KERyOzjsV9BHWB7jk0qJjqV4jJ5?=
 =?us-ascii?Q?u3NAuLnbDalbWm8m4+rLJrDGQMEzHBT0qfRuXKHoOqUl16BpT4/YZLVHFovp?=
 =?us-ascii?Q?2rP2V7p3WjjdCCDPdESvUdfMQIYKlj5DKhuYJXRa1o9dNhRklxGFxBU7WEsP?=
 =?us-ascii?Q?3FZJ+ojCbOa/nd2qdipcl3d3wDUeNR+56gGqEeagn3VFebXAu2FS/pSYf8nB?=
 =?us-ascii?Q?CM9WMsk2UV+R7w/+23MRsOWn/6+mc8tX+kkgOgvBO1MYtj5aGN7oQFT80M4H?=
 =?us-ascii?Q?20r3qSTZLdoTmDxvB1VNHs5A/OP55jMsUyI+I0oTvtdE9su13NkYvh+buzrB?=
 =?us-ascii?Q?Oh/SV8Z87toQY9T+LWSSBoI5EgkTFvbi6I+Cm+2PGM1sByjQP/pR8VfKC7tE?=
 =?us-ascii?Q?ZcMt2ZSQO+V0bI7+owdAY+JTJQjvajp4e8ox/5NBDMiYZK8mPsBajrH4pieo?=
 =?us-ascii?Q?TRyIzZt81fZ7bTOBgc0v2wTrY/HrIJrb859vIdAdsLe1weAhpOnSHIALfLNt?=
 =?us-ascii?Q?tcAUVvMTA0/+YPpwnRrxJveuahkzTJQWxbC5GvOBBjLeTICpnmI7XZYQjQdk?=
 =?us-ascii?Q?5jqnGXZANMpQagTsY/fBIaQMkqYQp+hFEVXaWiGXsxmDEvU4Jfi3dbwOwUBU?=
 =?us-ascii?Q?KSamkt+JpKsxgSdeBvzF4L2c/od19hV2lpXexGXcPmJHt8ztc8KYYYebVo27?=
 =?us-ascii?Q?q6sa7aK/vYjnQ7vPj0AvoQWxMyxu5m2KGkcBb8E3UNLHgZqVhdZjGbT2IFXx?=
 =?us-ascii?Q?0TTMhGU4ww1lsDLuMHZpsbau5raWyyWpBGFAb1/ZEWXh/oWrMThexAedh11u?=
 =?us-ascii?Q?LPO5l5I9LBuq4mDPYn4yByJzXyejwKi9PxhwYR186CBtLDpIqWG5+B0lRO16?=
 =?us-ascii?Q?9G0NxEQ3q5YmWkAPy6FnVWf0aZ46R5lH7c2BSyYppSnhxXkLt0We1lZEwSH7?=
 =?us-ascii?Q?t3Ie0oFMEAovPWAdHVNuJ3WxUWBc0lLnBdSYHBu487C4krW6zGthabTNOyQ?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f6595-3efb-4721-3121-08db3727f0b4
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 05:21:28.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8P221MB1016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMcHNGNCQyl+gXNgvb7krDA80XyACghNQTD94mKE1qs=;
 b=eYFs8giu62FeQCMFdMACiSIb7tbSigxEW4IH6kqWIzZ4MCmK+l0anaKmInd6cvpjKMQEC9DblNT2R1ZywJwDgguEdDJ0cLI+FvSa+aN4qyeKI90VRXAQB1aYr1a008/9vTctBFW0DsbO9ybTQX9IFefVCQwb+351RYIceiOv8IfF11LBgwEtXDd7+3RAX+WWdq4eIqwovqoZT6jzn0t/EQ6nemiAPCmZGMsIGubIe3Lf0pgCLWa4sB0TYIWR1m3yfz6Bc6FwS262LQD2UQqKPEqltcKvgJfHLB8adLv5huVPnwV7/YjzHNkhUl5P5amdfXTd1TXKwAgmJBeWuanZdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=eYFs8giu
Subject: [Buildroot] [PATCH v2 1/3] board/qemu: define start qemu script
 outside of post-image script
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

The following moves the definition of the QEMU board's `start-qemu.sh`
helper script from being inlined in the post-image script into its own
file. This should, in theory, make it easier to maintain the script in
the future.

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - Split original into three patches (suggested by Arnout).
  - This patch moves cat script into a new 'start-qemu.sh.in'
    file (suggested by Arnout).
  - Script template dropped escape characters; uses VAR_ prefixes.
---
 board/qemu/post-image.sh    | 21 ++++-----------------
 board/qemu/start-qemu.sh.in | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)
 create mode 100644 board/qemu/start-qemu.sh.in

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 88f04134961ea7a105e506045ca16a0d9b810925..c9043a1364e8e03dbfa9ff3370d4e4a34357bef5 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -41,21 +41,8 @@ case ${DEFCONFIG_NAME} in
     ;;
 esac
 
-cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
-	#!/bin/sh
-	(
-	BINARIES_DIR="\${0%/*}/"
-	cd \${BINARIES_DIR}
-
-	if [ "\${1}" = "serial-only" ]; then
-	    EXTRA_ARGS='${SERIAL_ARGS}'
-	else
-	    EXTRA_ARGS='${DEFAULT_ARGS}'
-	fi
-
-	export PATH="${HOST_DIR}/bin:\${PATH}"
-	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
-	)
-_EOF_
-
+cp "${QEMU_BOARD_DIR}/start-qemu.sh.in" "${START_QEMU_SCRIPT}"
+sed -i "s|VAR_DEFAULT_ARGS|${DEFAULT_ARGS}|g" "${START_QEMU_SCRIPT}"
+sed -i "s|VAR_QEMU_CMD_LINE|${QEMU_CMD_LINE}|g" "${START_QEMU_SCRIPT}"
+sed -i "s|VAR_SERIAL_ARGS|${SERIAL_ARGS}|g" "${START_QEMU_SCRIPT}"
 chmod +x "${START_QEMU_SCRIPT}"
diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
new file mode 100644
index 0000000000000000000000000000000000000000..c2d77734c7a6b318a5f7adedfd9b0b5875e84f59
--- /dev/null
+++ b/board/qemu/start-qemu.sh.in
@@ -0,0 +1,14 @@
+#!/bin/sh
+(
+BINARIES_DIR="${0%/*}/"
+cd ${BINARIES_DIR}
+
+if [ "${1}" = "serial-only" ]; then
+    EXTRA_ARGS='VAR_SERIAL_ARGS'
+else
+    EXTRA_ARGS='VAR_DEFAULT_ARGS'
+fi
+
+export PATH="${HOST_DIR}/bin:${PATH}"
+exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS}
+)
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
