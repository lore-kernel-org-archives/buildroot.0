Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B24FD374E
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 12:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7083341DD3;
	Wed, 25 Feb 2026 12:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STHdHH_lXy0L; Wed, 25 Feb 2026 12:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD98541D50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772023767;
	bh=/VmTWFOVzqcAa+XdCprFtDcXt799KUeEvgiQ5gVrQEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Ur0R1hxaYoZhZkPkwpNUXTPzjGoyje75aBI8Q7bdXMaFaHABKiUd5gG20YyvfEXRP
	 xo/DDc4x2OE04xPHe0/S6pdoONNyhlbxgNXgBnYIC3ms2lO7E7cCbzoKErRRrSBHka
	 CAaXHbxyFHIvgcnWOE8GvgHvzN7ObBN7BOwx/mhrBwOGS9sgj93dzm0xn0Nv7/376G
	 sxJZI71Q8+iUt2BFS6ASlr2AqNusZ9/8S8glADBsEet/exDqarA1uaz+W6D+x2kjVl
	 RDn1Vrj3h7B9TCXJzBfhpKnwJTXxiVwrpKDtfXTC7+pRyLhpQK7fcq3df0TOzPFmj7
	 Im66dXq9C7clA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD98541D50;
	Wed, 25 Feb 2026 12:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8CF23D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FAC34053E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90IgYvfKQVm5 for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 12:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::2;
 helo=zrzp278cu001.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74B3140065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B3140065
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74B3140065
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqYQR3vpuZ+K7IggMrRdnZt8rYEI5bw5I16M5nK21QUxmSrPErp5MQDUjoXblql6Y3G9x4T/r7ppn/dplfTwJS3v6YYGz3wX3TwMSbTrx7PiNSvPpJDQoKRjl0TjDVHWYKSRB3EFwEzk1g1MYPg1uyTYRIbQV5+GA3AIjcZbmch19Rc+sHS4ZxLbIPv9tMsnqo7oSdC6V5MqX1/VwD6DrFyP//K8xulbAgRoVfWo76L2cdX3R3QDKMylS1m+kQHqbbCkoknzIaMukk05gn+AmC+mflgTOAaTdVYcElp61KOpHTQ8aWR6o6QRPzqNo5VVUnFlF4xNrK5I6u8PlkL3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W5RNy0v04ROw8Pfr76uDW+C4IYV3fwwVuuYkop1zrA=;
 b=pTc1iea7IAcHJqlecYJOyYVuiDdJdNOiWrIWKlL2K6b+2AFK9whx88i1XcyhT7/Yn7OG+EWi3xYJMYHDTG5wR1gI5iU4q8b8WfpH3NMVruyNeI0ZDcse1JnYMAsApLxQs/Hk4pWxzTMrDBE7xBz1OMWJhVZNxrItJDWZv//LcT9ZzhFOBE3kVLq6Ct8SU46t5IE/B6lGIByglZ6U8Mlw+MAm/kIW7JcKqbzMPbbae9cm575AfTLYgB7cuXIZdYV0ZzLtnjJ0JUoguvM6xhYpo1hd5dEKSU5A1M9Ur4fD19lWrWFNeMVOahJpYFAiA+EtZyfGa2uanyvta7XzCRNc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR3P278MB1547.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:8e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.23; Wed, 25 Feb 2026 12:49:15 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 12:49:15 +0000
To: Martin Bachmann via buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/python-multipart: bump to version 0.0.22
Thread-Index: AdymVKSrFPUdoOO4T9iz6Gj1ZskqAQ==
Date: Wed, 25 Feb 2026 12:49:15 +0000
Message-ID: <ZR0P278MB0869C41190C47D5811F1A6758B75A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=ba32fe9a-9d32-4e0a-9050-22e3969f170d;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-02-25T12:39:58Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR3P278MB1547:EE_
x-ms-office365-filtering-correlation-id: 19cae06a-5f75-409f-afbe-08de746c487d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7142099003|38070700021; 
x-microsoft-antispam-message-info: VdXqyDm+OI0+J9UiM7nMxbw9RN6hV8zwhiSJzxeDZ9fx1xwzQ2RFoMwBn28rpcycHPmPdzweJcMVLivtlCZln+T3BO2BfCzcAaf2WNFWe5srCaenM2+Mf+kNoWhePc+FxCEBRs0EBO9BbfWBjCXqANgc4JpIklkxfjYWJTzRoynr9DFcyN9y+mItP2meQh9ngDGltBiUkxwVTJ04HpITjGuGaDAWzrMmNkUwpRiSHeh/mmMB5WjbEOlN+uLWZboBgOyrYfv4GSVUNj1QIk+rSiv0B22toODlGrrzDVuw9+2D4WHI3a0uOvyuHyKq9qqXnPYRmsrQ7vbpf+97vMpy3+OLHgkhRMuawE5Bq7gg3YaGVwMcn2oCq1ZQZOHGqXmuVxjVrG9CcivrAnLUEL/ZfItjnA6VDzz42JkL1IEXjXgDagxEn406SLr4KHeniOSjfl+tC/XKqqii1AY7ZtJRwhY7s9kqtZLbfTy63+N+DNKSW45IZfm+NmTmrqLSpFErLxV7T7vVXd7Iv1aNJIumUyygh4D2B/Tql0Xx7zplr14mLfCMlsE49/UJUZsSvfqrh3A09IDRLGfQP1wlPzOCr3KmV3AugZf2RKml/9hBpLDOrrc+F+onvGh9XXLjqMKXnWsWB2bVa6YfkvU+ayLAj0GzB0FHmZT8jda/G9aQ9kuJdsJCjdbEdKZhxvWK/eQ07KPShKRztmkTsqti+lQ5fLk19cipRzW7LcJkMNPwOTNnupr3a5iPOLb9cM7/AZNX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7142099003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rezgsOhZ4Y1ZVoF23h3oWKThxIPvH182ofbbPVwSVbJe2r3g4hPT4VHnBEUT?=
 =?us-ascii?Q?+HgRKJ8ckxizhkFexovnU1HbmUV2NlAuLLkEWdKrMc01VE2ab4HNIXVXgjGS?=
 =?us-ascii?Q?LDiaBSw5xWaPSlhB5VfYrdXkDsZCfCiCLHC0xNAXCtdPvJz7p4MpRmRxXUnS?=
 =?us-ascii?Q?SKlOSmRlog3lR09LnEZGuQG44L2R6nL4vulXcCmxfUWRsgYqlM6LCikDbqOA?=
 =?us-ascii?Q?jjKFwaNLAyxVA2ZVAuQFoVEivjczzWHMIqgGekcB+C/4muwQuTHNkJyec8H2?=
 =?us-ascii?Q?3pbdISdvj2VgW6ohHXsAXuoej4EAWzS1QPuArHUhj3NhxSry/YXFV8o26kyc?=
 =?us-ascii?Q?EnSK8cDChyzfy803gaEn9OBzgZoUpfP/t1qA5QdBehf2mgePYwIkHC28oZdJ?=
 =?us-ascii?Q?pSHTK+Msjupu/bzlABS7K0gqWF1dFVQbXw7tj5pgTMn4ueynoivJPr1pDw3y?=
 =?us-ascii?Q?t1/TSAiXlYhDj6h6ovmZ7zAbDOaSmP9kLQIfKVYlgqiGHqJnmXcGavltPp34?=
 =?us-ascii?Q?bGNUYh4SehGLbhRhWbMDuHWLoA82e0GlGszh4ogkfSgX7N8mOwd+dlP/P2vZ?=
 =?us-ascii?Q?ZPHBh/NDfe6ynJ1YurbPqUc6IJEo0xy9igWeZfixSHWd5WtSAJaS4UTwx2op?=
 =?us-ascii?Q?Z6NbC6UaXgSmbBC5SgPFwC3/spijfdwZMtpw+BgxIHobGaWFrJhjtncr0ta2?=
 =?us-ascii?Q?GCXH30GFjdQ04f3+Tqy8AA5M8haAkFIceO2pzn/r5aBLRdyR3nlb6Lb8Nnsd?=
 =?us-ascii?Q?7ch/XWQlYbTMYzjt64L7G49Ajl+/wytCzI6RFylCN07m0lCBgJovPeEryeH5?=
 =?us-ascii?Q?8Zs8jJgc0DfZph9RdOZBh7/CzfQr6Z4b5PGYOAbjmJ/PPQx/ou6djnq44OV8?=
 =?us-ascii?Q?+uux9UaJ8PPNhHdXxPHxGg7mvzx/aLJ+jx4ktue3+k0BRyfjQmdBHWTCyf1U?=
 =?us-ascii?Q?6kztZFIcDvEfBVJ5S7Y1fSnTa2QNSxhtXYntxcTwLq0ggOPKRaFD/0uvABO6?=
 =?us-ascii?Q?RXpOdtOexC2HgRAf9uxZwhfqrgFDhId9lRyj9OgAT28niirYfwF6I4DPiEkt?=
 =?us-ascii?Q?TcJryZyVz2kNnCj+UhWstOmVO6AEiltPlILBc6Ay/cd9ONZbaLgYie5jIvs4?=
 =?us-ascii?Q?MtzRnvDRjFzd31A1rwvuGMU+J85wdjb8U+Emj99E0OiCxMcOeCuOlgo9uY5R?=
 =?us-ascii?Q?yNclWExktGLALtzf1XHBCvrPv8lDl/zhuE61SMYHDBwXfNvxA/UW3RuBi1AM?=
 =?us-ascii?Q?RWbkinzW5clYkts8R8AxaZxHXPJvCxT9GIErIWtRYaysT086xhGGoILt1u7T?=
 =?us-ascii?Q?6iaCXY16loKpLnMdPw0seY1Xx4bU5kGqqA/UGUomGbR/gT4xNe+Y8wsbl6Xq?=
 =?us-ascii?Q?wi2HHQGq77gTVQE2NzPVMk2TH+t5gmgyh00iyqnRh3N7LOpBp1lzKF/cLsza?=
 =?us-ascii?Q?NzFuHXT+L32U6Wf7rW98O5STzlJ+8VaYVNSaWR7vIde5myS6eKPYAHQnUWsF?=
 =?us-ascii?Q?iCBj/l1i4o8Q6mCoBigd/AiFGQx9q32CCrx7Nqc87YIXbTxEEVbeaYj77GrM?=
 =?us-ascii?Q?Hy4Ghu5ZxsCrTPSXixZKsAG+kzp6a0DbSq5psbytireuMoAI4PCGeTQBDZv8?=
 =?us-ascii?Q?H3HvyFqfTRu0MM3bqff/RclUsZUwI4GivhHlxD8IUFWFGYkmr9qWiwcFFmAY?=
 =?us-ascii?Q?BMVlJLTUOJCz09iTtAojNHs8CnereFCy/RlSCWoFanba7GrlONajgB01iQ5Z?=
 =?us-ascii?Q?HsmKbE3HljhfiLjGC6pLU64NtP44Uik=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cae06a-5f75-409f-afbe-08de746c487d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 12:49:15.4008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dc/Tkj8irJAw9hCfeh8GCnWW9t4r7PAVzSbQLTcJ7+wUIaZSWeEREBBsrLmV6o4gvNLx/e4/IMIhDgN//igiyTWGGY26nytfi6+iYnX7qBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1547
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W5RNy0v04ROw8Pfr76uDW+C4IYV3fwwVuuYkop1zrA=;
 b=BEdJTyCGRZIiSCQesJQAnJgS3JtEyvlyHX98+ngcXu4jnU2IP6QXvQNlbfxzZe42VPTmi0ZxoNuOmjSD1IAypzFzKYn8N4bcdtgOhpwTOGLlNU54kpogQppIIBpv5Rp/gVDTX/y8dw03f2PCg5bOBhwaPMoS017J4HiiXabcYBk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=BEdJTyCG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH v1 1/1] package/python-multipart: bump to
 version 0.0.22
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will fix CVE-2026-24486

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index ed01763cd7..a5bc988b02 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
-sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
+md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
+sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 6921d935eb..cdaae6ef67 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.21
+PYTHON_MULTIPART_VERSION = 0.0.22
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
