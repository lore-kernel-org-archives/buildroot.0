Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34056C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 07:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B923A41BA5;
	Tue,  5 Aug 2025 07:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1nMMef5--rk; Tue,  5 Aug 2025 07:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B939541B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B939541B8C;
	Tue,  5 Aug 2025 07:30:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91DCC1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 07:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85AA640093
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 07:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIFsZ7j3bgSp for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 07:30:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::62c;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6472D4005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6472D4005C
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6472D4005C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 07:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcU+wwOZ/yAa7hbUC1SW9sG5P4ReVJMlCIg8eIU919zvPyzq/LX61HFH8b962stVXmySkMNMMz2TjllAu3QWVDkjQ6LP/VMiHZi/O6cIxOLNGhiG5WIAem5Bv8AxE2KICIGG2vYDuv51kKnW3IkZyGGP5tI+AfXJaCTRbqTpWqvkF/QbdtVfar9pmp+TI2GPhJ1yWLXqtM2S1ToAaNa/uxOq4EWSJSTk0j5y2E4QygUhS2bYShL5Bu8NnRhSlf34XW7N54AWSo5sFrAVBcXGqLSEFhhCRkzc+OG7eIwiq1V7jTpKN5KQyU8hu0QpOAN4eW1hx8lfVk8laqovQF/pOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIjLZGv024M9GcsPm+PNGvT52C9r98d8YD8Wg4uXp1o=;
 b=kesYhlEabPRChokA3MMXeQqzkyXmFWZRe+E9aFses53DBpYi7fHNM5VdxLf5hfdy4y5R83I6tjSMzvEqni8Zz90P7FmGjaAcnTqMiKINieO3vZ57IDEDnlwiCoFKjQOiCBLxhEJeo+IeakQvcIu8W/6bFUov1J8KlNg4dHnUsFixsIuxODUCUhMFINxzH7Kwk2vJPeoxV68Y14FmvBwtAWkB+EWP1xMb5YdhabAwXFDDdAqbJjUYFfYxHRkXSbqdUO4rixx4t0jfUs/6UIXf+/k9HzN0zHhpm2W67RxSNYtewVchZURjTzlwHBzxsf5iWsDS8MPA7tMYRqmCldU21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 07:29:52 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 07:29:52 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
Thread-Index: AQHb/3tY44weAeBzXUS5kQIFu+ZUxbRS8GKAgADFLBA=
Date: Tue, 5 Aug 2025 07:29:52 +0000
Message-ID: <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
In-Reply-To: <20250804214047.5cfcf471@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-05T07:26:28.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB7769:EE_
x-ms-office365-filtering-correlation-id: 197ca514-a792-43f0-e2c4-08ddd3f1de69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hCXv1/RIr/b2b3b0T80hgybppFYm90fGA/jsms+3LBWtN/7QGJ7ipZk25PrS?=
 =?us-ascii?Q?QCJ5PjTJIE4uMFxlzCUYGzltNwafnR9pOvhKBxh+C0qmV8JqyIRD/k+ifgIf?=
 =?us-ascii?Q?XjAcRTiR5epl7bPibOhQVRfvKwbkHQsAv25llrJrBf1hAbllEdW2onPdRnI8?=
 =?us-ascii?Q?yHEo8J0xUT+ebysakc2EPQl+ur9V3jsi/JxJdOFidJje5fXnse4YEMNLXRWc?=
 =?us-ascii?Q?N5iBgoEh3ou5fb3mWQiVAHw3KqdbuayH4n+BNZpEC+fKi7ZgoEXPqMx2ZsPY?=
 =?us-ascii?Q?FyOk/CuGI9X6gA+uTGGVB21PXxTvZkXIM5V/q76XQSTMk6NG7V4F4YBGM3o6?=
 =?us-ascii?Q?t4J/WD+Bzg8AZT0ENPeq/MfczROicJRKf3Qodd3iFqa+z71DkeoV5rEukIT8?=
 =?us-ascii?Q?z9t/KVki3z0a8speCeOMYmYk+TJkjKR8OmmHpmbOMMwj8zDsrjgut1oQvVqb?=
 =?us-ascii?Q?fpHLZqbmNbA7MuzrmGWt1GmamRj/aviM4IQzKL89x9NsM+7O7DOorpbX4gGZ?=
 =?us-ascii?Q?gjnouNtnIMv2T4Sgp0dDcGOv9i3owWXNEm/z+JWntQ9qhqXoQ/LFjy1+/syw?=
 =?us-ascii?Q?66GkhBqhT5QtMJxX5b7BMKz7bfCpANUEj+mnvHmpwXGtrML22hnT3RI+2Agn?=
 =?us-ascii?Q?+65HM0Ie4rwtZ7Am2ZVNU6jZsEPYTAjHTEJUdt2zQHK4t/bMgbXOR1kqswBf?=
 =?us-ascii?Q?9tIO3JUIvPRDkkR2dMpnayburH34A4SkHFMd7YCl07wu1g9ZhWuP6Y4od3dY?=
 =?us-ascii?Q?g0xF51V9ZHLzQoGC1mJMDTFAWt3Fjup5DIB27dBA4olt41I9To6XybznXy0E?=
 =?us-ascii?Q?w/bTAUHO5cUffLQ4NyqKYyxaiEQFoVNAbZyi/au0bPr+2WFnILxovtmIO2+O?=
 =?us-ascii?Q?V2l0AyGJ1W8CKm+/etqShKySHcslq3wryxGFunGQsQXawn+hBMWIkq0lMV7D?=
 =?us-ascii?Q?bi0G/PB3MlYv6Ggn1Kq+xlq2oZCq0Nbvliq89wLszBPz/mJi5G7cKwxSgEiE?=
 =?us-ascii?Q?54jPHn54U62DUBxIU2cYtW2e8MxgjMdfasAF8T90iGY/EzPYfHiNnfS+f0fB?=
 =?us-ascii?Q?vxK6qgjuqCtJzoei+HZdoqFCZAZx8uQB0qfjckFjGKSweSj7NDl3oOoYRaGM?=
 =?us-ascii?Q?0mhR/YnOQFCG+Ep65cOgN9zZWCFaH3zEqkGZWgx7cPOzHzf6jiAWNQAnrPSf?=
 =?us-ascii?Q?ZVrY+AoL/HsLIBxKYww6lexosM2xnYidL4VeQC+qdYdK3OdC6yRn5NDUTH2c?=
 =?us-ascii?Q?iilfqxCHFtbqZLGg8cKNYUV7xwqMxm5f8nx+1mplap5WWbg4Vv9BO41NTVDa?=
 =?us-ascii?Q?cJO/SIcbPY1IndUw8CKXgCMyaN/RM+MniXyxyMbh4OyuGhJ8US43AGp04a7r?=
 =?us-ascii?Q?AeyVOvCX3ZfqM5UQrneNB8T6kgI6rzL44NQdAmJSsCKeDVwOBgZNfIPztzZ4?=
 =?us-ascii?Q?OEe1qcslnIABuWrnVO3MtU49NGc3E/g0B9fjEmSe2pWNg/0PWeEYZSLsvYt8?=
 =?us-ascii?Q?ftI35YQYecFHMHVasR7VqFnN5i8NDNY1aM4G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GPq27Jfh270Y6bmZsHmQlbmUEI6VOey2AQeIjWhLA11LviwCe/CVgaCrTQhp?=
 =?us-ascii?Q?TN5WD7bxFzCtLZpwtXJBUP4rpgPa2zn0ErOSjCNiIdedj44RzUEUKNxFvDlo?=
 =?us-ascii?Q?8ViqZKfgbqcKSV6zlyKxcDD44+MJ4XrIZ8bFHkyVlVLiEkI2wADdNIx6rDxB?=
 =?us-ascii?Q?hxcj1l3N/HO1H9HKxA4N9dGOABY+goWWdma7rPwao7j2BVssaCNL8se++TLL?=
 =?us-ascii?Q?tyadtODd5Uxmy0U0Dy5PGq5eK/0xDNWneWryZP+6jpuBDQnx3GotnxYzW+mM?=
 =?us-ascii?Q?jz23hWLVcw7J62oAmllsKnuadYqGSdVFlb0PP9KHAhMBNcfonznrqS9Q3rhR?=
 =?us-ascii?Q?z9A5enXNFwPHKZfBV9in+e/Sx562O3gkYz1XvN6XMdwmMEKNDCXlJ7eaOY5v?=
 =?us-ascii?Q?k/ReeZ9GTHSVCDAGZqwINtZLAlYBeDav6IncenMAUNqABH9WG8cfjwIa69Ph?=
 =?us-ascii?Q?h8uVqDOMABg1No+C+f0vFAqK0xISYCFZyRk3goRu7aSa+dwXQRl/cQaFGfGJ?=
 =?us-ascii?Q?JlHPPbgSPSkb6MkfimPig5QA1iwkcYeSMuGAbAPU+qF4QLtVZS86cuKBob4Q?=
 =?us-ascii?Q?LfFMo/pRousBstGCoLNUuYSejszdK5E6llgW/WR4+dNY2UwCd2UcFHa0v9Yb?=
 =?us-ascii?Q?7ByREUz/PPf8Hk3u9AgSSHMjEe+z3I8tK/iZPnpIFreF/KTkD4XVCRfKONmh?=
 =?us-ascii?Q?qAtf5GRIn8eClacXnxLiaYFL8/yP3fpwecx4ANgbLU3D4Os55fGviWEaf/f3?=
 =?us-ascii?Q?E+IKySE6nDgykBBanQxeVHV/lPSfT3pEwWEEKZ7KPws9eC/ntrPdsWL9iZGi?=
 =?us-ascii?Q?mj8ZH4irkE2yaGvVrJaATVBsWoOSSxYstEHjeCwDm7OtNogtjwOHcXaS9Gmt?=
 =?us-ascii?Q?KpDZjNujupLqmsrZDHR8pmO7e6iZWKVL4OrO+F/KpVeXyTIbuWW9E8AykLN4?=
 =?us-ascii?Q?9Kd8SlXDSdTlCA8vtURho7TFnsU/J+5rdF83hcsJB6KCa5xCfD5aWygX6q3s?=
 =?us-ascii?Q?H8FdQ4K7CDLyH5j4tm5wvZUfLhsqDev/wWPxIjCd7CjiZ3r6FyMvwBj/yIcU?=
 =?us-ascii?Q?sTGBSZiADD3+ZKZmjDjMxg7SGvHa1+b7w+S3FffaPfIirm62e07wMT7yJUeB?=
 =?us-ascii?Q?NIC82/CoYEMuFkVIKUtnQkAXTHkc6Rdx/pDobXWirzDp7ehvE0wCCvdp9eUr?=
 =?us-ascii?Q?ulaZRt2leDVdgpDga0mgSGbRyQI3QmoAqdNIlyreSyrHjYY5idjg9qGbLNZa?=
 =?us-ascii?Q?Aq6X5zq7+LI3kbOmHdcYGxah5KVOHcaboJlb5VvVwRYFu80/cDmnglIs8AN2?=
 =?us-ascii?Q?DgF427bKJvjZAHfOES2gX5YwloN/067pva7y1J7i7ZZcqHLC4xfgmFo9f+Z+?=
 =?us-ascii?Q?WyJX87KbUwYQkbyd1tc6dtFW37j4gxBR60/BdV2nOVfEhWli8m5kGU8Gvam2?=
 =?us-ascii?Q?qpejpF0HzedefZKhEWfVui9lbqMGdokjCCsNughKf0KQMKCnaP71tduIrckL?=
 =?us-ascii?Q?7SSlxMs6ItSywdDbrAChrmRIs88EZTsQZfU060zTkEhFcnvcONPCtBreKeAs?=
 =?us-ascii?Q?eKh6mSmN+CebVHr98g0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197ca514-a792-43f0-e2c4-08ddd3f1de69
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 07:29:52.8056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IbXSLUfXfxvG0V9UBNxT4W7r15CzR1H6wOUUZmVivz5c6c23lqLQH4/LCs5wINV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIjLZGv024M9GcsPm+PNGvT52C9r98d8YD8Wg4uXp1o=;
 b=DqwzNfS4NaK6L/ykuX3yxJY/TZepRSwMM7PbJhPvjy/hQ/+0sHnXg36/xmMfb61eYhuzqP/AMJ2r/0RkhYTEZ9pEZI8mySoqL0FSDEyVeG4qhL2bcZAPo05X2csEab5QRnDQqO2++ZTFI2AXa5KE7rDnOWFEZeaNEKWoyJrfaTc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DqwzNfS4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> This patch adds atomic test and set support for the microblaze arch.  A patch
> is required to use atomic test and set with gcc 14 and 15 which has been
> submitted upstream.
>
> To test this patch with gcc 14:
> $ cat > .config<<EOF
> BR2_microblazeel=y
> BR2_GCC_VERSION_14_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ACPITOOL=y
> EOF
> $ make olddefconfig
> $ make
>
> To test this patch with gcc 15:
> $ cat > .config<<EOF
> BR2_microblazeel=y
> BR2_GCC_VERSION_15_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ACPITOOL=y
> EOF
> $ make olddefconfig
> $ make
>
> Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
> Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Thanks a lot for this patch, which I have successfully tested, so:

> Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> However, there is now a separate problem: a build with gcc 14.x
> generates a working user-space, but a build with gcc 15.x does not.

> Try to build qemu_microblazeel_mmu_defconfig and then run it under qemu:

>  ./output/host/bin/qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

> it works fine.

> Now, change to GCC 15.x, rebuild from scratch, try again: the kernel
> will boot, but the boot will stop at:

> Run /init as init process
>  with arguments:
>    /init
>  with environment:
>    HOME=/
>    TERM=linux

> and never go further.

> Any idea?

Thank you for reviewing my patch and catching this!

I have followed your steps and I see the same issue with gcc-15. It seems like
a different issue. If you remove the atomic test and set patch from gcc-15.1.0
and do the same build, you will see the exact same qemu boot failure.

So it seems like we have another issue with microblaze that appears with
gcc-15...

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
