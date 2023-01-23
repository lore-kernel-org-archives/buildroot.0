Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2FC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 13:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 823734037E;
	Mon, 23 Jan 2023 13:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 823734037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ug0CxGqV6Xda; Mon, 23 Jan 2023 13:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7F0340472;
	Mon, 23 Jan 2023 13:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F0340472
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7429B1BF359
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F5CA81EFF
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5CA81EFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2v41LEM6vYQb for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 13:26:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B158100D
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B158100D
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 13:26:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpKs2GFHwdVBLjMhykNGosWvcjDp4pTwzAKaa9JMhDnc/hLoDXGmJEsqmpZt4mal0/EK6rGf9zk2LUXlotX1mAFRTv9jfIe+GD+FrR24KJk/yQdF9AGYbzHkVZDDWv4JUzcMK0QMSH+TRz1pZj9KCkvKQctMpqa5bQapnP9htb4yeyw88kOr5CZWqE+UCJBZMjWhHNaPwq54465VgEkQga3BI9YJNdefwphi3AJ/MuuZy81wWJysojJMi42qORKH/Eehccw9VvpFZrHlGbSqTKmpXdHdQGEGmFfp61d+194ov8Yy2swWwjaL0SKuQ3zDhJNRvx2rGH0DZ6lpfscBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcY5GOu7ZbRXUfCkzvVFo645k5WKxDX7BwxUlgxcX6o=;
 b=AG5LHek3YrMXIODOsee3esvb09IdLAAxBtcSBeIjul4H4zaQzVp1ghB9kDp+0HIeysOcoBjq/3b0igJ9MDRsplPY+/4oUmpzS3zWfL2r4HQl8qzYja5TH5kfax5DzZRXBiqe+RCgrvGqYbokVF/t1JS6KLPFp/CayYHxj1SfM5XkAX+/J7osL+72tzCYK/XJyiH5n++gEhczOb5oL8uTuybSRy1raKNdUGzVVQMkcW3y35+XD4Io3lEyNPXvFCXklUd8onkiu/3/3GeXLsA6GMJPEgk9DCN74pw34FT8iX4A+oNjJNtNBI9JkP3ABfMB+TkS+QVvcnxcuH6CsiEkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:25:54 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:25:54 +0000
Message-ID: <4f8c8871-d5cb-ccba-4e15-693f9c9f0a50@theobroma-systems.com>
Date: Mon, 23 Jan 2023 14:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Semkowicz <dse@thaumatec.com>, buildroot@buildroot.org
References: <20230119143408.1911081-1-dse@thaumatec.com>
 <0c911dfb-083b-f5f0-c165-a665fc92006f@theobroma-systems.com>
 <167447511035.42371.11532947092483800306@Monstersaurus>
In-Reply-To: <167447511035.42371.11532947092483800306@Monstersaurus>
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 132e4245-fe71-4e22-4a42-08dafd455ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LsvhaUV5iBP/l8tB/Jk+IZUjKElQYj69YU3kCk6AXn1Saaba0tqfdcp+0ZIqg2XhI8G+LimgzFU0PLpx2lmdJim3Ee6yUbGvAZh4l53tNf15CUVSuhAAPb2Ls+BdR3f4hiGqeBigPb515kJh1ipSOzqasN1Sev8mYytrOGX48hA1ZA4Rt1gd5VlzJywurvoembZwwenU7jXxHzqqrzLNEKfoeKhONvxbwV0BZM6RsO6X43Z8Lhm6b3jR+qer1juRQqXNIvg+S4tK8pCuf6chAEVJE8FMG6bO1FX6ViTxn0X1IDVg1vBvcqRJa9Fg+3IqRFQZPnzTi18b1nrbknGn0CN3l8Suuq1xFpIA6bkH8ss7TaPgcKFn+qlWEMQJd4cV0I4IBdkEaNp+8WmpsxXUWhhHV5DeQzWwDAjdmcKZ7YUjcRQz1AwPWranc0KivxzC8LCmMJYwrw9D6cHLMd4SOld0Y6X1xbHqinNm7NbVyaGY3xR9JQbrH0A9PI0aXO703qMFKt3aITM+R8CUs/n7ZZGktI8tVom11fOCYdn6Po4GrjlSv0BRuwAVE1YoUMUWThh8s9NUjvMO+GFa8rRvGQN+9vv1jqKGysDNOCIyZln792vtBo3yZLud6/s9ZyASimRsaNWVbmmVu9JBYGs0NYgYBNWAi5oKn2kJHbP203mx6O8ZlbmFSytvQsyWPf6DzW5pQli7zzR4RzWe8rckbltTu2vxUpZahQnzNXjHR2sGPv5mftDlENjDN3e70SRRb9Fr511GSEYGCNZhYRTbKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(83380400001)(38100700002)(31696002)(41300700001)(86362001)(44832011)(2906002)(8936002)(5660300002)(4326008)(8676002)(26005)(53546011)(186003)(6512007)(6506007)(66476007)(316002)(66946007)(2616005)(66556008)(478600001)(110136005)(966005)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9lNGgyZ1FPN0RmeWRKY0pVdFhIUnFCdnFDZm83dGtBLzNoRGVtTHNZVVFV?=
 =?utf-8?B?N2lhYWk3bkhXcmhKd1NuSE1zekMxNk9xNm1Rem9QMWtmVUNnaVl0V1RYR2x3?=
 =?utf-8?B?UXpxOTVKanFEZkE5Q3FXVFFSYjJPL3RpY00zbWw1Slp6Z0g4OHNYUzR1RG5w?=
 =?utf-8?B?dmRWQWwzK0J4MjR1NUVlWHdEYWsyNHRuYWR3ek9TNklmSFBJQUVvbHhiRmhz?=
 =?utf-8?B?MGR4Um1Hcm01ZlQ4VmY5Q2FGN2xQblpSaDZ4ZGNSREFGYXdZS3M5ZlNDOXMr?=
 =?utf-8?B?ZXA1aERSdjlNVWNQL0VaYzMxU3FCdW5VdFVVVlZubWIrdjE4VkJTa0hMS0xr?=
 =?utf-8?B?d2JMSnl6clorc0NSdnNweW5xNEc5eC9LQnQ4UTZMa29lRlljalFHSFBUZy8z?=
 =?utf-8?B?RDJnTjRieUZMRnNlbERQNFJKMm50b2N1NkhLMXVKR2JJVjhMMmJramh1K0hZ?=
 =?utf-8?B?bUIyRTZteEZET3oxY1N3QTF6M3lpWkU0VEw5VlhjVjRBSmVwWVEzcFB4dldB?=
 =?utf-8?B?WHNLUGQrQUsxTWpVY0lHZ3JzbXU3cmZUak43TjducWZCd3cvUU1sRS9ucWNI?=
 =?utf-8?B?ZVNtWFRJRFlCTkxNWG5UL1hYd3JkOEh5ZkdrNTBya25wN0xkamw4QVIyaEFG?=
 =?utf-8?B?aFFyZHlPZEg0U3JvNFBiMkRPUXBGWVNwTHZMYStydVQzUnJUeE9ZUldrODRQ?=
 =?utf-8?B?TzhHVkN5YktBWGhsYmFjV1RjeWtnemxCSU04RjhtRml5ckNjNy9FK2xtU3cz?=
 =?utf-8?B?c2ZqVkJrNElwNjJqU3kybjBySlJJeXRVcTR0UnRSZWxNY3Y3bGpmVzF4WjhO?=
 =?utf-8?B?TW9aWnYrZEV0dlBWTjFuNmdSclVHRVovekN2WmRCYzNjYU9NbE8rN1hzYTFs?=
 =?utf-8?B?Y0JOTTlWdHUzZlZsenEwL3dON2pHNUpFZkZpbGVoS2pHWFlMeE1sclpuaUtv?=
 =?utf-8?B?ck9hMlY5Mkljc0o3OGJ4TGJaQWQvN1hhTDd4WWNRZWxhV0hjU05nemlIMlVi?=
 =?utf-8?B?eU43a1BWdTB3SHNsTUtxZHhoMlR5aU94QnY0YlJyTUFjQUkyL3ZhQVQ4M2pt?=
 =?utf-8?B?RHg3QVdmK0dmQkdFekRudUdkVmNZNmJZRmQ2K1JEZXFTblhPN2xTSWhGd3dh?=
 =?utf-8?B?VWhMaGZ4d0VTZC9DUE13dUE0MWRCMU92eG1tc0FLMnNpRkpGYXBYZ3hiSUl4?=
 =?utf-8?B?eGpsL2VRY1dwMEIzQ0FNNW9YWXhyS3lqU253SmczcXN1VVozSVRzWGxiRXZC?=
 =?utf-8?B?UWtiWEFWeU9PMEcySm5tT3RCT2gvMHlIalpoK2piV0hqeFcyUUZtT09PWmJF?=
 =?utf-8?B?bDJKeldMWDlrOXhPZ3dHK2o3UjdWU1oydUdYU21yS1hidkR5SDNuWVpJbVcz?=
 =?utf-8?B?Zy9UMXEwN1hXQW5zYUJqTjdreUtMdGhJZ28rTEkwQkNRSnBwYUVoTFpnS1NG?=
 =?utf-8?B?NVNaSmxwWVdyWklrenVtdFhQUWJPSmVIUmZRbnlrbkJXako0MUl3UlM5NXJv?=
 =?utf-8?B?bjNqYk02ako4REp5cHM1TkorVjF2eThuYk5ibnhLaG9tUnpydzhsdjQ2QURG?=
 =?utf-8?B?bEJyejl5Z1JZMDJCSXMzUTB6b2MybncvNHJUeEdDWnNhcS9PVXp1Y2o0dGFY?=
 =?utf-8?B?UUk5UmVLR1pXWXZhRmVnVUJLR0Ftd3ZIZG13WTI5N3AxdnFDbDl1VDZQOWtz?=
 =?utf-8?B?UjBPZGtQb0xQVHRqMmJhalI3WXNrRGQ1Rmd4L1Q5NUFFREl0WkM2M2xkdWQw?=
 =?utf-8?B?WEl0QVorMGdVTHlnVDRuVFQ3TW5ockkzTTRrL2w1WmczaVhVS1JJdTZ5VXpU?=
 =?utf-8?B?eDZwNDR4NEx3M0tFNGMzT2RUanlWZFpZTnFPdzhrOWxENGtjQ0ZBd3NicE9B?=
 =?utf-8?B?UXo1QWt1akVWZjRVSTZVS292a0ZEclNKRnZ2WWtuMlZheHFwcTM0cTdZVC9v?=
 =?utf-8?B?a3VNQ3owM0s3M1dIdXpTNTVQU3N0bUl4b0h6WkhjdmhudFQwZGdtV2lXWWRV?=
 =?utf-8?B?aVNVbHpXZmt2bzZYaldQNXczcUhuNXdjWStDMFdxb1duMkQ4aWJ3S1pBZEpy?=
 =?utf-8?B?VkVUQkpGZjNxbVBlcDlvRWFPNjMyQ3BCSkVpK1VBb2JLMUJVUEkzU0tJYzhV?=
 =?utf-8?B?ZiszR2VMUy83QWI4ck83bXRkMHIwMGZuTjhwMkxHeWZPOGhsaUxVOU9qY3ha?=
 =?utf-8?Q?Mwl2FxbzQLAHv8VsFCAtt40=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132e4245-fe71-4e22-4a42-08dafd455ab0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:25:54.3978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+SrftohXc6LImcD9YuxOQqdtztffkwKrw9dPLfTls2Hj3ri9cn+eIhoeXQ7fVth6NXnI9cw4Tdo0rvuN+lpb4ct9smJJccKQ8zeyi3vV7BlUEcZS/0C/IF9QWMbsKjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcY5GOu7ZbRXUfCkzvVFo645k5WKxDX7BwxUlgxcX6o=;
 b=RY+9D+kdTPXjafLuDZoGdH8fDcFiopToYi/2SWPQd5YlF8nonN7P1o7UdBp/4YzHkAPCYsBQXHQS4mByOS6+vd5pPsLPMyzt7O28DD2ERIuKevzfWtxjTcmfaGBb3plGwdk+BYmVPOqZvSnEaapbxn8Tz5fFk/aVoLWKGlIJeSGnDdoJ0vfyuHd1rT0Sq4+yCY6D5INfAVlwl9aAj7p69YBNtH0imoc7ipG3EOQK0X7wdPzNorwzLaWn2ECH10z/S2MGeD+oL95jtSzivMVlvUhnE2BYS+G2duBKftTpIleoZMiDx/MCSDgeSV9lsLckYpmyC3Vw1a3SDv8FFaxGmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=RY+9D+kd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] package/libcamera: Bump to version 0.0.3
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
Cc: marcus.folkesson@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kieran,

On 1/23/23 12:58, Kieran Bingham wrote:
> Quoting Quentin Schulz via buildroot (2023-01-23 10:57:16)
>> Hi Daniel,
>>
>> On 1/19/23 15:34, Daniel Semkowicz wrote:
>>> Libcamera recently started to version the software, so use the
>>> version tag instead of raw commit hash.
>>>
>>> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
>>> ---
>>>    package/libcamera/libcamera.hash | 2 +-
>>>    package/libcamera/libcamera.mk   | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
>>> index 68c9c1f005..033e318910 100644
>>> --- a/package/libcamera/libcamera.hash
>>> +++ b/package/libcamera/libcamera.hash
>>> @@ -1,4 +1,4 @@
>>> -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
>>> +sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
>>>    
>>>    # license files
>>>    sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
>>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>>> index 9c03d3a3b3..8979a43aca 100644
>>> --- a/package/libcamera/libcamera.mk
>>> +++ b/package/libcamera/libcamera.mk
>>> @@ -5,7 +5,7 @@
>>>    ################################################################################
>>>    
>>>    LIBCAMERA_SITE = https://urldefense.com/v3/__https://git.linuxtv.org/libcamera.git__;!!OOPJP91ZZw!gtcDP1maf3PoJO88myqzbBZyOhNYHg7g4jGwno19jy5tFEHRgUuyBqm2zECw5wQOF6S4k8pRivumP5qJXTknCnAEvbE$
>>> -LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
>>> +LIBCAMERA_VERSION = v0.0.3
>>
>> I would actually advocate against using git tags, they are not
>> guaranteed to be stable over time (one can remove or move a tag), as
>> opposed to a git hash which is guaranteed to be.
>>
>> Can you use the commit hash please?
> 
> Tags seem more convenient to me! - If you're not going to use the tag
> points, why am I bothering to make tagged releases? I could go back to
> just saying 'always use master as the latest release' if SHA1's are the
> release point.
> 

git tags aren't necessarily related to software releases, they just 
happen to be. You could very well have releases without git tags though 
that makes it quite difficult to know when a new release is out or to 
know which commit exactly is a "release".

Just FYI, git tags are not allowed in Yocto officially maintained 
layers. This has something to do with Yocto enforcing tag re-fetching, 
thus requiring network access, breaking the ability to build offline.

> While, yes - tags can be deleted. I expect that any signed-by-me tag (or
> any other future libcamera release maintainer) is the correct tag for
> that release point. I would not expect to delete any tag once pushed to
> a public host.
> 

Expectations vs reality. People do all kinds of weird stuff. I was not 
specifically talking about tag deletion but tag being moved. git hashes 
aren't spared the deletion issue either (e.g. force-push to the git 
branch). Considering I've seen this happen before, it's not an 
hypothesis (that was a proprietary downstream project though). While I 
appreciate with your experience with upstream projects you would know 
that moving tags is really a bad idea, I was merely just pointing out a 
pitfall of using git tags for builds that most people would like 
reproducible.

> 
>> @Kieran: do you have manually generated tarballs for versions somewhere
>> so we could use this instead of a git repo?
> 
> Do other projects honestly create manually generated tarballs?
> 

I was just asking if there was one already available. I was not 
requesting one :)

> As in ... does the maintainer create a .tgz and scp it somewhere or some
> such?
> 
> I would expect this can all be handled by git... - in particular, IMO -
> the signed tags I push are what I expect to be possible to validate and
> verify. Is it that the core issue here is that cgit isn't providing a
> tarball?  (while Github does?)
> 

Buildroot validates the sources it gets anyways with the hash. So moving 
the tag will break the builds on systems where the repo is not already 
in cache in BR2_DL_DIR.

Yocto has a strict requirement on automatically generated tarballs, 
GitHub being one the tools generating them. Try to contribute a package 
using GitHub archives/releases and I can guarantee you one of the first 
comments you'll receive is that they don't want it, use git hashes 
instead. Now, I see that Buildroot does not have the same restriction 
since the github function is used to fetch releases. c.f. `git grep -A1 
-B1 "_SITE.*github" | grep "tar\.` for a list of impacted packages, and 
https://git.busybox.net/buildroot/tree/package/pkg-download.mk#n63 for 
the implementation.

AFAIR, it has to do with tarballs sometimes being recreated in the 
future and, depending on the tool being used by GitHub or whatever, the 
checksum changes (e.g. tarball creation date somewhere in the headers, 
tarball tool version number in there, you name it, ...), breaking old 
trees/projects.

The issue in Buildroot is that the tag won't be re-fetched (while 
re-fetching is enforced in Yocto for example), so you might have two PCs 
building different git hashes because someone moved the tag upstream in 
-between builds, c.f. the docs:
"""
      due to local caching, Buildroot will not re-fetch the repository, 
so people who expect to be able to follow the remote repository would be 
quite surprised and disappointed;
     because two builds can never be perfectly simultaneous, and because 
the remote repository may get new commits on the branch anytime, two 
users, using the same Buildroot tree and building the same 
configuration, may get different source, thus rendering the build non 
reproducible, and people would be quite surprised and disappointed.
"""

The first mail was just out-of-habit with what usually happens when 
reviewing recipe patches on the Yocto ML. I understand that Buildroot 
works differently and git tags may be enough for you/Buildroot maintainers.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
