Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F646C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 08:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A654D61100;
	Tue, 12 Jul 2022 08:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A654D61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIBuoBmqnSUp; Tue, 12 Jul 2022 08:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96ED860ECF;
	Tue, 12 Jul 2022 08:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96ED860ECF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5077C1BF288
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 08:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A8D581CC3
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 08:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8D581CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO30X-WAYEEe for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 08:00:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C7181980
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17C7181980
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 08:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wjyvho2PYv/NkaDI8a2BawpUWxfAqppZUjIaygkeh2qXTVwksTSRn2Jt0yTQjpGmTPWjTV3la6cDvWgnR0HzOe5hJwbRI6FRdgXP3vP91uiy7urBldpTd3G9NGZBNRjJ55jpSc0kieg6FQsZ36pBZpLSwibBWcuJbWie7fdUzOR6DEZj7NgOTk6H2s7NDb63s7LuoHzwPuutcDBzhH7V/TGw96QLUIZZdGXtKU9p20NwDnRRyk6Yhy9VDg+G5ZXXtPwfu2LcYo1m3UcxP4b6InzoXFUY9F8L3Sh2MnaxFoRrF59ff2B9s3QOt/U2yMUjAx1EZG4QqnxSvqKT86UUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myy4jOkhLgsJNhaXZcvDhX6La4ZjJ5NtvY5aHmDi8RE=;
 b=Kl2fKmQDSeYoOP86LmB/DKNxriXR8bZEqJkyLIWJGsAzusHD5jhz82wItOcnkU9wCOd4M3jegCOTW+6PtDPxgVNwJlQgsJDF0LBTf8AwStDu2PEMEO0RERsuA/qc3HSnvJHOr2QJCbpukxosrgQMZGwHcfXznVhRmMBqfS7ncKROAZQEoejRgQlLl/xt5lIXn6OeZrh+61RosAmAUAV9PpBYQdgXraDjROWNRlUPr/9DwBKm4MKLZzqeJ/zH7iJwh7brTgxQmCRymXHx3JNQYwpftctCOr+NYdAtxrX4dPHDNbWl+yJJ+nhifq4W2wN/tUmctZbJjI4Dste3ZOsuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB5762.eurprd04.prod.outlook.com (2603:10a6:208:123::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 08:00:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 08:00:54 +0000
Message-ID: <d94fd831-60af-3837-f32c-e598863f5106@theobroma-systems.com>
Date: Tue, 12 Jul 2022 10:00:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220711131823.116481-1-foss+buildroot@0leil.net>
 <165756918502.1398129.13899758729447253604@Monstersaurus>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <165756918502.1398129.13899758729447253604@Monstersaurus>
X-ClientProxiedBy: VI1PR09CA0067.eurprd09.prod.outlook.com
 (2603:10a6:802:29::11) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3a1daa-9091-4311-34d7-08da63dca4ff
X-MS-TrafficTypeDiagnostic: AM0PR04MB5762:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sac1cMEu84dOa0mbzQvrIe2crDfpy+Xfh5X499bH/Vhyk4974lB7k8H/9tf7Dt/EUh872kUO+UIyJVHOo9eCG3Et9QRZxY9HXF8NistJyERocWyNumSW66CJaTLVCPm1wcRlSDaea8tj/BGLCHu4K6r10BR3FLP6IKp3AoP/+C1uv9154Tgy0Ld82IDMAfwHMoZNrY4uZz4j9NZ1UgryES+ZeFMPIgt3yreQuPQxON6HahwPs1FAf1f0rTxVrKWrL5EjEfeyFAc/uPIyHkPIGq73YFkdnmPwPxmNLNNfLAiSFn6lpVSFauJg/e4sDME3cMmdAJ8nsV0sSepfHw1txNE7axtEf8sOCTETd051V6FT2XAb746SHgXDFE+KaJc1CJ4VdFQBAllRMHH2KauevXh2o6siaumkDCLMG/+hLXuS+U2oXcSHllQP2FnxKlRzpi+VxCcLuNl8pwoVuM0a8oLdLZiaCYibramXvRarGXGwaIhCWk6cu6Bj1TKarXkV1Eaib8mqwJC8TymHZ9yYXSK+YW4kyvJRLXa7+HMFj+OmD7dQynXnOdBsYzNZoZSVKxB6QHpW/Igfjdyt48cmH9UKNHh00Q4oz9RmZl2JkaxRFoPK6W5k+3nUBzHgM0BgyKzXdS9yU+czqbUoJp/hGCZ2kylhqx8sCTj4r77AX+GHToPwS8MUmPTUYCLnTdHvrwBX3yKSA2spygdkMi6qut2P1ikQUtDZg2Ci4xgdVdmob+p8uGJymbg5vakslxvF0AfcxzXALNwxORyLEM9OoteJ8xe76up5qJNKGZCsye49EikAaEsYb8XQUQY8oV4ql4aFORwjRXDkDqMFUp0Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(136003)(396003)(346002)(39850400004)(186003)(31696002)(8936002)(2616005)(83380400001)(66556008)(38100700002)(478600001)(66946007)(66476007)(5660300002)(2906002)(6506007)(110136005)(53546011)(6486002)(6512007)(44832011)(36756003)(316002)(31686004)(41300700001)(8676002)(86362001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtHOWZZci9jK2FLbEdTT1Y4cjVBRkpQTXM3aU5mb3NZL0hCS1FlaTNTSHdF?=
 =?utf-8?B?MTJDMzhCbzIvWXN6b3lxcmZCbzhqbUNJNjRkWUFrZUN4ODIzOHM1aFNqNDFI?=
 =?utf-8?B?TXlNU3c2THBmMnFudkJ3RlZ3SVJ5QktjRnRMbTN4YTVtSERNNWwvcS9WTEVN?=
 =?utf-8?B?ZUt1cG5KNnpheng5RVIzbzFDQTVjTDNSVVNIdVJ0QytkQWdvN2YwK0JIZ3Nx?=
 =?utf-8?B?RFY3SVlkWkFmY2dkQnRraVpiRmVIUTZUWFFoeVhpQ1hqWjR5d2MzU1NKN01q?=
 =?utf-8?B?Y1ZPMGJjb2FmVExETUlxTHk0a1BVY3gwNm12a0l0SjdrQWg1bWV2WFZYUm9a?=
 =?utf-8?B?b3VIb0NieENoazFTTDl4cGJvcEpvNTFIazFpTTFLeTdjb09pRFVOUVI3NXlB?=
 =?utf-8?B?Ymx4aHJzeTF5blFOV0hsYUJaV1ZaWFZnSWFObmUvUVAyQ3NodDV2Zk9lRllT?=
 =?utf-8?B?enkwQTVYOUhZMGNTY0VqQ1pmajVLb1pjYVlLZE1qVjhNM1RLRGltaG5YU29s?=
 =?utf-8?B?K2tPUEFuY2F5WmlWYXYra0NJZTVhWFpmSDMyMW84SElyYVMzS2tMZFB1cU9G?=
 =?utf-8?B?YUU3aW52WWYydFRVdEF1NTJqb2ZDWFhHRW9seHVkelViaENieGE4MkNWeC9E?=
 =?utf-8?B?cGlLM2ZKV2VHRGw1dUxvOHFXajBnRTF3aXNILzRKWGdLNS83alpoSFN2WlUx?=
 =?utf-8?B?ZWFyL1RGSWsxREZ1d29QVGJMTkE2dVA1dUdEdnNNWGtESlFtVVBkNEMyZ3k3?=
 =?utf-8?B?LzZzZ2I1YUFPejZmMGZHVGxwMkRidmsvdmZUSVIzNkdUZ004SDdZOUtWNS9r?=
 =?utf-8?B?V0QxbHVWZm53SkRnQVJ0NFIxcDNtbzc2WmhVNEhlVGYxWWQrUHBLSGc5T1RT?=
 =?utf-8?B?TnI1RUtjelo3aFdXN1oxQjJsRGV3MjFRRGVGb1dKdUVQNmFIbkw3MStQOUVa?=
 =?utf-8?B?QVJyNVQya1pJWlV6bzZLVGpicVdKcDF1d2VUU0RmRWZNWmFkeWtRcE1pbEdo?=
 =?utf-8?B?S0xJUGlxSExlelpCcVBkVVhhNWVrZXUrWEZtZ3RDUjdZTDFGWnlVbjF1YVQr?=
 =?utf-8?B?bTZMUTZRNERVOW9BdHV4TFFKU0pZbzE1V3ZQYWtSOU9raGJQdTVVUGNZWVd4?=
 =?utf-8?B?MEVDRWpHRWJLdy9nZy80RktHNmFCRnc1bHBMQXBkblRJM1pUTGE5dktZZVNH?=
 =?utf-8?B?UHBrUSsyRzNrK2MrbHpBcmFibzBzQk9zdXJvTTlxT05LeEJqdWRoOHlNTHhN?=
 =?utf-8?B?VFVhR1BLYTBWQUYyNGxLMnVoMHJTNitsU1Q0cy9DUHFSMUhhZE5pN29BdDBZ?=
 =?utf-8?B?dDU1d2FacElMSVJCWHpUaFNHSGVnc1hSWVIyRUFNWXZjQ1RGRGZhdllRSWhi?=
 =?utf-8?B?Uys3cjUydFI5L1BURVNBdWJJZXNXTis1WThZMW1ZbUlBV1gwOGJFNWIrZkdm?=
 =?utf-8?B?QXY3dHp2cDYzd3lBOEdIUVgzWEp3WHhXSnM3MXo0b0RJalFWK0Y2cFpwd2ww?=
 =?utf-8?B?b2FDMmZIcG1PNGlZWXAvTHV1MDhjQzhqczdJWGtDbmEzNjZIUXBJc2cxdXFT?=
 =?utf-8?B?SnpWN3JqVTFIYkp1Q2I2QzUrZWNEYzRTb3FzNFRWUFQyZ211ZVRFUVl2UWph?=
 =?utf-8?B?b0tsbWdiaW9jUE1DY2ZRTEpISVl4YlZtZ24yNXEwSHRlcWNsODJkSGt5bnd0?=
 =?utf-8?B?SklMMitYUXZPN1pKRmNHSFlhT2Q5cjlhdnFIZVU1OFI2Tm84SkNleE4vWXh4?=
 =?utf-8?B?a3cxYklwbElnbUVsVXNzd2piZmdnaTR2YTgvcVo5eGMzWjh1NTI5Y1NrOVNs?=
 =?utf-8?B?bG0rYkV1RG5XWTlxTkNlTGlaSnJkUE9NdS92MG5zbGRqUmh4cjNQQ0x3U1p6?=
 =?utf-8?B?ZW0xWjFvVDJOTVdtQmttWGh6aDlXYnN3dHM1ZVFoKzFsVUlEelVlL2Q1Q1U1?=
 =?utf-8?B?aTMrK1QyWTBYNVc0N2JuOFFzM29TdTNiV1FQTk11Ykp0bE8zdzZFNWUxbkgr?=
 =?utf-8?B?TVljelZlWWxFN0lKZkxGTCtDOG5NSG9VS1Z6SjVrTTNmNlRVSjFheERSYitL?=
 =?utf-8?B?b0lETFpWbHpRd1JjdFZyeE01eDI3ckNXNVg1Z1ZpM21mY2s0dCtDVW0zYXNo?=
 =?utf-8?B?OW5aRFUrck9ldFR0bzU0QXc1ZFRlSkRrbU9ldk9wWG1rWkRLRmd2cmF2c2Rk?=
 =?utf-8?Q?YP9IT1WK8ec4waR+Hv3XaHPWcIT3syTjRdPk3sbBTqrW?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3a1daa-9091-4311-34d7-08da63dca4ff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 08:00:53.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UatmbOwoFZm2y5fQil5m4Dl0NGH1YzajD0aMQQjX/cC7xS8h//vHTwdEvskZZ31oRuE+tCdn45euQf0LtaMe50Iv1nAkMVMC/0oMqbuyfg8xEdDwe9GarkJChqDVDOxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Myy4jOkhLgsJNhaXZcvDhX6La4ZjJ5NtvY5aHmDi8RE=;
 b=ni0mHyTtE2w4cMjysUkG/Z02F0gT1VfKnDTG9xEQ2/72XnLBG7VLR89j1Puw+tAnvIxRvr6zmKz4GmdhqMFYV+b6kZocyks8svOojDfarK1BdZ+qEN/rLEG+5jKXCcUGrq8u5U8b0QH680NNjnDqHsXDA+C9EF8D27cHZxhs8lo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ni0mHyTt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: add explicit
 dependency on libevent if libevent package to be built
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kieran,

On 7/11/22 21:53, Kieran Bingham wrote:
> Quoting Quentin Schulz (2022-07-11 14:18:23)
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> The cam application requires libevent. Since there's no Kconfig option
>> for it, cam building ability is checked by meson build system by default.
>>
>> If libevent is present in the sysroot, cam is built.
>>
>> The issue is that there's no explicit dependency on libevent in
>> libcamera package. This means that it is possible for libevent AND
>> libcamera to be built, but have libcamera be built before libevent.
>> Meaning that even if all requirements seem to be fulfilled, cam still
>> won't be enabled in some cases.
>>
>> This fixes the possible race by expliciting the dependency to libevent
>> if the libevent package is enabled. Otherwise, explicitly disable cam
>> building as it's already known that it isn't going to build.
> 
> I'm not opposed to this as it fixes the race though. I guess it depends
> how much resistance there is to adding a specific libcamera kconfig
> option to select cam.
> 
>>
>> Cc: Quentin Schulz <foss+buildroot@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>
>> v2:
>>   - added -Dcam=enabled when libevent package is enabled, to catch
>>   possible additional dependencies to cam in later upgrades,
>>
>>   package/libcamera/libcamera.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>> index 41d6a5abef..3f336cb797 100644
>> --- a/package/libcamera/libcamera.mk
>> +++ b/package/libcamera/libcamera.mk
>> @@ -84,6 +84,13 @@ else
>>   LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>>   endif
>>   
>> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
>> +LIBCAMERA_CONF_OPTS += -Dcam=enabled
>> +LIBCAMERA_DEPENDENCIES += libevent
>> +else
>> +LIBCAMERA_CONF_OPTS += -Dcam=disabled
>> +endif
>> +
>>   ifeq ($(BR2_PACKAGE_TIFF),y)
>>   LIBCAMERA_DEPENDENCIES += tiff
> 
> I see we're already doing things like this though... And I think tiff is
> only used by cam? (Or perhaps also qcam).
> 

qcam meson.build is the only one specifying the dependency and 
README.rst only mentions this dependency for qcam.

I guess we could move libtiff next to the:
ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
check to "force" enabling of qcam if qt widgets and libtiff packages are 
enabled?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
