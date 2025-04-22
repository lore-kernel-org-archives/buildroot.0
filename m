Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DAC369D3
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BFB880E0A;
	Tue, 22 Apr 2025 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LWj9OvbZrPs; Tue, 22 Apr 2025 14:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D6F8810E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D6F8810E1;
	Tue, 22 Apr 2025 14:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D74A1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53BCC40294
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftsYKmdoAjmb for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260e::723;
 helo=eur03-am7-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62F1D4028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F1D4028C
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::723])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F1D4028C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBOmWYOI4sxHGm8UWpk0D8I1E705WvBc2i1ACjXobCxLu+6sSURfi+E0qteT4MBMpkzgQkmcXVuLHD4TRZ6gr/OxoLsnIPaDKv1vdEVBFdCrpsn9hI24KYvR9kkQ/Q3AsFO7bAbYkDjsORz7uPywwEjMKOakGiIDrMQDO19hBPQn1fvZ6MC1AQ7JYBvmNoBZafsX8lUXILGMkggvQ8WmcYMFmi/y6ojAvKalbEHn1F5fbh1zToGviJJR9SV4yZ6W/cGqIQDh1SfRNi2SbOx8e12mz01rzx38SMTaPT13eYfGpjFAhRet6Ke4ffvrRjAVTT9IKxC+g43b2rJMndbe0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EifJGLsRj2EYf2baQi95K+S5UdKfaZMJb5Da0t0ZqNk=;
 b=USzRoNMK8SoYuydC79w+US9uX6SuI52z8awvGgI0eeXlR5HXUy85pKYJoU9r3EwMgQYG3uuUuTLOn5NZDy30uOymbqLGmb7de8LlOd7ib85O6Y/U8Fhf3xW5g7SESjuLtkblhNVLXPH7Y1wS6egOBpLMmngpG7DrKzxxXZ9ueBe8WGxVSqtpAOvZGXRpuRQbOur7jCFJJtD4ZNRfRUFuZNltADDkRHUZlSloyCWS1PV7atA74WgS2Ho5Scg3ZP0NdFV1o65M2QFp+tpDY/y8VUCEMZBQ+r/rJ60zzzbLMSlnFyk5ox07vpd7wjUZO406Jjg2amG987ywYp4Dddibdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by AS4PR06MB8517.eurprd06.prod.outlook.com (2603:10a6:20b:4e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Tue, 22 Apr
 2025 14:01:24 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:01:24 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Gilles Fouarge <gfouarge@idtech.be>
Thread-Topic: [PATCH 1/1] package/libnss fix buildtype
Thread-Index: AduzjwUR7RQGYSXVS0GUpWsf/XCeEQ==
Date: Tue, 22 Apr 2025 14:01:24 +0000
Message-ID: <VI1PR06MB89261C88ECA6A6ACC6D9FFCCADBB2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|AS4PR06MB8517:EE_
x-ms-office365-filtering-correlation-id: 5da977e2-6e3c-406c-257f-08dd81a62ae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DZhp7dmjRbEg7dJJoVw+AjLVEI91tpMxhMUadUKwXrDmxMSPbV0jjI56ZR88?=
 =?us-ascii?Q?wrgRw3FDBERrlXFad/yre3aQI9GcsceFOy+HKW3t7mM3E2rtEA4HbFSMNij+?=
 =?us-ascii?Q?+W3DuWrS/TTBUXTekZok5TP6GTTGKnAPSq9NknbxxoFfvUbtbP6SgHnXKTKU?=
 =?us-ascii?Q?YdvGDB1qQxGy4w8Q40122nBDHECLlsQTXFkUPa82AcexRTW/b/ljmrc4PyO+?=
 =?us-ascii?Q?MJYnejUgsvd2MuW4ka+Mcidq1dEE76aVhfgzPOxEhTMnZ7i/scfNgvPlbEYe?=
 =?us-ascii?Q?2SGkgCTBmZGUeTAv5+SZchGPrBio7Ved16miDlzHxaF5m/+WR5q0p9N9ofSF?=
 =?us-ascii?Q?Nh5Vm1f44QpD93Y5MVqwyYGhVjz80aFH6ZA8gXDW3ARVimzlFi9/R5iNkveB?=
 =?us-ascii?Q?uS9uiqrUhCvrrUAmnpkTBJnhDk76tfkwFqh/RhAqCJOTaj4qDDCeN3dKsuuw?=
 =?us-ascii?Q?0X4elBXHBLD6cbQlLskV5B0JgnL/wGPCpdjXAn3Qgne7/ZQSgUTsFwEnIBo2?=
 =?us-ascii?Q?4Wp2eCowSpw29we/oVfWB8PzRK443vWzmpb0jXRTwDiL+XoY2gDO0PgxmpJi?=
 =?us-ascii?Q?etrpVOhGsc2nGwyOmLxwSZ5CW+lSFz7T02Gf19syvd6ghc0lTwR+7xuIZLjS?=
 =?us-ascii?Q?dDLzCaR/xJOUHzVnMaTYS9MSnLsTllYoAm4lNc3hONMrDfrIFK0XHRLitU+T?=
 =?us-ascii?Q?zwJjLCZmQHAgZ4Oj9EPd/bju6fbmY3ZpgZwqC4u+9kjrYqvajdNJ0WZI0UQo?=
 =?us-ascii?Q?H3Soh5zJUsV8NXqqgo5TPzV/o+uUAmro4+pio6Ci92UfsnF0fLhiMPdbBXf/?=
 =?us-ascii?Q?NdWIXmY7c6WG6HaAa4e4Wr3D3ODtLHn6hchmAl1BLkqPrQ+/Ld4n/lfhaaa5?=
 =?us-ascii?Q?4pvjWBQCw1r4AUELtIOJ0zW1gKkZJsWYHyX5a2J4Q9vVvZ3T5n08if1YwlJf?=
 =?us-ascii?Q?aUWTBGKv1j5Nxx0ONqVLqdsf6qbNM7YuTBjprFsqeq1kqovVuO67JBbj1Npw?=
 =?us-ascii?Q?sXrCBtKETC0lfmHECfLyahLk7GfELb7tUdYmG5qGeR0xk8ntqqgyZ/KTj8Tu?=
 =?us-ascii?Q?mZUuZAb/JWBUurjNnxPzOzxqy10tQ3ULSvaaBg9auWZm2fY7QlaKA/NP4ZZi?=
 =?us-ascii?Q?IFzOr0h4ZoD+YZUP1UQMGiAqItHeoDslNfd8uQNCKq6so5uJ8udtaK7nZsbl?=
 =?us-ascii?Q?oyaQHOSapTEvw4eK5bVFF4Znwub9tCSB44702/cnA6AyUeUdr03zXjXkSNk8?=
 =?us-ascii?Q?TIqc0NrlTSSNywTc/NAUZL5WpuVtlzv3pKocUNAF7ib0IaQEeyFKdj5P9W2O?=
 =?us-ascii?Q?Q74JfrOIs6Ts+mOTb5gxtLXrTDzgANuXysYq0KTw29iNsyn1VgZCKQyepRNR?=
 =?us-ascii?Q?MRB1FCvqLOvBChLm36t6EHTDZh3EBC1oYOPhwlhel1W35LP72JCHjnwnOlPV?=
 =?us-ascii?Q?Xg9LeS9i6iqOvTmsLivFv4/8WVZYykaVsqhSgfzfx/fYtt0+Gm3wjFdiP90D?=
 =?us-ascii?Q?9jHuH1IQ2T5dK8U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lmiX89pIsLmviIHZE/nOLssBcXPfNnYCeaW6JIW6oFmce38F/t0/V42PGnQa?=
 =?us-ascii?Q?bNaw9GLCaApJdSRP+HL9oq8aOTLNakTRljiH4L6ciLGQW4dGwDNfHkItTGRe?=
 =?us-ascii?Q?4MYXZa+CXLc5PpSlgd1kjUBi8tdw08wufxCV3U/i98W72wf/JgfA3ZYT3GLS?=
 =?us-ascii?Q?QeHirEY0IjOXpHVC1ZwH7rWOIeDOhrSnDhNsrVwiSstyl4F8gIdDcABqdOru?=
 =?us-ascii?Q?fkQdVOhlurENK00fHQGiyW3Ia+1F75hrQA7IM1rRevX/lxi2Kuns45MuNbYj?=
 =?us-ascii?Q?jb06axh/dmGV73N36gWIcmvYxHW5ne1XEXCluxa3NNkdYbJBuPBEqCjrsVXk?=
 =?us-ascii?Q?IWIQT74fOmtc/ScUZylmdHgVvR+ff/vrHmx9XFr1JQ8Wcj1+igp8ggPAMNRu?=
 =?us-ascii?Q?oPCcujPv3rWfWkAgO06wmU2PadP9h/UNF1OtwKdNro5PNjDgBDtvjq7Ae9g+?=
 =?us-ascii?Q?k4tjeXzt/nI1cx+ySAu8cRAUYP/hGdtZ5N9sMbiv8fX8/0guop1FB/gTusYc?=
 =?us-ascii?Q?TJRoEwYmO8RLnV0RaL/g8VuV3IaCNT2jSecWS9ECmQH0+B+DbETskvTocx1t?=
 =?us-ascii?Q?6kLi2Jl3VBC3ZiTGP+T/8GC6PzgHHJm4JleX+Trc8wcnA3KO1jaPBEDZFOYm?=
 =?us-ascii?Q?bMFsf5zdIqezv9+24MYHGo5TstIOVPxGxTUe/kiV03ZEm6NK/Sv11cs/6aAW?=
 =?us-ascii?Q?qQPWsUy+V3jTvm/AiSpasy45cWyeXcXysSRKyHdZ3oXebf6dlXTgEXGebmYt?=
 =?us-ascii?Q?Qzh1PDPpHX23vKTKIyuuX6T0wpUtD/TBX4WnYPlYg6OS8b0mRO8EY+207biU?=
 =?us-ascii?Q?JFLaqogfGz/JkXkWj8JBoq4n0ts8oPHtOjFCMzzTVOY5xc+AOOYA5/9vLDpr?=
 =?us-ascii?Q?l6lUiOQ26UIgcUgcG2reIz3Dtq1FwZM6/BPc82vCj/Pk54W/5zh5zS8oNV35?=
 =?us-ascii?Q?KGC31pf3DyQV5bEu6MF5RNHt99uwU+ORvxOcJsuC4Hbe48j7c8aQyd7boiOY?=
 =?us-ascii?Q?WdgFDFfas3qnWH52OydXiuKaYgiwKHTJ3nNmm0K8MUrJyu+cVLm2ji+xKeG2?=
 =?us-ascii?Q?kFgfG2aJwvWL5x+IoEDmA/1hGAcoHma8ieXXGcopKHUsu4pxkSP4LEOgxWPc?=
 =?us-ascii?Q?+CBE0symeQHIPIWVDLae+mUSaQnozDPQ4HHuaB1fORfEAurxzoH4BmNzqZIl?=
 =?us-ascii?Q?epNSIkFcyzmg8ABC2rIupbzk0tZ1DGL+TTawXwKzlBsO371cqrsjzdkmX3YH?=
 =?us-ascii?Q?KBajU2JgFeGnbnr3lxCv8dXqbqcI3iJFj2HBq0TQ0PA4c3FqKcUaPj1mHyNC?=
 =?us-ascii?Q?+63LEn4tttEbzHW0Fwb+IQF1dDN35WHI9esQo3yIFIu5izG6RRq15YYH1Puy?=
 =?us-ascii?Q?9eTf8twdnVh68Dlucu/Hi7dWiyQBCC2hbdk+HxzGV0F2NVEUe8qn9hqdJAJU?=
 =?us-ascii?Q?mgy9VX9hp+vpA9su/LJvSSagZKBn9YKTRF+xfcEmQoCWHTKEDJIZvbCHOSZK?=
 =?us-ascii?Q?nBRyqOT28yhc7szR6BpkTudA6xuH4cXaAgAoqrkepzQUoTv9MvmHdbQmdqXv?=
 =?us-ascii?Q?qYpbIlwvWhMlSoikQk4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da977e2-6e3c-406c-257f-08dd81a62ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 14:01:24.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UsFSo5BFT+cZECLA7d7NMTrw7cVSvNQxV+6DmTODZ3z+4A2VSeAW+UYXXnRu6/5nFG9QAzLxR10+V6GrTMJxnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtech.be; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EifJGLsRj2EYf2baQi95K+S5UdKfaZMJb5Da0t0ZqNk=;
 b=LBR52aI9/fvgcyGAYxdNl5K9vW0ppHgB5WiVJZgij/BlYHI5Xj8XXoBy0rfi4LX8+ZNsVrl26sVzCbKBg66URAip98jlwQ2w50SKvlLhS2tz97eGJnvaLfYefZutzSo3n9Nx+1+6HvqciFE5PrCPTTRbVY8xdov22DdIHgJ8MsQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtech.be header.i=@idtech.be header.a=rsa-sha256
 header.s=selector1 header.b=LBR52aI9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
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

By default, libnss is built as debug.
We need to add BUILD_OPT=1 to the LIBNSS_BUILD_VARS
https://firefox-source-docs.mozilla.org/security/nss/build.html

Signed-off-by: Ayrton Leyssens<aleyssens@idtech.be>
---
 package/libnss/libnss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 541edf185f..8c99e55a13 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -47,6 +47,7 @@ LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
 endif
 
 LIBNSS_BUILD_VARS = \
+	BUILD_OPT=1 \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
@@ -128,6 +129,7 @@ define LIBNSS_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBNSS_BUILD_VARS = \
+	BUILD_OPT=1 \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
 	NSPR_LIB_DIR=$(HOST_DIR)/lib \
-- 
2.43.0

Ayrton Leyssens
Embedded Software Engineer


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
