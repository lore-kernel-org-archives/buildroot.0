Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B29C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 10:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486004064B;
	Tue, 15 Feb 2022 10:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K7-6dKzluEFG; Tue, 15 Feb 2022 10:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 387E340486;
	Tue, 15 Feb 2022 10:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF02B1BF290
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB9F815CC
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b436MXINskPP for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 10:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8314281432
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 10:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhcTrXYwPj8epNRgCnH4V2Um9Sj88Fn3AUVuZZuKLrycLtD8arWU9hyWwboG0kbMZ2/ypqB6GJOeAEGIEZhPs42jNs45IPSXr9BxuTnOb17TG8GiZH8Capy6T0VExxsPKMmaP4EPWY9xGS3n2Nk1zAsxwtmqxvxxqBz5WIZ4/DAouyjXYpQ31oXkm6+IEaRgdfML6akmIDYjHba3pcmjtdC3ywoM1D/8Xd1AKwMFb9Qa/hIvUNRLEU3KyZM8xwj+TgbD4llBEKWDDj6GSxsBWkbyGExiwHu1yaZCfnLBUfRRG172MABjAX0djkHvCuU45CzQ+2tILQZyEZH6Qc0tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp229ueuNs3KyuqUlEKZvhnGWuqR82NaSeph7vBsY1o=;
 b=A6i/BZJR/cmCT72A3mVXgkSXc6dpdKqcXQjsP/Onb7Pi4LLRho2xYuGx4OBA3i1yQCkwXiZYAIG5ddeCAaRgrkMh5WIqDI8mGLw4hTbnOsDyPGDpnari0TQwz8vSnXckzvxpt7jXptM5fOaVNKAarTljFsLCIDfD1gPjk/HA1eP13sWvHb1C/oniiPoFWTHK6LfzXo4qKkX1a3cKDdv/2F6smq8YPD78+UU1wZqlz4rjBjam1TxENSgtsisDnDD4xWHGappWZ1FaD+PX/MKYGAbGTLgwBqC98HjcnfHmn0vSGJbL1NFYgxOqtZdn69DuYv4wOMItGXOOxYZEu54iNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp229ueuNs3KyuqUlEKZvhnGWuqR82NaSeph7vBsY1o=;
 b=Bf8Cq0KXVC+A3thVhXqJGlWAV0YxzES9D3TgOJ7W8+qfxJmmnCIBhkX1Ai59z88/uPB4pDXKLAMgjVomYEeKkF0D2J53GfEUR/2wjkpPo/t1u9OmnFvyJ8452UWh7OFHAe65dN8LQMy+wFue8qbZSmOEDWI+kTbgWM8RKyGWBRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB7670.eurprd04.prod.outlook.com (2603:10a6:20b:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 10:12:09 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::b46d:11b:b0d3:3ac]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::b46d:11b:b0d3:3ac%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 10:12:09 +0000
Message-ID: <d39cc05a-7beb-ce1e-8d85-b6860b320881@theobroma-systems.com>
Date: Tue, 15 Feb 2022 11:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213113332.1056370-1-fontaine.fabrice@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220213113332.1056370-1-fontaine.fabrice@gmail.com>
X-ClientProxiedBy: VI1PR09CA0078.eurprd09.prod.outlook.com
 (2603:10a6:802:29::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85eefaed-773a-4219-f2bc-08d9f06ba049
X-MS-TrafficTypeDiagnostic: AS8PR04MB7670:EE_
X-Microsoft-Antispam-PRVS: <AS8PR04MB7670362CF986AFC14C2272ABC2349@AS8PR04MB7670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: biGtbr8Gta5HLuKSagFWb9PqopkdHD3XZj7mhVXspNWOaReVohLH0z5zow2NcnhzqtMAEhDm//nYjwDol+20o06hq/n7qTjbvt2b6h3230Ua0qJ5NrNHJCm0Sfv32P2E30ZKXcqD1b9qm+xa/uC/bS6DScQsjPaPbcrY/i9XW0THAWkULycUGaawUb8SYL/yuocs2LQI2VRpgiM0xIZL0RSJJQ96TMBgvlrzbfIUhzIpuhmo1425kIKxN8t+qZuU/89S93h4YYlRSf+OYmK8Hik9FKqiEJ2prAdIQTRqP+ZL4snPGGH/sFoka/ZJ0w64mgTmsiYKpohqDYMrImXMvx8AFgYvRH0VfWXvaT/KItluO+rjWN1hWGuE1iV0TWoNYH2c4FNRks7wgQIqMrGgm2wRgKgIL1I60tEPGyoo8FyISgViL9sekZAklmpouqRTds6VtTZBUyOuIoHAn6SWKeR83GbmIOQyaVZDVJF+FF97QiIls1fIvAtuEqY7roKRYyZEb8kEoTuhLDx0eeCiSjGUjQPzvbY4Ch0JBAiCTRsu8vBo/3AKMmooA3BkfeKVv+gthZCMx0KhuZWhQfknrVa+UxkqnEaeovujYryiYLbWezIRCHzm5sVhggrDz0yXtyQ9pSKohHcz9yaE6081p+voo0dAqMeFHslcoew8OBuoMvU+0s0IKfIwR78HeQYLzEBfPzseK5jnEMk/gs4UzHkGVgWSxXlFZoUKOno0JHxcVra2hdPMAdvbOtU5vITWYHDexro3NTmghSUyWzXuzyVa4P3JsUUfbe/OAdDVtKRr8PwPOMUXhIIR9OGtrIm/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(66946007)(66476007)(44832011)(6512007)(4326008)(8676002)(15650500001)(36756003)(83380400001)(31686004)(966005)(316002)(186003)(508600001)(2616005)(31696002)(6506007)(86362001)(6666004)(8936002)(6486002)(5660300002)(38100700002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWhtMFNuMXhETG5iS0FHa29RZm40dFVaaDdyWjYrcnVFRnpjQ0M5TWtORDky?=
 =?utf-8?B?b0VNREhlMEdoMUJpUHJQZU5IbG9RczRMd0dRSmVnOS9HZFZ4emZMeWQ1Z0I3?=
 =?utf-8?B?Z0dzRVptTzR4eTh0L2lpend5WVplSWRrekY1NWE0cHdpSUZVblBFZUlGRko0?=
 =?utf-8?B?UUdlNmY2WXpGVFQ0N3dKWEpIRTdDaVJKalFod0lJdVV4Zzk1Ym9vMXZqcDV0?=
 =?utf-8?B?M3lpOHhDZWtkSCtKaUQrbWk4b3MyMi83NmIyNFJob1REeHRkWnJsblhEZlVD?=
 =?utf-8?B?MDgxTXRUb3ZaYTdDQmluSVhKbXdMR3piYkVzbG9VK0lxNkJ3ZFc1VVhrb0xq?=
 =?utf-8?B?QkpFOENZNit2eDNzRnJRaThVM2p4cU10Z3NtelJobmdxZmFoMWRNQ0wwcmNv?=
 =?utf-8?B?R3oxeFpZY1ZFcnZmR3VQajc4akxzOTdjMTVYOWU3UkdxaDZmYmI1RzBJdFlP?=
 =?utf-8?B?VFNsT1lqMnBBSXpGNjdreG14YWpwc29BQ2ZNRmRsYmYxSVlDU0lXclNyOVY4?=
 =?utf-8?B?bkpmalZNdGszZ3ZxTWQrS0NxTHlVZHM4SEtDTDUwczlpczdWYnBNRWYvUGV1?=
 =?utf-8?B?YURkYXN3cjlUL0ljUFlEQ3R6dlJVUHVCN2huRHBVdlB2S0xWeWluMS9xNEYw?=
 =?utf-8?B?VlpVem1hMmZkVFNaMmJhZEd4MHFPaERTWDROSHZIRWVLRnlJZ1V2Y0phcTBa?=
 =?utf-8?B?L0VTYWd2WnVvclBFR3g3L3N5YW1OVWJRVlpvN0JWREkyUWFFZnB1MkxsUUlF?=
 =?utf-8?B?dzhkUEVPSlRXZVNYaFVkL0M0Q0VTTVBNS0V4b2ljZkFZTitES0dvampJbHVB?=
 =?utf-8?B?QW1BdTdhVEY0RHJlNDBmT3JPRng3cVEvTDcyNVA4cTNjR0UxaEhUTUE3RHdr?=
 =?utf-8?B?cDZMTzZ0MTVRcWhCUmlnNXJYaVU5RTRwY1FwM05jd2had3owTmhadUZwa3V5?=
 =?utf-8?B?NE1aV1YwSXVlVGdvSnA3VjFucDI3UFJMMmNESVg1cEtGMzVseE5OV25kZ2Mw?=
 =?utf-8?B?My92d2tWWlBiRlp2ckZ6bU1rRWpyZUtLeHZZbkRvNXMyMUp1VlJOOE5KajA2?=
 =?utf-8?B?a0JEMTNZK1VJUEp3b1oraTNmNWE1dXhDbEkvQnpKSm9QSFd1b2ExRXZmVTdv?=
 =?utf-8?B?L1VkdEpGc0lxL0htZW15akF3ZXBuZGxYd0hWbCtLNTBydlZoUVlNVnB2ejM2?=
 =?utf-8?B?K1VENVNVODFYdjN3ZFVBM3FHR015a1IxenMreFFEeGVtbm14RlVGdHJudXpG?=
 =?utf-8?B?aFJsUGNheE1aWndnVEd6S3ZFMzlxNndrTFQvYUh5ZEZBL1Nab3hHb3FoT2Vw?=
 =?utf-8?B?NGh3ZE1vZ1RMYkFBWUxaNThZUzl4cVhiaFRWMkJrejlCUmxDRWM4Um1oM3JP?=
 =?utf-8?B?UXdVVGs2VHFqSWtnSG94R05JWXhWWnZGREcxbjRNNE8zL2U5Z2MxUmxGSDlv?=
 =?utf-8?B?Q1BDOW8xOFQxbmlyQ0dqR3QvKzRPaDZ5YXJwdVBvNTdJREovclVTL25Gajd2?=
 =?utf-8?B?UzBzZUJ3dmxwMWE3cHluazUzRGkrRk1HZUp3NWNrV2RieHRJZWZNWmMwYUpZ?=
 =?utf-8?B?NlNuME8rRWg5WmU4ZVFJdjlmVGRabE5kNFVKbFFrekkyUWtuRFRiSTJYRzRT?=
 =?utf-8?B?R2FDR0dXY01HbmwvZWg4ajNMQmFSSTk5WWM3dWpPaHppWm00bW9lYXJOSWs0?=
 =?utf-8?B?RklrUjN0Lzdya0NKdHdoS2I4Tmo4QmJkZGdYZWxwWG1OTHliUmFFcitPNXVF?=
 =?utf-8?B?a1BvSElMQ1RKVC8ySm9xU0JWalNMS1F2UGkwTjh0S3lrYWh1QTkrWUtacTNs?=
 =?utf-8?B?aGhjSGw4U0tqWHJHNzRQQnQwZ1lTVjRQMk5CY3VBVk4wd1B2alpNN1BLY29a?=
 =?utf-8?B?Y2pOSFVkNHNJdUF1S1pvWTl4UmExL0MxQkFiK2dYSHhrY1hTc3R4T1grU1cz?=
 =?utf-8?B?cnZlSFdsbDNiYlhyc3NRSlUrZjc1UDFLQ3FqaVd0THd3ZlFUVmdNRkV0Rms0?=
 =?utf-8?B?NHo4YmRYVHFOakIzWFRnUm5PbUtUVG5xMVhhOVYzbERzMTkrSTVxbitwRHRG?=
 =?utf-8?B?a3VQa1k1T29ZNGgrVjdEVzNaMDErUHpBRVJXWWVtRWhWR2EzS2VFMDViemZ3?=
 =?utf-8?B?QW5lSjFHaFRyblF4SWJRQWl2dzFrMmNJZ0J5OXJiTlFydTJLZXJuV1JPeWtW?=
 =?utf-8?B?dW5GK0x4R20yT3NoMjVqaUtxQUpKQ0l2THRBTnIwRVIwY3VDNTZWU0VTNXZy?=
 =?utf-8?B?OEowRENnK1hiTXhRN2l0YkN1THE1dFZIM1FmTGFSWjQwTFk0VWRPRjllbXE3?=
 =?utf-8?B?Q2FNRWRvUGtXRXB6SGgzUTRscDI0QlhONFR0RldtUk4rbmhENG1GaVFPMEtp?=
 =?utf-8?Q?4cegM9iLdvzoaIX0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85eefaed-773a-4219-f2bc-08d9f06ba049
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:12:09.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYtM66a0qtbghVXU+xnxQ9rveqS45xdXHxRj8Q2Z41glQMgs9IXEeVpwiiZFoQNjO8fq4Ly6IgGGW+1fwYj+PA+4b0G7QL6iKPIn8c6tuGCF5nbOoGYn+GoorqHg/kK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7670
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.5
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 2/13/22 12:33, Fabrice Fontaine wrote:
> Fixed a vulnerability in the EAP client implementation that was caused
> by incorrectly handling early EAP-Success messages. It may allow to
> bypass the client and in some scenarios even the server authentication,
> or could lead to a denial-of-service attack. This vulnerability has been
> registered as CVE-2021-45079:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.strongswan.org_blog_2022_01_24_strongswan-2Dvulnerability-2D-28cve-2D2021-2D45079-29.html&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=Xw8Wse_xivKp-F2KsLaYN07aQNQFV9AOg9nJURWQjmPZhznmWAC7LZTawLVpqOwW&s=qVIfoIBmT6GmL9xoC3go3t3Hu45ZtCsAWTeU0X0HBPU&e=
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_strongswan_strongswan_releases_tag_5.9.5&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=Xw8Wse_xivKp-F2KsLaYN07aQNQFV9AOg9nJURWQjmPZhznmWAC7LZTawLVpqOwW&s=UEX186sLiKBzRnvlExvfzMtE4KjZS-Rd7CfD8fNRV0E&e=
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Missed your patch and was about to send one :)

Reviewed-by: Quentin Schulz <foss+buildroot@0leil.net>

Needs to be backported to currently maintained branches too, so Cc'ing 
Peter on this :)

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
