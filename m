Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD394C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 13:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 516EC4155E;
	Mon, 14 Nov 2022 13:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516EC4155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5UkSrb4ywsAj; Mon, 14 Nov 2022 13:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409144094B;
	Mon, 14 Nov 2022 13:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409144094B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2A11BF379
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165674094B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 165674094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EB4hqFGLAhbW for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 13:56:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A2C40238
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A2C40238
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 13:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRJU8dZpmxZwjwdtk7u8WT8xizL+Fco0wVNVEfd3xyiyRwLsafL35b0d4E8OU4nzMdPLUKMjR761HkzuG4BMulXVnWzILjDvjXw6jVW6/FfS8LttJnSVUi12SIQBCgkyFyznGZMsWGhCWhUlODnULtI8sBwQIC4fEmZSIU8ZgoFX+UOsfS4d+4a4S6o1d+rPr0Byrt6QJi+OqFWCmIHZwSHV3+9elBMCAE+N1PnkCZtURxpDPTpI15yvgoEA5M4UM8rq0GO19pkQR0hGOWES7gm+ASutktYd1ab3my7kaJTdLA3NvszXqtuaidlkTbq8ipwMFhiGqeIkgcVtfBqw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFCUkpZZ9azm5WaV0MIwS/znn3k1bnQQlPocLqZW0Ts=;
 b=cgza3K7pgH93bNPbhDKM5hdnC5nW3/DURzHkaaL2yEwqTWmfennLfDoi6hU/z4ILPxGZjhNZ4dIBSuwTG2xLkad7arqj812ddcVEM1zMYfXmGKGE5Z3HHvFAsEhxt+K1r8AFiAG1LQUOozZMbPDKv+fV66zqrYPrKfalIu25OLFkJqFQ7xcKzerXdYGMqCgLYvwTyhz7hw2R5U6iEFpb/ptTDsxSbeQYj4tUNrb5jfe8C78NLSvflN7e6HAvbcU1gW0YswduAtBqW1BiSWGks3YgEgKlhRrcGJuxAcM9boOh7bPOrH9OmiKTBOnfNjaV3x1WnuIZ92lDZFr/5oXNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 13:56:31 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 13:56:31 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
Thread-Index: AQHY95CvOWzbCNQTGEOxWUMidKLHK649VkEAgAES8yCAAAidgA==
Date: Mon, 14 Nov 2022 13:56:31 +0000
Message-ID: <CH2PR12MB5004C5F352817CA4B14405D4F0059@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221113184933.47232-1-neal.frager@amd.com>
 <20221113215834.00ae7f71@windsurf>
 <CH2PR12MB50045834EFCBB8E12B848E66F0059@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50045834EFCBB8E12B848E66F0059@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6338:EE_
x-ms-office365-filtering-correlation-id: 6cf3bd9c-8940-437e-bc06-08dac64808fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2Eo7Ts7SBzOtrZUPJWIVWf9cAhT3V2NE+/zc6Ae+Wq2UD+X6ARis1gplKAhEi/SDj3/UqrhfqCJlmuKjJRt731ulrrL/fGb5pktHBmC7KcJ3WB69bJaQRiLyd9af9nscAYrrUAKf892eNp8AJkJ0pEtS0AaRMK2g796eBowgwCewMS3xwIeej1x5viY1FfhuOcIjqfbs27r08r/a1sFkFGkQ9BUD8uLex/w1YQN5/4h315DKIOYHWN0axry2Rxukh5gVSloIg5B0aElsKDss2aA5bqcVpX6T8Cz2DgjnLq4u3PcZ7+SgXxDE/fzWr2OIMcLkig3An9zVQS63uM0mEcHM0tzt5H6SDAOtouSmCx5/q2DWnbosncxNy8CSEgJJAnq5W0OAgbsRC9nJAuuGbEpA/3qBvvY0F6+xryn5NVE7lj2Vz57Lx3cET9xJxXD2RfKca9Y0IV9fA3W6LFsHZtrBHNLMRcTVBlAFY7SkC3b1iu8Jod+IUWCwRRpvz5nNbnJhmSEYSAFAlhOiYDd/Tyu+QKpKR8RyLDeRMpT0YDY5F7MUD12IIQgkxFQuPGxEACixB3I6N2T4jmOTmKELKWUcxfh2zQi00Zs3opsWwuKX/b2MXzOx+9TS75UzOhHyUtKAS/0aOU2k7iAB1kE5kevF/qhwCLnmynhEGvvXn4iEmZkg9J+JLprT4i8q6rgvluWNAXMLvoyjCVGL/WyG9Lf++fBY9qR/xwcrh5dWjLpqkvDr0oT1EwITWBFsayixGgfik1JjUrttZ5ZRGDZbE1MRowaNRNt5zLu4PzRukJDwxxa0WMfXunWX9vWojrmmuJcQbN0VopgHpe+qRFTPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(2906002)(8936002)(76116006)(66476007)(66556008)(66446008)(8676002)(5660300002)(64756008)(41300700001)(4744005)(52536014)(26005)(38100700002)(6506007)(122000001)(966005)(7696005)(9686003)(2940100002)(186003)(478600001)(71200400001)(110136005)(316002)(33656002)(66946007)(38070700005)(83380400001)(55016003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dHcc4qCjbILCkxOYheeNKDRb+6M6xAIFX0fPYDciuTL6vo7QWhFvS8+Sl5uW?=
 =?us-ascii?Q?aAOA2j+j1URfaKk/w4EbjKbIOZlKlbHY2rVAiHsiIJ+qWJasQ0RS89HYKUNh?=
 =?us-ascii?Q?EWaHKAqTeQlqdfuJjCLi13p0hh3tKqeoxNzLgWqVQHwzY8aldo57F/hiXImU?=
 =?us-ascii?Q?agZ/hsLNOluagZBX7Az+G+sP3EaToNu9lKNhk1uZOXlgoGmpwQQ/joksi08Z?=
 =?us-ascii?Q?fZuhBQmu8YjbG39fpjznmqGbJxX/3K5elZne1pXGlUca2I4NXb1Cfy7OCpz2?=
 =?us-ascii?Q?DkNmWI/dB/brL1yBSiH1ybbJulrS2YED4TfA7x0R7g/CqtJIRNiNQzD8Afp2?=
 =?us-ascii?Q?FI9ezaKgrdg+0KBU/KMXIIcKhHoV0dOpui2SiUXdFE0WmCd8Qfv36TAuBHpe?=
 =?us-ascii?Q?EOs+Ve5EcZOmUonPUELRzV2s9/oZob4ygZzHYCvp3mFPfFzf9t/OfPXnSMw3?=
 =?us-ascii?Q?TdqpRUNK5HWEEC0VzexLwVZvpGeqqK+dMUUDk2z3n284SgIgAINhC1s+XsEF?=
 =?us-ascii?Q?wZr79ny/Khs8YXfkTK4E1txJnCsilbIqeYk1zFsbnH7iY+7fl7UKoQ8m5cDo?=
 =?us-ascii?Q?XPWqxRYId6Nstj90oGvI4leV9brPj06022F1hNuS/9EggmqKg9FJUHMmceco?=
 =?us-ascii?Q?oBkx6MD3qE+WPtI2IoDM+i5IXtZ/pz+KNTRZsNnu8OD4T1qtPFzS8+j/y2Fb?=
 =?us-ascii?Q?AllMMbU4tRGHVZCjf7vFmWDpTM3/uS4WUX3I58GPQYFUwVGqYPQSqu4RtQ+b?=
 =?us-ascii?Q?7si0Ya1ov21GlTXq0BBq0fGFzqPH1nHUWRLWm5lVptYMt7luO2spMOxx9ENp?=
 =?us-ascii?Q?nDcuJkoeVdczXL08WQu2/5nkGqGglEUDIwBAbKyu5BGzxyl2WgA83x9Arx9G?=
 =?us-ascii?Q?qX5LpjbUsuCp2cVRvlLCO9/yAok3oo0aiTr3Bon59i7W6MgBaj29AGQ9d/yP?=
 =?us-ascii?Q?z+lrSC6jjbFmER8TrrLjJTqclUy5lxTrVzl8d6+eXFdrOqEqpMF4nXMzglwt?=
 =?us-ascii?Q?e7iL98YkMRaIO1ox3T4ABlu8175EP2Vdex7Eeag8LlET4GKWJoZBLf+4uBLH?=
 =?us-ascii?Q?M0K25OC4XxElZ/q4smhrcLnxW6f/2RWz6WeCJLtYD1fPsWaOJCyT12ia6PJw?=
 =?us-ascii?Q?rm5liE8uLCjoHVJ2Jq+AXR5Rm+J+ScLnDmBV/NFMdORwdQ6VwgZ+ggV2Zn/a?=
 =?us-ascii?Q?CsUHdasfGJlXX0MeyqBq5V6arX+t8pn2KCcV0eWxBa4o8ZmJ9vJSHMfV3G0D?=
 =?us-ascii?Q?MWOsDqig+joaGgxGJTSS65rWj7L97+YtEuOjYxnFy1BKPpv56UJh64/1wjOn?=
 =?us-ascii?Q?fT3rDS6JrThWBltnkQEqxQsFPIQSXhDkuFaddbxuxrijZVuqT7xte0fi1wOj?=
 =?us-ascii?Q?PiJjhN7igGSsRqEoBvDQG5TUA2s9W3x56ULPVtN+d3ksxWm+ndBX4wW3kxzS?=
 =?us-ascii?Q?fvUX727oluk/I/5OegKQqVJ4/TOYCy6CEiOauidXiLnL43eLsQFB8X31Ksv8?=
 =?us-ascii?Q?fHfLkV+nvXoERq0ECOShjhQOCJcYwY9LGehaUqigT/eIyOhMB1B5/HP0kY+e?=
 =?us-ascii?Q?nZ9fVPE7YqXeaGzO3ak=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf3bd9c-8940-437e-bc06-08dac64808fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 13:56:31.6538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RTbDxP8a3VoEi5b0WQ2dIroh6wB8g1WDmMu7R2yc+gJ7NDjia1mCHH3E4AweT9Op
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFCUkpZZ9azm5WaV0MIwS/znn3k1bnQQlPocLqZW0Ts=;
 b=ChUHDDWP25Hv1UuYotNxgKTXq4vitxcAGunoENe36VlXHN21P/aMJqFMglD/l0vXoCOHDavcQDHInh25676E9ELURiY4w9Efcdelisyf5o2atvbEoWPUyY7Jb3FWXtwC5JJXjSwL+FBtbSOFoMWonlnGOzcjVChPzxGQPU4UA9U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ChUHDDWP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the 
> zynqmp_kria_kv260_defconfig as it is not necessary.  The post build 
> kv260.sh creates the proper u-boot.itb without needing this option.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/uboot.fragment | 1 -
>  1 file changed, 1 deletion(-)

> I've applied to master, after adding the following to the commit log:

> """
>    Fixes:
    
>      https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
> """

Could you add on the following patch?  With this patch, the build generates a correct u-boot.itb without the CONFIG_MULTI_DTB_FIT u-boot option.

https://patchwork.ozlabs.org/project/buildroot/patch/20221114135126.20201-1-neal.frager@amd.com/

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
