Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A65C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 14:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55CF402A1;
	Tue, 25 Oct 2022 14:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55CF402A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmBPvUuOnjfW; Tue, 25 Oct 2022 14:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7024028C;
	Tue, 25 Oct 2022 14:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E7024028C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 300AF1BF976
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 14:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4497402BC
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 14:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4497402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3RHJgxEqxNC for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 14:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 306274011F
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 306274011F
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 14:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek745jJmkfTj8tFCjJcqmNA726ed6EdhIQBmvUKvpxTbSBwWpItrOMQtn+tFu9aBN5V1QiIem4Zh09ZK84U0jaAVTQKZcW7LqywFACWFI7UWd1I8ZrSCoAJ0gbmEdCqctQuVa9zxuO56XnMnct5VzTGlhwAhEaUQO9gHS3SHUplIBU/jEqjnlfTP1IyjC18V5E8sVUoSwoGtJVg9y5ePWfmQzf4WkwkIkQnk88noUoUC/EJdu9hOj9VCsqO3HNlpXAEBuLQH4JvFBx9wxJBb5BH8BfPeFi0NrJG00ST/smucwnlVwgo0Tmb+TWEdEamzTVTS2HNQXdxYTh8oVSy3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp1dmwfek/aKjQwqR1XJudgp/wCata1J+L3JeVmXlgs=;
 b=GLpVIaQiNm1CuE2lNuNVTm63Yj7P574s+tXzXqIlA+Reu77CAiSYox+VODNREkPUL39XCguwn5Ck3hdxEW1vffCCTd43CFktmUc2Ks0bdgbCZIyzvwa69e2pjLiIuK0D59+FiwK59iIcsvGA/z8FV1/AQNPKz54JX6FvvPVRTE/KRrIbo4Ry/6CCs4S7fvQP9CV15paKUUi0zfE1VMNZZpFfQBqeUyQ+3o55CBRlUP1L60bGJtQIr7NWfsOIyiNi/Z6fVmiEhKy3qUMDJSKgGBmoYfLd3GM04qT4kGULLjiRKvJJ/XEEky8CdXHJPUYWwyCL8Qv+nWPr07HU/fpZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com (2603:10a6:3:97::9)
 by PR3PR06MB6921.eurprd06.prod.outlook.com (2603:10a6:102:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 14:57:27 +0000
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9]) by HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9%10]) with mapi id 15.20.5746.028; Tue, 25 Oct
 2022 14:57:27 +0000
To: "neal.frager@amd.com" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
Thread-Index: AQHY5fAgs+BoAarWO0GBZrgnMOlb/a4fOFAA
Date: Tue, 25 Oct 2022 14:57:27 +0000
Message-ID: <16bd1ade785531da3b54d0173aea5e9c921f1ff7.camel@vaisala.com>
References: <20221022082645.20505-1-neal.frager@amd.com>
In-Reply-To: <20221022082645.20505-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0601MB2361:EE_|PR3PR06MB6921:EE_
x-ms-office365-filtering-correlation-id: a784b5ca-3c34-49ca-c7ed-08dab6993bca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EJ2T4zIbHjwu4lYqcz8aYxq5ChM2iX+ci8XWyaB40M2i67ki/QDYCU7gM2joXSeqmoUbUgeitSOT2BkWdPW/7HFGpCdW4k+eYfQG52dDezvM7ZqmSt3649yKcDeYmgnD5OJx0bxQrUFgx5jHXicrI007/OfdG/uhnG6XEReiMXldc9Q7h/fJYnROhaEu14D6QNJFaWzbZ1pL+4M5HNuVirBZoyccAf/GbGtnOJnc3FDlSeNKqII3JGtFL0K0Ml5KuXFqmeDpPxMUvuTbrYLKR25zIl8978OouOh8OfEAbr6ZG4sf4xdc1Bpirpz7NzYCN2/3XJ0jDZg3sa+hUj/Flufbv+yXmNm6sPKoshZSBYO9BABbf1YRTX2+DYg1OZr/LjouUud5AcG1SyEXODhbOtKZ9SV+eqztBwu5r+LNkUt999t6sNNr9QkOurU5bnBqM/hBkymTv4bHYlOJbC2hXp1w66+MUGM30yVVeu/d9lvu722xNdF0lFudye3OF4ByE8YWMy7r116NK+QmqKHSuywwbyHABPjg/tjtGE0E/B9xyLRx29znKfzfv88SOweayFM/fTphPogFDXWOu41X/dsymwA9G9XV7u3He3AogGKSL2fUH3P8gYjLZd6BWkU/vYUt+ybAnDKmQ2fUeCnohHDaCwIwm8xkhPWTPoqIDijOV1IVer9N1cvWXFR3Inr24AUsKWe+G2hPKS0ii1gnhGPiHsCM4kP9eGyR2qruVNMEVnGgiXD+/JY7qQsmdUMI4OTPst2pd5q/ov+5jS7FynJpwugqURohy4gce5P3jPzt2fVkyotBd6149X8EM71gRnHfYeMfSWiBnnJqjVaZhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0601MB2361.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(110136005)(76116006)(5660300002)(8936002)(316002)(66556008)(54906003)(64756008)(66476007)(66446008)(66946007)(6512007)(91956017)(4326008)(8676002)(6506007)(26005)(41300700001)(36756003)(38070700005)(2616005)(186003)(38100700002)(4744005)(2906002)(4001150100001)(122000001)(6486002)(86362001)(71200400001)(966005)(478600001)(66899015)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUJJTWFKcGV0dTB2SFovamVjM3dIc3V1WE12ODZtVEVPbHhVWkdIcDRjRnQy?=
 =?utf-8?B?bE5FZG9xVDJ2QmhhdlhCUzNDM3dUa3ZjdnJKbHU1U01HRWhNSEJnOXZSb3Nx?=
 =?utf-8?B?N2FnVEhGTTYrUGptZDNqeXFWYWxJMnBDL3dwcXVOSjNDOUpGZmR2WEt5eWFX?=
 =?utf-8?B?SnJPRFIvOVFFbWlTdXd0Z1pzY09lNlhwR2lUU0F0OXgzd3RRYXp0YjNGMS8v?=
 =?utf-8?B?dmF2VUxoQXF5WUI0eWQwWnh0cjd0eEtrMTJoWGhPajBPNVVPT1ljWXpyVDB5?=
 =?utf-8?B?eHlHMk9nWFk4UE5WL0UxdmxsWlZrZGxtSEpzSEtkRDVmYzJENW1rYjdJZTVt?=
 =?utf-8?B?cTdaTHdTMDNHMWc4U0duUUZqTkdoQzllT1hXc0EwY3FMT0V2UUZRNGx6NGR3?=
 =?utf-8?B?SGpwSmNMak5uSWxuMEpiNTVPQXlVM1UwR0xwVG1vcjRlR0ZSUEZrYjU4cDZB?=
 =?utf-8?B?Q1RoVnUxMy9ONkJHVktESEhRZ1lNRTJZbVVhRFp6NUU0YzE0UWRVODNqSFUw?=
 =?utf-8?B?ZW1DWjZmU0dTaVVKU0cxeC9xVGdOWjVqZVM4Kzg1RkljcURJa0FCaXg1aTZ2?=
 =?utf-8?B?dVU2Szdrenp6cjFEYzVJS3Ewb2FXVFE4MG02L0o5VG9PSVJHVzltSVJQVVZO?=
 =?utf-8?B?VlhBTXpLNHRldXUyZjlRWktYL2N6clhFeUZnSXU4aWRTakthV3BLYW9hTTVp?=
 =?utf-8?B?a2lEcmg4dGtOeThHeE5QUlo2cVNuM3hVOFBnbHZyQ2dFN3NTU2lXT094eVFQ?=
 =?utf-8?B?Y3pCblROSnZzN2pWMEJHaVpHWFgycXIwQ2VtUW9ndnYxWDQvci9QeFhqTWw1?=
 =?utf-8?B?ZVNvWkttWk45cHAvUC92UndJT2ZnckE4SGFsNE5Pb0d4ZmxqaVVyQjJKZTRF?=
 =?utf-8?B?Z3Q5d0Q3N1RJNHJWRkpqN0VSWjVuLy9TTkNIbmtHSmZkZ2c1M3BjUGpYaG5l?=
 =?utf-8?B?UWR1TG04NlVCZ3duQ09NanBUZU1vU1orZWc4Wk9aOHpDYjRRQ0htNHhJSDA0?=
 =?utf-8?B?ZUY1ZE1WNkczUDNuYnlER0JOOVRFVm9ZWDBRb1A1cUhsR1hKTEQvbWtydUEv?=
 =?utf-8?B?czNHL2twWTBGam9HeHFleHdOSEVDTFhmb2prZFVwR2QzRTRob2N0K3pkTTdB?=
 =?utf-8?B?aUFwclp2VDFhOWlvZ2MreStFNjU5ZmZYdDVOSW5GOE5kclBZVDVKaVRDUzI3?=
 =?utf-8?B?NDBaTHp5OG93SzZrSWpUKzNITXBrTGVGcnV0cUlDaFJIU2dOOE9pM1N2SU9v?=
 =?utf-8?B?SldsK0tNa1RlZkYxdEttRHZURy9OTFZvMUZjZUlzU0VNL1JrdnJ2bjNKMTNl?=
 =?utf-8?B?QUtNcWMzU1daVjU4SVhPcENEdnk0RTl4L014VUg4eVlyRkhyUmd0SlBqdjJw?=
 =?utf-8?B?dnp6ck01clRDNzR5UEExb1lYUS9HZFlmbzNWWFZodVduaFN2ZjhFZUlhVjVJ?=
 =?utf-8?B?WWdpdDBjTDNtN0U3azVYSVJhZ3pmV01xSDZLZlpSUEZUYzlhRktvUmV0RWJW?=
 =?utf-8?B?MTdCbzE1Z0lFbDkxc0dTY2duSlVLWnA1NGdoa3pTSHdGL3R4MlhXMFZxRGxa?=
 =?utf-8?B?TjNFc0pOSWpTNys1ZUhDNUNOQlVNTFcyOEt6MEpYUE9wSDZWZ1YxLzc1Q3R5?=
 =?utf-8?B?U042RHN6UFdTNkRxZXFKYSs3NlhqSnFSWGx2cmtzZU0vVTk1ZkpPaG1ET0Fq?=
 =?utf-8?B?QmozVjlWNkFrS3l0REg2KzB0RUg3WDAxZDRtR3F1dDFrLy9jQ1RaOGNIQ0FM?=
 =?utf-8?B?VG4zVXRqZ3BLSHNsSTl5ZklEQ3NkY293TmJucXJ6SWlveEJ3TnJ4Q2ErMUhn?=
 =?utf-8?B?M2tjWEpyR2MxSXlraGhnRmYzWXVDOUI1dENqV0ZlUUtITm4yMkJkL2ZSTUxh?=
 =?utf-8?B?c0JPSDB0OFBaTDlWekUyT0lyZUo5dzlpTHBCWExkQjl4MHRBVE9TMXd3ejJY?=
 =?utf-8?B?RWNrblM2RTNLNzdaMUwrZ0dtc2pqSjZpK1JobnVFUnBadlNhODhGM3ord2tS?=
 =?utf-8?B?c3FoeW1UaDEwblRYSm41eURWYS81ZkFBSHNNeVI3bVdFRi9LVnA3THFLV0VE?=
 =?utf-8?B?Ri9YWTlGWnRERmZRZElDbGVwNzBTcHlIbUlRMGVSRTY5Z1poUlNpaDZ1WkdX?=
 =?utf-8?B?Zkh5S3lmRkRBL3h3ZC8wc3ZsL3lvNDFZSFVYQ1lpRWxucWtkMEo4Rk5IWFQy?=
 =?utf-8?Q?9MekxmcexgPYOcX9dZWbZJA=3D?=
Content-ID: <538283C9DA504544A3DCEF5BCDAB09E3@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0601MB2361.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a784b5ca-3c34-49ca-c7ed-08dab6993bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 14:57:27.5430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3j/Nu/uqCuCDKSe/JW2+sAtq7O+AoP5xwbjcs8ymZ5uS7YK8Q2jvr0gYrJUw1lTr4GlnphBXEa5PamEhSJb08OOaC8noKVLYiuZLnaZ278=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vaisala.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp1dmwfek/aKjQwqR1XJudgp/wCata1J+L3JeVmXlgs=;
 b=qc+KrrD8pnEYq8xcPVSsnKWvataUwVdH9uJP8+ET/gagOrqci0yYYMtomCCVRzjBI5oxORedHRieAmwoVAmjExx9yp4G0kO67gdYQQqSrSvM3ysTuxE3i6Cjto41yqwtfX1+CoKmXed59Henb2CDyaZhSsWT7rLDBeB47OcnRSh34l5kv0FJNiK8sNHYxXt5rO4s+NAFfvvR5AuFXG0PX3Clc6V67+H7cqILsg468YJfA64lpAUn/CVZ/QV9F+X853Xdg7Z1+8LK1pYoP7KoyG38LC1O0lAStmzlG4b/wHjHWlQdgtjt9a+LotBtJHTFxihaGdR2W39Ra2LmNPUpIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256
 header.s=selector1 header.b=qc+KrrD8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
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
From: Aaltonen Eero via buildroot <buildroot@buildroot.org>
Reply-To: Aaltonen Eero <eero.aaltonen@vaisala.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 2022-10-22 at 02:26 -0600, Neal Frager via buildroot wrote:
> This patch adds Xilinx bootgen as a host package to buildroot.
> bootgen is a required utility for generating a boot.bin for
> Xilinx versal products.
> 
> In addition, for developers who wish to use secure boot with
> Xilinx SoC products such as zynq and zynqmp, bootgen has a
> more complete offering in secure boot features than the u-boot
> mkimage utility.

AFAIU, this should also have a bootgen.hash file
https://nightly.buildroot.org/#adding-packages-hash

-- 
Regards,
Eero
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
