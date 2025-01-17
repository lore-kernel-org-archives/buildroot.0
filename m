Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85926C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B1083BD8;
	Fri, 17 Jan 2025 08:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOIiGF2g6BDc; Fri, 17 Jan 2025 08:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D0E83BDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D0E83BDB;
	Fri, 17 Jan 2025 08:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC11B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45D596FB50
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBMnDBoOtldB for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::616;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4065D6FB4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4065D6FB4B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4065D6FB4B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOM9jiizoDDjDqFHJd3Bp3oMkgYAj7UsuMH1VTurcjzI5aWhzFbPCLMjHrmvaxM+lqGt1GLJkSR8/6wFAS3x0cuYIZRnoAP8cbvBL7q4bLd201HYANqa1mgl7W8qEFmKo9lHkksoAnBu6sBgW5aJ33dhfBSELC7AKTE46TTZKls2zIzmU2FSz9dntWPBRCqWlpbYt6OrR1w3NgcNJjSbWnHEC64Z700Xsda4kxX0Ax4/NYco4mOhN5SPw920fmxSW2Pg7qaZGhESN7zMWIUO2cRKTpkZlZfghYH7gAiLuSxHnykOjgquF6NLonWjnwqG9q2mZjh+GsCGRV36JMDwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU0khCTeSd11dVusuJhVzdJEiVIyxUWcEshNC06f39U=;
 b=ZEPeWYYGSM4WxKUbB+Cu5xp4GBfaXp/WYq9rkKptEsDHmh9eDH+bQfTud0PAx8ZzeAlsiLBvGiuyhe9vdJnHRZ9teAUI0MPOGozPFmzomOH0uX7B6m/PIc1+nOrSu+S4mIplbkdurHMtx/hE7OS9adavPWrHcOntWwySV0jqMffR7x7hr1oPwk0cq84H6hhvNGOb332cBD4ceDF4Ka/REGyGK8nHV7jwmXw/xbScdY1nr5FlBseYFuk1ErYygwiU+vPXM8enrDc67P1JsqfJGKkn7qRcNLmE/yNFMG2NsCmGXRt6KENyfiejpu5chQXXN9RPAfCp0gejnMGviNSxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:26:54 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:26:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v5 4/6] configs/zynqmp_*: migrate to binman
Thread-Index: AQHbaLXi2ZXN8rO65kOXxRhp1twOlbMan1dA
Date: Fri, 17 Jan 2025 08:26:54 +0000
Message-ID: <SA1PR12MB56151FFC38BE2D8926ECBDBAF01B2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
 <20250117080009.774814-4-neal.frager@amd.com>
In-Reply-To: <20250117080009.774814-4-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB7322:EE_
x-ms-office365-filtering-correlation-id: 570a9935-59bc-41e1-ef71-08dd36d0b2fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BcjyUWJWRtT92GzeRsfjc40Z0fLrN6fcj+wCJRgvIKVkGxLsrrjPrWsVkPcA?=
 =?us-ascii?Q?VyMPjYf9Tp9sBgVdLoIzanGw3XtSs1OL0h5emaPluFGmoSrFaAB4RREbg6X4?=
 =?us-ascii?Q?5vBLHso0v7cIk33MyRBlizcGJuR6ddKAeLQztORcUwV83NesByjalhCV1Z+E?=
 =?us-ascii?Q?neu8MlCFZ5I8qAj+ViE0i0KoZdwvRWMcysMqnydr5MhbE69bGBeB8GF5JRtn?=
 =?us-ascii?Q?BqIvQ6I94kKV5ZNEMAjTCdKuYLDAvEBgAn/MJ+6y/XaKTXZxpwgFv9CFx2oP?=
 =?us-ascii?Q?UaSFbv8tptFq9EMRl8hV7c/Zj2csSeYm/kzAOXefGi3gZ023vbQe81knW9bE?=
 =?us-ascii?Q?tHBECmzHBBhc3caKOx+0sCTMTx0zz7BBPROV/CzCywnBTz2oL4v6rRiATYK7?=
 =?us-ascii?Q?nS64otC7d6Bau6t3Cfd8oawq2XALFBh/9R944kQOgg0G07c/gi2UHim6ALLW?=
 =?us-ascii?Q?cohLVmLCtZYi0BbWiJNSbrAo2qSaf36kutMx6Jyz5FZyIqzTVTdL20yi7qCj?=
 =?us-ascii?Q?JY6mznT7sWaTLAz+2cRC9ttcFQ8xqHcazhVFAeFVnY7PQqby6+i18Q2yEc0J?=
 =?us-ascii?Q?uze5PQnxfW8AAqD+iZVy447KgKHTXVk7jyJu0tn53cIn5584yPQ8DyBd17gi?=
 =?us-ascii?Q?sah7L89VWTY22Wig5ssO3kEbxM/yXBgjRBFZPYNvaAm+riuGcqSE7hhKATW7?=
 =?us-ascii?Q?/5QILDHmP0dq9zeOJt+tJ1JkqPcnRgXRkfvvp16enW1tNwGYG5nzwruJFWwS?=
 =?us-ascii?Q?pskEQ1/8QfDTzQyuZzmh33PxkhoxbO0++rAaDHoJDd3beQiGCr9AmPXKs9XQ?=
 =?us-ascii?Q?qvXtotIhgqBAm0GqS/7O4Fw6WmxzGm532idncFq7hMUi/oaKuo04p7aP0wQb?=
 =?us-ascii?Q?PWte3X7HhV/sDbm5t6wMg4o6rZcTpGBh2yr1gWk61aZ/gJxpkBWD469B84Ca?=
 =?us-ascii?Q?vcDHuvtf+eFOK6WDhr5ySxbZ3o3wJ+rfo6VARpkuOfQIWkuM7rPoQWM0QRMo?=
 =?us-ascii?Q?WaFOKbkVsIAhonrSDPC6VxDV80pJT/UaSOpOtg0/ZjPycsYAhgdGN2tKkPIn?=
 =?us-ascii?Q?C8mhlB3GOcMyuXhv08xAk5ihrYIxxcJZh73kcjeWEhXdAsZut+cwXyQrdHxS?=
 =?us-ascii?Q?Bnz3CjNZycSHQzEuYs2orhKbD0utoseQ7PyrNtluNYy54akZtdfSsmi5H0ML?=
 =?us-ascii?Q?1e6JS9Fb4Bnd537+l4LvuiZNA9RIOpykUeWXdRhb17BBvRDT6XQ9UZAF3TPz?=
 =?us-ascii?Q?pfqLEqxdyyssclLV08B39uVIAkBZnXWvRZCxhPcN/r9UxLVmaLN4lHdjUxtI?=
 =?us-ascii?Q?/coZudj6fsqqM9Nf1lUnJrAw0N3b+L/hwzcJowA6Qg0CH3q4iFM8AqKSoSmO?=
 =?us-ascii?Q?7ri5dOMdU/FA3IITTX1+EMmAS4zdj233pbgi3RFdnpUnVDUsXD8kARlrw5/8?=
 =?us-ascii?Q?wwvFj0RcY+NlCfvXcTdKx9bR3t4e/Lhn2VShWUSonwoT/I99TbSuEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mNrU01A1l3YEPfgdHKuJFLBTZ0VOtU1w4kgttUat/D9amO1TCNgdhQE948Mx?=
 =?us-ascii?Q?65+tbm2Cx88ZPY3omgxrxmGAv9iqCZGNaDZj9BAsvr1Msfxs1aOP2sk6sOd/?=
 =?us-ascii?Q?rkEOFVQp3vU2MxlxWTtsL8kb79i69TInhFoEnwsR+x+uk1t33rMiUhLYNWBR?=
 =?us-ascii?Q?NQACU5hSy92o+C4+qKRNr7PMoJWQ6cK+yVGkQMfR/n4uxBd2UTgTfomunxIX?=
 =?us-ascii?Q?PiiY3K8aVTOMIPYIpFNC0fOpMbGSbIPtOlyFDg7IH9Xi4nlZ/3Ard5r3msla?=
 =?us-ascii?Q?pQ1Ki0xaW4hkFYlY9/2j4K13YnZJaNT8LS/JuJCaPqgHJBwDqzH6csmphFOO?=
 =?us-ascii?Q?dhREAs9YT5DNxF/HYAxMRjdYdBIJAuIVRztcVoTrtTB3deSAbbcM1m/iQDSm?=
 =?us-ascii?Q?ZJSRm/ga2aAaEdz0uN+htI0E4V7+CiU/PT4Bzl6FVl8aZCZ9+FC71AIXM5xm?=
 =?us-ascii?Q?ue8MAEGA6MtCpfw9LySwJgMAaR7OtSuX06cj9sH+Hq3Rlk+s6AXuXImT6bvK?=
 =?us-ascii?Q?sqJH0oGoRzIGdFxIzm5SL9z3Go+uLVCeIH0xOPaXvd8k3zQY4gfsFHdzpovr?=
 =?us-ascii?Q?X+EWittP6GUO/XSi4ieJL9KL0C7ezvz9mj0/vMe1ZiuACy+WhhJzc216t8DA?=
 =?us-ascii?Q?jSnJpFbEBzHqrBEGbapZkfBkzVJbLu/0jKwYeOEbjtqD6Q3ZwfKLvH0OmHyE?=
 =?us-ascii?Q?TLaFIPPP71UKe6ImudWOxGphwGdTWewX7Ndi+wcc2EmNKdwsI45L2X2uj1Qs?=
 =?us-ascii?Q?weiIR62w9H0zY+aKb35IYRBsxfaVhxqw42/+jladR6lv9qbxKUVaWbu9sqOO?=
 =?us-ascii?Q?FRK/icsrOI6eUPny7ooq+kHoOnyDwwjrzr7juPGbp6R/HqyWTeSZ8ujgDrgJ?=
 =?us-ascii?Q?xQRwj2itB5eI6sVTpuqzhlQkppIKe+cPIjEHNTWxsXpCZLvRKLmM7lY87Mg8?=
 =?us-ascii?Q?bExknG5UUf/FdnSuup7bbeJ982reNUTBW/5suaZqrx32tW4OKsuDEsEJq3hj?=
 =?us-ascii?Q?je20LqCeckpuin78GmZqSO7HiwKWgqDEFprZh/fzTWb6yoDtxMVENHVBxg+0?=
 =?us-ascii?Q?5d4IZ6HXfrNR+lpNP5wvhA9JfWxNKWfqrE3JOETfr7geE+gxgquVpv74Wfkv?=
 =?us-ascii?Q?JAdZPKk0bgJ0dRVh0NmJuBUQ79Xk/bUrijC8XA85j2QqH59OeBIQ7L7bV0CD?=
 =?us-ascii?Q?jNEQXL9Vc1JsENtKrjGZ2tfIBF3MSSmEVyRtCTPcV/9A/WXA+RCVE/m4uktK?=
 =?us-ascii?Q?Csl4kE6jlszLfoO7rrSVCR0OYhHHqV+IZttPUyIlptszFT6kv4wIlLtQFH8M?=
 =?us-ascii?Q?HErBhvF42yT5a8Sb8ZggcvMoRARQsGqPvhbEYDHfbeicq/gypTdBfziAU2c5?=
 =?us-ascii?Q?orsD314PweqgSuNvHi0K3Y1KsC0tpyq6G7tn5DvWrxKfCruZloYVi5HyBMlh?=
 =?us-ascii?Q?iyKjyeTUNdgfWD9l3gWG/y1+6B/UvW5dAk8n+7XYeLwyuZ8lbR5+BgF3FzVt?=
 =?us-ascii?Q?BcO2uTI+scT9uEgZXucsM14MeKDP4Ypf3X90aeIYKpAnTDu14YUk9/pX51dz?=
 =?us-ascii?Q?Dvx46Evwfqz8HybbPIg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570a9935-59bc-41e1-ef71-08dd36d0b2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 08:26:54.0561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fx4OAmL+dAOkaqDrD6WIOLgcszqfDvCokMFOjHkArbk111CDlVlI+TFMVRBrGjJT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU0khCTeSd11dVusuJhVzdJEiVIyxUWcEshNC06f39U=;
 b=H6PSdySMAylhNpoR/cInFX4RVoJFcUUYDud0ymO/TorU9kmXR7iGA/OBNtpIiOBSjidwgaSgnVjDvZuaaGK63nx8o+B4YA1rGHgXqh3OAPkfSQi8vcALmIKRZJpGicrVPaTBJbwDnfpsVTlIxJ8WgxPDV2grg4aFtvqchI6uyy4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=H6PSdySM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 4/6] configs/zynqmp_*: migrate to binman
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
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch migrates the zynqmp defconfigs to binman applying the necessary
> upstream uboot patches.

> With binman, u-boot can now build the correct u-boot.itb files for kria
> natively.  So the post-build fixup scripts are no longer needed and can
> be removed.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - new to patch series
> V2->V3:
>  - squashed patch that removes the kria post-build fixup scripts
> V3->V4:
>  - no changes
> V4->V5:
>  - rebase Buildroot for zynqmp_kria defconfig changes

-- SNIP ---

Since bumping the zynqmp and kria defconfigs to Linux 6.6.60, I needed to
rebase this patch of the series, so it can apply to master.

Since absolutely nothing else changed, I kept your reviewed-by and tested-by
comments on patches 1-3 of the series, but since technically patch 4 is
"slightly" different, I removed the comments from patches 4-6 of the series.

You are welcome to re-add them once you have tested the rebased series.

Please let me know if you have any questions.

> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -1,10 +1,10 @@
> BR2_aarch64=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"

This is the line of the kria defconfigs which changed and required a rebase.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
