Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E2010A1E7E
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 11:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E7F607BE;
	Thu, 26 Mar 2026 11:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mALnnII-DJrW; Thu, 26 Mar 2026 11:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76C3607C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774525068;
	bh=oR8mnPiu+LbrEGU45OmHi9uHx4XQaLDqwNuQ/0tbHPY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RsBLX7KhkXizW0EsYe9LtCShWJoJ2hgCNx4KkguD/qawZM3FbcbBX5wfKjIwWftX7
	 UQV+mCB0aoJKTQsSYUealbvMvcTkOATO4ot1NVfP5nw3HoB6oLSUrQJkuWLe30EDgz
	 MYUO39qvqbJY0JILp67tUMxSqUqrhrn7ObFAoQQCxw++ICGiJu5hea3xlLe2rqN+hv
	 XKs3y0U6dn9701uiIY8TRS9XB/GX+hO8/Yu6J+3HeXVv8MIZTHkAkJRcEKVCY0mP+p
	 xd48mcB17xxd1n+EX8iLHDHmH3LqWoiIe8kdqBZ4fSBjvFVeyDKWA6DKdRLdpnMzVk
	 nBQLZvMeKs/TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C76C3607C4;
	Thu, 26 Mar 2026 11:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6EB1353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3F4F404A6
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Yz32gTIm9we for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 11:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c202::7;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3703402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3703402CE
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c202::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3703402CE
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfAfNLDAlwgvNHGoiI5znHIFfFmPN61FchgMe3/1djPNFU5VYurapBwM7JOwyblrT351w5xchmcgdqPut9lUTKkgK4F3ju3NpEhL/aGn0DI/EsjLVlmi8POIf1w+kxOCGHRkwJAycLJiFZVeoSVV7D+gYiGtiogyEHnNjPZhOVNv4RIhTWYgh0JGqaap6xY2dsMMOtJsSG4jg428Pjhf95vYpqVzov2uHjI0mlZS4M3wwb6lb1GZO0Ta+AGb23X4RKiylLeUcl4Bv1K7jS4+SrZ44fZurhRLaihiSAQ/Wlt680tJ7WtZpzh/peFWUGOlF8CrG67gKxHTNZSgfX00gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBeAQJV4ONkMp5AzPdKQ/RvxrQDjWEE5kQ0jTR+ZxF0=;
 b=yLLx52Bwlj4bdBF9nBC7Uuk/QbY+nNMPIB/B98hyYfTlMj4lDeJ8igIAJ0R5lSLadQ0ocjsBjxy0SLE6fKDAC2l83de6vXHrkJFHjHAVdp/uYqydbgWQOpk1XhsY99PNyr9MmtwoQ3sCGeNe+4bAZHouq2cNO9lkjhxtVY40XA5i5zij5/0IY+P5SnLRIIuvdnbJANIuRLlyQL3nv8Ni1i7R8Br82/ZvjYUkzl3PPsNV1h2WcXGfakjw0n/0Pf0pHMSBEv9pXrBVKJpTa/RM69vgMY7Wyq97Z7jZkKdr82+Y7ErUy/UgzZQknRGDC1qgM2gs5+6ZtdMUOvZCanGLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:37:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 11:37:40 +0000
Message-ID: <e41342fb-6354-4ced-a000-ceef2b6ac577@cherry.de>
Date: Thu, 26 Mar 2026 12:37:39 +0100
User-Agent: Mozilla Thunderbird
To: Heiko Stuebner <heiko@sntech.de>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260326101033.587997-1-heiko@sntech.de>
Content-Language: en-US
In-Reply-To: <20260326101033.587997-1-heiko@sntech.de>
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9eda1d-8c68-42b0-51c9-08de8b2c168e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: lKCVGjF6NatsBqIFbzDzvg2xbzRFAyk3qnlw7JFs/QqD7aqdfbdGlHw7XUFlab6Rof6fxceGgrOO5p3VZc4+pYa3LZrYzRA6rIiL/8og7GKYzjCOmqEr5zmF0FHyoww0pKUA7JNf1OVgS+cTUWKmGZSY55rjMS7RkrR24PuwRcZzy4EwG+Vt9aH4dWvLXvoR72LG8Iozva5QcAHfsJIzIOYkNto9JlA2/DvSHRBa/89jEMvY8jEKxkuvhqzdNjAcdBwLTcMTLsZyaVs90SW7gZBmwznVx5O/qou94U9nfWWKhZdU4oGL50HRsKkiSLZFKgIM1Lj4efLw0dsuqzaoWneDegyZW8UTAV+rRipVBPy0p2Hj37MxnMflDBOm63XzKKqenlqkbfoh8gIQexLdnnY2+VOJbIMqyZA09ImQM+CmX/7XPtphJAeG/FDQGVJYj8VhjzLNlmnHw5rX5wm0HYaC3boUcXIj0jnudNb0Wr9IypG6Yiy/4PfyptWCV+g2PgGiJtcZKldqrKVMhnsvJwJXSbor9A+HnEf6M/Ygv4tjVp/FEcQT4+okDCazm2OwB6oNBpc8VHSV1Yk42yQI0YsR/T613p04QqklJpv+91t/DpSZ+JDzqA6+DFc4mO4dEHDfyp9ud2HKauKrWEt02iVBn+xh/YxgBzgcDA0in3jh03KtBdaFbrujnHVrWHhwIc/0bnSE5BJwIGcZpJ2/rpiFNAmRUqZkfxiMaOYJtJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekwzWmJ2eG4yZm1JQUI1TTk3TkNKcFJYTXJWK1RtNkJmRXNDMmIyVjdMRFdW?=
 =?utf-8?B?cVY1eEpwSkNxZTg4NmprWm1jNzF2SXVrMWh2dG5xVXBNRSs4bG1DaGZ1NVNt?=
 =?utf-8?B?RUtIKzdLYnlJbHh4cWlncStkNDJDd2w3OGM1eTU4cGpodWpDWlBzU3RrTlJ4?=
 =?utf-8?B?U1M0b2pBQXlTOUpqUlFqS1pTWFBhdGU1VGNvWW9pNFVublN3c3lzaTRLcVhF?=
 =?utf-8?B?TkRROTBzaUlydzFhT1R2cnRZUXhIanIvTU9RdlpKNWhPMHI0Qk9ucXJRMTRO?=
 =?utf-8?B?WUxrRXM1WEE5SGVTUTZqNEliV1kvQmE4Z2xaS0N3VWlWdk5JMUtod2NmZDVC?=
 =?utf-8?B?bW9aWExFdTJ4ZTJqMlVONytWT3AyZkgrVFFTNlZQeHpSZUIrTVVkQkwwVFdZ?=
 =?utf-8?B?Zi84RVIvUFgxc0VrdnM3RmxlaklyT2xINUVlQjBTWmJhYUpKd1ZVdzhvZmJn?=
 =?utf-8?B?VU5XRXpjcEdjOTQ1UW9IMGhScjlEcWVldEwrdmRxcGx4OW96d3E3SStleGlw?=
 =?utf-8?B?by9UUzRCRC9mQjlCdEhCRTFGblhNMm5TcXozVjdRMGFsMXFWZzFKMTgwWStW?=
 =?utf-8?B?WHBNN3VMamRSRTMrS29OUmVBWE1yaEh2WmczSGU2c0xZSEo5eXZQRDZncGEx?=
 =?utf-8?B?Z3dFbjQxQ1grTERBTzRiajBlWUNtNnM0N2svOC9DQ0w0TStrUjVOSmNuando?=
 =?utf-8?B?RGhPV0o1TG1DYnZPRmxOY3d4Rk9KL1BxN2NBVFJOT2cwK1NhZXBjS0NITmNy?=
 =?utf-8?B?bjBRcFEzcmxtTWpPS2todU1QWjBQTjFvYWJxQ2FDM2hNYzhwRWZIS0JrSDRu?=
 =?utf-8?B?MW5BaU1GUStKalRiZFBGZlI4NitmZW5jZEo4SUJTNlpGSXQ1a1h2U1BMK3lo?=
 =?utf-8?B?OE5lbjRXK0VWeTBmUVZqVXFtd2tuUHJIeGEwYmhKOHE1Mk96TkdDN2g2bU1v?=
 =?utf-8?B?MHpFcHFrQVZBMWhIOXhKT2djdjYyQ2lRSFVCbkxCYmdCaHJrelN1dVdxZUly?=
 =?utf-8?B?NHVDbW1VdlZoS3ZRTENSTzlUUmNaaytkeDA3aFlzWXlUQnN4R3hUcXVMaDAw?=
 =?utf-8?B?SHhhZHRZMWtaVnBwbldibFFaY3MvR2Myb2poM0FNYmYySlByQjdJOVVTT0R6?=
 =?utf-8?B?UzI4VUYreDdmemJpbkx1Ym41bEFnN202eVA1SEFQd3hHVERkNlRhZzVGWkZZ?=
 =?utf-8?B?MFJlclRhTmNWSFNER0drcHB6a2Rva29aaFlUNUN1MzZqQzJUNVg0aGhRRjc0?=
 =?utf-8?B?b3o3MU9ab0dFOGVwU01NRWp1WnJ4Y0hPVmpnK1QrcklERzlLekNEOW5FR1J4?=
 =?utf-8?B?YXV1SG9rbFZrMXNlUlZTZHR4c0V6ZnV3TC9GSFVsZk0xNmlIYXJlU0FBVzhK?=
 =?utf-8?B?MGxNVHpOTmlNN05YQTVCWEl4UEFXU25LQjdTeWFtSWtpak1VcUZyQURFT1Yx?=
 =?utf-8?B?V1dya2hKQnhZMjJwblF0dUZ5blBzRG9YbDZHZ0RlUFJjY3hHNzFzUVBLakIx?=
 =?utf-8?B?MENYbG53bVArYWRyZ3ZLVVE5bkJjcUs2aERBalNnMDZmaVI1aEd2VXZHQ0Nr?=
 =?utf-8?B?RGsrTlp3b0QySXlZbjJOeis0UmNHa2FwSk1yWjU3bExyc0NRNkhELzJTOXhT?=
 =?utf-8?B?VSsycUlZRGFWSmNHWTZ3bTBEWEV2SktVZU5LN1lvRiszUVltNjFzNllvQ2hi?=
 =?utf-8?B?SUtVdFArN2VSNFR2elQ5QmpRNlZBakhLLzR3TEU3NjdLeC92czFRWVAwN2dS?=
 =?utf-8?B?V1hkem51bmMvTVRSYTNsU0pFM1lvaDF4ZXYzTEZGZ21rS0c5b3dCWC9QWnI3?=
 =?utf-8?B?OUFRakF5YVBTOUJ1TnNyUEpwbk1BUW9FUDlwbE5BZ3FhcUpiZ25yT0lHWHlM?=
 =?utf-8?B?cURRUWhmczlVOTRQSHRPbVE1VUV4STlreXliWCsyRldNVk9NNUVKWWNuanpo?=
 =?utf-8?B?VFZINVMvU0NmQ090dGozeUViK2ZRdktnbktCU2haV1EzMlEwS2lCOXczc1Zz?=
 =?utf-8?B?WFpGTTcrWS9DT0sxbkZjT3Y3eE8wY3BMa0RiV2JDcHBWbWdqVVVtTktpZVdD?=
 =?utf-8?B?VnU4dFViRDV5Nm9hNC9pYVZxWjFod1U1QTh1SGd1bllVOG8wenhDM2VZdXFH?=
 =?utf-8?B?WVpXNm0vYVJLTWVUVUc2bHVFWlcxNG5PMlJKOURHeHhndWNscEx2dEdXUkY3?=
 =?utf-8?B?M1ZOVHc1d0tyT2hGMVBGR1Z0TFE4ODRqdkpWd1pSZklNRTBLdFhwcW90dk5R?=
 =?utf-8?B?RFo4bDRsZ1MrUFBSYlFIM1RPTC8xUW0yYVRlRExrZCtOSDIxaDhBblIyTjh1?=
 =?utf-8?B?MjZMblRheGVXYTdCa3orMlZFTlpXQmVVYVJ6YVVZRVh0ZE1ISklzUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9eda1d-8c68-42b0-51c9-08de8b2c168e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:37:40.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm/4dUGj5ijmS/K9YQRuBDzCVCiqtgj0A7LhLmKjF8JNrbtVjWwc6yEQvhnt0ujPGyR/xc5wGCio+jeL6NAiaQIsW3oEkhVjOEPJCk2ANWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBeAQJV4ONkMp5AzPdKQ/RvxrQDjWEE5kQ0jTR+ZxF0=;
 b=b3imWcE+UWNLf4hURiPVHMDtVOpiMb3PrjffXICYtmZz0ZcoKB6afwtLvuxWbyASBher5eui3zvBsx9wQ2F6Iq0LXJ3bkrRDnhw+nkWS6uzg+13TeIhGN85OPa3Luy4nrxhct5A7Us0Ofr3Zp+EtXctU04k/uB+MSkEtCVnqGiw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=b3imWcE+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v2] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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

Hi Heiko,

On 3/26/26 11:10 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Trusted-Firmware has been using a number of CPE identifiers in the past
> but especially after v2.4, the correct identifier would be similar
> to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*
> 
>    https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE
> 
> Add the relevant CPE fields to the trusted-firmware package.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
> changes in v2:
> - remove lts- from lts releases
> - remove "v" from version, to actually match version used in CPEs
> 
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index b81ce0d827..c3c4a581da 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -5,6 +5,10 @@
>   ################################################################################
>   
>   ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
> +ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
> +ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))

I'm wondering if it'd make sense we don't touch 
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION if it isn't any of the 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_*. We don't care about 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION because we cannot 
know what the user's naming scheme is, so better not mess with it. Then 
for BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE, we cannot 
guarantee it actually makes sense. There are branches and tags in TF-A 
git repo which do have v or lts- prefix but also other non-version 
things in there, e.g. sandbox/lts-v2.14.1-20260202T0851, or 
dev/upstream. I think it'd make sense to not do anything about for those 
two?

Essentially a simple (NOT TESTED!):

# Better not touch user's custom version
ifneq 
($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION),y)
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst 
lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
endif

What do you think?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
