Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A71C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 06:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2328360D57;
	Thu,  3 Feb 2022 06:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOQfCH0uix76; Thu,  3 Feb 2022 06:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1C960D4F;
	Thu,  3 Feb 2022 06:20:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF411BF371
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 06:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE2683EB9
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 06:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hJhBbBQBv7u for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 06:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35A0183EB7
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 06:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH/UgjTUuZvtuh0gO7lRAHjqSFjzlBcoWFo7T2UE4iC/4hmokqd2NZgGHeHenCcONy2/R97rlnH2QwkL+SrbUeNpWMQfg/VGZHyFMmIJbLHacKhsemr6bi+GcvU5ip0qTwpysADm0s8/Qr2UrxJSSp727QLdTzsJ5znKqAZ3KM3j+Ym2RjhveHt7LhL1JwqgDcvhxAw8Ket9cw9l+ORR/pYDxVDjYAjoDioGkDOIoSRrTaJ6s1WNuhIt6y0Aq04lfsb2dASa+LXz175EeBJxeUEcbc4b8lKwDogTnrms+ysFMyTNb3suBAnM+7xeqjZVcMDD5f/b8EV7cZgr1r5ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSRkhmvo02DUG3bc65mLlcEkrJxXoDmaIByYg8dsBpY=;
 b=Ws7FNJOhnTzlVASriBWJ4FhFJsNglzSUsW8jTXgCr83mtDaFmpvIhw7BduGYrrSfsQP3Xz+a2oiexJ4Dphv/ffbnakqJ3BC8wQwwztY2IQif3NPzYqxfNO/pL2tmmQSg6Np9ZsdA7jLd9GVSo3Wq6+HsVkh2EHBhk2dc/gvICeyST687zjHvDVIdCuvep01fapiSBOOHwb9iRKG2ruH/5OFu9g/HjrA5V0WvTZLBoOSa2aM0ErW/ua2kxnbbQkoAdVzDF1tXRSa2FxQvCEoLqTc2+2yaO9H9cQilbAWJmHQNWpQFTA6fdwqSLgkx8eh00zqnH0QbBCxryylyFwdlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSRkhmvo02DUG3bc65mLlcEkrJxXoDmaIByYg8dsBpY=;
 b=FQxMSikOM6p8mcxUM5Ntg2BKR1J4Yh6gOlt4Qa6DWOaWK0GAfx/hSGUDjrlApRNGm3ReiUp41+OA7GJJO1ux0GSPyl0r8I0jGOwQCdwbTJZfWAQwHFnB9IBndInXKNaLJZ2A3GFMabir/2n3hEHosc3HNwf92fRo1fDnF5/GjwU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MN2PR02MB5742.namprd02.prod.outlook.com (2603:10b6:208:10d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 06:20:53 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 06:20:52 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to
 Xilinx 2021.2
Thread-Index: AQHYGFXQe6rW+OhmpECM57uHN+anmKyA18sAgAB/emA=
Date: Thu, 3 Feb 2022 06:20:52 +0000
Message-ID: <SJ0PR02MB7758DE2233B5C11EC28FCCB4D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220202165555.3497977-1-nealf@xilinx.com>
 <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
In-Reply-To: <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25c2de69-6c24-481a-6284-08d9e6dd5452
x-ms-traffictypediagnostic: MN2PR02MB5742:EE_
x-microsoft-antispam-prvs: <MN2PR02MB57429DE48CD819BDCDB9DFCED7289@MN2PR02MB5742.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FQBuknkVPuQNMsIOwXK+/BMQMB8n6I5pGMIolTyyhIftFtlEakZbe0woKUJrxeAP8RqvWbmABKjdggjOYjrc17+AtPuPafBSiZSswkacwhtcMuDbtdIKp/nMX+I16SYUc5S/8H+NScle0eQfdXvX7dCN6U+/h0b2BAubrQi0rO2oGt2pTfj+GnNwkg3yuu3uMYfsW0Fg/uno32ortX7qX7ktjdm9AOnkVxQSE/MKpCVh3C+Zec8BH2q2OUU2nBBf51zdwQiM88BMn68PjGrTRS7VtARtfxwA8eEbHOzeZ51LjHRPvuS9xeEKRdSzGWRu5AXijUUSAESmLMT4XZgG25a+UdhXvSfZDElGLCr5BHew8Fr2ROQvHXvVasyZFGC3r9wj9h/tABSVtryYRFjRKuJw3HiTEoARLvip+4QIQs1qPUt9OK6dj0wggt/UQIxvwjbma5oRIT0FfhHpYGEsnLXmUryA/EvwPCcJ1pUlfEoXSdbyO/EtO2+Fw5Dw40VoKNVRDcWiUL2Xn7nJLsC78nF3//uGxx2HhDmNSJjSIH3m3ZuhunZKtpRlShOKK3rHVgkAfTnlBVCz5PFwjF2d5kN87WvCedfykShAGQm3v3S/C/aFBjsijvn8TVoL9P5a0WkLdh1TjA0wDDtSAfwABD1fG0dc74c3qZMpFyDT9VoDPu9uJSYtNon7nbhpimXd8+NqY9yGeNzLWWakB2YjZIXEwsDH6PxNi6QUGGum6KP7UuZLQQpkM/CMip9uAXSnvg3pZ1JEcsj4TTrnlfKIDOp3LRJ/P6ZQOxzqNQHpkOnM9SrRmTcGHEGY/zcM8DCxvnoVGPQksy/VkcK9t4hvpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(52536014)(966005)(5660300002)(508600001)(26005)(71200400001)(83380400001)(110136005)(15974865002)(66476007)(86362001)(7696005)(2906002)(19627235002)(76116006)(186003)(316002)(64756008)(66556008)(8936002)(38070700005)(9686003)(55016003)(53546011)(6506007)(8676002)(45080400002)(66946007)(66446008)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3EySnQwNXNUQTEwSkg0THFhVlltTWlLRXBCbC9xdkdjRTI4K3NpVzFIbThi?=
 =?utf-8?B?MXUvR1Z5VEFqVHVZMC82a2wxZWxRR0ZnRlE1dGJSZFRyNkhPclNjclpCVmQx?=
 =?utf-8?B?MU9zSzdMWk1PSURFWUVVZU9icGNDT1Z4QkR6VU1wWHREbE1rVk5maFhNYTJR?=
 =?utf-8?B?SlFPUUtzVmsybzJLMy83QXZUNUN3SUp3bDVKUUtUSEIrMytiQkZtRE5SNXFy?=
 =?utf-8?B?TmxNdjViZjZBUXNXd1YrSUJSUEpSTGNUT1BBSlNVanpOeHNDdVZESGpEU3lN?=
 =?utf-8?B?OGtBYWRDNStiNlVEUWdpa1g4Yi9USHZTbTgwNllDQmhTcFVKYk9oYmJhbjAy?=
 =?utf-8?B?MDZIQ09IVnZqbDNLMHNPK01aY2NYdXVhdHVpVHE3QlcwTE1ucWRkdGFlRFlU?=
 =?utf-8?B?ajBlOXFpbXg0bFdwY1lDdDJKNDBtYlJxSkNXTlFaSTRzK2RhMmtMQ0xpemlS?=
 =?utf-8?B?YjJkU3hnSVI0RWdTNDF4WXN6RkxPNWpEN0t4ZkcwRXg1T3JsSy9mQUlTV3g1?=
 =?utf-8?B?ZStWMzh6eGVWT3lDY1JLQ0FTQUplTjEwZ1VkbktqdUxpYmdJcUh1SjdCYXJx?=
 =?utf-8?B?YmpBLzRpNVRUVFRiSmd4ZGo4Ri9NYnk1Q2dDMDdrVFphNlpkN3VoS0JDYTVz?=
 =?utf-8?B?cUU4dHE2TmUvUzF5VUwvZXV6TXhBajEraW1uUkEvUnVKb2ZpQkE3MFJXV3V5?=
 =?utf-8?B?ZCs0d0xFWGJoV2dyd2d2VzdOOE9zbEx3VXJ4UHErQTBYU3pLL242SlFvRk54?=
 =?utf-8?B?NXltQk8xRGR3Q01mQjhIOEZKeEdKV29pcGlkYkhPN0FtTWdpQUZCYk1EYTFx?=
 =?utf-8?B?T3NsTmRkSEhGTkphNVo4cVhoTzNlV1RwZitDbmVBbWNSV1lqcTk4U2t3NDhR?=
 =?utf-8?B?MDhUZzd4b1U3SEhEVFMvQ1dPclM0Sy82d29EOUI2MVNMa0ZQMjloY3FxbUFn?=
 =?utf-8?B?VkFHdzVwMG0xTWg4WnNwSDBuOGF0U3ZIdDFIRCtVV09PSlMzUld5WWhQdUhu?=
 =?utf-8?B?R0tEcWZGWnFINE9ZM2ZkUzZONUd1dHIvUDVxODhJN0gzSzdIVUJYbE5yMytJ?=
 =?utf-8?B?bTB5eHhmbGhFNkIwY2RHZE5UWTJ4c3RFbVNIU1FEd0d3REpsNlpVSnNITkpo?=
 =?utf-8?B?VnJWK2dCM0dOdTQxZnJOdDF5SDJ2b3NxUDIvbnZyWHpJalMxYnFWUmt0aHBQ?=
 =?utf-8?B?U0FMR1R2anFGSEtpeVY3ejYrNzF2TnV4L3N2Z1V4MmZyRzZFQWdIN3NMRGpl?=
 =?utf-8?B?MHBBYjRJeEZzV1c4MVBQYmVZRC9iRXFlZmRXRklNQVlpZ3ZNWmI2d2dWTi8v?=
 =?utf-8?B?R1dqald0b3l0VElJYjlRU0s2U0xRMXg4TEx4RFhZN3Y1VGlzRTVzUUlwS1Y1?=
 =?utf-8?B?VFdnT3JCdUowb054YVVDVnl4SW1ETHNpVjJvZVpaelhKUmNwWFhrM1RlZUJY?=
 =?utf-8?B?WXJwZ3A2ZGd3U1BmVk95MnN5ZXhTUWN2bmxuWEpIcWNFcEJnOU5Jbmpnd3lh?=
 =?utf-8?B?V0RqRGNIUXIxMENKK0tIMS91d05NWWZFaFdEVzNUM2Z2ZUNEeTdNb00wUVN4?=
 =?utf-8?B?NDlubnRtbUFCQlJIUzk5Z0RXWXJhbGdXVzRIbTlsMXFkR0NocksrYUtFRXJ2?=
 =?utf-8?B?V1Y5VGFxOEtaOVkxLzdNRTB0RXdLRWJ2NWhiQ2NrYzVxek9LMmE2MTliYVc5?=
 =?utf-8?B?VGVHS1U4WTdaUmcwOHJtVmRicjhoWWtYSDFaY3hrZEZLUDgydCtmV3ErdUFO?=
 =?utf-8?B?S1hLbktWRmF0cCtwb2JmczZJYzJ4WWFteDdwMWtjZXNGMWd3RTJ6N2ZCQnNP?=
 =?utf-8?B?bGpjRTQ4ejZjeDZiOUwxL2FUZktldmF3eDB5S1ZBcG9oOTBRTmJjMjNiNUJD?=
 =?utf-8?B?c0RrMHNKZGxFU2EvditqVCtZM216elNBeEl0WHNDbXRUemgyUkhBVU91NG9G?=
 =?utf-8?B?emduZ0srYjZVNmswTnJkenpOYys1eGVyZk42dDNlMzNsZ3BsSzVKUFJENExy?=
 =?utf-8?B?dzFJUWdSSWYybjFyMDBoa0dXYkp4NSsrczB3UGh1Z1NROVNvT2kxUmwzOFNt?=
 =?utf-8?B?MW42emIyejMrQmNYazFVQysyMXpqdW9mcGRjL2RtY1k3eGU4VE90ajNJWUtr?=
 =?utf-8?B?QkdMTENIR1IyOTRiY2ZML2ZkWEZmdTlIVEl1SkdBZ3AxaktlYVI0Vmw3WW50?=
 =?utf-8?B?NEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c2de69-6c24-481a-6284-08d9e6dd5452
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 06:20:52.5376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KsV7uw0Ewk0BA4WBjUrsSP+SgcqEUSZJ1GNKj9jfmkkEZ6OJvZtV51iN72GjxwJiS2i4arNEpYoInZumAN656Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5742
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Thank you for your positive feedback.  Below you can find my thoughts.

Neal Frager
Embedded Processor Specialist
Xilinx

neal.frager@xilinx.com
Mobile: +33.6.48.11.37.36
www.linkedin.com/in/neal-frager-0397463

-----Original Message-----
From: Luca Ceresoli <luca@lucaceresoli.net> 
Sent: Wednesday 2 February 2022 23:29
To: Neal Frager <nealf@xilinx.com>; buildroot@buildroot.org
Cc: Neal Frager <nealf@xilinx.com>
Subject: Re: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to Xilinx 2021.2

CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.


Hi Neal,

thank you for your effort and for sending a patch in the format that is the most convenient for other people to review your code.

Your work seems generally in a good shape. I have several remarks, see below, but nothing really problematic.

On 02/02/22 17:55, Neal Frager wrote:
> Signed-off-by: Neal Frager <nealf@xilinx.com>

Maybe you can add more details before the Signed-off-by line, suah as "Also add a defconfig for ZCU102", "remove U-Boot and ATF patches not upstream"...

[Neal] Could you share the proper git commands for adding comments to a patch?  I would be happy to add more comments, but I am a bit new to git, and I do not know what commands I need to use.

First issue: this defconfig does not build on my PC:

$ git clean -xdf && make zynqmp_zcu106_defconfig && verynice make
package/pkg-generic.mk:266: *** BR2_GLOBAL_PATCH_DIR contains nonexistent directory board/zynqmp/patches/.  Stop.
$

As you removed all patches (which is sooo gooood!) you now have to remove the BR2_GLOBAL_PATCH_DIR.

[Neal] I have not seen this error on my side, but to fix it, I will just remove the BR2_GLOBAL_PATCH_DIR from the defconfigs.

> ---
>  board/zynqmp/genimage.cfg                     |   1 +
>  ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 -------  
> ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------  
> ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------  
> ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 -------  
> ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
>  configs/zynqmp_zcu102_defconfig               |  35 ++++
>  configs/zynqmp_zcu106_defconfig               |  15 +-
>  8 files changed, 44 insertions(+), 484 deletions(-)  delete mode 
> 100644 
> board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC
> -ignore-Warray-bounds.patch  delete mode 100644 
> board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-bootin
> g.patch  delete mode 100644 
> board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.pat
> ch  delete mode 100644 
> board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-f
> or-PMUFW_INIT_.patch  delete mode 100644 
> board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init
> -file-as-a-kco.patch  create mode 100644 
> configs/zynqmp_zcu102_defconfig
>
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg 
> index ed202f4550..557364e124 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -3,6 +3,7 @@ image boot.vfat {
>               files = {
>                       "boot.bin",
>                       "u-boot.bin",
> +                     "u-boot.itb",

Is u-boot.bin still needed, when we have the .itb?

[Neal] u-boot.bin is no longer needed.  I can remove it.

> diff --git a/configs/zynqmp_zcu106_defconfig 
> b/configs/zynqmp_zcu106_defconfig index bee7c1daf7..3a6947e1e8 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -1,11 +1,11 @@
>  BR2_aarch64=y
>  BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> @@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y  # 
> BR2_TARGET_ROOTFS_TAR is not set  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"

As far as I remember (but I ask the core developers to confirm or deny), from the Buildroot perspective upstream versions are generally preferred even when they lack some non-fundamental features (e.g.: some drivers are missing) that are in vendor forks.

Is there a reason for switching ATF to the Xilinx fork? In this case explain it in the commit message, otherwise stay on the upstream repo, upgrading to the latest [working] release.

A similar question applies to kernel and U-Boot: is it possible to switch to upstream releases?

[Neal] I was trying to match the Xilinx tested software release 2021.2 with these patches.  The mainline Linux kernel is still missing quite a bit of the Xilinx drivers, so if a developer uses all mainline locations, there will be things that do not work properly.  The ATF should probably be ok, as it is almost identical to the Xilinx fork, but since I was already using the Xilinx fork for the Linux kernel and U-Boot, I thought it would be better to use the Xilinx tested fork for everything to remain consistent.

>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"

The "_virt" suffix looks strange to the uninitiated. IIRC it is the main, unified defconfig for all Xilinx kernels. Please add a line in the commit message so it is clear for everybody's benefit.

[Neal] Yes, I will add a comment on this when I learn the proper git command for adding comments.

>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2021.2.bin"

Please point to a tag, not a branch, or the file could be modified in the future, resulting in a non-reproducible build. Use:
https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin

[Neal] Good catch.  I will update this in the defconfigs.

Ouch, now the build I had started ended with a new error:

>>> arm-trusted-firmware xlnx_rebase_v2.4_2021.2 Building
...
  AR      .../build/zynqmp/release/lib/libc.a
  LD      .../build/zynqmp/release/bl31/bl31.elf
.../aarch64-buildroot-linux-uclibc-ld:
.../build/zynqmp/release/bl31/bl31.elf section `coherent_ram' will not fit in region `RAM'
.../aarch64-buildroot-linux-uclibc-ld: BL31 image has exceeded its limit.
.../aarch64-buildroot-linux-uclibc-ld: region `RAM' overflowed by 1 byte

I have run my build on Ubuntu 18.04 with your patch applied on current master.

I assume you have built and run it successfully. Any idea on why it fails on a different host?

[Neal] I have seen the ATF build error as well.  There seems to be an issue with the default buildroot aarch64-buildroot-linux-uclibc compiler when building the ATF.  I fixed the issue on my side by going into the output/build/arm-trusted-firmware-xlnx_rebase_v2.4_2021.2 and running the build with the aarch-none-elf compiler using the build command below.  Basically, changing nothing but the compiler.  Do you have any thoughts about how to fix this?

make CROSS_COMPILE=aarch64-none-elf- PLAT=zynqmp RESET_TO_BL31=1

--
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
