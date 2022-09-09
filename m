Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90BFECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 22:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8DF60BD4;
	Fri,  9 Sep 2022 22:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8DF60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8vW4YPOvfYX; Fri,  9 Sep 2022 22:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4E260AEC;
	Fri,  9 Sep 2022 22:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4E260AEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95FD41BF300
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 22:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70AFE40128
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 22:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70AFE40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N10mZ76cYQG2 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 22:21:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E550B400A6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2119.outbound.protection.outlook.com [40.107.223.119])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E550B400A6
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 22:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfqHUNIFbmedzOs/pZhhD4vI/2DK9k9ZrGC8WNBdBXo/VIYaLhanNdWaQari/FdO/02AkjcLpYzlz4MmoFta4gboW/5YlUobtTIAB85Mc4gYjYPx/ZpFBRPJLlsJetHUs7VhJcBhEJ7SHwG//VMs0sWsKCGC0R/o5g9Xo0jJqewShwgVAtFHDMpdfAVyLfq4giHDuJpHP+IEaokaYmEkYr6n/ZVB02oaR+YQUcc2LNLGqUdefXfGDjcfIiAH5txxsgTXM5judCBLd4p1thK/C4Hh4V4XFEi/Of9X/2/Dk4cb1LmcDrVxU1uTHb5SsdJh0pTGCPbcOQrqClO5x4g0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqhJG29R1YAx6L1+SGVzOrMY+zByM0sPIHPUcMtAnAs=;
 b=LS3MLakL7x1fvg8GHeA/q4286KcPamHKJ39lSsQ8qswgpvkq6e/bgGToDnYekoBzYLyAKy2PP8BPFUlvIy9v6NzChWAUJ0sZYvYEX6rfWgSq0xDdpt/4KvBI/ncn43nziZ/WNK33giVPRcVHRcz73uTlreDX86EOKl1FTVMyRj27LHhByGhFLa07cHIwa5aFJVZDGddxsrwGTmolZNwYMlTiACX6JO2ElWecIK45W2b4yaSwIKglgpwiBp6HKBZzvBloZQazWvleQFg4iNiN0c7eCnjfUOqDR8ixK5dQOwCE5lPB2ojniWpWeBMb9BpxxXXQIjq9c4UaDWeJh7APYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by SA1PR17MB5173.namprd17.prod.outlook.com (2603:10b6:806:1e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 22:21:34 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::2bbc:ce5d:a94a:68c1]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::2bbc:ce5d:a94a:68c1%6]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 22:21:34 +0000
Message-ID: <db619fc8-b861-21b7-562d-5590fa53cf05@phobosdpl.com>
Date: Fri, 9 Sep 2022 17:21:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Sen Hastings <sen@phobosdpl.com>
X-ClientProxiedBy: SA1P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::13) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR17MB3515:EE_|SA1PR17MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8f31ed-4122-41b6-2bf3-08da92b1a71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lU5OsKOynz+ADRlcsTTmpuoBmOuXLxiTtqRpmbfVmsaLJmz606aZ8QAjm+qhT1ikCq4LWRL608vjzOUzsuOhwEjnjA8Q7N/Xk2FWZt/LuKphKmwGb01l41kobPVzMh2g2llNgfByHiCZj1O+RfGbdAFcpfLBQSriisM3ZNToCPfsuabuXqaizNtF3c/pM+WB1H6J9cYi1vK9m9rSSlZPczSKY5X62u7nzpJOSZjv4+fy2jEwbx/y1fxjFf/r0IUUdGR1Erh6pGcGgmltzUjsvvQbFGG/yLYzxop43MNzUz+w9yzXuERW4Yzoyx+7YwYY72E7jev+/6ndl/cMHxOd/Jw4pgWLmoX3hJddjhxGF1EF0DU051dfWc1rCMLBV0Y36Pfxr+lwtEGsT5G63pdqVLFJAfYfjAdrE1Ij7PgDbH9q3GrDbelijiwzBCqYigx3VmM0y2bXa9K2OwCZeIkO9WNxiHJXs6Es/KeWnRvwVSO501WegCCKwKU9uOGmhYAqD0baLjb1TxCg3mn1xvuB8+nf2mpoTtPRqFr14x6y8h3KhFs72PaBOv5+63VMP8xkJqZqIV1Eaeqk98CGXGgEZD9jh/l0WPl0WVZxBk8ejB0uXrLSnWjMI+mEtjl5pSE0Z8NEHrbVyMZjLM/b8Ek4DSPiyvOljnx9OF+1E/yfLenYy2EVZo/TT1p66BcgXq6VJLM10n77tDRwougY+PNWzckQSS+26DxP6QOa0MN4zFVrULRPm9kE/+hBlMDoia/cxC6/LxgHm69dqykpfKeWaCK/HlJfHO1uTFehqJOjYFKHd+oiexSRIZ3G0YI68qrgOQFU4JbnEfaW6lwsGR2fYUOKZPmHydN3iZmT6yEa/zWIxt7NsjxWgDABNtO0G3RE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(39830400003)(136003)(346002)(86362001)(31696002)(4326008)(38350700002)(66556008)(8676002)(66946007)(5660300002)(6666004)(66476007)(38100700002)(4744005)(41300700001)(8936002)(6916009)(54906003)(478600001)(316002)(6486002)(966005)(6512007)(26005)(52116002)(6506007)(2906002)(2616005)(186003)(31686004)(36756003)(45980500001)(43740500002)(554374003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmlsaGJhUkNjOFNMa1RWTG13L0NaeHovWVhoWFM0bk94WmNJSzVFaXQ3OXhy?=
 =?utf-8?B?NUY5UWd2VnR4WmFxQTZoSThQeFNvTTN5WjY1bk0xN2w1VTBGK2FrOTZFZmZ3?=
 =?utf-8?B?akxDV3Z5N1pPZlZVVGRFb2toQUt1R0hLR2JMcVFSRWpqTW5TSExXWUc0UTdL?=
 =?utf-8?B?bUhEempjQy9rV2ZqODdHcWhsRUUwMHlDQ0pKeHduN3VhcXRmZlc3TXN2ZjlJ?=
 =?utf-8?B?VnRGNWdjcnhSckdUWjEwWUhiRzdvbENNT3QrQ2R4dHgvUEgzYWtveEpxdzRX?=
 =?utf-8?B?SjZOb1hGTGRZUTdZbndyN3I0QStlSy9SMTBNTmNqa3VGck0xbHdGdUdVcWJn?=
 =?utf-8?B?aG5jbTl2VXRFRG5XVlUrT1Q1MkVoeEhYczhnaTdMaTF1QWdFa0d5OFRmTzc0?=
 =?utf-8?B?Rkp5OHBhd2w2eWg1WThKcGc3ZTZuZDgyamt3MG5ZWDVmSFZHRVY1U1I5bk0r?=
 =?utf-8?B?NlczVUtPV1RlMnluZThrbTFCRTRlM2hUN2k5SlNtUUUrKzFnVE1YUFFNQTBh?=
 =?utf-8?B?aXdsT0RPUk9PbzFVWjZ1c3hpMUxtUE1sYkNES0h5eXJGUXIyRjI2MHBWa2hj?=
 =?utf-8?B?ZHpESHBEQUk4bmpESTJsUkhJdnBXbG81MHplOHd2eTFnY2xtZnJCczB2NkJN?=
 =?utf-8?B?eTZwSUR4cWlwZ1c4QUplSTJPM3BpUVMzbEhSSkh6bi9BTVpnRGU3V1NTWnM2?=
 =?utf-8?B?SmN5VCtPSjFMNnBtRGl6WEVBVEVYaUhyNUdVK2VoNGhMVnF4Wk5sNnBtRzVX?=
 =?utf-8?B?U1k4NktJa0Y4d21KNEZTdTliYTU4WUFWdm5ZSlZLVEFFOFZXREpsOUc3a085?=
 =?utf-8?B?UXZtaUdiZmY0K1FuelY5S1U1RFVGWEtqVUFmbEJPQmdRN2dmclE4U3h2NW40?=
 =?utf-8?B?SS9BR1NVakFTeEhsZ0x3MFBpV0JkdGRjZUFOaUtROUxSeFIrS3czWWI1bFpZ?=
 =?utf-8?B?KzRVdFRIQ09OUjN5L0N0QXlLcW1JVnA4cTZsRDVxK1kva2ZOcE5uSHlYMDFs?=
 =?utf-8?B?N2VyWnptc1V1dVBuOHlNZFpSSmZrbEJ6VFZhVW5uNUhTWHN1NWFnTk9vZWM3?=
 =?utf-8?B?cWZYN0R2enp2QmcxOGcvdytmbVU5blR3citvcTNMdFdTMm9PM0hIVU9jdyti?=
 =?utf-8?B?TkpNZ2daLzZ5NzdoOVZna3U5ME1VaWJaaHQ0cUZlTnlld1dmNXpoZnZ5SFBH?=
 =?utf-8?B?K0tMSlRZajN0R0lGdDdiazV6V0JLa0hwb1M2c2t2cjNPRkhFTjdWQmpGRk1Z?=
 =?utf-8?B?VHhJOVlRSlNCemZpRE5mRUlSUEU0UDRQdEhIOThaOWZ6T2dLcE44VDJJUmdr?=
 =?utf-8?B?WEI3Wi8vZDBQdlYycWxMazQzbGduQWRDaE83Q3VuYVRSTlFuRjlIcjZ1anJR?=
 =?utf-8?B?d2g5ZXRHS2QxNmUxcmpBZEpjTDA4cjYyNEh2R3MxSndkdXk1MDlHakpKaTBa?=
 =?utf-8?B?VlEwRCtlcTJKUEZvNmhqN0JKcENkVitOL0dVaUdia1RWN0NuRXRSdGVNdjVO?=
 =?utf-8?B?MVJqR1Jad3BmR1gvZWJiKzRVRnk5MndBYkFMNmRsQmdGNG5NQ3RaeDAyRVl5?=
 =?utf-8?B?TnhHWEdUU2pDZnY5Nk5IYXhzY2lWZlVBa256Rm5RM2s2VUJwbjlYR2UyRm9z?=
 =?utf-8?B?MWFVQ2ZQN3c4bTdQc0RiMVlNdStoSDNFYXZGdDBxUFVGZkI5Sk5VL01LMGli?=
 =?utf-8?B?YVdGUU5iUTFBdDdsb1B0ZlF4bzVKc0psa3JHQk1PbGZHaktSbmZEQW8vRzkz?=
 =?utf-8?B?YkdJT2tyUGdaeklDTUVoWkhYVk1YWlFCZjZXWkhPT2VsQkZSYTh0TURrVkZy?=
 =?utf-8?B?VVd5dGFxWHhwaUsvMzBQd2lVNVA4MnBNenBQKy9rdVhmQU5HVzJySTlJdW95?=
 =?utf-8?B?OWZ5Q0MycVlRTnVqK0FiYjhrSzVnSVdDTjY1Y3R0cVptV2JPMzN3WVdiREp3?=
 =?utf-8?B?U05FdHdlZitUd09GYy91R3RHZHZBaTR0MzJwNWRkVzF2bGtEa1VsMmMyYm0y?=
 =?utf-8?B?MzQrZmdrdmFnM3VkQUszaEx5NnB2eThwbHF4OUdOS0lENjUyWk5YVGZ3anho?=
 =?utf-8?B?ZDZHWGdLZng3NEdZa0U2S01ucDVFcVFSWnQxcmRqcTBLSlVBaCtUQisvcVp6?=
 =?utf-8?Q?ISJpkmmscAaETR/W6MtkFh35g?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8f31ed-4122-41b6-2bf3-08da92b1a71c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 22:21:34.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfGvA1Jusvfw+XwjxPD3bCRI7NzL7VUlYV7nlf9qBre2O+Ofz0DFahXVUCa6iY+3XKzMTS64BzGnXWD0Stis3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqhJG29R1YAx6L1+SGVzOrMY+zByM0sPIHPUcMtAnAs=;
 b=sMmd8Ll02gMh/7xYvJT7YHBamliOWqJGfbkVFn2W7aTCkxfDyElgnpb1Mu5/TZAbC2qKM6bCmNF3N7Gy5F/UHb/RfiHAEug9p28NZdXx0XMWTMjFaN9/iVJEw8Z5jbqGOom7Qmk8kJ16CRsTLaHibXgE5qVL0j67ayE9weHxB2s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=sMmd8Ll0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] How to register to attend the buildroot annual meeting ?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am interested in attending the buildroot annual meeting, but I am a
bit confused as to how I am supposed to register.

The embedded linux wiki links to the hackerspace:
https://elinux.org/Buildroot:DeveloperDaysELCE2022

and the tog hackerspace links back to the embedded linux wiki:
https://www.tog.ie/2022/08/buildroot-developers-meeting/

The language on the hackerspace website mentions registering on the
embedded linux wiki, but the embedded linux wiki only states the the
event is free after registration and doesn't offer any other info.

Is there like an email I need to send somewhere, or an eventbrite or
something?

Sincerely,
Sen H.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
