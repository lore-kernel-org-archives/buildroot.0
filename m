Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F61109C035
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570E340B61;
	Wed, 25 Mar 2026 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyTHb8FA59_l; Wed, 25 Mar 2026 16:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572EC40B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774455114;
	bh=58K1Nr770fMzfOqNpNVMXtwjiszhe48xmM3cQAtcVwg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=faaicGhc7D94VaTdzJzZgX1mUqMOPDnxn+7WWBFnDbGxZRXNhw5q4DSU9tzFJjr3L
	 tKp7YKq4OzLAVX7PPgIC0WVoFvjF2iZvNkfH4SimqsbOcq6yAc/jImRUBnPcyRU8Sv
	 7Tkfd/EbkLEOJRV7m3FLlM9e/mnh+hD3pRn3oiuyimy/0oCbhs2OpFsOA/WFTRq4h0
	 lodLpWbY2rjbEA1qyY2FWOr3pC9IuW8KIDDyxJzLMcTQe1oewp4l3l1fq3nwc1EDa3
	 pEKF+Up2rkibm+NET5VTVqJyyYylAR1wjkQkFAwBB5HRt4i3mMCqHOZloyAIoJlj/v
	 creCxBtlJf9UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572EC40B73;
	Wed, 25 Mar 2026 16:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B527DF5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B3F340A39
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIXdLVqM3qi5 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 16:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F8B740A26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8B740A26
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F8B740A26
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 16:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftMn+iItRr6RKnmN65kCNNpzsgdw+wWGnna62HJGqGxHR6AQcd5KuNX0vx+2VN3dO4rfA/nlPpovcFjGoiNJXQZPW7fYG2+oH8H7hvq4RxnoYPhITSk8L6QZ61gcM9YHJWRFglcNLIJd0zppJzY6+DQSC1r5hec+eaYThRiMyGbqdujPXkynsO7lxuPvFEHFAUCH2XRsndwdJRxZxUIoZhvoexQEnbr59Da45q0ATatRNFRlmL3Io607cxqHEpAm3MjAA4wByOct81amFeEZbmufSUkIvMWqX5Yck+oq0F+gg3ki9LPvSP38W+N5LbOXjvYIqwx+9QIda1tOa1ePxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gY8yF4KzRaexM0MVxISmfhlHUaONNtZ0ZCZgpZ5xSw=;
 b=MKDLXRveMPy5Swh9DBxcILHMJt8rQPpg4tBgikAj2+WrbpwFiDsW2lB42knuV6RUr3sM+EUo5wTC1SWgs92LnuOO9mCAjpP00TX5T/FjSYQTVGpvDTVV7wLw0YEqcyUiHfIn+mPg+4qQbzElFCMUg8K4fPmtPKQ+J1lhf9SiWZSTXSWJhs8Il2zbYuUHbPphPcqXv/qaKuQuo2fn4XmShfUf+1B3xtnUBSLexzARpvVEAeNV3mQ2d2RuSGwGJ8CHbP2WLzzd9bYTD8tG8UyKmGIF/OfB4N7GzULm8Cqo7fcTw/LfAJmo2HN4or++/kHeMgj4p4k3L6rKCdnPYSkM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VE1PR04MB7485.eurprd04.prod.outlook.com (2603:10a6:800:1a6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 16:11:43 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 16:11:43 +0000
Message-ID: <ae06ae1d-7bf6-4668-a8fe-2c96e92b1ad6@cherry.de>
Date: Wed, 25 Mar 2026 17:11:42 +0100
User-Agent: Mozilla Thunderbird
To: Heiko Stuebner <heiko@sntech.de>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260325150346.414826-1-heiko@sntech.de>
Content-Language: en-US
In-Reply-To: <20260325150346.414826-1-heiko@sntech.de>
X-ClientProxiedBy: VI1PR07CA0140.eurprd07.prod.outlook.com
 (2603:10a6:802:16::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VE1PR04MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e84ff6-a41b-4f37-bb4f-08de8a8934aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: eB8pq8haZHgwl7sK6U6syvCN8Jepv0bt7YQjntWUtse2eDR512AICLdv46MeoT9rNhVDtWhIgtP8NGHGxj5pSWIdGsGMWcPnlHlSJFlpWaAjIVIhzt3zMQ7vF79kAju1+DmaHT9nnpXfW328lMS5eMfd8AkyVVvunC4ziZ/Xeh4YTYQPAgOcZOIlWnipMcw83aRwW6SX0RCj3MBd5DfrGNs22msdcuneMnlIpTjyw5EIZ5sqQeu4HRHy4c5IGiuosiO+QNpseeVRLE5Gg5PULn7f3ivnZDP+6vp/9gmOzw3kQQLdFMQVKELrhhO3EQNeyIXyXtlj53nISzr5P7ykxYWgNgBMykJXShxhJDsrMnTHrqqFz9axTkicv0Gq3lOFREEIddf2fuv96XyMJAIGFZdFIlRdeoLJX7Q4dSClLHdO1rgKOr2mpjR8HSc2JHrHnxP5qjOpPeoN2P7O1S9sxTvXADcDPDGWckMISP58G/qPTDc+hfCO9jHom5D6r3fuLyGJGMEYYsctXiFrmjprLlHaixtMmPueTbUp6gTWmPPzi+9h84zMzoybXKwRD4/ZCmkabBIEwC+1PUHL8fsSfVFR++3i4VSiVzStyYyNri2/FD74fNz2BAmQWMVGy3t/kw4kgqC19tg8TdMdZkP9sEuWe0GJkTTVXGYyQ1CdsSWH5nQ+WGNQJy1TXQxgKVYE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlqTDJhRGI5MlRXV1owVVQyODliS3NOVkhCSkwxTStORnpYSnNLSXZIbTJV?=
 =?utf-8?B?aWQyRGdZenB6aVpQWW85QUY5ZUE3ZjlCekNyMnBvSFQ4Um1pSWtuUWMyZ1VF?=
 =?utf-8?B?VVBmdVlHWTV1QVJMbUZKSjgydzQrbFpiS3J1QVhEZ0psYkxrWnBuWC9aSzhJ?=
 =?utf-8?B?Q1hzaUpacmQvWjEwdW51K01DcFZ3ZFVIT2NuNk1oTmhCSVdsdmtUQW5rOGFP?=
 =?utf-8?B?bUc5Y0oyOWhKWUlkeVIzanJ2NFZKb05DUmZOK2R5dVhQY2VKNUYxU0FrRlFK?=
 =?utf-8?B?Zmtid3grSkJ2YlJFNEdpQnV4OTBhNHJhL0lzVHY2RjJQbTlOcmtFbWZXSzZv?=
 =?utf-8?B?MUpRMCs1cUVwVVpYdjJyTXRIOEFkVmZ2ZEV5K0szTUx0cDhvWnNKSGE5d2x4?=
 =?utf-8?B?enM3UkpwMXNBSWl5RE1SWlNXbjBkUWNmRTVLQzZWZGN0MmF6SWZwOHpiRUty?=
 =?utf-8?B?bnIyV1psc1pBMHhwT05ySVZ4TWx5R1cvak9VSFZnVEE0eXE2ZVRyUHhGdFgz?=
 =?utf-8?B?Rzlxb1RMaVFzMENSMUdhalNody83ck9iTVM5b1JsNzFJZXVEZ2VMeWJzb1lq?=
 =?utf-8?B?VFpKNlJwa2VCSmJIVjMyOGU0eFk4UnFwSEVidUxvSHowM3FXZjZFSnFCeG15?=
 =?utf-8?B?ek9LUXVWMGQ1cmRHRDdrL3RMKytPM0xUczdKV0ZId3lFbTE5cjMxUHNqNmN5?=
 =?utf-8?B?OUxMQlVCYnNvcFRRbnJ4eC9CQlU5VDRCL09YMldmYlExdzVNR1JseVJhL1ZF?=
 =?utf-8?B?U3JpSWM4b3pFSTIxc0h3bUlFVHhYSHZQbzFZeHRxK0RMMSt1UFF4eXJnUkJC?=
 =?utf-8?B?NE52L1ZwRXd4aFl2VWJKMGFMMXdEVTVIcGp1RGliNDRoQndWa1JQYW8zREI4?=
 =?utf-8?B?UkNKVnBBZ2J3MkNyK25veE5PU25IdjNTbm9pQnc5MWZ3SXpOTWxTNXdkVVV2?=
 =?utf-8?B?T2xzV3BvS2JqWE9aWXBicDUzZENUeFVyRTRZeWhJekgweDQraFpNUVBOanVO?=
 =?utf-8?B?Q0p5d09NdTJXeFpHdzd5dnlEa1h0cnc0Nk1DQ2E5NENZNWVleDRWYUJ0Q1Jx?=
 =?utf-8?B?QzA0RElFN3RmakVicWxKbFF1QmkxdEJVUHRleFVydWplOXFzZnp6eE1QYTA2?=
 =?utf-8?B?QmtzbHNlamhqcG9NeHNSSGxoODN4MGtuMkt1WC9YWXJsM2llbVR1a2ZURFNh?=
 =?utf-8?B?SDJtalV0NWFtTGxrb01uK2VsVDZYaUpiSUlhbHdJSFREWis2NkFPanl4aFlB?=
 =?utf-8?B?L05IQzltL3NZamZGWjRPWUVpbmRPeE8xRW9QdEV6Umx0VTBpRjY5MXVBNTcy?=
 =?utf-8?B?Q0pQM3RZODV0SHpqejE3R29GMWRCY2pBQ2RWKzBTeHFlN2FnSDcxVW9iMUJZ?=
 =?utf-8?B?OTUxZzg3QVhtOHN4NG5QUTlGSWszMjh3bjZEQ0M2a3VNWjc2RlBhYnVkN3hx?=
 =?utf-8?B?cFJ3UFdLWHlDVEt0MW1GK0dYTy9DeUVESy9oTHZHUHRtcUpmc2J1V2gyUVRy?=
 =?utf-8?B?bVBacTdzWHZKaE1MWllpRy9qL3hsRU5DRGFLTDQyQ3VWU0Z6YkY4OWRlb0Jh?=
 =?utf-8?B?dVQ0bUZkM2J2UmppMGRxRkovaGxvc0czdGF6RzAyR3lGNHhWbU9nQ3dwalZ2?=
 =?utf-8?B?R3pDdlJSZVdlODhPb0NzZnhYL0NPKzhDTVo0aWdyVEkyYld3S0w3NnZOMDQ1?=
 =?utf-8?B?UThwRFNzKzdqaElhd0RnR1JmYnJ5cWZpRHRWZGwreHdsU1F3dVJmOU1QSDRU?=
 =?utf-8?B?c0x1VnF0TWNQbGxWcC9mTmRNY01jcURBaXRMbUh1azVkUjlBWDhXdzgzcUl1?=
 =?utf-8?B?Z1RFaWQ0M2JYMzBEUC9FZmI3bmwyMDRnOGZWeUQ0VUsvK2tIWGR6RDZTeXBj?=
 =?utf-8?B?bWVrbmU5THNRai8yUnJKUUJMNlpqWkgyVVpsMWkzK05lRHdCMDZUWW9tQ25R?=
 =?utf-8?B?UWsvdGZYbjhod2czcS9mUmVFNmNvUHVVb0NxTHlRUStnd2lDbU50UEhWUE4r?=
 =?utf-8?B?aVBaR2dWeEVHOW1aWkxXYXVVY1BRdUFkbEUyQ2J3UFdkaWVVM0JjN3dPZFVN?=
 =?utf-8?B?aVdRRHNqaTFsSVBSc0dvRi8yY3BmR2VIK3VuU1BRbk1HWGNEMUJ4ZnRjelV6?=
 =?utf-8?B?MExGTkl3dWFlcjhPUzBNVU96WEZXWWpkOW9vLzkvWXdrdVJJMkRhQnQvckpp?=
 =?utf-8?B?NFhHa2RjeUxMV1lqUm03aHQ2aEpnWmloWXdSTFhaT3hLZUk5cmNMVGFhWmJ5?=
 =?utf-8?B?cWh3Y0I5U0ZMbXBvbm5vcUZNUTdPbWN6UFR5MDFQWHBzWnc3T0NLcCtabXVB?=
 =?utf-8?B?eUwrek5UTGZxenA4VjFEQjgxNVJldFNuL2VvK2kyOFBWa0l2eFV0UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e84ff6-a41b-4f37-bb4f-08de8a8934aa
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:11:43.3144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trqXRL1Xd+FsE0NcL255aoGS1iDkxNyzdNlMSVY58p3xSbCevgi1Iwx0PBh2qyE7TFrOTd/vxGPmKU0+0pvFF27/NZZ7m00OgOkA+PyKqZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7485
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gY8yF4KzRaexM0MVxISmfhlHUaONNtZ0ZCZgpZ5xSw=;
 b=RtYN/DNdjrAEN44NEAriQIVPrqJo45kXt+SEFwMfHz6+tV7VezJ84sgURa4EJdhXAzFzzAFZodQjb7ebSZBqWcBkIzk5WYWTY4cGHAY/8H/VaxIXiPm05gU8yaUZnCAPRLM87PS1nHx4iA11ZurmNJ6zjtfsBIbYyoFSd2y3voE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=RtYN/DNd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] package/arm-trusted-firmware: add
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

On 3/25/26 4:03 PM, Heiko Stuebner wrote:
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

meta-arm (the official Yocto layer from Arm themselves) reports 4 
possible CPEs (c.f. 
https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc?id=067a259cbd5ad4d2a8c2b4ea2cff5acdc126ccd2), 
TF-A source code adds yet another one, c.f. 
https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/refs/heads/master/docs/sbom.cdx.json.

As far as I could tell, only two CPEs have been used so far. I've sent a 
request to NVD to merge existing CPEs (and/or add all existing CPEs to 
existing CVEs such that looking for one CPE will return all applicable 
CVEs). I've sent a patch 
(https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486) 
to TF-A to fix the CycloneDX to avoid yet another CPE to appear (but 
since it's been in releases since v2.13, maybe it's "too late" and 
someone in the future will use that CPE and NVD won't correct it before 
publishing /me shrugs).

cpe:2.3:o:arm:trusted_firmware-a: indeed seems to be the one people now 
use to report CVEs as it contains the two newest CVEs for TF-A (the 
other CPE with CVEs haven't seen a new one since 2017).

Yocto supports the SPDX v3 format which allows to specify multiple CPEs 
(externalIdentifier) per Software Package. CycloneDX doesn't though... 
So I am wondering what's the plan on Buildroot-side here?

OP-TEE OS also has multiple CPEs... meta-arm Yocto layer reports 
linaro:op-tee and op-tee:op-tee_os. Ugh...

Anyway, this looks fine to me so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
