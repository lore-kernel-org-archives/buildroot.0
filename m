Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DD9C38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 08:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879CB41725;
	Tue, 24 Jan 2023 08:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879CB41725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YX5Rk_c7JAzR; Tue, 24 Jan 2023 08:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F4B4174A;
	Tue, 24 Jan 2023 08:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F4B4174A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7055D1BF2C9
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 08:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 551AF82071
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 08:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 551AF82071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6H8WBTsnvmSe for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 08:26:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A3C8206D
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A3C8206D
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 08:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAZY6amgnpiDT7Zrrki/jMHqmq+H0wQgYBEnuF2EUhAhkP3Kxj+C1Cmdh6hJicvHzHxZUmkse5n6jSjBuvMeS93RBYYkeJ6HsJFfdyw7lEY5xVQaiVVgY2/8K56W4zvUKvxRNctW/b9Qo1D63wAtwVZtVkYDrHINkQWJO8R6zC0F8N471c0m2lkKIhouITYowLK3tL4nxG5rFRzZQv3htMJE8q9yrZFPT6tGJRak6+G76zo6YtMxk0KURd2xBn0xTxOlzVLlVVkIrf1f5TtyIt/rTQ80ON/Wnh4N7W8unH1sZ/1oxRkUlkdYYmVTI0FdDF6l0RTYVaAmxGljxmXQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VU4Mqq+c7obQNNKFDIyqy3PHlf853W53TDqN59L8YHk=;
 b=E4Wt21CwY2EhI6SoiV6QjrlUaROPUiAPLSB7hX2NpLsa4WTbDJ+FWsO5iSxO7O51wsL2j/y74WOxV0xHt04ZxaBknP4M6TeM0KYpmp/Ol7gCmdukLfyjoCDXVc7UYb8f74OFrd+YYVWZSaokUxgK2gUkRMgqfuNKscCk7mpCxinN6XkYV791EGqTySfIuK0Vf3eyh5rDhQfb+gIUojsuBHzJUxTBUDANxmXbQ2nAQGi/QqpAMqPw8+CpZnf9BhWgPPC/FDjzq337R+HVRXJ1SrDbFwsJlXq9+f7PJH/zuh5brFvAXLHlk0HaODcjk+46Xi4C1QGf3F/aYymoQC075A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CY8PR12MB7266.namprd12.prod.outlook.com (2603:10b6:930:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 08:26:27 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 08:26:27 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
Thread-Index: AQHZEHcDhq4lw+QqUUKN7Nocob5DeK6teAsAgAAAxtA=
Date: Tue, 24 Jan 2023 08:26:27 +0000
Message-ID: <CH2PR12MB500452D43450E31376BC6472F0C99@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221215111831.11956-1-neal.frager@amd.com>
 <20230124091850.0cabaa3e@booty>
In-Reply-To: <20230124091850.0cabaa3e@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CY8PR12MB7266:EE_
x-ms-office365-filtering-correlation-id: 09fd38a7-1d52-4e83-6e96-08dafde4afe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Szt0qtsuLtMCBdE5gD9JY76TTALOTdhEyZTYv8lVZ9x0Fq1ns41Azxocooy665cpJkHZk3GBI43wIouP4xpBmiaQABGbDHwcfXYMrfDNoIpRlOMncvGkUxDUYy6SLJ/p7V1z9lbymQnDKo6RmPAX8ZFuBrhX6BDteY/WwnXtISSz7Vc5OSpTAaeZOIoy+jtr1f7nJ7mphZkKrMfTffcJ5XP3eeoaQWjew4tfLsm5yhqoJDCBKDKMJ9LPxjjmNnnWNJ87ygpv2GO8WfCm4Cn19LHB4YDM71VIvEGeKCdERZhp0tD/VlD7LmWaMP+IWK8Gy+ouKgrUIfvfgJ2tMnWUlSfoiUTUoYBbSjx4wBhtqLs+/NSD7PxH8nRiUA43ihCUdOgwN/xwh83TE48TOgfvDgOcusnvgrfLhD7H/TTStbTvyb5Eb8H3BGQYjr8Vey9w1AyelsreX1rBojimvLClJaRhN0Ez0XBPtdg7H6oXKQKgd77J40IEW81OJGS362IyriHfjij8Ao6ip8eeaj8vETD3RW2s7whujoPRlmZ8H3nsPDHWE+83p+gLn0Zm9PQ8bDxJrhUX1g/p/gS/bMERVjuCiHixRY+EQTJeDzUtBoE3mVGaoCJ96Bx3JX+pReEiZGVQHpOmQ/nIqE2t+0olty/FQOetOKoIOG8Ecfs9AdRHeg7ldQVBNrNyJxy4HfgEs4MoCaWrh9IuW4+N8zPhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(71200400001)(7696005)(41300700001)(54906003)(66946007)(76116006)(66556008)(316002)(64756008)(66446008)(6916009)(66476007)(8676002)(4326008)(5660300002)(83380400001)(8936002)(52536014)(2906002)(122000001)(478600001)(38070700005)(33656002)(186003)(26005)(9686003)(86362001)(38100700002)(6506007)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y27Xn+fbXhq1M3bvM+bWeDbxUYFiCosQb+nShzUi1/smos4fVaDEyIjEin78?=
 =?us-ascii?Q?IlPZCcgWZKo5MnRpqaLV87UI+MFJ4AP//0zCcXHcc/iivXQeU9Nqc6MVrrHG?=
 =?us-ascii?Q?Wue23Q3w7edFstzb/kGvto8nkzGTYjM62armJjxD9eUA0bqSudnxaLBYhgPo?=
 =?us-ascii?Q?MOWCIMMHAudBfk7aRdKMNmICtLqNbsle5WMvYOA70sJiyIGs+sVNQGj24iDz?=
 =?us-ascii?Q?CLrThzyJ8+GjAq3sz+SjBzqzx+GMVYSlsOS3V5sAwuEXICk7GFiVqv/04FI7?=
 =?us-ascii?Q?wCG1tEggqsQ72DhY6SAe7hbwEth1tfc7WaHhI1KiXkcTPobgY1MIwqbkXFo8?=
 =?us-ascii?Q?VoxlQLNp6igoyXa4zxDsaBBqoB1S9ELfxz2bLDRJg5uP00BKj0JkuFZyZGG3?=
 =?us-ascii?Q?b+uGMeLhGGNFDNwq8SwSQv3xu2n9XEtL2rr2Z2v10olk9iuCv4rHOEtBket8?=
 =?us-ascii?Q?LGC108OvZjNAFenPFNFvq8ZNYVhJEURjbOSNE4a69QCH1ln4F59Fv1IHitvu?=
 =?us-ascii?Q?KpYx97Ab8JfBAukceaq/m4SF5YdW7vPs4Agqdqj+a6euiiVb8hwUTie0+fx9?=
 =?us-ascii?Q?rGRWgG+y5Es465u5FLjex2HcFMvo66WGuJxMIZ7NM1dvSS/SiM/fUFIt7C3f?=
 =?us-ascii?Q?PFQkrqb6yVklqBsRqEX+F13f+zt+OxaB4oSFLhmmk3LfdrQ+sNHIVWVLHsCT?=
 =?us-ascii?Q?bQyQ0OQfI4ovLS4DAg9DYVCWwUYl5nubCQdI2H/KRReGDeGOBSTvxBrmbfO9?=
 =?us-ascii?Q?MgSr/yodsaEUSJruTyb6YAo/1Rcne+W8nAvovyLcfCgBvHC5nsNQ5KTNAB33?=
 =?us-ascii?Q?zemiHIjMYFpzmSmjUvnLAs4dYUg7+BuHutMPrw7CsN/W4uCDYOAW/GzpEAPc?=
 =?us-ascii?Q?0E0kRFF092jEBu9UjlRr+QLw+tN73AEXoPRBkMN6Zj2EwTpeN0CyIr93dIWM?=
 =?us-ascii?Q?r9R80Po4Ikxnj9wUIVLbIV+6/ohu08hJlQNiSuGOLEXAQI6U2/QbqtXYGW5Q?=
 =?us-ascii?Q?kbO4RDEfCtIJIoMRMy4qwjGS1y0dDxF6iI1N8TUEp0FwSIkW331Hi7f9ORku?=
 =?us-ascii?Q?jr51N4gGD8CjX8yULrvC6MtTdy0vFiyeYn0sjy9GOabugVscfHDIS6EXriXC?=
 =?us-ascii?Q?rf9gZUcMyvyujfRHj8YkuhVJYEmahUYvqCfah0uMfHp3SuH0LKy4rjiqweq4?=
 =?us-ascii?Q?RZwb1JdAdC8FTuG2z/Lsa2IPcDKrkx+4OwwLcL+MLrh92lwJo3m/OnYZJt/p?=
 =?us-ascii?Q?Kzgfb+9Jt+u2es8ZDb8Cbj8xfdmoJ8VfcSUix8cjl//KEEW2i1o90ksWbT7P?=
 =?us-ascii?Q?SW60cZMc9f81umlsY+YBGIvKwmMbpg00adDlM/RlaZFDTJqKWoQlMY1NN7dC?=
 =?us-ascii?Q?syRt6MDSaQs0KY/A1fePgdIYQ13gt15j1NAZxMsM7+e2mH8+Tlho2RtgmsHq?=
 =?us-ascii?Q?+RVZ+ittLirpLauupUI1cO7pKVok+b/jFW3xZfl+jmVgby/B+uuI3ETF86/c?=
 =?us-ascii?Q?8CxdqPTFKnzujwNGnsQoWkC4psTy0o7lsWHKM11dElIPOiYhz7UN1KhufbAD?=
 =?us-ascii?Q?BKGDwSmBCZDXi4kb0f8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fd38a7-1d52-4e83-6e96-08dafde4afe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 08:26:27.1140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgfO0wgeowQmKi5OW/AJKIwbZ7flDFVKggjF7mHfCzWaNdSGrAFns8aEGl/NBjJj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU4Mqq+c7obQNNKFDIyqy3PHlf853W53TDqN59L8YHk=;
 b=b0K9C5VfcdqRM8YRIJYQmP755JY2S9tRJGmTNMBu8frua/cfy4SnPoKcGoLiDZBGaE5f0T9l/YbGTGpV97ZPVcWnvO+55wmpaRPRzHKPtqudTHDf2Lgth2PYIb1rPaklqwj2SjX9oqLIIvWzrmJgZpIbD3+uqtKvb+tTBP0zq+E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b0K9C5Vf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Reduce the configs in the kria/uboot.fragment to only what is necessary.
> 
> This patch has been build and run tested on a kria kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Apologies for the delay. I was hoping to test this patch, but I'm not yet there, so for the moment I have a question below.

No problem.

> ---
> V1->V2:
>   - CONFIG_DTB_RESELECT is no longer removed
> ---
>  board/zynqmp/kria/uboot.fragment | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/board/zynqmp/kria/uboot.fragment 
> b/board/zynqmp/kria/uboot.fragment
> index 9e32edfb36..a6a262a562 100644
> --- a/board/zynqmp/kria/uboot.fragment
> +++ b/board/zynqmp/kria/uboot.fragment
> @@ -6,9 +6,5 @@ CONFIG_PHY=y
>  CONFIG_PHY_XILINX_ZYNQMP=y
>  CONFIG_PINCTRL=y
>  CONFIG_PINCONF=y
> -CONFIG_POWER_DOMAIN=y
> -CONFIG_ZYNQMP_POWER_DOMAIN=y
> -CONFIG_DM_RESET=y
> -CONFIG_RESET_ZYNQMP=y

> Does this prevent the 'reset' command in U-Boot from working?

This patch actually has zero effect on functionality.  These 4 u-boot configs are already included in the xilinx_zynqmp_virt_defconfig.

So basically, there was no reason to have these 4 additions in the uboot.fragment file.  
This patch removes these configs for the goal of cleaning things up and reducing the uboot.fragment to the minimum.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
