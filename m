Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE7C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 12:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0384F42166;
	Thu, 14 Dec 2023 12:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0384F42166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-41SMMsDNtx; Thu, 14 Dec 2023 12:21:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F317142149;
	Thu, 14 Dec 2023 12:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F317142149
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC7BE1BF32E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A20CF60B58
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20CF60B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOkUWrsGkvvE for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 12:21:30 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 580DE60AB9
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 12:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 580DE60AB9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTrLWoUyXylMX5+Gcb1srUvOaZDNKujxC3ORapl0w9woT0LfEmV6hoHzYB5Tn1RnMxAFWdSQOCavulZOUSIi8y5U+f5quHdujw51eujFD35KBSnM+i5qskmlYC+kQSCnqd/z2Zk3d11VXoHBRhIXhz+F6ufLZeB1NuNAergymCJ5vXMAvu5PTEPIqrKGcAU/D9Y5s8d0X8aoti2kbZ3LkfQEpimm+UFg1lSq9/RHAwCQTwmyhrIOsjE60/A8Mrg4X0oL6DgpWbFBpVHKSptW0qxU5SHxVfSdcmjcZ7BEKxC+7rCZ3pvexodp5Zy/pmETqJp4h+ffxNzQvTxUtSSSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHn8AZYC22otWw00ZJKN5ds5p3ZedpnvwRIgkSBwMJM=;
 b=GbEeGLS7+aUxhTohPkA9aDBWK/w73UsfC5E03zFRev1G/WpSC7yOfzH5CI4we0KOG68OI4U5e0KvO+Y0/Qn70GNZThBL3aa2Ff9e/drELbknQGcU5QkDavlpUL3eL+i35fNrxKb6ruq8LudjmgEHFYleugoAJf7zNW2mXwo6yzU/u00AkExnqO0qTIGXk3AAtUTHu9hKG9BuXwVsYTf98qHSeQSRhdwT3Mx20fSWRPbC0XxbTmwFlBZjBvMYjXDGpVg7/5jo1fmrJyanR8k0ImrkJu9D+KDRK2AIizRJu8PUQ/DvI2ODTchG3pJ1EXipoMdtPZTDMJMLxd/y+h63JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB1937.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:21:26 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 12:21:26 +0000
Message-ID: <3061ba01-cf4c-4024-80f8-545ed10f7cdd@othermo.de>
Date: Thu, 14 Dec 2023 13:21:24 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231214112436.144804-1-james.hilliard1@gmail.com>
 <20231214112436.144804-3-james.hilliard1@gmail.com>
In-Reply-To: <20231214112436.144804-3-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB1937:EE_
X-MS-Office365-Filtering-Correlation-Id: a7331228-6667-48aa-813b-08dbfc9f3147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Jy9UeSwink3q4CQJ0SBstf06SviOTmvYkgQK8LUCM9O1O1CvvJqiAk323HVrZnQf2unhPDbq6aXLJ+Q/K8cf3rFcRhcqblTPFtCaUaN+LUwIP8IEFCARRZp0TtfyE+jhSZdg/N1WhmLps+VRlPRJKaCNHIQmZ3ToCxQHIexekaGQ5Ac79pMbn43HeJq5ky8u7b96UCiDaeOZZaT6edRo2yspXOqx3Lrdu813rAzBdfEIvViDm4Ca3ZTsJ34Rw+KU/ER9HwzHwh9zWY/rogjwUF3lOD0+/4ykFXllTP4ywfyJaxZrODS253+bif0YdOhj3Qv7kglu1HlgN/XIZTg5i4OMIiyU2CmscDfRe0Fdt2VbGiqS/GXD7jbO/3ne01p3eqqrFLvnK5hwCmmnABvM2AHqfLX4vK6UCi26GCs9FCm8DHxsq+TAi/36X4SN9gvl8BX66jy/VdUeEo788/NY1ohWtQLlNpbuB9h0TLt2YjK+GrYa2xgpGVrXeFnGDtdVx4ttI2T33VY23gkf3YAnrJd6XwfZfM87qjuQRfTXCPCSFzLQWL3aUKNiGJL3lk73nzGaOwRX/Sw9cwzq1v2EUejaoX+3t0EbPwC7A29zewgAulnW3yY5ybAANGGa1CfZXYwqSBYu9Ds2Hr527EwyRVJBBT06FQgA5NVTuZiDYcunpvQSFkP18xyIWETJIbh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39830400003)(366004)(346002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(83380400001)(53546011)(5660300002)(6506007)(2616005)(6512007)(38100700002)(6486002)(44832011)(8936002)(8676002)(41300700001)(2906002)(316002)(478600001)(966005)(66556008)(6916009)(66476007)(66946007)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkV6b3pIdkpobmNNZDlETGdicDllcTlVUXJwSWdhWk5NemR2cDFaWHlUU3d6?=
 =?utf-8?B?eStCZGdJYm1Uc2FiUjF4SjNSNXlWS0hvTmdlMC9TL2hoTXREZHhQaUpTQUxP?=
 =?utf-8?B?UzVWOU5tbzA2MS9VTTBXRTNML3MydVIvSDZUZFlpWEtzaWlqcTlvNnpjQlBG?=
 =?utf-8?B?eWNEdERpTFhtRmt4QS9mTW1McFFiZGIxRG9WTWp4VWlvaG0zVHRXalJNNVB0?=
 =?utf-8?B?NW9oTUpMTVl2NTIxWGJiTnZBT0p0WGk5WFcwVnl5ajdtZTBOWUFzWEJDWmlM?=
 =?utf-8?B?RDNSWFBRQ2w5c1lNbyt4T1ozbmNrVGFMRVFqUmEwZmdYdG5RV1Zqd20yWndZ?=
 =?utf-8?B?ZUREZzJZZ24vYjZpMWgrMU54UEdzUTMxL0JuTjlCQXQ1dHJsditWMHZ4NE5n?=
 =?utf-8?B?NmxIS0pSbDljT1hSS21ycklHUmo5VzhUZjVEV21rMEsyRmRaWFMwbzVkTEFG?=
 =?utf-8?B?U0JKZVVIU0tNa3MwN2FJOG5GUENlbFU4dTNRcWl2WHhwaE1kalRody9SbVFi?=
 =?utf-8?B?OUo3bHppdk1icDc1ZUE5TlA2VUVjcjJVaGxZTGxSZTRvZXBCMCsySHRIYU93?=
 =?utf-8?B?bDByZ2RlMU9YR2RJdzF1aVFNRFR5MnpQbXNUVWxYY0xxcCtGM1V3TDh6VjRh?=
 =?utf-8?B?cHFXS0p4R2k2U3M1VGRzTmh6T3FweUFkUm01VVBCSzFPNzhrL1ViR0UxYjFq?=
 =?utf-8?B?bVAvUEtsdXNlemt2eWllZy9EMzFIV0RUTnc1b21NWVJZd0dtTXJxUGJua2xM?=
 =?utf-8?B?dlFPQnlBZlBwdkFNcFZVY3diR1BGRTZaYUNBdXlaZGlINHY5dzFpNnJ4bVAv?=
 =?utf-8?B?YUhHREUyWXU2TUp2a21VTitnb2trNi9FZ2JZTnJDT2lLY1M5dVFLTWlUM2o1?=
 =?utf-8?B?NUlhOGNGN0dOUVRhek4vSmRsMk13WUFIQTdJOVVXeXV0ZzY1Zlo1NjRQMmJU?=
 =?utf-8?B?LzczMjhncXByYXpSNUxsVDIvQTZQMW9STW8xdVpLZ0YzU2lDb2NLa3FsQlVK?=
 =?utf-8?B?MnF3SGF6VEhRb3Q1bVl6eUJYdXBsdXBxbFVrSGJ3dXNCODBmQStqN3BwNkJ1?=
 =?utf-8?B?NFJsR2JLeEl1R1pkeWQyWms1WWRZMzVleVR3Y0VmR0JFSGxjTWQveHBBNzlG?=
 =?utf-8?B?OTBaTjM3T1dDN1ZkdFlzTEQ0RG45NXNLZDE3Q21vNmhhbWtjeUp1TXZlcFF5?=
 =?utf-8?B?YldwdXRGN1crWDBPSjVVUHRVUlpoNTB5V1F3TytGazZOZWhxZFRKU1Foazg0?=
 =?utf-8?B?OVFzUldSWXJQWGVHbmVKZzNxbzhsanU0U3ErL2ExSmRzR2pFdUhjbGZJQTh1?=
 =?utf-8?B?R2VKdjdTZmxwUXB2TmxrMnhHOEgxb1V0eDNxeWtCd1VnZS8xWktLTm5hSlND?=
 =?utf-8?B?QUF5NHpNNVBWYmxTYkgrbVNjSVRxbW5qS1R4WUdTMVFlcFB3ZDNlS1B0TEhT?=
 =?utf-8?B?QkJwK1FYTlRtR2xrcDNDN3YxZC9PRzk5OHFQcDNvUExlNkJ3cHhKS3IwM3lX?=
 =?utf-8?B?L2hFeGU2Zm52a1M1K0xKQk5ET25oTFFrVG02RktYYW1DNGhSd0JLbENoK0tY?=
 =?utf-8?B?NzY0T1dNSUg5UWpDK2I3T3VKVlFrRm1tLys0QmxLMXRQTEJxdEppQVdDV3VD?=
 =?utf-8?B?aWFEQWdFOXVZa29hakEvWDRmb0JxUUphREYzVmZGeHVMUUtrNUo5Nk45Q1hJ?=
 =?utf-8?B?YnVQbWtGSWM3dW5EQVl5NlMzM0hsL3htM1piOHcrK29Pcnp0UytickFaRjI4?=
 =?utf-8?B?ZzBmSTk3dnFvbFZyaXgzVUp4RmRleitGQnllR21aYlRCRHY3ZVJhcGxRc2lW?=
 =?utf-8?B?VTFrem0yb2dXRm1DL1dQVTFTbXd1VTZSaVJqeDIwOGdCbUszVlYyZks2WUFt?=
 =?utf-8?B?aEFBN3ZUK0pDaXNIS3hpY091dDJtSEVSMmd3SGRHako4djlsS1kxWHlBZ1lZ?=
 =?utf-8?B?WllZdUJMRklmVEUrc3hPMWVxeHg4MVE0TFFnTjBEa0ZiZ1VBc3JLN0xjOC9h?=
 =?utf-8?B?czdHRkI0YUptek5Wbkxza0FTU09VeGRjTmxBb2tGMTVzZnl3Vzg0UVpRZHRv?=
 =?utf-8?B?Tko5MmF0Q2s2OXF4eUJ2Mkl1cm5SS0U0VUkzZWlRaVl0Q1NEZU5WTWszdlhv?=
 =?utf-8?B?Q0JFTmVVcEc3MFA2WWRGR2lrak5CVzZWaEh3M0k1UW5UaGZ5alBsajNzRndE?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7331228-6667-48aa-813b-08dbfc9f3147
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 12:21:26.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UepLIWYnZOQMhIJf7vT3oKgB8LYA1PvRZI3EUkvsKd9lebtbGfueT44qEJvbW4Nn/+58KO5FfHpBDO18goiSdsQXCVKp4leRmU9KXpr0z/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHn8AZYC22otWw00ZJKN5ds5p3ZedpnvwRIgkSBwMJM=;
 b=ZIavQWt1WdprHMr1hE3xFN9tDAB+cem0YpnoQQdKQXdZMWrk8BKr5zxXCp+luoSVQEs7jJb1nkl3Tchap1Gb6M7Jzx9S3gFoRy9USF8U6Ruj1PQv9EnYjHwOIYMyxcRnHC8NHJyW/Bx6ZivurUAsijxtPTaR/cVW0gWfm4WtW/s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=ZIavQWt1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v2 3/3] package/python-fastapi: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCkkgZm91bmQgYW5vdGhlciBkZXBlbmRlbmN5IHByb2JsZW0gaGVyZSwgSSBkaWRu
J3Qgc3BvdCBlYXJsaWVyLCBzZWUgYmVsb3cuCgpPdGhlcndpc2UgbG9va3MgZ29vZC4KCk1hcmN1
cwoKCk9uIDE0LjEyLjIzIDEyOjI0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAg
IHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBh
Y2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluICAgICAgICAgICB8IDEyICsrKysrKysrKysr
Kwo+ICAgcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5oYXNoIHwgIDUgKysr
KysKPiAgIHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsgICB8IDE1ICsr
KysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZmFzdGFwaS9Db25maWcuaW4KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLmhh
c2gKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1m
YXN0YXBpLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0Nv
bmZpZy5pbgo+IGluZGV4IDNhNGJmMjFhMmEuLjhhOTdlYjI4OTcgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xMDczLDYgKzEw
NzMsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiAgICAgICBzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLWV2ZGV2L0NvbmZpZy5pbiIKPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWV4ZWN1dGluZy9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1m
YWxjb24vQ29uZmlnLmluIgo+ICsgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZmFzdGFwaS9D
b25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1maWxlbG9jay9Db25maWcu
aW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1maXJlL0NvbmZpZy5pbiIKPiAgICAg
ICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWZsYXNrL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tZmFzdGFwaS9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1mYXN0YXBp
L0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uN2Qz
NzZkM2RkNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL0Nv
bmZpZy5pbgo+IEBAIC0wLDAgKzEsMTIgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9G
QVNUQVBJCj4gKyAgICAgYm9vbCAicHl0aG9uLWZhc3RhcGkiCj4gKyAgICAgZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTICMgcHl0aG9uLXB5ZGFu
dGljIC0+IHB5dGhvbi1weWRhbnRpYy1jb3JlCj4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZ
VEhPTl9BTllJTyAjIHJ1bnRpbWUKPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZ
REFOVElDICMgcnVudGltZQo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fU1RBUkxF
VFRFICMgcnVudGltZQo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VY
VEVOU0lPTlMgIyBydW50aW1lCgpGYXN0YXBpIGRlY2xhcmVzIGEgZGVwZW5kZW5jeSBvbiAidHlw
aW5nLWV4dGVuc2lvbnM+PTQuOC4wIiBzZWUKaHR0cHM6Ly9naXRodWIuY29tL3RpYW5nb2xvL2Zh
c3RhcGkvYmxvYi8wLjEwNS4wL3B5cHJvamVjdC50b21sI0w0NQoKQnVpbGRyb290IGN1cnJlbnRs
eSBwYWNrYWdlcyA0LjcuMSwgc28gdGhhdCB3b3VsZCBuZWVkIHRvIGJlIHVwZGF0ZWQKYmVmb3Jl
IGFkZGluZyBmYXN0YXBpLgoKPiArICAgICBoZWxwCj4gKyAgICAgICBGYXN0QVBJIGZyYW1ld29y
aywgaGlnaCBwZXJmb3JtYW5jZSwgZWFzeSB0byBsZWFybiwgZmFzdCB0bwo+ICsgICAgICAgY29k
ZSwgcmVhZHkgZm9yIHByb2R1Y3Rpb24uCj4gKwo+ICsgICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L3RpYW5nb2xvL2Zhc3RhcGkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmFzdGFwaS9w
eXRob24tZmFzdGFwaS5oYXNoIGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFw
aS5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zZGMxNTc4
Y2I3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9u
LWZhc3RhcGkuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIG1kNSwgc2hhMjU2IGZyb20gaHR0
cHM6Ly9weXBpLm9yZy9weXBpL2Zhc3RhcGkvanNvbgo+ICttZDUgIDA2YmZhN2M2MTBmYzllODFk
MDViMDMxOWViNzBjYWU3ICBmYXN0YXBpLTAuMTA1LjAudGFyLmd6Cj4gK3NoYTI1NiAgNGQxMjgz
ODgxOWFhNTJhZjI0NDU4MDY3NTgyNWU3NTBhZDY3YzlkZjQ2MTRmNTU3YTc2OTYwNmFmOTAyY2Yy
MiAgZmFzdGFwaS0wLjEwNS4wLnRhci5nego+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwo+ICtzaGEyNTYgIDRlYzg5ZmZjODE0ODViOTdmZWM1ODRiMmQ0YTk2MTAzMmVlZmZl
ODM0NDUzODk0ZmQ5YzEyNzQ5MDZjYzc0NGUgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tayBiL3BhY2thZ2UvcHl0aG9uLWZhc3Rh
cGkvcHl0aG9uLWZhc3RhcGkubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLmRiODZiZmNlMzAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24t
ZmFzdGFwaS9weXRob24tZmFzdGFwaS5tawo+IEBAIC0wLDAgKzEsMTUgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1mYXN0YXBpCj4gKyMKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArCj4gK1BZVEhPTl9GQVNUQVBJX1ZFUlNJT04gPSAwLjEwNS4wCj4g
K1BZVEhPTl9GQVNUQVBJX1NPVVJDRSA9IGZhc3RhcGktJChQWVRIT05fRkFTVEFQSV9WRVJTSU9O
KS50YXIuZ3oKPiArUFlUSE9OX0ZBU1RBUElfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy83Ny9iYi81OTQxZTZlMmNlMzAyMGY2NGI1MzlhNDlkMzlmNDliZTA1
ZGUxN2QwYzQ3ZmVhOTUwMTI1ODlmODEyYTUKPiArUFlUSE9OX0ZBU1RBUElfU0VUVVBfVFlQRSA9
IHBlcDUxNwo+ICtQWVRIT05fRkFTVEFQSV9MSUNFTlNFID0gTUlUCj4gK1BZVEhPTl9GQVNUQVBJ
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gK1BZVEhPTl9GQVNUQVBJX0RFUEVOREVOQ0lFUyA9
IGhvc3QtcHl0aG9uLWhhdGNobGluZwo+ICsKPiArJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKb3RoZXJtbyBHbWJIIHwgU2l0eiBkZXIg
R2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10c2dlcmljaHQgQXNjaGFmZmVuYnVyZzogSFJCIDE0
NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3OCB8IEdlc2Now6RmdHNmw7xocnVuZzogRHIuIERl
bm5pcyBNZXR6LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
