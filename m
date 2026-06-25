Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA34ECDE009
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 10:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8016E60FFF;
	Thu, 25 Jun 2026 10:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxvzlxqOjRfY; Thu, 25 Jun 2026 10:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C61160FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782385012;
	bh=n3FakRx5atvfDy9wg0QBJnzUs/16nGJ+WpokP0uWTc8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=drYb95SU6wEdj0Uxo6qvWhdQpQlbvUz7G0gM7RRsksmHWDGYi628Xf+DFj8+s9xZ0
	 r/IZ4IyYMXL+TyU+ea+ky0eWeE/+HEALwEqm1u+ddjBwql/2I+XzuIQGrTFDPyzoNe
	 QqzNOrmtpxkZuFd+4o7AiVuIS8BSLBmsgAY1rbCGhMVh46cTSf8V60w5HQ54TjTP2s
	 cIhDvWTD5R0nfHBPb9S41Mxe1TKyJkanTJIflRSrNljhTG33UGu/irPeAmN0QnTHvo
	 H9RFLsuyhmX+fim+S/emszZt8LAomB2A+lG7japh90MihbSaz/GJ9LNpNBbzNGuYB3
	 T67GVA0LcxxfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C61160FFA;
	Thu, 25 Jun 2026 10:56:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D2E52C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51C8560FFA
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0B5cJ86lf_F for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 10:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAA1D60FE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA1D60FE1
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA1D60FE1
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAV/xn305xcFxLmnOd7fUMsGPXTFZiXjT7YREC1VXL0zr9QyU84HDV/Ta8qNMIrTd71cADlx0mwim6JM9wK+joh8ufq8tanF/MngU7vRSAg1woJyWmruuFmhSNeEsqoLJbgefKEw2o9wDl10ysxm9zDXymGqNgHDB5xCU9lxFV41XNHsPTNuTBoOoCzK0snUB0Z3lc1e+YqOE4FjRB+rxkB9sEEs6TgogblI6q9DB3TNLZdkJchcXsxteUQYlh8Sb8b60NOdXzWqKKUk7Vz+yEiMZ7XBYlaNylbyC3nbFp8Rt0x+SEFcxnWMfiuDxuoGHYmfe7xXCD3iHnmld7b/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsJX6D2Zxby7gXNF/t+lHGdIGOXjzIdyTEo7Akm9OK8=;
 b=PjiGXGa7cRPECwR/7nbv4OfwZYUMoNqN4oZwMakrTlAh5JY+gXlv6lsnQ6C7zqoEWGStSu3YoiiryzCH/MTszmB0ZCJz5bI87nAVLcQXUi26ll8hpquf41JxZmXijYHSUL0Y6gI7LTS8U78ioW6vCyeOQReTxZdbHnN1sOkkx97f8p/0pXWUfG1BvIfSfnMNYPya0lq8IZ0KAr63b8TVaDRixLUA933+bKV2XWB2sFxiTsJzI6M1R+EPqwGKDvHuZ/NcbGS/jQeNVQO2UJB3FxAFsxm5PFNrxVts9zfLhXbxasSjPCkP+iUcxcK4RHGUz5n47XDrVA3HRxOIIi2eFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AMBPR04MB11839.eurprd04.prod.outlook.com (2603:10a6:20b:6ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 10:56:42 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 10:56:42 +0000
Message-ID: <8636dc29-19d0-479e-a48f-c0f67fb7a3bf@cherry.de>
Date: Thu, 25 Jun 2026 12:56:40 +0200
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Quentin Schulz via buildroot <buildroot@buildroot.org>
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
 <87y0h0kao2.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87y0h0kao2.fsf@dell.be.48ers.dk>
X-ClientProxiedBy: VI1PR03CA0043.eurprd03.prod.outlook.com
 (2603:10a6:803:50::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AMBPR04MB11839:EE_
X-MS-Office365-Filtering-Correlation-Id: ba599b35-73ab-4ed7-d59b-08ded2a870a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 95JYxAv4CFOxKX53oZugd6RUDNJeg5Hr0ExpXPZ6Jlb4dcD7/uhJqQgs2uqhpwWrJbXlC1dP91DYuInzxDDqIUosRwu3uEnX6Hy16x2wYPuP4kELcFSe/kma8HYXrR/DEOU7a9ZnL6+TkI/t2KQLbrkxgbmABHvilaFidVmjL2cgLIy3ZuTiJuSnmExcoqlmGJKH+wdWcqZKYVSnP7Mbp4kFtxNqhnMtw6wGnRx5j02ciImui39Ix99qQtO8GEDAT1dFtTl7w5GFvL1u0AFfM62F2ixZArKgqMQ99Jji63gOtIidNsZZZYlGGT5F/Y+W27nQsEjqdzsaOC8UOp1KJXpQVkf3NhLmD4/2VFo4yjFeosXtJ5RQhfdZ8x+K7vqx6Dp5YLQxJCuaGW6lYN8qZA8OHHZU+E/uPgp6wqXI1ovX/AVcOAprwYIY+EhV01Wz0LRwvZEf/Je3KvdVfQpfbrJUi5Shdz3SqQXy9ETe6yOoDaALdKY5fNfZlAgR+/wEKBJ6k2itMtIOV85qUhcOYgYiQy0df+9VWA1wLwTQxxSM/jqwPycwCTB24wsuqg6BoPeEmmH5VpW06k5ocD+vVasAXdY73vE72dUpbkQ6dzXSaVv7FsGztZcEUUaRDsEdVMdisIeWzcJ9NLrvKVJkXjpsPHxYEP04/kOng35qzaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJkcjd6SG9mR216bUx6cTFHZmJBVW9jdnV5cml3Y09NVks0SWg1TGNVNTVs?=
 =?utf-8?B?U2ZDbDFmT1c2Q0QzZE5CSkgzSWxEcUl6MW96c0VKTUZPeUVnRkQvMFZBazU2?=
 =?utf-8?B?ZzNFd2NBMDA1TWh1b05VNmgwTHJycVkya3lybHJoQlJndTJUT3Rsd0Yvb0tl?=
 =?utf-8?B?QWhYK2haQnBYVGQyaXY4S1lBZUJqclBySjVaYkM5YWNBQXlYbzRrUi8zQ1o0?=
 =?utf-8?B?VzdjTUc2RUNKaFFMWVV6NW9HQnB2VFBQL3BXTjc3WVVWQk84K2N1d3E5eFkw?=
 =?utf-8?B?TkxueVVHbHBKVEE2RFY1Z3BlclUrQmVxOFVTUFVaVEtDNGlTU2hxUE5vdXZs?=
 =?utf-8?B?ZktqallTMzNrNEdScEl5eDJVZG1zWFRzZ2puanRrQ3R3VFMzZWpiQ0tZd2RD?=
 =?utf-8?B?TExXaWRXZkVCbFlGYXZFNGJrcktua2FtK0VOVUVUZ0FneWJ5K2xWV1lqUDh2?=
 =?utf-8?B?UmR5bWlac3NKWlR5YlFFejJTNVNQMENOa09rUUhzZEJEdm1ma3Rzd1ZpYS9x?=
 =?utf-8?B?RHhZamZDdk00MnlwQzQ2VU1EN0YyL29xd3hDUzF2a1FaYnVoeGQycjFHd1lY?=
 =?utf-8?B?aHcyZk04ZWNqYzlIbzRlYmNMNSswajVLNFhKU0YwM1pnTThKVDhaQ1lYYkFo?=
 =?utf-8?B?WGd3a0pPNThVc1A2NDBnay9DaEw1WCt1a0lkaU01RTNlTWZnbE5uR3JFczV1?=
 =?utf-8?B?SGkzbzVLQUF0NWM5N2hSencxdktYUmxQVGNGTVpzSzUrMzUxNHlqOVdReW1p?=
 =?utf-8?B?b1hrTGJCaStUTzA5bUxJV1lZWFM5ZVZDOGRWWkpIZTQrbFM0RDNEVy9UZWJm?=
 =?utf-8?B?Q3dlbk5SYzB4cWRXazBXckY5dFFGSUhkWmhYV2pjczYvdXk1Qzg1NGZDY1VV?=
 =?utf-8?B?V1NjZzNobE1lK3VhQnNkeHVJeWJtTTdSZnRZeHc3MmYyVDIvbXBoMkdQRXRa?=
 =?utf-8?B?Z21ydTc2WkFoVXhnQmlQM2FUVWxHdWswWTJxbVpmRW4wZzRJYnR6b2ZmREs5?=
 =?utf-8?B?R2ZvU3ArN2JFaFBDMkVpWDErWlRya3B3N3VFVXRKL1UwOU5Td0xZaEhsQncy?=
 =?utf-8?B?ZmthdWFXMmFNc3k5Zm9tTWhKSmZMblZsbTdIdXVoUkxDRDhJdnlweFk3c3Nh?=
 =?utf-8?B?RFgvQ0lJbzNlT0pmUWoxWVp0VkNKWkZTQmxUL1JRUGFNWDdaUWJGWGFGWHpX?=
 =?utf-8?B?ZTFhcWdnMnN4ZGdGQnc3WUJEc3VjM29lK1Jtd05jSUNBRyttME5oUzJMVXQ5?=
 =?utf-8?B?Uk1haFhYOUYvY0lVWnNodDJJSlZ4N3pyTVRFMUNrLzNVdFE3VWNDZEZqQnFh?=
 =?utf-8?B?RVg5SlJjaHB0N2drampIR0NvaE9CTUpTcjNYRDRiWGRqN1V3WVloeHI3cysz?=
 =?utf-8?B?ckdFMUR0VkU3L09IMDROdTBwZS9OQ0NJVnJvWFdrVXEySGhxM09LS2NFUlIx?=
 =?utf-8?B?MHl5UVloV09KdE5VRlppdFhrT3hyVFNOMVQyQkVVTEVvRm13UTVrYVlzQ1RH?=
 =?utf-8?B?Ukswa0tWUldJQ0p0ZEx6eVo1N3lmbjA2bWhVRUltZG95VlQ5aXkvdmZJWU5S?=
 =?utf-8?B?VzJUYnZFcllONndVRDhHTlFpNU1KSmY1ZDZWV2VLREVoazhoWEVheThmWjFW?=
 =?utf-8?B?TVUwWTFRZjYySC9maklMcG0wTkdYMTBsTDdtQlNuMlJFVmViVE1aZGVaWFhM?=
 =?utf-8?B?V3JFalAwamFBY3pjUXJtVVhLUEJFekRMd0hDM0RuMnhCYnhDeGk4RE5LNVhM?=
 =?utf-8?B?RGltWWVJemdleFFyZUFEbUVhcTdsMU11QUQxbStZM05oVE5lV1JYSTN4eFY2?=
 =?utf-8?B?QnQzRlpTTW5wS2pKYllyYUZYQmhJUUpSTXoyNVArV0VIK1dNYTZzTmgvdjk5?=
 =?utf-8?B?S1ZRQ3g1S2U2R0hkVjlkaXdHY1dUVHNUc3RtRm9JaGVJK1JXdHUzV3A2aDdz?=
 =?utf-8?B?ZkJLR3l1ZEFXeklIZ3NkT3lxdkhZMXA1aUgvVTJudWR3d1lxNDlDc1FWN05r?=
 =?utf-8?B?M0s5ZEEydjNDd0ZER1FjMHI5N3FrR1hSdXl2UjF1QzM0amF5QTJwaGNSL1Rr?=
 =?utf-8?B?eks5ZlRVUHBuMzVWM3krbEVMdGRxR2p5b2hoYUcvdGNQTC9paWNVNDNndkF2?=
 =?utf-8?B?OTR1cFZJTkhpS1hGRGN3WHUycnRmelJacmg1Y3p4cDBkVnk5ZVNYK2dtL09s?=
 =?utf-8?B?aHBLVjBaTUx4SWtseEFESk9SYXFjZEQ0UG1EeEYyTEI5Z3NwMmt5aENhazNn?=
 =?utf-8?B?eHFObkMwRk5BMUZjQnp2NHh5RWdPcEl0ZngvZXdKbis5bEFObjl4cmtXcGdZ?=
 =?utf-8?B?eGNDUW5QRTRvSXZ5M2t3K1NFZzFDWWRsVjNwWG0rVERGaUNJb2ZmQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba599b35-73ab-4ed7-d59b-08ded2a870a1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 10:56:42.0456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LIz0VHSyZSAlzVcRXc+IO9sfDWiTBxbTiXmQWw8OU81laG0r3NhlnFe7ARcVBLjgIq8rw+kT8FiasVlM+Qb9RPYrqm4mWtD71ZyYFuNuhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsJX6D2Zxby7gXNF/t+lHGdIGOXjzIdyTEo7Akm9OK8=;
 b=n6fmoVrasszOg4oCG/DMuLZwbIHMglbV5UGB0LEvYl4uF86wlX763wCXiDFZWthlBANPUCuzdKoImR7eTLJtIWYRJDM3u5Qm2Zh69uaYA5KMtdDEU344yWvrS6OD08980yDC+HqtXAETBWVuNkJcmD2sO0r/8H+wTpJ/sM9HnnM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=n6fmoVra
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 5/30/26 8:35 PM, Peter Korsgaard wrote:
>>>>>> "Quentin" == Quentin Schulz via buildroot <buildroot@buildroot.org> writes:
> 
>   > It may be beneficial to be able to run the script from Buildroot host
>   > packages to avoid external dependencies. I for example build Buildroot
>   > within some ancient container where I don't have a recent-enough Python
>   > to run generate-cyclonedx with.
> 
> Out of interest, why is that / what version of python does
> generate-cyclonedx need?
> 

list[] type hints aren't supported in Python < 3.9.
As far as I understood, it needs to be typing.List[] in <3.9 but then 
it's also deprecated since 3.9 so not sure it's worth the trouble.

c.f. https://docs.python.org/3/library/typing.html#typing.List

 From recollection, on 2025.02.14, if I remove the two list typing 
annotations (extract_cves_from_header and cyclonedx_patches) then it works.
On master (and 2025.02.15?), I'm assuming we also need to remove the 
typing annotations in parse_uris?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
