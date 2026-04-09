Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E957EA3C59
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 12:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7318540F1A;
	Thu,  9 Apr 2026 12:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3TqHjadQOvQ; Thu,  9 Apr 2026 12:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BC340DA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775736740;
	bh=gYHR26/IbgpZEoBCz18i8NeJLojX+Tf1PHNZe5lL5aY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Gb713rcZoxWq8z+f39z0snFk3WfyY2cSg+40+tvrLtAEayOT2HKYqROcAI93JWad6
	 jrnX0nZ8kJbwfQDuKKGBVnprcCdzchb+po1ZV22CdPtRB8tVfCqY56FDK8D7xRYEX1
	 rCqgcaPA2HQp/f7sYVP4NBlDr5mBIaGeqs1ina1k7nYMpBT8ekGOAwPXLvfC2eCEMe
	 yFEYJoh/kI4slEd+Pm9o0PXMJRiAYON3oRqljzK1BIkMTgsqFeUAyChgQCj0zWTqSt
	 bQgFwOy/XscHZ/gxWjI3lBh+v8Fakm7V1+xiqUz0Av0nfYsnMu4LLDZZKWvEUTXeOV
	 Mq0tGo4PqXwyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4BC340DA0;
	Thu,  9 Apr 2026 12:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7821A1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57DCE40D87
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAX03XptthRj for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 12:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8150040DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8150040DA0
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8150040DA0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHdjib/+BDM6+f/ubOuN7OE9gTM77kbYqyl5YQkBRdxkQMMVNy7vg/4z3hGzbxda5CUeP0JUgljTbLJgwwhG8WZ669SJlvmTXwhkFGX1xC04QT2GR0xwrjoHuXnQt4S+FKtxZYWg5TB+zOMmSSNph1lwwDx4byXDIoWI3BGtmdqVu7HkrnyigI5ZYl98V2wCbuvl92VIpUb8JTQC5jn9o1O0KTkvQgrQmYgNUMTaGDmGmQ/epUJEwx8yTz8RoyDH1LU3lS0F0cPeNtE10UCv798/zmTbmhqfGwgovozxjFlZ0/lSBWrpSewUfPbN8LwypRZGZMKMGb/JCNCvSC0X7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISj5sN4ZlGAjqAk55+mxVoLRZcJ7rjblB4YaNbs+hKQ=;
 b=bPN0K8kxzVf4l4i2Zlw+fZIzXGixbGRUoruM2vpFAabxlGkLMc2Oo3Fl1x9Wj9jM6RPlrWj6TJ8YnDevMip1FFXA6xnSBD64RG7TwFN+Grz97srthXLkUVTFXOjT8oZUbmIKhADbDKDNubFkVqS1/14jCzVh2FuNEL8PnvIWQzjbOjfekn1BxA75fnts0cnXN/wM1GvCpMA5ySs76cuGs2SaUH1fF6iYXMQwNuNzoYo2vwWa4tIguBoeZxyVCcslkCIiDgdRsDzu0y9GBtokVX2XImH7heEeVWZTgSUE8wi+5P1yaWIvWFtYxgZQBkFD2t/wczGCCDtEFGAe3rfvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV4PR04MB11976.eurprd04.prod.outlook.com (2603:10a6:150:2e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Thu, 9 Apr
 2026 12:12:10 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:12:10 +0000
Message-ID: <39a8d43e-c969-4647-a692-6c43b0d4f5df@cherry.de>
Date: Thu, 9 Apr 2026 14:12:09 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-3-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-3-thomas.perale@mind.be>
X-ClientProxiedBy: VI5PEPF0000091E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::92e) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV4PR04MB11976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f47a01b-53dc-48d8-a252-08de963139d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: KXhzd1vvgCDJ9p7ozYTuUpPbMU6nf25yRGaaqRvstJkwWS1nyjT2z2n4p+4v8V8om9ruKcOWb3t+C4AjFDOWXobD58eB4g6Uws3sVLk/VoT6bMJsu3u+LSZ7mEE0HkjV3vlf6M1u1PW4aMlh1dV2fF73/x7TnG2/srQo65XHjeAyZqmZ/BvNLLr9r/ykf0MwE4E4RvD8bInpCjdKwXwnuZM+5/i82fvqGJzHN7QQgeL7KbaD4m5FbZ+8VMJ9CEbqmGNRFpzIY/xU//Wo8ALAN9FYE5wbeKGcftBbBsctDnWRRH7lFTTEAqD6RqAEUrur4sjBmi7DBNgyUtGpKjUnT9xuwfgbQam5vmG2nDCUCABQmW3NO3Wuep1KZItq6CR6Oh9LUJkbSA1JAqLSMRjr551sFLK8JsUGcNEVRoEl1f36hTW5jGMzRerx+4XFJktk5EvQnd5wpLdkLeEy3oLD/JgfCq9GWJguFkDbfPy3yGT5lCrPGwxagojYplb247ZcS9F2MGI46PDdRtl++XWtKkoQv89ODeMOUm74A3nmGigM5tE91jAjtL23ub3af+1YkuJu4fmAt3FNjm18UoKNSYGARDMnShwxlzmPYaB7XpIzmy+QFkZYaeaQkTXPLv1l7PzC4GmeViwWnKCaIWEFcPuCboOXEKc3Z1EOKMchIsQuCrC7SY1OEe7d+huC6cmKVrb0loqeVAuO1ApuS6+qxFQf6v5TwZOfWe4JFqfxHx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW9xVVhYQ3E0UktveFhOUVNCNTFTNU8wWFdHZVR4NWp0azJaL3NyUFllcnJE?=
 =?utf-8?B?YVhDV1FLRjZzMk5JOHloTm0veEUydURPakJMZFc3SXFmLzZndWxIYjNHbktR?=
 =?utf-8?B?RFF6YWxZWStNWk9ibVpGN0U0UCt1SVZOSHB3WUlpMXI3N0NhZE00eUtVQllV?=
 =?utf-8?B?QnhqdmRJWnBKQTJVY3c4YjBCY3hDOFFJaEY1TEdKSW03SndhTUYrbmJHOUhn?=
 =?utf-8?B?TXNCbkxsQ0JISEY2d2svaGhJN0tBWkxCMnA2U2xMZExnOFJjU0RnK3NyVXo4?=
 =?utf-8?B?NWVtTVZlUHhsRHMrdG1na0NPQ2M2ejRJNzU0dko4UFhzMDJDdkdJR1lDamFy?=
 =?utf-8?B?Y0FnT3M0SlBXUjJaaW9tSFc3eFA1dFhldG1wV2JFc0VJZjJWSHVtdUJDUTly?=
 =?utf-8?B?akJBM2JCdVFZSWdLSTk0RDFUbXpXNmRJdmVqQWdQVjhvczNDMFJGb2xSVzN6?=
 =?utf-8?B?NSsyZmE4bnB1bTRuaElzd0hZZ05lTE4rb3V4Ykh2M2JoU1R3R3kycnVJQzVq?=
 =?utf-8?B?d1VkUjVBc1pPM05HT241STREcXZvMnRONnRNQ0hicVVOQzNZVXEybDFBZldW?=
 =?utf-8?B?NkJQQnJsRllNMVVZenZCOGNkNWxzNGwxWC8xNmdxbHpwS1gxMytseml4RXRT?=
 =?utf-8?B?L1dDcXBIalZycjdhZERDeHRDUHhBNkNsVXJQcVZkcWpqSWhmZG9rdUhoVmw5?=
 =?utf-8?B?REczNTlyTVZEUTNqWEJDWlV4VnAxZXdXMDFMcWhSWkZWRGtlcEdMMS83V3Rl?=
 =?utf-8?B?WjhDenNqS3diLzBHQ3puRUl3VVhKYTYzL1lpSEZzSkpYNW9GN3BLa0ZoWUxw?=
 =?utf-8?B?VUxjMmk3eDhqekdVQXRkRnZTTmxPTmxWSHc0ajhNNHVxai8zWXgxZS9HYVBW?=
 =?utf-8?B?VXJYZ3hvWVdoZmRBN0dBenFNamN5M3JoU0tlTWl5bXhUTHNZa1M3RVN4UmVC?=
 =?utf-8?B?ajBNWXQ2U2duNStIUGk5aFhKRjFybEhMWElTbEFlS202U2N1OW1TL005a29R?=
 =?utf-8?B?VUprb3I0dTVxd3M5V1JrMFcxNUFZc2tZdjFjcTlQbVhlTGlkSGZmamc2cWxy?=
 =?utf-8?B?eU1tMnQ0NW9SMlYya2NXc0RWcG5EcUt0VytrNmpIekxYcGtJenhrL2c4Tml0?=
 =?utf-8?B?WjN1R3RpWWh5RnhjdXB3OFYzWmZKNUZUZDFkNDcyN2VZOG5QQ3pUZExsZ1hF?=
 =?utf-8?B?WlAvTkU5Zlc2bnVDWXV4RGJGRFM3TmNpSHNkU3lLYWFqVk9qRUcrRzFjOHB2?=
 =?utf-8?B?YlM0d3hjOUFXSG9vWU41Vk5HNnM1MGRrV3NGeEwrMGd6cHNOcUpNdFRKV0xl?=
 =?utf-8?B?TXNZYzVVUkRQQk8rZjVmS29HakhrN2wyVkNOQVcyMzZMOHdod09VZE43K3NF?=
 =?utf-8?B?S2xSYWw1bkM3aXg3SFFEZ3ZVc3JXZFNnMEZtdGoxVDF3bWhIWnBTd3NETmF1?=
 =?utf-8?B?bHBYTTBqVDFDZ3NOSzN1K3g3d3ZjZTVueEhyYVltODBPZG00YjBid3E0b3Nw?=
 =?utf-8?B?NEU5ekwyaGV4QXd4T1Y1ejhoSm5jUWFLdGgzcmZXOTd1eEJ5NWZKYmhwY0Jv?=
 =?utf-8?B?YnRiYi9nMnJyY3VxZ1hGR2F6b0doTmVZSHRNaUR1ZElWV3Zta2VQNVA3cmlv?=
 =?utf-8?B?dktRZmMrdi9oN0hBcXBRSFJ5Tm5Zb2JoM0VSL0ZvSEpnSE9RNCt1ZVBqS0Nr?=
 =?utf-8?B?R3plRlFjTUt5VWJFaVVTYVVtdjk4MTBqNWhrT0lJRVFuNEs4UnE3M1BBeVZT?=
 =?utf-8?B?YVQxL3lJTUc2NjB6S1Mvcit6Y0VaWTBDckY1UE5pTHhEMTF3cnhSN0FxdDFH?=
 =?utf-8?B?KzRFUVQyQ0w1NVQ1MFhMenFGUHNNSy9ac1VWN3VvWnczUmptWGtEK0FiSUd6?=
 =?utf-8?B?T1VxTGtWQWJoUmthL3Z6cTJBU0dyazRISVN4ayt3V2ZRRytOb3pFUWFzVktW?=
 =?utf-8?B?eTZpdmc4YUJVaEtBd1pFNDNNWWZCUXVGdU8wRmpKZTJhSDBKY25ZV3U3TVlI?=
 =?utf-8?B?REoxaFU3TmJvV0VLY2VjSmpoRzBhb0lTM3ZkeXFLb2svK2VtSWd4K0dUei9o?=
 =?utf-8?B?aVdtYW5sWm1pRXNsMnF1MjRwMk5nbEE0WElMZkRVOGd4ejFvNEJCVjJ5c2R1?=
 =?utf-8?B?eUhkYUd1R25nNmRtSkJJdnZvOFhuamtLQmpmb0NKYXZIT3JYaVE2dXF0WmEy?=
 =?utf-8?B?ZHcwNzhRdU45RksvK0Y4Qi9CdGtRaXl6S1hYcEVsbUdTRWFySCs2eDVnakky?=
 =?utf-8?B?T1NHQ2xGRld1RVkxS3d2WkVLakk4QmNieFRwb2R5MytlVC9MMDhQTXMxNVYr?=
 =?utf-8?B?aHhCeko3U2VvVFF3TnNQZGF6Nm5iaCtsRVA1MjJsVjl3K3pORjJZTGt6YXcv?=
 =?utf-8?Q?A9jSZUPvuSgCpPWFoZz4b0H1X5ChN7A87cLuq?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f47a01b-53dc-48d8-a252-08de963139d1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:12:10.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrQsXjYgn4pHq9VTNoTMiNAwoagwQh++IZISkegjavPkq2kohMwP0EvapqEMxP3deM+lRcizM7pzZHFaHdFvAAnF1YBPNxQN1MQ4qMmmUr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11976
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISj5sN4ZlGAjqAk55+mxVoLRZcJ7rjblB4YaNbs+hKQ=;
 b=OH/VRVkpDtiTh9cbvMKeg0VjIjSh8WmTPNXhXWzN1Eh2/Hu1TribgGuxn1tYtTg980ITZSIlTHoY1n9mRb5OLUQ4zYd+wAPd7k6/svwW9z+uC+fOC5D4o0ubc5KXDvBc656PT3RApnt2Cs3KZytwaB6+JzVnU+w4FZGEHY7Ymqc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=OH/VRVkp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 2/8] utils/generate-cyclonedx: move
 license download in a function
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
> Move the code that retrieve the SPDX licenses into a function instead of
> doing it top-level.
> 
> This allows to pass the CycloneDX version as a function argument instead
> of defining it as a top-level constant.
> In next commit, the CycloneDX spec version might not be known when the
> top-level code is executed.
> 

Aside from not supporting patch versions (e.g. 1.6.1), this looks ok to me.

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
