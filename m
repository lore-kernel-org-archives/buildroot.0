Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082EAE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F4B821E1;
	Tue,  3 Feb 2026 08:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzAzIQ3yFZd4; Tue,  3 Feb 2026 08:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B29821E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770108966;
	bh=WgQScaY725BR/i24g7BgMe3AMp9l+8k1LDC1nGt6Sis=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7bn/kAOQ6pYkUR3KqV8zoNt+CnaARIgyWrhSrxZpOVrJ+bKpujBSc90C7ohZN7mX
	 mfux5otIab3pydrfXi7acqdKkUIEIZZ7/2gN1ltEhkLtZ3l1uZ7n6t+HICpCXZuupL
	 JDCrQm/U/zBIJBHHALJ9dX8q+YR/cN2QJp+cqrauk1b46MjHGnInTBIOuxZucK3n1/
	 SHxqHiyeFG8YOqladHPh7N9nO7TMj1kYfxH+s601FRLfZl55l+NjKAYvRCN5N+w4qs
	 Ka7mcQIMQ1t0JIebhaHlJeOB89sPGc/Hcv0kzPQapq1QYJxUuwVhySxYwWRHBcSoOT
	 FQ73l6gIvYjgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2B29821E5;
	Tue,  3 Feb 2026 08:56:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 090391A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD11A821E1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6VtiRHpCOjU for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:56:04 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::607;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29D6C821E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D6C821E9
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0607.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29D6C821E9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=RCG9QiAlgyQ2y7cSfMKr3ZfQcG6JZSewfboG2xnGtGkRevq1InlMHIXmgxd2MGpo6Ovc7KQBg2ve/A+9cfNdTNRUmyfnSX3nRUXoHrGh1TGb9VlaKoOisuM4HDp2HcDyyogDWwtWCIy7NN1zQlk1XdgnY3ZQgtHXNKL3rmFxe35muiMF0nXu3qWq/+YH3S7ZG7EuoEtukB8hrVDkk2Ek+1dKOSL5JqaLoaWS7DYs38ZeuYBvp5TWgXVNtQ4g01evYZktuMTivk3xopID+H20L4nGzXB7tCe6kbCwH2Pnsg+py+Wh8FCqMSay0hhzOobDgO3uunZna9pnAg3P77obmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmOIAg6Mv8/CszCdVXjoo28FFlQIzHnpdQVbNazpqiA=;
 b=npsIhiV75se8/U3kcwKuoHyCmJ7dAdwJ7Mh/MO4uGlfZCAJQZYQb2nPlIPCJmBigd3sEw4eFj5iOfzRVMaYc92Xs6A7P+7qcE8n873Iaul59DPhC2uRTy/atY4IVLZ9j2s1Zccz1TU+7VVlM2Pm6JkVIY9IiHo08yJMmq83U4FpuHgj9kk346uV1oBvpc1//1mhIDcMAVX4fnueXCHzZCIg2oGHhKDpqP5TL0YDWigoP5SJVRf/Z99tKeM5BrYbfqfvVTqIHL03rI1rEQcKnSfb9GZPEkvIvor01+/YMhL22ppCLUpm8ucJAWPW9FEctYqYIuLd8GwgHsVruEXGZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BNAP110MB2096.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:55:58 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:55:57 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/2] package/python-zipstream-ng: select
 python zstd module
Thread-Index: AQHclOrpNReUv9IimUqmMrCUcFI5Rw==
Date: Tue, 3 Feb 2026 08:55:57 +0000
Message-ID: <PH1P110MB1603D56F63D508563006E1439F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260202181527.2584850-1-romain.naour@smile.fr>
 <20260202181527.2584850-2-romain.naour@smile.fr>
In-Reply-To: <20260202181527.2584850-2-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BNAP110MB2096:EE_
x-ms-office365-filtering-correlation-id: 3c92d970-4130-4566-0401-08de63020c3e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?br1SPKPD8TlLvE1/hNh1/PKZsFVS5DI+B7K9hx7YhsGLzM9R8WsVTlky6ib9?=
 =?us-ascii?Q?cw1hlDs6n7CB3MDuuKT0sNvOcQCkv4gNEmwrgztlKxtfQ78uFu+WNb7lkeAF?=
 =?us-ascii?Q?KFwHiKnCQTBim1LoGfN1dajEHD+Wq7o3kWBCgfYhVqB049eJlpFhnqXQI5Ar?=
 =?us-ascii?Q?NR/JVg39WCr7HiC9p0Zb4MGhbanQ6yU6tTRZdgQxVWFAvpzSVx4CzuernEA9?=
 =?us-ascii?Q?bFNHWfPXlXxpvuIBD7DZF7Njnc+8Be4/1meJtZBcN2HCEikT47gGztqEHcHl?=
 =?us-ascii?Q?NJsK7u4g7aSUky5ngZOIw4+MqZsBpJ8rnaIPUFDlboVrlmsyZFv1cjxLr1wK?=
 =?us-ascii?Q?+Z4ixBAcgRYtVKGbmzhJIKhnb/0d+Fw8b6rbOHzvWb60ztpF7U5tdv4ndQ12?=
 =?us-ascii?Q?U29a4BCz8pLhD5g/jsqjLUbZenVyliXUcDg/T6HwLc8+oqfrSqWtrsIENyBr?=
 =?us-ascii?Q?PmvCtC6VXLHs3yq49FtTFo5d04ckeb05dT3qaVLY/ZkgSZA1u3suUOkRZKsB?=
 =?us-ascii?Q?OWB8RZCR8sTkwBeZuYtHbBE3kHOFgQQ/lmz3Prw20Mj0XnVtajrPHV4v9Z2C?=
 =?us-ascii?Q?J3mBxaK3wth+q2nnZ2GFbm2R10WqavjARHby26zT8T36YILqFfmZZUd2N/xN?=
 =?us-ascii?Q?VXSc+eBa7CGXyXSgzuZRafq6YtfUNG9NAgW1ix4O+nSc4aQfIGrDluKQi6wC?=
 =?us-ascii?Q?O/RKLTpdXaTvyhcP/eggoXKQwYY8TGBn7x/QpJPs652ts9s+G+GbXOi6nxS7?=
 =?us-ascii?Q?hX8Y/p2FuYKPpu1JRxxAUTyvAw5N8oZkl4o5v6cvvSZDtDkI1Atw8SgB7pn/?=
 =?us-ascii?Q?BX2bTpaOnNP6v/2FwEpJ6bAvhNolnBjY5XxZHvTE4WhuBLA12q6OZJU2xsVZ?=
 =?us-ascii?Q?As+oF3Atrbrukk5NNE+rapw2OWKNdV6O3TaoE5+yvLXh1/QFR4rz6d4HcDmf?=
 =?us-ascii?Q?fhihESamZoi/HkYuvgzB7oKZxstmksfXXJ1Nutdpf3xaRikbfdoj6o4IqOXQ?=
 =?us-ascii?Q?ScYpqHNuScIL9hwiN3M+9KUc5LCA8+MSq2tHvKyfnN+qiQyPRLQcCVqRFOvm?=
 =?us-ascii?Q?Oh5wTTFxKSidhl1+L5M498RDTP7N0V0phpsWZlzyuRZoQr4ft2lRwCtjRXgn?=
 =?us-ascii?Q?fNPqvclC7o9oAiPhb2FFGFP2WaP7yNn0O/IkBxWtrZuKTbkl6FQBzcTPn8ft?=
 =?us-ascii?Q?nT67E6gQh0qhKFKR+0c6JUaSlXNhHwdPIH3gQF+t/8USF2PFgu3qHObCDe5g?=
 =?us-ascii?Q?JWNaDavn33S6Tz/Ya4rFidL5nsZIyg1epblowdtcJFNSOi7tVuLoQr9blHuM?=
 =?us-ascii?Q?OhI428UhjBhwQ2weilS52sdG9P1ySxCJ4AIggpbcJ9A2QITsgtZzUkg/mGwp?=
 =?us-ascii?Q?M1IbMTuJATV/T2F/ThMYsMQDV2kTaMkDmNMBrDREYg1HBzIkxyk5C0HJEQYL?=
 =?us-ascii?Q?jChXo5SC6BHAsFC3EMNlwqmTXWS43fcV93Ncbho7u29bf96UnZt1oPpyYcR2?=
 =?us-ascii?Q?gdBF4TvdzbiyKMUURPf/alP5vzKlLY+ppNt8yl4SGFNkVcM4NT89pY747w1K?=
 =?us-ascii?Q?bA3QfpXNjeVa88MKzEOHPcN/HHQfT7hEXwlwvUN4kNAwPfu4nC20x28ziO4J?=
 =?us-ascii?Q?AVg2a+tDpoNHa4yDJnoFzsM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zCi4VxN/RNCcjkDkWBRb6pmnizyemyX2R9EQHaf3l2kXn++UaPE70eCZFLDS?=
 =?us-ascii?Q?3LokHPlPaqr6Esq9vv+vEI+gxOUKXqjihNoH+b5GE0Skp9BR1WSzusGnMnBs?=
 =?us-ascii?Q?DsVZvvMJ9B5H+9Za8hdLwQ7PIfY5tl9p7HzShJsIVWUDvtl3YDgMGYWegWhW?=
 =?us-ascii?Q?1EVmqlBLA9pdhklvOVtHW8DYjrnIDXFCqFVM3uq4em5wf8ibQxO+Og9SbFGy?=
 =?us-ascii?Q?KNTD1raVtSOsnLRWcK8KoZSfdhEVKuRPlgvbpOcSlqr9TAFdktLqiej2Vj/t?=
 =?us-ascii?Q?t/ifYH4xYQIiJBMnfcmSfifeOfIwNx+6o/ot9t1szHxeI9VG6zBx+SPxUYQ8?=
 =?us-ascii?Q?QejXfg7HyYngrkSDtQmn6j4ckJH/3v1CmWiXwpLM31hyZBk+4TTNM5VpJ4KJ?=
 =?us-ascii?Q?oeoy+Xb9IldXtm+pf2R5XzkZfuTOTsaiUHXFyketXq1+hzg9uY9JCOMP4pnw?=
 =?us-ascii?Q?qVVOIe/qsBL878JUKFwKn+qxs3/slnoWp/JW/lytmr09U1DwuGQIGRfSPefH?=
 =?us-ascii?Q?moxdfvrDfha0wXd7NIWl8GSYQa6FMdvwNSsh0s1p5z7sL+cukLmDqoHfPtkE?=
 =?us-ascii?Q?wwOGhf7+s6pNOICVi5hBkkvW1uWGrh9Ts2YE0YM+clFSdFWh6sV+o/qj6plU?=
 =?us-ascii?Q?jdBpuC0jMznNlsiGS/s2WSqJz+vm03yCSNKzjzkwH/lMPxjNt2f1xW16jjs0?=
 =?us-ascii?Q?HwCfBkitwhN4d7jIjyUe/FIWbDNdo1ATIWWZt4gLcDxWvGT0XhnK9lakHAVZ?=
 =?us-ascii?Q?RS3QmOHi8sv4K4o8FiMv9DpyNBBXLiOoRqqFFUaVclOhQn8qPhmLgsm0tEpb?=
 =?us-ascii?Q?lDswxA6jHxhAGEpzg7+1AtB4moyHvQfs4T/cbWSnlru+nXG8+zC/VyqRzHVZ?=
 =?us-ascii?Q?IDDVos2UpGjOUCpcb/UcezSi5vrfrhPPMM6/LlKGMhMvqXHeGyywMdfvN2F/?=
 =?us-ascii?Q?gVhGYe2JrHiRjxFsyg9EX2BDERnzLjoE5qZJamEe+CCp5O8Xafbs7rXYyHoh?=
 =?us-ascii?Q?fnkLqcm5btJ2fi5C9YrC0MB9DPGRX41brIIua7ry/RcVb3voOZpdyX6Ms1q6?=
 =?us-ascii?Q?McyopyLBCUvz4SuqPJti3eL1HVSL9g1vOz+nJ3YdpvWlEZFHK9co550uL3wA?=
 =?us-ascii?Q?/klgyZ/FcQsyLY1JzazgXUbrZtEZ+/MOM9z1KMZc66M1b2r/o4c5HSWADG7y?=
 =?us-ascii?Q?yRIgF2yLtf9vRAwyAjUSSRs5fd1fvfJZ40N9y/H7d34/XvYQ+7fBjoetiyOE?=
 =?us-ascii?Q?okayc3qLxlLHyGbclt4a0p5wcdh568KZS4he8/YVFl2D/cLA/WT95iYSlUij?=
 =?us-ascii?Q?dHY/WNDzh4h9DOq3qZU5yRBYgyB5tvesnoxBqqM9tQ8YEB8JuIuJe8JFlePF?=
 =?us-ascii?Q?sAcl19dWUvEjp8UVhHWIjO9WYULZcIwboTyl3kpctGaGvmUT+QVK6haLfDY3?=
 =?us-ascii?Q?6WETroSCZvJVPi5+d0SP2ACXKH+72GUcLNbrx9XMcZQHvn0gTR0xo6MV6Znp?=
 =?us-ascii?Q?c8oSj3d0VAC3VM0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c92d970-4130-4566-0401-08de63020c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 08:55:57.9188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmOIAg6Mv8/CszCdVXjoo28FFlQIzHnpdQVbNazpqiA=;
 b=FQoZh8R6EpWm/KAoWPVs6oLsVY8yp1LHgR6ftq5vIrqqq8YYQcp4skF9SCebJRjYnTo42wIZAEjdgTSkRija9SSi7oHoLoTrPFhMVoPcRWyS4PSMhbugFcrtOGA3U4bE6m3ZdcVStuzDXVyKD4vkl4IR0+jT0op/GJlmYjQm/z2JGkDg23sVI12D6Q/CLa9B7AMGDnIpwVSXQnETDI04/KMw8jCFabnyibENFShsGT91AH2vWfxjFCohSi0Z+Fqp57+nFUy+Kry2ib3lomAcjghY507RuXx9avN/G0mn55iKqTHLfvkAtKauPTImCgNjqKHIFGZc3nvWvsWCGL+jMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=FQoZh8R6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 2/2] package/python-zipstream-ng: select
 python zstd module
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



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Romain
> Naour via buildroot
> Sent: Monday, February 2, 2026 12:15 PM
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@smile.fr>
> Subject: [External] - [Buildroot] [PATCH 2/2] package/python-zipstream-ng:
> select python zstd module
> 
> Since zipstream-ng v1.9.0 the python zstd module introduced in python
> 3.14 is required at runtime [1].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413941
> 
> [1] https://github.com/pR0Ps/zipstream-
> ng/commit/1e3754cb26a422e94984db38535139c2c92473af
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
