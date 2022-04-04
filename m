Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E81560E1E;
	Mon,  4 Apr 2022 09:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRRc5U7xJA8L; Mon,  4 Apr 2022 09:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C0E607BC;
	Mon,  4 Apr 2022 09:42:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A16031BF281
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 09:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B88C607BC
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 09:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hs2x6XVB-e9U for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 09:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::617])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EAAC60672
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 09:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odYYeuQ2GtzFLVPHNcHYuUjFWAw7Eab5SSix2iAlYHKw5S583pX7VwQVJScRFhDAPxI+kHJPxVq2Ul6wJ6O2CyDqOm1IzhBufhYUaE2gu6PogTAK8qi97dA8OkAHhcxt7flR6DWqblTdQ2OvuyhuPBbRJ32YlXVl8aRRaKMfhbF9K6YqSDFqxVP2GrgeoQqqhRpRoHupkoxyh5D7wRJWPTBWXyEEkUHMEe1SazF/w2qwc54UK70GsNCCKPgaaCGUE5Bp/+EQpKjeMXODBcNy1vVCnB88I6h1Mi6mwTGRdVAP6d0KLkEHGPxxnvphkFo25INNDRhcVPjX//4sXnlcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eWDZI8clFAuSFAsbanyhACafc8V7GTtDO6OX1tjt1M=;
 b=LWQEs7tCYehiZnLgRxZdY1FCJ2TIQ63UU1vBStgmOEYIRj1XDsBnBngBD2w6FmWflgdedct6AWIU52ZEZJjHFtaxccDNZ2EPjRp3G2Ze7Uxzj64DJ5RzwiF0aSHIbhMG3q+h5PAnp5/4NvZSlck0o+7jNRZFrTTD1M7L/Qn95q3oDOSZXAKQHmRUuCxS85f6F6XRuoK90nks5ChdYNzksHhtazgazPYAwV0qYLqXW1/IkRJVbU048ep5QNK3ZLi7mKt0OQoEQ9PvkgQjDM64BUZUrDXB3xV4VwoI5g3TEgalYGATb/7s9vTHNWWba2gKG2DFhdu5tJ1kT+VCUcb7dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eWDZI8clFAuSFAsbanyhACafc8V7GTtDO6OX1tjt1M=;
 b=tqQB9u/r8kRGe1TFCBbtCxu3Ea378ZFnlMqHAEDkJi3a1mIrHUk1oy4CIi8qTNtnYyidg/LJVMGuZwwy87Xv18vkuue1/jt2pkcvCG/xDD3kIWEFLo14CHEo/BPXTG4JUDEt9QY/nl1eV0X31pr0nfpOPnODKtJ//jNNWyJqwO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 09:41:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 09:41:54 +0000
Message-ID: <0b7b806d-7325-9891-27ec-3a6394a328d0@theobroma-systems.com>
Date: Mon, 4 Apr 2022 11:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
 <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
 <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
 <CADYjeSuEG=Qh3-=tQDUi9R_n5D8J1hV0PZGDQg7NvbCbEjy4gQ@mail.gmail.com>
 <CADYjeSsK7HYfB4_WzsPiez4s8Ffa2vQ-J7N+H1=qJTQYyR6MjQ@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CADYjeSsK7HYfB4_WzsPiez4s8Ffa2vQ-J7N+H1=qJTQYyR6MjQ@mail.gmail.com>
X-ClientProxiedBy: AM6P193CA0087.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::28) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb9de050-0b42-4b1c-59b9-08da161f5a25
X-MS-TrafficTypeDiagnostic: AM7PR04MB7157:EE_
X-Microsoft-Antispam-PRVS: <AM7PR04MB7157932AFC6BA281FB273832C2E59@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAqxRZqdZyHQVAJae+ZHjR+MOI/pzG8mxP4bNr4P2nQCtRbtKcVMIOKwTTFLsoAUw5UEp7FWM8ksnVZ9M+gno8uneqRJjb/jVDITYPFRs8E75GzhuI12Vdj6FgtHOkvGtNQ8SdeaVr1AneWsEFtBe6ovoI9YqCKFOoItxLNGyXGEX+CUvShabxQAUWnesRTDhNPypxQK5r7CC8WkVpheRYzQcBG3DxPXnQ9U5GEnRkbO5TQ+50aQ1WvYbx7eWGxy///916wAZiSawOOVUufaPrTriJZaFHwbdgJ7PsZ3mTfCa6vlUbcuN7OmVmAOd/l7EZPy3R/+bzwl61RNVFCdimjQrbQQL+uewIY6CBFeDQaxQqAYoKv+C3uVTZauxh0pd7YGXlGXPiemSpvPDlDf+dBfIj3i+HfgSxRk+l0JUBKUQWJHird3elVOAGMjgPgfj8FD8EM4Vyauy6xnfiwMoc9cRN+RNBHtiYkgtZ5ygOWdlD0ajysb85g7mjE7wsnNUfeK3HVb5lyglBR/h1dj2Ue5LI7Gc9ZNUjDbuwaRiHDeIjgSJ8wHu7FwjVscDHiRXPigR62hlpEVz+VllpiKD4KvrWffp1teo33ESD1spG7JuboFf9X42Uev/UdDiqzBg/CLP3bAGiFuPVj5L/zS7DUFzaNmtcGTb3bwFo0AWUAHOHbDmyvQi0yPGXi9TRiIESC1wGoNDSo96VivLHDPNrnTRvJ6uxh6jiPMoXWhlSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(6512007)(6486002)(2616005)(8936002)(86362001)(38100700002)(31696002)(53546011)(2906002)(44832011)(6506007)(508600001)(66476007)(66556008)(26005)(186003)(83380400001)(316002)(6916009)(31686004)(36756003)(8676002)(66946007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWRDRjIvOGt0N1NPcEpWdng3M2VCYjRhUDlMVVpXRGV5NzN6ODQzZHNwUlhG?=
 =?utf-8?B?MTIwU3ZPdEZRZ3F0azV4VC92d3ZXaXZ4bVNxNm9KY28rYU41eDRrVDlIbEZ6?=
 =?utf-8?B?d2ZIRmhuR2RnNHE1aTRiRVFReVRqd3RreElZdC9rUS9RRG1ud29ZeXZVdVJ2?=
 =?utf-8?B?Wk5jSFRiR3FjcVJISFMwclZwRmE2N3dvNWxsUTNkNG14RjZtVjBicWtsL0NV?=
 =?utf-8?B?VjF3SVYrc2F5YTBqNytIOHJNU3YzblJyZ3pwdW1BSjFYL3ora3lia01xd1dj?=
 =?utf-8?B?MkhuRUJjN1FzSm1JVXdMYWYzWGMzeGVLVHkzcnRlTUlCZlczd1hhTk9tdmRW?=
 =?utf-8?B?MnM3bFVOU1pTWisxcklaSjdwQjlhejRoc2JkclpGUUREMFFYaDRteklxeGU3?=
 =?utf-8?B?WnNjRk1FTnZEZzlTRUwzLzY2MFE2cVdXeTQ1Y0FZSDRmb0VmRVFrRmQzdTBT?=
 =?utf-8?B?cDZwbHQ2T0xJWVpKdWRCd2RXZUREWEtiYm1lWXpZOGpycGRwOXpyaGVZWk9l?=
 =?utf-8?B?OXRiWTREcmNFRm5Jb2RvYXJWMUFYbncwRVI0NEdObGJUbkdFVTAzTnlNdzdq?=
 =?utf-8?B?b2hQU3QvYk5UNlJNNzVSZmlBQnYrV1diT0NWZ1VGTWQwcEZEc05sZjZJUW02?=
 =?utf-8?B?UmdhcENDREhpQ0Ftand5clBCN0UrNmdoUkNVMzBUQU4xLzhQYlFnbDlBQlhl?=
 =?utf-8?B?b2V5ZlhDOEV5eTJZNk9UbzBBWkdVc09FMUdCeDZFWkNSNkJnZjREa29MczN6?=
 =?utf-8?B?MjJaeFlmVVk2Y09jNjd2eTBQZWNlNURBUWI2MXVVL21tVk12bm9uTXlRY0lr?=
 =?utf-8?B?cGl1cU45TThSaS9EQnJBeXpiRGx2ZGFZUUdIRytWb1Z0a1g1ckJiQm9OMnNy?=
 =?utf-8?B?MndtRG93S1Bld1BEbXlrUytWUi9vaE5aNGJSVGZFaG5zbFoveWVCN09reEpB?=
 =?utf-8?B?WHhYZTBtYjQ2SDMrSk4yL3dpUCtIWkwvTTRmVnFubm1jSUVJVjEwVzBaT29U?=
 =?utf-8?B?N2JVakVtZGYrRG1LenR2aVYxbkR4cUUwTGFvd0dva0FCdDBxU3hlV3FzV2Yw?=
 =?utf-8?B?UHlKSCtmWGY2dWNTL3ZDUXhkbWhVWkdDVnJSUFRCSENMTEg2MkpSVUVFWkZl?=
 =?utf-8?B?WjB2U1Z2Y3RUZ2o0Yk9Hby9xY3BkM1hWN0NYUVY4Y2xzTHA1QTNPdVhaellT?=
 =?utf-8?B?djFIUVlVN2NLUW56Vzc3RWJOYzdycmgvN1loRjRFOUlnM0hEM01EMzZnZ0t3?=
 =?utf-8?B?b2o1aHI4N3NKeEhOamg3dHpkVFhvb0pKcjI2ci84UUJoc0NMM0ZNV1dFL3hs?=
 =?utf-8?B?c1ZJU2xQZk5iQU41VGFNZUVnQ2p3amJrWTRSUnQ1Ukl1UGhmNENjeWM5MXJJ?=
 =?utf-8?B?UVhhNjdGeU5DdGQvWnFxc3JwaEQvSldMb2J0U1gvMWxBU0FZaXhMZlQ3U3ZE?=
 =?utf-8?B?NmJFcUVrd0luWHBZQ0RqdFJoYTlKMVVDWFVjNTZxMXpHM1g2K3VsSmNoM3ZW?=
 =?utf-8?B?d0hZT3NQUTNXNTA3aTIxOHZxcEhWUjErbkFuQzk0N0g0cmZqVUoxaWV2Vi9B?=
 =?utf-8?B?RHhmVEJsN1B5TDRLMFNvUitoK1VDUnc2NnMyZXhqTW1Iei9NMmtaeUF2VXZN?=
 =?utf-8?B?OXdKa2xpNW55WU5yYVhNT0F5Ky9IcG1QYUxKWEhlTExrM3dNdE96b0RyKy9P?=
 =?utf-8?B?ZlhqanhHMTdHQXYvNWxuN3FaQS9SY2RKRTVVWDJmN0JaUGY0QjZ6UTFJSmdo?=
 =?utf-8?B?VEwrampHRlF2WkRENmZ6bDhaUE1VWkttWkV1b201Z0JieW1WeWk2UDdQODhO?=
 =?utf-8?B?a2l5a0FEYnFPaHV4NFhNMlZGYzRQZGU4bEJ2WDM4VUpXY2o5S0pMNGliWmdO?=
 =?utf-8?B?QjV5VjhsK0QrZ3JCbDNORktUNUpPZXp5SllsejRQRi9yYzdrWmlVd3hrSkF0?=
 =?utf-8?B?R1VRc2hicUhkMHRTU0xreHRJNXl2U0UxWEdVZ0daSmg5UVVhUG5VNnQ5dFps?=
 =?utf-8?B?eW9GL3RaeFFxdFFITXl0UjBsS05OWkt4bHBWUGJiRlIxbGFxUWRDclpZSHhF?=
 =?utf-8?B?RzA2a2ZYNTJPTklCS1VpWXdPVGFPWWhYRlQ0c0s3Y01PYWpVanFxUDFac2RF?=
 =?utf-8?B?bkFyM01MOHVVNGlITXBFNCsrQUlDTWIwd01PUjcxaE1RdEl6bXZwL1EvRzhw?=
 =?utf-8?B?L1ZSV2ZrOTFER0dVTlRPcHMrMmhCRUxIQVZXT2NwdXJ6Yml4SFZBaE1DdWtv?=
 =?utf-8?B?a3FCRUVVbGM4NnVrUGxKWWtaQ2Jnb2VydURVcytTcFgxSk1YUm53UGQvQmcr?=
 =?utf-8?B?K1FlTlhUcnZUTVZGc0dDS2NqQ3k0NElMT1J2Ri9lTklQZlNFdnI3MmlhaVp2?=
 =?utf-8?Q?qqyaLXRdxmlnGdm5A+LxLxNQVQvVHMvuGICh9?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9de050-0b42-4b1c-59b9-08da161f5a25
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 09:41:54.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avVBJGzXgUEbYhxAuIa8uLpNzNqt3r7ZyUKNHPUzF7ZI3KsAw+f4nZBOKVjhIRu7ysNhY8sY81eJsdQ3VdJseLKVG8IF3YtmHy/IeD8eOPOy3YeTmh1Sm9MyCH9+mtq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sourabh,

On 4/4/22 10:36, Sourabh Hegde wrote:
> Hello Quentin,
> 
> I made some progress to build casync as host-casync. I modified casync.mk
> file to include "HOST_CASYNC_DEPENDENCIES = host-acl host-libcurl
> host-openssl" below "CASYNC_DEPENDENCIES = acl libcurl openssl". And also
> added BR2_PACKAGE_HOST_CASYNC=YES to config. Then if I run make host-casync
> it results in
> 
> make[1]: * No rule to make target 'host-libfuse'
> 

Same as for casync, there's no host package for libfuse right now. You 
could add:
$(eval $(host-autotools-package))
to the bottom of package/libfuse/libfuse.mk and see where it leads you.

> I think this is related to below DEPENDENCY in casync.mk file:
> ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> CASYNC_DEPENDENCIES += libfuse
> CASYNC_CONF_OPTS += -Dfuse=true
> else
> CASYNC_CONF_OPTS += -Dfuse=false
> endif
> 
> But I have selected BR2_PACKAGE_LIBFUSE=y in menuconfig. What else should
> be selected for "fuse"?
> 

I'm surprised CASYNC_DEPENDENCIES += would add to 
HOST_CASYNC_DEPENENCIES but I don't know enough about Buildroot 
makefiles to help with that. I'm puzzled by the error message basically, 
I don't know where Buildroot got the information it needs to pull 
libfuse too.

I'm pretty sure this will be an issue anyways since the presence of 
libfuse target package shouldn't influence the configuration options of 
the host package, only BR2_PACKAGE_HOST_LIBFUSE presence should be taken 
into account for the host casync package.

I'm afraid I won't be of any help in this quest as this is a bit too far 
into Buildroot system for me and I would just dig into the 
documentation, same way you would do :)

Maybe someone else can chime in. In any case, let us know when you find 
out what was needed to make it work (and send patches to Buildroot so 
other people don't have to go through the same pain as you :) ).

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
