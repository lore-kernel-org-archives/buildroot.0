Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970AAC19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 11:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFA740988;
	Thu,  4 Aug 2022 11:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFA740988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgCOivGSXuGN; Thu,  4 Aug 2022 11:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABE84093F;
	Thu,  4 Aug 2022 11:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABE84093F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7864B1BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BEE8272C
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52BEE8272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkSL_VNXEBUz for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 11:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A798272A
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20A798272A
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 11:47:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTD5N70o17OezHznKqtrkWNvqVIUGS/dQGQ3fRmQnoW1aDDAb44OwlfTAz3YjawIElv9AAZ/oj4Oo0oW/YhKWezzmFYAXN8z9R4y7gCyS15eMYabA7BP2QnoXntviCcZMUeoaMgLCHKhfdvs5pANfvV7qxjkdM888+bLpx/0Kxzl3P0Uojsxu+PTlSv8ADrrjjpLBWMfKrH57o85Qc6N6Pz3Iy97Jaw0jPGpQ0C0u5IRbDhvYU0Ew+jDUJ6haBp1Gq4SptQGDbpD1BrHyZKA/UPtjnDj7SFyoiwC+7LmBxw8uNgw4DMIFtajOJXG1T+zPHdgxgI5zTJLHnjWIpqWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzgr7bpIJTMFj71sA/0SU8S80mtKzwxpKnpasyc78eE=;
 b=P/EiWCB4oKjO/cZiu9qrsdwmO3rix1TN9zOGZOp3lDYGYeV4Yr3HRlS/6+XySVboJOjLZVdGDbeCEev2jgQ4HfbllkATAcGfN53A/WUh25A/8dYM0onbBdtSl6zxbV9reVoihh5yb/SO2KLP9HvizRDGM0Ddvu7+juvswdoOR3iK4JkHR0ygjW+4mp7G6PJlRPuA1H3f1Vm+ii/eJxkCIFaLj6JiCdkShxtQEP0LEL8S6G3iZLrjI3QXVlqIGHecxhYTRVpzy9L+AMoHO8eGMFCwxtFtswYLcpQ+HPTjN/FLmgDNX1Xkmy8bmJtuWhlkv8tUMBH3qc1IbG8agHoKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 11:47:11 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 11:47:11 +0000
Message-ID: <4837f541-d90c-fcd3-4024-73f3e719fe10@theobroma-systems.com>
Date: Thu, 4 Aug 2022 13:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "'Yann E.MORIN'" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220803165240.BEDEB86D85@busybox.osuosl.org>
 <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35513c5a-c8a2-432c-abb0-08da760f111b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6979:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/VPYJ0q9hx3UpcVzuA7IaTnOw0p/4B1Wqjg8c2Zb0KWZXRFoWoRyoUiz6vPnrwaYCFjTlblDXAu3B7hiFXHBp5nAOZMhdVey9o5Cjm+O3eGlEsd5gFylinjp8vtdS7qk+OUxgRw6ylAC4mr/ulHDDA4it4G2cm+2NbvtKpQ2DoZzJSRDhsS8dpURGwIsKBDW8wwLBzX+PP4CmO75r61pOKR8ckYMOFoTfyabxv/kKO1/YGLsSbnd92lUyeawo/Rqc7FoPitKRkUHIhusa/+NbP9IIEALjy5o67QMP5gTm5z0mwChJye7XV46OTqew+HsccRTGMzEpbAufDZWHwSEQe+wCfhDT/+jkdHm+OkAHyvJoiOgHWDh5jUJB+nVWtnVbCv3JPLFfMLB2bC+sfINxdDwH7zmCR6uDbMCkNj+Q1SeI7gqJ3YUs1QPeAkVQcO4bJRFA1KY1Ebg4DnkUsdPnLEIhhVsVW7VavAadBNJX4UznMYRFaiw+bekWmdzdVh78eiIRfo0znsam+LVCk17fYLaMF2wHoGkI2YtkhH9/FQbXWYxe9rT1knc98lRJJ0d5c6LHuTqrktNuOgrv5U32qZhGVHkViD+l4yOtphkW42EnmMswYpykmOwbBS5ylZM3uuPJxAx/iUTvoIuF+WTAyTnhuznv3UqMWTIR8K70RROpzj6qW24vhXDL5AJf3En1R4VrxFfGTqXg4uGAedRkst1+2JuBG4lGNrpxoTgNPELQdBmzX5Y44Yu6WYW81t2Z8WuLCky+T7R8aZb7eVPL00isypK2x8KtiikWvVKins4v2okJNdLCzsxzKG7esX8dXFjcpiQG51yjUwmxWmnFRb9Z3AdFNjJou4ODtlchaXsMowQSffEW05ka9AM0uNofcTFz2wsMLgHrDVNmgatVdmJwzmHEL6EtV2lAu42BA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(39850400004)(366004)(8936002)(966005)(86362001)(6486002)(5660300002)(31696002)(186003)(36756003)(478600001)(83380400001)(31686004)(2616005)(110136005)(44832011)(316002)(6506007)(6512007)(26005)(53546011)(41300700001)(2906002)(8676002)(38100700002)(66476007)(66556008)(66946007)(45980500001)(15866825006)(43740500002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVg3Y1Q3d2FONDU4ZnBSWno1WHpNZ1gzQzRnMG15RUd5OTEzeGNGMFZRem5v?=
 =?utf-8?B?ZC9DaHVjSjhmM09ZSHRFY3U5N0xEdWkzKzJDKzdtL1orbng4NCtkTkwyMHNF?=
 =?utf-8?B?MW5vYi9nMUxUTEFKdXE5UktQSmhDUGJOajJ6UWtiZ3lKWC84UnRxLzVvb1F4?=
 =?utf-8?B?enlpMDM0cWZZWGgva2ZpblpSWXh2a0RTOHFkZFVuV1lTYlhESlY2TFlrTGMw?=
 =?utf-8?B?Qjd0eVRqWmsvcXI0dXpsajArK0kvUmlWU2VSb2kvdGF1eTJ0U3g0Ym9nUlFt?=
 =?utf-8?B?aFFXR3N3bTlnT2JTNkxIWmFYUUNTa3RBbFNTTmdQaTVVZ2VZNklVR0JvZFpU?=
 =?utf-8?B?RW9CU09IeGdxRnNQVjRGUlN4NVBtSzFiK0kvNFd3T3dFK3hGa0J5MjZJQjYz?=
 =?utf-8?B?Lzg3R2Y1a2lCblJvWm9BL0d0TEJlTXJpNmliL1FPalNocEFvUm54VVhUdC95?=
 =?utf-8?B?VURaNWViY2REZXBrckM5bUZVYm9zVE1zUE8vU0pTRlJ1Ykc1SmN6Zkc3U1Zq?=
 =?utf-8?B?ZVEzTUpseG8yNXZpN1NNNThXU3d3VU95NlhqMUpwMFFLRmdYRkxZMDJWdjA0?=
 =?utf-8?B?M2JraEtLNEVDczZYUDRIbWpqN3RodloxWXBhZmh5bTNmb1lmSkVxbW0wKyt1?=
 =?utf-8?B?cE4za1NiWUVSREpsNTBOcEFMRE1hZytaQmdyMUhtMDlmWW9qLytRU3prdU1v?=
 =?utf-8?B?Tmc4SjJudjNvQWpqZTA3amRCUk9udkNJV1RVSWhXd1N4K0l5VkN1VEpDMjdO?=
 =?utf-8?B?dk1Od052MllEM1JiYmRSYVV3UnFRVmJUVVRTSEFpZmsxL2l2WUU1K0FlUkVE?=
 =?utf-8?B?Q1l5N2dQZXFkRjBtVDNMd0kvSmsxT0xsZ29hK2VCcFM0cUcxaGtnNFg5d01N?=
 =?utf-8?B?MnF6c001dERNYlgyWGFsUFQ5OFRhcDRuWmlwL3pHeWE0ak9vSXZSM2lsalJI?=
 =?utf-8?B?bzZRTTlLeVB4RWQrRUxNSFhhK0traHZkM0hhWDZRZHNDOGx2UmhCK0piSktr?=
 =?utf-8?B?bDlwNmYxRE1mS2lRejllckd6ai83ZDU1S2xJQnB4Wk12b29LWUpNdHdLMmJm?=
 =?utf-8?B?K282OUpNSzdqbzRqZXA3NzNvNi9kZ1lzbEJoeHlvTnpFZmU2SFEwalMycWZX?=
 =?utf-8?B?WDVIdDdRUnE4NmFmWjBUZElXWTJMZkszNEM2OVIxUWx2bldRV0ttNE11WFpJ?=
 =?utf-8?B?QXhMQzBDeWNFSlovZTZrQUZ0U3c4S3ZqMWwvTU80Z0RLVERxb1lId1M3WURB?=
 =?utf-8?B?Tm1JV3BxTDh5NktlMGJyelNmLzc4Rk5vODNHR0wzOVNBdzg3RURnQmY4ZWRm?=
 =?utf-8?B?eGNiYTZKNXFuYzdjcmlCZHFVemdOL1ZrMnBQb0k4QVMwMTQ1bEtHcTFVUEJa?=
 =?utf-8?B?N3hLVnZNNmFPZ1dpRXNjYUpQN3R0aXp6Q1Zqd1UvRzVBQlZKZk9zWWwzVmZ1?=
 =?utf-8?B?eVVwbmZ3UEhLWEtFTXJNWGRja2VzbnUyTm14bys1S1JZdEJLZTFXUkVaTmZ1?=
 =?utf-8?B?dXkwZGVGR3BxOUVCdklRQjI2b0dXeWdxalR2Y3pJU3dPYS83L3JIM3RUZy9T?=
 =?utf-8?B?dUpSc2RRTWF0VEVEQzlBYVhqNGliNFJwdFdGdVFSdUpIMFMvRGVoOEc1dDdF?=
 =?utf-8?B?MzNoRFNtV2NZU3g4bWEwNE5aSFFSSGhndHFiR094d001aU5VcUxmemdSY05v?=
 =?utf-8?B?U1ZLbFErTlJoNlUwZUFaeEg0dERPdnpnRis4UG0wOWpQK2l0b3UxL1RXQldz?=
 =?utf-8?B?cVBUS2FCU2gwYy80ZTZDbjJkTGlqZUxJWjBYTzZZS3FleklMQldiTlRoRldG?=
 =?utf-8?B?S2RCYlJTVUpFdlB6WERyc01saGV5QWJ2alVPQUIrN3dKVE54Zkh4a0dWQmg0?=
 =?utf-8?B?TU9FQWZhOHJCaHB4eFN5NVNGRTAyVTRYdktvaENpK1g4VkhwUk1VazNHbnF4?=
 =?utf-8?B?NW5ndFgreHRvU2wrbGlxam5LZTkrM1BUc0xiOExTcEk1U3hyVEduM0xXNm9n?=
 =?utf-8?B?a01MSTg4WUduVENaMEc3cGlrbUtjMVhrNTNFK0owZ3YvSENocjQydjZLSUhi?=
 =?utf-8?B?aThVOGIrL3o2d2swTnQ2OWRNS25MS2JsVUhUUEdORkdZaUI1QXp0SDBWY2pw?=
 =?utf-8?B?SHJyUExLUExJaldJRTBraElFNDZTQ09KR1FqdWtCNTR0RUhaZngrdGdtS0Jq?=
 =?utf-8?Q?sRnpfrUq1aMJEr7rr8349F0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35513c5a-c8a2-432c-abb0-08da760f111b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 11:47:11.1678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P89IYt5uvgScWpI0dJNjLOfP9u11TBxyfWj91+XWW//pD+TCcoDM0a6NoW+sdTmEs63CT7/rqThuLaFcI70eBF3LMNMEnLoZ/DCTf1XV5a6Gy4LtJeZ3MO46vUs73WLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzgr7bpIJTMFj71sA/0SU8S80mtKzwxpKnpasyc78eE=;
 b=KOF9w2fsninXfsW72zuNMXoO+AK97+oIweE3BpV0NdjtWU2l8Y0wNqrrO5BAlAS7ScWZRp2M/afGac55FJy6MDXyUC0WKRBOQDxV2x45emU0lgnru/SSypty/03qyatkMned+6NwVeQsMIuxOTtzdvZnh4OlI1Zu14dvFSfXCdA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=KOF9w2fs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [git commit] Makefile: error out printvars target
 when VARS is empty or unset
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

Hi David,

On 8/4/22 10:00, David Laight wrote:
> From: Yann E.MORIN
>> Sent: 03 August 2022 18:05
>>
>> printvars returns nothing when VARS is not passed or empty. This is done
>> on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
>> anything when VARS is not set").
>>
>> An error message making explicit what is required from the user in order
>> to use printvars is however better than silently doing nothing.
>>
>> This adds a check for a non-empty VARS variable.
>>
>> Cc: Quentin Schulz <foss+buildroot@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>> ---
>>   Makefile | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 07b594ea8a..5f266e36b2 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1058,6 +1058,10 @@ endif
>>   # to workaround a bug in make 4.3; see https://urldefense.proofpoint.com/v2/url?u=https-3A__savannah.gnu.org_bugs_-3F59093&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=SdXTI_Lnrlv8g37eaCOuHTTozD5N4MfRMymHIsH0uaXJNHhpXLD6usuW5wCzWOeB&s=tp47StqVcL_LvVcxMDmq9Ve_u_dCALifZVz-Mnuyo8s&e=
>>   .PHONY: printvars
>>   printvars:
>> +ifndef VARS
>> +	@echo "Please pass a non-empty VARS to 'make printvars'"
> 
> Shouldn't that have a >&2 ??
> 

Makes sense. Maybe we should also prefix it with ERROR: like there: 
https://git.busybox.net/buildroot/tree/Makefile#n880
?

Could you please send a patch?

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
