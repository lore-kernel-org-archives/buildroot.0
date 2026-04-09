Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F237EA3C59
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 12:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1400440587;
	Thu,  9 Apr 2026 12:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMIx32rxYeI6; Thu,  9 Apr 2026 12:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2940140718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775738410;
	bh=urd1W2GNJf1jxd/rGI9KgkgTjNhyuw/3BIoflgmBGkE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=bk1XtnSutFrqOqJ/C/0sWwUz/UXZLdavkT2jTDJgmV8mrJNJI5GWyfASwhZcQRsVc
	 AbVi6xX6nHgQZCaRLrZatb4FreT6qNuKgviQaUsE1xGH2m3QEkRHBK9YREYDs5cBtk
	 OHKFVW15Hm+voQ9502kUuXEYlcYhGcIEy6UjJ6pIMFlHmdujZGV8x7uW4AUoL5vMcO
	 SYT+YNPeUOHn8zBxntB+k281WhvgEji1nonebgJTUWqm5ka8Qdg0aVK7aPDSFgwtXZ
	 8iB+kP0+8jhNiOCeBThtFkUr90sfQArXlkXTrviA39GOEdLSx0kGKcVpcNkgCZ/ZEC
	 qa0FJ3BEWPGxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2940140718;
	Thu,  9 Apr 2026 12:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DF91F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A76540431
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjtzeH-IHq69 for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 12:40:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B286400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B286400F6
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B286400F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbmqR3qQ0+HGmfyBWTh1a5qtsNxmV2/m6ITA7NJN7uPNrYtuk+NXIfX0KRbsMwE8OMfMRBHDkME1QL058aVYTxsuFUjaVfqhtTX+UtHFf9Wl0nuxBjarTxKKEuUJ1CCV+J8LCtGD8OhjhnaVRc2oHtPzSJBqRHkgNPNimUdpKA/hauIhVuSfTNT+RzTT/yPfiQrs5H4+4z/NDNLqqBxE71w6vREyBxDc4R2qT8fceD303FlxEm+UtbuzXtioMGrvvcRdFbtMU/ymL/KO1Dw8YNhOnaxGYFgCcZ/AHIzL4ZfjF2c0t65XJ1Pv2mpuJNF0qjRSKRapy9J7TJxHcVsVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkzjS2nLSOaBVETWhBt51PkSsbO5wK+EgAWAW/3VW7I=;
 b=oUJAyHqsI/niVLV1wUdawuoh2BM3q4+sQCaw1IXKGrk1sA3K1VAFyWu6MNcAfXBp7BZSUsKz20WJmhvJoNwU24sm/jzIrc0icTL2I4+hcBbd+uRC1lnJ8WiiNhQhwDCkrghdX2c8ZQK0EIywIclt8zRDwJrcbNOoMMkVbyyQY5/5Nq2pHowqpK8cxCUvoMc6kXPG7JFIEgNz69AbRkkQ/DIXxvrfPqaLVQbu/3mZ3Fq9b1k5x8xRhtKSb4hBlPTRhwVI1pKK+vPVIGrybQSI6qymcYpx+T79doPBE28eG2AOCGKd+lWfRkQ9pUlcAwiBwDXIFpoUYXbHUxYFlw5cBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:40:03 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:40:03 +0000
Message-ID: <67394df1-d461-4672-ba43-30696e505500@cherry.de>
Date: Thu, 9 Apr 2026 14:40:01 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-6-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-6-thomas.perale@mind.be>
X-ClientProxiedBy: VI1PR06CA0228.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::49) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS8PR04MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: a509509f-71c9-42af-a3d1-08de96351ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: VvYjJkEki8JCqRd7B+hlxfxD1PVB0yuvkGTv3L8BwSe6Tmp1BT/03+If9MsqDtzhEAWLamPeqGDhFCQymAb81umqU9TJ4AoGec8AN1BZcaPzVNqXpbRgYJfFfQrgviQBiWsrvsZwAkA4N3CY+0Tf+Bz7eHgbIShvD5SgHDukb9IvXqY6FYF/27teLBgy/w9lHUq5HK8tVnpb7MiMYwWxuIcShlcroq/NOVOa3FfEGFFGZXgoCzB07sUHrNcmQ39VHVvO4lEwEIxrSdoLzRuJe03i6WQ5KpVeoWg89mkv9YZsd6mQJ0aO55iYogaYAtFwdHaeI3JkTXYSZOV3Rns3WUv3OvRtc5cZBii4/JtxXKOgKL6lMQ+jKALS97l/JRGNyXcV1TT2RIID8ZTfkSKIq4jpxMWwTWJWGweuuroI2dHgIhT81j0bXXtVe6/6IQCkW5OXgcT8PJ/7vbNX44NUAqW+y27hU8u2SlJXYZWM2NNtmiYesrX+4+TFmKzFcyNZfrNPLii9fakvh0diprAq2ueh4/jlWRGE1LSufk0jDL8pWLs/44EVFV3m4Q/eOrxUn4GBjyYBGjdlgcuDUlF2Zxx5NKukf7BzeH+NOnifRVbtleNvuhjdgz6/wNExHtHJOWUKkdyUrBtyZv4VnbICQqfuFJVPp7cO4mIHhfAWgLUZ/jz/wGoJlJ4Xc5xEhO1L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWpHdVpueGllSVdXQWVGM0NQRExWUzYwZ0txemgxT2ppZHliSTZvTUFZWXc0?=
 =?utf-8?B?VUJqWlgzYU9ZT0tQaXNMenhmenZsN0dQOHhrUlVBWVNrQ3lFcjJ4MTVXMkFk?=
 =?utf-8?B?N2dTS0V5bXI4c2E3eU9xVEpnbzZXblhGRTVlSXhaZ1lwaEdzd1JvTFhNSTdp?=
 =?utf-8?B?SHZvQXVIaXU5ZW1hVFYra0MrRkROYW5yTFdSc0F5QmxMQ2w3TlVwQjh6OXB2?=
 =?utf-8?B?ZjhVVWQ5aU53dFBROTJNS1AraU5mOG5uUUMxb0RQcWNrbmp0V1dhTkN3L3hT?=
 =?utf-8?B?bHdIVisrQWM2T2U4bzJ0bUxJUU1UQWNESkwveGJSMGNvRVNOU01mTDV2Uit3?=
 =?utf-8?B?RFVpUjQxWFZjZG1lbTQ4UlNSNzR0c1JFdy9ybHI2cmRTL3RUdnE3MUY0S0U3?=
 =?utf-8?B?dklvaW1xdFZ0OTlZYUQxNVZHQjl5eDBPbkVqZW0ydXZwQVdFNGxvQS9tTWhx?=
 =?utf-8?B?cXBUMWhoOGFQRjA3V2ZRR3RrdWdXcnJMYjFtTG5KQVFEbm1Ya3FDOEg4Rzd1?=
 =?utf-8?B?dUozOWxUT0ZETHVURlJlL0RiSjR5SnZDamFXTGZMaENaYVZZMmVmbEdxSVk4?=
 =?utf-8?B?OWR2cDhCZWE0RWtTcUoxbEFmVWhHWFlVWlpjMkpjUlF2b1EwU3RVaG4xQXZr?=
 =?utf-8?B?dkVvYTYvVEQ4NzdnczVaa0xJQ3lRYzBGZlpQbm00a29YZEErcTRHSWVuaW5E?=
 =?utf-8?B?eFRSemdlbys5YmVEOGxUZXZBei94cFJROHRBUFFPcnB4MGpPcDJkZkFvUG9K?=
 =?utf-8?B?RC9VamVQcG9PSG53UWZ3TG5UYVBmTGRHZHBJVG5hVFRXcEFGR0s1UlpFVy9t?=
 =?utf-8?B?L1JuUWZXSzNlQ0E5SllWUnF2ZU9UQnl3RE0zREdtRUhBRE9PWVFoT2JBT0Qr?=
 =?utf-8?B?NGZVeWtQeFhQdnYrcEVCQnFKNWllODhwaVdMNGJKdzRZREptaW8rMVJoV2RM?=
 =?utf-8?B?ekROTzRxTngxMEIxOEJ0RmR5NUFuc1g4N3dPWUZka3pETU9yNnJsT0w1OSt3?=
 =?utf-8?B?R1dDUzRhM1U2UXZ2WW8ydWxmNjRTaTRNa1IvbnJJcXo1emNLSk1lbkFKMmpQ?=
 =?utf-8?B?OXVLZGhVM3huOUpocm12dFBkcFA2cjR5blM0LzMrSUpnc3VsOVFFQlpvMndN?=
 =?utf-8?B?UEFtM2FabE16NFk0YkRRMEdOUnVyM2oraVNDZ3pvT01qVnYwTmhUV2o0bHJa?=
 =?utf-8?B?V3Z2ZUpPU0NzZkNSNkZBU2ZFVEtFZmdBcFZHREZrdVYwVEtHSDRzWUdqK2s3?=
 =?utf-8?B?R2hxNzYrcGczYkE2OFhyN1RFUURSQTl5ZXNEeHpncjNaNHQ4eXh2djFoZ0tI?=
 =?utf-8?B?aDY2Uk81MExoWnhyWUpobUpXMEtoTHVFSk5NQ2R3dkZGalpIdU11OXdiWEVG?=
 =?utf-8?B?MjBUNkhxQXgwYUxqQk9Fa0t0MWRPb21jYWlRVHNTTGhkcWhjYmpsL05xSUdy?=
 =?utf-8?B?WGlYV1NKKzUxRUo1cHN3ZGxHeXl1dUsxMGo1VTdxQzNuODdRb3V4RGtTY1JE?=
 =?utf-8?B?US91dTJhb0Fjb1pKMm5LRGNWQ25sZ29BVE9ZbzI5dkdkeG5va1kvd1ptQWF2?=
 =?utf-8?B?QytOR3dJZmFEQzZLWWxTclRuMGU2eC9xbkNVd0NZR0I0SFR6R0xTZjU2Nm95?=
 =?utf-8?B?WVJUQnY1blNXSG11VE41dWpuVDhmZ3Jod29OaHAvcCtKSUdYOUFYZ0JocGQx?=
 =?utf-8?B?V0hHOE93YnJLbmhJaW9hTTNlZXM2c3JGSE5zR1djeFBpdXArQnZxOWNKRDdZ?=
 =?utf-8?B?Q1ZFc2xYWW54NHUvK3JkdVVYYmdkazhmS3BlMUEwaThXNjNsQzhMOFUyUFBP?=
 =?utf-8?B?YjUyeTJzdlJtUTlIRWtJVUI5M1JlTnBxcVIrdlQ3bWYzRXI1d3JEd1lTTmpx?=
 =?utf-8?B?blVDUndOSkdmcTJVSkVpT0xxbm1NQWhTVTZFUlpndXJ4OGNJTVNvMnJZSDZJ?=
 =?utf-8?B?OThkTmhLUlRPdjllRnpxcmRUVG9xNjhJNzRhUzdsbHBuUmovWngrREF4NTZ0?=
 =?utf-8?B?SDM3SFByKyt0RXBUU1Bkd294TjB4WERSaHRZNnc0U2xvTTRtSmFWYlNNeXNu?=
 =?utf-8?B?MkhEcnlBVUNKN3hhVWVGUXFTWDRLaExLQTh1TEdNa1RLUkNuUnlCdDFVa3Vy?=
 =?utf-8?B?bmZ0bXQ5eERQZHpBMFRIdEVWRDJJMEpqRFF5UDduZVF6SG1wWnhmSlJyaW1K?=
 =?utf-8?B?S1ZZZkk2Z25FaXJkWXY0NHRFb3VhWGtOSWo5eWhUOC95ZTRXVDdhRjV5RUFL?=
 =?utf-8?B?L1J6T0VEMW5Rb2lWZzdobnNQdEE3cmVrSFlXMG1qMnBseXcxQnZnZzR3cU9m?=
 =?utf-8?B?cE5SbGlmQUJTQTJMNmhZOEk2Yi9lc3ROa2IxNi9wZkFPVTduL0czejFyNjYy?=
 =?utf-8?Q?V1WeqTKaMGfgtaostbAKeq76YCAZAZlInZyWV?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a509509f-71c9-42af-a3d1-08de96351ee0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:40:03.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kk8KI46GPvrKR5AOkmfI5snvG9O7hl9i69/P/YMUmn9/Yil8OvA6w+/jN7FNGPIfcOq7EdPo04i3M1suQqyWkmNe1+8Jd7QAkuAdTvZpnkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkzjS2nLSOaBVETWhBt51PkSsbO5wK+EgAWAW/3VW7I=;
 b=ceTgj51Xi5HcWD9ux0Ezj0/ppP3cupkt5EIs+Jw8HpqnHoES2XBffA0ukmVX56IRmDSfuN+1/K60hpGhvuSjAp7vHEekkxpGS4GPgYLbccGphDOoS3vfLvfGrGxtpGENZGf4DcPHUB33sp2sw/9X07M4Iz5NWdFdM+N6Bo9KnZY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=ceTgj51X
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 5/8] utils/generate-cyclonedx: optional
 bump to v1.7
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

On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
> See changes:
> 
> - https://cyclonedx.org/news/cyclonedx-v1.7-released/
> - https://github.com/CycloneDX/specification/releases/tag/1.7
> 
> Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
> this bump is optional and default remains v1.6.
> 
> To allow generation of CycloneDX based on the current version of the
> spec we are using a 'Context' datastructure is created that reference
> the CycloneDX version spec currently in use.
> 
> This Context datastructure is then passed down to functions that
> generate part of the CycloneDX SBOM.
> 
> All the top level datastructure are moved into the Context
> datastructure that will be generated after the arguments from the
> command line are interpreted.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 24c15df94e..cbce3364de 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -21,8 +21,7 @@ import re
>   from typing import Mapping, Tuple
>   from dataclasses import dataclass, field
>   
> -
> -CYCLONEDX_VERSION = (1, 6)
> +DEFAULT_CYCLONEDX_VERSION = (1, 6)
>   
>   brpath = Path(__file__).parent.parent
>   
> @@ -493,6 +492,9 @@ def main():
>                           help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>       parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                           help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +    parser.add_argument("--v17", dest='cdx_version', action='store_const',
> +                        const=(1, 7), default=DEFAULT_CYCLONEDX_VERSION,
> +                        help=f"Use CycloneDX version 1.7 (default: {DEFAULT_CYCLONEDX_VERSION})")
>   

How about making this a choice instead so we can easily extend this 
later on? c.f. https://docs.python.org/3/library/argparse.html#choices

Then use it with generate-cyclonedx --cyclone-sbom-vers 1.7 for example.

Otherwise I'm afraid we're going to have to add more --v arguments and 
handle them separately (or I guess with a mutual exclusion group).

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
