Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F1DC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 15:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB55A4167F;
	Thu,  7 Mar 2024 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAMlSfS6xZcp; Thu,  7 Mar 2024 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA8B418D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA8B418D1;
	Thu,  7 Mar 2024 15:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3611BF59A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797D481371
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 15:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqKH5Erl2suk for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 15:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::601;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9440E81355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9440E81355
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9440E81355
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 15:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8DTcZp8LXQcmY47EMjRG7fSiY1UZOyqER9tEyyQ2iWB2HLk7laY/SxBbCI+aFCn8cpEbE18JodbZKeLWdROmAcfaOTLfuUZ9YnPQ313juYEazwybwM5C3gSLFHKhm5Vj7pZ0LoQa2jBEHCgStyNLGiyy0FsN4lEKGIf6GEz3tRrmREQZXlwSZH5aK2VmBKOBX1dGMzijYZS9MFOHxn7xJ2CDjzY494lAUxa67lbP+d4O3AUJHQcaxl0ozMDMiOIEc49NOYp3iieO/SAilYBaRbnGf6qO6ne5S/8ZF+pYfsg8XBASMXYXR6JpXOcFUZSIxBCHRQA2QSPZvhkYOXxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RKg0vjDuR6nKvs6eOW7Ikmocq2ve+TOy/M6ZTobIPM=;
 b=S4WGEeR4vay6IPIAb0obNI6/ZOs/aHI2IJSrK1m/7DRU1mr5AL4/L/8nIEoI6SiBj1nw+Jv+1PfOIHoxQs29Sa7VTIBr6TCsNic2mW2HEFvn2nCR2fKoKWrGIk7YoxRmE6a0nlaf8Ns9sDC1jutlWpd8rJQVRww018Rxp7vzOc/CHaLPzlcErReS47lmCRW0Mdh9ZEOgcZpOTx8jDxIUUrkzwhXJ3Y6i+lMueWjulMIN+onPNmbNm+OsHcYrzZkP86CS2WQNJdojdvdW/6YvYN8SAffCCnfQpRp7VHSfAGyjvOv5ExjXsEmKWpeNRfgHwrmU8+dK1HJcKBNtZZTGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 15:40:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 15:40:10 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v2,1/1] package/binutils-bare-metal: fix CPE ID
Thread-Index: AQHacHunbZp2CDVa/kqwcN9+TnCNXrEsakFQ
Date: Thu, 7 Mar 2024 15:40:10 +0000
Message-ID: <CH2PR12MB5004B84B6B778DCDE223BDA3F0202@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240307103848.27961-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240307103848.27961-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH8PR12MB7109:EE_
x-ms-office365-filtering-correlation-id: 83723f2f-52ad-41f8-b51b-08dc3ebcdfc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsJaRZue4fGWNIqJvBhCZKw8GIx6s8Cil2Bl1LxXjm3i5AjyU7oD97EWcp9w4POOb7VbtrcJzXXOC36A42vopaoSSmrHLgJ/EzllnYQfiqseEU1H2tH7cjZWX8qv3Ykfmk/0FyqLmmgAmAwCJR/0kzUYzB+4X1HHZVn4Hohginc4fSIkZ6R4rollO08VAZU27+XT5WrvgsFpEHhKm+xdvxWVeJdl40YsOo/boaZLpyRO2b7Gyu+CInc5UCCWTdJiSwseWGszjKTTSc2VNiRxG0pGulzgUUOdABbwOqcAALu50UfVx/JstFtqr+Hhu84+oi9N4DlCV3ZUoSNUgQCKddDHfBKvArEzHuo47a17NKyVMAIzEn+pEN09mCcwv4TYzYSEvA0nBTvChmmlDarvonysVcx5LzC/YDyDKHE6rCfvsjwwH36hUkeF7rGwTt1NDyVpnJM8kiVRFhBa9algQz+mGd5fEXsdZGxN1hEa7h28AuPyqeNVEFYYyJCraPDEkEPp/sCqYxXtuxRZ43j3fo/WXY1kUVejwnk+1IR26pMbRKaWvHAiha90WfsBHWVxEG4M/LjGfBhtyVch9Yp0+z9NeYpeaTg26XQKWXzAeOCD0oehb8chi/Lbf/qbLK+4G1P4btIivYjIPVbNOO43r39URPo+i+ETMIvTULH/RiDZ9TdNVgAWt+mMd7xfLD062YMyKIKc4MfyjcWNdHiosHVNqmKZAuetXo8FDjxWN3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t3R1zv5LugOu5ba8OeVSWt2MwfLRQz16X8aOZZdq+FpuaRVPfltiDZYqCznA?=
 =?us-ascii?Q?kzl0vrHlrXIieFTo3W2HzBx2RgVrGaC3mbjrrM65Ff+m0MVYFsyP7fcH2vwq?=
 =?us-ascii?Q?lheFzy61QhgMYJjclOOEJlKmDqgwEwzYPR2pzF8fLSrmL1KW3zWeW+nCjuAe?=
 =?us-ascii?Q?c7NnGkNLpYLSprYUhMR11MGbBFkseKbNkYAlfla59Fn6f/aBsbJqV9/QOSIk?=
 =?us-ascii?Q?q4d3La33jBpR+YtW/svAg/0H95IItZJwGTGKemxkZjnGW/f4ZmFZF6q87GVZ?=
 =?us-ascii?Q?0rfNKYPZ1VOyK7EDY8b2nJtE60yXgOWoTnYATigpyq5tXYAw4NnRL9/bXlZ+?=
 =?us-ascii?Q?WNydbUShv+LpdSrecbKP6L4pRebpslS4yc19VQwltzJNSdiYZdch2xT8P53P?=
 =?us-ascii?Q?i/zdtG66NOC5XBQk5dEvhouLucAgSt29tqx4/gDs78jc/jpohty3vnOflIEm?=
 =?us-ascii?Q?TF9OGNkemq8wCUJOfT0inYJ6kR604ciRA6pZbItGygmzrF59sxUypIsHOhzV?=
 =?us-ascii?Q?u4Ma/WHtPD8F/Ukm2hEsChAXF/+zxacHoIl6wq7/qwxS83vX/2gfNDY3LRB6?=
 =?us-ascii?Q?UBRvBxflupPf+pEugw86QKO/H1OKzOWgZMqAMxTmQRDZXy5V/FdosT23dtOF?=
 =?us-ascii?Q?8ySJrHGC+BqwA0hTJFEQ0ToStAyXHF3meKgpVcfzeT4H1Hsud2XAc/obScc+?=
 =?us-ascii?Q?bA5svK7PKp/hjGTPdwhPGaOuJaDHuoVpzwVkRDIyBAuh0E0SuIjykS8oU6Kc?=
 =?us-ascii?Q?eBc9+fNMv3xxsZZhIjzApKWpiNJOyJ7quyX+HrlyZKhitsZY5hxfAELuYTkr?=
 =?us-ascii?Q?v+3/SePju+fY9b3C+yjey3kBYWZKvu9bLSXfd6cSRyeHnpqmS/Ic1yI8lA4r?=
 =?us-ascii?Q?7r+5XBandVnCa4k9rk5fjU+UBFpJwkSPMzTCO7j4ttHH0e6r7JT2QCRppif6?=
 =?us-ascii?Q?Uowu/51Tl+OaD3XM3XtYp6sVXfJWwD4LkDNd1h8cTa5DTpRNTVVahz3TS5om?=
 =?us-ascii?Q?WvXkFvaPDZxrifnazU8gHtv7523szcoW5GQ6CbJx88RFF23q0i4NbEfi2LQT?=
 =?us-ascii?Q?xlDtzCdDYapJwlCX/3+avvhOQqtpuf4lej1PldOzOQEUlYSv0UbmyNWVEAYM?=
 =?us-ascii?Q?tDpLv0/xnwEf82z1UBxZ8t5lMxUNDpVm/hWUV3EkZjSJBUUAnCtkIXO+jUJe?=
 =?us-ascii?Q?GZTwBf2lA8Qvpx458uNXRArbX9BxaYBpJ5cUPTIi4iFo2J1y53Hcv/wZDVip?=
 =?us-ascii?Q?uvFxYx41boUvkmA2+PqLxav2Hvf8kT4nxUOZTczRpNx4NWBiKCkU4ph1fmEX?=
 =?us-ascii?Q?7FCtZbqMGWTnKR5Q5ie6oJYurrYY9NJ1Uaa2zLQX/ZXj9AWdnf50SzqHx/4b?=
 =?us-ascii?Q?Ai27RdcRCUpkqSlodmHr3CEp0058m2XQwFrNbVKFhMjCLGbOm1KP6F4tPnuf?=
 =?us-ascii?Q?wyZteyddNA+NNhUypF5s3ysdPAmW5hxLcRnNSqXoWEG7YCCg1hKx7FlDkf4I?=
 =?us-ascii?Q?SzoVcXlQaQLV96+JOZZyadm6BnGJXJVinzOT/EvfUacPtxWeDAdCWW+7MgVi?=
 =?us-ascii?Q?fYCatwMKCfTA5pg+RKs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83723f2f-52ad-41f8-b51b-08dc3ebcdfc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 15:40:10.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yTPAGnvYeaVHmOFDbgdPY93QhgpKbNGCqxbLTeYzhBapzilUAVGsjeEiy2P7TI+4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RKg0vjDuR6nKvs6eOW7Ikmocq2ve+TOy/M6ZTobIPM=;
 b=orfOkL1VR33HiHWFXUwVTm3TyLvIp4PkkCgBmulvcFIywujOoeGtuA18g8CTuSx4ejI2ZdBQFm/h7FBrfve+yZ2qC/nVESKRwGNhRu74yf5zXXfHJz+tiaCcr1nZK1uiB2RhoTgFBmSKIQMphME7tfEvLIMbigXRNT46sXQ9TWw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=orfOkL1V
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/binutils-bare-metal: fix CPE ID
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Neal Frager <neal.frager@amd.com>

> Commit 11b439ce1bd28506051fff14646f8bbdbbbe58d8 forgot to set
> HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Move product after vendor

> package/binutils-bare-metal/binutils-bare-metal.mk | 1 +
> 1 file changed, 1 insertion(+)

> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> index d55c2d081e..778a5235f4 100644
> --- a/package/binutils-bare-metal/binutils-bare-metal.mk
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -11,6 +11,7 @@ HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).t
> HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
> HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
> HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
> +HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
> HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
> -- 
> 2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
