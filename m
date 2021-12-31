Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9B9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 00:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE013409A1;
	Fri, 31 Dec 2021 00:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlsy9WbqDIzj; Fri, 31 Dec 2021 00:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D00402D7;
	Fri, 31 Dec 2021 00:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9FFB1BF3B9
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 00:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEDA6401C2
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 00:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="rkOsQnms";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="EbITCJAP"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJYrVQ5o_XyW for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 00:46:23 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 811D140178
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1640911583; x=1672447583;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h8nrc3mzxywOEYKXzyRqCdHTlfQnyELeJw3x6/kftVM=;
 b=rkOsQnmsqidAiai6QZ6w8egwI4W28fs21YWzczTqucZk6k8FrC13KlPt
 WZb+wfcZwjZQalcSLQe2NZEtr12fN+8rYCUr/N/5+sito/ZHnodBrH643
 Q3l3xYc8whqD7zKkFb2kBpEYx+CrVO68npb9OJowv5f5b8gavO80ZdQmO
 NdYi6NTSurMyqmv7C4h+b/azAY9ILVbnc6dR9LvVsXwqDZ/O4ZnnKur0m
 XjBb40HU9HNUk+mDZQA67Ud3qSfeKpeOkzeM+wAsHm9fwqLMO3d1dTim7
 wPVJm21mvgN3HLrLt3+7iyevIaXXDQ24XWMfLWPDqpdhQibzBFsUy3Ccw w==;
X-IronPort-AV: E=Sophos;i="5.88,248,1635177600"; d="scan'208";a="301282792"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 31 Dec 2021 08:39:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXyVDrCo5BIiE/H7bsX4tgEqYkBZPHtPrdcKLCuihX1hEyCAOiq9/5SQFOuSd/ukj8Y/UuCJTa+xFotjznNuQdX+RDSxKLVafGngwa0H5dtmuSOZyhnbjPW3E0rgt9DZQM3OtPyM2Qyyf2C1Tqj7vjRJ/hcMAzVzM1Zi03+Crwxl8TERT030KbX9m4a46BHwbiZ5EqliNqG2C4F5+aflPX6GRdVRdBR+LnSgEGSMHFeXOfn4tIOH1pnZW4oigBLa34xZ4i2+HgPitniF9hn2aeoKMAwpFHM+7uYqmjaLjRauZwwfpFNGI4ewSQ15eN1z0kQC1tf//qTza/Kezu/+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8nrc3mzxywOEYKXzyRqCdHTlfQnyELeJw3x6/kftVM=;
 b=e6K02ywFgD+sLATeJJoNrb9VRVHxPPrDCuqGkbvkOjxXwaoZ4P50l/HJonUZ3AMKRFimuYY/SRP6aEaakxDnoi4vyTcEznBFa8HQvp2fqU0AG0Ez1lamSvRmRwrXHLx5RjuQnk12bs84EsgxDJ6WjDLmRdA48kMXkOD0RnNYqNhk2GzHbkBjMHbwgM6FzVDQ3xknE8WF//8kyCs7x/yopj58+n28g5AG5+RsHIGBzaZw29IKmsp4CQpux0s0mth+AO7eQ4JwbHFGuUhsMMJy+rRU+EbE/P/DfpKXW6Ri+ro7RPpJJO5GLaasl7FPiONxO0QUbAyTHLimo1k2FRluPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8nrc3mzxywOEYKXzyRqCdHTlfQnyELeJw3x6/kftVM=;
 b=EbITCJAPJ1S6xcWx9OEHT+cnhsAHbYyoigCl57eMu1vJKYdg9fTSKH0bR2zZsVSpZoPyXwNCkdW+Y7HmJCOR89oiyEUoqO7sUf/4zyXfVSTWj/512yYF3I5SyvoA5cn0xTE6JWOsV6eDRzfJ/WagK/OFUEgDl+L8JXHyy+5ju0I=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6859.namprd04.prod.outlook.com (2603:10b6:5:244::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Fri, 31 Dec
 2021 00:39:15 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e58a:8ae5:2f73:35ea]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e58a:8ae5:2f73:35ea%8]) with mapi id 15.20.4844.013; Fri, 31 Dec 2021
 00:39:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXyjmPBFf6vXtxHU6uYcYx520GSKxL4vEAgABGRoA=
Date: Fri, 31 Dec 2021 00:39:14 +0000
Message-ID: <ba60fa7b8380ce6c817bb5bb2ada0283752efdfe.camel@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <20211230212742.030be8c5@windsurf>
In-Reply-To: <20211230212742.030be8c5@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75611d4a-6984-475e-ce38-08d9cbf5f8ad
x-ms-traffictypediagnostic: DM6PR04MB6859:EE_
x-microsoft-antispam-prvs: <DM6PR04MB6859E8BB8C9EA294AC40E91BE7469@DM6PR04MB6859.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dC8qAxFXLj3SqC+OX8Fu0SwomjOrmVYrhpiB2TU87yKO14LpekrUn8W4ZjQz+JQgT/KvB4BvkUf6396TMmF4XXwQyFQgPPodsP0JC2uk/z59R0+2D2c4w8oaVqpifoaDDob06DZ2alW+K7Q5zbAfdnN4orf13vw+UvhDjLkzJc67YxKAQoq5kKGfhBS2G9NkgmVX4VozNh+VLBAbnbmB46t/l1uf9lwwonrxUq4GqCBXWFaiKbxqZqoQN4c+0s5oYUm72THOPm9kILvtcBgA8fAHvE7QupMNrCLH+YOGNq1fIgMlSHELKK4uS94IR0l7bnLQuoLmjD8VF9t+k5iYPhXUGZwdHn1z1wlV5dI0m7hk8lSmrBTbuRXoKS5J51alX/lmjyegtuVly8jIth8QgpRHXuFS6bG/IL3r8At82wnOlS20WaNEmb0Hyp0LWNi0Rx0FCyV4p0wtS3iCEzb13s+j4kjpxWAj8AWlEAFhCqzxX+6/jOsWtSc3KhK+463i7keCmwZKoKN+iPcFr6M3NdVd4R87GEK1O4ds/F/Ddu4iYZA4rNupkUplTnSfK0Q+DgaF96t6zASk801Uv659Shq1Tz/II4YyU4fYCEVS8hTN0YmhEvkXz0GqxOnkhTLRRpCfC8ErdVMUoSPd/Lgyof1O21f52IWC2eJB+i+iwX/jDDRYAxfti45yJJqBC3p1bH/Lv9/b0KAq3u00GGL4kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4326008)(38070700005)(508600001)(26005)(83380400001)(122000001)(186003)(36756003)(38100700002)(86362001)(6512007)(5660300002)(2906002)(6486002)(76116006)(4001150100001)(2616005)(66476007)(66446008)(91956017)(6506007)(6916009)(66946007)(66556008)(71200400001)(82960400001)(316002)(8676002)(64756008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWxCWUZJRDBibHVMNE93Y3l6b3BnbDhsOUtpZ2lPK28rN2x5VGp0Z1M3Q0Vh?=
 =?utf-8?B?YWFkZVVkeHJCbUpyUzIvMzNNRldlZEFKYUJCbUdZQ3RRUUpHZmZiSDRWTlFz?=
 =?utf-8?B?SFJWVXBPelplV3MzRk1BUyt5dzk3Y0labmN4OUVXdklWbmFzd1NZeG9mWHgy?=
 =?utf-8?B?SGg3MXhQaFJDQWQ2Y3dQcWh0WXhKd2wxQnE3Q29URnJOQSszRHFab016WWoz?=
 =?utf-8?B?Z3BvYnFReEVDOTVMeGpJV0NRRTNUSFhLQjNkWkFWSFFTazZYMGVmVU5hbWR6?=
 =?utf-8?B?ZG1EUE5JVHJHaUZyWUFnR0lhTTRmTk9WM0pZTzlCcGlmT3JuckFzdDFyeVd4?=
 =?utf-8?B?TjdabVFrbXhzT0laZjBPMmJpRklveW1xUG5YNk1TK3Z4OVEvYWdicVBkZmpS?=
 =?utf-8?B?SlQ3VHVlTHhRT1cwM2hwc0htb1NrWmFoNFZPMmV3ejd5RGdRcTBKamZVc2l3?=
 =?utf-8?B?M2d3ME5pMStpT1kwRjZxbDcvQUE2cUFNMzVxc2NzTG15dEpiQW1rajZ1encw?=
 =?utf-8?B?TkVpbERzaDJxYUNnbExmOGZqU3FOZ2tVV0tXVnhTQW9hQmdxay9XdzJUQ1pU?=
 =?utf-8?B?UnpqbXQzUVdnMWtGb2VpUzBZSVEydElJLzJGTmViQnpkL3pjeS9LQzlKVHRH?=
 =?utf-8?B?b0xFOWw1QXFmMWI1Q1hwVTNUQWZBbGtpRUtsUmhtczBJcE9DQnpsOWtXRFc1?=
 =?utf-8?B?MURvbDdNYkhHdzBBRHlkWUl6R3hvRm9OM1crOFpUZEpqcmtwRm9TTzNpLzNV?=
 =?utf-8?B?OThzWDQ1L3RML2hiTDdsa2FndVZtT2VnWHEvVkhaRFBnZExGSzFBOEgwNFJX?=
 =?utf-8?B?cGtremwzNFpVK09qbDRtL0xxL3pNMC9lNWZjM0ZZK09NWlBUOW83UUZJS2tJ?=
 =?utf-8?B?VGN0c3BmbDFvRXUrQVlKckkwNVZOY3RzODdsdjNzOGVZZno1TWdCQ3RNcVZH?=
 =?utf-8?B?cktONkhJQmt3Tk1TS3czQ1gvODB2bGJMZ0gvMU9OaGVKdHF0cVJ0U3RFZ3RY?=
 =?utf-8?B?UGlyYnZsanpJV1o4Vm90Qm5KR3FLOXp3WEVaVE1QY01zajZCeWxCdzZQYTk4?=
 =?utf-8?B?ditKdFREZ1RsM0daMmJEalpYNHEzS2FETjlLY21KWUFZMkdmTHJkV1pXYUcr?=
 =?utf-8?B?OUdnMHUxcTJmMmhWM0J3QUZzR3dRNzlMb0F2bHBMaSt6WW5iOTlLbmkyOWpD?=
 =?utf-8?B?NXFQcVBMeWFiOGw1bi9WVHVuaHk3djFwTkU0NWpYUjVFSkRkUC94aWhtWG9h?=
 =?utf-8?B?RzRlNytxclhvS25qRG1OdDNtYWF6K050Z1ZZdkR6anB2aUZBM1VOTzN6TTJQ?=
 =?utf-8?B?STlaZkhqZTZsNkhhQ2tOclkrVWNqV0hhRkVGVDBkZTloSEhBbXZxVEFLK0cz?=
 =?utf-8?B?aUMyNUsrODNEcUJtUEdTM3lJc3haUVhKV3EwaVRUeVNNbmJ4UVZPNE9LMVI4?=
 =?utf-8?B?R0Jwc0JuYXRDU1p0bVprZkNZK2dsNm9Pa2Z1Y0R3TzlWcm11SkYvako1MVJG?=
 =?utf-8?B?Z2pWTnJMb1VWTThtc0hQeityZFhWTTBHN1MvcWZWSkhzcWRNR1hXU2gvbXZl?=
 =?utf-8?B?QW5wU3ZpZG93TldnOG12RXYwM05EaTUzMzZsbU1MUDBTRmpQUW45KzVtRVRM?=
 =?utf-8?B?OHNvdThsdS9pbVJCaUZOWmZKM2JlSnZTdloxVktOY05nRFM5MXNpTzJqSm40?=
 =?utf-8?B?dGZJUTd3dFgzb29wdDZxVW1sRFIveTNMdUVHVkdGOFQ4S3VLT2hLbllLMHV0?=
 =?utf-8?B?QkN5RDRMMGRUSCtXVHFlWmtnbks1TzVHUnZ2VDhEeTFoWVZMVEt6YzVaMkhx?=
 =?utf-8?B?MkdKZjhwdms2TmJ6UmYrOEp2SHpPQlV2NHJ2NnU5VElHNEY4OUYxMVdnRUE1?=
 =?utf-8?B?aDZiZGRHWHFWdW1xOUorK1I0TnlJcm92b1hmT0h0UVp3YUZnSlJGRHlyR2g5?=
 =?utf-8?B?ZGVPU25oUFZmNXZiVk1MaFRFV1kxZERabGRHQnl4U3pRa2RMQW9mOHVDcEhm?=
 =?utf-8?B?dG52cml0SWtXdlphdTJJaGJNUVdZT2twQzd3TXBHVHZxMWprWTZ4ZnN6SExF?=
 =?utf-8?B?VmcyT04vNXV0K2l5S1hqTkFpcG4zK2RsMVUxWHNqd2lqdWZDTjJNZFh6dmlw?=
 =?utf-8?B?d2VycjdOaDYyVmVVTC9NL1BSbHgyWlFqdFBzZGhUSUltdUJ4TnJJSFk2ZVF3?=
 =?utf-8?Q?vfqbz0MItyZm83b/j5whjiw=3D?=
Content-ID: <6B1FCA4E0ACCCA4BB2C51AC063D893B2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75611d4a-6984-475e-ce38-08d9cbf5f8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 00:39:14.7795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fV5JM3SgwTSKn+ilRqi2JWwYsruWlPqYdyO7wAxAB0yQduZeEOTC3aWy4efrzsQvk3VAc8oFwzAK80qimLQp8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6859
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2021-12-30 at 21:27 +0100, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Tue, 26 Oct 2021 16:17:23 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
> > Add two configuration files to support the dual-core RV64 Canaan K210
> > SoC based Sipeed MAIX-bit board.
> 
> You had lots of feedback from Peter Korsgaard on your Buildroot
> defconfigs. Do you think you will have the chance to post an updated
> version? I will mark patches 5/10 to 10/10 as Superseded. This means
> that if you don't get back to us with an updated version, we will
> forget about those patches.

My apologies about the delay. I have been swamped with the kernel and other
projects. I kept at this a little though, mainly trying to address the elf2flt
issue which seems to generate unworkable binaries for Peter, while it is always
working for me... Really no clue what is going on so I am a little stuck with
that. I will work on updates addressing all of Peter's comments and see how
that work.

> Just two additional notes:
> 
>  - The readme files should be readme.txt (not README.md), as we don't
>    use markdown for now in our readme files.

OK.

>  - The readme.txt file for each defconfig should be added in the patch
>    adding the defconfig

Hmm... It is the same procedure for all boards, only the defconfig name
differs. Hence I added this README file last with all board defconfigs
mentioned. I can add the README file with the first board and update it with
each patch adding a board ?

>  - The DEVELOPERS file should be updated, in each patch, to add a
>    reference to you as a maintainer for these defconfigs and board/
>    files.

OK.

> 
> Thanks a lot!
> 
> Thomas

Happy new year to all !


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
