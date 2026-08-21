Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D08C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 17:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF74981173;
	Fri, 21 Aug 2026 17:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWtUDxgotFr2; Fri, 21 Aug 2026 17:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787333281;
	bh=KVgYyyB/07vA+j9lqDSrTp+eLsF86rHh7DdKeofMgKM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbtdLOxXD/2VqxmdUyh0FBlF5zzA3DYLEH1Wc1CkBqN+Mga9EDk9YinKtIjYiaxVd
	 aylVMBV6dVbgAXqJ+cBXqw8HHMje+iIAPc3X5X5oEjR595eoV6/1Bo4ZSahCdXl0mN
	 4QKrF1mdevrEQTyO0EC2VoUjXr/Yhf5OPvMP3DQD1F/QSB6/8Z1nSLgXelQiWISrx6
	 yMQc6sguZDYAPIM+xCnn6rauhs8hFVIVVTM87QH/aMYSYjSe4wbxeqwF+1jpSQ4Sda
	 0ixzuT3aUNkqfUyKhskYWFYvvrr8vSiGnK5uC2WNdBom6tocsiCQq+MvqfAh743g81
	 0Z2Ctzh76DdGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3C92811AE;
	Fri, 21 Aug 2026 17:28:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 745864B8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65762811AE
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNLPoTRwKadA for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 17:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Pi20essX
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FAFA81173
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5NlaPbcsQoHLQ7BsKFggDRY3jN5oF6cNnrv/wkHlfWmV6Q6x8Yofgm1iANHN/D6O56sdysq/LCCqdK0yDvVzAyNKHosMqfICRROHf+toMAIzPq9kCE8cWe/OvwrCI4UMXT3f2Duw5qmh4Dh8BXOFu1lHSZGUSuP8RAAABow8Q67GV7wqsxZNM95jSVRJryEl9qgYISGpLY/TotH+lanm37/+4CyLobeCRgo7J8yg5wZPZptasuNZnXnrqCWuPQpRP4Qr+HJEuHA5lqjZo20u5mpAO54BSxFRU18wpl6tMu/s35VSVQpkQfuPGEMPUhFLG7dthbRTDuFx/Zj5pPbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiMsOLWB270b8Nwzm3q0z2V0I0RMILOy3JWHNEWWmSQ=;
 b=d/kwoq5AGIMKn3MM9eAQAIDf0si+EMFiKu0+HNvogInK1XLZ6G8LAN3A4moTuTqXQK4J6cc3h/u/bXSXRJJZPAW06ifeXNceqDXOFH7/0g2o9ASDP29yDZ2qATLwRh68IARd7zeeHMwdfQkghNzYSV5MNi+Nab0redKAbL1EIoh/dC10S/ewSXf4kz3+CXo92Udyr8ypLXmeYm04YBvtZUSXVZH2iTtrRRejqrfKOrSu/oOjCLc+Y9N1wBPTlEjg6565HWTmAa4diTR+VTsailc74CGI+r172VRGeApkV0T8L4TUenjZJ9y3l8r6N/jj/MV1AZ5MMzEWHW/iJ293VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiMsOLWB270b8Nwzm3q0z2V0I0RMILOy3JWHNEWWmSQ=;
 b=Pi20essXkjG9vd50zjGH+FNKatE2wnzTZakB8FZysQROo5k/Mc9GKHEmqV5DbbkUkayDyDLmMoSse167p3yA7AZmiSNWwP3qDdAtIbYm5zCtaFdXwZBNQQRHmw4BWYtELpkkyzfaS19YZoEh0E9EyY1ks8H8lDjzAMgQbhGGjOio/qjPCW159ztwKSTkHRmfILiblt8E1O3i+4e7ue63fNBFvJ1YtLqup7d+3S6LaEfuzRs8OgGPY3idtoVWE5zo8iuFWLubuiu+13UyWxXcCyLWiBHhVI7dDSGaOmlLpewZPZWi7r07SZjv87mgJthIkmzadVUOl57msUX46B8SXQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY3PPFF5D16F40F.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::4b7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 17:27:50 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 17:27:49 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fengwei Tan <tfx2001@outlook.com>,
	buildroot@buildroot.org
Date: Sat, 22 Aug 2026 01:26:13 +0800
Message-ID: <SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aodS3qtR9YJL5U63@windsurf>
References: <aodS3qtR9YJL5U63@windsurf>
X-ClientProxiedBy: TPYP295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::13) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260821172613.47260-1-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY3PPFF5D16F40F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af6efa9-b511-4791-fbd5-08deffa985b4
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|15080799012|24021099003|23021999003|41001999006|8022599003|5072599009|25010399006|10035399007|2607281247196008|3071699003|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XitYFQPWQ3mQlpI7EOqsSyBkSATwPLpW2dGzYS2SOtymyLJXCNVK8/3uIxtS?=
 =?us-ascii?Q?SuGb1b02Ii/xiAJ4mvc+oLL9YI7OADpTQgZWOTjLdLYDHF6R+ah11lX4F5ai?=
 =?us-ascii?Q?fP5cR76WT2aVLOVDPeBEjUSPIrtRSdDyIFZQDVGAzInJ6u50t1lyH+1tImRs?=
 =?us-ascii?Q?ymeTr5QPf124c2H/XCWaElQ+Dv06hIfDsta27KKem0jyFokP6jyV/VNeXXgA?=
 =?us-ascii?Q?8jU4XVo21jkrjKZvZV+UqjGiWoM7lFOnys8rPOJ79V/H6ggpZ/GBcMcXtsa+?=
 =?us-ascii?Q?Uu8UVriGA0pkG2sm+th39bLW0K+XF2XWAMpsE//Cme3ZySvUdQIUWTwqJLNv?=
 =?us-ascii?Q?PQ7C7MMlrelqVXnNu1Pj5jvSA1Hcv4OC8lPs0oaEjhGavIsB+cgQFG+wQ/Yk?=
 =?us-ascii?Q?eFznVFFT8Ad70Esah9kXjtcmznTy4aaDNy7HYDVy8GQLL7thI53nl/CCnLDK?=
 =?us-ascii?Q?YA3L7uwr7i9R8oWOILdzu75Ja2WyAbtEHL82kBNh876vIilFJ/p6YyMNFbhi?=
 =?us-ascii?Q?CTEcY840dnPuNXT+iHxvre31eJUsthEcgpFVmxRPsb6kftn8D3RaqNE5Y2N0?=
 =?us-ascii?Q?2Hg93VSPkFbpfNJaBEZfQwzCb+UoKh9hHQUCYCCdoZ18yPH8x22T4tv+S+Pc?=
 =?us-ascii?Q?nEysR67TREt1qO0C9wv0LRfxwCJ8zWEyLEwzUn+Lt4yySwqm2oEg8kDxfxmW?=
 =?us-ascii?Q?44nYlmrkNezI0yj1tJyhbaSfJY3mxAZGLRH5pi6vDqAdb8B30BJYhEuHWwR7?=
 =?us-ascii?Q?SGVS2HWfSmRFcF9KuMrPhrmXbz2+bjU7SwlfNpcaonixAPSRWc+AnzwWWFmm?=
 =?us-ascii?Q?EHGwM72TpJLFjdEK30bORzCLuimDE1CS8oCq9Y0YVU0PUHJm8+/XqYguGu1M?=
 =?us-ascii?Q?Gunw8R/vcDUbOiPzrXPNx+TxuAb2m54fFrCkpXnG+tyWeHhbTKH4slsL5/JM?=
 =?us-ascii?Q?1xAhKR/pX3RXZxngFS2lMqVXP02HBiawF+A78p/RA1g=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x20dKqGiDZEh9BOW9B4MzcoA4oCOYnqIwZtQzomn4nBUgXvzpccFOPtRV5oi?=
 =?us-ascii?Q?JTeT9sBGD6h4ZC56ZyGdQkW590oWM07zrgJqdW3rB7Wi+HZV0EWItgxKm7Re?=
 =?us-ascii?Q?fY6LB5Du66zH8S08v4G7InpXKue2fumFwgnNo5z+pmxU1zDB6/PtE9OQj9cF?=
 =?us-ascii?Q?6lYhtqEZ21sHEkp72/8qpPo5S+Mkiyz0PWWHnp2zxEvPrCNi/CABUIvBk2og?=
 =?us-ascii?Q?hzgpNCdcOaWgV3ZxKX1fxF1eeoCrH5Dxx7fnjS0tTpO7HNRm1dE++6y3FA9o?=
 =?us-ascii?Q?Iuaw9627nbCjOgMlx+to76mhf+ZW3U6zKcDJHzz4HO41lWK/56w7kkwQig6E?=
 =?us-ascii?Q?APKOYGKozS0YShfQ4J3iYD7pd+bHy0DYngRZ/GGQglmql5Id/nksv51GEy+6?=
 =?us-ascii?Q?UOW6T7KYZjO5gQ/612xz/siJktei1EnVpUMAs/1VPAJLEQiW/Y46qmcoJ0R2?=
 =?us-ascii?Q?VvJeNgRa5GWYE0FoXhCSO5H5/ldNpABXNl8MJfuSGS8GBIVYeRqJMviqNH96?=
 =?us-ascii?Q?+5r/htIPIDxy+BisF5oIsu1nRyD1fU4WrPBaC1OXelUpcvSXURoAmPVrBTBE?=
 =?us-ascii?Q?AHVgtzHrZbN3Z8YqIrcBOKSk842DXRVcg5pzTJULXi1L3LkyAqUuJl69qDVh?=
 =?us-ascii?Q?+ZP4V35263zNBpTTEa+ZX3+70b0p9ICQqlP8wtGEFk2KuZMwahhe+HI6kkb9?=
 =?us-ascii?Q?JHnHnlWeeBquR6RkuABQzr7ZyRWktd+wGXTZciJmMXukNUG/DeKgNIatOv+Y?=
 =?us-ascii?Q?NRPunkOWc6H+OGshjMVxrVhBCkvqeXeSqYcuv+09ez6k5ifhjkN9WhSJxJv2?=
 =?us-ascii?Q?l30OrnWseZC1yHJAcARyNZqKTxD80XqnAHZUsTAOqf+iJlL88xsouplk46px?=
 =?us-ascii?Q?oWXnsWxKYDYSXQYWH0HpLnuy7Gyl5BUnFcg4uqxHhMlH4pNlq9NSVzoJXW/I?=
 =?us-ascii?Q?PhV4dYLOqasby9r2wMXynJvC9fEvaMNgs0NVc6x1yfzh/2hwH04KD19e950j?=
 =?us-ascii?Q?EdBdm87UPi/SChZWfFfkd+eos+Fx+H2Z7x01eBYe/Ti8Rzfts2MvmXfXg16n?=
 =?us-ascii?Q?KqUztnyP/vn7spAeoeJveyEcHaH7TjZVPo1/YoTNvIsEvK98m6U/CIJ8i92N?=
 =?us-ascii?Q?1ew9BQQETyomZHFQc9a8rsNvHtfP/+4Fke93D8yW4n+FjL4njmRFaDPw8kQI?=
 =?us-ascii?Q?0y5ifhL88PiOUF6vAavH8X0AIUQvrYhyK17T84IhrvctTJa2QJTmX0n8baHs?=
 =?us-ascii?Q?jLrVXhrAn4mnAL01kkRtFFYY2Pm7Tm4d6HdUfoJJIaEHjjHUZP6ExfNNpM7m?=
 =?us-ascii?Q?CKpZWxlKS92VYybHWtFmoT+0fGiw71/ymwiZOnH64P0yGJ66kNq1i8rtw5jZ?=
 =?us-ascii?Q?6moEMjejSJwstJSRZFTi38Yc/gzY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af6efa9-b511-4791-fbd5-08deffa985b4
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:27:49.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPFF5D16F40F
Subject: Re: [Buildroot] [PATCH] package: fix builds with
 $(PKG)_FLAT_STACKSIZE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thank you for taking the time to review my patch!

On Thu, Aug 20, 2026 at 09:20:00PM +0200, Thomas Petazzoni wrote:
> Thanks a lot for your patch, well spotted!
>
> One thing that was missing from your commit message is the indication
> of which commit broke this, so I added that and applied your commit to
> our master branch.
>
> This feature is not actually used by any package in Buildroot, which
> explains why this problem remained unnoticed. Would you be willing to
> work on adding a simple test case in support/testing/ for this? I
> guess it could be a very simple br2-external, with a very simple
> package that uses <pkg>_FLAT_STACKSIZE.

Sure. I would be glad to add a test case for this, and I will send it as
a separate patch.

>
> Aside from that, no many of our users use Buildroot for noMMU
> platforms. Would you mind sharing your use case? Which platform are
> you using, in which context, how did you end up running into this
> <pkg>_FLAT_STACKSIZE issue?

I am working on a fork of Buildroot for HPMicro MCUs:
https://github.com/hpm-rs/buildroot

I have ported Linux to a new RISC-V MCU called HPM6750 from HPMicro
Semiconductor Ltd., and I am adding board support for it to Buildroot.

I ran into this problem when trying to run FFmpeg on it. Initially, it
failed with a "stack smashing detected" error. To resolve this, I
attempted to use FFMPEG_FLAT_STACKSIZE to allocate a larger FLAT stack,
which led me to discover the build failure caused by this bug.

>
> Again, thanks for your contribution!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
