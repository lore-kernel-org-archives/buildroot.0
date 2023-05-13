Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC91C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 21:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD3F42A5D;
	Sat, 13 May 2023 21:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD3F42A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffNFCP8K-vEG; Sat, 13 May 2023 21:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB73429FB;
	Sat, 13 May 2023 21:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB73429FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3DE1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 21:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D53A384144
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 21:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53A384144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCvPwX3AokBI for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 21:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A3B84134
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::715])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2A3B84134
 for <buildroot@buildroot.org>; Sat, 13 May 2023 21:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMrWMZ+XXEldbNxEm4//meKHOvLImNe/3lOlCMz01US2zGuqcNewbvE6hH/H+lJWeEbWfVruaABo4xp8D+Rtni8YSxKcV7pWYDyW/9veM36AIhmxpu7aGHdQN1zFL4jZ/AsCxhI/cKkkUJvpOVBUPUiYK1gP8OKY/y1yyBY9NY12JelgdwpFxjZs06/ZaEBVOfvQoXP8j2grs9F/2wedDGr7HDLPbA/ankFui58kUJV0t5LhIv8xdWURmJFeoG6W1RXCKjaLkFp8pTz6uZ7+VRXwt6C6d+h+g2Beh2v54DbvXqD49Zw7tWRdhXFuj2hESxyauKcNslKlzEL9F/V2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUAo+ohuDKhnXj+3qthg/6xNYEzBpg1OaKa7kfBwkbM=;
 b=g5c7ihzusrK4XswjH3coBRpdYaChO+iD+SLD9sm8gEoPVywjre2oZY+6uxvbu8AEq1Um+qvdm978/yOawC+7E/EvkpthkV/6g4OnZN29h6qD7di4tCchO0ZneUUAx9wF/pDM+pm5z49GM+ostJVx9ftGZPX3hhtK9ydujahpCMxmhaa4xB7KvzW78pjy25v2uVmZLAnPCdi5/4uTSurTbntcxD5sbKu7ns3NZ3okvcgC2nrNRUbppu0DA0LUu4i+8S5vz5EKZWzXFi935dzPcfTmujmFalQq0fsG9LwCEeWY1io2q0y/RPSYWyoNw+0Zl5KEAVStPmiEMD3Wkqqd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by SJ0PR17MB5722.namprd17.prod.outlook.com (2603:10b6:a03:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.27; Sat, 13 May
 2023 21:02:09 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::98aa:7dad:512b:a26a]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::98aa:7dad:512b:a26a%3]) with mapi id 15.20.6387.027; Sat, 13 May 2023
 21:02:09 +0000
Message-ID: <ecad327f-f5d6-fb3d-f676-9d95f9e4afd8@phobosdpl.com>
Date: Sat, 13 May 2023 16:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Juan Carrano <juan.carrano@ebee.berlin>
From: Sen Hastings <sen@phobosdpl.com>
X-ClientProxiedBy: SN7PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:806:f2::33) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR17MB3515:EE_|SJ0PR17MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: a11fb910-2e2e-4e50-1a0c-08db53f55117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NxO4OoyWVtf9tIkul3EOxzP4hsGH+RL7Sao3d2Xnfp719+2JJCms3oBmgnOTJBTQe/qSRh1yMKp+rHqHjoHtwRUVKZiOIEydtMDKLoXOjRdJabPZPMcAXBNitVU3DsHp0Mzb9AaIs0GELMhe0UT8xzDx0P1TFH6AjGOO6B6uGu5QeQlQN4KNAO+UqjHI3ydQ3yiY77yMdEHQcC2X28Np9PMI17kcN5la0Hyt3vHcOPrYxPWSpqGwGHHpUVG5gH2nTuS643D9VLgYJEQ7X3xaPCL8q7Rd7nOVNeJz9/xWvqKu2Q/FdweOM3+hk2nMoIHHzL7u1FcLXNRcbIjv2oUxPrWswxK/fiu3WbKfOAvV5ae8/hvEGnvn5vAzK8ykSbisB4sXjRSp+YCWS0+ErQz7/UfFx+zd9XO29j4/SL6ln14qFudaE1fObSoXBFFTQ1EoG2nqBF8Ea7K2akmSZkN9S4f0Pxey5415AICm1XUiBg3osbxcOWX44Yoj6noCGzjz++omtT+GCRp2P6DMVrz1vSTPLBxc6NvHuRw3kDmd9VKmvEoHQmmkjFw1BCoOqdpprLVRIEokTxLsPPriXnjvtDRyLECJesuvVrLqtn6TF1xuDEhe4CAvRIMpUwFLycM4/ckmMAWRG8N6k9yCsjG8Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39830400003)(136003)(346002)(376002)(366004)(451199021)(5660300002)(8936002)(8676002)(31696002)(2616005)(83380400001)(186003)(6506007)(6512007)(26005)(38100700002)(478600001)(6486002)(41300700001)(66946007)(86362001)(66556008)(316002)(66476007)(4326008)(6916009)(36756003)(84970400001)(31686004)(4744005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVN5Qm5JMnhqM1QwcDNZclQrcDhObHNGWWZlTDVvQldqZ1JneTlUL1ZOenVO?=
 =?utf-8?B?SWJzTmlYd0Nhem1tbHFRVm5tcnFMNGVYZlZqM0poR3d2cUw4OTNFRGpFMk5I?=
 =?utf-8?B?QktDRGpyRk45M2lqWDhxL2lUeXJobTZ0VUQ5Q1VpajV1aDl5WkhNdlJiQ2Q4?=
 =?utf-8?B?SWV2MUlOeHRoQjgwVlhweDQrUFR3TXVXM0NYUyszcmhzbmxWYnlsZGlOYVRr?=
 =?utf-8?B?NWdNeWxyMklCSlNSbG5TOTFxWjBKQ2Q1NGpiZUlIVFI2WndjQWZZY2NzWXRW?=
 =?utf-8?B?TndoVzAwNVlvWkdPYzB2Z3k2L3BCQkVoZE5kOTQ1WjhLa2ZWeDVhSTJ5Qi9I?=
 =?utf-8?B?MVVLS2NpS01IN1Q3dHdYczJsWW1JZ3ZieWpyaGRBeHByZ0xlOE9MeVV0UVVw?=
 =?utf-8?B?WHdxUUdjWGN2UjN0Wk1VRHBMbU91V3VpYnNpamJwT1RPTnI5ZnIzTXlINVJC?=
 =?utf-8?B?eG9MWDNpTTVNUDN2R1hHUkJHRE8rbTNZVzdqenZlNEtleGU4N1ppdzhvcWFL?=
 =?utf-8?B?K3dQU0htNThERWJzUlliR3pUNVJhYjhKbHBIN0paOU1MWHYvVFJGNGxTeTZO?=
 =?utf-8?B?TGFLR2ZxZXV3YlpEZnJNeVZ4ZDRhcVBvTjN2czlRNWZQVHRoWjNrZEVPWGxI?=
 =?utf-8?B?azNTYW5KVEJULzFWWUprQjZ1b1BON2tqcGhwNmxNZTUrVE1IZXc4YWdyVXhy?=
 =?utf-8?B?d0RqZkhiYjZHdmJ2bTF6SUlnV0xyelRDb1pYQXJDalFmQmczWnMzTEFVWXZ1?=
 =?utf-8?B?c3Q2V0Fad2g2WHpvb05iYUFYUDljcWRjM3Zpc0NxZXRuUVFNaWJrREVUNG5B?=
 =?utf-8?B?a2hscEd1OTJkSDYxU1dwZUJraThVZW44NXhyT3VZR3QwalI5cno3T2pMN1Bj?=
 =?utf-8?B?MytsQVJ2K2J4ekxtdXNLSE44dGlDNTFzZFlzcHhwSGZ2V1IxTjVGcjVPV2FN?=
 =?utf-8?B?NWo0ZFpieUlOSGJDMDZJbFhURnJCbjJSMnQwbFdIL0taZjhVWlZodk9zZ2lw?=
 =?utf-8?B?ODZsZlMyUGRIYmJHM0hNVzBwUExnTEp3azJwRFNRNDZtbHpwU1A5NE9oN2Jq?=
 =?utf-8?B?dGRsSDZYbGgwWWczaDUwWlY1UW1LUUo2bEZWSUN6S0E5bjFLSEF0N1Nya1Fw?=
 =?utf-8?B?NXpsdFozU0RlOUp3UFg0RU1wL011ZTdRS3ZtZCtTOHJrQnZFR2syVFlGaWJ5?=
 =?utf-8?B?NHoyb2JGc2dEUlEraFAwRFZ0UkRUbjBFQTdabjhGandwTVplejVTcXZsRTRF?=
 =?utf-8?B?dThDSlFraGFqNHUrdVZDcjRiSGhER2Q4OUZWRFgxbmJGQk1qbFVzRjBOVldK?=
 =?utf-8?B?SlhsVmtCNFVnMzl6WnBhQnFneGRCeGNJR2k1RkF0TzhwOXRyWkxJQWZnRS96?=
 =?utf-8?B?S3RXclNWS3A1SnZtdzZxL0Z1MnVodS9hYWlpcElMS25DbTd5UjIxa0ZxZ2Vv?=
 =?utf-8?B?bmxNTjlibjBqalJVRU1obDZOUmtqSGRaaTIvNXAya2hnQXhvK3VCVUpOd21E?=
 =?utf-8?B?UllNb3JlZ29Mb3dOSHJ4MEJ2dGcvdFRTRUVVUnByUlYxM1VSKzJ2V1V4MTlS?=
 =?utf-8?B?RTNHQ21xWlkwUmN5TldHL2d0RmdEL2laRDhJcnVoZmhBa1o1NGFLNmJYSlRU?=
 =?utf-8?B?Yzh0bEg3RGVmZk5WSlpTK0xIRUVGNisxeHRZcGliRXlrOWVjUFMrL0JZRVo2?=
 =?utf-8?B?Y1lOMFdhQW9IK3FOdnFSMXBwamV1VW1mSHZ6Zy90eWRSU04vZ1JoSzlrNW5o?=
 =?utf-8?B?QnlHK25WNUR2dW5PZWJVbUdQcXZoU0ZnTEV0K09sb2o3WE8ybHllRDNpV05w?=
 =?utf-8?B?S2wzbmhuU2o4QmtRWWt1YUh3VVdZZXJhU0lqZXN5MkFBV3VtbUgxeGlud0U4?=
 =?utf-8?B?eDVKQis1QjlSRTNYVnl3K3FaYmFaZE1GeWZkcmpIQ1RGd085MW9OeDltdHVv?=
 =?utf-8?B?QncwcmVOOElFRHlEcW85MitmT0hmL3MxYmJ2TmFqY2ZNUGdGUCsyV1p2QU5R?=
 =?utf-8?B?dlZickQ5dVM5SDE1Ry9GMlc5YTdoWU9pYlFsKzFvcjlaRDcxNE1SNTJtQjBD?=
 =?utf-8?B?eDlwMHFDQ0lqYlNRNjducEtQZ29JekhWZnFvMHlCejZUVzdSTGJsSXp1dkVW?=
 =?utf-8?Q?hGEjOGaYhMIc2QTSGI7DgYWMK?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11fb910-2e2e-4e50-1a0c-08db53f55117
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2023 21:02:09.7570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8pzEoUb0yO+4RVczQI3pOz5rsTbSNTnJUf9yfJeWuq3Bv2g8Em30CHnjJZTbmVN8sOrHZFVZi3SVjLYflnFgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5722
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUAo+ohuDKhnXj+3qthg/6xNYEzBpg1OaKa7kfBwkbM=;
 b=YOxWGOO23z/44Qe3LuI9qcBH+6mxDJjse4kJYC0QxR0i+bYi4Nr1mWccScCHHpf1PgxM01qhTCIvNAb78P0PGsYi2QKhna1TQC2WINrVnH6gHuSMQYn+ac3a5KuYfOPmU3rCOLrNR4VCnfpqhgcS4pZeLXVlWfPPyePUKTQFFgw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=YOxWGOO2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH] support/pkg-stats: list packages from
 external trees.
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
Reply-To: CAH2v1Aq5otSg2h+gvz+XeZQ6ymDzNvMtvEqs7qnJ=CgBUaPeng@mail.gmail.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Juan Carrano wrote:
> Hi Sen,

Hello Juan,

> Here I attach an example. The main tree shows up as BR2, the external
> as DLMD_EXT.

Huh, that's weird.
The example html you provided appears to have been generated using a
much older version of pkg-stat that should be incompatible with the
patch you provided to the mailing list.

Could you please pull the latest version of pkg-stat from master, apply
your patch, run the script and provide that output?

Also, please put my email "to:" field, I only found this email because I
was digging through the lore.kernel.org/buildroot archive.

> By the way, we noticed that the pkg-stats script uses the old NVD
> format which will be deprecated by the end of this year. Are you aware
> of anyone working on fixing it? Otherwise a colleague here will
> attempt to update it.

Yikes! I was not aware of this. Patches would be appreciated. :>)

> Regards,

> Juan @ Ebee

Sincerely, Sen H.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
