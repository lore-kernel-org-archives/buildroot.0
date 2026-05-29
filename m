Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FD9CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FD78458E;
	Fri, 29 May 2026 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZV7U83t4y8B4; Fri, 29 May 2026 18:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 955FF84591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079120;
	bh=4TGyOZybXGxEkHnZn0n95h5TLeNnu3pstgVlpHsgYuI=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ITSvfeKHmyci0+gvSJDrYAvj9012HwQToGfSg35ooJpvKfIhpoMlPdVis05oIBEPy
	 dohNuUKyxMZ9svBNQnA/Pn37/I0makgPQylxCY8JJo0TsILAT1Q6KzzAMN1vZyEXLo
	 u88XVo7Yf3qrJFB6YrZCmUvCbqwIb7/tQkwbXxfG/meye58r77wr7A9mXSBlqM4Yr6
	 qS52gkojKjX9rqP7oQ2mjHdqfPjHSxZVcUkzy/DvX/jfXEq4Xi6Gn4OUgNBrJjcFTX
	 pHI4J6YQb1o8+DzAwmYa91a4C0PhBqNMToazjzYb/Bh13lmQkw9smQhGRc/cDf/NGo
	 TLwkfvkR4uRMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955FF84591;
	Fri, 29 May 2026 18:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19978288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08364421FA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk0tGuWncaMG for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F46E42207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F46E42207
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F46E42207
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wsmp1VcXJn0Bc/zsqZ0e7HgrZLBRlqzbxaN0P1DK/yvqDnxUpmBgJ+JflRY7Hnt8uF9P/DV2+GrcMZ3KZgCBDazO7L2Xk9Kej7eWgvznaITFxrQrdIiLbypRe5iDvjFlvBegX5WQPV29yasBp55geQUZCv0nJOXs5FJbmMMp/E+8Wh57CPNKBOoijpCH0c4gBDXdqAxoMNPgFX6J56+43LEdoRxhOvY4nQDEa8g5f/hMKigec+OJ0A5E6AaVQXgQB369SClgoTcysYnzZTc2cR6v0zVF/fMyExDbmTzzDRnyy3D3QaJuWSDAWjhAI9kVXeH+lSfvGes5JaFszu/KPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDLCqmWRfyA/ULEyXz+wrTOIed8y8UA6vDKLCmZC/Ls=;
 b=MW6nhJtHP0nvvGUh3Ngwg4gEsOdxCxi7dmsTWOpsDy43N9URmpe+G952Q445+UUt4BxyoWKzNmSVBtiZ+FYRKKbwgBbDWOy6x6mrkFXdKzB3qI/zGhrxe9jkT4FZDd8x/A6i33wxQ4RYplIpvacCo5tKAbxIt7sH7MAdU1KomugW3qAuxLp2AFsx3dEUVhOyfiwG7S5Z130Gd1fpiOvJaax6/w+iTiUHb2O/RlrBHLPdbfKhRDEyr3sxtG6qTosfR61lcxJNYeFWEOK1jDOIf6vX0Ep/g0gB6op2BOApnfpFSFgmfeb+aLmThJV4oxUQRoba6Qf4gNrBLcBYFNXlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 18:25:09 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 18:25:09 +0000
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc 16.1.0
Thread-Index: AQHc51y7LdmFJJquZ0yht1I3EtfvYLYlV/SAgAAJDJg=
Date: Fri, 29 May 2026 18:25:08 +0000
Message-ID: <BL1PR12MB50321FD4A2BB80590984A6A2F0162@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260519065710.324849-1-neal.frager@amd.com>
 <194ccb18-9d29-4851-9aeb-55b0cb6eb213@rnout.be>
In-Reply-To: <194ccb18-9d29-4851-9aeb-55b0cb6eb213@rnout.be>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-29T18:20:43.7589602Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|CH2PR12MB4152:EE_
x-ms-office365-filtering-correlation-id: b7010729-22e6-4da8-85b8-08debdaf9d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024|38070700021|13003099007|56012099006|11063799006|4143699003|22082099003|18002099003|8096899003|41080700001;
x-microsoft-antispam-message-info: SUMB+iLb1VBX2ISoGZ+5VLy6QqrTQwclFHW0BXwRc+o/uiruzEcm1cIQxeLgPsn6F+qrwWH6etNKx8I1N4A1oSlZCk4zabMaRMUiUfQcRWU6Mv9l+oLSPDUMltppcqlYN5DzCPkOcS9XXkvRNmUaR/2oSj09nxUlQhA59AWyVE7TuwujN4T3tU6HKtqttjRv8Bzvq2aiCr0hxRPeyn77fT+I2eqz3t8bO2hUZ8wh+a1mTm7wUrmCxrMO8mCiN/e+zA5Co6VU12gpWJvTHV8qWMyaSURZR7Alp5fKML4g7iggA8guOwDT1XSx5d8Yk+YldsGpRjd1FhDLQXg9NDVhayKJB2g6nBjKtht7hm+M3iO8PQiqaDJMH+LMexgLMpsAuF38c9RitTJcqTyqZa5/qPlsUauMWNOw3xzFiQ/nUgnyev//6BrkyMh0oAuyleGaDrHIMQqsb9M0iwauFFN8o6HSV31txm77IY0+wjmSkGo7Q7nBMX7JmzrV6wDaujqgf0dOqo3wCmGJlUXzVzXbNuzbXPLSm4KUAvbuWDjLnjNZG/S77Th7EibmUG2oMOB4s8vbIIvUWBLR8gPKHnQG54LFR6gnyVd4qQ5LcvdJUiHEaQD6oEuCQgMDNXl5uSdGJS4lWuVyAfFd5Ipxh6WIoC2dRq6E0eWfbdUYP8mdRuctQGxAUg1T2KZRRh/SVW17R2p433oCmtCRaqvwDl7ALtfPr3lT/1eF3c7q57bnfdbS7e2QP+zsEc0wMkXsCMTHcVH+KOUTehRH70msSLEhYUQiSo5bRlVAmgT09sD4kn0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(38070700021)(13003099007)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(8096899003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?14NV/cPi7WOHxREXcqPJerNGucIrZ1/sie23A0DdP3pBjgUwI8mtIJ6JNoqA?=
 =?us-ascii?Q?wI74Rj5G/PGhAieT23e0+jVWwdRSnY5GVpaOu71lB2UsKPqNvUI89lnXm3E3?=
 =?us-ascii?Q?E0FkR2qXYbEl7qlJ6xPrXNDfyc/vlMebOrWfTzt6B6cBLvI4XdfNYqtC2L2D?=
 =?us-ascii?Q?TI9ttKHXq7LSJs0PizPVENNSJW2DgeHesw5/krfH8Nu4b0ITwZMkMmsVHbUr?=
 =?us-ascii?Q?DwcPADii5a1HGBZ/O98REVrOrlSoHBnAhZjuOxVtzTyKVJTUsElrWK5gMdfS?=
 =?us-ascii?Q?3kcW60C7q3ZG0O0lTPp+5WBeso34U03rt++SkCCRYj7Fl3Sk+1Gaj+fKV2eh?=
 =?us-ascii?Q?n6KUJtOajvdlRjY6xM08mbajx6mI6NpoDrE7LuQ2r7OQwSntrty2IpWxqDLB?=
 =?us-ascii?Q?nek+ZGjgilcVYpwkaaKTqwMHvAZHQ8WJXH6oNkHKCZPzt+sKFr/9yDMdQmJs?=
 =?us-ascii?Q?7MsqirYq2x9UKcKqQuazqLt54KRskGqAHNncjUruKCT053Uq9UowMKJidwGa?=
 =?us-ascii?Q?oE1sO2IsX4S9NoGGpsfmywajJWy9Kw4WHlKrT3GT3nmfex56Dm4m4Ym+7VLJ?=
 =?us-ascii?Q?ByDnAffjCY8RTapm7WTkaJ96SyLuO3rYsHRKjCgPvrPp4jOWxuHOf3f3INF7?=
 =?us-ascii?Q?vBuU1PkPUOY0vgbAhn1jR9RJLitviHST9LHu27bbiWi6qqNmubQ2dDHJpVlt?=
 =?us-ascii?Q?wI2go/Eeo8SHDwww8ZesTKImAdFk9lZ1e2PQs1vAiw3fHlJWoVeDfv5bktP4?=
 =?us-ascii?Q?oGnn2vHicDieJULeHRCyljT2kWy20GscVMKpOPernYhus0687CrK2Y9yOKlH?=
 =?us-ascii?Q?CqEsHx9AkTAP1conHTCmsNxWDp9dmvg2/qoFcRSQkacK0ztET329tnM2WfqE?=
 =?us-ascii?Q?OWClHguh4CljSuyveM6Yvxc+MJFGp/knSOsWrSNhBM/OtB7AUrR+Ryv7bKk2?=
 =?us-ascii?Q?Yidrfmp7kYYgu/HXF8rVJVUIsRDloPqvKrH8tl6T1sjnXnnSu6BUnfC8k7Df?=
 =?us-ascii?Q?+YpAxzo/9aDQUotksvS/P+MRT9KFVmLhTelClVV/zLjMx041RViameDFecj0?=
 =?us-ascii?Q?7/0rd2wSG4kDdZ9nXwm3R0Sqqi9a4/ouLzwgEm6FsS0Oe5g0YBHZVVVxOATO?=
 =?us-ascii?Q?/M+eJNPXvfhz5Xtkx3qmqzbldDGQphIIp5mdW+8eto5ldSpSKpQxbp+YbgOO?=
 =?us-ascii?Q?MvTiWkBK5AdOo2Vc/aBjwj2giH07/I0hCPuJMxRi+VTbuec/9pr2YN+zgwwC?=
 =?us-ascii?Q?IhSmxYsp5T84TE2uSY+pqUtAtktfT0D8FdzJB8rObNU0IoU97xzYTVW9H4jI?=
 =?us-ascii?Q?eSaATiPJIaYNearuJV5oSbCtG0nEYhB0ECHltnD9vI4QCOadrcDwWlfC9v9+?=
 =?us-ascii?Q?EJjaUf5/SgLOGPNmScvKYZCqPvHulETYHJNozOJ2RtEfTet43q1gDDLSYnZU?=
 =?us-ascii?Q?HkEO9V/8pSe87298s+PC5l3E/FTIyh8bME5evPQmtdxR3VKUnGnjhNM/pgOK?=
 =?us-ascii?Q?/j2V/SjX+isve93a0RTHWlMpVH+kozkgsdrrBg7ntP4x3tiD6cjWuk+mKSKY?=
 =?us-ascii?Q?lyb9JhFE9wHxlWs9yhFWoPF7Rr5QMAVDbaUbVIVPKY8KW0S7re+WPaH9pEp7?=
 =?us-ascii?Q?Ds01voL4nb6dLeUDz9zIE6q5tZgIyEHBd72h78EjSUDW141OHvBWUnM448Bz?=
 =?us-ascii?Q?lfP2gowxzsPnW1s45qa/BoLXqgIueOT1Zt4fjW5sSrsQVETkRKaK54aFXonF?=
 =?us-ascii?Q?zNEj3QomYvGGAQHNAXLy1AxZg75mPOEc7t5eYDeSdSfczbLpbFs0H4DxHnGS?=
x-ms-exchange-antispam-messagedata-1: TaBT0FcllC3PDA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7010729-22e6-4da8-85b8-08debdaf9d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 18:25:08.8893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWVVt5N8jnRnAoMGX99q6JqLJwL1HdRcNLa+Bzg9I/mRutnLyms3nqdqQhs9Xs2T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDLCqmWRfyA/ULEyXz+wrTOIed8y8UA6vDKLCmZC/Ls=;
 b=RacDxh3094c2WlPQR47xZWZTKL0jNb+F3j+38FPmCGzNPYgcRjoJQktcLqQXrllrf2G7Nvcgo3cAuXBSFMAWIrE7JAjnGgv6Ga7ENIFJAw1jK/vr/mmNOoOkV9VDfWTVyLzjOO3kRx5CW968RTeVqqAsfYclLZoNJUMYHOgzImQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RacDxh30
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============0139128692223540114=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0139128692223540114==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_BL1PR12MB50321FD4A2BB80590984A6A2F0162BL1PR12MB5032namp_"

--_000_BL1PR12MB50321FD4A2BB80590984A6A2F0162BL1PR12MB5032namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Hi Arnout,

> Bump gcc-bare-metal to gcc 16.1.0.
>
> See here for changes:
> https://gcc.gnu.org/gcc-16/changes.html
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

>  We'll have to take care with applying this, because I just applied a com=
mit
> that introduces a patch [1] that has to be reverted. And I can't apply th=
is
> commit to master because it should go to next.

>  Regards,
>  Arnout

I will make this easier by making a v2 that removes the added patch
that is already included with gcc 16.1.0.

This way, you just need to apply the v2 to next.

Best regards,
Neal Frager
AMD



> ---
>   package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-
>   package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bar=
e-metal/gcc-bare-metal.hash
> index 19678dec30..6104962a22 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.hash
> +++ b/package/gcc-bare-metal/gcc-bare-metal.hash
> @@ -1,5 +1,5 @@
>   # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
> -sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2=
ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.=
0.tar.xz
> +sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b=
295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.=
0.tar.xz
>
>   # Locally calculated
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564=
c  COPYING
> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-=
metal/gcc-bare-metal.mk
> index 6c2c8a5e26..d4f011c2fa 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -4,7 +4,7 @@
>   #
>   #######################################################################=
#########
>
> -GCC_BARE_METAL_VERSION =3D 15.2.0
> +GCC_BARE_METAL_VERSION =3D 16.1.0
>   GCC_BARE_METAL_SITE =3D $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERS=
ION)
>   GCC_BARE_METAL_SOURCE =3D gcc-$(GCC_BARE_METAL_VERSION).tar.xz
>


--_000_BL1PR12MB50321FD4A2BB80590984A6A2F0162BL1PR12MB5032namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
AMD General<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi Arnout,</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -=
apple-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; Bump gcc-bare-meta=
l to gcc 16.1.0.<br>
&gt;<br>
&gt; See here for changes:<br>
&gt; <a href=3D"https://gcc.gnu.org/gcc-16/changes.html">https://gcc.gnu.or=
g/gcc-16/changes.html</a><br>
&gt;<br>
&gt; Signed-off-by: Neal Frager &lt;neal.frager@amd.com&gt;<br>
<br>
&gt; &nbsp;We'll have to take care with applying this, because I just appli=
ed a commit<br>
<span style=3D"font-size: 11pt;">&gt; that introduces a patch [1] that has =
to be reverted. And I can't apply this</span></div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; commit to master b=
ecause it should go to next.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;"><br>
&gt; &nbsp;Regards,<br>
&gt; &nbsp;Arnout</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">I will make this easier=
 by making a v2 that removes the added patch</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">that is already include=
d with gcc 16.1.0.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">This way, you just need=
 to apply the v2 to next.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Best regards,</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Neal Frager</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">AMD<br>
<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-<br>
&gt;&nbsp;&nbsp; package/gcc-bare-metal/gcc-bare-metal.mk&nbsp;&nbsp; | 2 +=
-<br>
&gt;&nbsp;&nbsp; 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-=
bare-metal/gcc-bare-metal.hash<br>
&gt; index 19678dec30..6104962a22 100644<br>
&gt; --- a/package/gcc-bare-metal/gcc-bare-metal.hash<br>
&gt; +++ b/package/gcc-bare-metal/gcc-bare-metal.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;&nbsp;&nbsp; # From <a href=3D"https://gcc.gnu.org/pub/gcc/releases/gcc=
-15.2.0/sha512.sum">https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.=
sum</a><br>
&gt; -sha512&nbsp; 89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd=
5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de&nb=
sp; gcc-15.2.0.tar.xz<br>
&gt; +sha512&nbsp; b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21=
013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a&nb=
sp; gcc-16.1.0.tar.xz<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp; # Locally calculated<br>
&gt;&nbsp;&nbsp; sha256&nbsp; 231f7edcc7352d7734a96eef0b8030f77982678c51687=
6fcb81e25b32d68564c&nbsp; COPYING<br>
&gt; diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-ba=
re-metal/gcc-bare-metal.mk<br>
&gt; index 6c2c8a5e26..d4f011c2fa 100644<br>
&gt; --- a/package/gcc-bare-metal/gcc-bare-metal.mk<br>
&gt; +++ b/package/gcc-bare-metal/gcc-bare-metal.mk<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;&nbsp;&nbsp; #<br>
&gt;&nbsp;&nbsp; ##########################################################=
######################<br>
&gt;&nbsp;&nbsp;<br>
&gt; -GCC_BARE_METAL_VERSION =3D 15.2.0<br>
&gt; +GCC_BARE_METAL_VERSION =3D 16.1.0<br>
&gt;&nbsp;&nbsp; GCC_BARE_METAL_SITE =3D $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BA=
RE_METAL_VERSION)<br>
&gt;&nbsp;&nbsp; GCC_BARE_METAL_SOURCE =3D gcc-$(GCC_BARE_METAL_VERSION).ta=
r.xz<br>
&gt;&nbsp;&nbsp;<br>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB50321FD4A2BB80590984A6A2F0162BL1PR12MB5032namp_--

--===============0139128692223540114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0139128692223540114==--
