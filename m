Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 13:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E9081374;
	Tue,  8 Feb 2022 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mijyZTE1UMik; Tue,  8 Feb 2022 13:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11AEC8134F;
	Tue,  8 Feb 2022 13:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1B21BF5F6
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 13:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897FC8134F
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 13:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ml03Oj34eRUO for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 13:56:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C565D8134E
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 13:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdDQb2ZMfgl4F9JxCA/wre4PkZC4DhAKgFwg1buch5xiZo/ur3vUn1vIJcc/veoIHNmsqxupj4rbxEX0BBw72RfmwqtcnAYwDJnbtXZa5fZYgoEicHIULK7rGjYs/XnrGwFnHMnADHEd411p0Z7u2W4uSSXDGciYdbxLqOPB5hlC9mY58UuP6LfAKd4Kf6GlRyoaD+hUwvsx3IO3NlGil8leltqtULDpqajsgrGi4+chJxI1eXjwi4qCwru+NK/CV2y+a3Qvc5rtJ+CbeuQVMlD4bZME4d/Yb6Vnd19qr6j1lnvZmP4NHn3pJOsZKQxaOo3vIyu0K9sL0/PBJhyiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHZ6LdgjJwKwgG7yQuc9qOXoqdexOHGq4X6WguWpJpo=;
 b=GuukoFliBcckxp8DMGsDnb065/5P2G1TSCIk+UqyApIsKz6R0mFa1HvGSO3tS7960bVJ4TKuUvpAtlvcpRvW3ML4d/9GTLKW/3iZl+4NZo6zppmSRCTbBCojkY3djVTjFupAtm2+pJqzDJqFlmLzCbzyy+s0FFVh216Niurd24Fig2lpgQJIE8Q7n4lZcIiiLihxwoO1fE5Wd/eotkt2hMrQILq9Q78/5anrxzvaj4nHEzrJj5qopGj60vx/+tdcK68dBh1tZLmPzE3U/KCIgZQsiSQdkYXfmBZErUx2OaYjHXzAdGnGRYVY25ASlHPYAndgmG07519bw/5sUqZLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHZ6LdgjJwKwgG7yQuc9qOXoqdexOHGq4X6WguWpJpo=;
 b=KqpHGQ139upEiU+Uh+dzmY2MrViwMMRbW2LwF6N7fgEBP/Xh5I9fGNHNqv0ngR+lJ41v0qnJvPbH7sxHg3xxAQtze9p871AA/1Xgq5Ao9CQRP/p8UrFm4cIIFfnZDETXcT1uZJElOFN5l92RT6ZHH+bJqDzsQwgVLONKIS9yJyM=
Received: from PH0PR02MB7750.namprd02.prod.outlook.com (2603:10b6:510:5e::9)
 by SN6PR02MB5072.namprd02.prod.outlook.com (2603:10b6:805:6f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 13:56:38 +0000
Received: from PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790]) by PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790%9]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 13:56:38 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAATaQCAABfYgA==
Date: Tue, 8 Feb 2022 13:56:38 +0000
Message-ID: <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
In-Reply-To: <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbc0c921-c74a-4696-eb8f-08d9eb0ad3fa
x-ms-traffictypediagnostic: SN6PR02MB5072:EE_
x-microsoft-antispam-prvs: <SN6PR02MB5072ED1771D18C920684E64ED72D9@SN6PR02MB5072.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fFLyxS/SU4Da3Zrt1HT1gKD48npCtBMBEdv5xIrmLup3wgoWIBHwM5/xJke+s3+drBRSL/jRiy3Y3IenXsH8qCqyK9tRSIlncUON1kSSgKkjskLUEVPsrf4A6HqOGVZfqMZSIhoCUzS4N1gvm9lCA8UCqZdW/e/q4HHYJY05yeUITi83i5vc8UMbFnWyzKwxmApM+hcxuLphvgPYFUVWM+vAeRM/b7KoMuwXgIZ3pW3Gh1l/WKrqejFbmamsh6kjboPuSZxEHERE0+VU98yRk8y+BN2N8UDaxZt/CT4BuqT2308zCH9RrfzsEwMjRLU9crVvA0WxhmEiGfo89PoJKk1Zm2K4hQ5ddODLZ/iljddsQRoBN4dAWjugHFvYC94Mly6j3KUkhPWz9XH9lfE2xmrmXG4EM0TX7zivogL59BfF5MzkTPj6RjuhDzKz+UZpArP1sfBEjujE6PdJBaCq1iwSY+7bYvY1eEuiedWq01BL+lTHOH353qt4pBXesHHqlgGlDu7e8j+196xCI9dczYp4XiFK8Dy06++j9NC27QZK3kAImux62nXkXWLBHjyF6ehHyangcR7b9fhkUB08jjXbwr8eutMcBa5QMbtSN3FBxqJra5F0aM57g06oEW5ih6VTp4QJ042qEijRwxOlb85KmcHN4bMrOI04tDVVsIYLo1SHw/jKXzFSxuXGtAkn/QhJppz7Bz6wkGpqNVOLHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7750.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(316002)(107886003)(38100700002)(5660300002)(86362001)(26005)(186003)(6506007)(7696005)(76116006)(2906002)(71200400001)(38070700005)(83380400001)(9686003)(110136005)(66946007)(122000001)(4326008)(8676002)(8936002)(64756008)(66446008)(66556008)(66476007)(52536014)(508600001)(53546011)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmFzRkZMWVBVSDNJM1VWc3RNMElKWkJDayt3OUcyRjdyRzlhZUE5VDRWUUND?=
 =?utf-8?B?UDNMcXpsSXBZOEJWZ3BtRVRGT0xJSURFS1BUdE83R2w5Q3dWN2pDdkNzZ0Nx?=
 =?utf-8?B?UHdkeFI3bTdHTmIvdEY3QTNpUTgwWWROUlRDb0R2RkFJWkxud0p5N1FDRnE1?=
 =?utf-8?B?SGloMEVrZTNCY1Z1eDVyTWJaUW9UeWR1UlJWK0FtcDAvazN3cVhJV1d0Z210?=
 =?utf-8?B?UUJBdjZpZzZrZUVBeHh6dUp4T3BmZzI2S1RVTWZOTkZ1eHZVN291cEhFbjdX?=
 =?utf-8?B?U0NTcTlxS2s2ZU9nWHJwNXNJbGpFZmdTdEQvRldKblFXSWhodkp6eVVxTzJV?=
 =?utf-8?B?cGxOMGVCZ0RtYytGdnAwTDRNYUp2ZXYzdzVsejA4MFpKWnU4QzJBbUc4bldE?=
 =?utf-8?B?V1VuRklWWUJTcTR6K3hvY1pYblRKcHZHbjRFTWdQb0VmTm5TeXQ0bEhXeWxP?=
 =?utf-8?B?MmdwQzFsWDZvTEh4eHRnQ04zVUR1UkhiNitIV2lzTXgzQXI3czhjWVhncHhn?=
 =?utf-8?B?WjRtdkhYb0IxV0lvM0NkNVo4ODh1bFIyOXdibzVDU2J2R2hIUDc3ZVhET3lN?=
 =?utf-8?B?OEVhc0JhM3V3SElpWlR6RlFKSkcreXpNeWU3YW1OU1dESjJMWWdnZDVmT0xp?=
 =?utf-8?B?NHV3ZlNqdVF1UUR0QTdQTUlTbjRkcTVxOGI5d3VtRVpzazJBak82QlpHaU1j?=
 =?utf-8?B?S1ZiNWxpTE1WaWU4U2U3K1VpSlRRMkwvZCtYSHZ4UU85bTZHbDVMejZGbURU?=
 =?utf-8?B?bk5WcGxQdzRPRWY3WFErVWp4VERyTlI1cWNlSzVnUXBnK0ZodmIzbnoybHdr?=
 =?utf-8?B?TXZDZU1KVjJ5NTJud3VCdmZReEo4Qmpic1ZPTVVEbUdCMXB0ajd2anVlSFdQ?=
 =?utf-8?B?dEluekw0SEtmWk55MU8ramFWVkh4cWRreWx0VU1SSmx0TjJxU2QzeE13eVh2?=
 =?utf-8?B?MXNRMElTQ1ljVHpTT05QT1JjQ1pVTXdERCsyTkJXVTZIZHNiK3AvQS9QMzVO?=
 =?utf-8?B?Q3ZuVkhXUkx5NlNTRzNBbm85M0h2SkdMaGpQY1E0TGhkM0J0L0RiZFRuemZm?=
 =?utf-8?B?anFpZzJpY2hhcUN4YVRHR3ZCNnl6c21tZURaekhLWnJRcG9BSGhOSE5XVVhY?=
 =?utf-8?B?YVk2VnhBL2R6R2UwNFlsMFBBb2t2WGs5YXUyT2pQWnZwc3RwWEFkYW1iQ0dz?=
 =?utf-8?B?ZEdPQkVLVXRydzdBeC9qaytSTFFEZEtaRmk1d0c0YndLVzd6THdWYzJDQlJL?=
 =?utf-8?B?RE1VR2NKTVF1YzJ1UnkrZEdiQ1QxSmp6WmZ4V3hMQXJRMzA0N0hwRUswQmdu?=
 =?utf-8?B?OFJQYUI2RDBPQ3VwV2FMNXNtYXgxcFA1MW9oc2EvWDFNSFkvWjcyemVjK2ZS?=
 =?utf-8?B?M3lyTlpHTmRoc2t2Q1h6ZjVJV29qeG5va2NpdXRTZFhFQ2dYcGxTS1VmK0Rr?=
 =?utf-8?B?NldJUDlqZTFxN2dUNkdvb3MyMjA2TURITWtoT1p1VVhJaXcvejVDUGRWOTQw?=
 =?utf-8?B?UnMwTHBqK1hGdVRNNTdIV1dUaUFiQ05Ec3IxaHQ3dXVySnNEMmM5WUVibjY0?=
 =?utf-8?B?c1NJN2ttd3V6VjVjOUJGRzRqcXU0UmlpY0M0TU80elRGRkUvbnZIYVczaXVh?=
 =?utf-8?B?dEorTjRpWUJ4UFRSUEY3czVxbWhwcDloNzN1SFMwUEdHbUN5dmdQSlc4QWxX?=
 =?utf-8?B?REFQMHY5Vk1jQ3lRVVFFRC9QUlh0Ly9VbVg4aXlsTWVRTEhXMCtZdFVIUUZL?=
 =?utf-8?B?MnRVNFJxVEVKdzByMVFpYXZOcmVFSG41S1hMd3g2bEdZVjA0MkRwYjE0Z0pk?=
 =?utf-8?B?RlNaK2JScTlDRVc5SkZkM0grQi9rMGc0Q2xXWGlhUXVCN014TVhOamoxTjAy?=
 =?utf-8?B?ZWJnN25ENXdzOW9Lbkhhc2lTemlMdzdPbUY1NzA4M3NiQjdJcVI0WmFMdlQ3?=
 =?utf-8?B?bkptYlA2QkFWeE1zemhaZ2ZTVVAwQkN1U2V6dTlsbVJrNTd4Y3o3SGE2eDRn?=
 =?utf-8?B?dTRhWDVyV3dlckZsbnAzUGxRei9zVjFBQWF1SFVjWE5iaitEWG1idE9pckdp?=
 =?utf-8?B?NFFTNnFvcWF4Zm9vRGFBSmNqVExRZHpOa2dTbHVXdnU4NVhZVzFLNkJtRzVD?=
 =?utf-8?B?WG9CMnhIWVlsSVlhdFBySmx3ZzYzQ1VlVmxnSWJoZUxzeWswVnhwckxsSlRj?=
 =?utf-8?Q?SgkqVbNl4H7TGhqKPZOXRi4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7750.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc0c921-c74a-4696-eb8f-08d9eb0ad3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 13:56:38.4979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSpCYaEwgHkJOA55GZW+CWh1eOZAw8fZ7s3X3JoJ4sCEyEihkMSmUXX0Y+ABDnMySKd3W6MC+h3G3d4clTYTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5072
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Neal,

> On 08/02/22 12:16, Giulio Benetti wrote:
> Hi Neal,
>
> On 08/02/22 11:24, Neal Frager wrote:
>> Hi Giulio,
>>
>>> Ok, I was about building your patches :-)
>>
>>> Please send as v2, so when creating patches add -v2:
>>> # git format-patch -s -M -o outgoing -2 -v2 then add 3 dashes before 
>>> the actual 3 dashes in the produced patches and described what is 
>>> changed between V1 version to V2 like:
>>> ---
>>> V1->V2:
>>> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local 
>>> patch as suggested by Giulio
>>> * other eventual modifies
>>> ---
>>
>>> And if you send then a v3, then keep previous V1->V2 and add:
>>> ---
>>> V1->V2:
>>> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local 
>>> patch as suggested by Giulio
>>> V2->V3:
>>> * modified ....
>>> ---
>>
>> Thank you for your quick response.  How do you think we should handle 
>> this?  It appears that the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG 
>> configuration does not yet support pre-downloading the file from a URL.
>
> It's not its purpose.
>
>>  Is this something that can easily be updated?  If not, perhaps it 
>> makes sense to move forward with my patch set as is for now, and then 
>> I can include a new update once the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG 
>> configuration accepts URL inputs.
>>
>> What are your thoughts on this?
>
> I think you should go with local patch honestly.
> As the patch is now.

> I agree with Giulio, it's probably better to add the file to Buildroot.

> Here's the rationale.

> Downloading files instead of versioning them is not necessarily a bad idea. However pm_cfg_obj.c is unavoidably a configuration-dependent file, meaning each user making their _project_ (project = a specific configuration of a specific hardware) will have a different pm_cfg_obj.c. This is different from downloading a patch, or a pmufw.bin, which are reusable across several projects.

> Theoretically, it might make sense to have a repo hosting pm_cfg_obj.c only if that repo contains all project-specific material for the _project_ : schematics, FPGA design etc. But this is not the case here.

> BTW pm_cfg_obj.c is a 32 kB text file that compresses to 2 kB. Not a big deal.

I agree with your rationale.  However, not every FPGA design will have a new pm_cfg_obj.c.  While it is possible to do some customizations with this file, all of the Xilinx evaluation boards now use the same one.  I would expect most developers never even touch this file, to be honest.  So in a high percentage of cases, the pm_cfg_obj.c is really coming from a specific Xilinx embeddedsw release branch which developers should want to be the same release version as the PMU firmware binary.

In any case, the short term solution of including a pm_cfg_obj.c in buildroot is already done using this patch set.  On my side, this patch set builds and runs out of the box without needing any manual steps.  Have you had a chance to at least test the build process?

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
