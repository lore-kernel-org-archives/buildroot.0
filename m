Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B04BC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 13:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F25416E3;
	Mon, 27 Mar 2023 13:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F25416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQYkU7nuMhxI; Mon, 27 Mar 2023 13:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B889F40947;
	Mon, 27 Mar 2023 13:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B889F40947
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE6CD1BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517B781AC1
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 517B781AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0f2lQlAn-2S for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 13:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22FE981ABB
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::619])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22FE981ABB
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 13:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af1odzEWrX2CT5bYJbbEKHWuaPiOQl2HcusGchfqs9k1O/QEbuFucQtwt3nDKioTIGCnMQ1r8uw4ITQZoJKmX+wgzEi9h5r4JBRaIxhxSU9x0/GhytU36PkKiAsKPN45uM5ypBCRs9DS+joNXc5JBe0DDY+1cw4BwZ3NfhWa65q0NmFcco2vl8FvObUwPFMQ40QccXEUKwI1MkBJZDJOU1OeVHLgOfOeu3HSIbiwttm9gry5Hznyxo/shkCbcfVP8chWSVrSNXDN60A93BrTMtBlOZ8a4B0W1Mh62R5Cjw/R+vCcQc8l6HPp5i5Qk6bfDJ46S+VzI2R3tkCVVIyJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgPX1gCi6o6VaKD0O+6CMNtsLnis83LkJ++6O25raRs=;
 b=TqSHfdJjaSPy5aJKqZfEJIN+6UmnZDiCxvS9aWDWM9gOaYbHPjrqdM9cLvTkFyxL0rgXDsZy0+BgoA+Aft+ItlZCsO2FQmDix4XQg3HG3yjLLr/vnhVNIB6/7xp7vrYvyqPDkh9yA3lhHLjGJEYFtEDN8eD4ocNd2/XzXIuzmFKVE8T2fhzu+H6UixasKJshMFi8mrrtRoM3iRifLaNzYlGQ8z5/ZIayPfwMzuG9PSDAzLSWKcsQDqsLKRe0VpNLuOKR0qSVNRtOjy2E2DqtLo3WUGt0aIkjyutTCELkXEACGTJHeRvTmxF5tCdqrehATOTyviu+WnEFwVoFUig64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 13:22:20 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 13:22:20 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgACiAgCAAHyPgIAAAYvA
Date: Mon, 27 Mar 2023 13:22:19 +0000
Message-ID: <CH2PR12MB5004363EB837D7D19BACFBF4F08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326220543.057f381d@windsurf>
 <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
 <20230327151123.14c46304@booty>
In-Reply-To: <20230327151123.14c46304@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4255:EE_
x-ms-office365-filtering-correlation-id: 72008b8d-0b1d-406a-e08f-08db2ec64afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RQl3DbVCehSo0KiJA8PmvRXTBaULjkXz+VqKbFH/dpBrJGXcTa1guPH8dw25nKBsy7ui572679gMjFGf5utpYkCxy8sKZlrL0qkenzIsPE2kleQHzEfyQpun7lf/o/yz6YlFsgwJ1PJZd3HHLbMHL/Ebsm0UN6Ra3xJPb9Jv2RKvGLICS9HfmtFizbHkc1OyY/uWlRxIULKtU2NhFrFy2YuCsndpcwmRqgxX6xjW0a7VUmBY1GlbF2DsgZahBPIrCTllbOXJmuHWTgOPgHWb8idAsaN0I3BX+/fEM+Ijpdu4GgNA/D159oLSIAemDXj6yS/xMjr/emqMasrdfe8LZnq/cJR6iMMR8Gk2bW3wnZ97JNqNFai4N1QeS9ClUyEogNkBObR5ebc/KgCnSh32ILR3/mUV6Hw9xBK5QE/q2cQKJn4jyhn3XLq/WLwde/zE9YcFYjxh4rFQ2E6jTu8BNK+N1tq6+B+zSP+blG7IsPxyAsMm9Ym/whIhvt3AFBD5cYmzuj8qDmp00Ujb9+bSwCi6HTsAcE24zbao8CZ/LqBKp/K+XEJ7k5reBc8zFRACGq/lILce7L5iSBf7VFBA2Uyv/5518SPpEOIPBjjx6r5C1bJaFB75tgbYpCsgsKyiLOY3+pYAqtCR0ZO80ckVlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(2906002)(83380400001)(52536014)(5660300002)(8936002)(55016003)(38070700005)(33656002)(86362001)(38100700002)(122000001)(316002)(76116006)(6506007)(54906003)(6916009)(4326008)(66476007)(8676002)(64756008)(66946007)(66556008)(66446008)(9686003)(186003)(7696005)(71200400001)(478600001)(41300700001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmdCZkxzaGszUW1Za1VEVUxzOXFkZDF2RTdxWnN0WU5JU01ha2M5eTRRUnFs?=
 =?utf-8?B?SVlkTjAzSlg4a0UwRVNpVUUxSTB1MXVnSnJvTll2R1h6S2NpLzJEV2F6REFK?=
 =?utf-8?B?TE1TQ1Vsdm9jQ0NQcmc4MzNncHBSVlpXR0xHVDJUQWtjSTBGWUc0NnFBbC9B?=
 =?utf-8?B?UVZmRHEvTzEwQTBmbTNSVHdVVEVGVU11RFJ2cTNPcVlWU2w5V0c0aDlFZWpj?=
 =?utf-8?B?Nml3N0NhZERpODVUTHFNUnc3Mm1PSmlsa1VUdEh5ejFKR29aOVZBczJ1dmF0?=
 =?utf-8?B?dlVjRmltTi9GTy9SNnlaamNNTGhpWXdUZFEzQ3lyRk1YMlVEWE5xSGpURVIz?=
 =?utf-8?B?U2hZN05rUXdnb1dKYXFlQkxzdmkzaWhMckVJSHpYTHZpcHlnQmJMSWd1NURH?=
 =?utf-8?B?c0hHbUNidnA2Rzg0MkE5dEVTbWhDRHJYY1QrSFkwNVp2OHY5UkJrVVJYNS9i?=
 =?utf-8?B?N0o3Rk1VUDVid0pWV1F2TTY5V05DVDJaYjNwWnZSL2pPQ1preURnRGp2MjM2?=
 =?utf-8?B?eGVhY2VHU0NKTyt1QjJtdkd1NGhYK0NiTnphUWhnT3c1SmNmSEpTNWc5R1pN?=
 =?utf-8?B?dzk1MjVQcUMrYkRZR3lxTXlKTEQ5UVNJN2pacVhpZi83aklIaDlRV0Jma1lz?=
 =?utf-8?B?d3A0SmoyYWptcjMrSVg4VzNGL204OEpQTitSTFZybFp0RElKdURrbTFKT0R0?=
 =?utf-8?B?Rll5em5xdVA5bDlhSWpYUTZLdkgvTWtUeURwc243eHNDV1BrR3lTNGtUWU53?=
 =?utf-8?B?bFhCMXJxOG8rcStlZ1RQUkFyWFNUMk53RTh1TEd6SDRhWEc4UlNSeVZBek4x?=
 =?utf-8?B?VUtDVnRZdkQ1QjhBT3htMTV6d3JDRkNKeTlBeFRQVDAwaTJZblp5S1lodm9V?=
 =?utf-8?B?THZWaVRCVjJJcE1McmpUNUdIcG1EamNFZ1pybFJNTUxyRVE5OGUxa1A4SkFw?=
 =?utf-8?B?QzZSa05qcjh4SmhjcmZTeUg1Tlp5U05xTHRHSDIwR1BHa1ViSDdBWWtVeU5l?=
 =?utf-8?B?R3lPeUVVc0hJUkVueUpaUllRRHUwRm9vclg1ZFFQNlhOSW5JVjAvZjhGV2hx?=
 =?utf-8?B?L0tncUJsZitINmtYU2RXU2RRRzdodStaKzhWZXFpUzV5cS9pd3VxSTY0WTI5?=
 =?utf-8?B?Vy9XRnFTei9PYlZxUEgzdFBWMG9tYmExUEhpTTBHUkFxKzVPNjgwalBwWkJv?=
 =?utf-8?B?L1l4MXZDYzYvSWhLMVc2OHU0R0RURWlPUGRsZVpBS2NOcFhFWkhiS1ZMblU2?=
 =?utf-8?B?MWlraWZ2Sk1DdXluUnU5ajU3WVNOQ2xmRGxIOCtaWFVob09STzlUblM1TTRK?=
 =?utf-8?B?VUVmWUlML2ZTWGJBdWNsY0VhRnN3RDhRTllvZmtOSENQLzlDV0gxVHd2SlBL?=
 =?utf-8?B?bllIU2xCSlJXZGtmai9USytjWGJwVExzdzJBQURNZ0V6cTlVZkgyOXc0MDJa?=
 =?utf-8?B?OVdhendUUnZRY0MzNzF4aDBNZlpjRUNWRDA5elZVSlVYT3p6MTd3ZU8wditK?=
 =?utf-8?B?YmxrYzNyWTJQZ2NmeHdneFRFRWJRaU4rT0pJL244TldrVlg1TUc0K1piYUYz?=
 =?utf-8?B?VXNiRitYMkppYmhLYkZpbXBZTFRPMDY2Qlc0R0NaaTdxSzliSnZXeWpHSUZS?=
 =?utf-8?B?b1VjMkRESEFRV1Q5VjI5cDRkQUlwTEtZM3VaZjRQV1lRd1M1OFlRY29ZRC8r?=
 =?utf-8?B?b0xnWThQM0plZGJrQjEvVWdLYnI0blJ3U0FBYlZnUVE5b3pmRDA3bXRYRnA4?=
 =?utf-8?B?bWFLU3NnMnZkMnFSbkl0QklqWGp0UUpXR0tBRWgyeDVuei9ubk5MaUlxbDc0?=
 =?utf-8?B?ZjVNd1Y2YmxDUmd6NlNEY0ZSSzkyQkZVcmdjL1Ftcmp4ZW5KWlFIbVU1NVFm?=
 =?utf-8?B?VXJTSTJWQ0N0blMvMzJ5bmh5Vmx3cWMrSFhzcS9kckZTc0VBMEJWOWZCSTlQ?=
 =?utf-8?B?bVFEMmpaUUsvaHl4aHhxVWZGdFdlV0I1WGhOTWp2dU1pZ1p2QTA2WjFhc0px?=
 =?utf-8?B?TW1rRTRacFlTbHcyRE9FRkk2SjFZQXBIRW5MMml1ZU1BV2c2Z2UyWU9tVTQ1?=
 =?utf-8?B?c3kxRWZzdzRHVkxnYkppTUdxVFMwTnZXSnFrZUhObTRIc3ErWjJFenMrU2lP?=
 =?utf-8?B?ZTZWd1hESVViMGhhcVpscVFma2RCNFBiVm05QmZCSFlxd0IvMlcwbGFFcmt3?=
 =?utf-8?Q?+5tM3Sz5lzcx5cE2I2kQJIQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72008b8d-0b1d-406a-e08f-08db2ec64afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 13:22:19.9102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upPxJZRVh9JMAtHb36UmegjWCYQMoHOgaKuiV9dMVWNrOjqacL5Gu8xxBINYe+Z8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgPX1gCi6o6VaKD0O+6CMNtsLnis83LkJ++6O25raRs=;
 b=wYnmeCw4iXZOgeVJZFPHGM9Co8KpQHGhzZTqvMFbkL6+tdSbphw1JxJRHjRS8SyxJEy3qxQVZaEQo0KAsnusjANt4D8WQK7RXsZ0OzCmjPE7Y9TZOvNV9VJHzsR5aaPYd8vjYRoynEUo6bzi9ns1LlY6DPRow3clsVfGN72qXwk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wYnmeCw4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> >> +ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> >> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects -DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 \
> >> +        -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL \
> >> +        -DCONNECT_PMU_GPO_2_VAL=0"  
> > 
> > All these CFLAGS are really weird... why isn't this part of the 
> > zynqmp-firmware build system itself?

> Given you (Neal) are working on this, and you are already active in fixing some issues in the embeddedsw repository (which is greatly appreciated here!), why not trying to have a proper solution in there in the first place?

> Fixing things upstream can possibly take time, but in the end it will avoid adding cruft&hacks in various places, of which I can count 3 now: yocto, zynqmp-pmufw-builder, and hopefully soon Buildroot.

Yes, agreed.  For now, I will go with the custom_cflags config enabling the k26 flags to come from the zynqmp_kria_xxx_defconfig files.  But in parallel, I will work internally to see if we can get a k26 build option for the pmufw which enables everything needed for the k26.  This way, we would only need to specify the SOM we are using and not have to know all of the configs required for that SOM.

> >> +else
> >> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects"
> >> +endif
> > 
> > In any case, this should be:
> > 
> > ZYNQMP_CFLAGS = -Os -flto -ffat-lto-objects
> > 
> > ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> > ZYNQMP_CFLAGS += \
> >    -DBOARD_SHUTDOWN_PIN=2 \
> >    -DBOARD_SHUTDOWN_PIN_STATE=0 \
> >    -DENABLE_EM \
> >    -DENABLE_MOD_OVERTEMP \
> >    -DENABLE_DYNAMIC_MIO_CONFIG \
> >    -DENABLE_IOCTL \
> >    -DCONNECT_PMU_GPO_2_VAL=0
> > endif
> >   
> 
> Ok
> 
> >> +
> >> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> >> +    cd $(@D)/lib/sw_apps/zynqmp_pmufw/src && make \
> >> +        COMPILER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> >> +        ARCHIVER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc-ar \
> >> +        CC=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> >> +        CFLAGS=$(ZYNQMP_CFLAGS)
> > 
> > Please use:
> > 
> >    $(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> >        ...
> >   

> Even better: should you use $(MAKE1) here, would it be possible to get rid of the 'make -j1' patch?

I just confirmed that with $(MAKE1), the 'make -j1' patch is not needed for buildroot.

Thanks everyone for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
