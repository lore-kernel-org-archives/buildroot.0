Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B7C5B572
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C01080F91;
	Tue, 11 Aug 2026 14:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNoUkMUiiADk; Tue, 11 Aug 2026 14:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF69B80F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786456867;
	bh=dKPPjDX+jCtv8MEiS4n2J0VJIsR0NK2Ayjo4hMR5qcg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QITuY/HqytcbwFT8HyUNvYCC39xWdwzOo7+qCbsa48GWzSkCI/ggrkBKcDDgEulV2
	 FPL8pDSXjGfATdZK7U5Gn86DVliFBBFrQ4uY7DFBSP4LfTfq9qNDHnwz3K6R8Sz3J1
	 GGmJL2K6gTnpse0lnyq57BTh8R+kw6k7pkTV9NRkSvBgQDno+mHzaXQ4e1/0mucfIg
	 TfUTb5U3vzOymFqkzaZSekiAbhbgVowHLj6fWth1mt2eMp5OVunSUvM5Ew5NDczV/y
	 +nQpncpFl+nOyWEHQwKtiW5534Os5LOhHci4uX5tYKa/5L7a9AlK3VFJi4tBLrjU7L
	 QCVIrkavSSv3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF69B80F94;
	Tue, 11 Aug 2026 14:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4058296
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C42605AF
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei4n03dxSq5F for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47BD6605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BD6605E9
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47BD6605E9
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlZ6wkS9lSfztDqMmrqq7gY6amwup2x/D+r57mU5U65DAL5KuZi7wfYfRctXM3sMge8kZSr3PInuSNxtFsXDA+5MKADWFuTz9kw7rkbXFDDyNOx5wu28FMZDlbiqeJ3kKItSExgnACrBX2C1QBZTZDOTpuMKEu7421Vg8eOK4lvCbeeabgh/HYli0lFnNVmg/AUC1R9/24yZgNNSl/1oQ4Fp7tEWGMZMHHGH/ue5iaCVlOqKOoqE7/zNXGaVKscVMCr86o+YajQWUXyYpLVQnKRMnaiLo5SGyIV12wn0bm8ylr5mEXLuBdgY1EKCzM6NepMwn4wt6l5AixdVzFa2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5y5eQNRFD+fpAjyMajaW9ftsmsZM4bTWh5MpSvPyVA=;
 b=uyeKHt95qbXgr45EZ9dXgAYjEZciI1v7Kn1ELjcohF2ecXdeOjMAmYUVNanXxYMr7LSs6LHsYGu5DWY2zukriyEcWnqO4SCrd40Ycde9fNIjhPpwQsLsYp3AXG8MP2ePW4YMOMhK7twvOoYEx+WgQCiKZrM2ZOzcp3lYEFRPCLSN4+2KqKTuMUGy0LhwEriiH1QXNovgIgphjF6npWMM5pc34L9ZwOjpl3hnri8zLsGOD00hJeaUE+6HOI8PYPttvFpKQDEYW4aN+JLZl9qfH2EX3bKQp6qCJ46md1zmUfLZzRr8CwOpXDw8ojdpzyzhUvOiiCO1lDELYto6slRQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 14:00:56 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:00:56 +0000
Message-ID: <7a85444b-ef51-4f24-ae37-897388c727a0@cherry.de>
Date: Tue, 11 Aug 2026 16:00:54 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de>
 <20260811134138.169378-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260811134138.169378-1-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bceb4c-8a8e-46d2-1a32-08def7b0f6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: hw3i4hoCt1lsaP/Vb7KjvdcAQSXOQf4kFXlSN2sOsQEoMgUSs9CMwMoU8ozWg33awMGPqQyTQe+C4KjXb8/8HiIhxDmrgHzGdNSW16ADAQqLTfOrplmuMEsNlSLfPDIRBwOb8Zl5wSc6PenIP56jkizJKIZt8gMNUUOmGFGl4fH6nh50dQ9n0xWE1d6hBmzeh7HHyfRiDm9i8ieKUm2OFmdkVEW8H3ravxyucuOzMURpIXvtjBdxHDJivWORgDZZgC+St+6l+MGoaLyCLE549HIdvr0uN7nPvEuq8W0PFfR11Sp5qOZp/7gWt+RzNo5oCh9k/n3CFk+dQSM4hdp3aosr+fedS+WsFIUAwsRibq399YC7azooqaS4dmqJbyhZhF49ISvTd5se5Ldi+FsdEAp5c7E5oB5ynr+NCA5tSENY86g9JyRh6spZEL6jNL3zKOXjOsfQUqi6+1Jq4tV4u9UhTwwxuTGNRAH16vqgzcIFIHaaCkJRt12c5aaEvRTGioTCKpN9FJwwIbv5LrdDJEolc2UabkbcjLzX9gQfYajWVEKbHcWEzruuAZa/jto0kW/BCyrXX2JX35JaKgIRNxJnA4gvIxolyh7wWwwjfjc1Z81fKNkocBmjxFsgK4b19COGYng2YrP7rMVJzhMoPFSPcbb5T0FfGIWgBczoTLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmwzdThGWnJNZHdVTEdwOGpjWk44MTFwSUg0SExpRDdGVXJqMzNzVHB1MXVq?=
 =?utf-8?B?WGV3NTdxWTEreFh5Y0pzTDIwZWN0ekRoaFpuR0tHeEFKNDZsdVBkM09kaWtz?=
 =?utf-8?B?QkNlMStuTGxueC96VjBYZmdUOXo4ckhmanA5ZzFDMXE4V3k1TnAwVE1WdGRE?=
 =?utf-8?B?VkcwN0NnZE1OSlBic1JoUytEU21oVm1VUHpTRVQzVDg2TWwyMVowL3l5Q1Rr?=
 =?utf-8?B?dHhpN3hRb1NUZ2FtYzRJQno2R1YwZFpuM29SRXdpQUJLbVVkU2tNRFhqWWlN?=
 =?utf-8?B?UmJObkpTNUM0eElXK05SOXBya0J2bVlIQkNYaFFPakVLUzE2eUo4aGNWSktC?=
 =?utf-8?B?a2lGQ0d4Rkt0allEd0hkdDA4eWhWUWNRenRIV3hlZi9CS05vQWpIVnB0TjhJ?=
 =?utf-8?B?eGVFY2pRazUxUlc1aHVEc3krVFNmaU5ZbGo1UFVwQ3d2SWtySER5ZHVMcTU4?=
 =?utf-8?B?OStpZXhkRXc0TjVhM25lL0kvSEtEbGM1Z2MwK0ZsdHFidzdYTDk2Qm1ENEhD?=
 =?utf-8?B?azl6OXNubWkwZFV0c3M2TEJKS1RSUnJIY2dacG5sT2xSOXFLWGZQK1Y5RkFP?=
 =?utf-8?B?bzJUR3lkNkxqNU9CYjRRRHluSy9pNGwvZStkcU5GdlM0MmQyRTY1N0RIM1hF?=
 =?utf-8?B?Nmk5aTYrYkh5RHJkYXJwTVJnNWpMN0ZRckk1TXU2emhqR0U2ZDRVenlxdm5z?=
 =?utf-8?B?d3AveEh0UTlWb3Q1VG9LWkdqTDRvTDRyWXkwbWtEdS9qc3VUUnZXMk1ScS9N?=
 =?utf-8?B?dFZvM242WVpZU2FqNEw2UnVLdFFqQythTEdSckFRSkZUdEpDQzVTSks5YXVn?=
 =?utf-8?B?cFhadDRzSGxBeStkcWs3L1Y1d3FFLzdmZWJ5V0M1ZDZhdVlWMlpuMjVod20v?=
 =?utf-8?B?ckM3c3N2RkFpRE1UUXkzYktFbk9iKzdLNWk1UmE1NzlEZzVXeTU0aFZ6UXFt?=
 =?utf-8?B?VmpHbjFtNWJFQXJHL2FuY0FESm9SSFp1am9jNnZ6bmN1UFdwdHFTcUF1MW9F?=
 =?utf-8?B?OWdpb3pzTHFJZ2swV3NndjBXM003V0pIbm02MGJFTlJEMmtOZHVYbzdiWXp4?=
 =?utf-8?B?cnhLSGJYUVJQL3J3L3E5VTM5a2dieFN2REhKM0lqejdTTlZUTFpwbUVJUUpx?=
 =?utf-8?B?aThUSkM4d0VOam5kMTd4USt5Z3JOK1BrbmErMkdPM0hKR0FnVzFpMVZPd3kz?=
 =?utf-8?B?cW10cTduejN1Zk56MWNSRXVYM1FzY3Rhc2VLYUs0dlRHUEJ2Uk9OL0RwV0F2?=
 =?utf-8?B?eSsxKzlLNmhiUnc2c1RXbzQ0VDJkMWxodFBUQVhHcGthbmVITEh0eFg2N2Nu?=
 =?utf-8?B?VzFDYzNGV3JNdkdBSUlhODk0eC9wSFgwNjZhSzdaQllhbmI3d3pBVlhVdUpp?=
 =?utf-8?B?ZTIxTkh0aytuc29yTEx2NjBsZDlpQngvOVlSM2lidVZFczVBR0tzOWw1akNu?=
 =?utf-8?B?NnYxcU1JamdrdU9vSlZzT0JkQzYxNjZXbldpWVpSbmY1dkxwRHd6RjFndWhP?=
 =?utf-8?B?U0pHZE0rd3drMjRIVERYM0hoVFF4UmZzTDVrb0JqSUpwcDVyeGtkTXNNU211?=
 =?utf-8?B?MTVzMXJ0WXdXYzcrUmtEcStvcWk0RkdFcnhoY21LK3lidjNCb2RLRUM1UFQ0?=
 =?utf-8?B?QmZveW5PMmlMV0w1bmtSQjY2eExFb0I5ZXl6akltcjFuclZQbnY1NTQ3d082?=
 =?utf-8?B?emt6djlpM2dXUEhwU3VtczFmNitaWXNRaUZqNmRJOXlwOXRtOHY2a3FFYjNh?=
 =?utf-8?B?UVFYYjJnRFpjdXlVc2FjdGVIb3hsMk1Sc0JHMGplVmYxcGoyMFpUOHNuc0Ex?=
 =?utf-8?B?OXlzM1RITzVzNVpHaTB6dDlZcGxDMGMvNnp4WmR2VHkwOFhXQnJEbE5hOEoz?=
 =?utf-8?B?b1VabVcweU4xTXcwVzYyeC9rd29yV1hHZWxsSjJjbCtyVXFuZ1ltUUxZR3c0?=
 =?utf-8?B?WGNDOFdZeFNsQXNFVlZXQzFXRGpka0Joa2o1V3Y0SS9lZ2hvV29VZitLVXgv?=
 =?utf-8?B?bjlPbzh0WEhpbFREdFZiSFlTK2NGVERpcGN0VVVnKzF4K1ZjQUNicE5xSUdL?=
 =?utf-8?B?eTdMLzM2d1F6bFoweElYcERHNXRiUVU4eTJxQ1JUMjdVYUFveVo1RVM1L2tk?=
 =?utf-8?B?aTlGQkF0bDhScXZBckhpSlRNVWQrZnZQNS9UQVdIZTcxb0dwTSszLzlPeW9q?=
 =?utf-8?B?dmVHdmh4b0p4Z3FKUldETEFBa3BsaDg5OUVGcG52L29VVlZ0Zlp6a2dTSXNE?=
 =?utf-8?B?a3RPZ3dhVHNVeTZKbzArVUlNK2JLSUtUVFFOYW1PQXdMRzBGSmdZZnFlM1FW?=
 =?utf-8?B?WjNrVEhqMndtNFVjZ0NITDNxdDdoMVYzd3NVZFFVYTIyT2cxMzY4NzdyYXdS?=
 =?utf-8?Q?QLCWntmiECQjqXnsYMAoUIlKwNep1EwuueeizAnikWsH8?=
X-MS-Exchange-AntiSpam-MessageData-1: IuPl4kTzblX6R6s53PZmpxuAYWQWosyFvY8=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bceb4c-8a8e-46d2-1a32-08def7b0f6ad
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:00:55.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+wiJ5Xy6NsTgJmjxPPfG6HT6mXytbKrkUBoUIy9Td8LKzhUMpCdMwC6ia2Cy8P4rWPWwakY/0TrGynWawbAaueclqRc487UVr9P1hYQHYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5y5eQNRFD+fpAjyMajaW9ftsmsZM4bTWh5MpSvPyVA=;
 b=QvoiirCC1QCS/3SsfSXyM3gUxKHU9hwbOKZhd6CiyAJLI5b9aR2g9VKkDN4TJkj1MQZ5XVCXCaIzdzp4qjp+DkpOIHsUp/Gzb0XY0ACwGbBQOpXXP+F2k8OGPOOb9s9BX9EYR3DoXMRCwM2oCKhQZ9MydG3+PPdrvfItqLv3hcY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=QvoiirCC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v2] docs/website: link LTS tooling
 documentation and staging branch
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

Hi Thomas,

On 8/11/26 3:41 PM, Thomas Perale wrote:
> Hello,
> 
> In reply of:
>> Hi Thomas,
>>
>> On 8/11/26 2:26 PM, Thomas Perale wrote:
>>> Users asked where the notes are available and if the information are
>>> publicly available.
>>>> Those changes clearly explain the location and convention of the staging
>>> branches and also link to more documentation on how to read the
>>> annotations.
>>>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>>> ---
>>> v1 -> v2: took into account review from https://lore.kernel.org/r/<f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de>
>>
>> Please don't forget to remove the <> otherwise it's not a valid link.
>>
>>> ---
>>>    docs/website/lts.html | 29 +++++++++++++++++++----------
>>>    1 file changed, 19 insertions(+), 10 deletions(-)
>>>> diff --git a/docs/website/lts.html b/docs/website/lts.html
>>> index 3bfd2a4374..7513acc885 100644
>>> --- a/docs/website/lts.html
>>> +++ b/docs/website/lts.html
>>> @@ -166,10 +166,6 @@
>>>        <br/>
>>>        <br/>
>>>    > -    <p>
>>> -    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
>>> -    </p>
>>> -
>>>        <div id="organization" class="br-lts-section-header">
>>>            <div class="br-lts-bg-grid"></div>
>>>            <div class="br-lts-title-box">How we work</div>
>>> @@ -181,12 +177,25 @@
>>>        analyze based on the previous week's commits to the master branch. The
>>>        commits are then annotated to define a list of candidates for the LTS
>>>        branches.
>>> -    <br><br>
>>> -    On Thursday, the candidates are cherry-picked to a staging branch to be
>>> -    reviewed by the other maintainers. On Thursday evening the branch is
>>> -    synced with upstream and contributors are notified. Feedback from
>>> -    users, sponsors and autobuilders are then collected and vulnerability
>>> -    analyses updated.
>>> +    </p>
>>> +
>>> +    <p>
>>> +    On Thursday, the candidates are cherry-picked to a staging branch hosted on
>>> +    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
>>> +    Every maintained branch has a staging branch, with the <code>.x</code>
>>> +    suffix replaced by <code>.pre</code>. The staging branch allows other
>>> +    maintainers to review the changes before they are pushed upstream.
>>> +    </p>
>>> +
>>> +    <p>
>>> +    On Thursday evening, the branch is synced with upstream and contributors
>>
>> Which timezone :)
>>
>> We don't need to be precise, so I think something like "Europe time" would be precise enough for that purpose.
> 
> To be honest the main takeaway should be: "It will be synced by the end of the
> week". The Thursday evening mention came from when Arnout was syncing and no
> longer really apply today.
> 
> I will change to a more vague timing instead.
> 

Works for me, thanks for the clarification.

>> I appreciate the "synced" term comes from https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md#syncing-pre-and-x-branches and is clear to you, but it isn't for me, I read this as the equivalent of rebasing 2025.02.pre on top of 2025.02.x in case there were other patches pushed since 2025.02.pre branched off 2025.02.x (typical workflow if you have multiple maintainers with merge requests to a single branch).
>> I also see it being used in the graph in "How we work". The only important part to the user I believe is that the .pre branch is pushed to the .x upstream branch (and because it's pushed, a mail per new commit is sent on the mailing list). Unlike the kernel and Yocto stable branch workflows, I seem to have understood that patches in Buildroot are directly merged to the stable branch(es), without prior public notice on the mailing list (except if they were initially posted on the mailing list, by other contributors). Is that correct?
> 
> Correct.
> 
>> If so, I suggest to simply reword "sync[ed] with upstream [branch]" with "push[ed] to upstream [branch]". What do you think?
> 
> Yes, let's change it to 'push'. Match the git terminology better.
> 

Great!

>>
>>> +    are notified. Feedbacks from users, sponsors and autobuilders are then
>>> +    collected and vulnerability analyses updated.
>>
>> Feedback is not countable, no trailing s.
>>
>> Also, I'm not sure what I'm supposed to understand from this sentence. What do you do with feedback from users, sponsors and autobuilders? Are they visible somewhere? Is this what's reported in e.g. https://lore.kernel.org/buildroot/6a545c29.87c5160c.35d6c8.0d2e@mx.google.com/?
> 
> Feedback from users are email reaction if a cherry pick landed on a branch it
> should not by mistake or a commit was not cherry picked and the user ask the
> reason.

Ok, not sure it's worth being mentioned as that's typical workflow? If a 
commit that shouldn't have been merged to master gets merged, I'm also 
assuming people will complain and/or send a revert? Since it's pushed to 
the stable branch already, there isn't much they can do to "cancel" this 
that differs from what's happening in master.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
