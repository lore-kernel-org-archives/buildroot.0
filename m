Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D6F4613D
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 15:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718D040C0A;
	Mon, 23 Mar 2026 15:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akcaNz434N-C; Mon, 23 Mar 2026 15:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBC940C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774281019;
	bh=iVzX2zKU8C5zzGjNNwKACGEbOqhQYCO2PIA11/Z7EE4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BhV5+33gCth6y4dY2fUqKpBMjqeVlaDEjA0tvihh9UHjUtt8hcD3B3J6b0avoL9pt
	 TU2aST83gBun/DIJQyflCZNWLiJkvijLPEYrkka7hlIYsLFFj2iDgYbUl9HrKefS7W
	 Drq5HEy0kN1I+nyl3ybJQE2pIUnIvK9QBz653rWCkGxiPWYfkgikb93X5yU7eNmnvV
	 uDaPBV/FKHgkBPkhCHb4VwNQwu2Rmrj/5IY0mrVVpWYAXwceE9o8Ze9YLOfXnDQILZ
	 +Y8RSP9tIEkRrw7/dg9ZpadnkOcFEO+iWa6kwBCvCdx/SaFyfcLZNfIRbMS2n7QBNy
	 dZCYQ5xXZc6Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBC940C18;
	Mon, 23 Mar 2026 15:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 480721D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB1D4021F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOvWvq98U-MY for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 15:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 033BF40215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033BF40215
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033BF40215
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5J8hOQQh34I9GMjQIQXqac5T0hLoJkrYymmDcKLI4nK8/u0UYrolDjnq8jbaO34vcr7mBzWlqkIa/x+K2Pp3H6fBvqgJCEBW9FI+z5Fn+LMVeQvyjWUEwJvCjZkAH5iXrYHWuvv1fjz9x7A6LjAQV442sCPHoHKhRia9uqqLAFCwYr3H0cXbmNjyQXmYM8wJrMf9iYY8m4uMzCEjpVpqr6wAjbJsgkttg0jRh75Bc/Lw+g25HjgqnA4sTbGi9XtKrK400k5agmzeWz8n8EF96/sxlK2/epe956CTkMfhXBN+k9z+NcBLoytEpFpZXhw1TE02gxuwtmRcPib/1iKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVRrxCZuoUEVrOhqQcn6yGofTMlrnbGKp76zlkR4aew=;
 b=CCeZAmMU50t7dwpf7bpV7uFMI1Op58OdPWW+/Qz48tB+r6e7VZ6Ftjxajm0L3b5PdmtUo4M5ykuT9emvUdwsKAeQAScBbuDMl+zmW5wG7fhMa5yeF6WJklUfwKUcOG1o9SmJLg6+oIh2V4EjJshtZ8e352q1Zwlk9kV6vdLY2Ohu1JU88Q6x7Zllks+SkBcf86vhRDNVwY9AKPTlE2khRXmuQzuTmTuzW1HIM8ihso1iZ/a9ZzbJnDBMpwX8tY0Kx3fO0lr4YKOiIsJhNn+MUmoy4Ydy4chb2eWaipHIMLC9rGSoIoYErO8TcPMCzrhdDn53RY3axlPTgbp8ZOv4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10266.eurprd04.prod.outlook.com (2603:10a6:800:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 15:49:52 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 15:49:58 +0000
Message-ID: <b4ab5d3f-e0e7-4c97-9df6-7cfd4ba3db9a@cherry.de>
Date: Mon, 23 Mar 2026 16:50:05 +0100
User-Agent: Mozilla Thunderbird
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
Content-Language: en-US
In-Reply-To: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5446f5d9-dd68-4d99-fc8e-08de88f3d635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: VNBkQ+oq7f/CXgHujyKL9vwMKn28zrD7dvNsTycBMT2Z7/LyWyAher/ANpkyved0b8tKphKKxshvr2ImArmNz68xH6qM/xPJq+U5THolESOgXZcPcNaTbnbEipO5fMI6qfW+EOvanel2C3wcvmqSfHe9jYD7QXkINazQHuif9zelwVFCHPGz3JxIVM6j9iWJgWSlpOotZ3S0U0veRWHseSHUhrJWVvRsJeGth0zxdbzeUfZmdnvQQL/h2+j07r+zYCC5FOzo7tPHSgtE41pcVtHzrl/77Jl9YovVG1ObaO1XbVI1I2cpLmiGZaj/ApgyBMTZvpBwedPNgoLrF78jALceAzcJycHtUvSFdQrIrj1shcNnriJAWCGy3dyOVO29GEoArBshoDncLK4CC59b12S7l+TT3CLCTq7b3NLX/7TTQcf5xdpz4lccSxci9eFXHqqVEoxMCKy3pqqGcw6tGMXxNytbbs7N52aQBRQv0l0qnE1ZWwL5fT7TsHAgBPyk1avsNp/cQvwdIh15U1KPbsnZrYRQT1YIZMQN9oMn+01QgCdgtm1tX4DKtk2Ii9AUkfu0GFr4nmvb+Rc8liE0C8tHwf6bsp+daWl4Hn03Bo19dRqE7gVl5MLLi2mtHGGitKyPmZ7PanTgj2YPC7Bud62HxO/FDLdgRF1jgo8964biolKWSzO58KHJWxMcjBFwQEBHp4njcKHoB16/AZoESzP1jcWbJL322tVLXLOBLCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lGSkptdWxhWFF2UkJGU2VQcjl6UjJSaFJhTEh6SHNyN2ZqazVTaldrSW5O?=
 =?utf-8?B?SUpMem5kaWtMZGdTdFN0Q1Y3aEwwUFQrVEdVTFFiblYzSlJ1LzAvT3RIZHhk?=
 =?utf-8?B?YUNPcHo0cHRZL2xHZkI4SlVPeUYrTndVQlhUZ3pyWCtKM0tmSTF0RXJUR25C?=
 =?utf-8?B?dWdzY1h6UlVzeWFjUVNLSGpQRktLN1VESndHZWVGeVVYMDUzL3NsQjBkc255?=
 =?utf-8?B?WWk0bDdqNE5jcVZpVmQ4bExyazBXRDRlSk1NU1NLT3JJaWFXREZHSnAySU9i?=
 =?utf-8?B?STBESjh6VWFiZEpobmdaZHRYRHArcUU5M0N2MVFOcm1WQXoybUNBZmIzNDR5?=
 =?utf-8?B?YUJPME1JS2tYMnVETElSZWswOGhxdDBOYnF3MnZJWlZUdlZqTDROQUo0MC84?=
 =?utf-8?B?S3pRcDlTWENDS3BhcGxQTkJlaksycGRJU2k0NFVreFZkVjlCSHIydzdSWFBD?=
 =?utf-8?B?a25ZN0VHWXFVN2Y2d1NPUHhmNUoxMGxpT3VwYUpNQ2l6bEhmUkZBaC9ybTJH?=
 =?utf-8?B?dytTT2kycWZDUjUvYXJmd3lSUjRITUVLbzFhbHFsVUhIZmNsTkU0SWFLNUhO?=
 =?utf-8?B?dW1ubmVLVGsraDhubTNwNlV4TWUzbjY2ZVgvMDlKb0hjWmp1ZHgwSjIwWDA0?=
 =?utf-8?B?cGM2NHdMbVZGemJ4ZTJzN1hBZ2ZDN3pBWGNGMzIxazBCL3RUUWZyV0lFRGZH?=
 =?utf-8?B?VnVjY2V1SndZM2RzM2RJRVF3dzREbjNmcTFLYUNaRUszRk5Kb1RzTHRmQ2JO?=
 =?utf-8?B?M0pIdmRmOTI4TDNSR2RjUTdBWTZDb3hOcEhVZFZ2V0RYak1mbXhkRFZjcEdm?=
 =?utf-8?B?OXRHdEtqNlhGcjdsY3VPTExzMC96WWsxTWp6NFFEOGdvMWhaNkJBdGZGWGI4?=
 =?utf-8?B?Wmt3djA0Sk5vNzFZUlBkUnN0c01rb0pFekJyc2szc3cyaXVSNDNacFdRL2RD?=
 =?utf-8?B?QmN4aW1BZlhXVzc1czJnU0lzK3AvUUJvV1F5STRJK0RCVUtWSXc4Uml6MStQ?=
 =?utf-8?B?KzBjOGhrQ1p6cjBRdUl5UER3M0lnNzJ6YjdCTFZzL2FnUjFuOUk0bWxvdGtN?=
 =?utf-8?B?ZFZXdjJPdW5RRFYzMS93d0t6cko2SVJZM3dTTlgrdTA2cGxQYVFaTEQ3K1lS?=
 =?utf-8?B?QzEvbHJrWi9UbzFQbG8wL2NpWDR3L3hYS1llczZPZEE1TDBuc3hmZkI0OTdw?=
 =?utf-8?B?VGU5K0lWd2hjSG1vYlpJRnFaSkJnVC9SUWg1amU0SjZQdmlRR01oeWtNZ21L?=
 =?utf-8?B?aUZsNzlJbXNGZlc2dnFBVjlxTkpmSzgvZFlqTituVk1Pb2pQd0oyaWwrS3VR?=
 =?utf-8?B?QUh2Y3pXZXRHUGcvOHgrYm1waGYxOEVoSS9UajZiQjdYdEJ1YnRTSDhuOW43?=
 =?utf-8?B?Smg1MWtGWEdnSys5K1FTdDEyeG9Oc0tuY3B0M3ZRZzVFUTVBTkhFOFJmdUtl?=
 =?utf-8?B?OHVnNFczSkhid0RwR1dQUHNMU0JYUEU0ZXBjYzVuVk5LKzZiK0ZlWFdtK2N3?=
 =?utf-8?B?QXA0cng0VThORklIdUlrSXNtWHBDeTNqS2Y5RzdIUlpQZE83TGswdHo3dHlz?=
 =?utf-8?B?TUtwMnE3QU5OeE5XcHBqQXpJaWhKZVVVTTJhVzRpY20xT0FXdlJtVWdqd2tT?=
 =?utf-8?B?dGdOc21zd1creG9udGRvTVliL0VleS9BV05ycnZkNmsxVlg2YXZVcVJHT0ps?=
 =?utf-8?B?VE9DRFNod3NXYlBRQnVsbEJFZEZva3o4M0hlbDJvWmJPY0hEVXkyREFXVGFK?=
 =?utf-8?B?WmxxeWpBcjcrc1pNL2p4clRSbGZPUTZMNHhuMWF1VHFGQUlKWEh6UTlEWGFK?=
 =?utf-8?B?OU81VjFRcmdhVnc4UE8vdE9ldWRkcjQ3aFpLT2RCcWhHMm41RzQwa2grbVJ1?=
 =?utf-8?B?bVdUVE9aZ3RuR1ZQdFZjOWVHWnRld3piZlM1NHBIWFRlcWh1YzVOYTFZdm1C?=
 =?utf-8?B?bHJnZzNuZ1VHSFdyZlVhKzhwbnF5OHFYY1ZEYWdhZXczTjByV0tsaXphM3po?=
 =?utf-8?B?azhjclAxM2t6M2VDM3FBaUdsZ1JtZndJZEo3ZjdpNTMydDk1Wlk5Sm9pMEdn?=
 =?utf-8?B?Z3k5QUtGUTZCTC9lT3BCTTdSZ0Q0QUxqZ2k0UVNIV0ZyOGJNcEVWMXlaU3Fk?=
 =?utf-8?B?MnpPR2tPazlTMDN5bDBuNEY1QmxoY2xSV0ZXZ2NkZlF1K081bjVQSEtlYlBU?=
 =?utf-8?B?NXNDdnVzVTJnbXpQZXRLM0g0dDlUMW5KZHhoN1c0TlVzNjFselJleG5jdzh1?=
 =?utf-8?B?Zko2cTIxV25VcmhNV0V5S2lBMlVmMmJINFFGZWZUeklOM2E2RW9DUFVpQ2s5?=
 =?utf-8?B?N0xoQkEvZitEZ2xhYXc2QjgyZUJrNHgrSytnNndNVE9QZkd2Tncwdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5446f5d9-dd68-4d99-fc8e-08de88f3d635
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:49:58.6837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bZNk2ccmhuiRTSuS9PPFGYb/UtA/1lIRAPMD6zCK41KPWwflmLXny1Wk/BtsrJpHcvPPdjg5Z6gGQZYFALTxqINn0EoS41fnfrVL4UZ2Yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVRrxCZuoUEVrOhqQcn6yGofTMlrnbGKp76zlkR4aew=;
 b=nCzUi5xTPhS1sOQ1SHGv4E6/m3CMpBJatUp5JqOH8BLb+fAvLKmObNeRkgdyzv40/8CpYNVdO+n/HAv47o6ez3ZPPsCerwsVfARsC+yJj4fNgmqwqbHPib4sxcxz45JQed/miZcyyCvgru3j6oDbtLTI9UW4b898/7kObhroSes=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=nCzUi5xT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 2025.02.x v2] Package/libopenssl: security
 bump to version 3.5.4
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

Hi Jimmy,

Your series is somehow malformed, all patches have v2 instead of v2 x/5. 
Your v1 had it correct so I'm not sure what happened since.

I highly suggest to use b4 (https://b4.docs.kernel.org/en/latest/ and 
https://pypi.org/project/b4/) if you can. Otherwise, I believe you can 
generate the series with
git format-patch --cover-letter -v 2 --subject-prefix "PATCH 2025.02.x" 
-M -s -o outgoing origin/2025.02.x
as hinted by the docs in 22.5.4. Patches for maintenance branches.

On 3/19/26 1:42 PM, Jimmy Durand Wesolowski wrote:
> As indicated by Quentin Schulz <quentin.schulz@cherry.de>, OpenSSL 3.4 is
> EoL at the end of 2026, and thus earlier than the Buildroot LTS 2025.02
> (end of 2027).
> OpenSSL version thus needs to be bumped to 3.5.x, which is currently
> 3.5.4. Note that a new 3.5.5 release is in the making.
> This series brings all the related commits from master to 2025.02.x.
> 

Considering we're using this series in one of our products and that 
before that series we had backported the patches internally and they 
were the same as in this series:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
