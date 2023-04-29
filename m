Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF9C77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8E4560F9F;
	Sat, 29 Apr 2023 18:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8E4560F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MK_EWA8ygulF; Sat, 29 Apr 2023 18:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1390660F8B;
	Sat, 29 Apr 2023 18:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1390660F8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A54621BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E0D4841C1
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0D4841C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7Atz1zmFwqn for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05C7841C0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20827.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::827])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05C7841C0
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKnmkG9qSRgWA04wsyiaYcxnHNZVBGK6O7Kz1ayiyoCRs30N225x/p5VOwqv/yn695vctqgfJ9/NF7lxoswM+4RKecVcq4ROmX5VC9JHUHUJOrrmMg3tvE3nIwPxhLAcSaifrAH09bNSqv4WlWRDDq7lHNdoeKWxKkDOPmsdvp+ptAokk8CpcZtK255fdgTSScgRe5BQNVtUMQ08hT6hHoBK0ZiouOfRgp8fd8WE9zSQU4+22iH4V5PRUxK6VK/GGL54uq2m9MXPcapNvE9IZ/rpRaLs++uAvvs2UfmXgofItN7QYUa1KI2ZJVUzuvC1KGcvZjmCeS1iKEsiV8NEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M50KTPqsGcznCQbq7FHMUIr6g9ykgnuEq56Ut05REdY=;
 b=Z38mZkMGDKxXN6oir6JyZFM2h7pktgV5UKuedNeKXgc7LUIonT0SCBbePEQg81vMpeD6vUCuFXOKAXO2ZAcbN9ABG4f8JMexN9VSt6eNGy4FH1JugTWsbXWeRlOu6vxd6owtvajaQgdniyc254eh8Kpy4dvbbF+ZOwxKRe7+SS5JZg8PH3L6+XBNXcoZ/xe8c5UJzDGh8Aq+DN6daj9ZQXHml+cdOZpB85h19D7qFsj5S/iWxHM5QCFs0exI/O7VpZ9kmFixA8tTrdO5+NLETtvb1o7D2tYGLhA45o82A64BrOw51gxKtrLiHizQEuc9HxqOLQAG/DfHncVAmbSriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by MN0P221MB0897.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:3cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.25; Sat, 29 Apr
 2023 18:12:53 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:12:53 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:12:02 -0400
Message-ID: <SN4P221MB0682A6E723BF55D3807B1BBBA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230429181205.3620-1-james.d.knight@live.com>
References: <20230429181205.3620-1-james.d.knight@live.com>
X-TMN: [Hy7R0CgvN6K2sjj4LdyNTPXKLMt4mxSc]
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429181205.3620-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|MN0P221MB0897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d67a104-c54f-4058-4eed-08db48dd594e
X-MS-Exchange-SLBlob-MailProps: EgT5Wr3QDKz9LT6L8JnCnTKowlUv9J5joKn+bCSW/meCBAH4c2R1ED3HGOHvSrwOwadlK70Dp2eg5YNo3Pdc4v16PamDqlzy1yjmJxShRgqed7n5gropgmj/GiJta/mVIJ8PvGqkRroqVc2Pq7AuK7yxRmUecyrdsCLLUq0rR6/xyjFhMTan4kAkbiOvtQe9vsJT+4wNLVVWQ2qUVyUozqM5aBQkQYHNWeaRdCefnWI/H14NmboEVL/RJqlDUdLza9Pe2wOZ4w86PilkNHn8cJa2Yvf6zYCIbxMqBc2UWecgvphEETWMeMfLt5iasoIRPslZdDfVUPfnxXU4VKRM+TEJ5dH1G1e5YKc++G2KwHlIk4UnBfaZy37+MOlJAOZcRZH9Jt5V8zx5QjjLMXNswXBxgpVferQ2yHNqZQxz7+qjSeGqLNH+Z3hmNwAJJzYrWSREERi8gJf759kp9L+b5/xJ4+zIrQ6WoiBJ4lLQXRL7FbUXv5V2uUBZ5w5tvFwDM0VH4NvS+WdM1lcv3puaIPc7dnz4mOyPR5Eo/ZfR9BU9tdiD5T0kqhHtN0/HotJzSP0KqDLqOYUVmiuw5im64GVHt+ExXD98SEH74lELeR10uk3T5/SGpg4iCcjm4+H9FmWRkxsW1Uv/cJg1lVu4Yuy9f+Sxz1I/dbQTDdpMWSaq3/M7W9/K1zXvzaI+m73D+dMFz5WBtq4j51NKBpXBfpMLsSxP3dKv8w0CVEGII0g=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OhSN5sH1vnE0dfcINWicxsMwB5CFhielQLzVEZn2g68OjMzciESkYqCiOvNfW2ck2A8h0H4YFon441S1ajZoWT3zKuhCPeWIBdB4RYIOerVtbl5UKFpbkgfjLj8XQ8BqIE+wDwK79szuMix/dVFhpejYtsGq0BJ+ztJsZCd11U6uhO+537eLjR/pWrT/Pbh0ZlLl3Zs3GtZ4eckYanmLewY5+qJA1SjZCvoSPiars4WsX/kkMxm4sPEEGNealPJ70UOLSr15m0dnYZh+7QMA6vdkbInEBH6s1fhHzQRR6mxzzUJmvdoBDxU7FGO/M0WX+liHmRXKIj+iO3F1mcdGq8bX47NARIN2sh8E/SN5uy3Ium1UT3N1EkHqdSrQR+nlwFIddE4LRjkLLx0mYut3Fa5UZhac6J5a7nZwQOswnzmz937aVqg9ogTUKxpQ/OWAQdxxVZ9SPTX6RDwjQXFa96Z2k0wNhNGFH2BzbnNllTOpn5Zqv0xJqeP7GTsOgv7E4ebQHHEBJ4DLXdGbFp2S0x8caRNe6a4YlFQrKBerB7uw67oYQC8KQqiTrdUVBEe72Trbyj8jmDA+DwdaVq+FNI7ry0NZ2awOHC4aVxPtIui0SO8sZHDJOWqvVqRK2BV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqH/DbtdTfAunVCcVAZXoA4atob5RYsM015Xw3I/bpORyifV1CPmdrXf7DgJ?=
 =?us-ascii?Q?0+pBjL0RZmLSsNHIOv1NxEvaeIWZMwV10jzJQoYcktlyBmPRJGUb5LXNPg6C?=
 =?us-ascii?Q?kwBBWVCAyEvw/hBPIpKIa2ypInYPPorK3hjFval8h94RqAQFyn2LbPFNBcL3?=
 =?us-ascii?Q?twdnwdaenX1teG/lvhHXxi7g9qEiIN4fXLHyGj4VnoBfbxvFUfkoFRxrehE7?=
 =?us-ascii?Q?QsZbsQPgr3SAX/P3tBw9uyHGjrD0wqpBI/+4HvJKJrvtAKeylkGKXCVFLn/v?=
 =?us-ascii?Q?0dPq3Vx8/cg3cVBvav0sx4eFM/92m+oVYSR7xWaNjpah+K0yNqk73V3AN7i5?=
 =?us-ascii?Q?Hri/kaHAkUPSVCcTUqVk0g1Pslru7LZ6BwMWCrKUGj/nbBpYpM5TCmfmzYmq?=
 =?us-ascii?Q?T91U08Rve5McAtmR9e1QSZCByBEg1/M4nbtBEO5PF+gWO9agE6o1mxO9oEW9?=
 =?us-ascii?Q?gJ+I29ABh64LottFvo7guprZ/1CXCOuvEP6zMaxjuVROIYWQ2MN+5lQpScGi?=
 =?us-ascii?Q?fhxbfO1vLMxJPlTcWKwZNyeqSZZ0ZVelpXz9emqDO5Bhj5FR940VhYPAlHei?=
 =?us-ascii?Q?zH/yQAa3YQw3Sm0vTnoquQe9llhMNx/RXwAmdiVzRgr8LcmBVJWJumRbTe+l?=
 =?us-ascii?Q?DHOVKBu5ZatH764RU1555gWd818rVsdu872Bo/3zpLMUgWD/bqmY+vAX0sNO?=
 =?us-ascii?Q?V9+enYE4dNe8Cz+gu6f9sKryASw0HYPJhQhkgGYOVlnFDXKSXMgkuTv9E/Lb?=
 =?us-ascii?Q?fSIvQHLKxdmLhsTP2DaCP/pEHz1C0qW7YAhR1K/UhCDr/TqLHyVVuqmelGM/?=
 =?us-ascii?Q?pMmgSz3BxxL/XHA0YbtzZaJ+xbPchzzDCXAveURA/c2AFAHeLzbN44Ah8Q5u?=
 =?us-ascii?Q?lPfEokwMz3PQajbupcT4HW/wTxykzTCZcr37khxmUQaDc9t0YySFZI9DKS1w?=
 =?us-ascii?Q?5J4varTEA+dRFzzdZDwSeeCmq1L+StwztIQdVzxQvLtEGoiG9q+y9jhI0rMY?=
 =?us-ascii?Q?hx19vNkMtbTWbUyqfnKcQKeULhocBjdynpH5ykzyEWHaKRtuv51aNdZ4Yapi?=
 =?us-ascii?Q?P1BTLoZbDr3wI1QZbbzy9xSugTVxaDEy7LobUCAAdLAuBNXmnBONg2074uFz?=
 =?us-ascii?Q?ea3PFnIPq9FlQhREpbQ+1CXxTKW7DR7FPKnVSrhoKHVXGhCRziPrCvhHipIR?=
 =?us-ascii?Q?7b+n8tODrHRre5rMR9XVT5KNvOA/cMK5nYZKp9vGU/4TVb3LZvYF9SPjyF4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d67a104-c54f-4058-4eed-08db48dd594e
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:12:53.0990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0P221MB0897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M50KTPqsGcznCQbq7FHMUIr6g9ykgnuEq56Ut05REdY=;
 b=DKuUmzajnmOoi/YkNbLheybQlUgNzjFiD5LWBQA+Riff606GwaluzAE9oqqe34eAWfWXKi1Q+vqae/hJQ5XIbNNvp0nujof4e293WrnHZeZX+Ph9B5yhM9qR9DFSuVeosCVlGqTkG08D8hx6WcfvEtmRS7y2y8hc12WMbSNWGA60RjCnT/vXyJhUrA39GXYfiy+f2DTP08GTEysmwN9uhAh6V2q0c+IeR91wO/rNxtpQwI+XeQx0TXv5gfImzGJ+bls5hMQbuPOfuuHF/oFPWDjH1xj1bWkPPbNx4+HdQfwfKNbKT/Qi0NK95rnel1rfFHtCmkLUi2vUHyeo5/ZYLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=DKuUmzaj
Subject: [Buildroot] [PATCH 1/4] utils/check-package: cleanup line reading
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cleanup the implementation for reading lines by having files processed
in context managers and utilizing the iterable file object for line
reading (instead of needing to call `readlines()`).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/check-package | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 83b9750f5a9c181dc96dcba508682776a600aac5..db3a00b524bc2c2aa663d3621c94fb11a6db7cb3 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -229,16 +229,18 @@ def check_file_using_lib(fname):
         nwarnings += warn
 
     lastline = ""
-    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
-        nlines += 1
-        for name, cf in objects:
-            if cf.disable.search(lastline):
-                continue
-            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
-            if fail > 0:
-                failed.add(name)
-            nwarnings += warn
-        lastline = text
+    with open(fname, "r", errors="surrogateescape") as f:
+        for lineno, text in enumerate(f):
+            nlines += 1
+            for name, cf in objects:
+                if cf.disable.search(lastline):
+                    continue
+                line_sts = cf.check_line(fstate, lineno + 1, text)
+                warn, fail = print_warnings(line_sts, name in xfail)
+                if fail > 0:
+                    failed.add(name)
+                nwarnings += warn
+            lastline = text
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
