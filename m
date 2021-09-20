Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3A4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 15:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9148661077
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9148661077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404984031F;
	Mon, 20 Sep 2021 15:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXockal3_Fr0; Mon, 20 Sep 2021 15:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2040A4032C;
	Mon, 20 Sep 2021 15:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC3D1BF400
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 15:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7852E4048F
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 15:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNVnIvAXTvAI for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 15:15:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36C3A40451
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 15:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGGg0+JCn5Syn2cQvAa6IMi19vQjHq2QwGf7njGmnI3GRKCWcS/v8bpA4Ln5Z2ZPtpS8v3x+Rt95E/mailvWH56cHIUHPe2LiuPUckI7aJSspOCn2XJG9zto1XkRfJlU2VqtXsPaDMzaXIjfL9eWb6fXKVldcFFdhACAkTaUDHT0IF/JBcaSouyhJDQjf/RP2EfMAe8Ecabv3l8CAhI7Cwhbk14n9o8VI8MdOS0wfFzvAwVrN4SkZxWqUWplX1B6KxtLu63/62IdETXPJgHKNvHpbcdfmPLm3hPaaC0bvsuO3iu3D4Mx37lUT1h/23FZyhZY5cHLfSJ6Wp7qN3UIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HrrTJe4vGdFkd44H685PxhDnQRNZlkOjmU+Gz0O8/Vg=;
 b=hFj8ydeK/GfPxCsvu+Ej8lUhqKwGJDBPFD9A0b81j07A/vswEem03odSZHqlsAzTGoIH80If4o9SiL+IoTJxAL3NmUyvMsYx1Y7U93FrAHW7SUTttPBA/QYpsga7SHayKC4bs/vyQY1IKAeb7EJTDc6WwPKhy5ZArP+1O6iiwKe4XXrDsnS7A2Zvnrj+jd3F6MSnzusROcEmwTKMbZYNG2F/nFlEMVUFxO3rHWxhutKyrAVnGCBo/Ce+/zvmnFJdCShTQm4klYuvKlkJAlu+/3IGyGrUY7zxN0Y060boiD2FuLswLVroa7+LLmnaQ+95KbK1lLO0lIgN/ot3Y+uALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrrTJe4vGdFkd44H685PxhDnQRNZlkOjmU+Gz0O8/Vg=;
 b=UyDh07xdUz50YCuNo9KeHjfTCBpQXAWrn97fOuNkyLyUvo9Yn28qIy92d3js+vr2vRDMB0HEoIuq23e2xiIwuLBgzAS/yiYKT8xct4MYggE88EzJp9EKCOC7Oa5DCC+J/R2evoF8dXi/9PgdTk+RrGJ/9DSnSVJSeAfQMoRFrrg=
Authentication-Results: sysmic.org; dkim=none (message not signed)
 header.d=none;sysmic.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from VI1PR04MB5679.eurprd04.prod.outlook.com (2603:10a6:803:ea::22)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 20 Sep
 2021 15:14:57 +0000
Received: from VI1PR04MB5679.eurprd04.prod.outlook.com
 ([fe80::c5b7:56dc:fd52:91bd]) by VI1PR04MB5679.eurprd04.prod.outlook.com
 ([fe80::c5b7:56dc:fd52:91bd%7]) with mapi id 15.20.4457.024; Mon, 20 Sep 2021
 15:14:57 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
 <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
 <20210918210627.GA1053080@scaer>
From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Message-ID: <aed68406-4b1b-c372-37af-aa3422e84d20@theobroma-systems.com>
Date: Mon, 20 Sep 2021 17:14:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210918210627.GA1053080@scaer>
Content-Language: en-GB
X-ClientProxiedBy: AM0PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:208:be::48) To VI1PR04MB5679.eurprd04.prod.outlook.com
 (2603:10a6:803:ea::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from melshuber.lan (92.42.140.82) by
 AM0PR04CA0107.eurprd04.prod.outlook.com (2603:10a6:208:be::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 15:14:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3850c240-4d86-43e4-7c91-08d97c4967fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4285F1B675222EBA553D4524BAA09@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNHW24i6Hk75mqrkMCiFAe8wa+ySUM9b9OS47Ds/ka9frToWkXyBHs1qaRteqo/RHSi60z91NdtWW/ua5pTL0UkfQVVc4vNJA+/jIKRGGoFvJLttxDHdiR6PZ5D83pCAbAFPJhz4w9MqLFO8DrGI3f/SlygOyIyl/LvKKz0nGI0tuHV86q41bxkz/dF6qd6+mvBgCigs7IFfdK+QLLp9WptVxuDV1TVXSdTp3+Zt4ZF5DRmCv72Hike7tdzHGxQkHBeAzP+huyMwiCxgBsnLe1bLPbCdA0SUYvsqneKYV9/IeEVsv8nhCnSG+akG8WF5uu0Yr32TO961biEeP0KU2bPLlpP8xQejn0qPjNrEVdX3pWEWXUlxAkZcbnsZQgxqgTfWaLrz3QmWUvQfWOA5jC+mH3frRLgU4wPef3k4M4MuptxyGBX27eYuO+8T3ONqQQmOMvTy2P1Xdh9FveA6UYEtKpskvX+kk+W5xVq6yO+fZ7wu2fMH8WLtLbU9eVl9aoTDXq+17JVkx0o/XgQsFeoiUSq9iPxjsAJOUuO55MWlWjWRVX4jfI6t0JfJzFT8RVfqANPRVQUmNQ/YOc9qwty/HSow/g4JYv9IhFsQQWZm7rwIGaiAx6ZgN0j/NRa0c3IAHV5YJkDjNgyH3yP+yV9Ms7uZu9bD/sYZN+Axw8Kem/ATHXD5P7OubQiqYy5X+BYnHuH80jMPfNAHFhQ0abDRG24aEEPR6ZLVgWb5gXcmT09TRsgDNsy9FeLuMLDA9Ca6EsosA0Mi/PvQ71t/T0XnfKaohbPfgnfLFhbLr9My/Ry2WnZuGLz4Ly1SO6fya3hvlA9TAv1EX0lyyA00Ugm+bxSBuFu05hKxwXE5c68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5679.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(6486002)(6506007)(6916009)(26005)(66946007)(8936002)(508600001)(66476007)(30864003)(38100700002)(2906002)(166002)(2616005)(31686004)(186003)(83380400001)(86362001)(33964004)(956004)(6512007)(5660300002)(66556008)(38350700002)(4326008)(316002)(31696002)(36756003)(8886007)(44832011)(52116002)(53546011)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG4xNW9VOGNBMWRINXlhWm5UR3ByRUNJY3JKZFhuUUlCaHVTV2U0N00xZkpE?=
 =?utf-8?B?dlU3ZUoza0pKRGhud3BoeVNUelV6WFJKd3Qyd2RWY0hrSlRtaWpyNDE5Wm1U?=
 =?utf-8?B?V3pPK0hZc3hxdG91MTlUbFg4V0prQXhtU0p4VnhjNWFvYWVzbmgzYXFQY2tx?=
 =?utf-8?B?cDdLNXR4YTcvbVBxdW5RR1QzZUo0V243K2J5Q2xaNEJmRGJCS3RtOU1Vd0Nm?=
 =?utf-8?B?d2dZNjhjMWZnZngvZmxyYklmMjc4bWhKSXgvNWZTUitvMkl0dXFTdEFla3JV?=
 =?utf-8?B?OWZPRFh5QWtpZzdsb0hzU2xSdDNNVll0VElweXBQNzh6cWRXc09iblZVVnQz?=
 =?utf-8?B?UDQxL0tEWTkrWUErbmFLL3JCOS9YbjlXN0dtTnBLYy8ySjNraWFqc3ZHUW0w?=
 =?utf-8?B?NnVDQTVZUTh1cmNBeUJlUWd4aWlDRmVVSERHYytROUI5cVNHNmxQZmphT0lo?=
 =?utf-8?B?TG1KRmF3ejdSTnN0bk1VWWpYVmtQaGROTGM2dDdYMGxRTnJGZkZZZkYrUGx5?=
 =?utf-8?B?QndzMmh6TVpZak5wcUN6a05kN2pWUlRhTnQxTisvWnFrTUNrcnJyMWtwclFL?=
 =?utf-8?B?NEJDZy83UXU5TWY4SWh1L051bUtLR1ZTR0Njd05PRExXZENPRGpxN2EyQWNJ?=
 =?utf-8?B?WTNvbm9vZHIzTkpJVDAxWVBmYjBVVkJhSVQ0TEpKQSt6VVNLazRUSE1SUnVy?=
 =?utf-8?B?VlpvNUJTRithMDVtN01PWWJMcFlpU3MzeGIvNEpJZU9hc09BaDNUTE5Wc3Fh?=
 =?utf-8?B?UWtiVTBiWWJnTDMza1dHMEJldW1rWWxHeFJjdmd1UmZiaTZSaG1kRFp1Q3Ar?=
 =?utf-8?B?R1hUWHNoa29zS3VWeUllSlhuQWh5UUdjYzRSdy94c1ZSRHNCc0REWlcvb2Fr?=
 =?utf-8?B?V25iRUJrOW1vN2lObXZ1Tk41eTlTV3dtS1E4L2w4cFkxbVpjd1ViM0tDQmkw?=
 =?utf-8?B?Y2tZT3M4REVnWEt6Zm05UksyU2xNWmJnVUx4ZVBNTTZZKzJNNGlwL214MDNx?=
 =?utf-8?B?RkIvSG5hWEExTTlrS21mdVRqR3d0UitMbFlWVTBDSDFzekVrdlkyajRrY1la?=
 =?utf-8?B?RnJBTDdqQjJZUUZFNDVhb3dwT2ZTWElYQzhWZnY3ZForcm5CZVMvS2xRL25E?=
 =?utf-8?B?VWNOaTZadnBtTFNrai9UYU0xSk9aQStrZ1dhelBHVGo5Mk1WSjY1M2xpNVJ4?=
 =?utf-8?B?dTV6NDlmR1RaUlV1ZEVkOEhMQ0dUWklrK1RKNkw5cWVOUURqL09nUlo4QVR1?=
 =?utf-8?B?ZzBuZnNhb21mNU5EWWVVY3dZZWFRQmZSakpock5peE55WU1FRlU3S21BVTVP?=
 =?utf-8?B?WUhUN0lDUVpiMitobkd3cUhGY244cW5GcnY1b2xmajFsRW9scVBueE9sOFMy?=
 =?utf-8?B?K2Z5dUhTWlNxTC9jeW04OVo5WDY2VFVIS0pnNjFGSkpNdGoyZjNEbEhnaDU5?=
 =?utf-8?B?YlZqWnVySUxnOUJmRjlRcUFCQWNuQkVSNDJNa21RVUVpYWZkYjJYanRncFVP?=
 =?utf-8?B?VDJlOXVmVkFuZmJzemR1d1JGb25uSXV1U0FYMmhzenVHYjF3b0h1bE5HUWxa?=
 =?utf-8?B?WlljM1NSTWdsWHEwY0U5S1hJeXRtV3l4bU0wZGtoNVgrZUVzOU1pZDgxbCts?=
 =?utf-8?B?UytnN1U5Qy9QK3NZVkVDWTdvUEhiSUF3L0s3a1R3YjBuM1I4c3lhRjN1TnFE?=
 =?utf-8?B?a2NxK0dqOWU3Y1BCL2FCcllodEJJSENJcVc4LzF5eE9lbUg2VVdXbUUvVS9Q?=
 =?utf-8?Q?lU/asabH37CrZ8XU7vcijW7d8o9WdKD2fxkN+ji?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3850c240-4d86-43e4-7c91-08d97c4967fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5679.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 15:14:56.9496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICzg2iiUbw0XNrvdi6BsbNEpx6bCttl9W02PaBYPHW+KzIofL/j7eU4pmXYLr1QOiZXNSi1/C5Mb4M8tq5E5nqez1deuRH8yKqHBWBGG2S4cwlafbh2KALLzZ0Arve4y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Subject: Re: [Buildroot] [PATCH 2/3] package/strongswan: Add options to
 select EAP plugins
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2975922050218568958=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2975922050218568958==
Content-Type: multipart/alternative;
 boundary="------------C32318603DD2E5CA5A199F28"
Content-Language: en-GB

--------------C32318603DD2E5CA5A199F28
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Yann, All,

thank for the feedback.

On 18/09/2021 23:06, Yann E. MORIN wrote:
> Martin, All,
>
> On 2021-09-13 16:26 +0200, Martin Elshuber spake thusly:
>> Add options to chose EAP plugins.
>>
>> Since the only plugin requiring libgmp is
>> BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
>> is moved down accordingly.
>>
>> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
>> ---
>>  package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
>>  package/strongswan/strongswan.mk | 36 ++++++-------
>>  2 files changed, 87 insertions(+), 38 deletions(-)
>>
>> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
>> index 368cd1ecc0..77d437d7d9 100644
>> --- a/package/strongswan/Config.in
>> +++ b/package/strongswan/Config.in
>> @@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>>  
>>  config BR2_PACKAGE_STRONGSWAN_EAP
>>  	bool "Enable EAP protocols"
> If I understand correctly, BR2_PACKAGE_STRONGSWAN_EAP no drives no
> option directly, right? As such, it can be moved to legacy, and
> then [...]

Correct. Will update

>> -	select BR2_PACKAGE_GMP
>> -	help
>> -	  Enable various EAP protocols:
>> -	    - mschapv2
>> -	    - tls
>> -	    - ttls
>> -	    - peap
>> -	    - sim
>> -	    - sim-file
>> -	    - aka
>> -	    - aka-3gpp2
>> -	    - simaka-sql
>> -	    - simaka-pseudonym
>> -	    - simaka-reauth
>> -		    - identity
>> -	    - md5
>> -	    - gtc
>> -	    - tnc
>> -	    - dynamic
>> -	    - radius
>>  
>>  if BR2_PACKAGE_STRONGSWAN_EAP
>>  
>> +config BR2_PACKAGE_STRONGSWAN_EAP_SIM
>> +	bool "Enable EAP-SIM"
>> +	default y
> [...] each individual EAP option would have a conditional default:
>
>     default y if BR2_PACKAGE_STRONGSWAN_EAP  # legacy
>
> This would have the added benefit that, when we eventually get rid of
> the legacy entry, we can also get rid of the legacy default.

Ack. However I am not sure if you want to get rid of the defaults in 
the future, since it might introduce a pitfall for the person configuring
strongswan. But that is a problem for another day :).

>
> [--SNIP--]
>> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
>> index 322abfbd7b..ebfa1a11f3 100644
>> --- a/package/strongswan/strongswan.mk
>> +++ b/package/strongswan/strongswan.mk
>> @@ -48,30 +48,30 @@ endif
>>  
>>  ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
>>  STRONGSWAN_CONF_OPTS += \
>> -	--enable-eap-sim \
>> -	--enable-eap-sim-file \
>> -	--enable-eap-aka \
>> -	--enable-eap-aka-3gpp2 \
>> -	--enable-eap-simaka-sql \
>> -	--enable-eap-simaka-pseudonym \
>> -	--enable-eap-simaka-reauth \
>> -	--enable-eap-identity \
>> -	--enable-eap-md5 \
>> -	--enable-eap-gtc \
>> -	--enable-eap-mschapv2 \
>> -	--enable-eap-tls \
>> -	--enable-eap-ttls \
>> -	--enable-eap-peap \
>> -	--enable-eap-tnc \
>> -	--enable-eap-dynamic \
>> -	--enable-eap-radius
>> -STRONGSWAN_DEPENDENCIES += gmp
>> +	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
>> +	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
>> +	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
>> +	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
>> +	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
>> +	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
>> +	--enable-eap-simaka-reauth=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH),yes,no) \
>> +	--enable-eap-identity=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY),yes,no) \
>> +	--enable-eap-md5=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MD5),yes,no) \
>> +	--enable-eap-gtc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_GTC),yes,no) \
>> +	--enable-eap-mschapv2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2),yes,no) \
>> +	--enable-eap-tls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TLS),yes,no) \
>> +	--enable-eap-ttls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TTLS),yes,no) \
>> +	--enable-eap-peap=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_PEAP),yes,no) \
>> +	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
>> +	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
>> +	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no)
>>  endif
> And indeed, from the above list, BR2_PACKAGE_STRONGSWAN_EAP by itself no
> longer means anything; setting it to 'n' does not even forces all
> sub-options to 'no', but leaves them to their default value (as was the
> case previously, though, so not a regression).
>
> I think this ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y) can be dropped
> altogether, now.

It can. Will move the whole block into the general 
  STRONGSWAN_CONF_OPTS = {...} block

>
> Unless I missed something?

I guess no.

>
> Regards,
> Yann E. MORIN.
>
>>  STRONGSWAN_DEPENDENCIES += \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
>> +	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),gmp) \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
>>  	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
>> -- 
>> 2.30.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@lists.buildroot.org
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.buildroot.org_mailman_listinfo_buildroot&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=WUaTHm7595mhxO1H3AMKtTdzXTgwvezJrC62UXYMTfsy0k4SqBTM2mfmbqYdqwva&m=4FTeZDHlQL1GQdkl2pRk8-ZlLhvtYhPEPMLF24oTSBs&s=wWkgHAeyK-THzsFI1NUPxoJcZAcdAN1PYD3Y2geLV18&e= 


--------------C32318603DD2E5CA5A199F28
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <font face="monospace">Hi Yann, All,<br>
      <br>
      thank for the feedback.<br>
    </font><br>
    <div class="moz-cite-prefix">On 18/09/2021 23:06, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210918210627.GA1053080@scaer">
      <pre class="moz-quote-pre" wrap="">Martin, All,

On 2021-09-13 16:26 +0200, Martin Elshuber spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add options to chose EAP plugins.

Since the only plugin requiring libgmp is
BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
is moved down accordingly.

Signed-off-by: Martin Elshuber <a class="moz-txt-link-rfc2396E" href="mailto:martin.elshuber@theobroma-systems.com">&lt;martin.elshuber@theobroma-systems.com&gt;</a>
---
 package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
 package/strongswan/strongswan.mk | 36 ++++++-------
 2 files changed, 87 insertions(+), 38 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 368cd1ecc0..77d437d7d9 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool &quot;Enable EAP protocols&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If I understand correctly, BR2_PACKAGE_STRONGSWAN_EAP no drives no
option directly, right? As such, it can be moved to legacy, and
then [...]</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Correct. Will update

</pre>
    <blockquote type="cite" cite="mid:20210918210627.GA1053080@scaer">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-	select BR2_PACKAGE_GMP
-	help
-	  Enable various EAP protocols:
-	    - mschapv2
-	    - tls
-	    - ttls
-	    - peap
-	    - sim
-	    - sim-file
-	    - aka
-	    - aka-3gpp2
-	    - simaka-sql
-	    - simaka-pseudonym
-	    - simaka-reauth
-		    - identity
-	    - md5
-	    - gtc
-	    - tnc
-	    - dynamic
-	    - radius
 
 if BR2_PACKAGE_STRONGSWAN_EAP
 
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM
+	bool &quot;Enable EAP-SIM&quot;
+	default y
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...] each individual EAP option would have a conditional default:

    default y if BR2_PACKAGE_STRONGSWAN_EAP  # legacy

This would have the added benefit that, when we eventually get rid of
the legacy entry, we can also get rid of the legacy default.</pre>
    </blockquote>
    <pre>Ack. However I am not sure if you want to get rid of the defaults in 
the future, since it might introduce a pitfall for the person configuring
strongswan. But that is a problem for another day :).
</pre>
    <blockquote type="cite" cite="mid:20210918210627.GA1053080@scaer">
      <pre class="moz-quote-pre" wrap="">

[--SNIP--]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 322abfbd7b..ebfa1a11f3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -48,30 +48,30 @@ endif
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
 STRONGSWAN_CONF_OPTS += \
-	--enable-eap-sim \
-	--enable-eap-sim-file \
-	--enable-eap-aka \
-	--enable-eap-aka-3gpp2 \
-	--enable-eap-simaka-sql \
-	--enable-eap-simaka-pseudonym \
-	--enable-eap-simaka-reauth \
-	--enable-eap-identity \
-	--enable-eap-md5 \
-	--enable-eap-gtc \
-	--enable-eap-mschapv2 \
-	--enable-eap-tls \
-	--enable-eap-ttls \
-	--enable-eap-peap \
-	--enable-eap-tnc \
-	--enable-eap-dynamic \
-	--enable-eap-radius
-STRONGSWAN_DEPENDENCIES += gmp
+	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
+	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
+	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
+	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
+	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
+	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
+	--enable-eap-simaka-reauth=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH),yes,no) \
+	--enable-eap-identity=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY),yes,no) \
+	--enable-eap-md5=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MD5),yes,no) \
+	--enable-eap-gtc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_GTC),yes,no) \
+	--enable-eap-mschapv2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2),yes,no) \
+	--enable-eap-tls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TLS),yes,no) \
+	--enable-eap-ttls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TTLS),yes,no) \
+	--enable-eap-peap=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_PEAP),yes,no) \
+	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
+	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
+	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no)
 endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And indeed, from the above list, BR2_PACKAGE_STRONGSWAN_EAP by itself no
longer means anything; setting it to 'n' does not even forces all
sub-options to 'no', but leaves them to their default value (as was the
case previously, though, so not a regression).

I think this ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y) can be dropped
altogether, now.</pre>
    </blockquote>
    <pre>It can. Will move the whole block into the general 
  STRONGSWAN_CONF_OPTS = {...} block</pre>
    <blockquote type="cite" cite="mid:20210918210627.GA1053080@scaer">
      <pre class="moz-quote-pre" wrap="">

Unless I missed something?</pre>
    </blockquote>
    <pre>I guess no.
</pre>
    <blockquote type="cite" cite="mid:20210918210627.GA1053080@scaer">
      <pre class="moz-quote-pre" wrap="">

Regards,
Yann E. MORIN.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),gmp) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@lists.buildroot.org">buildroot@lists.buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.buildroot.org_mailman_listinfo_buildroot&amp;d=DwIBaQ&amp;c=_sEr5x9kUWhuk4_nFwjJtA&amp;r=WUaTHm7595mhxO1H3AMKtTdzXTgwvezJrC62UXYMTfsy0k4SqBTM2mfmbqYdqwva&amp;m=4FTeZDHlQL1GQdkl2pRk8-ZlLhvtYhPEPMLF24oTSBs&amp;s=wWkgHAeyK-THzsFI1NUPxoJcZAcdAN1PYD3Y2geLV18&amp;e=">https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.buildroot.org_mailman_listinfo_buildroot&amp;d=DwIBaQ&amp;c=_sEr5x9kUWhuk4_nFwjJtA&amp;r=WUaTHm7595mhxO1H3AMKtTdzXTgwvezJrC62UXYMTfsy0k4SqBTM2mfmbqYdqwva&amp;m=4FTeZDHlQL1GQdkl2pRk8-ZlLhvtYhPEPMLF24oTSBs&amp;s=wWkgHAeyK-THzsFI1NUPxoJcZAcdAN1PYD3Y2geLV18&amp;e=</a> 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C32318603DD2E5CA5A199F28--

--===============2975922050218568958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2975922050218568958==--
