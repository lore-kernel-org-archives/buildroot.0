Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F05C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68844614E0;
	Thu,  8 Feb 2024 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Agf7U2EnfY-T; Thu,  8 Feb 2024 16:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FAB861680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FAB861680;
	Thu,  8 Feb 2024 16:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D2B1BF3E9
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 16:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0364D61680
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 16:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X05FRTm71cph for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 16:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2805::800;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0840D614E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0840D614E0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2805::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0840D614E0
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 16:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PztpR9VT8ouGpW4Ohq37drhsPz29D7+xgqIJqxIAGPL0pHcgR7w4GA1U1fYb1cLwMIZ87im3NVZX8rfVKXK96ESD4i9lBTeN0FRrzKFs2JM2GabB9Xew2ca5JkDxQrSAGD8cEnAi2X27i+Gq66E4xUuR2tHFd0jXRk3zYbg2tk9rUcRgCSPA3N0yJp31qj9tXkxDOA0rOzRHLGRSYv/gkWvclkN9b0+TgtdSpsWyrnWcvHZvozgHYsXFZcaDcbkcDBnkoF7kr2lwo2yID0AY0KT9gg/gTI/p7KEODAn/ixW9uywjx1tfJz2aNqCS1xNKtgte93BfH3q8gZYCD5UJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfhS4N4e1Ll8XgSyNMzliItvbMQqGwMX0wavJMCfwa8=;
 b=gouxmvXNCfxmwTiIh9scip21oVdhfK+kjK+UWqLMCS26TXvoUXJ81ngTItvoH4Kp02/8zlt9E6GNTunOjMULA0+0r4K7G0ZQ9+klNBFToOPs4rE02QSqu5XdE2nh7Wf1W0Ajcr578n2krKBgXGEho0tybsiK1WfoHsuPNJZJDi/5poI31Cj+QnTZpjygEysy3lc8fvIRp9UJRg1/P71BObkldvRG8Wi6B6JMNYJLonsd9xEHRMK9l/7/mUEQv4rLabCy8cZ5SXJeY4x/WBcC44YPaqjHEVcZeERCDrW5RGluHUcGT5EZu1Y258op3NKTG1ebv7PW0d1EgErT3dK0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by MW6P221MB1121.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:23c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 16:55:49 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::908a:c51e:8c17:1fef]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::908a:c51e:8c17:1fef%6]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 16:55:49 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:55:30 -0500
Message-ID: <CYYP221MB11409B6225528EC480F68A11A0442@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [youPdrqJK7wdkEtJfMtXlyniZM0VxF/w]
X-ClientProxiedBy: YQBPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::36) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240208165530.551-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|MW6P221MB1121:EE_
X-MS-Office365-Filtering-Correlation-Id: 98af6056-6eb3-49a6-340a-08dc28c6cd6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUYFySHHBY9bnEQEs96zZd0SL0ITF6B1H6p9B1ej1KxFo7tFng9HVk4KzB+I5cYZFHJ9rCTtcDdFo+p+JsDuzEs6KyQMpB0AlEg8yqPt8W6J5rd4cD7oGyk1I+sa/9hhBVZS9/jFR3720Zzf2oreKsxdCvqVQqnErHbkXGyvMkPxq81h++gwcoSgbIXAC+wzII94SQ/gt1uMN05oH23EScGifGh0hAOICvq0TJbHWrdN649q18BUjJZmKQnNMG4iQroy6D3n025NyyCn8XE704O3UUGXVaqRNcki/L8BeYIRTwxtIAWFo8RiwQgdevYra3edSYWXal2mHy13G0dkF58eax4pJMr43qDiAL9rgLzFRkbo3a3g5yKrLpsFQBaAMzKXhESQtW5b234VYGyyUFVqAS/wUUCy79XxirWacotDtawEC8JVF0swosY+XDfrHJCIaYbqK8H+FeqGNIUZdnmgLLFy09wETToXhnosxf7JVr/PyDwIs9iBKL0Wd7kP0XRf0+kY8XTTotRoeMnHiUJl9hVrb6BfODboROGZxMwBlgPHrDx5mAiwDaIEaxBAfY/kkdqJbXzO67ikevL2tAtbrOB2X6UjxqAbJWXcYHAmcmRMRjub2ZnCn6ztOstb
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnJL7bfz99Fjk5YOBSxFf6Tn76GeQuoQa+rHNBwY3kPlfC6rYGpOe4+jrkpw?=
 =?us-ascii?Q?1L6bR2WkMoXf345jnnUKruuYdfH39+v0dCyq1NP1FFDh4WBa3PBS1g+tZaF8?=
 =?us-ascii?Q?8N95DP7h8bLwmoWB2hkv0tj0VJOBc9gedLNuEfcnE1ugv3e975XBZpr6X4g0?=
 =?us-ascii?Q?zt+wb8Y59P2sWWOZ5GuqNmZ2T1Rkc+HdPBvrBMpGGCPo396TXSlpsXN7qBN1?=
 =?us-ascii?Q?h+T4KQxhB+G5euY4n7eu4RFyx28j4ElnNjrpAXHqlI/qRLmuShXOjHRnt+cr?=
 =?us-ascii?Q?sFynlS5NV4gDFOQfdhLHFpP+JP7khu4yp/Cx+H+OrKo+QdlzJPx8SzUdp54Z?=
 =?us-ascii?Q?fHgKHyefYa1B6iR+XsV3CEGzD7HfY1YKNE6gYJIxXx7gCS7wzhYF+S6EzPbp?=
 =?us-ascii?Q?ygy4o8QKtbqyznN+U4OAiX6Cj010KdaVgHLa9SwWJcwuesDtITPXpj4txSCk?=
 =?us-ascii?Q?rOzg9YBIs22gVypnrtaqETxCzt7F+4RAV3ZiF3emMvarS9xm/7oCs0qQ+TcK?=
 =?us-ascii?Q?qdBje+dEeS5eATgEEQ/qmLN617s36zE+4KhyGesMLB18FT0UWZw9PTmtVLBD?=
 =?us-ascii?Q?Ym8KJ7Ug6cf+VGvNTn2O+mUSsmIhmbpwlyU9FeOpBiyaKA3r/dnUD49UR6yU?=
 =?us-ascii?Q?KQ7Id6UL5uskxdmeTjGYz0ek2bWev4ebIVTtzkoCV789EXfLEvaG8WdFmyHc?=
 =?us-ascii?Q?uf6NiXqgXT7KXWc2lo3n26B1Xtmdq7mEbt3c34K1c3SCmN8nV9rQdv7f8fXT?=
 =?us-ascii?Q?sMYaAPiLLcHCkp5Izuxz75OmtPh7nyYKBKZ3ESJb08Zj3a2nT3bDQc+D0srY?=
 =?us-ascii?Q?WWzLtayGlWbnAneHdDYMd6CPd5pUjCLlDtWOxLbMpQS38Kloz3btTCCOXVb/?=
 =?us-ascii?Q?yEGEFrIa0FQsIcnTwhK4k4Er+NGvitJ83Vgrb5bM2usQmuUzOOnMfCmjXutD?=
 =?us-ascii?Q?NIYktX0O/nuhgQt1Gp+g4dFMu3pIJ367jbm7xulbEop8cLGroZSaGEisfrol?=
 =?us-ascii?Q?QLgAk2Eid5TkFEvdKES1iXWMgjyqh7xGK/mvMatblwt8UP2rbVDnTwZNnciD?=
 =?us-ascii?Q?r7mkwk+BfR7DyDlMT4F51aqqSm79YFG5Z4pLWHb2jx26Z9mlu4LnTlCXX5DG?=
 =?us-ascii?Q?cNM8U33AYb7rhgVML7xykiee9wQGfTKGqbEMJyO6+3F3/YOQQ0lvg1/uz/n+?=
 =?us-ascii?Q?pp+rtxNDn1lZWv39fMtNYKo9wAklf2/cYgLCf8FGHfqvOwnXEhRioTiJ84Q?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 98af6056-6eb3-49a6-340a-08dc28c6cd6b
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 16:55:49.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6P221MB1121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfhS4N4e1Ll8XgSyNMzliItvbMQqGwMX0wavJMCfwa8=;
 b=lGstcMYG8vSIYBH/nq3W2vOIkTJAKOx3D1bujBRaO6zveGaq8PmeeBncZM+18mpPZDcp0Xz7rkaYNc43C3HXdzpsYzcu2FT4gO1/IAYH56Ut8z5UJ0Xnh+IV60KbwUa+XwyeHX4eKD0nG97LJn4Y+wkNlZiXNQ3hhKPQBljJa7Xdwwd5RzR18/I6SeOhe1MG12hpCh75hAWri29TXY8NTfNu0LvXd31tT+UCkkSmQCYG50vvw83SyOWq+kcJWIcEcRNyxE+eK3rDkAqCluPWYGHr3KGLYlWmnypRIiu9t+/JNR1wuvuDUpLwmjUb4VJZao6uWZvvtdSEoj2Tn9stMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=lGstcMYG
Subject: [Buildroot] [PATCH 1/1] elfutils: drop lfs tweak
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the elfutils package was first introduced, it filtered out
LFS-related compiler flags due to issues with the package's
implementation. This package has since evolved over the years to support
LFS (e.g. using `AC_SYS_LARGEFILE` [1]).

Filtering out `-D_FILE_OFFSET_BITS=64` can lead to a configuration error
when `BR2_TIME_BITS_64` is enabled:

    checking whether gcc supports -Wl,-z,relro... yes
    checking for __thread support... no
    configure: error: __thread support required
    ...

With the configuration log providing the specific reason:

    configure:7175: .../output-1/host/bin/m68k-buildroot-linux-gnu-gcc -o conftest -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Ofast -g0 -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -shared -Wl,-z,defs -Wl,-z,relro   -latomic -Wl,--build-id conftest.c  >&5
    In file included from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                     from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                     from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
                     from conftest.c:13:
    .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    configure:7175: $? = 1
    ...

Fixes:
 - http://autobuild.buildroot.org/results/fbfe131673ed78999a07dbc879436e0ef6a8a1c0

[1]: https://sourceware.org/git/?p=elfutils.git;a=commit;h=3425454a10d307fae891fb667cf7969e945cde79

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/elfutils/elfutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index d43b545f2f81ec728573b5ac994e0b45a6813762..3531142fd2dafb01dedf583574ff3ad33524ba97 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -29,10 +29,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--without-zstd \
 	--disable-progs
 
-# elfutils gets confused when lfs mode is forced, so don't
-ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
-
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
