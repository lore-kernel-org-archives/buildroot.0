Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A7CFD31C
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97B6403F9;
	Mon, 24 Nov 2025 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJABWS7ZWKXF; Mon, 24 Nov 2025 07:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF59403D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF59403D4;
	Mon, 24 Nov 2025 07:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0E75158
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 07:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADFE280DD5
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlwhTZKcLWbp for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 07:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FEF5821F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEF5821F5
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEF5821F5
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 07:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7pMqmMDJcPHm4fjBgIPdWB85UqR9lJKxcvqt9EXkH7jtLLFaVsvZJK1iC0b90FCIHiBhqSmlksxE6ouH1bbwMouHUsW1S+8LVuhJ+7KZx7o+k5VoYZ59t/WLJvhcOYd4bGnAfVR5FCQ9Zgpc/OMTXHLcVr3UmUWJ1GdqPOq8NK1jSqA7+Ulojph8cZQOEwcfOSzoA8JX+fCDRXozoUSxKoqK8oAwGfFHUXk84627HFKBfPiR8tAF7EU7cJ9rdYy7OozQkkjQr1A52FjItOHyVpo8Wdaus7HA2fd+e1lkgCFRLq6bVyFKPLEFm8NVZwEruoW1tB+RABd/V0asBRoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q15Li8yeyzWlz4lAf3mq9qJlJTBKA0H5xVZHOlZNuZc=;
 b=ufa2MysGS8eCTXeap99mxYj7n3ISTG4XUdc+Cq+EnedjAlHdJz1q5Yh6AP+puBYmILp+0Z/ew88nD6E/z3OXkKarYEqZe/2tTUG1WqhBUrAKCrUUh8eEs9Q6BRSYPM+UHZSXgWDZia29AWraDk5MUqexcq3reEL/3JzCInpZ7KNVZ/ktvdyeGNHqd40dNHvJMmwCeyaoE8N2otMYocia7Idu+0ijUsamsIb8+LEwqCWdaAT+F/isYyR4jTODfrSyA524814As1rpPBn3RRXBYtK/tRCpCatXAiICM7rFI+8SnEUicaGy1tv6oU71hmZenuX5ZniMOJtX3rkm4zQfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:49:32 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 07:49:32 +0000
To: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/gnutls: add patch to fix build with gcc < 11
Thread-Index: AQHcXKA9EF/ypS3ycUKbn/a1Y22Vc7UBc+RQ
Date: Mon, 24 Nov 2025 07:49:32 +0000
Message-ID: <SA1PR12MB5615A7D122E482ED698D115AF0D0A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251123173952.837145-1-ju.o@free.fr>
In-Reply-To: <20251123173952.837145-1-ju.o@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-24T07:47:24.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|BL1PR12MB5851:EE_
x-ms-office365-filtering-correlation-id: 107f2578-0828-412a-52ad-08de2b2e0186
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ej8oZQyo7U3qAo8MtCoPGdmBMGynu/gqnDiS2fs8lrww5Lt8X/QBXj32bVPN?=
 =?us-ascii?Q?1kMibZwhzrSu8tVPnodsdKEdvvxMMA6fayCN+k3rRA/ClKfu/rs0TIg0h3sn?=
 =?us-ascii?Q?Kl17kAPiP4Q4YVfvuMiAcqM/nD7sZ+MH+TzOMwIMkNNBIBiuaJwDQ2kc7M9i?=
 =?us-ascii?Q?MYx8p7E8C4DW4r03sdmEUXBAIm7RqMYXXqSBv3mSjB7gJcONdhV6a0SiR6A/?=
 =?us-ascii?Q?YaX6h3C7x7wVBBUKIUJUlvtKrGPTsKg32BuucirN6UnWxk1PWG058fG0hjq6?=
 =?us-ascii?Q?DUQjObsJoa8Bh/7zkRrWfzjbw5Nvg5QrJGp6FpMv2AZO9/q2aPCXUZXMdvzS?=
 =?us-ascii?Q?JQQvBm+mZYv+TItUJi7JZc0AtLyua/o1T8rxJIaz3tvyebFwtocvNLgubl5+?=
 =?us-ascii?Q?pS/93bOmAeyvv8M9+CjDC7U3/kdy6ks1sbMbQ74c8sarE4JZyCHHBdyo4qJ0?=
 =?us-ascii?Q?mZ2YQ71KVKSAW8urqOqxwKrvp+4Z6//lnm4sQ7l280NLhWE1Kkb7jzOBqW7G?=
 =?us-ascii?Q?mM33XTYUHmU4mefSr28jdqfWNpDxNiOTyhhWWe+NQjRLwQ4XagPg0qY5tYF/?=
 =?us-ascii?Q?Bgv75bw2eoI7mRvDawAWRpJP21iq7ghxxe37VGklCTv3h4LN4wQujxFqYSvW?=
 =?us-ascii?Q?SeWQgPhbh7CccsArlnisXR5f/zDLiaWOQB3lcYNPzUpKU41H20yPVzuoKUeZ?=
 =?us-ascii?Q?nC5+zN4xDDvLyCIb9tpoXlJJKzgeDE6wkh5HmuXG9N2syFZm972GRp+WzVlT?=
 =?us-ascii?Q?+iDweWyLx28KZD5vvMpz08DGiPKzVYovR4ZxmKBK71Mv7c9KF4CUOCVvFXIo?=
 =?us-ascii?Q?9j09/U4gdIx50B2mPWp5XW56H7nnIipCbO3kirjC0X7YCQ77pYTI93JNXdWO?=
 =?us-ascii?Q?i+EEhXmqSbuaCHpN0lc606lZbHynQ2/CT0+DwIpOHIHK53P7RG5tsyQuqa8y?=
 =?us-ascii?Q?rBMNKz3/vHAyMp4gmCQyILRM6PNwhPryoXz4qWgnpt86xmVk3zreu/M86vet?=
 =?us-ascii?Q?rSicvq2YkAlQs4cJySyT/zxWmFqkjKhOPOpZqQc6DPYpFGGHry9kT0jTsrp6?=
 =?us-ascii?Q?c8TOW3BOC6PYSWr572InUe20gzaZLDPZugXxebOd2fb6RMyHHRDf4nxrEI/w?=
 =?us-ascii?Q?Ctmb4v4wawfxT1GVUvifDhpIpzCGETBwm/STRhdGI6OJ58IMnPxI2TiQc+mO?=
 =?us-ascii?Q?vCBi3ArdzUQvcpIYpdThxwZW2T1HEDVWdsPHKG5X34wLtZhIso50aJJiu96Q?=
 =?us-ascii?Q?+g5NXwK5TYyKcoR2YtuDWCwm2bjfzf6sL3hD+Ff8zes0+k2V8K0Rxa/1dk/0?=
 =?us-ascii?Q?I7+Ljgvxoeaea2nm55liN2JHRkVjb9Jeqllrys2GCEY/yt1cK0LyZKzKX5+c?=
 =?us-ascii?Q?f3oXtog1wDfMwdS3Jj25zK/38OlG3TvXOQFsP4IOW5q1+CFxiYqH25Dx6aGA?=
 =?us-ascii?Q?kVGxoEJrcjHohhP+q9ZfgUPnARMZksrk/aga9PXMvvGQF1RRVm+RQ6CMD1Pq?=
 =?us-ascii?Q?J/mu6itU3hWZXSCB1Izptl3AcBdMZRf/Yq0lWAl4j8dMabWjlyQK9+auhx/c?=
 =?us-ascii?Q?isKo1c9gPSe663MCZELv385m1pzhFaQifMWJrqiG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g2icgdY2T5Q6w6VweoH3rx4M8iszTuUf0vHgcehAr0+3d4ojcD/eVg5kfkWg?=
 =?us-ascii?Q?n4q/eXD19T5pFcVj9wLqoDT+MuHh2DB3icVk3OMISfdSmONsTSqPCIzPfq6x?=
 =?us-ascii?Q?T/3Rvsu0ub4ZoUvIXYqGvM3gV1TF5opd8wXMTCQs4i+d3SU55LpQ24/1k7Q8?=
 =?us-ascii?Q?JP71HNgWinCXE3r85Ul5nQ2+Nh1fpydMr2sDAC7rhxe7OCbQfy4VAy3l5OA7?=
 =?us-ascii?Q?rseOTzkNYopT1LhCer4gqkMNCX3U/jlNbF2r+upBWxn3kKrCG/RfQLFIpkd4?=
 =?us-ascii?Q?NC7B6HA8YUvF/lW5DLXujzph/o13FgPlwDo0wiXMup1VB3O2wVyvVIJGnn/0?=
 =?us-ascii?Q?pXN4nlStTTMmGAFutYApOabF08PQypwQFSe7D1XxH0hVUVBJqdk0q3JRxFRl?=
 =?us-ascii?Q?gO1OZtv5144ChalS7cNIF8uIhpErLUA0WpEiB01G67dpcgwAVbzeCycx/qgz?=
 =?us-ascii?Q?bvxMbjGMKR/1/xkdkTOHG57unTIa2UJxcmp0Xeirq1x8bHRrsnTVDy98k2K2?=
 =?us-ascii?Q?Bvk8Zznr/ooq1zdJul99MqaDEMMwJq62elRF5DgoT9Khja9FJWQe8G25FbUQ?=
 =?us-ascii?Q?LS8lbhUFVXnaqQT2tgEvEuCjUSk/WR0VZDZO42zVh1Po5LKXeDXRiepfze3n?=
 =?us-ascii?Q?LBWy0+9nIMwNlx7IQyvOincRN69f2qAupdHNG2mHUo1rJ9QJZ37oih4yAxUq?=
 =?us-ascii?Q?88MbOtzBHzn8FyM1iUNx7dA4Q/ojSiZDkDA0f9LAMxj0xW/3ndSKy2j/1sQj?=
 =?us-ascii?Q?GqwuqpzqOWBLlfofiXHP2VqOE1dh1+nYKcwAVhBeMEJtsMafRMHYERetBNqu?=
 =?us-ascii?Q?m5aiQNCHQqtlgM68DywkyAZM4hmjiQrq/4WxaRexi7cpzr62RSNBVKsOuGoF?=
 =?us-ascii?Q?oFjOI0a4tgul3rh3nugegQLIM9DkWzBhP8+w0Jjw4lq1vPi2h4TpXxARFkIN?=
 =?us-ascii?Q?IveS16666rPCpVZDF4dnCy0WWPI+JgzpuGAT/YAciRmYs5R7WdQAJa94XOEs?=
 =?us-ascii?Q?mBf0mmFOZJPICJ0rCfGhiOhSXp7lCt0vv2LW/cIXeQFsOULXgfFWQ43kV1fC?=
 =?us-ascii?Q?D7oMCjBYAohWPe4CLpqBGO19n4cDRI/kI2n8SChZ3HB1j0Hutu+haB9o8qNR?=
 =?us-ascii?Q?A7dGnF0nk0HDuiDioKLOt9RcPMUo0LemH5PwEZ1XaW6nQ4m6Oi/AfhCF3lRS?=
 =?us-ascii?Q?kpM8jg7exw4aqIhiEjohX68zfqtI3SPKmn3Ap3CXX3NTzlaRuJMP26MAAJME?=
 =?us-ascii?Q?Hv63d1KRV++3y/gZP+YGWWDHoOLVS9RU+UJ5X+Jr/iBnQQt/xFAq6JhjCJjp?=
 =?us-ascii?Q?mtaJbIe69WkGepfl6+TwVwHYfM0M/uaDx2Aepf/DUwUG+QmGW/fOatiUmvmz?=
 =?us-ascii?Q?kQqCyFThUwlYHe1FM59tWLuu09yLCbgx+q3dZTq31XQQGr7N8cgMDqkkM076?=
 =?us-ascii?Q?gGwkbaRrfH8t5RfdNPAHTdHHWIkbWFFrVbe/NZu2Sp32yLVzLKSuIHyJbh0T?=
 =?us-ascii?Q?khKgtesHz/v/tcjy9XLcokRf41DTFdguEDaBZkoaljzX6cExYgLacdONiQ65?=
 =?us-ascii?Q?KZLHl659GxOrHLo4L5o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107f2578-0828-412a-52ad-08de2b2e0186
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:49:32.7135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NV2TD0lO7ry5qD86MfCLdW5PXhJdQGBntIrMzdnufDZjb2OBKbIDY0IkmJrR7b0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q15Li8yeyzWlz4lAf3mq9qJlJTBKA0H5xVZHOlZNuZc=;
 b=Hb2FGl+uu5j2yDdwt6YYrUQalu1a8gQCtXC892D/1cS/ATV5luGN9TSlq2+gjwhe0I3JtSBUV5AeCIYnwz8X4t9cIF0wtE+NiKt3FXy0kyHVa1vg01fB7oKJpcSRbu3fFb0cU6H+Up36NKuAYjqG0HB9soVdIC6BMKAPZvq+te8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Hb2FGl+u
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: add patch to fix build
 with gcc < 11
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

Hi Julien,

> Since Buildroot commit [1] (package/gnutls: security bump to
> version 3.8.11), gnutls fails to build with gcc or host-gcc
> version < 11, with error:

>    In file included from audit.h:22,
>                     from audit.c:26:
>    crau/crau.h:255:23: error: missing binary operator before token "("
>         __has_c_attribute (__maybe_unused__)

> This commit adds a patch fixing the issue.

> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548

> Reported-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Neal,

> Could you test on your side if this patch fixes your issue?

Yes, I confirm this fixes the build issue.  Thank you for handling this so
quickly!

Reviewed-by: Neal Frager <neal.frager@amd.com>
Tested-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
