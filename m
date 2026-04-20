Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99970F557F0
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 09:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3DA40514;
	Mon, 20 Apr 2026 09:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdMtl1i2zNVs; Mon, 20 Apr 2026 09:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684594052F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776676513;
	bh=jFtA+wuc8xRUB+tqco8j+JACQc/S4WGPNbt94i32aIg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IOLu01xyAWx8ngjoV3ZNMNeylN2vE5Qx0TSJvOcOzMSHlMAt7h43FgTLW0ql62nO7
	 oO8GUv/Sn2gCB6Mf4toPhliyaYJnOdvREbXiZZgNWwjieojZV05jtwEJoE3jczP1Jr
	 eHPTqswdhB9J1QGm9NvwwHCjRTVzKiGh6rlOYNW/gr5GAjVf6HcGeXZq1FA7Le3vS8
	 zFlmkw4GaVkVKkLr0rXmEPfPhVGQrTgkPPk7MlT5G4IrNL0BuxNQILq5FIU4ZsdMBR
	 LJbbzTgl/rpG6vv46HVoGZM+TtAuNOeOq+xLSEiAGmc8YRurXTqSoZyuNApJfyCZHL
	 o4nxsLBUD+kkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684594052F;
	Mon, 20 Apr 2026 09:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C9E355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2AEE80765
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S1B8EvJ9vs6 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 09:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=jan.kiszka@siemens.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63F0480738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F0480738
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F0480738
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS14jQ/uD6YAl0I1YrO/j3LTIOxs/nGd/XTu9rc6T0Joklu5VBLcGHeFBc1Mq+fziabe0oZ57F8f0rfgDPmDxTA/KZlulwv11glReqkZO6xcyWXdZEU1ichEh3WS7jTb5eEofOxTRsaTvdPEQLlps2AwUmnY8wlN9ffKm0jgHes9/4iD9gv02pC0hMpyPmNq0n092jVV7HkWHYutCTtjZG+6qscToZZkhYRGkdv5av4nNak8uZEulZf33yzXdyX5++wMds97gq86XHBhBsWyNPslvFCfWGLRZX29etM5FASrF5EZScMIi/bZ0bZZ9HfrrJ1mjc5X5BXlLByPMLaQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6ejh4vUqD5FnbX14+iuogTrREhGqTf09lXHZUYYprY=;
 b=lJUCVssnZF+fz1upl7j0Ixl2o1KH6DUC8P2Ak0scl9lnUEd+3j+IxUiuIbmJBom57eUUU4giJhu41uxIZNhKcCAtrFaIebv0DqiBWANgp8Gio4qw7R9bKvmynUE9TZeqrGwH5/x7518tHIlS9LbK2XGaVZzbMAW19KKqtee7iCmLLjtjHNUgjEBpp9zMLun/a0yGUyTY1Po/JnfyzXQQo+UTduXn+APM0U84xxe0uC6uESSG1UaKYYiCACx8CCBNPJZIMAj4+2kgso1RWg63vKi0Lp8Qwn2SgpoG7+MlYVZTuhdPao4EOdkgf2UUo9UtwEtcK44Z/cXPrprLlnT3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB5234.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 09:15:04 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%3]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 09:15:04 +0000
Message-ID: <fb2827a1-bd08-49a1-a52b-b4f5dc8aa881@siemens.com>
Date: Mon, 20 Apr 2026 11:15:01 +0200
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <obbardc@gmail.com>, buildroot@buildroot.org
References: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
X-ClientProxiedBy: FR4P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::20) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 70381611-f40f-4d92-3ffa-08de9ebd4ee1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 9FDl3st79z3Ec7e9U60CQ+IZh5/5lPCG9o/7oApJI4wcX9RXVv9PgY/WSnew14rOpFIw/FfgNqO9EFGJ+MYUbDiquc58tPVm0dArt9vBbg2AoYYEjTsIjQuH7vd4BsFjRlSx7jeBwCyD/38bEu+K+4De2XO9dhD65S5DAjBkJunaa5ztjcJIIvujh7N84X+ed3LinmjXIcEMgq5TsniY5iK1w3p7ill/EEeWaYEX2iSzxGprgcmSDV09wt2/MQcXvuGiwAlm0SduZBs7aLtpPcO7hBJ704nySMPUOgIYc3pY/aYZmf2xECYh3lT3Dni3AJFLOW0qlsgmlQ/fq5thgEVxg1ytEwIUoH/n26fl65aLtUNufbSoLEoulUgopyo6g624J4IMhvXcEve2PxDewv+ZvLEH8dpI1FBGlLOZcY9WsZrprs1qiag7NaSudeeqyCb5TRq8Il0TcUm4SsFUfNSgzr428j99jiVUrmu3KTYzqKXBVRAt2E6Vce0Va97kdE+r2liCds3Kozl5xQ3blIVGeDxVsKu15xcp4ZipOQA7Q1dX7cmxB1sowc6ZzWSj5CS2zV1fdLgKyrsYTEzYbXPUQJrnSP3FRNIJYYKDJ8NW1RrWtOxbvNoW5lphkZHq7QYYvlcHnVnh2wSKncO1vTWVnkyaSjDbY4k2bjJ8sABDtELQ+JbDoxIkdL6sc6XnoUvO3+fK0g34qbApSgATdDW/5Ax8r+zCE1ChdOTXqdI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(55112099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTM4THZwb3FQRk1sNmM2MjNlbnBJQ2xVTU1kQWpIaThaK1NVeGorL0JCVU8r?=
 =?utf-8?B?MlF0UHVRclI0SC94YlBKRWhmb3BHdm9GRzZyV041WHNHVTBVenlWL0ZjV2Vu?=
 =?utf-8?B?bFJHamY2L1d3VHBoL1lRRFh4Z3pJYW1mOEdVYnpkMThINVVoZ3FZYjQ4eHlu?=
 =?utf-8?B?VnE3NjlseWFyc3djYThyWkZELzRGQWxhVnF1VnlDRTBDSjdzNHNadEVxdjZw?=
 =?utf-8?B?U3JoN2tDN0puUS9FY2pyWjE5dFlZbmxybmVZRnRTczQxbklIc0NFa1QwZlgy?=
 =?utf-8?B?NFVJd3BzMG1SR2FmeE9nMjFab05rRFVjRExyVTdtaVA3QXRNT01wMy94NENQ?=
 =?utf-8?B?aFp1a1loSFNyOUJlRURyQ2ZLazUxalRmbXBieDd0MGsyMldTbVFuYmEyWU9r?=
 =?utf-8?B?eDFXekxiN1JDNnM2aWIzdWxSMGJoOFlNZUNlbnhKeG80aVhRU2ZLNmNERFpZ?=
 =?utf-8?B?M3p5U1pmaUVmZXVrNC95YStVU2VlYzRuSTVlamNJS1loTDltc2hoUnVaaHhw?=
 =?utf-8?B?QmhUNE1uNmlWUnJiZzBaVld4ajdSVlREYmJwL09MN0NwRFJmV0dxLy9kYzJC?=
 =?utf-8?B?QjRZMzdzUVlTVnh2L2VlS0c4OHUzUW9tTmdJTEJGZjZHNUN0MGdqKzFSZ0Qy?=
 =?utf-8?B?RS9hV2JFUWJ6ekhrTDc0OXdVa0Z0Qit3Z1dxQUJjWXVHRnF5VnUwOUJMbDBE?=
 =?utf-8?B?OHVlbWY5M0NzTlJPclF4Vyt4UWp5N1gxV1B6bFYrUitsdENKOW53amlQY0U1?=
 =?utf-8?B?YzJJb0lqaDVwZFd2YmZ3cHBJTjZ0aXdRd0RHWVZtSGRmL21pYkZWRFoySXg3?=
 =?utf-8?B?QXF1dG4zWFFEd3NLclkrREpGRGZHaGhwMGxxSzAyWWlhMUhaZVMwdGE2alF5?=
 =?utf-8?B?dU9vZmFraGtsQ292TTJPUUxDWDhvZXhDaVNKLzRyeC9hWkxtcTFod0Y2eXps?=
 =?utf-8?B?SXh0Zm1vdWs4RjQ1WGFOS0srZllpOHZIOWdvZE56eE9iWDZWQ0hENzg3UzNZ?=
 =?utf-8?B?eWN0NGl6a2lLNjBoTlp0Y2M0Wlo3Q1ArZUsxeHJjV0pIOXZvZ3JaU2VrblA5?=
 =?utf-8?B?UjZkaE5lTld2aTEzbGJLNS9MbDdYbEZlckxMdTVweHp2RG9pWElNYWYzYmVJ?=
 =?utf-8?B?dys1dXY0RjB2OFZwdUJRMklid0NYM0lha0ptZHUwTGZvbUt4ZGJxNXI3aDNO?=
 =?utf-8?B?N2tPZ1NhWmVnZXQxeVhvbWxLVzF3UFpTOTc5Zm1FTWRlQTZRVnJCbFM3aGVh?=
 =?utf-8?B?SkZvQjZiVkIzOXdheXIwZzQ5enk2ek9aNVJHRHA2UHQxM3R1ZEF5OHpLcm8y?=
 =?utf-8?B?V1N3S1ZWU2szKzZsbEUvUnFxSGdVTnVxYksyQUF1a1poVWhXTXJVWG02Q2JN?=
 =?utf-8?B?dnVWNHB6TkVFdU9BenNMcmtMeUtIdUZ2VGV4aWhmbm9yMjNKdFVOQ2JlUW93?=
 =?utf-8?B?NTRFVU5aY0RaT0F5UncxYmFtWXZ2R2llaExTUDdidTZJemI1SVN6a1RtUmp5?=
 =?utf-8?B?SFBZZHpCWHRESmVWMVBJVkxkUmNJeTdTSjlXeHFzUWVoYVpzMWwrUGZJT0dG?=
 =?utf-8?B?TEhORFoyYy94TmJydTRCTFBmaEZWRzA4TDhhYVZYWDJMalppbEg3Qm0zRk5B?=
 =?utf-8?B?T3pDQ2JGai9hTDZueXFXUDkvK2k3dUU1bDhFVmYzdjZrNmJnZjN5QlhtVDJv?=
 =?utf-8?B?ZEVnNEZuVFdqMDhHbk45NHBacmVPa2hWUmY5UGhFbTVoREk4eHNnYk1JcVFC?=
 =?utf-8?B?ZFg0ZHJBa0U4UGYxdFlwKzROaGh1NEpmWE5lUmU5TkNzSllpeXdNc0svS3RT?=
 =?utf-8?B?V0ZlMTdBdllLOXlENCtZRHdHdVRveDE2S1BKTkMrNU9ZS3NsSTYzbjhXZ3VB?=
 =?utf-8?B?ZGJqc1N5NXNDZVNBbDBISjFPQ054ejJpMUVpWjUyYTVMY0EraSthUVFybHdZ?=
 =?utf-8?B?ZlVDQVJtYW1lampYZkR3OHp1bUppNEZiakdvRVg0ZTRoeTl5QjZVUVJmQ0Nu?=
 =?utf-8?B?cThNakpyVWdFYXNCN3MvSXowSEt1S2lkd1EwMVl6QWloT2t3YW03TFZ3TTVH?=
 =?utf-8?B?aEJicXIyZmp4eFQ1V25BTFhOSE9QL1lLczIreDZvM3IvTmt3dUw4TFc4SmdC?=
 =?utf-8?B?aXdoSmRuajc1MzV4TTIwM2hTYnFGR3N2Y2VtSW1JbVpmdkQvUEtKOHBoT3V5?=
 =?utf-8?B?eFZqcFAxWFNDVFo2ZDByYmlUalUxT3FmWnZMWjNEaktsN2lzSWozY2lnRWk2?=
 =?utf-8?B?SU5yUm54dTVyNndyMVRMZFlrNThTSWdqa2dDVmNkWkN0OG9aSGdZQ1pXRnZh?=
 =?utf-8?B?REZ2ZUtiUWRZTUR2OFdsbElNakhHTTRrQXc3bSs1UEVTSW42bDgrQT09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70381611-f40f-4d92-3ffa-08de9ebd4ee1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 09:15:04.4145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWCTbjSK6z6LRJecdogLNJBcDHYBu7aB83UIYt4M1MlzmjMIgbM1o20h7d5obRtFVnd3HRJNA7xpcwLeJjcE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5234
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6ejh4vUqD5FnbX14+iuogTrREhGqTf09lXHZUYYprY=;
 b=TzgRfsVvbKRF+QJdyM2H/PHV7kuNZ2pR8D8vefB0uAru9RDkplNh6kjr2HGwvdp20EZXyX/LkM0/DrSmqfNRpISjMozga4XVO7HDwwkO8xvr1fzyEKJXcE7Q/0/XYmA+OCNrmyzZdW2gYibm+6ZI/D1zbUveVnTDEP1Y1QTFFvo/0t2dRJK17PiS8SCbS9X0k6SKqU4rJyWqG7F9bvP7lNZdFZ2gZ6wSTSwz4/TgMzzHFy1TRuyrFnA1bs6fGoJhdU8NY/H+NXv8bHeyy9uYvohkzxQpE/SS51GrVmq1M5IKw96tHFIIumG4ygmdlGYIYHcrwvQY5t1Fu+CVhPK2SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=siemens.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256
 header.s=selector2 header.b=TzgRfsVv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Subject: Re: [Buildroot] [PATCH v2 0/2] Add efibootguard bootloader package
 & example recipe
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
From: Jan Kiszka via buildroot <buildroot@buildroot.org>
Reply-To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19.04.26 02:20, Christopher Obbard wrote:
> This patch series adds support for the efibootguard bootloader
> (https://github.com/siemens/efibootguard) to buildroot. efibootguard
> can be useful when designing systems using A/B slot-based upgrades.
> 
> The first patch introduces the efibootguard bootloader package which
> builds the EFI application, user-space applications and host
> applications.
> 
> The second patch adds an example recipe which demonstrates how to use
> efibootguard in a typical EFI boot scenario. This may serve as a
> reference for users looking to integrate efibootguard into their system.
> 
> efibootguard can be built for multiple architectures, but for now this
> patch series only builds for x86_64 (since that was what the project I
> added efibootguard to used). Support for additional architectures
> (including arm, aarch64 and riscv) will come in future follow-up patches.
> I expect to do that once this series has been merged.
> 
> The example recipe has been boot-tested on QEMU with OVMF firmware and
> I have confirmed the image boots & runs as expected.
> 
> Feedback welcome!

Thanks for the recipes! Beside other archs, UKI and secure boot aren't
in scope for this version either, right?

Jan

> 
> Signed-off-by: Christopher Obbard <obbardc@gmail.com>
> ---
> Changes in v2:
> - Rebase on top of buildroot 2026.02
> - Update efibootguard to v0.22
> - Link to v1: https://lore.kernel.org/r/20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com
> 
> ---
> Christopher Obbard (2):
>       boot/efibootguard: new boot package
>       board/pc-efibootguard: add example efibootguard recipe
> 
>  DEVELOPERS                                   |  5 +++
>  board/pc-efibootguard/genimage.cfg           | 59 +++++++++++++++++++++++++++
>  board/pc-efibootguard/linux-efistub.fragment |  4 ++
>  board/pc-efibootguard/post-build.sh          | 35 ++++++++++++++++
>  board/pc-efibootguard/post-image.sh          |  7 ++++
>  board/pc-efibootguard/readme.txt             | 30 ++++++++++++++
>  board/pc-efibootguard/run-image-qemu.sh      |  9 +++++
>  boot/Config.in                               |  2 +
>  boot/efibootguard/Config.in                  | 37 +++++++++++++++++
>  boot/efibootguard/Config.in.host             |  8 ++++
>  boot/efibootguard/efibootguard.hash          |  3 ++
>  boot/efibootguard/efibootguard.mk            | 60 ++++++++++++++++++++++++++++
>  configs/pc_x86_64_efibootguard_defconfig     | 51 +++++++++++++++++++++++
>  13 files changed, 310 insertions(+)
> ---
> base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
> change-id: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd
> 
> Best regards,

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
