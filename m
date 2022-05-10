Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78985C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 04:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117F460A7B;
	Tue, 10 May 2022 04:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxDCq1Gvb3rG; Tue, 10 May 2022 04:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294F260B63;
	Tue, 10 May 2022 04:37:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076B51BF977
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA3F860B63
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gapGKJ_uS3FU for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 04:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE1D060A7B
 for <buildroot@buildroot.org>; Tue, 10 May 2022 04:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QENvnC0mlDX7CzRO3jB131ab3er30gwuNw+JnRvHgqdkmAwD5rUDu4r35xTC0uw0lCQh8I2EmXykCOe88W0pu1NO+C9Y42ZlpmUbhQ7dQ/uek3b3GRIXjqU910F+a7N67NS9fUV3rSiZN/ni3I482mlpCowfSIizFYoBPXdr6qxuumru4wTXcaUBmV7b3z9XouvSlcYCfmT7luS/eNJF3hinBKzTtf4H4NH29h0HFRUTk00Qli8J/x+iHkqDzlkDX571Sftnrvk+ACtv3hquij9Vm0RP2Bz5hgYI+q4VpMzqTeJSOa6EGjOcncpZqT8DKwz8IIXZAg/S73pmTSmAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S3IRW3hTMu3oGEpZQzj3a1dN9rg4JEOJI/E83TPg4M=;
 b=DKNr6hE4HFXNCnNkAuG65w61jbrlgEggEajmWoxCfEAixWmEFvTZ/ZJolabp9fvAzAH2+grSBpt+RFlyEBzylVIJ4yHnHaB3lbJZvq3lUV7wteEENOq33mXOklf12cMFovWQLf9GnH3304bNjT8gPBzaZi/RA/YQMeDb54kgMSgGAUn2S2pI+bSdad+p83k/bZNlUkx7ltEsUy7ry+ZHwk+QvHg4fp2Z3UUocmq6/J8psNsT7CqW9lPwbXozahLZQZB6sBV/uqCiYXKVh4kuZx3q0YoxHUplOfCh9pPyfZMISPwI52bpCyHREfqZdsJmi7swSdCvCzsSjjL0X6AKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S3IRW3hTMu3oGEpZQzj3a1dN9rg4JEOJI/E83TPg4M=;
 b=RplxnJZWXLP4no6X5IYSziwmVQjMDvKn8PCphQh3A6leRehJVfKW1ZofX/o4RrHX3107Gk2RaSQTsChNzrP+R7XijJ5VF2iDcyC/Lzj8FUVPCqZZ/SKbEGIw7NRN8PODD2uK8Ytr6c2NmtSKAWM0CslZlvWP3ORSiRKxpEhahfI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN7PR02MB3905.namprd02.prod.outlook.com (2603:10b6:406:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 04:36:52 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 04:36:52 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <nealf@xilinx.com>, Wesley Revens <wesley@sonifex.co.uk>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, Peter Korsgaard
 <peter@korsgaard.com>, "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJCAAAWyAIAAKG0wgAANy4CAAAB54IAABngAgABDMbCAAJ2toIAAArZg
Date: Tue, 10 May 2022 04:36:52 +0000
Message-ID: <SJ0PR02MB775813B561AF6693C59BD6B8D7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
 <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
 <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
 <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
 <SJ0PR02MB7758E384FFAF82E99CDEA261D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758287753500487E7078A4AD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758287753500487E7078A4AD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: michals@xilinx.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58d4233c-7cb4-4830-28a4-08da323eb49c
x-ms-traffictypediagnostic: BN7PR02MB3905:EE_
x-microsoft-antispam-prvs: <BN7PR02MB3905C8A15DFC439F56FDF108D7C99@BN7PR02MB3905.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FXgaXucUHktp/O/qj/aA9nQTBCXAuM5OOfqwziLrbv9LBUCa58AZeTxRKxISRDj2P3sinQnrcy0oqgrtqiqGrwsSsaHpQfJQ7W6SpwVwobfTOjcPPmMcISmH+bTIoUCIhO4WCAfAqTYqy/xNR8ZAqkhAtSQN1OyFVbnAa9pxLO2DeYV/hS2LPvlYzDuRZfZ4Gh+eSF0mUwCozgag1L9Lh//nXADwOZl/E3d3mdiF+SxrnRHuUyMzKK6HI2HyY4er6WfKqNNCj/sHh4gKnSBjjz3Plw/uTsjm5DmQK3mmmOAhyinJNFjFB/0sPS3kwqjln6xkjvUsaC25QL50W9XXrO1Kzuv2Rgzka0UUdcrkL2ZMWtreYVTR/pohyr/5C1tUvRfs+YjenRiTXOQj8fGhiD5pnQmtgTJTwNejhk399Bh2DTdkq0Qfgik3ZDNk5p3A/9MivXKgC7KP5voWGrz5MU8zEuaw+84BCJ/PFnRW+OCfIjUYep/0z8AWnDNSisLpgk2dPA9nnOewKUu472kU2q7+5r4iquZ4sMzF4CBOx3kUMyZkMm3EbAF8xqg7kJaxqd8HTfUEjVfzK7QJCbifZfm1/4gV+3RgLF614389DKwCLNvz1zEINruMgpGUuMR1NW0iW1KMijrM0BgxAWRuQZqdtNv3UDZG3WXVtXzVmIv2vWLoV9TBdM8TtUzgosT1bODBanN5ZLJLnH1wHNS5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(26005)(186003)(2940100002)(9686003)(5660300002)(4744005)(122000001)(8936002)(66946007)(2906002)(83380400001)(4326008)(8676002)(66556008)(64756008)(66476007)(38100700002)(66446008)(38070700005)(6506007)(76116006)(52536014)(508600001)(7696005)(110136005)(33656002)(54906003)(316002)(71200400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGtkdVFLeVRnQzZraGd4ajBCcTUzK3VMSUZFa1lvN3JldCtBd0xDbmVEQnNy?=
 =?utf-8?B?cGpVa2ZPWnY1WG5KTXVGeGlGR0NHWDhwQWl4SVhWMkJhNUZIN2xTUG9SUXZK?=
 =?utf-8?B?akVRcU9DbHlURXZNUHBEUXc3S2hQY1R4STlrOUp3eUpYa0ZpRmZVRFRSbE1C?=
 =?utf-8?B?bjJZaXI4WjdkSDZ1Zk95ZXJlbnpxZVhrOHIxWmlhd0ZIMmw1K2hJYmFPeXY4?=
 =?utf-8?B?a1UvSWQwSDJxODA2TWNrRGcyT01FRlBCVHFZK3pzVFlBdVVkRk95N2tKMG1l?=
 =?utf-8?B?aEtPaDN1RHFNM01LYUxHTkJSVGc0a2E3S0ppeEEyTUtxT1dBdnltUFQ0NU1T?=
 =?utf-8?B?c1lsNTBQUEpabVAxM3RhVmsrZDM4VjRBR3VrcEEyVE4yaG0xRmNXVm9rbjU3?=
 =?utf-8?B?cENKd21YTVI2bko3RHRsMWJKR3k5dDZBbFpScUNMdWFPSDFLdUd0eUU2SW9y?=
 =?utf-8?B?TEdsdnUvRmg1ZXVvWEJnZFRoeDdQTWlLL3BvUkFFZ3JaVFltS2ZRM2w5cmRE?=
 =?utf-8?B?QXgvMXFWZGJ4dVJCalozTGtFZXJUOHB6R2VIYzMwL2Fva0ErdUJIS3BiYTNt?=
 =?utf-8?B?Z1dTZ0dtN1FwTzlEcFAxd0lJQzdZeUN4eWNhYVZsTk5qV3V2UlEwY3B5OUJH?=
 =?utf-8?B?SERwUmk0WU9zd2tCdU1VK0N1M3BYTTRxenhKMDFvWlI4THJwQWhzYXlWMXE2?=
 =?utf-8?B?b1dpcmxPb0lvd01RNU45R0ZBZnkzT1Z6QmVzOVRsTUp5TUsxbVFBYjJYUmJL?=
 =?utf-8?B?c0VPM0pscjVGcDNNZHZveHRXcXlmNENHVmprUUQ4NytVU2puRVZYZDRNL0Vn?=
 =?utf-8?B?Y3BaYitGL0xCVHloRkxHTTlpWVBhZFRhaEFEUnpUYy9VTDNoZGgzcDdTdGRt?=
 =?utf-8?B?Q25PeHlSMmoyT3ArYTcxYzBQTGFFVlBaeVRycW9WQU0yc3BHSWk5enU3L0Vz?=
 =?utf-8?B?Nk80T0c0YmZUNmtUSkJzbXFsbFFLQ0xuWk43SWtETnBPTFVkeUtZWDlpa21o?=
 =?utf-8?B?N1pZS0gxRUppaVNnMkJvMk5tSlA1WTlLR0JQeWxRNHBYb1IzV1NONmtWaXJv?=
 =?utf-8?B?NWNSRE9QSXJqdy9jUFI1eW1KbHQrVXRFNmgwc1E3bCt1R3hpRnRmdEk1bi9J?=
 =?utf-8?B?bmdINFMxVXRJb3VtVHdFNGFpL3Y4K2xYYlpySFkvbUgvbWlDSWJZdVpxTTU0?=
 =?utf-8?B?eU5vS3dmaUJSWjJyV1RaQW1ydGFxUVVEcFhlRTlQbkdtT1dMWVNmZlRUeFFj?=
 =?utf-8?B?cW01bkNNTGhpQlJTNDY0MFNtdmNVUjB0eWhQRSsvSG1IV1h3WDJsbVB3dTIw?=
 =?utf-8?B?SDQ2eGR2YXRDNW03ajViOXJXRmdUaGNkekJmL2toT1JJdDJGeDQvbGw2UWNy?=
 =?utf-8?B?eXZiTUFLalFjaUVDbFpRTTVVYitCa0hSL0xZQUJ5VkxuWWt2RWIxOFFjQ1lJ?=
 =?utf-8?B?cERMc21BL3RZRnV5OE9ZaFJwandlVXNoTWJkaVozMjhwUEVNVWJPa293Y1cv?=
 =?utf-8?B?MENia0dpQi85Qis2WDJjbXcwOGxEbi9sck1CL2JWTllHS29VSW5OYVhickJZ?=
 =?utf-8?B?cExuMXZSV1FSNmVKUllpY0RtWE56OXpqTEhoZlV6aHo3U3pnTlY3UEJ6VjJ4?=
 =?utf-8?B?S3RPbUlvdmYzMHRqT3FYSnRxQ3VKZTYxREpuZWxlWjlCSEIvQ28wa3FzOW1x?=
 =?utf-8?B?cmRPWkczRFVQaXJNTDNxVTY3ZnZpd1Y1V1g3MmR4WkVzWXRERWwvYTlYK2lG?=
 =?utf-8?B?b0ZFMTBLdG5Wc1JQMEJ0cXdvZW91Qmp5RGNXV3BmaHpVd2F0QlNjV3c4UmFa?=
 =?utf-8?B?WER4c3BVTjNIcDcvVVFTRkJHWnVYdCtPcldvbDVVSWMrenpKOHIxMnJ6NkJK?=
 =?utf-8?B?YzZRMWs1ZytEaGhDRHFhVHdmaDBGT0FxY0NNb0YvWVIvZEtvN0lhdG5oay8w?=
 =?utf-8?B?aHB4N2hLVjBRalVHNDY2enhIWjVIb0U0RVFvN1FubzJPNWNHTmZiNVdORktl?=
 =?utf-8?B?eTJ2T0Ywang2RGY4ZS84OUFKalQ2ZUtOR3BJQVNseWR6bkw1Y215NVFsbHpy?=
 =?utf-8?B?dEJEZ1FPbUNJVitFS0ZndXFLeENEbDEvU1RjOXRUVGRJdHBEZ2s2U0NkWVBU?=
 =?utf-8?B?eElkS3B2VWZENjMyYU9qTDAvN3Vnc0tDNm9qTlBxcVlZV0hWOGN1dVh5azM5?=
 =?utf-8?B?eTErZ1hReEZJWnM5VU82U2xkWUtFKytmOXVNOVllWU9PWHhlWVNqQ2s4ZDZV?=
 =?utf-8?B?RXQzaVA2b1JsQnV4SmIvMkFZRXRnUk5qNllyZ2p0V0xnallSYWFJNUkzL0Vy?=
 =?utf-8?B?aE1VZHRxcnNiYVkxYWo5elhqZWVFOXk4OE1KL3pFbUtlVUlrdC9LUT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d4233c-7cb4-4830-28a4-08da323eb49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 04:36:52.5371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXXts4Y4HM7/6XFQBqO/HkOBdas08VN3JKrVqBwyIhPortS3YaM9kqbrudZeqrNofuCBCX3avf+spqimnFdWGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB3905
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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

Hi Peter, Luca,

> 2. After build, run the following two lines from your u-boot-custom directory.

> fdtoverlay -o fit-dtb.blob -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
> ./tools/mkimage -E -f u-boot.its -B 0x8 u-boot.itb

For the kv260 starter kit, u-boot does not automatically generate the correct dtb to be included in the u-boot.itb.
Above are the two post-build instructions I need to run from the u-boot directory in order to get a correct u-boot.itb file.

Could you point me to the best way to get this into the automated build flow, such that buildroot generates the correct u-boot.itb
without any manual build steps?

Thank you for any ideas and support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
