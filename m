Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBBEC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E52F660FB9;
	Sat, 29 Apr 2023 18:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E52F660FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTlJSCzpeJev; Sat, 29 Apr 2023 18:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ABF360F81;
	Sat, 29 Apr 2023 18:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ABF360F81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2B601BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55AE41725
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A55AE41725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVuXQvBVY7jK for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782154160B
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn20803.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::803])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 782154160B
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOdyAsp2lJio7GHsP41MdfsrJOe6c71FTCBePdqhwP+rnhxCpAwtsq8PUUtysj9jpwvhxGU2yD99hISCgAtDfqF1XjflcKTjLNiJcWTzUGi1BmsezU7aoUxm/45Oqo7LnpAfeH5/czGBQzIBbHjQZnAyJZrzq74gz0ZDx7cCfaM//FrhlXMP5lNepILknO1aSN7nnZrHYKFdPC9zNFSI+c4htVCsWsQHE+jl6uyNh+AXJ8dlGJBrI+h00YSAv7oXKHB220/yjjGiv9vz4nVIHASM+enX1hyR8oR8CdSmhioRAEtgk95/g5tAqUXWnrENEc5+Of1hneZajxhKWHuBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53jFsuLSdbj/g2n7pZ5WSboZjL/NZOMzEofzTGOxZ6c=;
 b=MwoHzO93TblVnr3emc1dBUK+fwVdihmqSxO6HGqc2amPOiWDbMJ99HH/ITS3VmV5eLRURcft44PXNCOwEL0KWOtYfJ+SHu1d5fd/W5N7CAmX5IROAp0srFRIjatm6ew7P4pMlykNW5Y8abPHjVhRdJYT5l2Z4YkUHhtIOEJXfp3X3RSqjgjU9KSqCdq6r5u7yeaY/jXDNpsPbn1cMLnX0gDMdZWuSRLbDhPwV6OSvAc7fIopcfqPUx0bmXdoltRtUNDAxAF+eg8lFEOhkFZVzAa6m6WSqqNONu0akRYbuNZj92U6AFhh6hDsP3SB3mKuqXQ/ZNXZoTQjD6zmgQkK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CYYP221MB1094.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Sat, 29 Apr
 2023 18:12:55 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:12:55 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:12:04 -0400
Message-ID: <SN4P221MB06823B0F7326D27ECD5E0FAEA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230429181205.3620-1-james.d.knight@live.com>
References: <20230429181205.3620-1-james.d.knight@live.com>
X-TMN: [7aBplJ/aksINICPT/UttbTBAait+49BY]
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429181205.3620-4-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CYYP221MB1094:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fccc15-9d13-44f1-3237-08db48dd5a84
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9XmreLwtPaBeZFZid+sA2W5Gk8a95E3M5+FOpc4HOZJ9zH01v6BObNsqgYlbnljfMZ24jeLi6h5mUVs0k1olQMwJRCgosmcR3sQC1AqMEAmvQane+5zsmsr7/gZ+WyMl1XRwMVD1cYGI2pA6lK6HElqrorMo1mujFiUwE08dshoMECZ/KBzvms/roGcLOmi1k6UiDlZGLKJgKrqVwXgf3ykSp2HwUilrQZJ81NkTo13d5p8L3kmg85IV5qAMD5O/SD2exgNm8fSGD44nqBQ12xOgfSCXV+aplHTrCG2oW+ikR7dKEBp1eFfnuyxm97++t1TyrSpyB0ZVCtfk7LMqpeNUTsiBy3Ze2+0rGeYSWaShfpM2tBpwklcdYPuxlmmnuUpbW1K6sLjb/FSnefkd0Vm3+TP1g5E03JaIHeyraKA3Fl2z5f1IDHf4ryy6n6wDsxiYYuNNIdyc6iUTV9sp0OLWB2KW96U9m/xJNHwozAUhP2TZRPMeUgyoChB6zO/gGvdvZGTZexU7cE7O7K+PQOowBHNIKMAN9n/SrDCl72PJBtmDiDFqWMw6dGjCANeehUItVyka6lv7r/5URwTCDu8AlbSObzz8kpu3K7N5DrX2gmj17Uamshj1NVEaRR2+OO06CWZX9woyR3sID4L5QSUiUVSLHoRhpu/U4TlE3swhsM/DNbmp2MyezHaPHEaGUgY7naOsBnYFSC+6vAEFTSJrupx/3tFkdmql43NTI6aD/+YBfH3UTME7WydX/n41Gx6g=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gy2uo19U8I7zHtnpU2MVJZv6u/x4YhVMq+2J9VZ6qdvD8NZQgn/8nkfFm1XoTT1TKlI4jhz5M2EarGx3tFa9nlz6qC+hqGZc9NVa60T/b+eoU9Lr24kUjKbA6omEv5DRfgOjfvn4TZKD8ub1exFT1sxOD1bbCYABtMhzHRbVZHipOtEqMpZ2iqp0LLDZZfFTK8hZQ5F1A9lo/lhEPESGWWhXwVFZCPSTQQCFST0gJzZLGaTH+cOZGLeTp3i6j1hpoml+Ow3ONepHkyoGwSGqw4org0nQeL+aqgPuGpN7sXUEK3y4XDHG7Z/2YkyWx/JVhJlc0mRyo3gxgXb7gQnY/1LGRxJFaK6sEhvz6r6RxENByAhECRBZle0wontqqbWOLGlLkcOxVIAZsWKPsf2yd/A9zTz0W2UBpcuV10BXxHD+bfPoRzaqs+wfKwsYamzruzuv/qB++9WjeqPxIRcJTQlI47uBUFe6UepVBGxabYZCeMxTGDEY7N1P1rEuRYF5DjsiDLPK3pBo9SZPJfdrV5zNjYAKXFI0zMQTBdKyc2shzINu4T523bLOoGS6vlCHwpN6zxnn0T7dLPPMOp+k2eV28ejEEfEyrWfyDFV9QGI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9EF36PCps+lqg3JORBRF0fE6C5DN1FwCUWgxkBtgToRNSZdkVzS3Y13+pRo?=
 =?us-ascii?Q?RjlCgWEPx80pDa8Ek/us3WwQ6Sj2SiLY8kw9VsJRrmWFDb9V1STc2QHwqImw?=
 =?us-ascii?Q?oCIP6M1kiyT3UEYFKC9nhWXpHS28DWS1nbEjz8hd6/v4zf9cL4OKYiPvCk2I?=
 =?us-ascii?Q?6PSocei0M7kYaqRLcPYd3cOIHRzq7WnAjYmMMLy16f2boKK4DutWAOwsnyQn?=
 =?us-ascii?Q?xy6AUY2hKaB26u4Mz4UbpWL3cilwUcbftqCDoai4s+QCCo1iTaKev+IZwZsu?=
 =?us-ascii?Q?bbvdjGiGMzYR1vy6EMhhoIViVTLw61jWqemjHpzZP9Fka2j6J4QKwboGZ3M0?=
 =?us-ascii?Q?4ATSuV0TMgcTgQzIqoEG+0Y9SDzuPmT5UbTsIoC5/fda5xdD2u0Js22iTNB0?=
 =?us-ascii?Q?zzXgcFrCxMETkpk+hbzAh/gMWQFqL9vNGZFbTFD5a+5SYiCn7atmowSlZaow?=
 =?us-ascii?Q?TIOPMMt3WvR2eHIIJQpmw+H00VcHemk43FSjoBQ3ovWs9NEB6z/ykDPs1b24?=
 =?us-ascii?Q?YwdAkPYKRKUT9HxmLRkSuVWjvRSMq+vD0CWfJGilUyXCUf6/H6jjL9ABzvsd?=
 =?us-ascii?Q?EuTJ9iLo+Ymx3+qFwGbtGRePotH6lEMEgZ8WKxuk0c+GAS+wbH79Bm9uVm69?=
 =?us-ascii?Q?A8n4aTTfYIRmtauZDVZaPu7aOivyygUObfLI5V+ChxyB92B6DXLEzohLtNcb?=
 =?us-ascii?Q?mQNLa6LeVjOWKJwZV6f9DIGve5M8ylz9EMNuO+EbjInTANHv5d6U9qh665CY?=
 =?us-ascii?Q?6qwKz4XrrLWFfPt9rKSwogK6Lp6mWk/piBCvcGwf9Ah96roIfhqxC4ehkrzj?=
 =?us-ascii?Q?YLVheOOrQ+QmTsjKsz9UxYQp6qsvha7LhqXKu/uhilUPxx64xZ6hPR1XoVUl?=
 =?us-ascii?Q?5Iq1VZ6nrzk8kw3aSybsDJvKIUpORaKlARtva3szkVKJ7rsHPNejHO6sX8hb?=
 =?us-ascii?Q?c2C3FLauXanBGW688LwwlCNPZLIpQRmuieAYESwkI4aGkQxbhG5AL1U1DW2b?=
 =?us-ascii?Q?nWZb2tft0NMmQV1YpVpCuUQtacv73fqlH+A4tfn4Ub9ZByuTapKEdiLOedrt?=
 =?us-ascii?Q?YHvsW80c7365i5nhvqAiBYnwAdviMIbM85t4la4cXOemRp1Gh9c3eYfYVQCk?=
 =?us-ascii?Q?GZS9Dj6ueGEOoMpBRu1ptyX7ZtIsSob9FVZOlAk8ZrizkfAOWcwcMDJ96WeD?=
 =?us-ascii?Q?jGonols73KxjonqzXH6EQP5yutjJ5NQqMqYhfVl9HD1R3rGtmsf1gOO4eyA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fccc15-9d13-44f1-3237-08db48dd5a84
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:12:55.1856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYP221MB1094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53jFsuLSdbj/g2n7pZ5WSboZjL/NZOMzEofzTGOxZ6c=;
 b=jkFEgqnPTlbGy2d6/d6TC3BiQbR2BGO+jZecAHkHMp5EWP7kXV1aVR9jW+OAMq77qS3o0+ywQ0yqOJoUy2xWjjYZjl2xrbP2w25Occ4suAMq6OeNt2ECjeJhyGGl8+yKSGPfLnvGQQoMNDmL0lEMuzV6hjkWfhDPwPCSBmfC62CAHWlvPquLnTC7IdWQiB9KWWwFsJ2+Obx5cnZandsdZ4e8NF25C0C1zV7JJAbN8Tseiz1D0wQ0q5VK0QqI0Xi8AdkZL9tq8G8R97lD1pZrXeQc1etozFIgtSoM8/o6WeJnPpoMqIFQDRW4+NyocS2kbjhdZWROZ7cOj15aLfCSTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=jkFEgqnP
Subject: [Buildroot] [PATCH 3/4] utils/check-package: support ignore-indent
 flag for configurations
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

This commit provides the ability for configuration scripts to hint at
ignoring linter checks for expected indentations. By adding the line to
a configuration file:

    # noqa: ignore-indent

Calls to check-package will ignore any custom indentation the
configuration script may have. This can be useful for "container"
configurations which include packages or other sub-packages, without
having to add explicit bypasses into the checkpackagelib library.

This avoids maintaining special file lists inside `lib_config.py`, as
well as allows br2-external tree to easily utilize the linter script
without having to worry about indentation on container-like
configuration definitions.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/checkpackagelib/lib_config.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 6e65eed66b490c6d477de67ff7589e9f05da4e28..52539d97ab60664d0466b42e28b3aac5577db5fb 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -224,6 +224,8 @@ class Indent(_CheckFunction):
                         text]
         elif entry in entries_that_should_not_be_indented:
             if not text.startswith(entry):
+                if state and 'ignore-indent' in state.noqa_flags:
+                    return
                 # four Config.in files have a special but legitimate indentation rule
                 if self.filename in ["package/Config.in",
                                      "package/Config.in.host",
@@ -271,3 +273,19 @@ class RedefinedConfig(_CheckFunction):
                     .format(self.filename, lineno, config, previous_line),
                     text]
         self.configs[key] = lineno
+
+
+class State:
+    def __init__(self):
+        self.noqa_flags = set()
+
+    def process(self, line):
+        if not _empty_or_comment(line):
+            return
+
+        # if `noqa:` token is detected, consider trailing options as noqa
+        # tokens assigned on the file
+        if "noqa:" in line:
+            flags = line.partition("noqa:")[2].lower().split()
+            if flags:
+                self.noqa_flags.update(flags)
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
