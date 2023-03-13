Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B868C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C607A410C8;
	Mon, 13 Mar 2023 09:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C607A410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL_PyMw4ZvCQ; Mon, 13 Mar 2023 09:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A40CB410CF;
	Mon, 13 Mar 2023 09:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A40CB410CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A36921BF2A5
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CFF540556
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 09:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CFF540556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdvjazlPXTIX for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 09:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 234FE400E4
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 234FE400E4
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 09:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSAXAkeZBJVk2UJP0pxYCtm7U0xundfAfTR7MaYW1ZFT9rYiRiy8B+N++GAfnSUARKdcPdeKbkUtf1019teIWsPg2dtJexbiMFfiZnONfd5so8dkXL1CkFAH6SIhOTMGZohfsd2OhogqNthQvs5S3xIR/YY65CdI/lCwuevtXriMLW2SGSEzgRt0zIXPJVAwlreBSCu22LcejvQnvpgg0IlVRFArdXbvkA6i3Q8p7lsqWkbOtGf1kEVVYmEEblyZq0V5ZXh4muZSCgXoMszmr+STGTXZJcU8OS8+Cf5azSjS04lJQ2cwOK/0mxmqz6I8j0HjuPHdqV+VVTe9UTsrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzsD0r7psmlShjJT6okDXjLDmgh4KG1+kPWt5bXi92o=;
 b=aah1yUfXUrc6wVBNdzLMx2VLnCdPzsDVLtyWBLJ2n6zD5CX+ZTxNxg0/TyldkIIBhSEmxke6g7fgp+zAnTVCwjcbVSdp6HU3Tdmgo4lUhElmqQyi8KAg9mrM3uh6y40Dp/5GTNRdM2xxrJ98LuyN3/w6wB+978V6QE6nob6WgJGjO8oBbSh3oNfuXhW4WpHoRl/RsZ72ZMa0Z8AUoFqtdojgVDzbxa389Ek3ufwdBiEUvSMDciE2fR3ODnEczvv+gx9QAh9pCc3qPaOcF4D0VzIGUYoxJTmXp3ac0bUdN6bZJ7JDsTJf4xiaYxjPEyNs/iO60xbfhNIhk79ORHVrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0633.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:fd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:33:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:33:13 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
Thread-Index: AQHZUSIuKkfj9FY/kU6AzLFEyq4sva7y4aoAgAWZntc=
Date: Mon, 13 Mar 2023 09:33:13 +0000
Message-ID: <VI1P190MB04932A667DFB448FB1FE2BA49FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049368DE3CF489381F94420B9FB79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <bb076129-af4c-2f15-857c-e5555b7f6c0c@mind.be>
In-Reply-To: <bb076129-af4c-2f15-857c-e5555b7f6c0c@mind.be>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0633:EE_
x-ms-office365-filtering-correlation-id: 19b054b3-115a-41a3-7a48-08db23a5f7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mD0D00ULAaHn3aYcDQ501pIgeVoqBLks/wVz6XuMEu4yHYS9fgAcU8+ISEjAcQdIsxfsOSP4Meq5v8kwQPSjbod75SeH3n9zaZw3gbamX3Pa5gyqmxncju++hLqNfkpmcvJBJRfqNRK5RyRNeWVgz5a/R4eDkRdH6B2yYV1dlRiGu1ivw5qKf43mO4TYQMqPLh9bquNWUroTg/DuGWR1oxN5e3en4zp+4e75zbd/gFfo0ppzhng7ii+p7sDyOvUux5/XCiPzsh9cA5UxWrJWMvvPP5VBn6KjwQrwTxiaurmp6DP3rWBViD7EY5kgK0MPve7b8a+ar6N8+kMGjx8f/1i80JxguMWPdvVV9rSy9zOO2rveeNPsrunjkvMwaoMppKdO0dRglFsePautTNTWLEf2zupCB+eBarO0Md0eDJ52hLs+4RCC5gbKfLYhNajmgkMHZUhgRtv5VNmHS0nmEiQkQgN4+2yxB0/0hF8hH4se7sv+LFjAurJIHzxT0QUNR5pIZAtC8JBvZZ5mtUctytgWnRppXHu0IeiPqXmsurWKGZmtZfUdPGRjYYv2onUiv/JOyHx7CvG3tP9zb4SqkEorqWHgyVwVgjva1+uwHhM6jtluh8A6ZXNCgglGgKgyJqrtrLsTOULTFRvVa6H+zWJ0YudM4HeLv5GtfCv/JD1tpSKQqh51w1PBG5B0lEML
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39840400004)(451199018)(5660300002)(83380400001)(478600001)(26005)(71200400001)(966005)(53546011)(6506007)(7696005)(9686003)(38070700005)(8676002)(66476007)(76116006)(66446008)(33656002)(64756008)(66946007)(52536014)(66556008)(186003)(4326008)(41300700001)(8936002)(86362001)(54906003)(110136005)(316002)(38100700002)(55016003)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UgEZ/VDVrYxDdaQJBwp1c46x7tJeoSSOmODn5QaKocAC3HXPJwJxufrN7E?=
 =?iso-8859-1?Q?T/9ofcWAphs9EOMexp4t3GaM45K5PjoQSNYptdO+XDEfGZr32bvLcmDEBZ?=
 =?iso-8859-1?Q?E/xX7SIhs9m0gNfXsimu/5uhBsJa7f/KIib9FbOrCS6gzTfC1eLk3B+6nU?=
 =?iso-8859-1?Q?HdDxd47sJ/w5PujfDI0CmkcThmJUX27lKJoIlEjJf9nW6Wk+E6Lqym62qp?=
 =?iso-8859-1?Q?SWM1SE2uCVyaiHQCZxS1p/1FhIG7p4WVvncZnc0MTi/cBp1QQj65+iVpn5?=
 =?iso-8859-1?Q?nzeeqb3mVO+wgYN06s4lDemmlAZ+IRhds9DyAdzIybWEo0767B47hlTSFb?=
 =?iso-8859-1?Q?Dt6eMCkkTPg7tMFEBlXrVRjf9UWHkJmubV2xy24H85f8XXKF6tRR/y/04V?=
 =?iso-8859-1?Q?YELRjdxL17h0109b3a5l35XyDyCI6rmDpLeyf47jQtynUwEwP6SamiKwu2?=
 =?iso-8859-1?Q?umtY1rHESdYNgnRESjYjWsKNqKwM4l3+TMczbNDTY6GjP+djc7RZG6rAOP?=
 =?iso-8859-1?Q?eW74kAsyiu6//ePv15nzxGOI5vY+U5HgDGm09aCvXylknxePCpTBQ3NSYL?=
 =?iso-8859-1?Q?4PZ5gpv1BwBiQ/yB0yyiqE7zYCv0AFesfLJnogP/pu02P9K30pFTNpYXtq?=
 =?iso-8859-1?Q?WfS5onU6NirMgP2qrjS9M3+nXA2W8J/06KOMeeoznwncsTmcQSLutZ0OjA?=
 =?iso-8859-1?Q?SOtMWG1nqDy47387ghqT1uSjrKcKokM/8uJgSmK7IF6ZiMp6m07o0cdIVH?=
 =?iso-8859-1?Q?KlrMpJUdtLCH8Z/YqmZdcy4Q9tiws24AcHsadFA/BP8a5nnquQVJ1MBN7w?=
 =?iso-8859-1?Q?fqV1k9kyJhIlI4CtvJeHSm84HA4KrIjXmtCkxyaS+hFnio1BViVDXYM7OZ?=
 =?iso-8859-1?Q?TIKUMEsTGqjZW/q8DrtS2Rw0TNaOo+CGIO0DS6ZWTvvjW3qzp57Ts32Lr7?=
 =?iso-8859-1?Q?ftpPNGslfV/KDH7aCF7lUYDTl5PJf9Ecw/6sDTLgHX2nYZ2yoOaqPLWQ+K?=
 =?iso-8859-1?Q?y950iniDVBJhuGFYkknecWx81RR1gOEPP45QUo7sq7MqH5VERlaVCL8uN8?=
 =?iso-8859-1?Q?/8XMchzGNdB/f1SIF1nAwhCkXHJ/+SomUIA/sgSmqaQfMsLFDwgoThv2NU?=
 =?iso-8859-1?Q?InnvIHDk+GpdHib2lPIfS+CYcQxq40wKOQgcUfCIIkDvI2/RtsIgs1pIj8?=
 =?iso-8859-1?Q?i5Hd5oaiYQBvWA52qXxQU75ayxhfL6OlOML/I4dq0iad0+K0+dyiLIKCn7?=
 =?iso-8859-1?Q?ozQvBoCybaIvX3z9zma+jW8pDehi6xicQ66e+fqUzL2g1YrQxsvKMgxJdS?=
 =?iso-8859-1?Q?UvyznxAfwQatVUNwMIzfJnksGYA7v4gueLDmnobfVD1+E71AwR9CVw3cLp?=
 =?iso-8859-1?Q?/C/r+4csLQHnk+E6SYrx7aU+yUXpjrC5+ryZCiRgiD8iUccI4LR3GhsO4X?=
 =?iso-8859-1?Q?f3lq6UPtVktuFRpQ6skDod3iQ5wTa8LaXcKI9DRDIGude47gY93lmUzg9k?=
 =?iso-8859-1?Q?ef0CVE+tEdFRSujMWL+6HA6VDXzwaAxrKWU8f0H+DUxnxWeXBAYiqF6LCh?=
 =?iso-8859-1?Q?ugJtvk5ku7sD1oX0WfnayMXsdFTdNCVyC3amaSW/9kZuOCs8Pta8AGh9+P?=
 =?iso-8859-1?Q?ittM5golmASiY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b054b3-115a-41a3-7a48-08db23a5f7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 09:33:13.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtWD7kIZsGSKrZzjFeNAUjEhUeghxScoM4OTz+2mRtOagXNjTNspWUvb0lwPGlgNSO7M0WKW3A1vcS0DPh31lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0633
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzsD0r7psmlShjJT6okDXjLDmgh4KG1+kPWt5bXi92o=;
 b=j87m/OrXeE9qkpo3d/arBaKM95lDCXG56PyZE402quJxNF9ZIk9k+fZDI/766J3FcDyk0f13YBJY9WZvJCSrkIQvJhmYgBBqrSzVeDGGfiKkv8imTLayKoQAUZxP706rdID43+WAJvGIDTVyqHs48JKdVmewsFW7AilI2Mr0pXc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=j87m/OrX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH v2] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> On 07/03/2023 19:27, Lang Daniel via buildroot wrote:
>> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
>> the fb folder is no longer included in the archive.
>> 
>> imx-gpu-viv 6.4.3.p4.4-aarch64 Building
>> cp -dpfr /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/* /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/
>> cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory
> 
>   So this fixes something? Please indicate that with a Fixes: tag (we don't have 
> it very formalized; some people would put "Fixes: e8df0f7", other people would 
> put "Fixes: cp: cannot stat '....'). That way we can see immediately in 
> patchwork that it should be applied to master, not next.
> 

Sorry for that, added it in v3.

Basically the story as far as I could work out is, that framebuffer support
was meant to be disabled for imx8 boards (aarch64), therefore the
depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M was added.
When other boards were added the depends was never updated which made the option
available.
With the version bump mentioned in the commit message, the fb folder was
dropped by NXP, which broke framebuffer support for those that had the option
by mistake.

>> 
>> According to meta-freescale [0] the framebuffer output can be enabled on
>> IMX8 by using the wayland libraries together with egl.pc.
>> 
>> Tested on an imx8mn by running kmscube. EGL and GLES support detected.
>> 
>> [0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc
>> 
>> Signed-off-by: Daniel Lang <d.lang@abatec.at>
>> ---
>> v1 -> v2:
>>   - Mention current build failure
>>   - Add information for egl.pc selection
>> ---
>>   package/freescale-imx/imx-gpu-viv/Config.in   |  4 +--
>>   .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 27 ++++++++++++-------
>>   2 files changed, 20 insertions(+), 11 deletions(-)
>> 
>> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
>> index 3e095b730c..1e3bdd6b3d 100644
>> --- a/package/freescale-imx/imx-gpu-viv/Config.in
>> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
>> @@ -45,8 +45,8 @@ choice
>>   
>>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>>   	bool "Framebuffer"
>> -	# The i.MX8 blob doesn't support FB output
>> -	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>> +	# Framebuffer output on aarch64 is linked wayland library.
>> +	select BR2_PACKAGE_WAYLAND if BR2_aarch64
>>   
>>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>>   	bool "Wayland"
>> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> index f72735e093..00c95cc5d2 100644
>> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>> @@ -26,28 +26,37 @@ endif
>>   
>>   IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
>>   
>> -# Libraries are linked against libdrm, except framebuffer output on ARM
>> +# Libraries are linked against libdrm and wayland,
>> +# except framebuffer output on ARM
>>   ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
> 
>   The condition here is !(fb && arm), but in the Config.in the condition is !fb 
> || aarch64.
> 
>   Since the condition is a bit complicated, I think it's best to introduce an 
> extra symbol in Config.in, something like:
> 
> # Library binaries are linked against libdrm.so.2 and libwayland.so, except
> # framebuffer output on ARM
> config  BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
> 	bool
> 	default y if !(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB && BR2_arm)
> 	select BR2_PACKAGE_LIBDRM
> 	select BR2_PACKAGE_WAYLAND
> 
>   This would also replace the existing select BR2_PACKAGE_LIBDRM. And we 
> wouldn't need to repeat the comment in 3 places.
> 
> In the .mk file, you can then use conditions on 
> BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND instead of the complicated double condition.
> 

Added in v3.

>> 
>> -IMX_GPU_VIV_DEPENDENCIES += libdrm
>> -endif
>> -
>> -ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
>> -IMX_GPU_VIV_DEPENDENCIES += wayland
>> +IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
>>   endif
>>   
>>   define IMX_GPU_VIV_EXTRACT_CMDS
>>   	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
>>   endef
>>   
>> -ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
>> +# The package comes with multiple versions of egl.pc,
>> +# depending on the output the original egl.pc is replaced
>> +# with a symlink:
>> +# - arm/frambuffer: symlink to egl_linuxfb.pc
>> +# - aarch64/framebuffer: original egl.pc without a symlink
>> +# - wayland: symblink to egl_wayland.pc
>> +ifeq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
>> +IMX_GPU_VIV_BACKEND_DIR = fb
> 
>   The commit message says that the fb folder is not included, but here you still 
> use it?

fb folder still exists for arm. Updated v3 commit message.

> 
>>   define IMX_GPU_VIV_FIXUP_PKGCONFIG
>>   	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
>>   endef
>> -else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
>> +else
>> +# Framebuffer output on aarch64 uses the same libraries as wayland output
>> +# but without replaceing egl.pc.
>> +IMX_GPU_VIV_BACKEND_DIR = wayland
>> +ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
> 
>   So, in the fb aarch64 case, the original egl.pc is used? We have 3 versions: 
> egl.pc that is used for fb on aarch64, egl_linuxfb.pc that is used for fb on 
> arm, and egl_wayland.pc that is used for wayland?
> 

Correct. When using egl_linuxfb and egl_wayland a symlink is recreated that
replaces egl.pc

> 
>   All this was a bit too complicated for me to fix up while applying, so I 
> marked as Changes Requested.
> 
>   Regards,
>   Arnout
> 
> 
>>   define IMX_GPU_VIV_FIXUP_PKGCONFIG
>>   	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
>>   endef
>>   endif
>> +endif
>>   
>>   IMX_GPU_VIV_PLATFORM_DIR = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_PLATFORM))
>>   ifneq ($(IMX_GPU_VIV_PLATFORM_DIR),)
>> @@ -60,7 +69,7 @@ endif
>>   # in the upstream archive here. We also remove unused backend files.
>>   # Make sure these commands are idempotent.
>>   define IMX_GPU_VIV_BUILD_CMDS
>> -	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
>> +	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_BACKEND_DIR)/* $(@D)/gpu-core/usr/lib/
>>   	$(foreach backend,fb wayland, \
>>   		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
>>   	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
