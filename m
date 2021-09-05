Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40ECC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 01:36:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075A160698
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 01:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 075A160698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B38C80F6B;
	Sun,  5 Sep 2021 01:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UM9kLTqswsYb; Sun,  5 Sep 2021 01:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D085E80F64;
	Sun,  5 Sep 2021 01:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E61691BF5B3
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 01:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5A1360708
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 01:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wj20lBh1dymb for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 01:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn2064.outbound.protection.outlook.com [40.92.45.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8D06606EE
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 01:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+kWO+YxRNzgCHnbp+yOzrzAPnRElSN62dLcMtXeJ08lAdIMoz3o7Yd4Cg1PURYbRKF6LaOlTKokeJ5rutor2MX25OJ6KCPqOmXALxyeMYS/wpV6dhKSpXbKLyaGraDosVBCP6y7w2pRyw34fdTGIQ7LCtLJ04J0CPwhZdHjSiiPWHnqX34Tcsx4UleEjUgZ7aV9/d/azTml9mO0TM/OuZO8BdEk8mSp4VkMdyVTx3AKhI/cQHc0sMBUS1HM9+JZGv77FQvO//2W3nPINldVtuN1jL+wFjM4L01m0oRB1KAVUQY3atn6+jQ9RVAKeBvYInjNIMc4m1tsiryZfu57sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=doNQYEmT2aWVxXfZSTCVmZ1YZ3fufCHHspVhgoW/mGw=;
 b=Bd9/6MMxWYngIVQQu1Jurz1Kidx/0sCdJltfXOlH0D9uRWG7EnXFY5aC947gdIlx+u3ksXLf+RwYT7wfwXwVbBPEcfB2UXyRkAaYhYBN7F5uLzuEbzjItTQbjoh2gGo4XcjZyynTNyspWnZl7XX+w/1Dx60HGdYE2TZ8VqLH8blz8kzMDaZdfABraqYwuclRHbBHx9gRKkail5Nx8yGWhpsQa7ym6UCydo9HFeDVI63rkneb6eyRWYSEgMjFYSxkVivPSE1kVIwWY0bnajd/i/TyMqrW9dws/MEiTmQ6NVrPiRMynksWnDyQ31CL0GkoYhUGlED8ZRQjmX/eSQZxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doNQYEmT2aWVxXfZSTCVmZ1YZ3fufCHHspVhgoW/mGw=;
 b=Kx+UMHzr0zor8ex13P0+pfP+6eg+gn90ws+yHhUBR7Bm+ZcTSiZVk5JjCzeWkm9QrcOJxFZ5IlQP+NcUyM5DpH5LSsBI35MaKZ/DnlNzF/EkEnL+k9Icd+/LRa7d8iiyKa886FunAMDsO0jGpY2JQ/VP/jnfP7DMT9EtdlU2qD4cxYDFQfvDDvIGDH325lw66JsI54VMIlkeVOwT6p25LFP2bDCww8oXX8MtVHYUD+HlTqsld963JJJWH04ZPbzjfKsFbbt4/IJtuy/bCPiUidH+plom+hzuXFkpuMfhRruFWwJnLSeXv74GRwCSYzqUVCADZNnjZufEeXV3zrBTlA==
Received: from DM6PR08MB3993.namprd08.prod.outlook.com (2603:10b6:5:85::28) by
 DM6PR08MB5417.namprd08.prod.outlook.com (2603:10b6:5:fc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Sun, 5 Sep 2021 01:36:09 +0000
Received: from DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013]) by DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013%5]) with mapi id 15.20.4478.019; Sun, 5 Sep 2021
 01:36:08 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 21:35:19 -0400
Message-ID: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
X-TMN: [HaBwpskRtYhkCmlK5OaFsw8paljdfzhvWdD1FiUz8WNEQlryqv/quvUj8VescQt+Riwj41H51a0=]
X-ClientProxiedBy: MN2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:d4::43) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210905013520.15960-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:5cf8:7779:fa4b:9c0d)
 by MN2PR04CA0030.namprd04.prod.outlook.com (2603:10b6:208:d4::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25 via Frontend
 Transport; Sun, 5 Sep 2021 01:36:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29c13c94-f8d6-41d2-3413-08d9700d88f9
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNVetrSOn5BNfyVtQLPp+4uOtq1X6X3IYxCf2EZqWbouB5emKSe8WxxJza4QiI9Z+Au85V9FexWHh73Y2mthw8+zGPjyG/FsIXxCY3Ma2borVIRggZuMZ7bhGdMWbZMXBx+0qqtZcgptBnoov33oj2F4eC5lZjdfpCgStoPlRQNgsNYgiXFgkM8MmattnnZT+fXvL0HrhVO7oHTeOQxugvmKRhibI5QLFjBcMMvtdLcO+4DhmTqgqviK5ez15X1/B5UjJPM631UzivOzZ2tDuE5uhh3nRQk5fe1FI8CwpxUy2xqJ7s6C3J4WLivvKL0tN2cv23n7dwkCvuKoqde+S/odelKGV+j7ekT5AvHAw/LNmOKgQSQ3sGt7FeHzz3bxOhdkJ6NNQJHL+uEpdg4rgDUXjAclExJI3wFmoP1xANAuAL02rl/jL8eL+oCAfdRT7oiP4QHSp7bMvkpiYg7xcTWpauYvssf8VpLb++6Emxc71sZClnudh9+SJ9GoiORUOzSgQYaLGMS2CyNU8csf+WVlUUfLzFP+D2kCE3X5XwOX+EbF5pnCIN3BO3BXT94NyoB3CoPjCyhO/5m3CdnnLaKhgi6cORievlm+sqToP+36MpubpBrYhy5Y7BBIwNntux8SqiiIN5KdBe5QedlVig7ICNViVo5pbXzODCSByczFZHZkYMU8n60R7wsR7Tn/Us/F+y8oCSpl0ww2vawjsU73t2K7ILGUjKM=
X-MS-TrafficTypeDiagnostic: DM6PR08MB5417:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 133SV3u4r0tCIpBizWLu72bKhPOIdqfRtPSy8RW72jA/mXWbL1W8omFRsdZt4qotduNBx2od6LoPMTEdDEa8RyaZGDmWgEtsvKp5V8N3wYNwmer6O/4h6S0FLIDshaHHCPDvXbAMrApTgU3QuoY/sJ5WB7e5ClckaJpX+sutq4WdqhlbxbT1EazzUIjNBq4sqpHRSwzZdSJJwUbNOsl4Njn2ryiNhHTW+fcY6lcw2hCqT8LXm7c2utUW9S2zQdGQavVdAv54u5lW13FRV9TaYRttGy8A/tSHxCY5PgigHUjkMGMvo98+v7qeFI8Pk4ENHTmvGbc/XvOBVBDKCBFzglNrJiaNBOUabvz/yBodmS1Ncij101Je91vAeqjescmUb0fGDunY0aMCwK1BtqNj3hlCMWnj7It6L2jXQTNk1z+hQdTzJcpqOhuaTcXMVXob
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IjwUGf7SOwakJLjKr+r/7yBw6ajyjMonx9zmCPh4pWjiSyN2JJAMargzP1vntpEcPt3g96tv92hvDU1en2bav2HPF8xsvjtywR4FEEthn8uaU9dzR5qMO0yd7Sb3rtIoUKMPPOAczG9vufs5bS68toIttwsEdjRLAoTszKEe+jhhDNVbCopNg47vPIVxILCPIhSxJtWqPFIx//o8rXhPaw==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c13c94-f8d6-41d2-3413-08d9700d88f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2021 01:36:08.9561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5417
Subject: [Buildroot] [PATCH v2 1/1] utils/getdeveloperlib.py: explicitly set
 devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Explicitly indicate the file encoding to UTF-8 for the DEVELOPERS
document. This prevents Unicode decoding errors when printing E-Mail
entries with Unicode characters on systems using an alternative default
encoding (e.g. 'CP1252').

This corrects the following observed error:

    $ ./utils/get-developers outgoing/*
    Traceback (most recent call last):
      File "utils\get-developers", line 105, in <module>
        __main__()
      File "utils\get-developers", line 47, in __main__
        devs = getdeveloperlib.parse_developers()
      File "...\buildroot\utils\getdeveloperlib.py", line 239, in parse_developers
        for line in f:
      File "...\Python<ver>\lib\encodings\cp1252.py", line 23, in decode
        return codecs.charmap_decode(input,self.errors,decoding_table)[0]
    UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 6659: character maps to <undefined>

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/getdeveloperlib.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b205817033d1d488c13e88f3b1bdbf82aa6b1224..08abcfed545034cb68ce708bd9aef772484238cb 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,4 +1,5 @@
 from __future__ import print_function
+from io import open
 import os
 import re
 import glob
@@ -231,7 +232,8 @@ def parse_developers():
     linen = 0
     global unittests
     unittests = list_unittests()
-    with open(os.path.join(brpath, "DEVELOPERS"), "r") as f:
+    developers_fname = os.path.join(brpath, 'DEVELOPERS')
+    with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
         for line in f:
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
