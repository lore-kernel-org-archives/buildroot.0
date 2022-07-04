Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80ABC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D54860EBB;
	Mon,  4 Jul 2022 15:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D54860EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GDgQATPOYBU; Mon,  4 Jul 2022 15:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5781860E94;
	Mon,  4 Jul 2022 15:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5781860E94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55CF1BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEF144000B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF144000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ToMfI9tQszT for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3E340002
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD3E340002
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLG9euMMVhq3EPXT3tVukJ2Gk3LV4e0Az2WSUPhprYd7oi4xwaw7vu2w2mA6XMeVn35zxvph0gohoJ+bX2xjGlc5xkmN0XRkZSw689301EYLFATD1DCQ6GYJnEvG9JtgJDvB1mzAr3f5QOirKvQXIrmNKqpw3LX08oO9A+7fwxH02vj//YY9lSz7cVbG2/SiFpxvcxTZ17ouzGJQl+kDGWdca+aWMc6bMio/A64eASXULa1fjZgCZPq7SgnPGmjd0jWvvu/of3rVeYmCswpFwA/DdGaeivCJHsLPxX73+nIj4GzPht+I2xeTPdHL7Zq3hP1Tlz5/pNK3qDALXK6H+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vao2xv1Ew9mnaIqGC8SL+dzNbDu8bhc6lUcsvxnpY6Q=;
 b=VRxqpQH/8fAsGmKPN/BuNcRI9ubzi5+tWthwBcqgXqB2Esh2jrb1dmt2zJYyWp3xAXxpQfPMtI19cQphXjTRAjbinxBG3MksRrpTIrEMhssBQgynveXMyF+PF82uK2G5TnqICqPKRVxpk8irG+PWcdIkHy74748RJ9aCtIDB6IrbsmbEQaNKhHC9eZfZu6K/E82ddHE+mSxQPgitsYSwtNPLonqdw2aay17SeKQCVZYthqz/3Zrz5iiInwek7e8Ds/1OUuxUYd5HjpFSG5hli7NbjrmEYmTMLvurdviUVcJuq4NsuO0/jV2OAS3LMPO5PQ33wmLM3JTo4RIZ5HOTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB6PR0401MB2264.eurprd04.prod.outlook.com (2603:10a6:4:47::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 15:28:36 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f%7]) with mapi id 15.20.5395.017; Mon, 4 Jul 2022
 15:28:36 +0000
Message-ID: <851f6c15-99de-448a-4bac-2b0f0abe0232@theobroma-systems.com>
Date: Mon, 4 Jul 2022 17:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bert Schueszler <bert.schueszler@theobroma-systems.com>,
 buildroot@buildroot.org
References: <20220511123423.1600023-1-bert.schueszler@theobroma-systems.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220511123423.1600023-1-bert.schueszler@theobroma-systems.com>
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f75d06-35e5-4ff9-6dff-08da5dd1dca2
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2264:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GuIPaZhHAO5CghA7Jg86WgLwokgjXgY0x/PdqkMJ3ml52x1rK4/2RbXAX78bIn8hcReKpiQo9+/zBrF38dK0e3dT3qkf/UNddf3CtvaTcJa79zXduZuOJsEicn8lDn/i1WNInm/rZTbmgTWoaLcemwDBzhzahqaSyPHGoTMPqOdje2OxV8gdVGSyNJmfPr2hhSRKdmDnnZ/SZhGhRHiwHl4DLWtwrYsr1m93ydaPMrhuWdNM7z6X2Xb7jTmVIKKoe6GudevyRzXf5eRngDlZoMNBlCJI3PQpqImaj8TEvs2S4aebQil9e8SpMLuXft58bPGBnCffYvnkIoUMsdWUdqRA9YOpLWa+TLaCe4kSUmo0vmthN4jza+ALaWCJyrFYWfZT6ZAO/512Y863iSVs8BZkDVA5xRf1jLJrHItrJRr9PE5Tld577CQ9YZV6HWsGPCe3UsgTm4YyrnZK5zjbzvraV/9cVG4VD1pexGKmVPbRwB9HLNxdHOYLXIt/Nn2hMekaPoAHx5g5vxmw1A2RflkZ9muTDN1doo9P5lIa+/XuD8AvO7kUYC9Pa1ezLWbawsfIsKdjvcRcEcMB3bt2c8l60gcF5Skhlw8p7SGNzOTbI6tUZoJ8utRf9S3yJOBnM7/CzsR67Gkm/iprY/F1RzfYaRUJs/MkdIo2h6vUO3KhYxG3nCYX7RQmIhUQmQnEjgnUdFRLFNKtjM9dHWRJlPaV+e4OJd2QrzJdi46AiCzQAULLxRbMZc/V3lcyX6ymYa+N52TtB66dKoKNVYQ3A1xYv8dfcZ4xcCmMvu8HCwgDZoGNktipZTHd+obM1CtAxvJmbt/acNSvTlrDEg2mCk6cbZe90rPb6rqmThqJUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(376002)(396003)(136003)(346002)(366004)(86362001)(36756003)(31696002)(38100700002)(53546011)(6512007)(26005)(2616005)(186003)(8936002)(5660300002)(6486002)(6506007)(66946007)(316002)(8676002)(4326008)(478600001)(66476007)(31686004)(44832011)(2906002)(66556008)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJGQkQ1Yk9OTFhCK0p0UnJ5WXI4VnJvc053MGlIbktwOGtaMVFVQ2RVSkZK?=
 =?utf-8?B?cWdJMkFNcitXRHJiTDlOb1lmT3cvNklySTFiWlRXWjJkSzFoQU14YUtOTVA3?=
 =?utf-8?B?Z0dDWERuMUp6YTlraFRVYTV1WlhMTmpHeHBJQWpEb2NkUzlobmdrSUk3cGhC?=
 =?utf-8?B?VHVram9yMHJTWlZidUROZVEvZXlER3MrZCt2UUUzbGxCaWx6RktEWW42TkR1?=
 =?utf-8?B?OGRJblN5bmFQckJFcWxpaXN1Y2RKQUd4UkhZVGN2MHBiTTA5c2JsQ3ZMWEhv?=
 =?utf-8?B?TkJQNys5Ti9PRkpQMzRpQmM0RUN5R1ZXU3BJcTZCYmdrbUE2ajlvRVFBTTRa?=
 =?utf-8?B?elpFVHFHOFZBeUFVeklWdmxiemhxQWF6cVZjSnJtblVNQzdFN1lENTZ5N3hz?=
 =?utf-8?B?aEtjVGhPd1o3anRFVlV2ZEx0cGFNQWJhZmJwUHU2bFl2YnZ2ZGRpMkpIWm1o?=
 =?utf-8?B?MjVRRnZoK3BJTFJjVlRreDhLZk1kRGVQU0p4WnZNZzB4SVFlRGVqUGZLSGNQ?=
 =?utf-8?B?VXZQL1hDYWt4bVRzVWhldDNtWWIvOUtLQ3J1MEtOMlhGc05hMzFlYXI5eFk3?=
 =?utf-8?B?L1N2U3p1OE1Ib0d1RDF6TUJGNnVCVVhEaEd1ckk3TDlBV3pjUVdqSkxoK3JZ?=
 =?utf-8?B?SlRRbXJCTHh1VkljcnRiaElxMFJZSThhbVVnekxWVWl1M0dhK1dRSm4wVkpC?=
 =?utf-8?B?TGZJUFZCbzBiZ21ZQWh6ME9XVnQ0UVpFK29oTkhuTG0yNUR4bXR0aHNoWTIw?=
 =?utf-8?B?T1QweGNucHBtRGxsR3NzKzkyS3o2bG9wNmRQTzlFN3I4MFZYUmJyL1VNRS9K?=
 =?utf-8?B?Ykl5V0pDUjdMTmtNYnh4QzJkZWtNa2hlTDZrZ3U2OFkwYU5sMzBKNmF1d1Ni?=
 =?utf-8?B?SzJRK0lYdmp1YVRlSHExRUNHNUZQYzFtUjV5VlpvZUx1NE91SlYxQUxoSk50?=
 =?utf-8?B?TXJmb3hqeDVuUG85Ymh2QSs3M1JxaVI0Mk1zRVRObXkvZVZiWk9rYm9GNGJH?=
 =?utf-8?B?eVNLNWszVVdtd1ordDVCcFc0aVRwQzBydHlROVVMZloza1c2bm1zcTFiWUdK?=
 =?utf-8?B?VkVjeFBRakZmRDQ2bzBhOXlzblBvaklHMVpXUXlLa29DVnJqVVJHZU1jOXhi?=
 =?utf-8?B?R1IvZ2Z0K05EbDR3NktlaHpzcURFS0JNd0s3QWNIclFjTUozdk1mMGU4UzR4?=
 =?utf-8?B?L3k3cTFTdEZ4RDYyb0hPeUh2bVZSUVdIWFh0RWZPQlVRbWh0OS9uck92Qy9v?=
 =?utf-8?B?S0JtdFVqalJycng5bUl0ZkpVN2RoM3k5THhRdlZlZGNROFlxS29aNlNQNmhl?=
 =?utf-8?B?VW90SXVmQ083OGxjTzIvOHJlbmx4S0sxbmtnclpDSThFTlc3MGRwRmlMcGl5?=
 =?utf-8?B?Tk5XMnc2Tk5ZMWF5RGtKdE9xWUJTcUdOYlM0NVl6V1RtOXVsNlBUL1VCMmdz?=
 =?utf-8?B?SlhCaS9LRXFFZmp6T3A4UmZjUHRzMkh3KzQ5QXM0QnYxZklJalpzMFFhTzZ2?=
 =?utf-8?B?RU9MeHh1cXRmQXA1Z2ZRcWVGWGtVR09vaEVueWYrWlZIN09tanZWMkVKTDhT?=
 =?utf-8?B?UEt5VWcrb2x5cWhIcXJKWWJnWit1VlV3Y0tJVGdndWgzT0VHeE1ZVnpmWVJM?=
 =?utf-8?B?UVBVN3F1S2RNMVl4bnZoSHFVYkxnc09IVXNiQ0hMUllDQjdILzFOY0M4VDZI?=
 =?utf-8?B?bElKd1ZWZVRGcDdvTWN0ZW0zRTh6b1pGMzg1OXlHNTgzUGEzdzBCaUl2YWln?=
 =?utf-8?B?TkFtVzBPN1VoU1BQYld6dlhsZ2lvWmZONXliZEViUmRubm9ZK1hhM0tDRFha?=
 =?utf-8?B?QncxQUlCeldLWCtwUGlLWGN3QmdSOVEwN3JUd1duTzRvNjB2VzZoS0hRNGRs?=
 =?utf-8?B?MjBFU014RDgxWWhnbEx4aDYzajlFZ3huajYxengzOHFoc1VvWm9CeTAxQ2ha?=
 =?utf-8?B?OXJwaG5VaEpJTnJoclFxQ0MxN2thMllkb3pWeUI2V1N0VFRabE5CSVIzdjNo?=
 =?utf-8?B?Y2R0dlhhRTFLYmI4Vjk5L045ZEZlQjFBSFN5ZnV2TXg4MG92dTdDbnNWTVdC?=
 =?utf-8?B?TFVWUWdKMlhXVCtnZDUrVDhEZHlucVFsdndobzNxS3BFSXU4ajczcTZ3RW9p?=
 =?utf-8?B?Ukk1dVp5b1RQRGNpNU1yeW9KaGRPa0pqa1AxVzlpRjFrZjBDY3Q4QXlYZ1FW?=
 =?utf-8?Q?s8cyVMUkDLo7GniziwOCvyI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f75d06-35e5-4ff9-6dff-08da5dd1dca2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 15:28:35.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CvE8KHoxkL5N6d1/bY0vVKzkMt3P+/jeDwD0ACLYJleurnLyOrZfsAfcux0iFGKCqUrCd26sfDWrQM2hu/RA9ACDzn5as31xaT4/RDYldBfbprURwCcQb7yR68a4oIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vao2xv1Ew9mnaIqGC8SL+dzNbDu8bhc6lUcsvxnpY6Q=;
 b=e/8cmTruOPCge36xTJpkncqy+OwWUmFKE7JBb27rlgokPLX3eYWpTr/vMdXWvNarO5fNfhKhMlTFf11GwO+IrYsOvdlYhl2JgkcOlyCXFcS6YQXi+6NVzSoPorVUlSl6nEO52dv31O+cgsL24MPXae+iNBZzbEbypxsqOlSzRyw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=e/8cmTru
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: add config option
 to enable bypass-lan plugin
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Any feedback to offer on this patch?

Cheers,
Quentin

On 5/11/22 14:34, Bert Schueszler wrote:
> In case the user wants to use the bypass-lan plugin for libcharon, add
> a configuration option.
> 
> Signed-off-by: Bert Schueszler <bert.schueszler@theobroma-systems.com>
> ---
>   package/strongswan/Config.in     | 3 +++
>   package/strongswan/strongswan.mk | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 430625a102..c611175f47 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -191,6 +191,9 @@ config BR2_PACKAGE_STRONGSWAN_SQL
>   	bool "Enable SQL database configuration backend"
>   	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL
>   
> +config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
> +	bool "Enable BYPASS-LAN plugin"
> +
>   endif
>   
>   config BR2_PACKAGE_STRONGSWAN_PKI
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 95079aceb3..44c20f8414 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -57,6 +57,7 @@ STRONGSWAN_CONF_OPTS += \
>   	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
>   	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
>   	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no) \
> +	--enable-bypass-lan=$(if $(BR2_PACKAGE_STRONGSWAN_BYPASS_LAN),yes,no) \
>   	--with-ipseclibdir=/usr/lib \
>   	--with-plugindir=/usr/lib/ipsec/plugins \
>   	--with-imcvdir=/usr/lib/ipsec/imcvs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
