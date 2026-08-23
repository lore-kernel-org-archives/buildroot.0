Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E5C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32AA9606E3;
	Sun, 23 Aug 2026 15:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGzP3lLmtgnh; Sun, 23 Aug 2026 15:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787497988;
	bh=Ri+FIEA1/1Hhjsiq0VIlpfxD0GT8iExx/4jDeQ3Ny1Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dOqiQzOoBGO+qGKQc0lMgEy0joVUXBWmI2s5RgYm24knXmAd40L6GAP9vnVUzYzP+
	 rOvSNlcwaNYsFYBm7KKwHKSjCbLLfpY4MX9C8RxznBQ/QLKaa+/2O+NmMK+Uz9AXl1
	 2yC7tNE/vIt+Mg5FZUJspYDOtp+tdV0Voxn2u8gzSA31B1frFvNWGbSNomnBVqxMtx
	 vnLMo+jpWoOkB9+PUm58saDyCmwVgvfRJptK02ZXgh6mhUblFkAogqSm13u880DtRa
	 rCIufHmZu0FCwUqL+CL5HSqeOd8goYSCsuW1iUvfJkFT418TDxYY2FJ5+Scvv7DB+g
	 99/lhPhOlI3kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD936064C;
	Sun, 23 Aug 2026 15:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F07C2FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 316FC6066F
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7IOkPjMSF1g for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 15:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=oO7OERb6
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 364006064C
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqy3W+F8e4PlE9OarjNJHvvYDxN8T5SUlfjErwY8wv1YD9Q/Jc/aRPNUFKOxpJKfEZ2HzDKrZ5WW7dMgO2MNJxtf3vF8qMY6Oda++UN8wUg20RsqbTeM1Gl0txfpftHKQdQKuGT3SOL3hwj6PR7sh5zGvqch5eONCOC2JeDKZqQHO4DAJKmPRz2Sw/dpBolwp6LOp/QPTD9DIuuUY0VgzvMTeCViCWPu5UWrjiLLzrJPms9clR+exaWtg1ukL6kiaG4BymPKLWDAxvxXaP+7RZG+y8g6CyoT+t0IoCIovXJM2H3+FAI2kmTKdvDqwk2CkV/Imu4D0VsJkbFYUq6D5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcMpGJZlehyJ34P3xnXV5AoLy/7UovTXTUbl5UrmOXs=;
 b=nbYuAmsEdrTtxknIxW5zprbbCqXZp7/tCqt4GqbyxyDWFX4sHYyntSWEFKjK622n+uEBIlNws7TMrLPzLNYGFhpEjuNxlK7a+x3VWqwfmntdthgzgzL4W/N4n/qVJBxRnmtary2lAVb1eaCRtOge2PqeZXpx9N4PXrh/dwRu5DMZkQjTgU7gx0fVMPXHrc9B8BlyJc7H+dTuxePDEgMI2x8FKryme8HGE2pVtGgrNbQPXIFZYGkSoTrc7ga6DWTVz5pdVMod1XwDdE5wS8vXyO7ACvXQTweDarNpJbO8Q6sdN60F2nCd/9Q7gvb9Q5bLgwCN5xeQTzq5GsRAp2Oy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcMpGJZlehyJ34P3xnXV5AoLy/7UovTXTUbl5UrmOXs=;
 b=oO7OERb6/hVogqehB57aWInCFTRtIpl4v4Qls3Sl/3NafBBff4NaMAb5N3C0ZQ1mogePxSXMF0UQf2VJq+yECmgkbkkhUqH10bcVNUavPoenMUBUReMhQ3VQ//vo/oMcX2DYe8/2kHXd9NxWXaAZMJBlprEH4oHHPFpSA53SxSht+RwfhqzteQsyhgVikS/7nf8b1YjWxXRvZFS0B6+2krMKla6Kgen7wswdIDIcg7DxEkFsUFNSKeoicWfSiCGsm0oqjXg7X+OunIDpCMvZMG5AMr49HGfBOA73XUEFTUQwVeZWVJ3yh5NF4onfVnWwUAtVWGuOjoyYNBnANJ+asw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY1P300MB960598.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:359::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 15:12:57 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 15:12:57 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 23 Aug 2026 23:12:32 +0800
Message-ID: <SY8P300MB004155B06C42E80A3B391B70F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260823151233.2319565-1-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY1P300MB960598:EE_
X-MS-Office365-Filtering-Correlation-Id: 718135df-05a5-44a9-01ca-08df012902f0
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|5062599005|51005399006|15080799012|12121999013|24021099003|23021999003|41001999006|25010399006|5072599009|40105399003|1602099012|10035399007|2607281247196008|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WebHdRJBd8lepf484abyQ7OVl1kO2zZCdb38lm4n0VfwDB0nXyslXwamUzRj?=
 =?us-ascii?Q?S/UW8G+tlwqEXdlTAoG91QGtEFgebqmkkzV9BW3Y2H55Mu6fgEORn1WamEPy?=
 =?us-ascii?Q?hVSY1K6K961iKNqBDITk5kR7m2pkFJ3ptdg0wiWHHznPbdKfbUXQohG9HOZe?=
 =?us-ascii?Q?ST5xfaujUBj4LG3b6YUVytPDeyIc4OKReKe3Mm9RZfOe5wOg6HQE+uYdySTx?=
 =?us-ascii?Q?fzh4NLNQFMcKcsfm+R0N/nIYTy6hoI9MElSew5RhbGet0vB3pzRXpMyUGd+a?=
 =?us-ascii?Q?qEPUQ7Qm++H8btjzkTFv7YW6Vz0Q0DGktYjQ1c6XrbRdcMB7tIUVeP9dxlao?=
 =?us-ascii?Q?Cw1A0x9dXGHbWNXy8bvpNmxJ/d+4c5qqpdSxi9WeleP0GKQNAAAJby5zIOG1?=
 =?us-ascii?Q?/5mBAizRKXsNvu1d3X5dP45by/Cb5S+P512NndOtd4FhfGezmqm4QNBSI61X?=
 =?us-ascii?Q?0pi9mmWpHMxT2K3h68dojTE1Ep7ndRFvGzMnsTMsoWg/g9YxJt/6xyfQpTeC?=
 =?us-ascii?Q?hcDPo9DE0NPqDeNEDCYLkMrti/aLOPse0HTIoCWZWsfWnJaTzvfWNZJ1Hjqx?=
 =?us-ascii?Q?7LA9Hzo3RP/aYXjNZGrn8OooaTaihXJfsQMNUCueNRL4s+zRsuGe5j4LkRSZ?=
 =?us-ascii?Q?BkJk+UeonFAjzxoK6n3gU7eQG3/1SGR+l2O2YxGpJpNYmFgcdWHXdMGNIAnW?=
 =?us-ascii?Q?x3WKU+J7Dm2Ay1PPX+It6TZGg+2FOBtH2EXOwQzphptISUubbpr0LDleOTlz?=
 =?us-ascii?Q?XU+JATaPVtzPILvscaZlyWPmXqqmijXISgTYFI4dcWuKovvPSBu/h+ZxVE63?=
 =?us-ascii?Q?yfDv+Ym6yNPpR38/E+5mnaLjd1CBqmru9wWmoj0u+ujM+eCKaLPpHl5++9by?=
 =?us-ascii?Q?lGL3LibsZRwgYaFzCxXgmFymnXXUSDeDtBbLAvA2v1O+GUVgALfUEApAn9C5?=
 =?us-ascii?Q?11nx1/THmsPcYOz4gaWUs7I4+bqN0zm8NHafjdhsa5MEEn1hCaYfiTITBGLr?=
 =?us-ascii?Q?+vWsUpQys1mvwgSNAEqEjqQWL9jjQxGG9CYY0gghNG2zmjU2IycgxcJSsBkc?=
 =?us-ascii?Q?ioPtjJmT8AkVxvh1gPcYoN46+BZN68X/mvCKlkg6LNnTL1EnKa6m+EnWzmTb?=
 =?us-ascii?Q?HmkY5+Uxhe9BixJhmV63kFFIP6kYc0v03g=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KEu4zop77K/ExKtzIYkn06O16mQhTs6aJ69LC/Ybl6H5yH3a+JnEGuS1CMt9?=
 =?us-ascii?Q?GZd00d/LU9LI7hFlJTyrYyT3G01+Dg7Wt0KgPDPymtZrWRLz3mWyWrzl5j8q?=
 =?us-ascii?Q?DjRAwhL0SXYEY5dNMIvgfJ18nJlGzNJ3st/F2VhA1ypgj5vq6oZxoIJSF1VT?=
 =?us-ascii?Q?Crl3Me09u39cCamKzEkS16OxyYXbgsmd9/AjrO9Tk4n7Kqrl2pM2kch5svnR?=
 =?us-ascii?Q?qatV8Bpf3OmThlPRrA1kzyHaNh7aSjSmfFt1iTNGEvST5T66S9S0lmoTl8Sm?=
 =?us-ascii?Q?Y7grsyEJTGZxGbfOAF0zYXnfZWgAWKcPYZb/BMrpywjc5f7222e70n7S6qJq?=
 =?us-ascii?Q?yunF9frQ4ITO3fa5rzSG64nruMjaDlo4/lhAMl3ylzHSfEi8vW7dJK4X9nh8?=
 =?us-ascii?Q?j4VAgAUhSWAG6CkwoTld6QRnBRIXYPyy7juIyuiSgTPEG6yU65NERfmZ9cKI?=
 =?us-ascii?Q?cmHFqF1tAQrk2bh17Ua+ScMqScZJA/zGZvVwqtpEHgdPMvXuG6fn6lvfiVs9?=
 =?us-ascii?Q?DgVLtfHAq9ROOR1N2/URIZFoUHEz9d+uMQzJkhJyCqzSM/56tibdNFAy3WBs?=
 =?us-ascii?Q?hz7rUVtt70ioBDeYiEkzoyRfRrdhweqnAZh/deJ3t8lw4UERQ8lrHH8SxmU2?=
 =?us-ascii?Q?/9G6XgC8aOB3Aup1XCW8xK+XFwApKO3d3KtDTw1aXB7NxfpToANnEvM4vjRm?=
 =?us-ascii?Q?OaybChz80+3W2KP17i7ia3RuF0DVUQ4TsMVR4WvKFsChASdyw/BF5fvXBSRm?=
 =?us-ascii?Q?HQ51CBBDCNzNL8d56WLkaxtlkMm8W1eAY9VcV/ol0hQ1YJ+TflzANDHv+RLS?=
 =?us-ascii?Q?ynS4aU16u6P6poh/OaUk9qHnlLh2RnfXzPjrQuofebr7ONJPgDUH9Z7EGKP+?=
 =?us-ascii?Q?lkSjpfKi5pN+v22HomefVdyzwlEGozUjvhbwQ3pklD/UQZnmkkrE3N6rztEq?=
 =?us-ascii?Q?cDEFI2zMs6rzPW9Uye6x4saaXY1RX00l8en521b+XHRiWLCdbiaSjVlD9MUl?=
 =?us-ascii?Q?rjTpw9zEMWGfd5YzXoe8tQOmFQcbvei5IzoSZqqpOCXSElfkwKYmsl2bvxPE?=
 =?us-ascii?Q?/PyhyLNpFP/Sw4Qu6wMHShVsfwaRFp+ZHp1T7PVCyl9Lt1IdTeYKK0pm0icL?=
 =?us-ascii?Q?hJTFm0mopeFc+q3KfZyGMZTltbHhoyiBua/nhdoeYU3SNr3+rOpIU63/CnS8?=
 =?us-ascii?Q?qsq0lSMg1cTwIgaxL3PJsNDvC1aAsUmDcb3vsAGzN8qT1UwGDVuoH/HXtYsH?=
 =?us-ascii?Q?NTDFfgY/U7983bjuvT178USdudeFezcI6bTNgcLuGtTUv2rH+i+pGb/OEpZv?=
 =?us-ascii?Q?d1Kx65q4ibLQTYEINX3nMM6MWbCl3Bh7N0sRrm0n8nQhDIdb+Z1Z1azbWtum?=
 =?us-ascii?Q?UKbK0pU6R6FD4u0c0OU2FSta7Yqn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718135df-05a5-44a9-01ca-08df012902f0
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 15:12:57.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY1P300MB960598
Subject: [Buildroot] [RFC PATCH 0/1] support/testing: add FLAT stack size
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

As we discussed in [1], this patch adds a simple test case to verify
that $(PKG)_FLAT_STACKSIZE works as expected.

I see two possible approaches to implementing this test:

1. Inspect the FLAT header to check if the stack size matches the value
   defined in the package's Makefile (the approach taken in this patch).
2. Run the built FLAT binary in QEMU and verify the stack size at
   runtime. This is more complex, but directly confirms runtime
   allocation.

I would appreciate your feedback on which approach is preferred.

I have also pushed this patch to GitLab CI, and the test job passed
successfully [2].

Best regards,
Fengwei Tan

[1] https://lore.kernel.org/buildroot/SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM/
[2] https://gitlab.com/tfx2001/buildroot/-/jobs/16053520032

Fengwei Tan (1):
  support/testing: add FLAT stack size test

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

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
