Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0442FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 18:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 979A6408B0;
	Sun,  8 May 2022 18:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msIscPa2GHqu; Sun,  8 May 2022 18:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2CF40898;
	Sun,  8 May 2022 18:12:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB661BF47D
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0BE40906
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCLJVK12GIwR for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 18:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::723])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEA6040198
 for <buildroot@buildroot.org>; Sun,  8 May 2022 18:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljDvjbgGMcnuxUGrWh1HExJ9zEc/HnK4TMO7fLKp/GWZ7TkiZoNzU4Azft5ZeQEKIV5b4RM4yLXYj2SfHlyUHQBPkD29XqIYyCiOyEjo5y7sjjz9ZmATZ60zVMg4g+MgC3zB6MOAbTnPvgz2GTfKnTIMbt01ZEMiD3bxiuBR1CaMejGdWqcDwAq7Qa6Ktc+LYufH7LX4g3dAgJS/9YPUlgIyX7oUXwYngCO/dxupi3hPLM8H0ZJqB6ZUuaRh6/Vj6KGh94TqLOGgNeYnjxuOnpFJpRrgND+qrzlpUgBZ0II5S19P5TSD8U53ULahoHZs6fevhfepjGNn9ko/+cQy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8axs2hhnU07N4FbpzOayZyteRswPed7c0YMXzDNZ0Hw=;
 b=htgADXstBZv7SZjuON3wPjgxRuDK6Fiu+u7cWNV+l8uddvTNBH3YLzWNkLsUvkgYovTSg76kWriVuttrBiLhtOBMRx0G0g9eL0vVZfkCVXVv7CbWy9Hr5K/o8fL7Qm/VUfYeYuJwM6Fr1949fwzeQE3saJd2M0HwKroobM9fRpk0smo6UNJTNOm2v94Wu9fslI2NFwrqGVtqx+z4G0SZ9HbKvjP2rEHkHKS5rzbBRidnSSy2PeixxMbE/zy5+0bi5qR83wRZZSapEkal4FRhXGEq8AG8X1lRb5pfDaa1349F3XcCA5AseNQI4PcLpybishJdcr0t10a4Ve32X9rNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8axs2hhnU07N4FbpzOayZyteRswPed7c0YMXzDNZ0Hw=;
 b=H4kPXvxGZnKTaRsMn0HZu/qZxEvABgAiaLG7Y8HiOViJfIc2ClayITnct+LyHbCZLO3G+LHEd6Yd+W68QWztfRpze3vd3g0V7mean6a8pl2Q9deFnRLehOb5Z8rJxEUwf5FRSD0V37KMoH+wbmwfRz+mZor6EySqx6GKXtdf69g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BYAPR17MB2517.namprd17.prod.outlook.com (2603:10b6:a03:88::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Sun, 8 May
 2022 18:11:54 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::6c70:25f9:2c52:a6e2]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::6c70:25f9:2c52:a6e2%4]) with mapi id 15.20.5227.023; Sun, 8 May 2022
 18:11:53 +0000
Message-ID: <8fc48227-37f2-9898-4705-e854fdd06a79@phobosdpl.com>
Date: Sun, 8 May 2022 13:11:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Sen Hastings <sen@phobosdpl.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <ccf280d8-9a86-84ad-9efb-20038c3f8418@phobosdpl.com>
 <8a5671c1-59a0-32c1-393b-3b7c20e646cf@mind.be>
Content-Language: en-US
In-Reply-To: <8a5671c1-59a0-32c1-393b-3b7c20e646cf@mind.be>
X-ClientProxiedBy: DM6PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:5:334::20) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87126fe-9eae-4320-3229-08da311e3b0d
X-MS-TrafficTypeDiagnostic: BYAPR17MB2517:EE_
X-Microsoft-Antispam-PRVS: <BYAPR17MB25176579EF8A8CEAA750989BBCC79@BYAPR17MB2517.namprd17.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U78XBlJCtyzE4NzLHZFR+tAGa2LN4Y91XzFvpFLpEAdgn0ihPMB/aXENxcXWqhndmqTVzAa8Tzu/ddxsrOo2gVuS/GzygwbMDp0XrZrzxtzBRgIO2ICfWbINamM6Q/R5vU1oQw8YSGV+aBTULJK1o1x62HbpoEzu+KQ76y1q2f9M1u/ahTgKtcs2e5YC3ka+QRT3fzOW0g6/gtyLSWOeLWsoQ2cMrrBOevd+r8Y4PntvXL+aXs85U9/M9M0/RrjXnnj8CXaBbbZSj7yfKgKaeKAaX6b4gZL1ZvaHTs6Uhj6uE7n5j3LfS54MMjCZLvvHeWac7+H/IJ/eE0OYRQ8nZP7eSogVJ9Wv7GdDXV9soGg5dGfLcdPUJ96DDv3q77h8OskhbSKKJpySVZMGxGeUWtURszNKHptd6yaPkN4W9gOCS2OEE03mtYQff92d23YD9Wy4+yKgr+fHT5FxzM+sca/t1cb+cz6fk57Z9AZNUpb1RHojqC1BpdDh2b+D/xO6B6g2RggEswU7EH5Sd/HMkltArZXSIZlKCbRG3lHLoauJ9xsrjqB5utCOaeTaYUrbbnhdA2gwAFk5ivspgjgS/WlKNSgm+e6KST1KHLZJeA/UKN8s8yxx5GYowVOeZfrrfu0Er01sXFd5CJTtaSnUksODMaHqTP/wdvv8n0EFicGu5dj5H9MubF0hUYfXDPBSIvTulATumuLimcJaHTI67tggBRabeKe9ryv9e5cu6E/hX3yArNNNUvZXEJeFPlEr6L0wukmGDMVeNRlamfMhEvz00mcHSXTcWOjoNI2dq4CJVtX0E2G4Kbe21fThnjLmnHyrJ6PNqw+L5/9Sitr/ejJfifGcNGtr6CkuROmnS9juw1UYV49CEZQq4iieGRKT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(376002)(346002)(39830400003)(136003)(366004)(966005)(6486002)(86362001)(45080400002)(31696002)(6666004)(53546011)(8936002)(5660300002)(508600001)(52116002)(83380400001)(38350700002)(38100700002)(6506007)(2906002)(26005)(2616005)(6512007)(186003)(316002)(36756003)(31686004)(66556008)(66946007)(8676002)(16799955002)(66476007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjRmamxwQS9ZMlR5b2dadDFmODdLYmFINXRMeXZ4aTVKbkgzNVlxMTJScE02?=
 =?utf-8?B?K0dQZDl6akczMjk1bFlSelZ1RXVCbkZuMGZ4RzB6cXMzb0cvb1pNS00yQisz?=
 =?utf-8?B?UEpDTDFEd1Viem5CbmN5YlQ0RVoyeXlIaDdGYjFwUUQ1b0UrZytOU0xzWWhl?=
 =?utf-8?B?WUwzV0U1M3JIZGZTTzQvS01nSFZMRHlBQkpZcndNL3dEbXJPcmREcHNwb29G?=
 =?utf-8?B?V2UxUkRyNEFSOFIzcGxxZldSOHRZa2VSSlZMbkJnajUreXk3dU9jV2VUTDNJ?=
 =?utf-8?B?WmZVdmFBOEpuWFdUT09KVTREeXRpb2pBUHFXaDhtOEFWN042ekZlUE5zczZX?=
 =?utf-8?B?cUdnWVlGclF0YjNYWEplMjh4KzFkODN0ajdVc3BhRnRCZWdyS01oOEd0U1o5?=
 =?utf-8?B?NldZeXZYTFFiRG8xQXlZQmdhWVhDN3RxN0tZemxYd0JEaUQvQkZhc3ZDMkxh?=
 =?utf-8?B?Sm1XVjhab2F6VWJLS1FKZFJWdTZSSlVpbkUwbUdOd2dHNTNFZ1BsUEgvamVB?=
 =?utf-8?B?c1U3V0ZiU1gxNFN6TW9PT0dhOTNpSHRLaFVNM29rK0VVY1VLN1pIK2FpNnpp?=
 =?utf-8?B?S1plV09aSmlySXRsNjFJTmI4ZTRkVW1TT0NqVExnSG5weVpySTEyYldmRW52?=
 =?utf-8?B?SFhRaXJLZmZlT3dvdzA2WHBvWXJoOHRMUXBGcHlLaHd2a3l2emF2SUEzbGUy?=
 =?utf-8?B?cGpEUzhZVGlnMXhJV2hMK2gyYW5lR3o3ZmNlSFJXTkxOSmppMzdON0RxRDB6?=
 =?utf-8?B?US9VS0Y0RXErTHZpSmJaQlRGRThUWnNLR1NGb2VwM21ubmlPcis2UXozeXZO?=
 =?utf-8?B?UHk3SkM4OTYzWENhT3RXaisySVVCS3A3UUdhemJDQlJNM1hSYUF3NlA1MHBm?=
 =?utf-8?B?aDIreG56SEVDenhRcWdYd3JmS3lRZytWSjhjWkZYMGlMN1hNOE1kV2w4UmFv?=
 =?utf-8?B?MGpPUW1mWkNkcjdpUVJCNzNjSGhJcDAzN1RUWlptWFVzZWM5OXZGVnFxUVlV?=
 =?utf-8?B?d3FiYzRTZG92WjJ0cjR5QVlXa3pYeDN1K1I1SEV1RDRndUxlS3hMTS9IT3Fj?=
 =?utf-8?B?REgrMnozcTltdXRrdXl0ZEJSb2puSTJOMEhZOW13Qkdrc3RmSWY2ZEd4MXFB?=
 =?utf-8?B?RVZrR3JOU3dQTlJsQWZ6U3JubzM0cG00WGl6ckVJVjhMcmFjWjFyV0dqWlZ0?=
 =?utf-8?B?eGVLV3UvWm1lUWtvRDhxbTZkaHhaOTdFeGUyZjJxYWU3NnZDeG5lZFZVWWxY?=
 =?utf-8?B?UVJ6eGVLb0F5ZnlLb3J4d0VWRWRiNi9HeU5wS1I2Q2M5cllVL0JlNXJOc1Rz?=
 =?utf-8?B?OXFweE1FcVVsS0pXdXVQSFo5MmJTNDBURlZxbUtxb2lvN0NOa1Vibm9vakZ4?=
 =?utf-8?B?R1E1eEViWXNnQ2VhUUtrdnB2SlVDVWgrVWpmR1FlSnhWM0Q2TE10bTNzRkxi?=
 =?utf-8?B?UDJsdnV0Y2tRN0t6U0diSDFoeFRrS0ZDTXQ2OE0yVkZ2SXdZRFV6eTJOeTFr?=
 =?utf-8?B?Q005U004YTRQTklaTitpT280UVNtbFhCQ1BwYTlnMUs5eUxoZVBnTDM2MEho?=
 =?utf-8?B?bENSNTROUk5JclFVV0IzaVZtblFnVjErUlJzSXlNSC9ablBiRHBmUHJ5UjNs?=
 =?utf-8?B?NGk2M2REdXBKMUluWlhocStZbDVnandwT1R6RDZSR0UzejRuZzhOUG5iNmkw?=
 =?utf-8?B?VjNUejd5bW1vRUNoUTN1NEhVS1kvblg4Y3ovbUdUNXhDeEZBK25hYVBHQkNN?=
 =?utf-8?B?UFNvV0kyV3VJZlhDN2tBNm9mZDB5NXd4WU1URHNSaVA4NGFpd2srVWUrYW95?=
 =?utf-8?B?bmZSb1VER1dkaHRGZ2JhSWEzVitBZHoyWGQ1QVZsZzd1aU9acURMdFVSWnhK?=
 =?utf-8?B?czQvQW1ZNGs3VmNFRDN3akNpZmp1VjlZRnVyV0sxWWNaN1JqUzBSZDFkUDl0?=
 =?utf-8?B?VENCcWg1dUJHUXZ4eTE3cGFiRVRhY0laSHkrU1dlVjd4eDJYWnpjY0ozSVNW?=
 =?utf-8?B?Z1FPYlo4ZDc0RGN5SUQ4emVJTlNaUnpGY2JMNDNTUG8rUm9palpJTTRncHpa?=
 =?utf-8?B?K0lPT0FqOEt1V0J1UUdHWFFTbG93UVRvYnNyOFlPSElpZUtnL3FBM2JRS3JW?=
 =?utf-8?B?WDBnRFU5ZzRnM1JhNzEzRHlaNlNpWU5BZ0RYSzg5YzRiUENOTVFZRjZoVi9Z?=
 =?utf-8?B?eVk2WUFnVW9uYmtBUmNLcERmZHFWOEdITlNyTjkxYnBub2VodE9qWFl0aURK?=
 =?utf-8?B?L3VpWHlwQnVzbm9EWFZnZm1vRzlzL3BTcWFldVNOQ3phZ3hpbDcwQWlVWWF6?=
 =?utf-8?B?ODBrVkQ3YkhCUGpRUFFQa1ExMGdKS0V3TzExTy84RDBORkZXV0N4QT09?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87126fe-9eae-4320-3229-08da311e3b0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2022 18:11:53.6940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRMdG1zB7wox3lD7rDMN/WuwlTnKGBuq4xMlGfJ5CNjNP5+0Y0ZtWdYBBQgWxspIsGRjSMzhPkgx+Q9sqXeKsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR17MB2517
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: add kmsro driver
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
Cc: bernd.kuhls@t-online.de, romain.naour@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29ycnkgYWJvdXQgdGhlIHdoaXRlc3BhY2UgYXdmdWxuZXNzLCBJICp0aG91Z2h0KiBJIGNvdWxk
IGdldAp0aHVuZGVyYmlyZCB0byBiZWhhdmUsIG9oIHdlbGwuIEkgaGF2ZSBmaW5hbGx5IHByb3Bl
cmx5IGNvbmZpZ3VyZWQKZ2l0LXNlbmQgZW1haWwgdG8gZGVhbCB3aXRoIG91dGxvb2ssIHNvcnJ5
IHRvIHdlYXIgb3V0IHlvdXIgc3BhY2ViYXIgOnAuCgpUcmllZCBrbXNjdWJlIHdpdGggYW4gT09U
QiBhbmQgbXkgY3VycmVudCA1LjE2IHVidW50dSBrZXJuZWwgYW5kIHN1cmUKZW5vdWdoIGl0IHdv
cmtzLiBUcmllZCBpdCBhZ2FpbiB3aXRoIG15IG9sZCA1LjQgdWJ1bnR1IGtlcm5lbCBhbmQgaXQK
ZGVtYW5kcyBhIHN3cmFzdCBkcml2ZXIsIGFuZCBvbmNlIHByb3ZpZGVkIHdpdGggb25lIGlzIHN0
aWxsIGJyb2tlbi4KCllvdSBhcmUgY29ycmVjdCwgdGhpcyBwYXRjaCBpcyB1bm5lY2Vzc2FyeS4g
U29tZXRoaW5nICpzb21ld2hlcmUqIGVsc2UKc2VlbXMgdG8gYmUgYnJva2VuLgoKT24gNS8yLzIy
IDE2OjI2LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAKPiBPbiAyOC8wNC8yMDIy
IDIzOjE4LCBTZW4gSGFzdGluZ3Mgd3JvdGU6Cj4+IEhvd2R5LAo+Pgo+PiBBZnRlciBNZXNhIERS
SSBzd3Jhc3Qgc3VwcG9ydCB3YXMgcmVtb3ZlZCBvbiAyMDIxLjA1IEkgcmVhbGl6ZWQgdGhhdAo+
PiBHUFUgYWNjZWxlcmF0aW9uIG9uIG15IFJQaSA0IChSYXNwYmVycnkgcGkgNCkKPj4gaGFkIHN0
b3BwZWQvbmV2ZXIgYWN0dWFsbHkgd29ya2VkLiBBZnRlciB0cmFuc2l0aW9uaW5nIGZyb20KPj4g
dGhlIGRlcHJlY2F0ZWQgQnJvYWRjb20gRUdMIGxpYnJhcnksIHRoZSBSUGkgNCAoYXQgbGVhc3Qp
IHVzZXMKPj4gdGhlIFZpZGVvQ29yZSBJViAzRCAodjNkKSBkcml2ZXIgZm9yIHJlbmRlcmluZywg
YW5kIHRoZQo+PiBWaWRlb0NvcmUgSVYgKHZjNCkgZHJpdmVyIGZvciBkaXNwbGF5IG91dHB1dC4K
Pj4gVGhlc2UgYXJlICJob29rZWQiIHRvZ2V0aGVyIHdpdGggdGhlIGttc3JvIGRyaXZlciwKPj4g
d2hpY2ggd2FzIHJlbmFtZWQvZXh0ZW5kZWQgZnJvbSB0aGUgcGwxMTEgZHJpdmVyIHRvIGJlIG1v
cmUgZ2VuZXJpYwo+PiBpbiBhY2NvbXBsaXNoaW5nIHRoaXMgdGFzay4KPj4KPj4gaHR0cHM6Ly9m
b3J1bXMucmFzcGJlcnJ5cGkuY29tL3ZpZXd0b3BpYy5waHA/Zj02NyZwPTE5MDEwMTQKPj4KPj4g
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWRldi8yMDE5LUphbnVh
cnkvMjE0MDY3Lmh0bWwKPj4KPj4gSSB1c2UgdGhlIFJQaSA0IGFzIGEgc3BlY2lmaWMgZXhhbXBs
ZSwgYnV0IHRoZSBrbXNybyBkcml2ZXIgaXMgcmVxdWlyZWQKPj4gZm9yIHRoZSB0YXNrIG9mIGF0
dGFjaGluZyAicmVuZGVyIG9ubHkiIEdQVXMgdG8gYW55IHNvcnQgb2YKPj4gZXh0ZXJuYWwgZGlz
cGxheSBjb250cm9sbGVyL21hbmFnZXIgdHlwZSBkZWFsLgo+PiBUaGlzIGlzIHByZXR0eSBjb21t
b24gQUZBSUsgb24gbG90cyBvZiBTT0NzLgo+Pgo+PiBNZXNhIHN1cHBvcnRzIHRoaXMgaW4gY29t
YmluYXRpb24gd2l0aCBhIGZldyBkcml2ZXJzLCBpbmNsdWRpbmc6Cj4+Cj4+IExpbWE6Cj4+IGh0
dHBzOi8vZG9jcy5tZXNhM2Qub3JnL2RyaXZlcnMvbGltYS5odG1sCj4+Cj4+IFBhbmZyb3N0Ogo+
PiBodHRwczovL2RvY3MubWVzYTNkLm9yZy9kcml2ZXJzL3BhbmZyb3N0Lmh0bWwjYnVpbGRpbmcK
Pj4KPj4gdjNkOgo+PiBodHRwczovL2RvY3MubWVzYTNkLm9yZy9kcml2ZXJzL3YzZC5odG1sCj4+
Cj4+IFRoZSBjdXJyZW50IHBhdGNoIGFkZHMgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJ
VkVSX0tNU1JPCj4+IGFuZCBzZWxlY3RzIGl0IChhbG9uZyB3aXRoIEJSMl9QQUNLQUdFX01FU0Ez
RF9HQUxMSVVNX0RSSVZFUl9WQzQpCj4+IHdoZW4gQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1f
RFJJVkVSX1YzRCBpcyBlbmFibGVkLgo+Pgo+PiBQZXJoYXBzIGl0IHNob3VsZCBhbHNvIGJlIHNl
bGVjdGVkIGluIGNvbmp1bmN0aW9uIHdpdGgKPj4gQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1f
RFJJVkVSX0xJTUEsCj4+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9QQU5GUk9T
VCBhbmQgb3RoZXJzPwo+Pgo+PiBBZ2FpbiwgdGVjaG5pY2FsbHkgdGhpcyBpcyBub3QgbmVjZXNz
YXJ5IGlmIHlvdSBkb24ndCB3YW50Cj4+IGRpc3BsYXkgb3V0cHV0IGZyb20geW91ciBHUFUuCj4+
Cj4+IFNlZWluZyB0aGF0Cj4+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WM0QK
Pj4gc2VsZWN0cwo+PiBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVkM0Cj4+Cj4+
IEkgYXNzdW1lIHRoZSBwcmltYXJ5IGdvYWwgaXMgdG8gYXV0by1zZWxlY3QgbWVzYSBkcml2ZXIg
b3B0aW9ucyB0aGF0Cj4+IHlpZWxkIGZ1bmN0aW9uaW5nIGRpc3BsYXkgb3V0cHV0Pwo+Pgo+PiB0
bGRyOiBUaGUga21zcm8gZHJpdmVyIGlzIHJlcXVpcmVkIHRvIGdldCBhY3R1YWwgZGlzcGxheSBv
dXRwdXQKPj4gZnJvbSBzb21lICJyZW5kZXIgb25seSIgR1BVIGRyaXZlcnMuCj4+IElmIGEgInJl
bmRlciBvbmx5IiBHUFUgZHJpdmVyIGlzIHNlbGVjdGVkLCBzaG91bGQgdGhlCj4+IGttc3JvIGRy
aXZlciBiZSBzZWxlY3RlZCBieSBkZWZhdWx0Pwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTZW4gSGFz
dGluZ3MgPHNlbkBwaG9ib3NkcGwuY29tPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluIHwgMTQgKysrKysrKysrKysrKy0KPj4gwqAgcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
IHzCoCAxICsKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9wYWNr
YWdlL21lc2EzZC9Db25maWcuaW4KPj4gaW5kZXggZTQxZGE1NjJkYy4uMjllNmIwZDU3MSAxMDA2
NDQKPj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvbWVz
YTNkL0NvbmZpZy5pbgo+PiBAQCAtMTUxLDYgKzE1MSwxNyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
TUVTQTNEX0dBTExJVU1fRFJJVkVSX0lSSVMKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKg
wqDCoMKgIE1lc2EgZHJpdmVyIGZvciBpcmlzLWJhc2VkIEludGVsIEdQVXMuCj4+IMKgICtjb25m
aWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0tNU1JPCj4+ICvCoMKgwqAgYm9v
bCAiR2FsbGl1bSBrbXNybyBkcml2ZXIiCj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01F
U0EzRF9HQUxMSVVNX0RSSVZFUgo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgImtlcm5l
bCBtb2RlIHNldHRpbmcgcmVuZGVyLW9ubHkiIGRyaXZlcgo+PiArwqDCoMKgwqDCoCAiYnJpZGdl
IiBkcml2ZXIgdGhhdCBob29rcyB1cCByZW5kZXIgb25seSBHUFVzIHRvCj4+ICvCoMKgwqDCoMKg
IGV4dGVybmFsIGRpc3BsYXkgY29udHJvbGxlcnMvZW5naW5lcy4KPj4gK8KgwqDCoMKgwqAgUmVx
dWlyZWQgZm9yIGFjdHVhbCBkaXNwbGF5IG91dHB1dCBvbiBzb21lIHN5c3RlbXMuCj4+ICvCoMKg
wqDCoMKgIE11c3QgYmUgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIGEgR1BVIGRyaXZlci4KPj4g
K8KgwqDCoMKgwqAgU3VwcG9ydHM6IEV0bmF2aXYsZnJlZWRyZW5vLGxpbWEscGFuZnJvc3QsdjNk
Cj4+ICsKPj4gwqAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9MSU1B
Cj4+IMKgwqDCoMKgwqAgYm9vbCAiR2FsbGl1bSBsaW1hIGRyaXZlciIKPj4gwqDCoMKgwqDCoCBk
ZXBlbmRzIG9uIChCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQgJiYgIUJSMl9SSVNDVl8zMikgfHwK
Pj4gIUJSMl9QQUNLQUdFX1hPUkc3ICMgbGlieHNobWZlbmNlCj4+IEBAIC0yNjMsOSArMjc0LDEw
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVjNECj4+IMKgwqDC
oMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzIGlmIEJSMl9QQUNLQUdFX1hPUkc3
Cj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUgo+
PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVkM0
ICMgcnVudGltZQo+PiArwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9E
UklWRVJfS01TUk8KPj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5H
TF9FR0wKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IC3CoMKgwqDCoMKgIERyaXZlciBmb3IgQnJvYWRj
b20gVkM2IChycGk0KSBHUFVzIChuZWVkcyB2YzQpLgo+PiArwqDCoMKgwqDCoCBEcml2ZXIgZm9y
IEJyb2FkY29tIFZDNiAocnBpNCkgR1BVcyAobmVlZHMgdmM0IGFuZCBrbXNybykuCj4+IMKgwqDC
oMKgwqDCoMKgwqAgSXQgcmVxdWlyZXMgYSBrZXJuZWwgNC4xOCsgd2l0aCBEUk0gVjNEIHN1cHBv
cnQgZW5hYmxlZDoKPj4gwqAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBi
L3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+PiBpbmRleCA5ZjM3NWVkYzFmLi44Yjk3ODdhYTU0
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPj4gKysrIGIvcGFja2Fn
ZS9tZXNhM2QvbWVzYTNkLm1rCj4+IEBAIC0xMDIsNiArMTAyLDcgQEAKPj4gTUVTQTNEX0dBTExJ
VU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9FVE5BVklWKcKg
ICs9Cj4+IGV0bmF2aXYKPj4gwqAgTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8pCj4+ICs9IGZyZWVkcmVubwo+PiDCoCBN
RVNBM0RfR0FMTElVTV9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVS
X0k5MTUpwqDCoMKgwqAgKz0KPj4gaTkxNQo+PiDCoCBNRVNBM0RfR0FMTElVTV9EUklWRVJTLSQo
QlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0lSSVMpwqDCoMKgwqAgKz0KPj4gaXJp
cwo+PiArTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVN
X0RSSVZFUl9LTVNSTynCoMKgwqAgKz0KPj4ga21zcm8KPiAKPiDCoEkgd2FzIGFib3V0IHRvIGFw
cGx5IHRoaXMgKGFmdGVyIGZpeGluZyB0aGUgaG9ycmlibHkgd2hpdGVzcGFjZQo+IGRlc3RydWN0
aW9uKSwgYnV0IHRoZW4gSSBub3RpY2VkIHRoYXQgbWVzYTNkIGFjdHVhbGx5IGRvZXNuJ3QgaGF2
ZSBrbXNybwo+IGFzIGEgZ2FsbGl1bSBkcml2ZXIgb3B0aW9uLiBJbnN0ZWFkLCBpdCBpcyBzZXQg
YXV0b21hdGljYWxseToKPiAKPiB3aXRoX2dhbGxpdW1fa21zcm8gPSB3aXRoX2dhbGxpdW1fdjNk
IG9yIHdpdGhfZ2FsbGl1bV92YzQgb3IKPiB3aXRoX2dhbGxpdW1fZXRuYXZpdiBvciB3aXRoX2dh
bGxpdW1fcGFuZnJvc3Qgb3Igd2l0aF9nYWxsaXVtX2xpbWEgb3IKPiB3aXRoX2dhbGxpdW1fZnJl
ZWRyZW5vCj4gCj4gwqBUaGlzIGhhcyBiZWVuIHRoZSBjYXNlIHNpbmNlIG1lc2EzZCB3YXMgYnVt
cGVkIHRvIDIxLjEuMCBpbiBjb21taXQKPiBkNTE3MzZmNDcyOTZlMzY4MWNkYjYxMDc2NWM3MzQy
NDI3MmQ0MmRiLiBUaGlzIHdhcyBub3QgcGFydCBvZiAyMDIxLjA1Owo+IGhvd2V2ZXIsIGF0IHRo
ZSB0aW1lLCB0aGUgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0tNU1JPIHN0aWxs
Cj4gZXhpc3RlZCBhbmQgaXQgd2FzIGF1dG9tYXRpY2FsbHkgc2VsZWN0ZWQgYnkgdmM0LCBwYW5m
cm9zdCwgYW5kIG90aGVycy4KPiAKPiDCoFNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBw
YXRjaCBpcyBuZWVkZWQuIERvZXMgaXQgcmVhbGx5IGhhdmUgYW4KPiBlZmZlY3QgZm9yIHlvdT8g
Q2FuIHlvdSBleHBsYWluIGhvdyBpdCB3b3Jrcz8KPiAKPiAKPiDCoFJlZ2FyZHMsCj4gwqBBcm5v
dXQKPiAKPiAKPj4gwqAgTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0Ez
RF9HQUxMSVVNX0RSSVZFUl9MSU1BKcKgwqDCoMKgICs9Cj4+IGxpbWEKPj4gwqAgTUVTQTNEX0dB
TExJVU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9OT1VWRUFV
KcKgICs9Cj4+IG5vdXZlYXUKPj4gwqAgTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJSMl9QQUNL
QUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9QQU5GUk9TVCkgKz0KPj4gcGFuZnJvc3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
