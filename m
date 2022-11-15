Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29528C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 09:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE86B401DF;
	Tue, 15 Nov 2022 09:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE86B401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFKKfw5lBlD5; Tue, 15 Nov 2022 09:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B37CA401B1;
	Tue, 15 Nov 2022 09:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B37CA401B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 982861BF847
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 09:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 405A660ACD
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 09:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405A660ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgyjaQKU2z5F for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 09:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4DE260A8B
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4DE260A8B
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 09:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5t17G+3mr7m9BcVEOwJBDzQwNbIhaulveCDKT8vh6yagTl4e/P4zoUQ5uYjN9z0nAsayy0BrNAuxD9qmSK1POM/yhqYlTldDnUqlTLz11OgFeOHQeXy3vzNXUBMktBZxQUiXEaOFqfQbHq0ET1ZAAK0gTG4U6AZG5/VjjiFhQQMjBFA8qnL5KYtMCXBZXvVrcGTmwFILGcPAZKqHHT3RvRpr09RwAAuv1whziL6JnCTWyBfE+6ldhzBIPRkscEjjziqa42lM7gSw2olDRLx8bG5BMoC88n3Z3GGN6BB4a3Sbx10yvfLR+gjMTJYJ5OsWP2WvulOOAdc6iuw4hpVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgM9JjV8cAYx8pKQBPjadj7ftgSmhHaD4VTmWEotEF0=;
 b=lhPY5mOjryEhtbmAI2iY7s/vllWaRghT41a2NIp7tQpY13hpbTMw334Rg+xBR90/Tg6FseI+Tvo80PMJ+/1D7TBp3kPwtneRam5wpnPVp8ikgm5UdzXWB+IDzqFFqTW+9ugGTHQ9n0jnKtBl5PX1DdmG2nA+uuCk1tCzbgaEx1SUXb/ozaw2fbUIadhxDQkf2/zt5tecUQvnBmyROgwah8p/e7FaJ3LHLIKIopAu5ClKZQ4QftPB/1MAlZF1rjfhjOISMVZhBdhZU4LmickLYsqo6ekRCVfFFYOcpds+uVHenIKTkv3FnS3CFyc59a9bGSIyXIG0ioz0JMiA2fq+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8919.eurprd04.prod.outlook.com (2603:10a6:10:2e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Tue, 15 Nov
 2022 09:24:18 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 09:24:18 +0000
Message-ID: <15715b05-79a5-d542-2dcb-4c921c090463@theobroma-systems.com>
Date: Tue, 15 Nov 2022 10:24:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Victor Dumas' <dumasv.dev@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20221019124017.427199-1-dumasv.dev@gmail.com>
 <20221020115512.483686-1-dumasv.dev@gmail.com>
 <9d9a3bbf2cfd4f60b82a47087ef8ecba@AcuMS.aculab.com>
In-Reply-To: <9d9a3bbf2cfd4f60b82a47087ef8ecba@AcuMS.aculab.com>
X-ClientProxiedBy: PAZP264CA0102.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::6) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a52caf-e7da-4128-a6c6-08dac6eb2b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCcuHj3j8dpwtP+gb5Jmo27FNfwf5eI6y+zUA4/B4njE0Ou1X7oyUTtiGYcC6fHXjb5P0DZqlV+LtaWG8T0ngfeOlM5oKx8ElhNAp8PTUm9wA6BfAKDLp6ZN47Zl7xApkIJyZWlxOWUf3BBq4H/FPq1uuCz9GlxQUBjMl7T2ypXVFB/4a/2iiS9Y7LOZU+1a5N6jhMdfD6WzgQqUL3DzfNtmFas6Tij4Nknp26Ryd5XqUfgklq0l99Yil2uUZtLRslenKBnMv6lghYSy7uloDDwxmz8r0xu0mEUdLQTQBQ/TlcCOXyS5KlXSn0aRN1Sl4RRHZs4l9uS9XEHAEW18dMScfOOjsljU6Dip1Ufivd0tOvsAsdd85s/llzGwDjE38Eh9yg8K4P2CTHnpGXThHVX6TyCeK72ZxTErqXP1gbc0A7w//CgKaW4Pz8Z358V7GL7O4238Jh58Xtzs10yRoTb0PiNf1F94mjPrOtSQ0F2WPpJQmryop1INYBYkIQ+HTUFistNE2KLwEx9vS/o9q0Cr6cE65VbNDpDsiGnsY+L+Qq4zqeo/UlJRlad10LzWnBl0pCV4iBORkyRQB1fWbj+YiqFHmvA0QnAgrC0OFIYCuvR7+IuOF5vokgzE2DE6z00+G0yq+Oe7rxREz5F8xXyhV+bc8oURICja8TgaUdQeH7Fzy2fe7COYrjwa0AXcKVxl9GjCzw9+L+CgnceERWqavMfxGECDadKg/Ullq9NjDD8jtZ92l2Q9p5qx2uHwODkr19PKYE/5hdk3J54dFbVaTNPJG4nlTosv8Bvm4bIN3dZpMd1y8ls/cvVM3k3p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199015)(2906002)(83380400001)(31686004)(44832011)(8936002)(41300700001)(5660300002)(478600001)(86362001)(66476007)(316002)(66556008)(8676002)(66946007)(36756003)(31696002)(110136005)(966005)(6486002)(38100700002)(2616005)(186003)(26005)(6506007)(6666004)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZOaGJzS29LMDlvT0t5NHhuZHlheC9WSHZOa0ZHcVBOYUtHbENwTk5JM0VH?=
 =?utf-8?B?dUFQR1hjdlNFZHA2emVrZEhNTGVqMXQ4U0xZWG9XWDFpbGFqT053eWovR2xZ?=
 =?utf-8?B?VExyL2lWYUpWZWpmS1ZmVEZDTzFpbmtyTDgwZ3J4eXlub2pxVHAwR2dEbG5Q?=
 =?utf-8?B?cG1JSldNQzZSTjZpaFl6dlBFN01wbGdKNWdnanhNdlB6cEVYZlE2YzcyZ280?=
 =?utf-8?B?dW12Wkd6TGhSSWt2ODZzMVBCQ3F3eFoybU9JaUU0ZjBnZjlZYjE1MmhmTGhD?=
 =?utf-8?B?YTZBNHJsN1RrQ3NiN2E2VGhMKzkwTG9IVCtyZ2trRzlKUkVGZ1h4dm45NTJ6?=
 =?utf-8?B?c3NNRTZsSE0ranhiTUlBdkFjMGZ0QTFRVlh6RHlEUkdRcjRmTXR5aUFpT3VQ?=
 =?utf-8?B?NTdrekRZcnNmaTNhMy9PZmViQzFTVC9HckpFQkZGNWo0dENPb1Nmd29IWkpZ?=
 =?utf-8?B?bDBUU2g4ZWs1M2o2aC8vMmRWQkdnS0xXZ1JZK05SZ1JwNWdKaXpuYkNrKy9K?=
 =?utf-8?B?RVBtT0R4RHVPTVBPTXJpYkdhLzU3TnF2YmE4bmo4dkQxL3VxMTlSNmhiWG9o?=
 =?utf-8?B?c05GTWpYU1Z1UDBSRW5xZlVncGZSTW9KSWZSaitTS1pUQnh1aVNIb21lNUkz?=
 =?utf-8?B?UWdCUzhBTzE5QUVBYTM4N0t0dk16T2pvQk45aHFORFNzczVzTjBWUmtSOElU?=
 =?utf-8?B?TU1ET3ArU2YvVG1iZk1Pc1ozcE9nVjVZb2xMWkY1MU9mUkpsQmRYYUNlZjNh?=
 =?utf-8?B?Mk5CUFN6VU9vTEhibVp1TVV4M1J4UGJSazJzWEJDbTRmc05XUThFZ0VFbzdS?=
 =?utf-8?B?NnNNSlJtYUpIcWZyeldQblB3N2pPZmVCUTJKM2FvM3hLWFFIS3ZUcHR2UThR?=
 =?utf-8?B?R2VoUTZZRUNqZHRBQnluZy9WREo3aTFseW1INjNyTHNCbjZFUVc5M0ZPVWlO?=
 =?utf-8?B?a1dubjFOZUt1cm9YR25PWHBzcGE1Zi8rU2VoUldOMUtiSDR3L1NmbHdTNGJV?=
 =?utf-8?B?SlhrN3JRVTNscVhhdkN4elQ2L3RsQ2Z4dld5UjhUMVg0VWNGU0J2bmJ1NFps?=
 =?utf-8?B?dzltMlBDZVVsNHZ3SWNOMnMvS1Zhd0R1bUMwN3hHbGJxRHMzeGpLalR0a1BO?=
 =?utf-8?B?NW8ra2pmakVIejZacWwxQm9uenpZUWc2MVR0My9SclhvWHNMa2lvdVI1bEs0?=
 =?utf-8?B?dEU0K2s2R3lMQkIrUTMrQVV2MTBqeWpZRGVEMmQ2b3dtdjNxQm02K1dYL2RT?=
 =?utf-8?B?VDV1U0lEc3FwZUN0eVVjUGNDaVIvS0RUdTlxcVhjNHVtUFpScE9KamdWTU1D?=
 =?utf-8?B?QnhEbHFhQy8xTjl4MGtkOFcrd1gvSk54NkRqWno0b25JL2xaRFcrS0szU0k5?=
 =?utf-8?B?QTEvL0xpYTBMWHdPOXdIcGRJYjV1Y3BGb0YwL2w5RDAyTUplZ3JRVTNGc2J1?=
 =?utf-8?B?U0Vha0dIMisyZHdDdHVIZVJBNG5wd3NmalRZQjJPR29Ja3RxQjNheThBaTNv?=
 =?utf-8?B?ZzV3NENpSnROT0hNUlZDS01td1NlN3VVemRyczdaQ1YxQXBHcVRmMlVmQ0lx?=
 =?utf-8?B?ZjFGU3ltZkxIbXV3NFk1NUR0NGNHNkVpcjNiaXNVbE1DYUVmQS90QVp1UUZQ?=
 =?utf-8?B?ckR1QVFMaldYSlAwbC8raTVXN2s1b1BGUUJhYTU4T1ZScXRVdGFvQWRKbW5M?=
 =?utf-8?B?VDBPdmVBUHdvcjB6OFp6TnB6WVpPUUtYOFZYWUpDR3BubVVNSWlVcGRqQ3RR?=
 =?utf-8?B?NTgwR1IzU0xUR3pkMEI2V0E1SklyZWlraHVlV2FNNFB2Z1hEVzM2Ymh4ejFz?=
 =?utf-8?B?L1VFRnU4dWVPdVdrcDNSRlpHdDVjalJYRzRmVCtDME03UlZhbnV6eSt4RVd3?=
 =?utf-8?B?M3NqUW5UTFBkUE4xSEFJbDZNc1VjZVQ0K2k4N3d4b1IyWW5XbkY5bmlEdHpJ?=
 =?utf-8?B?K29MaUFtRFZUK1Y5OVlYR2Z6M2VKYVVzRk9sWTBTWDN0dUZXaWk0UlVhY2FU?=
 =?utf-8?B?Q2lXbTRGa2x1MmFVTlFzNmtjcmFEYXJyU3lNM3o0VUhqYVJZNW1mQlN4OXlG?=
 =?utf-8?B?QlhwOEJ3RUZ1WlNEUjZzSlAzYjRuL0NsTkZNOXNsWUMxUG9tOWd4ZXdKbUNa?=
 =?utf-8?B?MFp0ME43WmZnSmJLeWVoV2RMajJ0TUtPdFF3Tjg0QWpaV25NaVVQeGR6Qmww?=
 =?utf-8?Q?GWCixqw4u/FwYiNbyiSSlH0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a52caf-e7da-4128-a6c6-08dac6eb2b36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 09:24:18.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxuxfojJ00UnIPp23eNGS/mUSG7I1amuBXeuOXG15G5l+w3PjxzIxj5wzBHacvE0EdJ70bkNJ0YSN+jQ8qm38kvsf01w3+OdHXnh7yFOvcBNLUlSVL/gLge0uHHelkn9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgM9JjV8cAYx8pKQBPjadj7ftgSmhHaD4VTmWEotEF0=;
 b=ZmAWEq+91nXv2kDUBz+qvvRVgfKgh+DFERIvO7+yMZanUncWJ50ALt2V1jZ5XXBIfDJgdzNcB215EqrMJAk7HRyibCO1zR3YxJ+odnc9VTSsIyrS3gFFNQpaShFx1Lm48J59RCPz6k8YX/JIBNREcJFKLrDYW1+G25QElFI8llYBWtKrnasaakY69kmMHIKc6tNmizZi7w4ahqkTvxXc5mpOdZlonPOiLG5MJzJ5spvSIzY6NTKvm07x5QMdRpSyZ03JbUTW/6sDQioZc22MF7cFyFKGy7A8eXDWnL6QNHW1NWn2YM+coJCrHXxprtlYwBBg0Jy0ZL/KtsyfvCvCSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=ZmAWEq+9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi David,

On 11/15/22 09:47, David Laight wrote:
> From: Victor Dumas
>> Sent: 20 October 2022 12:55
>>
>> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized
>> This significantly reduces the amount of time it takes to fix all the paths.
>> On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core
>> machine
> ...
>> +    # Limit the number of cores used
>> +    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
>> +    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {} bash -c "patch_file
>> '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
> 
> Are you sure that all versions of xargs the script needs to
> run on support -P ?
> 

--max-procs was part of the initial commit of xargs in findutils in 
1996, c.f.:
https://git.savannah.gnu.org/cgit/findutils.git/commit/?id=c030b5ee33bbec3c93cddc3ca9ebec14c24dbe07

It is also supported in its initial commit in Busybox:
https://git.busybox.net/busybox/commit/?id=92a61c1206572f4a6e55baa24e7cdd4f180d4b64

The only question is about BSD support (since pkgs.org returns that all 
other distros are using find-utils/busybox basically) since they are 
using something else (toybox, heirloom, ...?).

Do we actually have a list of operating systems that are "officially" 
supported?

> Having xargs run 'bash -c "command" ...' and the quoting also looks odd.
> I presume there is some reason xargs can't just run patrch_file.
> 

IIRC, you can't call a shell function from xargs directly.

Cheers,
Quentin

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://urldefense.com/v3/__https://lists.buildroot.org/mailman/listinfo/buildroot__;!!OOPJP91ZZw!mrCuxJUbX9qAxmtZDc6047Tt9_CuDKxXgPQu86pqCMlg_9auvbbJCmj2U4UdX_OnaO0U9ecmUu0-uHnkJjFiEXoSX0FyA8U_YtvT0A$
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
