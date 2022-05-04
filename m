Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 11:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58B7740BA3;
	Wed,  4 May 2022 11:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etEVxm1kqiUx; Wed,  4 May 2022 11:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57587404BA;
	Wed,  4 May 2022 11:38:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D1E1BF422
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 11:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3FAE416BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 11:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hZapAyGjEfE for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 11:38:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::720])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBD5A416B6
 for <buildroot@buildroot.org>; Wed,  4 May 2022 11:38:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itVtWoWpZn4AHNNZV34jh9I7rfBeXVJVh6GEW8mQzakGC91KYLVYdDxJXFTRF1wIpKvceNI63pyhTsDnIjUr+Jp8joan5Bizq8ssoCDFdYmQ0TfN72YG9KmwlU12pjofupVdC+dwDGT0f1Rw1XJFNbTDqq5vMcPzfKTt5FJuOpmw89pegSGcKjImwCkhabhem5TZjxULZuPXbW47Ur0OnucJUgZ4iUvpE2/y/5hHJqoj4vwQYwfaOza1ymAdXcenJeVWt1l9I27PmjU9gpabIoMxQ2WO9Hl5VG7e0Ti/Z0p5eDQayH0ewiGGIBdwBxLNeeLyiiTl0bV3JT5IK85E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2AYtf/aY4HLWBeT59KHGAF4dG+q94JVcVT6wQTjaCc=;
 b=Ppx3i3cL+BoQyepFHT3hRm8gzsDVvz62rcyewYNhLUFyDxEeGQ1BQH9qkapJkLl7GtPHa1otT9Joq/7fteQAPb8ZBicQ0rmmduyQ5npVsPZmCXLv0sHPStyk/B1wvlXbhlPnoya1zDWUU/bOwyk/tz6fdlsj5NbWhnXKwCbMM6xw2uk8Sq8eKUq3Y9zlHwsBEPMmGDXH/SMjAtErd0msitWlcNA9tpF5UHBrv9FEJOfHw9pP7voWNv4BIoD1dK1/Vx4lwO6PnS1WLuA2vxBAQhGU/63LkLG0XeKsUO06rhztPSL/xD4i6KC/uLLHlMm8HraiAHdRTmPA3BSogvC84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=borea-dental.com; dmarc=pass action=none
 header.from=borea-dental.com; dkim=pass header.d=borea-dental.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=borea-dental.com;
Received: from MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::22)
 by PAZP264MB3984.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:18a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 11:38:33 +0000
Received: from MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 ([fe80::914:bc08:423d:69ae]) by MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 ([fe80::914:bc08:423d:69ae%6]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 11:38:33 +0000
Message-ID: <dedeb51e-0998-1728-f4b4-40b1c3878b85@borea-dental.com>
Date: Wed, 4 May 2022 13:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
 <875ymly6js.fsf@tarshish>
 <b6b1cd4e-29d9-7a70-3c5c-cba4f272420f@borea-dental.com>
 <871qx9y5gg.fsf@tarshish>
From: Charlie Leger <c.leger@borea-dental.com>
In-Reply-To: <871qx9y5gg.fsf@tarshish>
X-ClientProxiedBy: PR3P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::30) To MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d7b23a2-f309-428b-5031-08da2dc29e05
X-MS-TrafficTypeDiagnostic: PAZP264MB3984:EE_
X-Microsoft-Antispam-PRVS: <PAZP264MB398414B5EB223F8BBA52F80FC1C39@PAZP264MB3984.FRAP264.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7gQsgdycjoIAr2tydbwF+bnvLlKus5E+3odtTeDuporxEbAsmTPbnt+GkopqZ+ScVW6vAM7+Kch9sHnmvw46So9Hd9DX3djQDqGXEYfE7KtxFE47LIuy/KQPE88m0gTnrrCAmm0YKOsh0ATNIUkX7p23clQibTA2cWWRAhEEsc/e1I5H3FsVXUDjrnF73PNa5Nq2NPf6iav12y0KmS3/6IaHt9a1aJnY751vptl874q3Pbggqeq6wt1u7IdGQH+Q/2F2aR37gnRjpp62UUvPrQVmstjF35Tglu96J5hACAhPnQia7JYBSBStb2dlG4OcJqIq66dQvT3kXGA0AIF3D4WExpCMsV9uZZKLSXiQgykthcem8CwVhqbze6bAW+H47fGTjlhuxEHnCwsBbICbz+Xg72N/6nRPSXUj+7AtvsZEWpQ2YJPq3IkZfN2AJ/mytm4xLKlvREJx3uPf4gXK2yQiSEiCe3Y9dwMt6iS4SMMPF53ZhB31RnXhR4HezrODb3QSGBqE3ihpbL5BKR0CkT/plBOE+0qVM5dp6+NtGsFTxOsUBijVa8od+2tvyyLu9/SK1TVw8plSq1AE0SI5ekzxznmEZ1AY4n5PPbhBI75zpO4h8q5EnukCYL/Z3Yo/RBdyggKR/KCImXciR7EofldwgbTm6zNmVbWokdIMhDKh2XKOyWkX79tumINtbSFZOjA1hZnY2Oc9GOC62yAbGAs1SneS4VQ00lPK+MsuzFUtUYoxzdqyRDlHiTGspYOujYB6xj+U0xdteVZmYWq2rKAECi4HwIovHfyLJ2oxLhR+dD121zjibmuw4z8AP8Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(376002)(366004)(136003)(346002)(39830400003)(8936002)(316002)(5660300002)(33964004)(6486002)(186003)(166002)(2906002)(966005)(6506007)(86362001)(31686004)(6916009)(508600001)(15974865002)(6512007)(21615005)(38100700002)(83380400001)(31696002)(66574015)(2616005)(52116002)(4326008)(36756003)(45080400002)(8676002)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0NqSWJUNjlMaHJMeHhyTmZ5NGJiaUREbERGVTlXMU1DdC83QnZmeUxQTjgy?=
 =?utf-8?B?Tit2MnZyNlhjQlVWUUpJWGd1VXl3ZllmTnpUazJnNWNpcVNqQmY3c01qQ1Zs?=
 =?utf-8?B?aE1IZzFDVXVSMHV2bEpZdGJod095MTdMcHQwVzFyZW1PQTBCMU9TVEhFZGcr?=
 =?utf-8?B?WmUvdk00aVltMmJEL01RaVQyTmlXSnhMZFJ1RE43MnFhamtTSG5TaVFSK0JX?=
 =?utf-8?B?ck1oL082Qm9iN2hzNC9yRXY2ZWlDWE9rcHlGOUgyczFGWGZjZkdYeGRIZUNi?=
 =?utf-8?B?c0dmTk1FUG5wMlNwcCtmOTNyelh6OTcxMGNjZWNCRW5lQUxhRWhRU0NYdERJ?=
 =?utf-8?B?OTJNSGlvanN4a0R4eEpPQjJkVGFaUXBiS29CNEdCK0o1UE1rUERPWFJhejl2?=
 =?utf-8?B?TkQxWjMyZ0VFUDRnSHFPT0NyQUUyNktWSEUvU2V4aHdlUnd1aEQxd29WWUtp?=
 =?utf-8?B?RkVsNU4vZzAySk5HUkZ6eUg3ZC9Rbk9ZeU5hWXZXMmV4SE9yYlkzZzVScjhu?=
 =?utf-8?B?RnlvYkdSejBwVlNsUnc1ekVZNU40cndadUp2ai82QWJ3TTFwZHNTcHNFbDBs?=
 =?utf-8?B?NUhrWWJlcDZHTGVxV3VGWnhnZUN5VEg3WGNJSk16TFBxVkxKYjZ3KzVERkZ2?=
 =?utf-8?B?TnMrQUtxc3JBUld1dm9RL2hwK1Nsb08yLzhKZTFjWXg5b25ueFlWdHArQW5a?=
 =?utf-8?B?NFM1eVRvUmpwLzAwbUI0bnNWVHJBT0t0YkhlOFpsMm9qSHZ6RTJWSEFXWTZw?=
 =?utf-8?B?MzFQTk5QSEVIRmFGaE9PdVNYb2FuczdiRVdTVlVrL3NFRDdDUzhUNklpTjE0?=
 =?utf-8?B?NCs2emhQaXlLUFdkZ3YrYmQ4bmlkbFI1ZlRUdnk1cUdGSFk2NXRubThteEZi?=
 =?utf-8?B?SFRWcDViUlhYdldjTWZiSzl5K1oyTTFmaXRrbG1SZ2kvVW1DaDJJWVRKWHFL?=
 =?utf-8?B?V0piOEN1SXkvM0h3WTl3eStRREd2bGZBdDNUZkZtN0xCZlFVZmM0RXc2QnlF?=
 =?utf-8?B?Sm1VaFUrME5XYk1IMG9QK1p6RGhYaGFrbzBxbEdJRHEvYWw4aS9lZGVpUjVW?=
 =?utf-8?B?Vmh4UUd6NmxlZHgraTFIUXhDaWx3OWZsTnpoMlVwOVlFS2tiS3dsSHduVjdE?=
 =?utf-8?B?NnFRa1JDTFRldFlPSVZObks4Y2xRQXV3K1I4NVNYVnVTdmU2UDVZZllsQ3U5?=
 =?utf-8?B?WHF0UlY2NFFHZGpmbDdTNkZnUEYzTjNjdFFKemw2Qm1RWTdVRTA5MC9aeEM3?=
 =?utf-8?B?YnFPdHBnaVd3aXZKZzc5UnRXSHhYZXhHNWZqVGJ2SWkxTFZqLzZlT3FQQVZv?=
 =?utf-8?B?bVlqY3ZOZG9Lb2V4SlNmdEhEbUlBK2RYcnAxOS9vMWJWS25lTmkzdlk3Y2VM?=
 =?utf-8?B?RUlodnVMS1R6ZzcrWVY5am1tdE5TVnRzVytmM20yZHNVNVVxN2VSeVJFeFZt?=
 =?utf-8?B?amFxb1BMTlpXQldxVGF3VWxkeGJIL3JQaHh3TmwrOStkZUFKcms1dzVqMDBL?=
 =?utf-8?B?U3lSa2t2aEVVbmdkeVRoMFhrQjZjaFVpazYwaEpvMUg3blltNERSZGdLenNo?=
 =?utf-8?B?VHdid3hqclVMSnNiRURaT0xKNldvUmdITGFYdWU0OHhnTVJ1WUZnbTVoYkdH?=
 =?utf-8?B?dmk3ZWJLWGRHcVJLL2ZFbU5XQzFGRVNxYWNSWG1pcGNoQ1V4TnVwMUNQUUZa?=
 =?utf-8?B?WUFJWWhxZGN4UURpV2paWjhkMUdVTktFdFlJQnFkRHoyNitoZUl6V1BVMDhY?=
 =?utf-8?B?NjZ6NHBpTkpGeHlWSUVMTGN5NG5qaDEwOVptRnFSb092czB4L1NFMmd2QVhh?=
 =?utf-8?B?dWxQU2p6cTVQYUp3VVZPaTNrcW5EOG1XeFhsRWszUDNkaU1ZaFN6Sk53SnRo?=
 =?utf-8?B?ek1LdmtpYmhzTDRXZ0NoOFo3YTJrVkl0R3QrbVlyKzZVZG83ZmJhYytxTGVB?=
 =?utf-8?B?eEUyWUVDS0JQR3FyQVUwOFZ1dmlyUjY4YUFJZEdCbXRST2FhaEhSZUc4VlBk?=
 =?utf-8?B?cEQvbGgxQ0tGUzAxR0paNVVhUU5jWkpzQk5EblFwUHFmeEJiRjUrSDdJNjRm?=
 =?utf-8?B?eTFpTjYvZGNoSmxQZnpXYkFWSHlUWk9yTUNhaGxyV1FFdHdxc3JTazJzVC9B?=
 =?utf-8?B?aXY3bDhGN1NoNFlTdTVOQWhkNEE1d0dlQmljeHNyRy9PbVZZWHo0a0t1ZGtZ?=
 =?utf-8?B?U29BMkRpM1hPYzhOVTcvTXZUY05YRjVBYis0ZVJ6RmJ0alNIOC9rS21SbzN0?=
 =?utf-8?B?dEN6TDhjMm9jdlZYY2dBZlhQbDk4Tk42M2ZqZXlLVHBxNmU0ZG4xL2JYVE1k?=
 =?utf-8?B?OUVWZFZ3L2h0dFlESUNsOHl6bDhndTdFV2hLcHYwU3BDenRYTWgvZno4S21I?=
 =?utf-8?Q?DHOcsEOxpcId9ceCDyTcPplTsV5VYS+2TTevJ8A+qpLQD?=
X-MS-Exchange-AntiSpam-MessageData-1: /w40IFetHwG+AQEVwS49RmARJchLflmySYU=
X-OriginatorOrg: borea-dental.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7b23a2-f309-428b-5031-08da2dc29e05
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:38:33.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43aede4d-89da-4f78-a51f-69f6b16d8910
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yCDcHOhYGdAuVA/5w6cX0OPrxM2EwiqUKbd6K5m4y+XQM1C0g24dceTMF6vICkv/X1yt5U3lW0hcOyLGTC3t2ewilp+9Z4sSnL8A8pCEoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3984
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1277977421460866261=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1277977421460866261==
Content-Type: multipart/alternative;
 boundary="------------0DLid3KS3JD0eRj8vI7ohW2n"
Content-Language: en-US

--------------0DLid3KS3JD0eRj8vI7ohW2n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Baruch,

Le 04/05/2022 à 12:06, Baruch Siach a écrit :
> Hi Charlie,
>
> On Wed, May 04 2022, Charlie Leger wrote:
>> Thank you for your review
>>
>> Le 04/05/2022 à 11:43, Baruch Siach a écrit :
>> On Wed, May 04 2022, Leger Charlie wrote:
>>
>>   Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware
>>   package [1].
>> Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.
>>
>>
>> What build failure do you see when firmware-imx does not install before
>> kernel build? As far as I can see firmware files are only used at
>> run-time.
>>
>> Failure will happens only for specific kernel configuration which used "CONFIG_EXTRA_FIRMWARE" option [1], which allow to built-in firmware.
>> If firmware needed belongs to "firmware-imx" package, linux build will failed.
> Thanks for the clarification. The commit log should mention that
> firmware-imx is needed at build time for CONFIG_EXTRA_FIRMWARE.

I'm sorry for the dummy question... do I need to provide a v2 patch for it ?

> baruch
>
>> Charlie,
>>
>> https://cateee.net/lkddb/web-lkddb/EXTRA_FIRMWARE.html
>>
>> baruch
>>
>>   [1]http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html
>>
>> Signed-off-by: Leger Charlie<c.leger@borea-dental.com>
>> ---
>>   linux/linux.mk | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 7ff7b05042..e40672ceca 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -73,6 +73,7 @@ LINUX_INSTALL_IMAGES = YES
>>   LINUX_DEPENDENCIES = host-kmod \
>>   	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>>   	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
>> +	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
>>   	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
>>   
>>   # Starting with 4.16, the generated kconfig paser code is no longer
>

-- 

Charlie LEGER

Embedded Software Technician

Technicien Logiciel Embarqué

	Logo Borea
------------------------------------------------------------------------

6 allée Duke Ellington, Ester Technopole - 87100 Limoges - France

Téléphone +33(0)9 83 71 71 61 Mobile +33(0)6 98 30 25 64

Facebook <https://www.facebook.com/borea.dental> 	Linkedin 
<https://www.linkedin.com/company/borea-sas/> 	Instagram 
<https://www.instagram.com/borea_dental/> 	YouTube 
<https://www.youtube.com/channel/UCWFQZnXjcyDNcwObpPsXt6w/> 
www.borea-dental.com <https://www.borea-dental.com>

--------------0DLid3KS3JD0eRj8vI7ohW2n
Content-Type: multipart/related;
 boundary="------------VKJlWh6pCUthJI5Cfa92Sb48"

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Baruch,<br>
    <br>
    <div class="moz-cite-prefix">Le 04/05/2022 à 12:06, Baruch Siach a
      écrit&nbsp;:<br>
    </div>
    <blockquote type="cite" cite="mid:871qx9y5gg.fsf@tarshish">
      <pre class="moz-quote-pre" wrap="">Hi Charlie,

On Wed, May 04 2022, Charlie Leger wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thank you for your review

Le 04/05/2022 à 11:43, Baruch Siach a écrit :
On Wed, May 04 2022, Leger Charlie wrote:

 Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware
 package [1].
Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.


What build failure do you see when firmware-imx does not install before
kernel build? As far as I can see firmware files are only used at
run-time.

Failure will happens only for specific kernel configuration which used &quot;CONFIG_EXTRA_FIRMWARE&quot; option [1], which allow to built-in firmware.
If firmware needed belongs to &quot;firmware-imx&quot; package, linux build will failed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for the clarification. The commit log should mention that
firmware-imx is needed at build time for CONFIG_EXTRA_FIRMWARE.
</pre>
    </blockquote>
    <br>
    I'm sorry for the dummy question... do I need to provide a v2 patch
    for it ?<br>
    <br>
    <blockquote type="cite" cite="mid:871qx9y5gg.fsf@tarshish">
      <pre class="moz-quote-pre" wrap="">
baruch

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Charlie,

<a class="moz-txt-link-freetext" href="https://cateee.net/lkddb/web-lkddb/EXTRA_FIRMWARE.html">https://cateee.net/lkddb/web-lkddb/EXTRA_FIRMWARE.html</a>

baruch

 [1] <a class="moz-txt-link-freetext" href="http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html">http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html</a>

Signed-off-by: Leger Charlie <a class="moz-txt-link-rfc2396E" href="mailto:c.leger@borea-dental.com">&lt;c.leger@borea-dental.com&gt;</a>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ff7b05042..e40672ceca 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -73,6 +73,7 @@ LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
+	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      
      <table width="450" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td style="vertical-align: middle;">
              <p style="font-family: Arial, Microsoft Sans serif,
                sans-serif; font-weight: 600; font-size: 14px;
                line-height: 1.3; margin: 0; color:#000000">Charlie
                LEGER</p>
              <p style="font-family: Arial, Microsoft Sans serif,
                sans-serif; font-weight: 500; font-size: 12px;
                line-height: 1.3; margin: 0; text-transform: uppercase;
                color:#00aed1">Embedded Software Technician</p>
              <p style="font-family: Arial, Microsoft Sans serif,
                sans-serif; font-weight: 500; font-size: 12px;
                line-height: 1.3; margin: 0; text-transform: uppercase;
                color:#808080">Technicien Logiciel Embarqué</p>
            </td>
            <td style="text-align: right;vertical-align: middle;"> <img src="cid:part1.Kaw2zx8b.nobA6cio@borea-dental.com" alt="Logo Borea" style="max-width: 100%; height: auto;" width="138" height="39"> </td>
          </tr>
          <tr>
            <td colspan="2">
              <hr style="border: 1px solid #c4c4c4;border-bottom:
                none;margin-bottom: 16px;">
              <p style="font-family: Arial, Microsoft Sans serif,
                sans-serif; font-weight: 500; font-size: 13px;
                line-height: 1.3; margin: 10px 0 4px; color: #000000">6
                allée Duke Ellington, Ester Technopole - 87100 Limoges -
                France</p>
              <p style="font-family: Arial, Microsoft Sans serif,
                sans-serif; font-weight: 500; font-size: 13px;
                line-height: 1.3; margin: 2px 0; color: #000000"> <img src="cid:part2.SNq5SaFc.cqzttnFL@borea-dental.com" alt="Téléphone" style="display:
                  inline-block;vertical-align: middle; margin-right:
                  2px;" width="11" height="14"> +33(0)9 83 71 71 61 <img src="cid:part3.akDeHNoS.0CpmMCsg@borea-dental.com" alt="Mobile" style="display:
                  inline-block;vertical-align: middle; margin-right:
                  2px; margin-left: 10px;" width="10" height="16">
                +33(0)6 98 30 25 64 </p>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <table style="margin-top: 9px;">
                <tbody>
                  <tr>
                    <td> <a href="https://www.facebook.com/borea.dental" target="_blank"> <img src="cid:part4.wl6aK0au.UcBGOqmS@borea-dental.com" alt="Facebook" style="max-width: 100%; height:
                          auto;" width="17" height="17"> </a> </td>
                    <td> <a href="https://www.linkedin.com/company/borea-sas/" target="_blank" style="margin-left: 2px;"> <img src="cid:part5.xqnOJXoz.PMZ4UBZC@borea-dental.com" alt="Linkedin" style="max-width: 100%; height: auto;" width="17" height="17"> </a> </td>
                    <td> <a href="https://www.instagram.com/borea_dental/" target="_blank" style="margin-left: 2px;"> <img src="cid:part6.EgXYBMpd.Qd00o6qO@borea-dental.com" alt="Instagram" style="max-width: 100%; height: auto;" width="17" height="17"> </a> </td>
                    <td> <a href="https://www.youtube.com/channel/UCWFQZnXjcyDNcwObpPsXt6w/" target="_blank" style="margin-left:
                        2px;margin-right: 12px;"> <img src="cid:part7.yLYnIXIw.40f9IxSw@borea-dental.com" alt="YouTube" style="max-width: 100%; height:
                          auto;" width="17" height="17"> </a> </td>
                    <td> <a href="https://www.borea-dental.com" target="_blank" style="font-family: Arial,
                        Microsoft Sans serif, sans-serif; font-weight:
                        600; font-size: 13px; color: #00aed1;
                        text-decoration: none">www.borea-dental.com</a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>
--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="wAuHlpVKCUAm7WpZ.png"
Content-Disposition: inline; filename="wAuHlpVKCUAm7WpZ.png"
Content-Id: <part1.Kaw2zx8b.nobA6cio@borea-dental.com>
Content-Transfer-Encoding: base64

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
BYD6f/D7Rx14LyEHAAAAAElFTkSuQmCC

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="8UoD0EgSaB7lSQ5G.png"
Content-Disposition: inline; filename="8UoD0EgSaB7lSQ5G.png"
Content-Id: <part2.SNq5SaFc.cqzttnFL@borea-dental.com>
Content-Transfer-Encoding: base64

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
u0buav4++vsDu713b9xjtWfeD/hB+8MfP4798erexL2N+4L27f7J5ac1+833V9YStRNrO+oK61oP
5BxoOTjkYGN9aP3+n/v/vO2Qw6Hqw5aHFx7hHZl1pOtoxdGXDeqG9mMFx+43jmm8eTz7+OUTw080
nUw8efqX2F+OnxKdOno67PShMyFnDp4NOlt3LvBc7fmA8/t/Dfh1f1NgU+2FQRcONAc317cMbjly
MeLisUvRl365nHD53JVhV1quZly9fm3ktdbrsuuPbihvPPut/LfOm9NvsW5V3ja5XXXH9s6mf3j8
Y09rYOvhu9F3z99Lu3fzvvT+k9/Lfn/fNuuB0YOqh/YPdzzyfXTocezj5j9G/NH2RP2ks332n6Z/
rnnq/vSnvyL/Ot+R3dH2jHnW9Xz+C+sX2/72/7vxZcrLO69KXnW+rnxj/Wb726C3p95lvXvYOf49
5/3KDx4f6j8mfrzVVdLVpZYwEgAABYDMzweebwOMcgDzZoA3QrcLAgAI3f4K6P6D/Gdfty8CAAKB
bZFAxnQgqQFY1wC4TAf4DUAKgPRIkH5+PR+9leX7+eq0+AzAetPV9cIO4NQDH5iurs61XV0ftgDU
DaBhnG4HBQC2CbDBAwCazn10wBem208/6/HLEyD9/Pzx5flPcvuPgIURS6wAAAAJcEhZcwAALiMA
AC4jAXilP3YAAATxaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7
vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFk
b2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwNiA3OS4xNjQ2NDgs
IDIwMjEvMDEvMTItMTU6NTI6MjkgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24g
cmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1s
bnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9
Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8v
bnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBo
b3Rvc2hvcCAyMi4yIChNYWNpbnRvc2gpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyMC0wOS0xOFQxNjoz
ODowOCswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjEtMDMtMDhUMTE6MjQ6MDkrMDE6MDAiIHht
cDpNZXRhZGF0YURhdGU9IjIwMjEtMDMtMDhUMTE6MjQ6MDkrMDE6MDAiIGRjOmZvcm1hdD0iaW1h
Z2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlk
OjhjZTYyMzRlLTk2MGMtNDc1ZC1iZDA2LTk1ZWVlZmFjZDE0NSIgeG1wTU06RG9jdW1lbnRJRD0i
eG1wLmRpZDo4Y2U2MjM0ZS05NjBjLTQ3NWQtYmQwNi05NWVlZWZhY2QxNDUiIHhtcE1NOk9yaWdp
bmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4Y2U2MjM0ZS05NjBjLTQ3NWQtYmQwNi05NWVlZWZhY2Qx
NDUiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVh
dGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjhjZTYyMzRlLTk2MGMtNDc1ZC1iZDA2LTk1
ZWVlZmFjZDE0NSIgc3RFdnQ6d2hlbj0iMjAyMC0wOS0xOFQxNjozODowOCswMjowMCIgc3RFdnQ6
c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjIgKE1hY2ludG9zaCkiLz4gPC9yZGY6
U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4
bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+qYl5oQAAAr1JREFUaIHlmrGR2zAQRd/pXADCy0x3
wNAhQocsQSXIHagEuQOVwBIQOmQJTJ3xMmd0AHFGOksUtVisoNOb2TmN5rT4X0ssAYgvyPGHAOiA
NiFXcdREU+OH6AB3J02qbPnf3Kcx2gA98wanaO8hMAUH7Flm7ji8uVIhjvNzb0kEa7ESHHKDD1PN
jjSDxVdzR7rBKWpT5Qvx6BkciU2rOHp0TY5AZaj/LKuj12vga4Yxmgw5xfToV3EkNrEiaMhjcApn
ZeQc0+XaZB6nzpx/lsmkzzxO7vyzrIjdL0fDKYYVNpdSMBjjIhYm37lzh11d/5dkdsBgMM4sgXy3
jtbMxQw5K/mLglY7Af0VjreTv4wWHXMD8aCrSLakG9xR8CndF4UcP4kmi8bzCXYYc6yIWywprY4M
GwZklfT2Um9nuk8G4ecrHRl5eQqTExWyyzXYS02j5wGPNpbwevS6Ar4LcvwBfquoMaBCVsneXmoa
AZnRtb1UOWuepJo9T1DNLfJqOmuxUhzyZd7WWmwKW2QmRwr9TfIcDnk1O2ux13i98P7fQ/wQ5HwD
XnigJV/PE1y2HrnJngfqti1yo625WiEV8iY0knbI5YANcX5PsSPTVNggNyldDW2Y/3JbMkyHbmZA
TaMVyzcKA8pVrRcOPBf7K2M03D41BpSNbm4UcKnrNh/yOtKeBBtQNhoSTR6bDYcYFPINKB6sOSVR
OaJDsRn5AgzNGT3h0tr1Gj1xfeqFn8/JG/ANxYXInvtX7lKstUw6dB4AzhEDivOzZKN7LZMQ71FD
AabOVVOVUo3Wmo+4dMRu+66Ys1gqypmjfU6jjrxPei2NJqfJiZ2xqSkGjE/0PbYNKXCnX8Ad+as6
ELeCd6cmz1wNFPj8gkdn3Rsoc5NwgiM2iJbl87bjxhO7Fx2talSHqDldXHfEL2H6exP/AC8WhzMy
nxFjAAAAAElFTkSuQmCC

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="Es2ikL52T7BzAIlF.png"
Content-Disposition: inline; filename="Es2ikL52T7BzAIlF.png"
Content-Id: <part3.akDeHNoS.0CpmMCsg@borea-dental.com>
Content-Transfer-Encoding: base64

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
u0buav4++vsDu713b9xjtWfeD/hB+8MfP4798erexL2N+4L27f7J5ac1+833V9YStRNrO+oK61oP
5BxoOTjkYGN9aP3+n/v/vO2Qw6Hqw5aHFx7hHZl1pOtoxdGXDeqG9mMFx+43jmm8eTz7+OUTw080
nUw8efqX2F+OnxKdOno67PShMyFnDp4NOlt3LvBc7fmA8/t/Dfh1f1NgU+2FQRcONAc317cMbjly
MeLisUvRl365nHD53JVhV1quZly9fm3ktdbrsuuPbihvPPut/LfOm9NvsW5V3ja5XXXH9s6mf3j8
Y09rYOvhu9F3z99Lu3fzvvT+k9/Lfn/fNuuB0YOqh/YPdzzyfXTocezj5j9G/NH2RP2ks332n6Z/
rnnq/vSnvyL/Ot+R3dH2jHnW9Xz+C+sX2/72/7vxZcrLO69KXnW+rnxj/Wb726C3p95lvXvYOf49
5/3KDx4f6j8mfrzVVdLVpZYwEgAABYDMzweebwOMcgDzZoA3QrcLAgAI3f4K6P6D/Gdfty8CAAKB
bZFAxnQgqQFY1wC4TAf4DUAKgPRIkH5+PR+9leX7+eq0+AzAetPV9cIO4NQDH5iurs61XV0ftgDU
DaBhnG4HBQC2CbDBAwCazn10wBem208/6/HLEyD9/Pzx5flPcvuPgIURS6wAAAAJcEhZcwAALiMA
AC4jAXilP3YAAAXAaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7
vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFk
b2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwNiA3OS4xNjQ2NDgs
IDIwMjEvMDEvMTItMTU6NTI6MjkgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24g
cmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1s
bnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9
Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8v
bnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBo
b3Rvc2hvcCAyMS4yIChNYWNpbnRvc2gpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyMC0wOS0xOFQxNjoz
ODo0NCswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjEtMDMtMDhUMTE6MjQ6MTUrMDE6MDAiIHht
cDpNZXRhZGF0YURhdGU9IjIwMjEtMDMtMDhUMTE6MjQ6MTUrMDE6MDAiIGRjOmZvcm1hdD0iaW1h
Z2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlk
OjU1NDM1NmUxLTQ0OTYtNGMyOC1hNDk0LWEwNTAwOGRhYTE3MCIgeG1wTU06RG9jdW1lbnRJRD0i
eG1wLmRpZDo1YjU1ZjdiZi0wMGJiLTQ3ZWItYWFiYy0zNzk1ZDE2ZjMzNmEiIHhtcE1NOk9yaWdp
bmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1YjU1ZjdiZi0wMGJiLTQ3ZWItYWFiYy0zNzk1ZDE2ZjMz
NmEiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVh
dGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjViNTVmN2JmLTAwYmItNDdlYi1hYWJjLTM3
OTVkMTZmMzM2YSIgc3RFdnQ6d2hlbj0iMjAyMC0wOS0xOFQxNjozODo0NCswMjowMCIgc3RFdnQ6
c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKE1hY2ludG9zaCkiLz4gPHJkZjps
aSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjU1NDM1NmUx
LTQ0OTYtNGMyOC1hNDk0LWEwNTAwOGRhYTE3MCIgc3RFdnQ6d2hlbj0iMjAyMS0wMy0wOFQxMToy
NDoxNSswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjIgKE1h
Y2ludG9zaCkiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+
IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5k
PSJyIj8+aKxGzAAAAdVJREFUaIHtm7txwkAQQN95HJChkMx0YHVgOjAdWCW4BNwBJeAOKAE6sDOH
OCPEM4TMrIMjkM9CEtIdrD37ZhZm9Nt90t1JwZ0TEepwzo2ADBjVHpie7TF25Y0i4n+qAiiADSDK
YgXkjRLAQkGxTVGclACeFRTYNnIRwZX7hHNugG93Q7rxBbydec5Dx1wAaxGZhE8hp9+dmXUoZNUz
5+AmuGDWoYgyywudU2Zw2/MCITNg3uGcfgTNacL1O+u5kYXN6U9iElpoI/EiIu5UAJeMdVcJ9ZiE
FkxCCyahBZPQgklowSS0YBJaMAktmIQWTEILJqEFk9CCSWjBJLRgElowCS2YhBZMQgsmoQWT0IJJ
aOFfSNikLS2YhBZMQgux58VWscZP4N3gR7+C7tO4q0k8xM4rUo6Ju6QhSymxqrl3MfMkfU/Ma/at
gPdYiVJK7Hrub01KiXHP/e1J2Cc2NWmnEfMk7RN3+KE1C7ZP8GuWopH6PfGIfyLL4/8UuI+d5BIv
uyHwlDJB2Jy2KZMlYv9DQkQ+gM8rFdOFVxE5VK2zmxL30yNV7IBx3YrHQkGRTQI50Lj2NMePKtcu
OCx+QWnY/rXi8RTOuazxoPQcgH24sbWEdr4BAVHLWOOol4sAAAAASUVORK5CYII=

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="ox0WjIXTWDkoYLuw.png"
Content-Disposition: inline; filename="ox0WjIXTWDkoYLuw.png"
Content-Id: <part4.wl6aK0au.UcBGOqmS@borea-dental.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAABR0lEQVQ4ja2UPUvDUBSGH6MtSEWL
xWoXQXBRO/gfxLXi6iA6dBMcRHDxEwcHN0cdquColeAPESypQ2eLQa0fRRBNIidNIF4T4tc73Ztz
7nPfczknbZxeoqgLKAJTQB7IAPdABTgD9oFm8IgKmQF2gZxKDsgEloEj/5MWCK4DxzEAURY4BDZV
iDjYiDmsag2Y9cuRN6gB/WrW5EA3B+M5BjsTrdrLFTXlARjqAObCAKKdkawLsByH5rsdlpIG5qWc
QpTf3mSr2uJFnfR5NSqtIFljYZGF4Qw9iXZ3PdGXcvcRGpU3eQWSatyZzn/av1g2Kd0Iw9ji5C4s
snpl8vhmuety/ZkV4ybKya3mdeIXbVdNGh7k5PqJvVroXSJDIHpU9JvSBVICIr3GSPqkpHnDtPRL
yCLQ8NteZuanbb/lD+G/TPHf/yfAB8VcWaahZsYeAAAAAElFTkSuQmCC

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="1Spxztag3QdzDk7B.png"
Content-Disposition: inline; filename="1Spxztag3QdzDk7B.png"
Content-Id: <part5.xqnOJXoz.PMZ4UBZC@borea-dental.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAABVUlEQVQ4jaWUPSxDURiGn3uVpNGo
MLTSUdTSTUJsBjMWJGprrCKRiE1tIiJYrbWISHSRmIxdLH5Ci4mEpClNtHLb0srHvcnpGdzSd/x+
npzvnPc7BocXaPIBc8AEEAG6gBxwCRwBu0BBbdEhUWADCOpkRU/APHDghEwluQIkXACiHmAfWNIh
M0Dcpbl+AlgDJh2I3MGmWnE1GiY10tsIaBtoF0gMCKhZ67NKuVpr5EQyWswDjOuZeCb7A2lrIRrs
4LxQYsjvxecx2HrIg/Whlo8JpF+H7EQC5Cs1bs8eSQyEqFRrtJrGd2465Gf49F4tD5u2D37VSbaI
cZzmplBisNOrl3YL5MUNknp9B6vC9VsZ+0CqcgJJu0FclBFIsklIUmwvPrnTn7lByQr0mfYyLf4D
IEZaAIqO7ff+aHsBLNs7VLeAq8As8OwCkBGmgHUn0Px/AnwBc1Nc8w4SwLYAAAAASUVORK5CYII=

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="3c0Q618S000Yk6co.png"
Content-Disposition: inline; filename="3c0Q618S000Yk6co.png"
Content-Id: <part6.EgXYBMpd.Qd00o6qO@borea-dental.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA0lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDA2IDc5LjE2
NDc1MywgMjAyMS8wMi8xNS0xMTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6RDhEMEIyRkU5RThGMTFFQkI4Qzg4RkFFODg2MUFEOTYiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RDhEMEIyRkQ5RThGMTFFQkI4Qzg4RkFFODg2MUFEOTYi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKE1hY2ludG9zaCkiPiA8eG1w
TU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjgx
ZDFlYWEyLWU0ZDEtODk0Ny05NjRjLTlmNjU0ZDhkNTNmNyIgc3RSZWY6ZG9jdW1lbnRJRD0iYWRv
YmU6ZG9jaWQ6cGhvdG9zaG9wOjgxZDFlYWEyLWU0ZDEtODk0Ny05NjRjLTlmNjU0ZDhkNTNmNyIv
PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVu
ZD0iciI/PhMhaggAAAIzSURBVHjanJRLaBNRFIb/TJrpGIfGJpBWKUaqpgsfWHShdFFcuFFo60bE
uiuC3RRFEHfqTkRxaUHdKZQqYrPpTuhKN8Gi7aJF7QONsZC0SacxSZvE/0xy4yQYCx74uI+Z+885
95wzLryeRZ2Z5AoZIIeJnyTIDJkgT4jlPOCqExkkD0g7GtsPMkJeqQ3N8fA2eb6NgNhuMk5uqo2m
yniJ3Km+5tYQMnW0cPRqLmwUilgvlrBk5QHO7QiAe2SBvJRw5A4+kzZ5er7Dh8dH2zCdyiFTPmCb
l4LHfM24NrOCseU1Z2gHxZMhJSAejFIgPLWI1Ea+JoaeoInOHR48OhTEWCwNbBVVaENyJ/3qxY6d
OuaszbKA0YTIqb1InOvCZE8IQd2N77ktRFNZHGkxnPp9ItKlVjojXd0s2PM33XswlcggMDmPibiF
4dAuvI2vI8+7kXtyWFir1EHVCqWSPZ5sNfDwSxLgodGvSZxoNRplKyAiSeeO5ip/5f1qFjf2+2UD
Vzv9iK5lG4kkRGROrfJ0wu9x2/OBDzH0BrxIng2jv93EmWisHDJFM8WSU2ReshMhp2X1jRcaNj1o
9urIZfLoe7dc+01m57jPwKd0jVcREXlKbtlpZl0Mf/yJxd59mE7n8MtRJ4amoZt1cn12RaVX1ckz
1TuDlZL/a8WK+xYFFyT1fwQkpovSAqrsX5AD1dLngaVU9l/9U6p4P17fgHfJZRLfpgElhAvkfqNf
wX/9T34LMAA5h7k8rP4vWwAAAABJRU5ErkJggg==

--------------VKJlWh6pCUthJI5Cfa92Sb48
Content-Type: image/png; name="ZJNrsmQElMBDi373.png"
Content-Disposition: inline; filename="ZJNrsmQElMBDi373.png"
Content-Id: <part7.yLYnIXIw.40f9IxSw@borea-dental.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDA2IDc5LmRh
YmFjYmIsIDIwMjEvMDQvMTQtMDA6Mzk6NDQgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0i
aHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3Jp
cHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jl
c291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBN
TTpEb2N1bWVudElEPSJ4bXAuZGlkOkJBNzkyQkZFQ0REQTExRUI4NjlCRDk5QjE4MDU2Rjc0IiB4
bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkJBNzkyQkZEQ0REQTExRUI4NjlCRDk5QjE4MDU2Rjc0
IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMi4zIChNYWNpbnRvc2gpIj4gPHht
cE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDhEMEIyRkQ5RThGMTFF
QkI4Qzg4RkFFODg2MUFEOTYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RDhEMEIyRkU5RThG
MTFFQkI4Qzg4RkFFODg2MUFEOTYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94
OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4E52IKAAABvklEQVR42pyUTUtCQRSGz9WrlZlf
CYZRVJAWBLnof1QboY9dtYpCaFE7axFBRNC6bYFoLWzbov5Ai6CIIhIrU4gMs0zxq3fkjsw1SuvA
c+HMmXlnzpkzV6LDK6oxI5gDY2AI2MALuABhsAvexQVSjcgU2AId9LMlwAI44AMaIegHe3UESIkH
wXKtyCRYpcZNAhvAy0VYDbbp78aEdkCrjM8McLDR8S4TrQ/Yydksk1mnUa0olYlShSLdZwrku3ym
08Q7T22WzRzlE1fddhps01cEIpk8nadyVREN9rXqtDRsbiK/q13UH2Uibu71GORqJIodPScRmjiL
08NnXnWqrhat6PZrlD6omElWp0AlokA0Rd3HdxSMpavDWkkSZ9nYqiT3cizxGrMhvdCIk7ydbaK2
aEl2/mvg5Cm4jLpKxIK67HgcNN9rxc7qVY+fBdG9YSc54l4g9laNeFDAxb7vAsxCT2nRDbO2Z31y
y6+ZDDrq1WvJgvrohdyzSPWVXXEOp8gW+XCcFVZWHtOS0vJEuNoIO265XK/Z2AQf+ODXsa9q+8YE
VpQ3pHqAa2BaeaW/WVx5M5s//Qr+9T/5EmAA9uR691SBizUAAAAASUVORK5CYII=

--------------VKJlWh6pCUthJI5Cfa92Sb48--

--------------0DLid3KS3JD0eRj8vI7ohW2n--

--===============1277977421460866261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1277977421460866261==--
