Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288ABC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 19:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A31B483D4E;
	Tue, 31 Oct 2023 19:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A31B483D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kM-mZXLak6Fl; Tue, 31 Oct 2023 19:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE58983D40;
	Tue, 31 Oct 2023 19:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE58983D40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30DE1BF44A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 19:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86EF83D40
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 19:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86EF83D40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfSYOFE7_0mA for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 19:07:36 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B058483D18
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 19:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B058483D18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Puh1Lu0/KYWW9zo69ncuG86OuyhkYu5aG2Hl0u6jKIHo5xkrjTHTQq2SKqREPWg6RiB/dDoz8KP5BirqLVuVUYU123Z7GTtPZXc0IM300TRojrc+8yqzuuNU0auv8nPlVymLMc9Gc+vVJeH/OKcUGW8PinTM5fGwGWJCehtPq3AGgmuuO7m7znThv9Ji96+q/Dksw5b1TjBXBINRMnHu7TZZg3mioGWxDCWzP4Wwl0GiIoFcUuGfD27Wjf+XcVZIizJOjIXSYf65f3gXJZwnKVUM90yFI3fVduu5lGzoshEfnYA45WLCbzDGPLRqRIoDy2ea1jTJciJodtCLpEOYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OFMXeBDFPLfyz1eEXnS07zsvT5Oyzp+sjf4ENJ9WDI=;
 b=jwpzbNm46ByfQ4iWyp3SWQzzYvh/d3uShcIArYDJTTNyZ1l2Leiga7ZyJeti+ltkPA0DPLl6dUQP0Li33Qh9S8/EQmnLcGj/4sMNd7AnRj8uHJgb/5DnpT9rqqNlscH75b9ZR4p7UDL/CrO2Xmz37KmTw32E69PNoIdpR5DcSNtPpj1RUveHslBFdmlVqFCvyxpwQudeq3pJSt05MTsgU6GYCh+1j0qdM3GqXkQTEY90GW8lgFD1N1Kc5D5SdlAi4jDn68EYxGYlCR6m4A9dfnlxJ+E5a7X2TrljVVKWXbYKnXGxjcOv/MeIf3aBE5HkB3GDP2iJWnUT7FVuJybfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 19:07:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 19:07:30 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
Thread-Index: AQHaA0qjYN8AN4TDkUGlzUkiZkQkk7Bj7CSAgABnBOA=
Date: Tue, 31 Oct 2023 19:07:29 +0000
Message-ID: <CH2PR12MB50047AC40733F136A2AE7DFAF0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-5-neal.frager@amd.com>
 <20231031135419.56b25f1c@windsurf>
In-Reply-To: <20231031135419.56b25f1c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB7094:EE_
x-ms-office365-filtering-correlation-id: 425bff52-2de8-4d2e-624d-08dbda44a13d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sxh+xXd6+fyzhyXXXT1s68oTk+RB6EAFvP7GwYi7MQmGx58mEPM7XAEx8cz1LYE17pXQJwUb22z9cwrjqVlTsuUcN8hsPXhGCRGQ2KMcKzrmoKXGhd8mLdo+Aup3dCykfOlycCS5Iwgyaii5CV8Y9EOEB5omrMvG3QDs2Dh9KzCKhxHZd0Vqv1IuIkGe2Ack5n2ABrEdmffDKaT4FrWe/4Fg1R75qhcj5Rle9fbEcwPyfjwmkmRxdKTIN1HcL6ydELFkUAF3pP616cNgZcxvzpo69xurTZPXsTT1Wf/O1Kez+tOgMBhblcb+90hOvtMfZ1KtN95rXo+oLNz9WZXmQdSlhGtcuht5zXgYyqnoyAImlmkDtqHlP2B9bhZzf4vhotsEkG7iKe+M63YZw5RZti6w31Kh/BDRTNI4qRDwlvNsTM5Cwthe0DNcJ9/LvSLLn4WzRV0+V9wXGXZqluzDk2/46PhWllKZMGd/CSQoHMBlTSjLHVZh2FLRnKPhastFtzxt7kKwBRpLO0W9/snzjcg91z3SPqK7+Oadc4uT59Ubtw3neWxnopdIeFQxQO+j3+P8wQfByNokFrVbIbgI5tktzdsbzqe73PcRY8kV972FR3NNBMERCkMLrBiF8lql
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(110136005)(86362001)(2906002)(33656002)(41300700001)(8676002)(5660300002)(4326008)(8936002)(52536014)(38070700009)(478600001)(9686003)(55016003)(38100700002)(122000001)(6506007)(7696005)(71200400001)(316002)(54906003)(66446008)(64756008)(66476007)(66556008)(26005)(66946007)(76116006)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/a7z6PqhETGb3DfpKN4qhnR4N5T7VAkrXInRaPRj7qGCYBZrnABdEohnS0rM?=
 =?us-ascii?Q?pLAy/2YLTngQAsRcNRto5Obt06c31fi6QO4m7XSvpj5BXtC8KlbasnuqKm9B?=
 =?us-ascii?Q?qTr/qsmPEXBoe9O0rwDbfLaKE5sfq7oevbGsoOIk4MebQKzExaEYUKNXSw20?=
 =?us-ascii?Q?AAKlrvdXjdUDDMQ+UfvnGUhXfE181WG7OVeAJscgC8gMr2Zf+LJznSUia59Q?=
 =?us-ascii?Q?+qIOBcmd/yZqVLKNW7+RXog7Ddin9S8aa+wX1wbvx6vuQY4y19asXTgmiGQ7?=
 =?us-ascii?Q?y+uEAL7B3orR/lM6jHxwoNJfbseqkoGwkr/OLkZhWFyK2a+VaxCQwokmf4WV?=
 =?us-ascii?Q?Qvp8JNA2eesrbNt7F+2oOjCMh0SVmhwT7nCDHu9wiQ14YJzsnJvKvkB06Gl/?=
 =?us-ascii?Q?KET7cdkdmuR/kUy4AWopFvPEuKHw+u0P9s/3t2pvzXXWprrC3qjK9iooR1x3?=
 =?us-ascii?Q?yjUbn2RK95q9VLxLWwipxaHq8P6DIS0WlGvXza4fnBLQ/z7kD6pJnQkpQTFx?=
 =?us-ascii?Q?1fXtcMMaZwkKo2VIGMTDubAuezh+DGHJub1x1wAJ8JjZKmpRQebzhIrsC+mT?=
 =?us-ascii?Q?yhK3l07YPTlBOyc39ol0sd2Qzg462dDl/fyIg9TRbJ4AlqfdY2hn8hCpfo6d?=
 =?us-ascii?Q?ZIgFbAYmJHAg3oVWQDgcHKA44zFhpoGWJIPv7hn7P7B7B8FG9ml5fjfnl3zu?=
 =?us-ascii?Q?ogCgFwA4NTXYNtRU2NEGD8ic9b3cqWTrAfI0glXLk0bvGPqjAHSeTps8tdCb?=
 =?us-ascii?Q?0LVlXs5AZYXeebVt/FzDcSTw9urecsKjwMVUEX2DZeKP5Mu7nFCJr8Ao9G24?=
 =?us-ascii?Q?0sa2wTQD8oASsUpi76933CzpY7Bc8GTt9L/f/Yv0Y5Ns6+g6+fN8Wm9wc1N7?=
 =?us-ascii?Q?QNHAzN4xqHE6UqTBhZYsJRFfPZhtQvbbOGaSXK2smOSuryhR8aWWU1Rvcr3Q?=
 =?us-ascii?Q?bzxSuknuL2j94dBGbWjRC1Yy+QYura4UMy+UzyUdWQhdfxA9PUMNHnqzGWRF?=
 =?us-ascii?Q?b9BK9KQuZTqx0Rv3bQm9ToKVyeI2q5b31yatzDa4+ZH/VMQ9cS4K0ynjjP0i?=
 =?us-ascii?Q?LaOfLlFxuzz/OkWl6UYrHb1DqCiJNgp9WnyTo382Onkb9sE9qnZyg/eFSYZt?=
 =?us-ascii?Q?bMx00lS1pweB2RXHgaUK4bKrCOjKCTi8PFLjac19S7ske2KlTYRKaXb/4oVe?=
 =?us-ascii?Q?5IOfG0vi0MOY9zrTVhw/plzxD353G9q3p9/APzmQXtxUqDUI9uCY7l9rqgIh?=
 =?us-ascii?Q?iIPeC+5N1XUl/u6agXuxpQtD+GoYzxM2ATG5eOgFGMQID9rfuWZ3ypNBU+4o?=
 =?us-ascii?Q?ZPHjvRpCp7mcfVXoj4T9+RZrwtdGTdm5AIYCfgSbEggwXi8zGorEYXOdkAhK?=
 =?us-ascii?Q?E333Eyv/HvaD7NRQ5uAWJj7p82QZzWXPCagXpuzc3EOAR9M5fE0lCXKqbpL+?=
 =?us-ascii?Q?X/n9LeV7aDiQpWruPnsMisBr8R6qirb/JJODTcWIPsrF11Ud9hr7yJHd86EW?=
 =?us-ascii?Q?oV+aJ8vw9uIIiBKHukCWioKKwXpdXy9Kxg/gJQd1E8Y+4vIERmBxHRQJzP+Q?=
 =?us-ascii?Q?X9MCbKAzCAT9aCk6W6U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425bff52-2de8-4d2e-624d-08dbda44a13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 19:07:30.0555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7eyqKfawq8EqMY3AUdbp3oVzUchi7JIetW3OJSdq7tCRZLzHD6NfZbtMJTTU/mC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OFMXeBDFPLfyz1eEXnS07zsvT5Oyzp+sjf4ENJ9WDI=;
 b=Mok5mYfNzdJpqsfqvCPFw2z/REsq8/3GOiVEZ4bfC0JQ7riiRPTO1kEtM1pgp2RCpw/BYBG4GkvDL37EDtl8oiKroPpjTD9Xz+bf1W0d0AZbOPjXtBgYSHSFB+pPeTomT1y1jETkmFOPsN9H5/PGUeDtpWnX1X2MI+f3yAuBa40=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Mok5mYfN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> diff --git 
> a/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify
> -sequential-Makefiles.patch 
> b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify
> -sequential-Makefiles.patch
> new file mode 100644
> index 0000000000..29c652d6ef
> --- /dev/null
> +++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-spe
> +++ cify-sequential-Makefiles.patch
> @@ -0,0 +1,115 @@
> +From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 
> +2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Mon, 24 Apr 2023 12:53:25 +0100
> +Subject: [PATCH v1 1/1] pmufw: misc/Makefile: specify sequential 
> +Makefiles

> No patch numbering (1/1). This is normally reported by "make check-package".

Ok.  Done.

> +ZYNQMP_FIRMWARE_VERSION = $(call 
> +qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT
> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt 
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES ZYNQMP_FIRMWARE_INSTALL_TARGET = 
> +NO ZYNQMP_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal

> This should be host-toolchain-bare-metal-buildroot. Otherwise your toolchain-bare-metal-buildroot virtual package is useless.

When I do this, I am stuck with the following message:
make: *** No rule to make target 'toolchain-bare-metal-buildroot', needed by '/buildroot/output/build/zynqmp-firmware-xilinx_v2023.1/.stamp_configured'.  Stop.

I also tried with host-toolchain-bare-metal-buildroot:
make: *** No rule to make target 'host-toolchain-bare-metal-buildroot', needed by '/buildroot/output/build/zynqmp-firmware-xilinx_v2023.1/.stamp_configured'.  Stop.

I had this problem before which is why I solved it by just bypassing the dependency straight to newlib-bare-metal.

Any ideas what the virtual package is missing?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
