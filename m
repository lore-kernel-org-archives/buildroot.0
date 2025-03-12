Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D9C28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 09:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D509824EF;
	Wed, 12 Mar 2025 09:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhM7_okWKI2C; Wed, 12 Mar 2025 09:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBDA8206C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBDA8206C;
	Wed, 12 Mar 2025 09:51:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8AAB1C8
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 09:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C5AB60C0A
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 09:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FY-ldIj71jyE for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 09:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260e::623;
 helo=eur03-am7-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29DFB606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DFB606CC
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29DFB606CC
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 09:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZe8YNs/0xjz4oZwKfnIi/vzF3GUw5QkZpKkPxfpPZ1qJSPAQOS5o5qwMSwGaag/79bPTOdRT4datlNMU8sp/3OtFHutUErCwpyJY8pOLKARqXk5MU+JFlTCCs7vfSVPhANnQfjTB1sWo38J1BgZAoWVbmdzMCC6GjQyO4VbrJpU2FRVXO8elvvBSbYCS5R4URFR2CFI1PxysRNbd2zFPwJWGB5RCXrvfVxV0rDyWj4D/Mh745Ora9eJmjy9SapZZwQoeC/hVZ5WOUQR88RQcLFppP4EHsAl2OGtKUCJyjVcG9vA3ZThcT659yE3oY8glYZEyN9vBvg7JPi6wpzfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta4iVBhftJT5zjuLd4efWX0m96ieL/y5jVeYEzltRu4=;
 b=WDOqD2ykWwxhqbbTui8TXMOAP7SoQw1RMqZHuVtDCvTKJ17clQ1sOTJYj7jPiKxpyYdH7knfq7J1ZDPxTJBLbTD1B1PSzGKojk2KaOiHFQ3dw/POHY1Q0txi4266yGidG9iwvRePb5cfgrz8shaUH6JjKBfPnqWCs20GZHwOJ10RwjOqeOhjCjiAr0GbKhhrliP0PiCKUAG4yEmB6G+7BbP7I0W9FRqrudgn1HBuwNV9hGvxGSBssGWYnKMPfeZ38j+isYVX1zpgwE/esQB5iR6VLwau5yFIbJafGF0jjVZLfVjiugmUlIRMZAK6dy5UbbT36R4aPifmSnd+OTKTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 09:51:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:51:33 +0000
Message-ID: <6f910801-f085-4a78-a9f9-8bf36cd87148@cherry.de>
Date: Wed, 12 Mar 2025 10:51:32 +0100
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de>
 <87ldtbfn7p.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87ldtbfn7p.fsf@dell.be.48ers.dk>
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e390bcc-6a00-421e-1be8-08dd614b78df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkQ2L0NJekxHcVJJUkRBQUdycTJLaEo3cEdXTHhQaFB1d2lVZkxIOGM0NTFk?=
 =?utf-8?B?QkhlRnYyVkdnUlRjYWZTcVZLK29BbHNCQWl3UEZkRUI2c0lMU0JMbUg1QnpM?=
 =?utf-8?B?NlVTaW5vWEU3ZTZTeGY0bnR2ak1yZDN3ODRSaFE0eVBOTTIrbDJqZzhCNklO?=
 =?utf-8?B?VTFXQkd4VHcrRU93dGE1WXB3WkFMeElRT3dEYmVWWXdxb25aTjVTUWFGS1ZN?=
 =?utf-8?B?a1pJUUtyS3IwVjZTY3JtVzlVMmJlcGhFUG0yZ2MyWXdUMjlveDBRK2FTekdx?=
 =?utf-8?B?VXI1dFVsQTVpNlZzRkFXUFdLMnNzK0JpMXp1SXdqbkZwbU12cVhFbU9laTdx?=
 =?utf-8?B?NzlBeFg1eVprOGZlcFpIMnBkeWRDdnV6eTlrZFpMRExmTjNSdG5idDdmVkF4?=
 =?utf-8?B?dFRxZm4yaEhjTjd0Uytoa3lTYXBVckF3MUx3ZFdRL0VVYi9wVjFIQjZqd3g5?=
 =?utf-8?B?akFFZlc4aU11RWFGT0xuc0VxY2pEdWxhYW9uT0dmMWk2NEdyWG5LYnpWVTVE?=
 =?utf-8?B?KytKSHR6V3V5Wkk2STZKRndEczRxRWtXVXN4M3NmRFQxU3JXNEkvUmJNTHV6?=
 =?utf-8?B?cVl2MldxUDhGR2JFWWhFNlhzL2Y1YUxKdnR3UG51bGJXVG01b3pXSGNOai9C?=
 =?utf-8?B?dzA4bHRYQ1ZiTnFORC9OUkp4MFkwZG42NmpOelpxMXBXblhlL3lKVzNKVGw5?=
 =?utf-8?B?LzZuTk1VNnZ5NlJ5MUNnOUdDTDN0QmRZTE8wNENqWEVleTBoek8zNWEyL0I1?=
 =?utf-8?B?U0FuMlFNYTVMVWlHdGl0eThiMzl3TFp4alFWSVVGZ0NNaGNKMS82d1Y4M3dn?=
 =?utf-8?B?OWZyNXpYSjhHMlJIMTBSZ2tEL0o2bjlOVUxOZGpTUm9YOHkySTBjT052Q2to?=
 =?utf-8?B?eUFURmJDeE0rUXhsaWVMbWtUb3VkSStMd3g5aytvelQ5b2IvV3I4YTdlMVYx?=
 =?utf-8?B?L2tOdnlJYW0rd0JMTkh5UmxGbTlSdzAzSmZmMytzWTUzSnBseUZHR0UycVRz?=
 =?utf-8?B?QW9JN2dJNjFoZlgvSnF1NHM2WWh5ZmIxQU1OUXZJVlJWNCtrT05vbXYyOWxH?=
 =?utf-8?B?NEtZTXUza0pkSFR6RDNBRkxaMjdJYlpCMFQzZE96RVB6MUhJdCtYQjJGQmw5?=
 =?utf-8?B?dUY0aElpWkZhWkdLb2tYOUk3UVpwUmdzOXEwT01MWUdGUm41Q1VyUld5ZEp6?=
 =?utf-8?B?R1BUSDh4cTZNV2I3eG1YWHVIZ29nNitORWxMb0p5c05DS09aVDF2Ukl3OXJw?=
 =?utf-8?B?M3ZHV09XRWhUbWxMY2paZWJjR3FSNkZiV21UMnBubms0NzZxUnBDRHFzM1Bv?=
 =?utf-8?B?OFhiS01SRE5MMTlXOUNjNGNiUDZhZE9UclFKZDBjNFdnSmt6T1NhMTcxcEpl?=
 =?utf-8?B?eHNmR2NGU3oxMnc5QVFYck5ZWEtrNUllL3U5TDRmZWt4aFdMbkxSZDVWbWVI?=
 =?utf-8?B?WHhzZXhDaTdLQVMwdTFSM1gxcU9va3l5Znp2YUcySUFjcGdPbTdIQW0vSWlI?=
 =?utf-8?B?WDc4Tko4ZG4vNnRsWExweTBTMWVLanA1dkh0MWVNaXBXRG5pbjdIZklyaG1O?=
 =?utf-8?B?clMrS3VGa0FPVEJCZ08yOGlydk9SREF3YTZSYzBWZEQ0NXJESDFJV3lkOXlC?=
 =?utf-8?B?RmoydW1jQ0lidzYzeU1pRjIwVktVR2xjNXdIWVdCdHBPNGlmczRSTjBRS21C?=
 =?utf-8?B?MFpwNFQ2ajljL1pTRVJpK3FrczM1bVQrb1l6SkJzdDE4M3hvQlZ6NVNBaG9T?=
 =?utf-8?B?Q2VFSXo5cE1SVFprUWFLQkVPQlpXeDdNVE1LRDFIaU8vMEJZQmg2N3RUL1Bi?=
 =?utf-8?B?RXJ0MlY1NlRIbHJ0YVVPQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlE4d1BnODFIeVIzcjR2dlZockFyN0NydjZJZHJFTTY1NUNkN0U3OTB6eFBV?=
 =?utf-8?B?WUhMNlpVdzVxWGdFSkd6WEE4QzhlR2dzZDExeHRnZEMyY1dHaGhSTGRmQlRi?=
 =?utf-8?B?bUpDQjg2aEdkbE5IRnFjdkpHOTE3VmNGa1NsbktmOFN1dldXWTBYaGhjemU1?=
 =?utf-8?B?RHFURWxGNk8yclkyaTVRajk2RGRQREJoY3pUZC9DemczSzhTTFZzdCsyYUgr?=
 =?utf-8?B?dk5pZVJHQytCc3ZaQ0FsZk1KQmtaMHg3RVlDRUdQQk9yaC9MekFlR0FhYWdu?=
 =?utf-8?B?QXZDc0VlRFFtTWxka0dsbVkzWkVzbUJDMGZCT2tOcVZuZzQ5TGpCTmQ3K3hE?=
 =?utf-8?B?aHRWRktYUUNkS2tsbEJlZCtEWlB5Wnh4am9NNzBFVWFxRUhyK0pxNk4xZllL?=
 =?utf-8?B?RjNGeXBLK1dHN0w4NjBZUlBVNC9QMEdyMitYUVdnUXFldEhxT3BUdVRXMWxy?=
 =?utf-8?B?Rmd2NS85VWM3cEp6RUxuUy95SVJ4OTlNQkQ2K01IZFdjTUM2d0FEdDN3TG9N?=
 =?utf-8?B?UFpxOUFpTUJWa2M5Z3pwSXJrMmhZOVFsdksyMkt4dTZkSmpsSksrRllST0lU?=
 =?utf-8?B?ZDV4ZXN3Wll6YUIvRXVmbmpaVm1PdWEyVmhoQ0M5aGNTSDlXRG9hWkFFbjZa?=
 =?utf-8?B?TVpRdGdOU0k4am9OUldPYWFrbE5teWVBd2w2Ti9ZSjB1RVpjVDdveGkvTmNJ?=
 =?utf-8?B?bmFseTdsY3p3c0Y1Ym1hSkJpSC9vV0JKTTMxL09JZ0tNdWpacGVQWW5CK0RF?=
 =?utf-8?B?RU94QWxmRTZoZGxUMGFyeWxYNktYeWJlRklKeVk2Vk1DdzVSc1JpdWFmalkv?=
 =?utf-8?B?V1ZQT2dMNGJHK29wMGJOcThIaTVLUElBRlVGNnR2TzZ4NklpbHdLZmNPZWlX?=
 =?utf-8?B?VkVNd2diTW11L2pURU5iRUJFS3FkNHRDcE1FNjZUUk4xWmhYRDBpSFN0bWN3?=
 =?utf-8?B?RXdXeTRFQkhMdHI3NEVTbmVoVXRVOUxCQThtdzc1L010cmRjU0daWDdXM3No?=
 =?utf-8?B?U09TSUxhNyt6SnZvNE5hYXpodFlqTDJxUG9oaEZZK0Q5c2F4ZlFPRHI5MFNi?=
 =?utf-8?B?QmdyUmpHTWNZOUxQRVpCWTlja1g4V2hZMllGMGlEY0pBamZ2R2FTRVZTbW9Z?=
 =?utf-8?B?MXNwaDl0bElLNlpYb1c2c1RGVld1VDZrYUx0aHhwajRwZDlkY2Q1ekhPQyts?=
 =?utf-8?B?OUJvNXJkM0t0bmV2dFhOS1NVUFJWQkJBUWJwQXZmNXNzQkltNXgza2pLbTdx?=
 =?utf-8?B?aC81ZXd5dkVPSHdhZmlmVWY5VXU5bzhwNkc1Z2lNbEpmTWV5dXlFYkNSeUg2?=
 =?utf-8?B?N0VMMmtOK1VEM0MwTUMxbGVTM0VkZm80OHl6YnBXcGtKNkJjK0ZaZjIzUE0z?=
 =?utf-8?B?Mm0ra3VNWjFwNFFCdGk2WUMrMnBVbnFENlUvQlg0QkJ5R2M0YnZxZzVkMi9n?=
 =?utf-8?B?TE5QQ003ak5mWlBqbTFveTNRek9DY3ZwcFZyb0tOVmFWOG0zTE43aHdmNDJ0?=
 =?utf-8?B?QUw0cnhrbXM4UmlBK0V1cjQ0VTVXYXc5ZU5mKzVXUGdZNUMyNWY5eTZKV2lF?=
 =?utf-8?B?VmRzOXZiaXZMdnF2ZFNvR1ZmRE1rbFFPSmdvWHJMN05IVkc0N3N3ZUgvYWFs?=
 =?utf-8?B?R3N4UEpsWkVZSnJwdU1xZDdpUUp1RVFjQXB0M2V6cFZLL1ZDYlBVODlkand5?=
 =?utf-8?B?K0NwV0ZDUnFsMk43Smk1a2dNNzF1S2FZSnBqR2FLWVB0b3JWWUVkTUFRV3c3?=
 =?utf-8?B?clVvMHdZR244a2Z4cjVFa1ZvSlVoRVJBUndQbDZNcVBidnRyWnZNVXlPSzgw?=
 =?utf-8?B?L3h0a0szZnV2UDRMUmNaNXMzbGlBWFJVbTgxTTNJa2ZnaFE4bzNZaHNpK0w5?=
 =?utf-8?B?SzQwaVBlNWRiNmRsRUlXRnBYbkdGbVpKUjdDcFFwNmEzbDhlb21IYUEzOFd4?=
 =?utf-8?B?TEgvdUNUNlh1eGRMcjZtNlowMitJM0p5RGJydnYvNWVHZGY4Tk54WnFRYzgz?=
 =?utf-8?B?U2pkenpWNXRmZG0yeVpOaFZFa0R1dVUvUmNteW5lZHRNbk8vR0xKZ0J0OUZ3?=
 =?utf-8?B?ZEh5eXdaTlBoK3ZHTVUxcSt5ZGxRUWNaeThadWxGVXV2SFUyK1pPYUJya2Ev?=
 =?utf-8?B?L0tVMFVka3lyOXJhM2xUSDFhZ3dZTzIrV1F0M25yRDRwTm1zL1RrRDVNSFFM?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e390bcc-6a00-421e-1be8-08dd614b78df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 09:51:33.7139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PKu/iKORfQCUZYtN74kQKLOH/4ZDQcXErwMQoNygHohRmi5to72y2SfeyXE/x3UwFGOSJz+bxlBE/y69RwLJLIqvP8v4QCz4/aVRtBS4Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta4iVBhftJT5zjuLd4efWX0m96ieL/y5jVeYEzltRu4=;
 b=Tzz5LzdA/tQCpndZ54A/Mz3QJFb4uVM24ijY1QEa3ql7GofS48BuVgBkA1lbQqQ0p0t3qydWa/8OfDP74cPjofPgoo3+UuvhtELBTIumruZX4Px6zifW8NNYefvxeEDTxais2n0e5dM++kdla/wkvEyqjffvWyuh962nUKxCO/Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Tzz5LzdA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] package/libcamera: force-disable qcam for
 now
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

On 3/11/25 7:15 PM, Peter Korsgaard wrote:
>>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:
> 
>   > From: Quentin Schulz <quentin.schulz@cherry.de>
>   > qcam is based on Qt6 since commit 71aa3ceec30b ("apps: qcam: Port to Qt
>   > 6") which is part of the v0.3.1 release.
> 
>   > qcam being enabled when BR2_PACKAGE_QT5BASE_WIDGETS symbol is defined
>   > breaks the build as it's missing the qt6 dependencies.
> 
>   > The migration to Qt 6 for the Buildroot package isn't straightforward
>   > though as we're hitting a meson bug[1].
> 
>   > For now, let's just always disable qcam until we can get everything
>   > fixed and migrated properly.
> 
>   > [1] https://github.com/mesonbuild/meson/issues/13018
> 
>   > Fixes: 72757d111a5d ("package/libcamera: bump to version 0.3.2")
>   > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Committed after adding an autobuilder reference, thanks.
> 

Ah, wasn't aware this was a known issue!

>> ---
>   > This is suboptimal solution to unbreaking Buildroot builds of libcamera
>   > when Qt5 Widgets are enabled but that should do for Buildroot 2025.02
>   > release.
> 
>   > We should ideally work on adding proper support for qcam in a later
>   > commit, once the issue reported in
>   > https://github.com/mesonbuild/meson/issues/13018 is either fixed or
>   > worked around in Buildroot.
> 
>   > FWIW, I went as far as:
> 
>   > ```
>   > ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS)$(BR2_PACKAGE_QT6_OPENGL),yy)
>   > LIBCAMERA_CONF_OPTS += -Dqcam=enabled
>   > LIBCAMERA_DEPENDENCIES += qt6base
>   > else
>   > LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>   > endif
>   > ```
> 
>   > as Qt6 OpenGL module seems required now. Additionally, the Qt6 tools
>   > dependency is doing nothing so it can be removed. It actually never did
>   > anything but turn a check from meson from red to green in the configure
>   > step, the binaries with and without Qt tools (qt5 or qt6) were always
>   > identical to the bit.
> 
> Thanks for investigating!
> 

To be fair, I may be wrong. 
https://lists.libcamera.org/pipermail/libcamera-devel/2025-March/049157.html 
for following discussion on the libcamera ML (no answer at the moment 
but it's not even been 24h :) ).

Before I forget, it seems qcam also has a dependency on TIFF that we 
forgot to enforce (there's a knob to add a dependency on TIFF if the 
package is built, but that won't be enough).

> 
>   > There are also a number of other changes we should be making to the
>   > recipe as libcamera is extended without knobs if libdrm, libsdl2,
>   > libjpeg, libdw and/or libunwind are provided. So we should add those to
>   > LIBCAMERA_DEPENDENCIES if they are part of the build, to make builds
>   > reproducible.
> 
> Will you send patches for that as well?
> 

I may, but anyone feel free to work on that if you feel like it. That 
will be a build-tested patch only though from me.

Looking at it a few more seconds, seems like there are also other knobs 
we don't support right now, e.g. the virtual and mali-c55 pipelines.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
