Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0727FC5DF97
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 15:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFAE480C23;
	Sun, 23 Aug 2026 15:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QYFDtSt_tkk; Sun, 23 Aug 2026 15:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787498531;
	bh=yhjKByP/n/iHMvOZoc3A8p/vLJ8cfzJ+rbIPnwy0KvY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEkZQG+DHxeN9xf4OQ5XTdkqgEmWBGdrK1TEJbd2ar/v+QHDd4lLRwK8bbZb8TQFd
	 pp9+av+zQOstWzUzFuVBbyo5RA+vy/sToXrY/Vc7ByLtyw38mvtDsbVfKvK7LoBV3G
	 vbc2R13R1p2P5HDDYkekssQjO2AhwhjWk7NX9NNh4TcZSzbrh/4JfCTinYaMb1RYAM
	 bGdK1ASm+RVcfrebhmOp3jq04FsCVPzOLwoasbe0TC25xMkuR/DZI1g5P40PDcAsSY
	 jYIAAXWCq20EyE1fF+vGyvDWvrz4WebHngDTUnAbPNT5P54w2isiFYI6rRqITsXxUH
	 tE7YsnE0+aCew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F1A80BF5;
	Sun, 23 Aug 2026 15:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89EA23DA
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BED940057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZElQ18A3pnt for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 15:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=tnlYGc1v
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 609CA40058
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxFl7ahYdMKEPju5FUFwAq60ZJGEVPMKtQ7zfR9ZgUvAM2Vyzt0T8UN9FNHMDl8EU94qYJRGPw1Nm4p/gSAFIOs/foXZ/PEaJMc+LrekE6UTCUlM5mPzX42r7AA/lGLEJlMnIZltxSrGu1LhW8TJ8vhViuuH6Y3VKVBxMcnMVsxcsJNNmIMUjUdM1smqEdMxBdYXfj439Zf1vXPk8RMs2zRqHeIRKSHqCAu1oJtBFalTrlTHjxFKZZmyOke/uQTkXXXHsO2IhT1tTdFXxTcGdpdw1jHGItP7XgTqSKNeT8vdlA9/7cDUmXXdMP6bc8tMLIWlaEWGOQphWFFmKz2F5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3/bdJrNoMy0Ben1yS6rlJHgSLAN2+Sq+e7rJPGskwc=;
 b=CrsC1w+6Lsy0TSGR2B47L+uU4WOut9bSNEPCESsYQuVmGbkH/e+MmuJpt7qbJ1clB5oy672yeE1tA86Ax4XZfz2GbjYE1PTkV4xSR/2HvqLfRItMjyxfI7ds4dUAT9VtfS9hJW+l4lwwfhjR6zuC+vUi+uIsNjxkVfv2nMauKoxtU1nHmKCBV7n34vcy7vDGr5pJDcb6Tc3RQiJiCXP36i4LKPEnR9xu4wt6nPfBR8sIWeitE+3ffN79afW/VOep5Z2NF+Hbr++FvQPItH2fndvxKAy0dCjsYcO1jp+nG7I8+w3PbwLIBhxrjpmQZ78mweIoEagZQ3F2Z5WyCJmeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3/bdJrNoMy0Ben1yS6rlJHgSLAN2+Sq+e7rJPGskwc=;
 b=tnlYGc1vSoRQ54IM910sfp2VgDr9paMlixO2h02gPMU0GIlPPWb1FxhHVI4Bt2MO4QRcNDAuMbAjB6wLJx9mRGBoIDBAjrwX261rD3sjM9i6s9WYE3FrlUTCeJb2wz+Mu9KDVRqrqYDEVxuvaRj5jxHGAdG2t/6+Fdy9cCa4a5suB7um4zgn+P+u/umfjeW8+IOsth00v0L/6FdC6vrkbmWBc1ryNnqEmVNKrCgVIQvN+yKsCZRumZ6em+v2evpR9+6m9ZdIaMHaWi5xuzO84NYf8ayO2+nt7G1BberWhb8pN8IaDHYjqC1riXCWskCSDf1MMLvSUWq+UU1DVhsDuw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY1P300MB960598.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:359::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 15:22:01 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 15:22:01 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 23 Aug 2026 23:21:35 +0800
Message-ID: <SY8P300MB0041166E9B5D56A3796BD3D6F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SY8P300MB004155B06C42E80A3B391B70F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB004155B06C42E80A3B391B70F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: TP0P295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::13) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260823152135.2322402-1-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY1P300MB960598:EE_
X-MS-Office365-Filtering-Correlation-Id: c455cd2a-8b98-48e4-d1c0-08df012a47b0
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|51005399006|15080799012|10092599007|12121999013|24021099003|23021999003|41001999006|25010399006|5072599009|40105399003|2607281247196008|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nGKt++stFWGNwMWf7DwwjC/XQCb3X2FqfOt2/sc7g31NuG3zFhi33UE6cUQf?=
 =?us-ascii?Q?iDk2cUvgdUSYJ12uHuIYUEm6VZN0WqIEoNWf8Ma5Um+6/bO5QwSVsxlYrylP?=
 =?us-ascii?Q?/L1X+ZbCNcR/4A8d7d45tboeMaIPubhdf90n7jfNB74rYxKUKEeSRhwB0mDZ?=
 =?us-ascii?Q?5tATXwbpU/eqhcz7gDnqcKVYqaGzhlaURGdptkptXRlUq3l2Ceh0dj+i4xQy?=
 =?us-ascii?Q?Z9O8eeOOjQWkQT9ZNNkUAU4D861zaiG+uv8bf2f0tlawCmw8fS0bDajA1oH2?=
 =?us-ascii?Q?tNW+Ak4Ql2+5y04QIw4ZNJNnrTpowCvUuyyjZepF+37jjCjaWYuzA59O7Frf?=
 =?us-ascii?Q?FurMTobpvKl4JQsi3Y7uLljhfu8iGj2JcDYdwJpVXLXSuJND4FglXZPzrt3x?=
 =?us-ascii?Q?tjVA6QZBnz1cCbK5neLcUCc1C56XOLWsoecsAR/z2Ryd5dqVknUB1Yy9jRd8?=
 =?us-ascii?Q?S9NM95iTbK5sh4G68x6ktYKcz6gHmmKcj2ZTMamkO0q11TFdaOL/uv2psz9m?=
 =?us-ascii?Q?x6HgVXXCJAREnRgvMzZnzuVTyJ7hYxK0LzXL0iMHfPg3wDFtz4svnYJ9cXt8?=
 =?us-ascii?Q?Pa/CTMJ6NGiIFaG2qOY/lZC5IBIyCa4i89b5DaKqptF0P6LS0KSqEzzPPXOT?=
 =?us-ascii?Q?BEncZLDCZ5I4wdyuX2Y+bSyzM95olS/HsLQG0vEiK+jz73Fr8gcyEbqne87l?=
 =?us-ascii?Q?WkZidAfXD59mPs0fdf5b3UsI8zQorZYHS6mU4lDAofxbmxC5j8o8J/YJk1XC?=
 =?us-ascii?Q?EkchKGSi88IXWy/RmIUzGLYBwsvMrx8oUOYv5avxuTdgJBs7TE7SrdCUjvTQ?=
 =?us-ascii?Q?lTvz/J4hi2XZDmqdZW/gcBe9pKJBEnHB2WRW8Xma5sn/+98P7YxQBGLwNGbv?=
 =?us-ascii?Q?S21zsUPMhRtE5rBklW1IgHINOsFJhpAQ8TfrybCU0XimKZOTrVeG1xHjQFqz?=
 =?us-ascii?Q?HxMDDVWq1w3l984RyfgmjyZ/963SU6DAI0MiuNtTjlTCCEWuyq0uwD0/A1Wv?=
 =?us-ascii?Q?3TOImx7PlLH1QMPzRAlf8wmkO6Qp4Rcs+tKFyq2JWrNsWReV6WSQ+KrX07ml?=
 =?us-ascii?Q?Wqpr9Yk2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6jv31aIRHT67+q5+0IW7P1Un0jivOFSJ8rSND7cd3u25BshT5cWHLinET1T?=
 =?us-ascii?Q?CuH+x/6iI/SGsYPz1BNvmX2VY4ntW1+1nHC8ix6/b6W6QHGzhoTv/fyed5PH?=
 =?us-ascii?Q?l5hjmiAl2v7jQqJm9SQDr9SIrJas9gMLpoBK9n1Pf9+3i6zt4MsVf0Lf/pfr?=
 =?us-ascii?Q?IGt1UhobeXG3sRKFYdvQe8pPkf/ApQjjZsuM63pWionDC4FaWTJgczBsQu3N?=
 =?us-ascii?Q?C3H7Ig8gPo2eoX7MoSVFnVdk46eieO/cFV32EWxajqyv56W7D5iwDSyqPFFu?=
 =?us-ascii?Q?40bgCrcNEACEE8hkq35CVI4W7IACbRUrGNXH4stgte85l8I2cswpkfQ5Z6JQ?=
 =?us-ascii?Q?kjIFaseHJ9vH/6x+YfacdokimGG3EGUoQ+n2Kc8dk5EAaiWoglaMRhaqHmQF?=
 =?us-ascii?Q?crsNGNC9cCLh5J5oRWFZaKKKpaw9nFiGKWCTjHZSpuFvsp8iaujm09lv0MST?=
 =?us-ascii?Q?3B+osJy5XiDf7cUExi22XF0/Sp1khyOBs4EpPH46HP+WTx6/c4kisg7IU1Sv?=
 =?us-ascii?Q?uWBGJR+CHAFbn3f8CyMhjO5TECobE0f94bQ9e7VrgexSDqBMtEMho2mNT0gJ?=
 =?us-ascii?Q?VmLzM5BWo7ohXuiaiYW39Vl/X+g+rkLSAF3VHwb+C3GYowFfaeFDLUgHPkoE?=
 =?us-ascii?Q?UFEFKDQsf8LH//R/G946/+dDymvM7Nlj12tfgrLmGoYrGB3625RoXNEfAdb4?=
 =?us-ascii?Q?vor5ym7ABENrcnI03e3B9yeKGomfWOYLTBPwNpQLP7lNtRz488oDzTsQrcEs?=
 =?us-ascii?Q?qN6uQcDEq9gYhoBj9/mwztqpw7MKKuNTrUMVp6J0rN+QFWmfvPcuD5ywx4D1?=
 =?us-ascii?Q?KBybm+LdPu6WqasQ1nYxB2D7EhG1u6yX/rQTNiMB5G9RuAUf8k5Gpoyt35YV?=
 =?us-ascii?Q?ZHjMRU6SzXyR6TUQ4BQPrFCrJ6mNI/ano0xNkXSWwQOyTTUihUBeVKc0DN/H?=
 =?us-ascii?Q?kWKdThYCHigxomGsQT2sD9Q97TQhNAmSrQT1Z+S9GsrtkfbqoL3ZM5Jg7ntb?=
 =?us-ascii?Q?EMLh7U+xQPGtz7fVtvtx8xm2r/0+oM9e0vdVKQ7QdIBnog3NMVjTO9JV0AcY?=
 =?us-ascii?Q?4IrK+xfQk5LDGUhsNlWtiXMFP/H8dP/Q8oUtTnQYnA12zfAOkuOO8yNm2g8m?=
 =?us-ascii?Q?0fFUb+aET3KcPa/y9yLOUCkSrM24V97W+5Umbazo/4OwqQO290L2dBeCee9o?=
 =?us-ascii?Q?0WhGIywi1frvwI0ZoVyAV4AcDwgSUe5c9v3gNqBT97VDKDVttP9iZf8fcCfh?=
 =?us-ascii?Q?9LmHFT0UuNMnafVuow9+knwKM10C+SHyu+FsSoJMy3hFvrWcoOv+XHxUdXLD?=
 =?us-ascii?Q?QEhQnC1/qOQ76Lr2763jaQwbGsPRc+iHlhGdjGMtGBLgO61+yMpVVssgTe/J?=
 =?us-ascii?Q?XG5c6Wuo5Pn1ay7jEsuWmCpO+mg9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c455cd2a-8b98-48e4-d1c0-08df012a47b0
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 15:22:01.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY1P300MB960598
Subject: [Buildroot] [RFC PATCH 1/1] support/testing: add FLAT stack size
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Add a new test case to verify that the $(PKG)_FLAT_STACKSIZE variable
works as expected.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 DEVELOPERS                                    |  3 +++
 .../br2-external/flat-stacksize/Config.in     |  1 +
 .../br2-external/flat-stacksize/external.desc |  1 +
 .../br2-external/flat-stacksize/external.mk   |  1 +
 .../package/flat-stacksize-test/Config.in     |  7 +++++
 .../package/flat-stacksize-test/Makefile      | 15 +++++++++++
 .../flat-stacksize-test.mk                    | 22 +++++++++++++++
 .../package/flat-stacksize-test/main.c        |  3 +++
 .../testing/tests/core/test_flat_stacksize.py | 27 +++++++++++++++++++
 9 files changed, 80 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/Config.in
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/external.desc
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/external.mk
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
 create mode 100644 support/testing/tests/core/test_flat_stacksize.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f4e296abc2..1080fbebec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1123,6 +1123,9 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Fengwei Tan <tfx2001@outlook.com>
+F:	support/testing/tests/core/test_flat_stacksize.py
+
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
new file mode 100644
index 0000000000..cdb4e9f057
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.desc b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
new file mode 100644
index 0000000000..f9c1a745e0
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
@@ -0,0 +1 @@
+name: FLAT_STACKSIZE
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.mk b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
new file mode 100644
index 0000000000..82900bf036
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
new file mode 100644
index 0000000000..67cf9964f5
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLAT_STACKSIZE_TEST
+	bool "flat-stacksize-test"
+	depends on BR2_BINFMT_FLAT && !BR2_USE_MMU
+	help
+	  Package for testing the $(PKG)_FLAT_STACKSIZE variable, which
+	  defines the stack size of an application built into the
+	  FLAT binary format.
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
new file mode 100644
index 0000000000..dc7681bf56
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
@@ -0,0 +1,15 @@
+O ?= $(CURDIR)
+
+CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+TARGET := $(CANONICAL_O)/flat_stacksize_test
+
+all: $(TARGET)
+
+$(TARGET): main.c
+	$(CC) $(CFLAGS) -o $@ main.c
+
+clean:
+	rm -f $(TARGET)
+
+.PHONY: all clean
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
new file mode 100644
index 0000000000..64695ad2dc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# flat-stacksize-test
+#
+################################################################################
+
+# Define a stack size that is different from the default FLAT
+# stack size (4096 bytes).
+FLAT_STACKSIZE_TEST_FLAT_STACKSIZE = 8192
+
+define FLAT_STACKSIZE_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(FLAT_STACKSIZE_TEST_PKGDIR) O=$(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define FLAT_STACKSIZE_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/flat_stacksize_test \
+		$(TARGET_DIR)/usr/bin/flat_stacksize_test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
new file mode 100644
index 0000000000..9b6bdc2ec2
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
@@ -0,0 +1,3 @@
+int main(void) {
+    return 0;
+}
diff --git a/support/testing/tests/core/test_flat_stacksize.py b/support/testing/tests/core/test_flat_stacksize.py
new file mode 100644
index 0000000000..ab41fadbc8
--- /dev/null
+++ b/support/testing/tests/core/test_flat_stacksize.py
@@ -0,0 +1,27 @@
+import os
+
+import infra.basetest
+
+
+class TestFlatStackSize(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/core/br2-external/flat-stacksize")]
+    config = """
+        BR2_arm=y
+        BR2_cortex_m4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLAT_STACKSIZE_TEST=y
+        """
+
+    def test_run(self):
+        binary = os.path.join(
+            self.builddir, "target", "usr", "bin", "flat_stacksize_test"
+        )
+        self.assertTrue(os.path.exists(binary))
+
+        # Check the FLAT binary header really carries the stack size
+        # declared by the package (8192 = 0x2000).
+        out = infra.run_cmd_on_host(self.builddir, ["arm-linux-flthdr", binary])
+        self.assertIn("Stack Size:   0x2000\n", out)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
