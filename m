Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850BBC636D7
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 05:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09956400FC;
	Thu, 23 Feb 2023 05:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09956400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kWOZpLR7a9x; Thu, 23 Feb 2023 05:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027F040129;
	Thu, 23 Feb 2023 05:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027F040129
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 813021BF844
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 05:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 231DE40129
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 05:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231DE40129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lrx6vmSbwCu for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 05:09:42 +0000 (UTC)
X-Greylist: delayed 07:01:44 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB35D400FC
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on071a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::71a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB35D400FC
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 05:09:41 +0000 (UTC)
Received: from PH1P110MB1035.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::17)
 by BN0P110MB1031.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 03:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=XVoMESA5bFUZ82pziacPG2YfJB8k7/Xq8y5ysKPaqKq0vGtroJlaM1EfOqnr8ZCKD2gCu9RFkrH0/9RogVfxJcg6hWu3+7m2eP6iGCLPZUEBswTlozrMYuWduL2rPtPq1MLieZCDJWXAuzGzi0Lxu6RGSASSNy9eGLEEsbepGnuUhNplyG5XJqAgIHQ1Vah0SPJBAF5cNlAznpr6TJ9q4qIRATg3Vyhjn28LETRZPPdbNakdi1FBAxeRb1Kdxf7RAFjsxkLzc7lXdEav0r3XYu9EHFpXh8x92gwWHHVmpe67FqKvQWUCA/v3744IWCSxnUaDp5OdlMqLLN97SWbACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ruw2LL2hbjmP2sHNx1xkQu/Wvkd0uFL0oY8s359MyU=;
 b=KnP0THTdB1JsWw+j7pMWaf+N//grtqCUmvA43Y+ruW7JOow8exH9fl2w1w1f6TVdVgDC2Jsx+bD2s/QyazoT/NEILMiGI5/UbzVXmV8h1KXuivJWzHMLzCDIbcgKnXws+EdjbpMFdspCgBZC2Fw2sTWiVjh5NSVOoGKfmvWqlyS/Ycn9vtF3JZvhSJPRwJ8JDYI42tF1lhO70BDIecPTb7ZLFi0Y8qLhpN/i4FkKQg+X9hR4zJg5mIjRDSA1A7Q2Jwh9dLkQvhLRbVvBJ5A/UwaoBTskGYCKwbFzTd1BBzh56V9P1m2SNNf93wzO4JN9vmAb6507KXre78U8QHhyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1035.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Wed, 22 Feb
 2023 15:32:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7add:5946:edfa:6242]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7add:5946:edfa:6242%7]) with mapi id 15.20.6111.023; Wed, 22 Feb 2023
 15:32:34 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [PATCH] boot/arm-trusted-firmware: introduce a
 choice to select the BL33 image
Thread-Index: AQHZRj5YSSGCTIpcF0iP60GjG0W3nK7bGPqQ
Date: Wed, 22 Feb 2023 15:32:34 +0000
Message-ID: <PH1P110MB1603C1F2701C60ACCFF0806C9FAA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230221214904.454053-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230221214904.454053-1-thomas.petazzoni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1035:EE_|BN0P110MB1031:EE_
x-ms-office365-filtering-correlation-id: 251c2673-68c4-4ee9-11f3-08db14ea055a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gugFGVlmrTOsqq7/85HYdiiI3AkjYGhC3Z0G9c2fOhfVYJ6eWsKnKxD9XeJ1ts32MypY8o8vRsZLX1c2wJyeI1C/pcX7aPHoqDiTpr9HRZ5d87n6XUJsKZOt7R9bGu7MW7XKIU/rD3RvqT1DRxmNXVIBiEiRIv+ywe2JIMqvupf9lkRr3stBMalJRFahjqNPZVF2xJByKUa6nkAuRjCUgezTyeUg/b4L/FoQxZ1+XJBiT4qKclEGrSMDaQcVqymQv5Qr3DSWZaXCbGr0CTX6Kty8PjOaXlFPwdbyPqPnmqT2s2fROkCF+YFKLXV1NTt6zDDv0suMkdk8wv7jtPJo4xXkRm36NFLZg1wdwD1Nc9/HfA+bG3xvpCIxjSinpof43eLOphAnM03KV/dm3dmOUOL1h0k7pPQD/GlzYSjo5HEv+DvDauP4nkQbbTRZDYsJj2RNDDY8VgtWP0KWnwqwqaPNXtn0TLZk78Fh/AmaBQqA9V3O48fMkyCl8a1KWbT/AyK+3+uJ3bKfo8NpF0EVB5v+09yghOOCPko2ixldyaZWk8zAUYI3XovZMQCwFkCucETpfiyrI0SY/5qTCxgDLr8hyaV0QFCN+ULD1GANkU4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39830400003)(136003)(451199018)(26005)(186003)(53546011)(6506007)(966005)(9686003)(508600001)(7696005)(54906003)(110136005)(71200400001)(83380400001)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008)(4326008)(41300700001)(52536014)(38100700002)(8676002)(2906002)(122000001)(8936002)(5660300002)(45080400002)(33656002)(38070700005)(55016003)(86362001)(41320700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 8JhVUWitA3qZZ1M30ayn5SvLINh+wieuLID+ynJQE/pwizFzwVmyxaDN71wdmZc1N1w/YT8sEolO6gXCXm5+/l7KIGS+wrBH2y6FTxxeDub/O+tqxEEqhScisSeH+MDl/0CKdo/UPPjrvmEJU2uvLPe77f986YIY8Aly6Y/7Y9RyRgKSrve+63sdTo0/NZIVetmU1sn73e+btRNpNEPSBd06/eV6rBNTq9LUFGf4y6cWrjaBIHjUz0rqkMBkmyoOV4vUnk5nVr8Nn/F5CPpCEPAUQlBa3xFqlxfMdp3zGuupWmw75ctBVfKsD/ftLcGHCRYdRdUR2Bu+pv2etnfSqSrcmO3HI5bS5RWHmRsAEV9LOT1Qla6TnA5oRu8P7Ym/L1VnF64ho4SFOJII9/RaEqqP84l8oWElwEUNQcBOuAs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 251c2673-68c4-4ee9-11f3-08db14ea055a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 15:32:34.7592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1035
X-OriginatorOrg: xes-inc.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ruw2LL2hbjmP2sHNx1xkQu/Wvkd0uFL0oY8s359MyU=;
 b=2wiJMBCy5LOXxRKTCLLlxOVMqsrHJ6f9tKHDrfoB2bgVjtSCwT/ZdqJJmiR+u01k1/+7wIRKInh4gvhiaJxrpiG6A+iarrcpSgCZfMi3Q0Sb+ikvRh/WZyrt28SCHnQy+DaO2MEcwSivAvMPkvW3NDcNgat5gqr0mPpPd+Py3GvXRnSpnJDRXd5gT6ltRJ6xod0cJ6SsjYGGysxMN4wiLmwwzWvrF3D+iw5xjOtBFugx2AP7FmP5CqDCIkEKU1cv9h+h0TBlvcCOUF8+G+gpJjUGLVpXFcWNxkDLnSXz/eeH3SR33bS2J9lDGlYto7A505V5tCoY8FkZLVo//W+X6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=2wiJMBCy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] boot/arm-trusted-firmware:
 introduce a choice to select the BL33 image
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, February 21, 2023 3:49 PM
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Vincent Fazio
> <vfazio@xes-inc.com>; Casey Reeves <casey@xogium.me>; Dick Olsson
> <hi@senzilla.io>; Sergey Matyukevich <geomatsi@gmail.com>
> Subject: [External] - [PATCH] boot/arm-trusted-firmware: introduce a choice
> to select the BL33 image
> 
> We now have 3 different options to select an image as the BL33 stage of TF-
> A: Barebox, U-Boot or EDK2. Technically speaking, they are mutually
> exclusive: they all specify a BL33= variable to the TF-A build, and TF-A can
> only support a single BL33 stage.
> 
> However, as pointed out by Vincent Fazio in [0] there is nothing that
> prevents selecting Barebox, U-Boot and EDK2 together, even though it
> doesn't make sense.
> 
> To address this, this commit introduces a choice...endchoice block, into which
> the Barebox, U-Boot and EDK2 options are moved. An additional "none"
> option is added, which is the default, and corresponds to not having any BL33
> image.
> 
> Since we keep the same name for the options, no legacy handling is
> necessary.
> 
> [0]
> https://lore.kernel.org/buildroot/PH1P110MB1603A4AA1638838DA56BAA06
> 9FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM/
> 
> Reported-by: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Casey Reeves <casey@xogium.me>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/arm-trusted-firmware/Config.in | 57 +++++++++++++++++------------
>  1 file changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-
> firmware/Config.in
> index cb54c6c9d8..a5ac987172 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -129,8 +129,17 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
> 
>  endchoice
> 
> +choice
> +       prompt "BL33"
> +       default BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
> +       help
> +         Select the image to include as BL33.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
> +       bool "None"
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> -       bool "Use Barebox as BL33"
> +       bool "Barebox"
>         depends on BR2_TARGET_BAREBOX
>         help
>           This option allows to embed the Barebox generic BL33 image in @@ -
> 139,6 +148,30 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
>           variable pointing to the generic bl33 image is passed
>           when building ATF.
> 
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> +       bool "U-Boot"
> +       depends on BR2_TARGET_UBOOT
> +       help
> +         This option allows to embed u-boot.bin as the BL33 part of
> +         the ARM Trusted Firmware. It ensures that the u-boot package
> +         gets built before ATF, and that the appropriate BL33
> +         variable pointing to u-boot.bin is passed when building ATF.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +       bool "EDK2"
> +       depends on BR2_TARGET_EDK2
> +       help
> +         This option allows to embed EDK2 as the BL33 part of
> +         the ARM Trusted Firmware. It ensures that the EDK2 package
> +         gets built before ATF, and that the appropriate BL33
> +         variable pointing to the EDK2 is passed when building ATF.
> +
> +         Do not choose this option if you intend to build ATF and EDK2
> +         for the 'qemu_sbsa' platform. In this case, due to the EDK2
> +         build system, the dependency between ATF and EDK is reversed.
> +
> +endchoice
> +
>  if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> 
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
> @@ -150,15 +183,6 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
> 
>  endif
> 
> -config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> -       bool "Use U-Boot as BL33"
> -       depends on BR2_TARGET_UBOOT
> -       help
> -         This option allows to embed u-boot.bin as the BL33 part of
> -         the ARM Trusted Firmware. It ensures that the u-boot package
> -         gets built before ATF, and that the appropriate BL33
> -         variable pointing to u-boot.bin is passed when building ATF.
> -
>  if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> 
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> @@ -170,19 +194,6 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> 
>  endif
> 
> -config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> -       bool "Use EDK2 as BL33"
> -       depends on BR2_TARGET_EDK2
> -       help
> -         This option allows to embed EDK2 as the BL33 part of
> -         the ARM Trusted Firmware. It ensures that the EDK2 package
> -         gets built before ATF, and that the appropriate BL33
> -         variable pointing to the EDK2 is passed when building ATF.
> -
> -         Do not choose this option if you intend to build ATF and EDK2
> -         for the 'qemu_sbsa' platform. In this case, due to the EDK2
> -         build system, the dependency between ATF and EDK is reversed.
> -
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
>         bool "Include NXP RCW in BL2"
>         depends on BR2_PACKAGE_HOST_QORIQ_RCW
> --
> 2.39.1
> 

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
