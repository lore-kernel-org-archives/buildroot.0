Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E5FFC9EC3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 01:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEC6405FF;
	Sat,  7 Mar 2026 01:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wRU1RHmVO2C; Sat,  7 Mar 2026 01:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E934061D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772845619;
	bh=u9CQcrq61P4MeZiT6vdUiJgLlergCcz8DSRi4elnIAY=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k2+wLwNLu8/LkH8E11BBIVA2s15IcUu8Gwhd78twFz1jbc1E5N7hLxSst+408uwh8
	 3Tg2O9ssmL91tKCuOPmSE45Ht4amX54wB2xrOhnI6jb8Z/XBhU3K9FwPIlKD7hwX/i
	 bLzaWNvnsRQZa+JykLz7WLQ86286pIQYROS59agDRzl84FY5j6sxbX9QA38KM1Qjow
	 AW5ke0vaNRvdStmvZ2bjp2vUrzs32MypzTGIkmmHWL8WdAP1HKBEW+M5lYthwKANDn
	 qpseK1To3uPF0V+qupbgXVct9OrqmyuSfo0ZkhOcHDr8EKe/9NrGKhaslNH+6lB7Jv
	 MVWpH7Biu7q4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E934061D;
	Sat,  7 Mar 2026 01:06:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D34223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 01:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B27E6088D
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 01:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_Os-Iah2zz6 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 01:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d100::;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8876C6083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8876C6083F
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn190110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d100::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8876C6083F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 01:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwpDa0XLSvc786mgzY1G6jnk1nVRkW2xDFMopWuHhTb3yOKjMc/WeS3YTRPywNyPqRUTvLL0pLrFUoyWZ3Z5WeGYgsqa6ipXx1p6eDuctqPaRqgRKMPSXuC7Xz97vzFSdBBGitm7HNC3MRMc8DCG+6wtJC/uC9VDXeFGOlBLceryAsG8Lv0Gv8yNgyyE06Y3pRdhTFAygMdXWsHF9/cIZrQCQwF4EGH2DJ5z+rqWvNxCnWVXDheET3e18546ZMxfBS3OQZi0gJxNLu3yDhSJ8lZAtCPy8C3oXfLYruExgHMub9mfHcogtQospElRwf1p1ug4dZB7uTxVxoa0LKUMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ldOUlZAjDU5ZZAnirhdEIoNs1/HPCa0zx/i1M4VP5U=;
 b=xOHF2qMI3ByVbwcxkFnfXLXtakvGKhYkIs77nsT92cdtEbIqUTWTSkvAtgQwaQlLQJ+7ecaXhLDM2VbGdIcsU50TrSIXtXxe3pPb2Hga4QtDYAShBtQAxQ/6rXZdVQ9RGBp+FDtIm+XnQqT5U4UplN2/wCFhitl4Y+D/REeqMCW8uVq6rxjzvtGW6vtkPN96eKX//PB1y9eVPp8gkxWvarSjawFvZEaY9/fqWt27+NvGdlAX0galHPy2HPn5ZAv2kg9uIyzUGZYSZLnA1aJhkiDxnC8mJj2pFPeN18P/wJY3YBVDPRxNQJMElw8yNbFqsZpb45/Th7S6Lply+F97Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH5PR05MB998506.namprd05.prod.outlook.com
 (2603:10b6:510:39e::23) by BLAPR05MB7234.namprd05.prod.outlook.com
 (2603:10b6:208:298::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Sat, 7 Mar
 2026 01:06:54 +0000
Received: from PH5PR05MB998506.namprd05.prod.outlook.com
 ([fe80::531b:f829:63a2:1c0f]) by PH5PR05MB998506.namprd05.prod.outlook.com
 ([fe80::531b:f829:63a2:1c0f%5]) with mapi id 15.20.9678.017; Sat, 7 Mar 2026
 01:06:54 +0000
Message-ID: <PH5PR05MB998506EF0692F2B1FD864EEB3ACB7BA@PH5PR05MB998506.namprd05.prod.outlook.com>
Date: Fri, 6 Mar 2026 20:06:52 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Dylan Buckley <ohitsdylan@outlook.com>
X-ClientProxiedBy: CH2PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:610:5a::40) To PH5PR05MB998506.namprd05.prod.outlook.com
 (2603:10b6:510:39e::23)
X-Microsoft-Original-Message-ID: <dfabc88a-a0aa-4acf-afd9-35a8f1f3e0c3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PR05MB998506:EE_|BLAPR05MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: d6122842-40f3-46fe-78a9-08de7be5d24e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|6090799003|19110799012|8060799015|41001999006|5072599009|15080799012|23021999003|461199028|13041999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZNWmduUUFCZTZONHk5OGY1bnNNOWFINC9UMGRqb3JNTFY5TWREMklMcDhj?=
 =?utf-8?B?b2pKU2g0THV3Zm1XYVhuT2JCeEtLeWpGVk4yWXhLbXp2MVgxaUFUM1BKUWx3?=
 =?utf-8?B?RTFkVWtmSGo3cGpZdVV4ai9CQ25ST2l2WFhZVnVPOWNzOEtUY3FXSFpTeEFw?=
 =?utf-8?B?QjhOUWI1SnlMRklnTk5HWFZudk1BWWNuKzNzV0IvSzg3KzVBbmhWYURsdVlm?=
 =?utf-8?B?VDVQOWRpUFFJYXgwQUEyUVI4OTBSaEhONkJYM1hONlJJL2k1TVZYalVvazJz?=
 =?utf-8?B?dnkzM1MxYkpyZTI4MDZwMXBVZFhEaXUxZVU3dEovMFNCQjRhZVFTNUxpTWZ5?=
 =?utf-8?B?RUdabHVvRXg5MHBqMGVuYlNUaG9SaUVQM3A5SG5NQSs2VEhUZHdsU0dxVEgy?=
 =?utf-8?B?SFMvOG9XbTFlT2hucGQvend1Q0gxS3A1MWdMREFGbllqQTdIc205UFcyanFB?=
 =?utf-8?B?b0IwNlk4elJXbllQR0VIQ250YlhXRHFENzk3Z1haWkQvSHN4RElTU0dhU0pw?=
 =?utf-8?B?VmVNMlVWWDVxajlwdWpadW90RzgrRjIvdE9MalVmYTZXdGlncWhKVDJ3V0pC?=
 =?utf-8?B?c1VnTUlOS1VsK3lzL1VkOFk1MmhvZFdEOE5XMkFQc2hQbFVoTWtuK0VhbGd0?=
 =?utf-8?B?b3VBL1QzSFZCa0V0NG80TWJHMmJVZ05vbXFxTENVajI5M0dzOC9lWFJYMERD?=
 =?utf-8?B?NEw0UStwYTBCQ0ovWVM4MDM0WDZoWGNLWjFQSDV4emlBTEJ4UFkydjloQXJX?=
 =?utf-8?B?ZUgvL3IvN1RKWkxVcXdkaVI2bklBYzZtdUhsbnZETGxtcEo4WDRXVVhUdzlR?=
 =?utf-8?B?UEtpbHRPaUdueWNGYnZQMU5pUk9hU2R6OHlOYjN1L055L1dOR3pINTVIZ3JZ?=
 =?utf-8?B?V1NBaXRFWUQ3c05wU3d6MWRtUzNyUDU2c0syY0dabkRpazNtbU9uUjVIbzZZ?=
 =?utf-8?B?aUtBYlRsV1NxbThQUTEvZVFwcHI4SjF2S0ttSGwwc1JMVnlBQjUzRWFPZlRp?=
 =?utf-8?B?azZDYUsvdzdCMldrZ2g5N3BocitSb1hpOGxJcU1jV0lMb1ViNnFNNUpKQWFk?=
 =?utf-8?B?Mkhza0hIaFUwQm5rajJFb0N2MU5wMVlWU2FiejNsaEdJcTFpczArTlhKTDhW?=
 =?utf-8?B?eHRsRy85MnkrWGpJRUoza0t4aHljL0ZXeGxwUFh0ZzlhWm02L2NnaWI4M3FF?=
 =?utf-8?B?MGo5SnZ5SktUZmRWMGVFNmNnYlpHNTQ4alBsSnZBZDB3MGF2andHdVhXNDdr?=
 =?utf-8?B?Rmpmcm1ZYkVJaG9ENVExZUNpVHh4QlZHLytySVovMFIra0JRMmhQblZURVFs?=
 =?utf-8?Q?CDDjdIGIErozAauk72hTYlVioFcabw3MhC?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdLOHBqeGdzWFNnTXh4aUVmOHpOODZ0a3k4TmFJNk9UakFXWitrM0NWWlNa?=
 =?utf-8?B?UUZHd2N1TWZtQU1MRDA2TDhxQ04vN1BwUlJ0Yk5KSDBTU3ExaHdFbEVPOTh4?=
 =?utf-8?B?MzZFaFBldVZJQ2tPR1MzdTVlait3TXF4VWFEME1BbkwyU0grSURGdXFhZ0J5?=
 =?utf-8?B?SllIcTNGbUR6d2tTZi9LZkZiS1paM1duWlI0MURsRVVsYmxVMUpzUVROTERl?=
 =?utf-8?B?UEZ2Vmx6aS8yMXgrZWxmWnB6YVBFL3pLeURZZGdPV1F3UlBzdG5IYjNLdlV0?=
 =?utf-8?B?NUZpVFB2MXdja0VzNTQwSTNraEd0VHRjKzZQZ2h1MVBTRzlvQ1BwT3RQR3Bj?=
 =?utf-8?B?MFlrR1R4VTRabzBIeDNLR0FjbDZBVVZ5SitRU3lib1UyOXhRYkFsNEE3cFAx?=
 =?utf-8?B?ZDF3NmxVRE1oc3RGaDBuemJWcDFScGNRMFphYnJ5VmVxNWIybGZFbksza3Q5?=
 =?utf-8?B?Mjl6VmN3Um9pbTFIZzQ0QXRzQ294eEJXYlljRDI2ZlZ4MGRBMnFsdHNaWVgz?=
 =?utf-8?B?ZFAxUERYZngvS1MvcEdSK01sOUdKbjRwWWhpcmZ0MjNTMjZObnVNT21SZjlK?=
 =?utf-8?B?d1laWkNyL3RTbVJ0aVFVRjY0OU5xQnBSaUFmdEtVOFJYbUFWSSt1SUxaT09B?=
 =?utf-8?B?bW93Z0t1dEhTSUtmTERDVGE5RjdxQ1dub1ArdXNDUzRQRmNMMVNTdkVTdnpv?=
 =?utf-8?B?LzVUQTZHOVNpWWNFMFdib0NTNzM4TDAyUjFla0kwSE9FWTZUNEcxc0hiRjJJ?=
 =?utf-8?B?RFhOMC84K2ZUTG1jZW1PVlhldS9MTi9wdDk1K01hUUd2akk3b1J0eVMrR2N0?=
 =?utf-8?B?aVRIMldkTVdFdEJZTW1ld2JZeHkrcFo2djRlTzlSbDA2UzZpN0pYV0g3dm5z?=
 =?utf-8?B?US8xSnZYTGhzVWJ0KzByRGJJaXg2Vm50V1dweWFQRWdHT0ZMdTc5TXRGWUg1?=
 =?utf-8?B?Mm54QVZFRElBRWJHdnRRcTFOSW9scFNONW5pcUdqS0ZvS2FIMUZFQXZubVpQ?=
 =?utf-8?B?T2gzWXEvTExGaWVXYnozZHJBWFlmMTE4QThkVnQxelVadzJXRHlaZEtNL2t5?=
 =?utf-8?B?VUt0eTJSNkEyREtNeWxEMHZVM2cvZXQvaUJac0UwVTQ1cVdramVQM2YxS3pK?=
 =?utf-8?B?S25TWCtyVDZRZXhrN3FpRUZHVmZ0b0JqZzgwaTRzRG5UTHl5MHZwek1NRS93?=
 =?utf-8?B?dTNvcFpGM0lVYW9YREFTNFN5WGt6eXJMZjhmQ2czNmJwY0tBSjNnclEwKzFp?=
 =?utf-8?B?NnpRV2p4WGFEOTJkME9kUnlRSURYby94aVRBQUoyb2hPdG1JUmNKWGhieDVi?=
 =?utf-8?B?ZXptTlFRQndKa2UvR2VjcXU4dUVZQk9xUW14YkZEaklObUEyV1R0STErR0hM?=
 =?utf-8?B?Qmh5VE1KR091ZGVtT0F3T3pYemluUlBXRk51OG9YZVkvMnZCemM5QkltSUdD?=
 =?utf-8?B?RVNFN0wySC85K3pXdWRlQnFGSElKaGdxdTNKaVdEb2tEMVVKUnovaFI1SERj?=
 =?utf-8?B?OG1jdWFwUlgzSno2UGRhN2dzcXc2ZUIyUXk1ZzBuM1pWN1JOTGxGTGNubzhp?=
 =?utf-8?B?ZmhCdG9GcFNvWlIyajFGOXQrZ2VRWkNhRUUrekRvc3VHRTBKL1ZJSzQyNWRJ?=
 =?utf-8?B?azIwaFNmbGpVWFEzS2dvekdsYlBlS0xxU2hzazR3cmVzVHEzRWZPcVZnZCty?=
 =?utf-8?B?dHd1Z0o4QStqdjMvQWVscTkvMlRkSGF1SG5yWDRkZkxFOVVYemhjNldDYnVr?=
 =?utf-8?B?cWlnSG1kaVl6Y2lSTVBDcEl2aDJxUEFyWGhrcFJvdkk1TVVxTE9wYzZIUzFC?=
 =?utf-8?B?S1VCNCtMa1ZvdmJHMmVUUVJoRjZjNFJFZ0xrVHZiRWk0aElvcHRTYWZQZkJF?=
 =?utf-8?Q?GI64QQNf4/aPY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6122842-40f3-46fe-78a9-08de7be5d24e
X-MS-Exchange-CrossTenant-AuthSource: PH5PR05MB998506.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 01:06:54.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7234
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ldOUlZAjDU5ZZAnirhdEIoNs1/HPCa0zx/i1M4VP5U=;
 b=kVa5657JMxcRKsPoLGZoyxMbeZXOWxcslgaN54vG/Z4x29G7hJbWfx2cr7A4jYWExFCtUSnkZM5/yZI5QOc+Rk1SEXyYC43UIGGa06PnZ3+/dsCgHzHtdWrorrW/1GM7tYgwM5U5wUMQzWkAgLBPf6tnjQUNqPQCZ9oS3CuVrS19tHBF397C0E1Kgez+scx72KbJTHW/X6NeUGM5Iw49JjVPUabMq02B4PuyW57t9yzPvX0mvoljbMrk69Qi5pX28U+KHyM2JvwKRf4G+I0fiudWBA0c75IQ8Dd1xpYgKegXSYTq39zZknQ0g75W3ffzbbCLV/tbnZlt9LvYd701hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=kVa5657J
Subject: [Buildroot] How to Build python-jinja2 Package as a Host Package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hello,

I am trying to build the Python package, Jinja2, as a host package. I 
see calls in the python-jinja2.mk file to the host-python-package 
function, but I do not see python-jinja2 as an option in the menuconfig 
host package list. I do have python3 enabled in the host packages.

Am I missing something obvious here?

Thank you,
Dylan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
