Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECAAC624D0
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 04:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B40B6067F;
	Wed,  2 Sep 2026 04:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g50DcocXKQ7T; Wed,  2 Sep 2026 04:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788322068;
	bh=3bBTpeEmitEo02/NT17/PmMJWDMPhRTZZ/ytL7QGVeI=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IK+9OQyv87Nhlud7qk+MbEV/PgFye6VzteeaJq8SN6ZIAgfGJvw/04uOX5wQYbqPt
	 mDqQzY7k5CKW0a0G9XWk8Mh3fmw1T+U1pYl2JdKCoc2luh3rDUzOTEVBcdcH+bY7Yo
	 F+YO/GhjbmUCOUmK1SeEQMKLJR5AshRu5CSg+0vh6oqRhMf5XLQUHhIw8do+nftIpu
	 vOuzJNU2grNC7WFQbv3+RSs+TiLbZ4oJhuIC87EvjZPZdikPw3+M3cBCDDxNt8Xvrw
	 I8sW3lacfjmsB7OGM1l7rEytGJZF3wM6vyQZ3qn82FQUsHfbEWlXfTLxE5vYhAPQl6
	 VQZ/tNP0rK7XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB045606C4;
	Wed,  2 Sep 2026 04:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07883363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC9DF407A8
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xm2MyLYAWEnb for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 04:07:21 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FCB7406AB
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF8Tz1D1EdDh++wwH5M0NvtflsIZWHlYd5wDEIp7oTdLQz6XCFT67g9ibbHi2ejQ5why8UhcGVuvYuaFEW8opfEV8AJscV5fz28vB7KAR3mA7ulgFLoInT7srK92YAAM9ry+YR38VFMru3HL11sfRpM7KqG6bKfHafDZXUk46Ij518iTi9yF7ipTYesNHpj3D6RlFRDJPZox7ndFmD5MARnDSKSFnvtgzx5DFPwY1/sadeEij2Smqiu0PYORqI3T74oO5pjVbN0bA28vQqRlfFhzCkR8I8nVxnwF4AsOwtcm/FB6A8fZ3Kvu/dgvFl18esxNwgNr4noK0Dnx7i8NCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+E7H9NNYIk4SGoVL4ireNzyDnLlFKGPIR2azCnvJ9M=;
 b=DUk7WyLtCPQck6CYkLs6YPct9IRGhTbDZQU/0tQm+hcor5Whvuz1SlR7QV8SfIVMKgaxqtLwt9NUHIDNTV0le7mJSv7wFkK4DR9W2SUYmqMDgCwUbHoCNOv45TnbBEtmR6SQImkSLK9yKEF+yuAAN9FhBeyToGkAA7GjkITXor76ySw4TI6le2D3xhwN5G2m8OeIom2oss2DU81r4l2H+82U6ZieOrQvhBcp2J1F4Pw8SXGu+Ie0P1EkEUndZF7+MLMl2pocB3ObZ6dRAcfSIQXpmW5VO5GdsjXW85a/+vAouB69c8Wa8RCmvAxor5+USG0gWrAGkLaJxR2dehYVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 04:03:44 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 04:03:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "joseph@anodize.com"
 <joseph@anodize.com>, "ramin.moussavi@yacoub.de" <ramin.moussavi@yacoub.de>,
 "thesamprice@gmail.com" <thesamprice@gmail.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "lordrasmus@gmail.com" <lordrasmus@gmail.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
Thread-Index: AQHdLj9uoIQWrzCUhkaDUSGQeUbldLa6V1sAgABr9FA=
Date: Wed, 2 Sep 2026 04:03:43 +0000
Message-ID: <BL1PR12MB5032C592B800098F230A5426F0B72@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260817115616.4081110-1-neal.frager@amd.com>
 <apdFL45ytN1A-28U@windsurf>
In-Reply-To: <apdFL45ytN1A-28U@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-02T04:02:42.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|PH0PR12MB5605:EE_
x-ms-office365-filtering-correlation-id: 24ea26c4-93f0-426b-a261-08df08a72e0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|38070700021|11063799006|56012099006|4143699003|18002099003|22082099003|41080700001;
x-microsoft-antispam-message-info: TCFVeNp6T0RSr2MqvDLwdMy5vHWG/jBt7AhX+WtDS3yjAvOm2UJeoWp61ePUKeM4uXiQySRljNwVyRjRsbiVNyRu/Kutlrj6Lf58knfSCjQmdFK2Ohh1LQBTxuXXHRBAT8OnBq/Mve+aPpDF7gZ5TQAIdujCvZhNT0WzSZ6KCoR28maIGi3/6tr22wzhi4oYjjH0H2WCtS2t9wUHhkAOY/LmaxdUlv8E3M+eXdF1RH1cwKtjHutoKfv2ydMuug/ajNicBSapbICnhEAsTTwm96m5cj7BdnOFnCNDkMvXiL5+/aCgGJht13yZzpISZD58ziywjl9kpoWNEYWMfZzMurSv52UO1voQA3cQ3usuZg++yvUiS1Fy6GRv1W6q6eC087z+uViQfoTAAF6sbatN3HJ/8SdtAcexAqzbatJaDf0nVgGY4tnVxi4VgSxBvMFynyLBWt/+tRfFzU+GpraGYLDdXzqnjEb1ssycdHswmRJFvWdf3Zujuv2S00PlLuM2qdDxg6vrVjlpXffahH2l0zYiqgmaZzNNjYIfBqe27OglgTPdsZm8vrQ4P9PR+z9x15oZZ1t+S3Ch9dZYw23qeveWcfA1VHQQcO+N9AupOpIQhxxljx52YYpAdbnCKBQLHWjU+0zVRbAB9It0N9dbOFIJi9W0t+7woa7HFbfWQ+mXHbXHPeGh/yoDHgMmHGdIdtDXpEMCnJxjeIVGAYCFxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z8n7s8FUgH9rR0E1Mt4r52lmL3P60E60M2l50wlYY+8QlrG8oZ9LsHXAlYqU?=
 =?us-ascii?Q?Rlel9heUOh8C6MlPTgURJ8kfp0ozGcf62WdoKg8LLz3MsKcZHzpsXi5t5Bxp?=
 =?us-ascii?Q?koTGO+N6sH5bWoaS+tkuAPS7zJ3DNxNXbzhjBr5AFj/JcYxIs6+Secazc6P2?=
 =?us-ascii?Q?NmDm3e231W3vck3WIkTLPtUwAMq0MBtaxallRVVWqHN7v0I91+R0/X2peba1?=
 =?us-ascii?Q?T2TSJD0GnK4yGuao1wJ1NxfRTUELxgSQteTZce4vwGKbaoiGsNY1DbCaKsxr?=
 =?us-ascii?Q?ejFAqXZIVszJbTBjcnzgTBk8qT5UZIF25OTsm5DwqDHyJBLPSofN56SOrkTs?=
 =?us-ascii?Q?CdWgDfoptINNIuyhnmMcfezMnPBARWEim6EAHeuV/5r8VQFrO2fnKI7PkOdM?=
 =?us-ascii?Q?RAb4Hq4klw/0kqRASyyi9F95hwKyaX94iMQTNYDxz65zr88lIjk8SuloXmoV?=
 =?us-ascii?Q?zH1ZGcbYRg4ZrOPKwdFrQw14wgxu0lIwQWWvCo7g3SVtui0SXgSAm7eI58Ox?=
 =?us-ascii?Q?W6KT23fLw1wxmrhv8OlUiPQbvWauhWQZixcek55e9SdGhx7gfYcFjbUoaB9T?=
 =?us-ascii?Q?P/M3MJZrtx9m2P9KvKGVJsoVIoiL73dJzjJx7KVsmO8GGvZUVHRG8663hvKB?=
 =?us-ascii?Q?J3RktqqUY1oAa1a6aWHXpUc9CJfHtVxet01F76hdFtklbH74DN4pMrSoc3jZ?=
 =?us-ascii?Q?z7ZwL6yA7BED1iSShdXATy2DEXxQoZvjvDoDbsjqeoJeI4vRiKA0ML7iHE97?=
 =?us-ascii?Q?zsf6KCBke4ZyUHtIx1xElErbhEWNQHYq+fF6kaBhgQ3rnHnI/owhAft6qL1N?=
 =?us-ascii?Q?2QSMheQJ+Dq107TftlVeiNwhMjVjEY50BngJkYpKrfbNXz5ZYmQp4swPhyPZ?=
 =?us-ascii?Q?wdE2TFbv0EGZQ2/GafhyegF4CyDIbDjMNVmD4/DOYWRL67QONeXe5WNHHb0O?=
 =?us-ascii?Q?nYDt0Cvd+QCBEmlt1yJ53EYHp/P9E6HnbETmxlEAT/jnFFVfXnDWkw9+hSF+?=
 =?us-ascii?Q?Ho4KSJxICRFoEnQghIbVgsjO/EwKGLceiRs8fDzkbb+2mS8tqcOJXJEYt4bP?=
 =?us-ascii?Q?tJXgcPz0tk16UvefVr3/B1NzDJ6wAfYlQXByNXbVRD8M05hEGk3RwqAltL6r?=
 =?us-ascii?Q?gnp6NMYU1PS9OlqKdR/J1vbuHYEquA2xJ18j68LURroglfkTa+lJXpa9mxGh?=
 =?us-ascii?Q?5inlEKCTJdAlXAeH0CY6j9j8a/12xf7XKlOL7ARcmhmGPA0WU0tKW+QXKC6T?=
 =?us-ascii?Q?7SSnPnZZfEiPlAK9qWJmqvi05cjWd6XzCTL78qowFLhGaP/3GHl2qY1hrIQV?=
 =?us-ascii?Q?4HKl2fH9uFsXDR2rDyOUTUVntfafsJ/GfOROpcS9F74a2TBKBAEeTWZgSD7J?=
 =?us-ascii?Q?miUTtulX8OtdVXWkeEstxRBw5qpfhcb5hXzj/aX19uBOtu725VkJakBU9GKD?=
 =?us-ascii?Q?MuK1qGTMim6FmTzfwuPbSju0ED1Qbd4XZlLFjNduF0btf+KiyeYQM3cMbG5M?=
 =?us-ascii?Q?EX6luiz0hufseSicndaJ1DbCbjmWIIrkeY/xH38aR5UUEUAVPCKfPCpErxAk?=
 =?us-ascii?Q?xs1DQLXNxU+xH2iRhoIRAVhb69HJ7A7EfvteYv9/ZX1zzsNvvFfdOTHRDYuX?=
 =?us-ascii?Q?2MBNCr0QjvsbqfN9ST9qokYMlftRWv/Wqb0SWfsJL2mR9Vg3mpLNnUL6+KE1?=
 =?us-ascii?Q?ZC/u/aCE+cvlxrkhuUBBVzD62aZZJJo8jBEk57qdOpvf/941?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ea26c4-93f0-426b-a261-08df08a72e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 04:03:43.4314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0YcJFtL1+5QmJJuFrvx+d3Moi0cEAzYLfPfaHkRww02x9VDM5kmRhkihnu8fOYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Thomas,

> Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.
>
> Upstream: https://github.com/gcc-mirror/gcc/commit/4ef64ad1a
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Thanks for those patches. However, they need an Upstream: tag and your
> Signed-off-by: line added to them.

> Could you resend with this fixed?

Ok, no problem.

> Thanks a lot!

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
