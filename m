Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494D9C531D2
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DBB4099B;
	Thu, 23 Jul 2026 14:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJKG2s5JDIKN; Thu, 23 Jul 2026 14:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A376409A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784817870;
	bh=lj/MDV/C6I7OLtvAHKBq6CQ8WazzAXT1BSuEjfhBiic=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=k6y/DHpn6WMvLzV7+GCKwo27m7uTdf8cf4m8h/LnXV1HFYhED4E+xdDxFE1yH08F1
	 +UStCIXhi3ufd8mt8gZzUrPiQuxSdT6GRXFWoeAr/nPsCnPkDI7UBcsPLbPThTAnRw
	 5SqXime0bJa9x1VyOAT644f8Vd6Svbkz+I9ihcbqfPDTuCDjQKIePcOQVcmZ7eNWJE
	 Ingr6pQ83KzbVJVE/6P0mJXdydmwUdIZvfaPeyEdfSShpP9UWErbm/CClWT85zM1az
	 GAq5ttOUWXjjLpKM3p0K7Y9/m85IIFhVF6DK7WHJNTGLqaZ+dD3hNJIgOcqDo2XZsC
	 tJmk48LFFAccQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A376409A8;
	Thu, 23 Jul 2026 14:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69BBF390
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE9480BD1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DDksRsoCRRD for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 14:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A710809B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A710809B0
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A710809B0
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:44:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/34v+h9mrKfTQme3opWL0hnc8eHB3SJQ15EJ06A8jY9dMH/cvKckcGoPvycSXhQZOHjvIfgmlQBp4fP6oTTGtFjVlDjHb3IUn7OWMkKJMKVDY16TL1P5Ns2kJTa72gNrvfUzUpi8gqpL2HjbdEhFQ1EttLH/71LhnTLbOB/rM/JTWfOKzlK8RATWh3Z6HT4EpIYDfUoXzvGlwf+NTHv0s79dfUQ89+aISOGQQHMGKYJFY63Ip/WwAACkCMd+iOzVlhkgIgiO29T3GaLSfHyYeh1ad0XKw4Hnu9bAm5oW1dwtPRN1fCRQzn6mS9oo4W1BcP36+CcaMgq8D5wZY/Iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mCQjU27BJGv1JzHIyR0rhRe0kHVHsNSAeTvrMob/yo=;
 b=zVhPZcd3s7p0RsQ601Q3XsWKaeSAc57XzsivAQvoKI39q+w9TB69WlCqpvWz1tfZxj1B0bGigAHhP2JQQNWyKm/hpIxTG/j15DIeI+Q7XzeIBC0LNcqYZs6SBWoiyZQrPjj02Rq+VhlxEvV+di3i/0l8IWLZlHokXJUKe2VU7ab2YQSCEymknGJqA9WSXpAZzk45dCH5CIIwaT4RsYON8aaRtAyAasOaW+nOSdSi4zpM42bMHize0B17xK0WwdSIjef0hCEX1geUF11A7WiWbSQUz34T2TNYHbHhZD4rnb5nNsIn0W5ZUNpASqnbs6HYHQv5NTXKCxbMGzgOkw8NmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 14:44:22 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 14:44:21 +0000
Message-ID: <5d0175be-07d8-4fbc-b105-5a7d066cecf4@cherry.de>
Date: Thu, 23 Jul 2026 16:44:20 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-8-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-8-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe2749b-646c-41a7-9ae3-08dee8c8e1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: eNtkgzhSkkcAiu8mVZNuYlfp6fyEkxGK1ifzowTiHPpnuHIEJfzWY5rnOyeV1dVXg8HLlXNY3LWpJVTOcyzhUzWgmD2f0mfZjakqWLQERIfmbhmmnpDHdUA7LYeOi64IltCJedJzRQsPUm3Mtx19FNkitRG/WMoCV/Pb6bFW3q3V5XX7hbHUT7tpE/9hgvbu6FdsnKsvk6Yjdi3aah9UA/oZ3ulj2WNeg/SNbmhsCwIZemQVcsY6rPZXaEoYnBUBQBdA0378Nj/KXqZUz4Te2gxir6C6WYtjXvUMeZ1DRXvQqIfm88lgcCNi5OND/XThBfZjrFL4195/r1SrnB3aKs7d6ky7qhspyoqKovI1nelH3+mkN6oLcyeYxCnUxx9ry2+Ss4eCrOsLPnQ3A0Pw9WGyVomfM9p2rpeyo9j12YsDeY32bBTeWJc6XBmY4T57r218YPcpqKGyM7ngWq/zzKLe2dQ3sgh+3ia24fDD4aUCgOYq3CosdqnrXC5XS4jl92ITNjt09PgPakQIJbw1SGD4hfu6z7iEvJkSWg0W5QhbRqsul3A9BlGzxYkwmLDEwsIzz5Wm8cf+Ewfl9hXiM235jltSYtEOq2NWZP+k3vm5SnKq1GPU/HLnlh8CnPBUwvxplVe1cNM7/sadmfgbG8bAbpPvfX4pYRkRtvVgRms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhoNVVHN1IwWENlZE83MVc2OWx1U3c1bVRVZHB5Q0wraW9RczM1QlVZOFJJ?=
 =?utf-8?B?eGYwQ3lBbnNvL0IwaDdRbkRKYjYyUFhKOUkveWV3cVhITmtJMUZGUkxaWUE5?=
 =?utf-8?B?bFM4czYxRU9DQUxlK3RENFVickdodTVRbW9qeGF5SmFmYnR4dzkzUHFubFFC?=
 =?utf-8?B?cUJFbmd2bWxXV1RSMmI4OHlWajdvdEsrVDFnWDF5NmVDbyt4c2hEZnJxdVlV?=
 =?utf-8?B?RG9MRUllZVB1cUd4T0NKM1VsTExoMWRTVmQ4UGNoREZEd0s4ZHhpVWpySVZR?=
 =?utf-8?B?OHIxdWQ1N0VwSURuOWNITS9UNUowVXRFZVdndFlNbCsrRkhXeE9Ga21uVVhN?=
 =?utf-8?B?cXJVTE1HUmU5dlFycWJGZmVqTkRwbkpjVnVZV2VINVk4dHFYMjl2SkJEWE1U?=
 =?utf-8?B?bHMyS204VmRUekdqYkxpcjErWlJ0dS9PQklSOEtuMFZEamJqRm5kQjV0SHNo?=
 =?utf-8?B?LzJJQitaOFlTQXJtZWgwTThjazlRcDBtWllWRVdtL0tjdkhLYm41OTFtLzUw?=
 =?utf-8?B?aC8zVStzMlU1TktJaERsN1FWbGRQVHJZWi9ZNDJkVWkvTitrR1lQanhWcENr?=
 =?utf-8?B?NnY5MEhxeHJhaG85QzB2ald4M3k4NjBua0VWY1VOcHlvR0RIbTRoSk9oNk5r?=
 =?utf-8?B?QktrWEUrQzY1RkwwalhjdkVjekdJRzJCVjJCZDl6Rmx6RVV2a0hFSFp4SnNu?=
 =?utf-8?B?ZmE5QzV5SnZicFN4TnE2MEg0OVJEbWVwMmRVdURRcWdzcWdvdWZUdlNDT3hX?=
 =?utf-8?B?S2RiejQxNjljNDhjQndjVlQzbUkwVzZGTTM2SjBINHdXZTJDaDR3WSt1OUpz?=
 =?utf-8?B?UUxjWlcyTDVMZUNuMjNsZnRWV0prUVJGcXNiWnI0K05Ea2NqNVhyaEVhcUZx?=
 =?utf-8?B?UlZzUjNPSjdqbHR2ZzZJbDNnZ0dnNy9xR1BSK3dHYzNKSVBkUnE1QWhxVjh1?=
 =?utf-8?B?ekJSMFNlY2RPOHR5Q0VGNTJVWnFCNUxYZmloUnRuQjRHSnZXbUhoUGhvMktF?=
 =?utf-8?B?eDhGNlJVai9TYUdRQUk1aG1id0loelRSdk1lL2ZaQkx2TkNhL2lhamk1d1F1?=
 =?utf-8?B?TnFkNVVwTHdZaUVUTllrL3JackwyQ0RrVmxGczlsQ2xDRWNSQ1F1cXVQUlRL?=
 =?utf-8?B?Y2V1NFZXMFpKcHpGSHJzaW1SSEhUZnNndHdqbkwyVXFsUm1HbUR0U0RacFVw?=
 =?utf-8?B?NW5uWWovSFZFaFBpWWlkcXF0cHZJZ0Z3dUFZd0hYNzJIU09iVDErMHBEU2NB?=
 =?utf-8?B?TEc2M1B3Vzg1TkgyenRCVGYyamppUDBFSzRZWE5LWEEwVm9Da1FTVVpFYW0x?=
 =?utf-8?B?am9ibDYwTUFzSWI1djBwK3NTVWNXTEVoR3o0WVBjV3NTMEV5cmNrMDZwMWpB?=
 =?utf-8?B?MVB6ekQ0OHQreDRWVkRYeFk4eTBPU0lFYVoybDZHZm9yNHdWNEdNODJVemRM?=
 =?utf-8?B?OEFQMnFwVnh2NmV0SDI5dzVTcktRT1RWZTY5U3B3NkdOTFpGZlBSNzhLM3Jn?=
 =?utf-8?B?am5TVWlVSlg5TlM1eVNzS3dmSVpwRHdvMk9NaWlzTXo5WUdjK3hmR2JNeWVt?=
 =?utf-8?B?dmRGSG8yaERBeldjekJtU3R0UUJTZXc1bXl2UlJaWUFNaTFMTVA4V3p3bldM?=
 =?utf-8?B?QkpjUDhsMU1XNlZVcU1uMGwxZVhQOXVqMHBtUWw3K2I5QWdNcmQ2eEkrc2ZN?=
 =?utf-8?B?YzR2NlVYYnhiQzlzMVlKZ0JVWnpodlFKWVBCVFpRYzlhWWtnT05WbFpQZHor?=
 =?utf-8?B?YUpqbXg4d08xdTBzRjF2VVJadUpmc05CR2FmMU1mS2d1Rmk2Z1JveU5keTVF?=
 =?utf-8?B?S0UyMVdrd2Q1MTl0QS9GY21TMUkyeG80RHh3SGtvL1pHSjZxb0NHZjQrY0di?=
 =?utf-8?B?WWhTTXA2YVhiYkhFUkNtTDdScitLN05iQzNsdE9jOHk0NTl2bzlBZ3F1Q1g4?=
 =?utf-8?B?NkszeFlZaHdpYndMMXVZRjdBdVpTWHhzMlBLSFNYK2tRZHJoZjBhVkZoMkEw?=
 =?utf-8?B?WHk1cHpVRjdzMkZUa0dTNFh2V1Y0NitaQWpyWCs3b3ZlM3NqczhxcHNDbFM1?=
 =?utf-8?B?WlYvWkhXMW9nZnBlVUxXWnd4VXJoVWVJQTl6RnlNcnJvR1RsNllPcndHOUlW?=
 =?utf-8?B?Y3dNdzcyZWFNaEZFOVNPNGtqRGlZM25teHlQNHVwdGNPMThlVVFrY0hmYkRs?=
 =?utf-8?B?UzMvUFFOQWp6VUhQWG5jV3FZWDd4bWxNRGtQRDBlNW5zV3ZnbmtqQkhoUlR5?=
 =?utf-8?B?M2ltY1crUDQwZ0JPSlFHL0ZGbHNZek00eFl0T3RIV3E1azliMGxFRXl1dVcr?=
 =?utf-8?B?eDRQU2djNFFMSi9VVEhXN2FLb0ZmQ0N3VEEwODNSM2daS09VRmoxQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe2749b-646c-41a7-9ae3-08dee8c8e1e0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:44:21.4848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYyp5kZ5DrvgMT2out6myH4hRQQ3lTLYYZdkQ21hqbF3ruVWO06EgJGGsJeuh9dhh2g3QQfq9w1mCmhf/xqW56ijBbDbtNBOrXJ40awuUdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mCQjU27BJGv1JzHIyR0rhRe0kHVHsNSAeTvrMob/yo=;
 b=NU7ox8GH+E50Qq+P2kLaQThj4j1SlHp9hz8wgYK4R+KowP5d4GbVo6dgjxA+a6nMJyWf7w5Q69aAxJZe9afj4b8yM8zGPWaH6o9EagvD+y+wyFGpvuNAr9yDFbksc9mwtMS+/smRClOrAE1xdNEzfMYIkle+nIE8vSLEGTzbMx0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=NU7ox8GH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 8/9] utils/generate-cyclonedx: split
 vulnerabilities per state
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

On 6/24/26 12:13 PM, Thomas Perale wrote:
> If a vulnerability is present in multiple components and only one of
> them has a patch that addresses that vulnerability, all components will
> currently have that vulnerability marked as `resolved_with_pedigree`.
> 
> Right now, this issue does not affect any packages, but in the future it
> might affect packages that provide multiple version options (e.g.
> gnupg and gnupg2).
> 
> There is a small chance this happens in a real-world use case, but it
> may occur in the context of maintenance when running
> `make show-info-all`.
> 
> This commit changes how vulnerabilities fixed by a patch are stored.
> Instead of placing all vulnerabilities into a single set, it now keeps an
> index of the component for which the patch has been applied.
> 
> When generating the vulnerability list, the component reference is
> checked instead of only the vulnerability ID. If a vulnerability ID has
> multiple states for different references, multiple vulnerability
> entries are created with distinct analyses.
> 
> Consider the hypothetical case where gnupg ignores a vulnerability
> because it was introduced in a later version, while gnupg2 has patched
> that vulnerability. This would result in the following JSON:
> 
> ```json
> [
>      {
>          "id": "CVE-1234-1234",
>          "analysis": {
>              "state": "in_triage",
>              "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>          },
>          "affects": [
>              {"ref": "gnupg"}
>          ]
>      },
>      {
>          "id": "CVE-1234-1234",
>          "analysis": {
>              "state": "resolved_with_pedigree",
>              "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>          },
>          "affects": [
>              {"ref": "gnupg2"}
>          ]
>      }
> ]
> ```
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 672e7ed815..e12a9a4629 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -14,6 +14,7 @@ import json
>   import os
>   from pathlib import Path
>   from typing import Iterator
> +from collections import defaultdict
>   import urllib.parse
>   import urllib.request
>   import urllib.error
> @@ -39,7 +40,7 @@ BR2_VERSION_FULL = (
>   # Set of vulnerabilities that were addressed by a patch present in buildroot
>   # tree. This set is used to set the analysis of the ignored CVEs to
>   # 'resolved_with_pedigree'.

It's not a set anymore, it's a dict with keyvalues being sets now, so 
please reflect this in the comment.

> -VULN_WITH_PEDIGREE = set()
> +VULN_WITH_PEDIGREE = defaultdict(set)
>   
>   SPDX_LICENSES = []
>   
> @@ -218,11 +219,12 @@ def read_patch_file(patch_path: Path) -> str:
>           return f.read()
>   
>   
> -def cyclonedx_patches(patch_list: list[str]):
> +def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
>       """Translate a list of patches from the show-info JSON to a list of
>       patches in CycloneDX format.
>   
>       Args:
> +        comp_ref (str): Reference of the component the patches are part of.

It's the bom-ref of the component related to the patches no?

Looks good to me otherwise!

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
