Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC95C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 04:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17566106F;
	Wed,  4 May 2022 04:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJXbvJ8Ydpi5; Wed,  4 May 2022 04:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D846106D;
	Wed,  4 May 2022 04:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEE3D1BF397
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB0F940126
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezPNeGa-9pZb for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 04:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::628])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54F8A400C6
 for <buildroot@buildroot.org>; Wed,  4 May 2022 04:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1I/HmRe2+RKpo/Q0w9supkcosD8rzj/GLmV6bzM6HBpj4y2cb+CETGeXuDmNVFhDzrfFIr87U37MmWQjtmzgD3qtgi0WjXlSG2af+84lM7nb2vjqkIzpamlWM3bJDQK6z1pHA806DaUe68tKAItxd+TCYDAMjj/4Z3YR9LFphPV5xCT7VcxjZ23uHxFslnns4vRWmbxdVnAHkqlBRVT8xswxWaOg/CBiMqg2/Q+nE5AmsI1dXuA92P8lPc1rsyGwxh6UvoaexPKb+A+Zvi27vdv/RXsgIhbOICrL4eG0qLU/rv5MsWAlikIWZEyrO/WvqESeMds1F/FgPoaEedM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXJnN/uhvBiG7mbINHlpfbP32y6R6HrWlB4wApMu98g=;
 b=ZnvKaPNxCx3wFN+I10DQaYKLnsGf71u/PKiyWFuztpHynEsXEVwEanW1kaBJGpYQ15Gp+/p4WUx6PWGL4gEeXeiUNrOZWD4auDxD3V7g2EpmZn3hgqf2e/hAn0akEwEBROmL3O7MNCa8xD6cLexnMNQYYA2QYJw1+cMuv7EbnlSAsnaoMsBcL37kiKJWzfLACqH4MO9EYKT3KYvMhF0/ENDgm+ykuz0NQu8lt0akHhM5X3UjUdh/G3KL9CoKTZJfINquFf7V9QrStzT0lqD+/H1Y7Kkd0teCdqfv15VhqDIxmp5zBNdy0VWOz0dwLUFL/zh9d1mKSrhRUJdZaErlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXJnN/uhvBiG7mbINHlpfbP32y6R6HrWlB4wApMu98g=;
 b=Q2tuNfu9wlFXhkTphGKSlZrBdTdeSPlWqvdxF4YDHrrQT29mk1EfreQzwxSmVnlTlFaMnQJVOdk4jU7Av4zKgmyR0APZTy629rd+h+wXN4UQ72ZWCYpdz5N1k4KtHDNKHKuaAAx9Ha/OsjyHsjXqU8bd0meP58oAD/ZlcI7HuyI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN8PR02MB5906.namprd02.prod.outlook.com (2603:10b6:408:ba::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 04:03:06 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 04:03:05 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to Xilinx
 2022.1
Thread-Index: AQHYXgEWuvUaJhqW4kOEzwcFjmReG60NpYmAgAB14CA=
Date: Wed, 4 May 2022 04:03:05 +0000
Message-ID: <SJ0PR02MB775849B52C24CA3FE954E027D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220502084506.4054715-1-neal.frager@amd.com>
 <dab01e63-1617-e93c-3e39-1834df2ef008@lucaceresoli.net>
In-Reply-To: <dab01e63-1617-e93c-3e39-1834df2ef008@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1062241-34ec-4764-0805-08da2d82fe0f
x-ms-traffictypediagnostic: BN8PR02MB5906:EE_
x-microsoft-antispam-prvs: <BN8PR02MB59066B870B95E0802F20C27DD7C39@BN8PR02MB5906.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kVc9q6Mo+N9+qNbQKuW6jbIehqtgTm1rW3Q7D+lHU1dMP3i3CXE7izOzltqX5w/3D4eQKbxCJ1g5reXXMMaItdu4qidiABj2lski0DDfHsIlHbN5Hj2v7s5iBjcbEJ4DNq8sHWo4djVs2I/8emMqQr1HaHH5ASK9d+K6ZwwL1hNRK5oM10YDOfCYg7kheTguBNhIXjEUh1ARd9g7yNnQ7jieonLYxR+3nOfWWhPtXObg21mbJ+ktke5SHXDBgfMaeS3wTm9UkSEAjaxKwzj2UX1yqMkl1sj+VM9BaW9GkAufb1EkAnaFLB1NAhzcLbq+W5m6hbLUmqu76Xw9GgKxqif63X5+pK6vZlfkccQydGa/gq7mFwvBNasAQRv/YpsodqAEE6p8/yuf35h89ovVIcEPyaZdiGYpzBok3kUGbBbHmb0ZV7VTw4oAElAzIegCv1zYd5m4e4Bh/SX3q8K6fXbK3GnprA6+EcyaN7iE1x01MR6XLmlImpi3N5nsY/ELzVCAhxZYkNTidV8MF6SNdkXDsQ9UZrtJmIGShHk3nc3d4RvvDQknnEhd0ttKdNL5q54aOJX2muD/eOy1KHG9Du9N9frOqBV4d97ZRCbD7XmnPWLeWm/fDNmEeawc84tZyoaPJ9piuPxEXvCJIJPfudh2hQJg5pRFSp2jigGbUmDOGmXZ+p1iWp6MIYRQhWAAgFtagwj4MSIg1GnyJGnVWP7Xp2kvl7meZNhfQ9O0OTmwpNa/ef4iWxK9/yNd8fax
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2906002)(83380400001)(71200400001)(38070700005)(38100700002)(9686003)(186003)(76116006)(4326008)(64756008)(86362001)(66476007)(66556008)(8676002)(66446008)(122000001)(66946007)(6506007)(33656002)(55016003)(7696005)(8936002)(316002)(52536014)(5660300002)(110136005)(54906003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmUrRjQzVE04bXdwbHZlTkxzY2NDbnJTM2dSRWIzaFlFWGZmNVlZTGxsM1hz?=
 =?utf-8?B?ZjZPSW9GVG9rZi94cjFCRlNMeUVIRUdjWURBcnozaWlHOGVqa2x6VmtFUDI2?=
 =?utf-8?B?NHN5VnJ6WWt2QjFIVEdTK1dVOXREU0FlQmF2Z0FBSi80SWxhRmlKclc0Vi9Z?=
 =?utf-8?B?NFEvN1hhZjd3bU1lSE9yMkNreDJ0UmxCV292SG52UUZLSWpzSlhsQzBseS85?=
 =?utf-8?B?LzFKQ2xLRWd5UWlZeGFWS1pKNndveEo5OU9ETzFSU0dNeWxnemU0dXQ4ejQ5?=
 =?utf-8?B?cHNXTVhEQklwakNIdUV2OUNNbzEzMEFHUGFHZG51M3RaRnJlRmp3d1VaajNU?=
 =?utf-8?B?NFFNYWNuNk9TZFRpZjVSSzZEU2ZudGRTbzBlVzU5YVR1emV3MktIQjJNSGFp?=
 =?utf-8?B?RHJGWVBnUWJJY3k1UmpVWWFxbGxuakh1OXBMRzhQbUsxTGZ0SHgySnlEVCsv?=
 =?utf-8?B?RDVON3RMdzRtdXZkQkcrNDVFOWZ2NTlQUkNtWTladUhkWFNvOFJlVGVna2xu?=
 =?utf-8?B?a1A5WXZIcS9vcVExQkJrVE1CS1NsSUVSS2dzQktlM2tGeDlvdFcyOUV1b2hR?=
 =?utf-8?B?d21iTUprQkpjOWQwVjIwREltWURWbHR3MjJrUWwyblBSTTU1dGpGeXI0ajc4?=
 =?utf-8?B?MXlPOWRkUWNnU2hQSmducnNHbklpSTJXcS83RXRGNzhkMEZhV1QyVUhEN3ZN?=
 =?utf-8?B?dnRHd1M2cERKQnBOOFROS0hyNGJTWEVkeWdIS0lpUTMrUFQ5Rm5zVVRKdGo0?=
 =?utf-8?B?Y2tack0yNlVZZDFkU2NnRUhSa1l3SW5mZ3VVUFhXSlpKd1ZPMmJybUVLL3I5?=
 =?utf-8?B?a0E1S1N5bk5GVWxvUzBVOEJhdjB5SXRwbVJTa3hZMERyZHkxNTRPVEdmY3Zw?=
 =?utf-8?B?V213MFJ6a0VjVEdJNGpWVnJJb2xSWXYwRXp3L2Q0MjhaTXl5Ni94RFZ3MWRr?=
 =?utf-8?B?WllDcUFERXJnR3dKcUNpYTRsd3JOQmR5SGhFcWpjY3AwSENoWDl1dFdTeWVH?=
 =?utf-8?B?YTJPbkRmN1R5UDZmcFF3OW9TU29iOEx3OXZDWmtXTTEyRkIzSTJJeVBNT3FD?=
 =?utf-8?B?b29nN2xQa3lScUwvT3JiYXZyVlgyeWk5VjRqMFkzTVd5QnkvN0ZaUW9BR0Ev?=
 =?utf-8?B?QURyOHo1VjRKeXUxNy9zQlZYRmQ5MjdJVnhYTzNLRFJFVFV3VnRqK1laSlJF?=
 =?utf-8?B?bnpIemFNOUZucGpJZ2dWU0NFMk0zQ2VYNEpXTGFacFhoMUhsMHduTmI3WERI?=
 =?utf-8?B?TTNYTDZGbXBtZjBFK1JRa0p1d3Y4eURqWGs2aDdsUXBRMHVlVTYwTGRzeXFI?=
 =?utf-8?B?b05HNzZySkQ4VTJtZ3hVVWNBaGJkVVlhK0lMK3NlYXFuR01RUE04N3hLaGU3?=
 =?utf-8?B?VTV5MTVSRDI0SENNMjJZdk1hc2x2d20wbC85TjlUMW50ZlhuYjErL3l2a0VV?=
 =?utf-8?B?blFyZXNqVlE1T3BQUGtwUHU2Y0lHaitmbmhLdmZHZFFtTmJKTHhQZ2MxVDdk?=
 =?utf-8?B?VFlTYmd3REk2UHFlMkNGUHgzL2U2ZkpTdDJROGxFVzdCN21sVThGL1R1Ukgx?=
 =?utf-8?B?cWkvakQzQVpuLzQxVWZQNnRQY201TmNxcVhkWVhOeTVaakU4UzdTTllveFd2?=
 =?utf-8?B?YVdncnBacTdZUWJUYUZqMkQzZVNvcVlNMnFKL0NsdVJzUUxjRHBUWmhQTXFX?=
 =?utf-8?B?MS81aUFVamRhNnRRdHhGbVZwN2R5ZjhDZzd5NG96SldXelBwRlJEeW1IdnRz?=
 =?utf-8?B?ZjA4T1cybkhLVFdLRnloZFMxaVVtTzZPSVF5dE9DdkJUSENheUdRQzRhWTNF?=
 =?utf-8?B?b1RIYjltd3lKY0wyNnBaMFFxK0lpRnRZcjBoaUVIV1Y4YUlyaFhOUkp3bGdR?=
 =?utf-8?B?YzlPUittT3VabDRsRTBJS0U1Rml6cnY0TUFhL3ZkT3p0YjRGN09NK2xIc0I1?=
 =?utf-8?B?SFJ3OTFRVFVJYThUVmtGZlU3SDBzV0JWNGxSZlh4UnFIdGZjUlI3NlYrVm5V?=
 =?utf-8?B?MHJpbDZsZWxhOHFucFpBUUw3TnUvZnhMN1hxRUczbmRtVEdWK29vWWcrb3RI?=
 =?utf-8?B?S2JOaWlNVnFHUHNYZXVXbkJhdnRBNUNLY01MTENZTE1PN3gyS2R4dGN2UmRq?=
 =?utf-8?B?UVg0Q2tHeXRPZE54TFg1OFlCV1c3RHdGcHBpY00vd2xkcXJFYmszbWN0ZGkz?=
 =?utf-8?B?NVBLOHkrTUVQTjZJWUFCRjVpM0U1QXFXeGNzaFNDOEdYZGQyS3FqNTltT2lh?=
 =?utf-8?B?MVNVaHZZYUt0YU51bVFHN3RlSmFxbEZsbWhEWkl3Y1hZU3U3cmpEQ0Y4L1Rh?=
 =?utf-8?B?UncyT3lLV2Vxa09lem1lMWZZNDN3U3BGR1ptN1dJR3c4c08yd3kvT3pFSUZu?=
 =?utf-8?Q?5wnW6io6Sdy1r040fRxZJTDzxZZIzUoGemJ6OoIp+vPQm?=
x-ms-exchange-antispam-messagedata-1: TnluDZEG69mB1A==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1062241-34ec-4764-0805-08da2d82fe0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 04:03:05.6649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voMAibSNbR5qQjhjocY+IygLqRxAqEXev2B29VjZWrnYE2OjcBHSwrP3bS2p3uaFsPGbaB6pQm31t6nwx+XqIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5906
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2022.1
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch bumps configs/zynq_zc706_defconfig to Xilinx software 
> release 2022.1 which includes the following updates:
>   - U-Boot bumped to 2022.01
>   - Linux bumped to 5.15.19
>   - rootfs changed from CPIO to EXT4
>   - extlinux.conf for distro boot support
>   - U-Boot migrated from git clone to tarball for faster builds
>
> This patch has been build and run tested on a ZC706 evaluation board.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynq/extlinux.conf        |  4 ++++
>  board/zynq/genimage.cfg         | 11 ++++++++---
>  board/zynq/post-build.sh        |  8 ++++++++
>  board/zynq/post-image.sh        |  6 ++++--
>  board/zynq/zc706/uboot.fragment |  1 +
>  configs/zynq_zc706_defconfig    | 20 ++++++++++----------

> Most of these changes affect all the zynq boards, but the defconfigs for three of them are in separate patches. If we want commits to be atomic
> (read: bisectable) these should be suqashed into a single commit.

I have squashed the patch set into a single patch with v2.  Thanks!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
