Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1571C433FE
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 08:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8093384001;
	Thu,  5 May 2022 08:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTagwEgd7KYk; Thu,  5 May 2022 08:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D45283E9D;
	Thu,  5 May 2022 08:55:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9098D1BF35B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 08:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 854CA401B7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 08:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ndp5CFiOcFO for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 08:55:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59AE3400A4
 for <buildroot@buildroot.org>; Thu,  5 May 2022 08:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROZD4TMNzubPy3zX6f0A3X3Ufs/zN9Zu483JUKsjn+IuyUO0vtENS+OfdpjH0Hcr2bUepvTvJk0gsEpjyVzTMeLcnIdbYnRDvsPQ2d/mTimTsbz8sUOEgmj414TzgnOuS80W10/aUjYdLFToncxcuYBtVYzUwMtbwTUOW1y0XUCxc6N+v65C/M1RkqmnI3gGRI/NkzLA1Smwdo79F6TCi0xHZhbu5u77UlAM+SiG61q9VYt2hB1rU+Fdq9iUvpwudjOrwtFVS0M3iRcChseAghloJI1lXkmehCHRdiyFrg6HEEz8H4L+y91QvtisX1lE3sWMA3JeCiBvrzZS4TLclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5JCACW5hfJ5LcfgaLT36hyEkIZGEMJzvOtoaPBl7Pw=;
 b=QsVNPgXHrSvkKkH5Tvepc0X09ac9FEOsN6FAK0YXx2P7oYyvs50hFsWawQUXRqHCl54tC3pq3WneDgq9OgJMGLECoG8elrfDYeE8OOq7BSck44GPBBVd9Ez6+D13XmhdkQwu0thOs7mmX1abwrOlrbYD4O1PSNDC3/309WsqebC9WeyQ48U8IvH6SIVFdbEfkmN38wkG3B/yvf3RiDuPdG1Xeo+A12kJO77Opa1tnv+LBYbwJdBfbgbZoSdFYiV5PKWTC/G8fI2Kfv41uj8qqt7KjX+F/S5f3rSicybn/OqHcTJHzppBeHAGccwYTRCcn0bGHJZFOxDGWHB//sA5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5JCACW5hfJ5LcfgaLT36hyEkIZGEMJzvOtoaPBl7Pw=;
 b=BybCiHkc6KH30hFdzUbfWRW61hAEzMe52t3ydQmv5RJJhpw4uJM3vjW8Wt0P/l8cvFG48x81SOj3WYPMdZfFoM6idZRv03dGzvO33c63nYHZLcqxAvx7VRgv23Rk5m8Pz2D4R7GC7d2QuFG1g7V634hANSjcya6LkL8f25Gyyvg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB6299.namprd02.prod.outlook.com (2603:10b6:5:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 08:55:44 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 08:55:44 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: uboot dp pll
 patch
Thread-Index: AQHYX7/lLybNbXyyHEO04Ld4I8ehla0P+gIAgAABzSA=
Date: Thu, 5 May 2022 08:55:44 +0000
Message-ID: <SJ0PR02MB7758B8B166190E75571BF5EBD7C29@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220504140417.1204631-1-neal.frager@amd.com>
 <58490506-19b4-081a-8240-cdbda33aa92f@lucaceresoli.net>
In-Reply-To: <58490506-19b4-081a-8240-cdbda33aa92f@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78b762ec-185d-4224-3f23-08da2e750a1e
x-ms-traffictypediagnostic: DM6PR02MB6299:EE_
x-microsoft-antispam-prvs: <DM6PR02MB62999A67CB9428B8A29036F8D7C29@DM6PR02MB6299.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hyk83nZk+wXKJYH5Awh9auzWj5VlhVRkhq7K47Xoir9XypcTTNDLHXoIjW8Kc48t5goJCGMMlKx9DK0zdU+Il/2BHnwdyErI0QSkJpRcBvAkGG5xO+7I+5SV+1hZv+XUQXQ+qigOTHxVwph1LaRSDWk4cHBnDot4Ae1cK6Zw126Z7r51LZ73pQh7HTbkbmL7G0gyoIszz5dlceKMIgn1eBZJ3pHwhOp1b45MKFdSOHhb/2OyuA3HMv3KfEEeYFWPKIiIn0JPEkJiocPHmBOv9WqmJgU6jsUyiHa97GWD+S2RPN+LOBppixkTCeQKk6NybWCRXc+/oOQHJIeaLisXRxvEfBGYh8eaAX2af6IHU9WQlEd1vL6whKHQSbR7uGaxuFNHU4OIHOIwTIPOE+nNFYIYC1fpEwsRpIOYzdSbyiHET6F9mIYKFXLecdRIzA4nkf0gBU9PINfC0lE7N8LoCsL+aokHA+e6bQHdxzO0K91OgaFifGRMSJDn0DhGeD/pOQCouRGQP116nC8tlq94DSx1kymuLxnTv3bhy6HcqWJ7vGi9XJx+TEsUAYjGssI9DwwkNv2wZWWM+ZUDagIHJsJ4GcJZh96Nl0mnku9mgstJ6zY9jo5ZgDFwfQ2N0OUIXw62zmMY1FQAYPUL4HKD87BJAijbWD/9mEQqNxrthnwLhuYMsnRkQa7HvMxc1nHp4yomaljHVzNKCZTkH7uIXA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(86362001)(316002)(4326008)(5660300002)(38070700005)(2906002)(38100700002)(33656002)(54906003)(110136005)(186003)(71200400001)(83380400001)(8936002)(9686003)(6506007)(8676002)(7696005)(64756008)(66446008)(66556008)(4744005)(66476007)(66946007)(76116006)(508600001)(52536014)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZURsK1cxWTZkR0JjREJUblVhUk9yUm1tSktGNDhJR3B5Rmp4TGx1ejNuZ0xC?=
 =?utf-8?B?TlJsWWxqTVVhZzV0cmEzdmd3eVFVWnhiWHZUS2JyMkVlMVFvMHFiTkQzSHZ0?=
 =?utf-8?B?TVRsN3RBaFByVGZPQS9qZ2kydDNvdjhQejVzeERFRVo4WUVRZ0hoYmtUU3lw?=
 =?utf-8?B?WFdIOWJsRXFiaWZQR0dJNGZXd0dvZWNad3dOY3VhMjhYN2d1Mm4yRFJZVUlM?=
 =?utf-8?B?UDZJL1lucU1SZ3RpTTRCbGN2WUtDUzVkemR4ZkxHV0J3TzcvTFZ5VHdtUURS?=
 =?utf-8?B?cnZFTWVBZm5DbXVCZDVyanc3NHFmUS9ES1pXdFV0bnVoWWNqcThVWWpNWTAr?=
 =?utf-8?B?UWU1S1c2eXpYbmgzTVVhMys3ZjlKU0t2MVNWb0QxUWEwRGlEWlRGaU1lMHVS?=
 =?utf-8?B?Vy90Tnc0aXZPMVZDUWFpcUdOSFd4VEVFa0dVajcyZnFRY2ZoMjRxMmhoV2x1?=
 =?utf-8?B?eGVqeDB1SFR5OVozdGREaVJwNndSNjBWc2lSOTJwOEduUmZJVnRoOGNjTnp3?=
 =?utf-8?B?T1gwaTFPc1VQaC9sR1E5V1J6RzM5QVJoYi9GbDlIM3VPRjBUUHpjaHplV1BI?=
 =?utf-8?B?eEtpUmRQaHhFTlhqdGQ4dk0wMmZQYXFmQ2oxUDg0MVJvY3BOYWpzUU9aaEZk?=
 =?utf-8?B?QlRZTElGQ1dkQ04xeE53bUhFc2kvU1U3Q1pYSzJBWEpjWlEyd2ZFaFRrSVh2?=
 =?utf-8?B?b2VmVHJNQklsVVF3dytPSUFBTnNzcFZDVWRtZ0kwMU14M04wVS95VVlzd1VY?=
 =?utf-8?B?WnI1SUE1c3c1K2ppS1dHQ05KSk1lYVVSWnFqQmYxdWhoam9Kdnc3bzIvZFgz?=
 =?utf-8?B?bGZxWGJEb3AwS0gxa0FFbTBscmdselczWGN3L0ROZ3hhR0tRLzlYQnQ4VW5N?=
 =?utf-8?B?eXU1bGtlUU0reXBqVXFaQ0FIbkVPeENPS0VaREpDWDVkVzBWUGFOeTZvNy9K?=
 =?utf-8?B?OW9VYjYrTHBMUjFyWTlSTlNQdzBwbEZ0UXVkamdWVGVRd3ZTTXB3dFRRNlhq?=
 =?utf-8?B?cHlSMUJXWWJGRmxpTFZaVGVtTURjVWdYQjJWZGg0aUZ3Wm1HdDJqL0xSSnhR?=
 =?utf-8?B?Y3NONHIyVjhQVmhXN05zMzMzNU9laXJIaWlpWXp5QVJXTzNDaWtyNFpKVFNE?=
 =?utf-8?B?dkFtcUU0aThNM05nQ1FLZmlBbk1OS29SNUxJc3gweVhySFV3OW1LSk5SQ3h1?=
 =?utf-8?B?d3JjWTdPaGlod29pSjhEOXNUT2RXanQxaURNOHkyRnR0NWNqaHk3L1Izdi9D?=
 =?utf-8?B?WFNOZVJzVnJSQzBnU0NVallxdU1wdDJZUnFSZlY0a1JpSE5FRS9EMmJCU0NP?=
 =?utf-8?B?VW81MVYyNzIrQmZubGZZcXJoN3ZnT2p1Y2I4YWxtQllaWUR0eHVNU3pQZFJD?=
 =?utf-8?B?WXBKUm01emFoWWZUa3R1N2ljYXVNOXRzUXk4RHJFS3daRkZJUU94VG1MSDF0?=
 =?utf-8?B?TW9tcGJWVENISnZuS2tqQzJkQXhpUW04TmlkcllnZjQ2ZndhWDNJMTQ2Ly9h?=
 =?utf-8?B?ci9DSk1hSExQWGRxNElCWjlKcEYwQVRPVWl5eW9oTkVUUkFzQkhiQ0pYcStY?=
 =?utf-8?B?L21zVHAydks5Ni9FUWpCa21BRkVNbUJxWHp2SDFBdVlYWHJycjZNbFNkV056?=
 =?utf-8?B?UStScFBPZkJyaVh3RmZPdzhXc01XSElBOFV5alhUaGl2ZC85aUVXYU8vTWgv?=
 =?utf-8?B?UjNUcFhPbEkrOHdQTjB1U002dmVyNHlOdGppV3ljKyt1cDRjc1RoNUN3SG5I?=
 =?utf-8?B?OVo1MFNUNEdNZnJQdXJWUDdWQmlIN1dFRzFLVUtnd0cvYnZyaGd3MEw1azB4?=
 =?utf-8?B?aFpNZGFvdk1aQTVtMXJaTlhsZDZaOTc0WkdBZlI5TCtyQXJFb0JOb04vdThs?=
 =?utf-8?B?M2JZL1JzVVhIMEI2cy9XcWErT25TclhDbTJNRVFjeW9KSmVNMlpjU2ZJQlBj?=
 =?utf-8?B?VERMU1Y3eERJeTRsVU9TaVg4ZE50SUlKYlY1VnN4RnFsYzdEaWZCcXYzRVlD?=
 =?utf-8?B?ZUVVdi9tV0VjbEkxSi9hbmRJa1BleVBIemZvY1pHRlFidGxBNkU2ZU40UURJ?=
 =?utf-8?B?YXR1R05oNkJOVkRiakYza2JCOSswYkIraTI3ekI2RzdQbTlLanFIMUV1T2lt?=
 =?utf-8?B?NUxYMUZ4L29aNmhRVkxJNlBJOFNMUU1lQWhDVmI2azBsUFVXMThPek4zQ0hs?=
 =?utf-8?B?WmJ4QTZFUjhucVV1UEsrOUg4YWUraHdTSlBIdUMxTGxVK2QvaWkrYzVqL042?=
 =?utf-8?B?eXhLTGN3dXNaYTR5TEVaNzA3Wkw0MzB2VDVLK0lpaDBYb2ZOK1lzb0pxMG1V?=
 =?utf-8?B?ck1ZVkc0UHV0MDl6ZXpjbGprclh0NENVVCtkRHFTS05jSmh0cXJiRG4xYUxu?=
 =?utf-8?Q?5BKZy+8RiFkhSVsj9K0zHEcCJ/UbvM1EO1/9Z?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b762ec-185d-4224-3f23-08da2e750a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 08:55:44.1527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SMtMdyXSMVTTuCE8FBI6+RAMDh4wQOcUto9FODfEL/x/LGYZq7BxPYgF8iAOfWXBDN9dDX8yp2dQognvYmm0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6299
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig:
 uboot dp pll patch
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
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> I haven't seen this patch on the U-Boot mailing list. The best practice for fixes to packages is to send a patch to the upstream project (in the U-Boot case it would be a patch sent to their mailing list) and then integrate it in Buildroot with the addition > of a line such as:

> Upstream-Status: submitted (https://.....)

> To have the topic traceable and mark that the patch is probably ending in a future release.

> This is not a major bug, it is rather an annoyance, thus it's worth spending a little extra time and have a clean patch here.

Thank you for your feedback.  I expect that Michal will be submitting my patch to the U-Boot mailing list shortly.

Once that is done, I will create a v2 of this patch taking your feedback into account.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
