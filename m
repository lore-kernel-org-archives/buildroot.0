Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856791073C8D
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 11:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A5160E2A;
	Wed,  8 Apr 2026 11:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmbVsGg5SBZp; Wed,  8 Apr 2026 11:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C1C6083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775646094;
	bh=YZr8+cNmEzrwf+Nzz8dMYBDY7yLybkd1w8WJvyp6q/U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cOzdU08cIUgIV9h+Ze5smzq2vEqoZfRfeL/gsgmTlXzGE6nXO5DpP/y/Y04ZnxHGg
	 zaPKryTvAVtgPkwGHzKzK+LoVdWhVZdSC35PSH8J0N/TAGIiCFo5hUvmFUqWuKtI6y
	 Ubf+80FfOWyTucCAwffiA0RSCjltwl9bMBjZG7id1zrJZ8kUkLv2mYJtwysb/rs4RB
	 6YNjM9KVldm7eu4VHsLEQkAvsYsfIKIet2z0SvW9MFb9qGQ2IMYORD2MPRojE1ckWp
	 CAOxrl21j4y5jBF6S0ifPF8+jjeY53PKlpwGNiVp1O/ydDLmQ7SGXsiuyBoXYftUHW
	 731U7qIdvvMCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C1C6083F;
	Wed,  8 Apr 2026 11:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 504482C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4271440E8B
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCxvaBmi_reb for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 11:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34BB840E83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34BB840E83
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34BB840E83
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doxHEgWD7RUaDMJEomrnli0ZbBDBEs4uCE0xKpvN2cRMeyvXdozLmDIyvQFvgad8CFS9H4+WToWyMcBFY4Eg5vh851aEF0gQFqDgfxfRECxrYBT8m7VUjg0xv7PyZWMO3gNehEQacVms7o23GutLECFgZfDe9pQJwm6DocElFjIY/rWsHNYBhBRFk5Qw/dLWxGaKQ63rCS5hMY/UG5RCHxF0WLRehBRDxF9Z1wijRKJABbIngm6aGkK9vRbL8HF8b4E8OOt5zs7Txy3G5+ZdJps+XqrLbofNVmTVBiypYhpDth3rI6iqwhTcvP/37DuSYpWlrXLzWEmyrQf+0ahr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzYacM21NZZilMNOr7vmhiTOL+IBOw+gQDMbDPfak90=;
 b=Oa8MptG6sm/dfoaoWBx7vIWF2o0r/QjRbIU6Umr26xNYYC+7dCC8rXBLJ/6d7ulX8cHtMeMmsT+2okdL8w2106RUQOF+BfzVizsXtTKTI1uTFnh1v9Puui0myYJ/KzXcGFz1tBUUsYzsRw8dlAu9TPzGdwAc5WVofKeSM2b5mfDNVsuLqi8Z1bpKy47x77QY+HR1c98CYAumbUrFCVfG6OS3siXndvriq+lPAtDBw5w1SAYZhJ9AUkrOBYFDRLVGmxmkrWjiHRQV9htzf9O/JpCaKX3/acVtF3b1AWdEwmiA5fZj2+GU9vcK5yphIkm8x6GW3Gl8sCbeSvSwvWBpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10564.eurprd04.prod.outlook.com (2603:10a6:150:215::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 11:01:23 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:01:23 +0000
Message-ID: <a4f8b160-2e79-474a-a400-53755144d826@cherry.de>
Date: Wed, 8 Apr 2026 13:01:22 +0200
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
 <b49e9bd7-762b-4206-baee-25e92b1d48d9@gmx.de>
Content-Language: en-US
In-Reply-To: <b49e9bd7-762b-4206-baee-25e92b1d48d9@gmx.de>
X-ClientProxiedBy: VI1PR09CA0142.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::26) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10564:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0f8567-88ed-4903-a5e0-08de955e2c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 3IKnZcDQiCkoVcpyeq+e1gUsL5KgUenBLXGWOPOcfv2RciHNwZrqv3onWGe1z2iCP7IqOBeItwJ4XcQ6k6FPA/dJDbWIKU2uQlEK1sUWBrgaqjNIL13XF/iuPbQA0FpqQVSd6WnxYlyxgug8PkExgZbdjoDbUG86g5sRttGHXJe7buWMkGfD0NxVvrwhFlZx9iZAW4O+bsyzbkO3gJD/NpjM8kmPCIwp7ifY9mZknF/hCgss7LYvlGGxy9U2ZyjfEgI2exAkeaGp5DqzRRtju7CF+Byy9SMjlV3pC06Y4MuTwk2GEqaWVNgfR8N0+PmFpgczc5BPXFwFq864Nwm0FyogHoyKnz729muzlKVQ4nMHUJAjtcfne69Fi139hy2bMSIEg6GsnrCTpc4fYFf8+iUUg4Dg3dmFt+ycdjzIahkaaEDI5v5i2tMmT8AmxrM5ig7ew0T+8HVCxw1XrVo1TcusSOwMDjJoVUZWiDl+2YfpEqPcMbdNkhSmKJqMlAB16HlcGE3FxRaZmP5qa0fdCWDJp34Kr6T2lStT3clADvef3QX5oUo0ciOK5R6bZ57fo47EdbG49nGkOqD/L0kwtRLv/s4RxYj9KNhFeNgpbqcIwpip0TiqbX98udrzyPVxRRSgBAu6EmXC0/vYziQ4nxQSCmfL49HhipPigkvZlh9sRPYz06gp5qNfCzEyKckl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGlqQUFJRVZVUDQ0YlE0eU1lVmtNM2FFYnIxM2FyQmdSNnhMa1lvaVJTOHVx?=
 =?utf-8?B?SEpaVDQ3R2pHTE9WLzE1Uk1YL2k1amxoSjBZNlBMTGZRMmxGZzliNGUwaXoy?=
 =?utf-8?B?c0pxbXpxM3ZCeHIwWmtQaHhCWHZTbGY3b2w0SXFCaC81SUZWZG9SdXJwTmFI?=
 =?utf-8?B?bHRKRHlkZWlLREVneXFOdS9jN3dONmF2U2JDUjVQME5xY0crS01aRFpWaVZP?=
 =?utf-8?B?TGNCZkl2QnF4dTVtSjNQbW9ObHVLQTBJc2Y3Y1JIMFhld2hYb2VxMXVveGtv?=
 =?utf-8?B?UHhieEh4KzdkRzFFa0xheVorU2IzdTR2T09oZTZJdW1WdXhqR3BPN1RHMjM1?=
 =?utf-8?B?QUJydFhQUjJmYitqdDdpUFNtOVJGRXJFc3E0VTdjMWlmQWRVVVBqa2JyTElT?=
 =?utf-8?B?clN0dHBBaWNJMUgxNjNxYnk2UlRhM2pQM3dUQ2p4SFdwK0o2RzNXNEsyZjZh?=
 =?utf-8?B?Z0JaS1hRME1yeTJRWlpadlAxMTdLajRtWmphbzFnRTZpcVh3bEtKaGxSeU5j?=
 =?utf-8?B?UWsxZHZPNHJOaWRBT29ad1RMNEh5bGxDUVpYdmpVUXp4UkhWQzZNU0hWNkZu?=
 =?utf-8?B?QUhtbUNIS3N5dUJjY2pwQTd6WnFWSWpseEZ2NzIyd1VZak1kcTRFUkpOTkFj?=
 =?utf-8?B?MksxVmdTS1BNbE53emJWZ0lrNkhPNkFnUklic0Q4SitjaElYUkN1bEJjRlQw?=
 =?utf-8?B?cnpURlVBOFRPMzRYczRzWVN3U3lxdllsb3dueWt6Y3J3cUFHMnhlYVhtcjJJ?=
 =?utf-8?B?ZkVOTkEvSXpiMGZoeTJ4N093THZUU1MwQVBpdmFDN0hJcG83QWlJQ3RRMFU1?=
 =?utf-8?B?MWlTZ0ZjVnJNQzVzZFBwd2ZTWThqSUludjRldFVlS0hLTVFHbHNlU1NkOWxQ?=
 =?utf-8?B?VnlYR1pBd1ZiYnd4VXpNZmV6VFczeTZNRTNsYTNFQlAyRUF3YXZ5QjdZSHdV?=
 =?utf-8?B?eE5HazAwQkRZcmNTbGpBZU0wOGdrRXZ1dkNRVTVIUmdid3pzMGxkd096OVFJ?=
 =?utf-8?B?S3Q1Mi92UmpYZDR3Zjh4V2tIZDRYaWtZdHFYTmpsQVFPQUlTZStPZXo4dVBP?=
 =?utf-8?B?dVppY2t0aktlWlRPOW5idDNiaVV2MlRpbjE3T29xeEdOR1hxUUVUcW5WeFEx?=
 =?utf-8?B?Vy84dVJJTWl2blI1V0I3S1gyT0t5MmZBWkQyY2x4cEFvbXZEMFBmTE5vZTRq?=
 =?utf-8?B?QW1zbGhjNmhIb0J5OFpMZ1Fua3VYcmtoZUN5bkl3TFdJZDFkc2xreGg4Y0sv?=
 =?utf-8?B?QlN4bWtwRXQrUStkRDZKTmh2REhUaFg5VnUvY2lqcnpCY25QZE5JSlhtaGVI?=
 =?utf-8?B?RGtrQmZqNzNHSklia25xVnpMVjZDUUJ4R2xVejJGRzY2bDBJaGFSRDJzV2Zv?=
 =?utf-8?B?bGxTNDhTKzNLVXFMd0lkaElNUHJzQitHNVBPN1hvQTlqMmpjbzFoUnIvTXNl?=
 =?utf-8?B?THpONExDcWtGWXBIVytocmpMRnZuZSs2Q1BvTHRpckFqc2tOOVdlZ2wwbmU4?=
 =?utf-8?B?eGJuMDFvMWxRZW9taVBrTms4YUdOQVV2LzlwVCtQQXV6blQ2enJOR29iUDRq?=
 =?utf-8?B?QXo5SFhuZGVkRVFydU1yOW5KYUtEQVFpbnF0S0liQzJQSjF3QVZ3YTk3YUJt?=
 =?utf-8?B?Y0lTM2pZOWV5cDU0eE1ZMEQralE4Sm5hejlBOUx4WlB5eEtEQWxIVldhMWlm?=
 =?utf-8?B?ZitMRFV3cHFVQUxGSm8yaTQwRzlHU1NmNHVtWjhFc0pFUTZXQXVEcCsvaWxz?=
 =?utf-8?B?K2t6TFhrQTZZZnErdll1Tm1UM2Vqd2dsVHVZV2V3YWlxQ3dyMXhQL0dybVZO?=
 =?utf-8?B?NnR1eXZydkFpR09FSWp0cVRLZTlMdnBEOWl1SDA4R2svNzFsSkQxVnRLdUZa?=
 =?utf-8?B?RkkvM1BibWt5OVhLS0VEMURsTnI4NEgra0xPM0RtMUZrbDBVcTdXRU9KbEVq?=
 =?utf-8?B?T0FxTnpNa093VkkxRld2RjRqR1g0dDJlQW4rV2RuWHZyaUZkVXU5Q1hsb2Rz?=
 =?utf-8?B?aUVSZmp0QXBhS1oxYkFqelJaeEhGdzFqeEtGRFh4MlNoeUVPRjZWMzFUR1F1?=
 =?utf-8?B?eTRrRmNCVGlpUGZKSzM4S3pUSUJLdWZUcnA3ZmZZeDRCSkJXSTE4ZThmQ05y?=
 =?utf-8?B?SVVNZUFiUUVzbTVUUmtPdHRxVW1zSEIvelhaaVFxb0VMeW9kTGoxTHd0NCtZ?=
 =?utf-8?B?ZllxVDVKLzFqYVhzS2RIWFY1aFBRSWtYOTE2dE1NQ2JGTUk0c0pXaXArT3RP?=
 =?utf-8?B?VUN2SUZTZURRU05LSGl4QVh4SEw1Z2MveG5ER0tJb285cFdyWFJ3bFF6Qmdq?=
 =?utf-8?B?VUk4NkRtaTRuNjd1NkNrNlRTZHlYSDZiYU8zK0o5SlR4T2ZkUnpMcGJXMXNB?=
 =?utf-8?Q?Z/U27cR4XWUQEnzGmXoYRidDo+4zZM2Xqd7sO?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0f8567-88ed-4903-a5e0-08de955e2c16
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:01:23.4097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhqpXHAaXTU6NJSMqSE6gXC02kk8epbJBI5GK+1FAfGx+mfluNnlnJ5KQouFNLuwHk0RawGxwiUll1EORDC5JNIP91Rza5EAXazaScbwNPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzYacM21NZZilMNOr7vmhiTOL+IBOw+gQDMbDPfak90=;
 b=m+fEFX1wFt+ROdv+3OrJszM5syVC7PWVt6I/oY5anYbogodNKcjDZ4VhJfscrw5cHaFKTyiyXeIlMXvZmuOZoGmbOGk1HHGpAcvbRPbBUzFeS0tdvhmvpX4L350XVxNQmFT6bAnZTyPxFx5YEcDfdp06yzoLcqHU/j3fH6DtoVo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=m+fEFX1w
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

Hi Fiona,

On 4/8/26 12:28 PM, Fiona Klute wrote:
> Hi Quentin!
> 
> Am 07.04.26 um 19:37 schrieb Quentin Schulz via buildroot:
>> It may be beneficial to be able to run the script from Buildroot host
>> packages to avoid external dependencies. I for example build Buildroot
>> within some ancient container where I don't have a recent-enough Python
>> to run generate-cyclonedx with. I already build host Python as part of
>> my build, so it seems like a good opportunity to reuse it for running
>> generate-cyclonedx with it instead of going for a separate container
>> just for running that script.
>>
>> This however required a few changes. First, I needed to enable
>> BR2_PACKAGE_HOST_PYTHON3_BZIP2 otherwise importing the bz2 module would
>> fail.
>> However after looking at the code deeper, there isn't a way right now
>> for this script to actually receive a compressed patch to parse,
>> therefore instead of requiring that option to be selected, the
>> compression "support" is removed from the script entirely.
>>
>> Then, I got hit by Python telling me it does not know what HTTPS is. The
>> issue was that the ssl (well, technically _ssl) module wasn't built
>> unless BR2_PACKAGE_HOST_PYTHON3_SSL is enabled and without that, no
>> HTTPS support.
> 
> How about creating host packages for generate-cyclonedx and the 
> CycloneDX schema (in a way that the script still works standalone, if 
> all dependencies are available)? That'd completely sidestep the HTTPS 
> issue and work offline after "make source".
> 

I like that idea. This would also take care of generate-cyclonedx being 
run in parallel and installing the file to a shared DL_DIR without an 
flock. The issue I'm seeing however is how to handle different versions 
of the CycloneDX schema?
There are patches available 
(https://patchwork.ozlabs.org/project/buildroot/patch/20260311140457.140041-6-thomas.perale@mind.be/) 
for using 1.7 instead of 1.6 for example. We won't know which CycloneDX 
version the user wants to use with generate-cyclonedx since we cannot 
run generate-cyclonedx as part of the image (since it depends on the 
output of make show-info?).

Do we go for multiple packages, each for a specific CycloneDX version, 
and they can all be selected independently if desired?

The other issue I'm seeing is mostly design or politics, how to have a 
package using a file from utils/. Is this possible, allowed, wanted? I'm 
busy with 
https://lore.kernel.org/buildroot/dff355c7-7539-4eb5-99d9-446e01cfeafd@cherry.de/T/#m2e71c34c76f5b2fbab145466a4307d6275217b4e 
at the moment but I'll check later if we already have such packages in-tree.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
