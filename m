Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78500C4707B
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 10:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBE783DA5;
	Thu, 18 Jan 2024 10:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBE783DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIcP0QOTf2J8; Thu, 18 Jan 2024 10:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A47883D57;
	Thu, 18 Jan 2024 10:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A47883D57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 053661BF215
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 10:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAB283D57
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 10:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDAB283D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_j6-KWEgu12 for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 10:09:31 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::726])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A14B82C89
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 10:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A14B82C89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Na2PL5POaG/qIY0nGPBYtItaEnKj7QQNy2hXiyJsZA5ibtVXr90eRNJQ+hQUzk79Y0GFoTX8q0nJX7nOryzRH9rCDtvkFs5SVcUKsJ32Piej0hiM+h5yTfEnIhlo+2QD/0jyNvnLdyzdmHgM+Z3nmE/MzLsG2nuwO6/GQt9aIpY1/TLWBnIC/5whx/K5gwifd5BhutIpKy3ApIoA/CvoWJD3z6jcNCtijcrQ0glNG+lbSXU5ng3z0GvmT4QrcTeGBpW7burevns3MDn+hhX+MExJ5hrPMEMFO2buM4I5pW+/ykaWg/dOa6QC7qYOrE95hTPwwVt3ifwr6J+jURFErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAiPRmTXd1QhGPtyDbtB9/OhfMS16sjXIMDA1tnssQQ=;
 b=h2PPp9ax1iRayaI6yObc26yfAPQD3Dk7xgR8UU12zDSlcLYeyQs/TdnUf8j/BFdRxfBtHUcUC5qRtIKoRH4OygF31cZhyQLt5La+a3jiLgTOIrSejI0QMnsWmtaKipdMNSz1paUjpi9g1Lfxr6YrAvpLnJzw/KIljlG7Zt5G4ult3Rn0DzBst6zstzBhtZnBhPJ3xzZmVrG1cCs26181XUssk9RBL1JMI+as3YJV7vgFqJCbV+z8qeSjCpB0fU1URoNd0OfEgfl/OBID+DQ+7RigrWwJv6/pgwxzvCTsdRbmL4ec0zXx+GLwSFLTm+RWWsPmJsTartsryXZAKC0AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com (2603:1096:990:16::12)
 by SI2PR03MB5579.apcprd03.prod.outlook.com (2603:1096:4:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:09:28 +0000
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::3a7f:117c:235d:5bc8]) by JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::3a7f:117c:235d:5bc8%7]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:09:27 +0000
Message-ID: <1d7e825e-05d7-4958-ae75-dbaf06a09ee9@amlogic.com>
Date: Thu, 18 Jan 2024 18:09:24 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240103073954.3555165-1-yang.li@amlogic.com>
 <ZaOiZNVvO7OuK3sC@landeda>
From: Yang Li <yang.li@amlogic.com>
In-Reply-To: <ZaOiZNVvO7OuK3sC@landeda>
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To JH0PR03MB7468.apcprd03.prod.outlook.com
 (2603:1096:990:16::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7468:EE_|SI2PR03MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: eec8c923-ddd4-42d3-d2cd-08dc180d8df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1RYeER+Gpa5Jgga0lZ7JSp17dOIfHswMwr9rhqCVipJT4TmB2VMpOVTwf7j7YwHoeohhm3OUPdfDMwc21wS47foJkFd3ew/OZe7K/QylYIk38nMrwEHP/381MsOaxLLvA5jfnjr9M6w6rx9c2h+pwrgrUDTGGrNuLc/qQW65zaEW+zgcWSyv4EXovVchWQv37YBrpfMfu5rx1cmzQyyujjQpz5dO6l8Ey0aIlZJIhJQiqlpv446LObmUCWk3k9/bF8Ey/YvjTtbBVM2cJ8/WwIiwgsKvlrOU9gD/6a412BwyiO+6b2opl+eUDL2+9VKsRMVbVdN8xzPA3VScn/dctDGznGX5HRWwiOPhZvHxoLrW+91I49x8/vsqlptC9m94i3Ma0w8WGBODcH9WYtUeOrGpjf1UDteKlOIm+PU6zrHUahGeBxpMzum041Jzy+X8Ge+yo64WuTGUu6zU+zrR99l6lLaGJWQSg+y6HWcaBB9yShwIwtUIp8kQlxyuM9NQFt0/SEbP3NquK2Wwo+GSmNDrKlc4ElwjrwZJ/3cCTSSi702MptTKlyaYVKfa/0oyeJO1TSQxIf/0+G8Bxqdrb3yMVZ8LuYW12fglMyzLDjwxZIOAtoNXzJx/kkXq5hvj+j1aCajgjIlByrDSQJS/51IAbCRaQIQTETW7KMJhJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR03MB7468.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39850400004)(346002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(6506007)(26005)(6666004)(53546011)(6512007)(86362001)(31696002)(36756003)(38100700002)(5660300002)(44832011)(41300700001)(4326008)(2616005)(2906002)(6916009)(66476007)(66556008)(66946007)(8676002)(8936002)(966005)(316002)(6486002)(478600001)(43740500002)(41080700001)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a294dm5lTkEvUSs4RjlsbVpLVUVZQVkyWWdtdnc4UGxoa3VmRmhTcWNzR2lw?=
 =?utf-8?B?TlhzU2x1VEdCcHFMcEVBd2NkQmJGcEdpeVFrTzVvU2dKWnJCaE13bkRFU0Vo?=
 =?utf-8?B?alloNUFvN01Jc0lDaG5may9FdUg2VU9RMzdiZjYzRlNtWnlIcVhWbDVZd3B1?=
 =?utf-8?B?Z3BPa2ZMa3RubHN1VEJmaFZhRzB0MHRMZVNBOWZUS1BjOXhMRXEvSlJnM3Nq?=
 =?utf-8?B?NnBLeGFBYnZCVFcrdHMzVTcyT21VMWpjc1dMcks2Q0VBYzh2SldrL2F0R2Ir?=
 =?utf-8?B?R0RtRzY0UEllZnJabmtJR2ZhU01RbWo0VmNkVE5rM3ZCMjRGbndoYzN3Vkxm?=
 =?utf-8?B?UjY1QjNSaWZyZU5qM1JQQ1k4RldGOFA3YWFSTFd6d2ZFTnNwNHZuT04wUE14?=
 =?utf-8?B?bUdwK2ROZWQ4S0ZnaWNMOEk1V3gwTnRkaktxM1ZCZTlUOTBvTitUVXNGejdj?=
 =?utf-8?B?cU5qNlhtc0RHSjVhTUtnUkhJeWRtMzQ0MjV6N0YxUEJnMG1jL0poRklhRDFB?=
 =?utf-8?B?NEJUMUx6ejIzWFhKbEpTa00xSHBCWWdHZmZHYnJnM1lYTDdCSUJRQUlwL2w3?=
 =?utf-8?B?Uml5M2EydTRjbXhhMnNTTUJzZy9xSFp6S1k2Q2ZBNkFrT092Y2FWL3ZkWXVh?=
 =?utf-8?B?K2QvblFNZk05RUl5VjgyeXRVTXRkbmlsSkE1ZmFyZndKa2k5V1JrM0psVmhs?=
 =?utf-8?B?eFNyZHRJbWdvSFozV0xxUzFCa2E4RGZkRjhIN1VKTithYmtIc3UxMUFxZTZt?=
 =?utf-8?B?YlNsNUZPWWRrY3NyTzhqOWs1R0JIZEF3cUp3bDlZWVFtajEwQ25HUzRINXBO?=
 =?utf-8?B?andhT0tMeS83aUxrY2poNmtSRVJxRTRrcm5OWkNXSVh1UDJoVTVxU28vK1Jl?=
 =?utf-8?B?Rk5Db29ZQjFraWhpdFJjTHFHM1NXcDM1MXBhV1Z3NXFPS0sxNVFWRE5rWTE1?=
 =?utf-8?B?RnBKOG4yZTJDbTN0N0tRdG84S0d0aFBsV0NzN2ZXQWFrUmc3Nmtqejlna2tv?=
 =?utf-8?B?dXk5dlcrTno4MS90ODlUVHRNS1hCbTNsbE44a014NEI3ZVErbVdGcTV2V2NC?=
 =?utf-8?B?VHJDeG1yd2FMK1MvcmVQdkhtWGZYNUpVSEtTM0ZHVmJuQzhBTyt1YXFOK2pp?=
 =?utf-8?B?SlpCS09JRFZ2N1NCWjF2dW41ZE5HUUttM0taeDAzdkhEYUFQejZQYU9aM25D?=
 =?utf-8?B?UzJtMHpCczREVlZoaHpndEFiQkpXdWhnbmZTaGtGTitUQTJENmFKbFRyRDRn?=
 =?utf-8?B?NitxUnBPOWtBZXpsUmJLRWpWRXRmdG1aamtPSnRMQnlFaTNyeWcxTG1NTU1C?=
 =?utf-8?B?bHhOYkJVcm1aeC9sVzF4bndObEdaUStXbk1aN0lRVVc0VS9jUml0YTFTWEhO?=
 =?utf-8?B?aDlZSW5tSlphaEZOblFBTU1OTkVrdzVoZUdhVnRSRG16VlNubFVhRFQycHBK?=
 =?utf-8?B?NUlDNHBEb1NnRU9kbkFRK0xzSVh5YlhpR3g0U0tyL2tNME9tOXN3MWI2S2dw?=
 =?utf-8?B?ekJXQnBEbWxKQ1dCMVQ3UEtPR0RwRVZOME9BM2gra2c1VWRqNXR6YmxUNmR2?=
 =?utf-8?B?MG55VzJ2ZzhzT3MzUUVCQS9SUDlUVFkwVmpRK1E2Y1pkVnZNUjdLaVczN1E0?=
 =?utf-8?B?aGZlRkdxa0dsR1Q0RExGVUdEYnJCa0dOQWQ4d05PR0lCQ3MvL0hZbHNnMDJG?=
 =?utf-8?B?c1pYTnAydmQ3TGN3L3VMRWJQQmFoNE1Va0UyZndJdEFXUGZlYXpjS1ZWczhz?=
 =?utf-8?B?NS9Ha05mSlYxaHBlV2VzTjlpQzRpNWNFMzZUTDluejJZbGtPeHdEWHJtMHdw?=
 =?utf-8?B?dkYwZW5XNzR0U1o5Q3lRS0prWHQxSS9McG5yd2xpMXlFMWJOMkVLWlRER0Vn?=
 =?utf-8?B?SW1XK0dMQTlLcjRLYjR5ZS9hUXhuMjdXZDIrOUYvZEp6OGVTUXpSZ2hmdHlw?=
 =?utf-8?B?Wk1BQ2lLZkdiNFN6N0ZWd0J3VUlCUjFYNk14aW56UExzWlVHZUQ5SWw3UkxL?=
 =?utf-8?B?VmNMMTRyaHpGdlh4amxuMUxqd2ZoeWtKR0NxNTNTU0kyZ1FMZ1JPYjAwZUgr?=
 =?utf-8?B?ZmdPVytkM0s0VzhOdTc4djJwM3hHYVdNMXhJZnFJQnhtWXEvSzFRd1JDNmRD?=
 =?utf-8?Q?LSUG5WdshsKGwSGWTUuuFXwX6?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec8c923-ddd4-42d3-d2cd-08dc180d8df1
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:09:27.5733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jja5iOVHmrnT1WSCXeJVyIdVoHN9KSQrUrapXaJywylrwJpux4sNL5qELihgsVR+ifuLCSFuTWnK4qNTDQnzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amlogic.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAiPRmTXd1QhGPtyDbtB9/OhfMS16sjXIMDA1tnssQQ=;
 b=WnLtWSWgeaeUNrOClgP5OR1aRBh8NNRfv1EiEXzVt5XQF6GBIl18eoC26FvL4/beJ90Q33sbZUT7xY/ku3n9dgrON8R0OQ+IYFrT3X6eSAKBL7t7Ugwo5QBLdS+lhqcVWQhd3/le76hr8Q279N128LbcbXiHTdsB18CJhSvApS98/pSWjypV6k00wokuwLJmCrSQae7Pi7PAey928j885kQVyB0nwJiOn4AqWtfNAeU65cNs+8dOrrbonOEQIkad5mZsJihXHkwZdH9wEVHHomcEXQcKX2PO+uKA6bQ0ocT94YzLjaqvmukgtVscRbxP28kMXeOpmNNbkgXAUioE9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256
 header.s=selector1 header.b=WnLtWSWg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add support of
 Amlogic bluetooth firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 1/14/24 16:59, Yann E. MORIN wrote:

> Yang Li, All,
>
> On 2024-01-03 15:39 +0800, Yang Li spake thusly:
>> Add support of Amlogic bluetooth firmware.
>>
>> Signed-off-by: Yang Li <yang.li@amlogic.com>
>> ---
>>   package/linux-firmware/Config.in         | 9 +++++++++
>>   package/linux-firmware/linux-firmware.mk | 6 ++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
>> index 5befe50122..9b7ead89d9 100644
>> --- a/package/linux-firmware/Config.in
>> +++ b/package/linux-firmware/Config.in
>> @@ -602,4 +602,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
>>
>>   endmenu
>>
>> +menu "Amlogic Firmware"
> As the commit log states, and the file path implies, it is a Bluetotth
> firmware, so there is no need for a new submenu, and I moved the entry
> to the Bluettoth submenu.

Got it~
I will move BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC configure to Bluetooth sub menu.

>
>> +config BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC
>> +     bool "Support Amlogic SOC firmware"
>> +     help
>> +       Firmware files for Conexant Amlogic SOC driver.
>> +
>> +endmenu
>> +
>>   endif
>> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
>> index 96905dd909..4d02aeb714 100644
>> --- a/package/linux-firmware/linux-firmware.mk
>> +++ b/package/linux-firmware/linux-firmware.mk
>> @@ -811,6 +811,12 @@ LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
>>   # which is installed unconditionally
>>   endif
>>
>> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
>> +LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
>> +# No license file; the license is in the file WHENCE
>> +# which is installed unconditionally
> Actually, there is one, aptly named LICENSE.amlogic, which is also
> referred to in the WHENCE file. So I added it, and aded a hash for it
> too. Please check on your side that you get the same hash as the one I
> added.

Yes, The hash of LICENSE.amlogic is correct.
Thanks!

> Applied to master with the above fixes, thanks.
>
> Regards,
> Yann E. MORIN.
>
>> +endif
>> +
>>   ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
>>
>>   define LINUX_FIRMWARE_BUILD_CMDS
>> --
>> 2.42.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
