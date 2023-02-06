Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597BC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 17:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A5C60B97;
	Mon,  6 Feb 2023 17:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A5C60B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDvhyBf1lm6J; Mon,  6 Feb 2023 17:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43B660B8F;
	Mon,  6 Feb 2023 17:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43B660B8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 934221BF338
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355CF40498
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 17:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 355CF40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_u_reACXjI5 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 17:10:23 +0000 (UTC)
X-Greylist: delayed 01:00:31 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E094035D
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0706.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::706])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05E094035D
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 17:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OJ2LJN1RKa/4cONcm17zOs6TF8h4BggCeUIRqjMuh9rhg9bPmwaWBNonLWq1voQ5lpUrQTDVULZa68/T8la26JYLJWvKV9pIcSCe0CJjPwwcUKMtcs5wvz1p0VYm69I/MOnmRzoZrOalAqTPWQD/XqsZ0Ei9FsuA3HRf7wx6M/nPT32GKh+32i8VCocut51IA8Nble+rHdipNEJ8daJoyx3exlKgVa8T19t9dQIxXnaLb1Z5N6/XIfHZXWsoHeVYa5RfHmRxjxJGiwusJQdOPp39lRQHee8gSXis6DxcMJdfxSEDgWJWoqIhAnjrfELjr8nq1psq/V7cE7UXuPIRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCr01mDTMKzxPVx4TOWmST2PBgv3TboxpFCpbJrl0CI=;
 b=ZKNHdLHd+qxxkNRrDhF8N6YsjPEO+xfdsRQy1LaCE0sQnOELwXOWBJEA/tub6i0wu5Tc+B+/KJSrrFgI9y1A4hmvH1DvG9MmU18spbmJScdnblpWdwoNHs9PO/1jB1R0pH+SbRYF3icTJ6Q+Qv54D5MIiNUreimLS1PtQVAZs1aCDn8HuoQdSZhNAs4HTwf7tAfa18gtQxzHILFXOopBfaVIZRKXrp2FgLnZ1hGg+nrm+se0mVJXgMasouGJBDXWaGSCHlwBntRxq0ul3kti7q3REaISLuj3kqC/EkZtjHimEicOl9tHJzTdCISnlsSwx74tTqvWYA4M6nkgjSCb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1249.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 13:36:09 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c536:901c:6fc3:b3f8]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c536:901c:6fc3:b3f8%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:36:09 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Casey Reeves <casey@xogium.me>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH v2] boot/arm-trusted-firmware:
 Barebox available as BL33
Thread-Index: AQHZLDcFO34oFpT9SE2Z0xv0kMTk3q7CBUSw
Date: Mon, 6 Feb 2023 13:36:09 +0000
Message-ID: <PH1P110MB1603A4AA1638838DA56BAA069FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230119183026.3428277-1-casey@xogium.me>
 <20230119185041.3430421-1-casey@xogium.me>
In-Reply-To: <20230119185041.3430421-1-casey@xogium.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1249:EE_
x-ms-office365-filtering-correlation-id: 1e0d8a1b-71d5-4351-c0dc-08db08471b6f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NvJa9frr4k06LBqDA3YDXSmsQ1PT+FXFqz/dRkopQA2KcWxDx5yNS72eVXxsRMxryWLfrZjRJVnrs/4rWBhxNOpgGyi59OjRKtsjhxrDijMyGRzufKJpBtOdiHUv/wBZDG4tpacKq3go8hZw1GnY/44/1Y8y/Kzi+02MtGCxsF/2PR++R9yhssZFjvuQvyabh2jV+8s93Iw9teJnaFDj/S+jIA81QlJ5iGFa5Q4evoICXeuNGVRyfshJdEZ2POxlzxoq6xh+Zu0jYOeAAxdgk6Xdmcn5yHKwLCVq40jvxeuXBw1X3QUBnztU7Iugy37wd1eo8rgMrIJqDhj1oIGm56/gciEKyWA2qWbmf2+BQsIQC9ewmZpmTbIxKaPRqogtdHNEiSLvTUsLLBE3U6aYWOCvFgGDfTjyTGvjIXky2os72VljLjP0lG9VCyH8EoXHMQqNx0WahWQEyWlcwBpgClNppet/+DOsPaH9QS1sVXXYMS0lgqHDgzT/CVZxyQdR3ADTS8oQNaW6dRT7p6JZ1/bDMolqPkjt6AwyMgQLq2636b2+Psv3sLOXeKQNt/Nz2r2rMRQ5hlxvc2zx4AgsU4vYtJsvveziU3eWxfdGlDH28gqq9uFOqA36eoZcoGGIwzNPCUWoG/tU4k9MBmhMCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39830400003)(366004)(451199018)(33656002)(71200400001)(9686003)(26005)(186003)(508600001)(66476007)(7696005)(966005)(110136005)(6506007)(38070700005)(41300700001)(55016003)(83380400001)(86362001)(5660300002)(52536014)(2906002)(53546011)(8936002)(4326008)(122000001)(76116006)(66556008)(8676002)(66446008)(38100700002)(64756008)(66946007)(41320700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: rufCj6ou03rwXgJxFEOOMy1mhDGb0OiTZJb8pLAt24josmOXb8EgPxFFtWsXKDCNe42cKeOGYmW9Onc0RQcDYDW7LP6Bruu+eUERnBKVYECaLeed0IbscZKPU3OQ2hGSk1K8dKseI1QY/MIhPlBkvWnv5nPeanPBZYeNRJlcNUVd1dp7Uw/wxTcYmWoXetEk3++k8VHw3hOrIGz01D4yK7ioo7/gA+Pv9mKAMkG+0MZQp78IFYBD/aycDrSAGnagbrRxOzNc01NF6xcZ2/jLrcrQBgSMdA7ba+7JfNpHq3mebeXmB7IeGu6O2aTAStQVzLggNa+xTvHdYqFiMV1G6byZkD7966/OpLwrqupkdO3ITKMnHI2pPmTHUkPKJ0LVqoMT02gB27Vhg9OcUZU0+BUB31PWHmzxQ1dl4XKRBVU=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0d8a1b-71d5-4351-c0dc-08db08471b6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 13:36:09.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1249
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCr01mDTMKzxPVx4TOWmST2PBgv3TboxpFCpbJrl0CI=;
 b=fNps4+enrCApqR+o2bEWMyDay6MQ8+ZTCyEYy+cdkHqi4BTSa717CwEpO6Ad+LsH3puGyUAq+8Y8VaPXRG5p/SeeN0rrq3XlO0VU2QVWDsqHJQTZojqFNI0IJzqUHL/UtfrmgRUCupMb4dup3Y4lIuDPEJNXuJI9v4AMXRyZTLP/ct3NNQIa9IHI1dBkQm7xQXoLG7sp10WKwbgWPsvNd1yT42VBQUpmRiG7sD4h0g5OIYUJknT/keat+MljG+DEry4pvS/mLcp7GMVVnPgnoGeBUqmtzCzKb7SPZc+GdcVJwgsOkWB0bSmakiJOv8QR8QORN62cmjLiAenMMr+kEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=fNps4+en
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH v2] boot/arm-trusted-firmware:
 Barebox available as BL33
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

Casey,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Casey
> Reeves
> Sent: Thursday, January 19, 2023 12:51 PM
> To: buildroot@buildroot.org
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Subject: [External] - [Buildroot] [PATCH v2] boot/arm-trusted-firmware:
> Barebox available as BL33
> 
> Since version 2022.04.0, Barebox now support a generic image built for
> platforms, to be used as BL33 to generate FIP images. This patch makes it
> available as choice of BL33 to be used with ATF and is based on the similar
> work put into U-Boot as BL33.
> 
> Signed-off-by: Casey Reeves <casey@xogium.me>
> 
> ---
> Changes v1 -> v2:
> - fixed quoting issue in the default image name
> ---
>  boot/arm-trusted-firmware/Config.in           | 21 +++++++++++++++++++
>  .../arm-trusted-firmware.mk                   |  6 ++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-
> firmware/Config.in
> index a9b9bbcc5a..cb54c6c9d8 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -129,6 +129,27 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
> 
>  endchoice
> 
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> +       bool "Use Barebox as BL33"
> +       depends on BR2_TARGET_BAREBOX

Does TFA allow multiple BL33 images to be defined? I don't see a guard if some other package such as U-Boot or EDK2 has been enabled as well. 
If only one image is supported but multiple images are supplied via BL33 on the make command line, is it last declared wins?

> +       help
> +         This option allows to embed the Barebox generic BL33 image in
> +         the ARM Trusted Firmware. It ensures that the Barebox package
> +         gets built before ATF, and that the appropriate BL33
> +         variable pointing to the generic bl33 image is passed
> +         when building ATF.
> +
> +if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
> +       string "Barebox BL33 image name"
> +       default "*-generic-bl33.img"
> +       help
> +         Name of the Barebox BL33 image to include in ATF, it must
> +         have been installed to BINARIES_DIR by the Barebox package.
> +
> +endif
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
>         bool "Use U-Boot as BL33"
>         depends on BR2_TARGET_UBOOT
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 1164c81410..648f62ed85 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -105,6 +105,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> AARCH32_SP=optee  endif  endif #
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
> 
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33),y)
> +ARM_TRUSTED_FIRMWARE_BAREBOX_BIN = $(call
> +qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
> ))
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> +BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_BAREBOX_BIN)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += barebox endif
> +
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2  # Since the flash
> device name vary between platforms, we use the variable
> --
> 2.39.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
