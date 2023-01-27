Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA9C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FF9B40128;
	Fri, 27 Jan 2023 08:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF9B40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwFdQtU6WkQO; Fri, 27 Jan 2023 08:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4209A403AC;
	Fri, 27 Jan 2023 08:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4209A403AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C95591BF363
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80BCF403AC
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80BCF403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVueIP9hv41p for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B8740128
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2052.outbound.protection.outlook.com [40.107.8.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B8740128
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhTAq24u4x/Ak6F23OqLSHMTKHBjmT01xOFJS1PHsE5Rb1V95A8FYy7sJ2/f5AmAvu0Rx3c3GnPa2dgB5rzR4tEhG4sfp7TW+2/g8XocbvXa656ChaK6GnBBi8SAH4Z3nijn+rsq4OdoUb1evllY9i1J3ABuc1mYWqJeBcQRjURAmHnDTh/VFdMSw0Qbw/iucO3ITcvwAEqxe3c9SQVBa4ZjzbHABaBtYWqttT4ulSoYqr76dm7lNvSSUrmw7eYh8LU1a1ZUdex5pH/R37LB+zBI5F9qw1XFBLBgI6FrQpuynqtiEwnMDrLE5Xpwelqyxsid9ULaYyGS8GayvsJmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdU26qHDJBSXcC1mSyXZad1EwrLbf+Tr3dBQTHF8WBg=;
 b=PXjVa/pmRVi4+KvQ5P9qMSLSA0gw6q8tmsTS+lw7clHy/aCFwuUTTtfxq0Zc73Nyc0i4UpfRkeUCQ86FmrorTAbh9tOsKj9NHzxww1Lj5cNsPqLfu+4Ra7wxOguSNNLhY56QdBbPS06ko7+5wZsjTMCTv4CLikf06X8coDgNdnY/tc595cHzJZWtgUjzO6UkoVwsdavGDmrC0cRlHaZyuEF1K3/lgFrDHSZGFCx1N8uPd5EZJ+ydL50sMBmmvyLflVScpXNDHZv8vb4F3QNadRzjRiu5DkOK5Vpt/vnHJoDTl6F6M8C5N/mBl/2MKKM+aQH/BrUUnbJ+L1X7Q2tB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1857.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 08:40:46 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 08:40:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3 8/8] package/tensorflow-lite: new package
Thread-Index: AQHZL9WuvYMvXAH4zkC4gfg7sfWP5a6x9Phu
Date: Fri, 27 Jan 2023 08:40:46 +0000
Message-ID: <VI1P190MB0493792053F673E33D5055789FCC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
 <20230124092235.806969-8-james.hilliard1@gmail.com>
In-Reply-To: <20230124092235.806969-8-james.hilliard1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1857:EE_
x-ms-office365-filtering-correlation-id: 84aeda77-3bf9-4b4d-c91a-08db00422f33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4oc5+XyEjEglq6wOtwbrQdrc1LhQNsvpfjFVIIZt9eb2p8GGAMXQ/c5dPFDiNo/gB9Jh0zcdvrTkth6cQ1Yl5YGzYx7kU0vwhNJRnCqU820cpe6U0WT8F0oGPSbbUPa2x9TW+j3ksaZUewpkb3J5oBeBdWDFaRk9bXDimiLaJ210SQGKkNuCcXolvDf/GIYPByTpr2pO1gBl3t5OZvJTtY7PrPM8nrs9bsV8LSiQ1HMCSHVjnnIeyS9ZMZEuikd4bqispqSzYDXrGsQN2OzcQTVa9iq6Ds6Inl1cNAxmmkJJRTOKbih7mRJuyPweSeUFr4JPdH6vnJ+dR6zB7i/sHhqkUWlIGCZ01rEcx7jwg35VjHwekobUSTB7rDA0cU5cZOqqArTRYkHJcWSk8ByVipjf4Bzxsf+uETNYm0RDpl3G/K2lcL7KhCaYF1PSD6gNjM2S4mRDCU/qh71Cbbs31gYISxS7u1gbGvLgIEdMN8IMegjBWl5T/nRWqVQXYQop94Nb1cSIfTRPh12MBWIfJrZ48HwOG8nflpO2Z4jd/qMYzGjXDwGgZ9oj/29j1CLLEKQOL1FlVGyhf9FfILBYA2tKFlrUoJjDVSEITFr0tLgSbbSryxHYeClXl5DQR0ivjZhbZ5mUzgcZfpWVPi+NlnW9RDvSgLwax9sWGiifY0kfe8UxQjyg0X/dA9cC3P0AXWnvtut9vefHs0Bfs1i0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39840400004)(366004)(451199018)(316002)(41300700001)(2906002)(66946007)(6916009)(64756008)(4326008)(8676002)(33656002)(66476007)(5660300002)(76116006)(66446008)(52536014)(54906003)(38070700005)(8936002)(55016003)(86362001)(9686003)(26005)(7696005)(38100700002)(186003)(6506007)(122000001)(66556008)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RYu0QeFCPAA6kZkQqM9lVZ/lvUe+83Y1+0JWSCJN9nWw7AuctDm7gp0M5R?=
 =?iso-8859-1?Q?HjVJr/rF3dQSiYluSrDd+pb6IeeHp64ad0aGDHAPNLyZJtkqdaxCwtBqV0?=
 =?iso-8859-1?Q?50eVOboxwGTf3P8J9exImIBt5LCHSSg3AXlSRr2PfbXAklFK+zGqR+sFKr?=
 =?iso-8859-1?Q?AKH7UoKu5cXaeMV0w4xu6uiWYyblSKD9Dd1aKCz9z3NXf5yXX4i7+MI1nR?=
 =?iso-8859-1?Q?i7az7Ew6i76EfaC3kWV9Nx2v09ICZFALNyn+UZWt6QFnKzTVFP9TV9ydn7?=
 =?iso-8859-1?Q?Sgs9adCknx6LgYYBfa2IAo/65cJM4MOygLApDX8V1VsrQQUusr0sPE0FRB?=
 =?iso-8859-1?Q?BDKhCN5hL/+cK6BJUzE4ZZKCBR8/ZUEKaZHcUgzmiKupV/pHOIjpq/nsZ+?=
 =?iso-8859-1?Q?w5bkazokJuvW7KYMuPHm1qTrNeK/Lj1GpI0gVLsXJv3bpOfT6c8ce6Aakf?=
 =?iso-8859-1?Q?e5FSeEUPB/NngBAd/dVMItHCWZEAOPrDtjNuiXoGsEE1M6MSqr+4cp6Xi1?=
 =?iso-8859-1?Q?JmwrarKWonZicmzb2creKGKXEz0I86sNakpwif9MEuHpxnxHoM2KcS4/5d?=
 =?iso-8859-1?Q?FPKhUW2oVr0D/X5NHuTsqol44T3tZEZIdaJWQooGBK2CUoJYLthwrpTPB4?=
 =?iso-8859-1?Q?omIL0HrMKYsCIbifCyKTt7okiuUIEwivb9qjEpIFxOlUFBUs6rPNzyNBGD?=
 =?iso-8859-1?Q?kZC5CSqSKhumiS2H/AgPbNltdxpxLWHuasP3YyjA/scYzcjXcco6GPge5d?=
 =?iso-8859-1?Q?3qzIzQfx5URj5l1sd68xOmMvPFAnmcyxLudrxBEDyXbtu0LWyWhttEroa9?=
 =?iso-8859-1?Q?Guv1J2Pe0v58uYoQu3sBPE3maFl5qlexPNbllnhBm6pwKVgS/mev4iuNCr?=
 =?iso-8859-1?Q?Elgafow3s4f5jwxS7UCfeJU+x9ApYuoo8SvBHHSggjcncZhPP9/ox2+PC5?=
 =?iso-8859-1?Q?5CDT58MhWUmIunYYOVJ4kUiF0Qs0Zdux/wEd/VdhanOSMrAIx/QhXHkg7a?=
 =?iso-8859-1?Q?1aFLVYDumTK6gf65eEJwkl7YraddMqGh9TkIfV+x+hZ87HQQHw023k7QEf?=
 =?iso-8859-1?Q?2wcOUO/5rdqisDF8RWLiJ0i3W6T7FXRovltjucTLqo6PGPEDG64VxqJuDF?=
 =?iso-8859-1?Q?91NrUJgPGkG6u6sPAORSWhW1mcG7IqlnzzE1kB959AmSpDCQx2iaCpLGf3?=
 =?iso-8859-1?Q?sl+xxaU4/y1Ms9RJt7dhE7pRjPZd33L2DiOGtTuoheTrOGsW1wlD83ACAB?=
 =?iso-8859-1?Q?Eab01SipgXkJMnKL9ith1FX2jkzIPgW84jh3jDI9IOLwiAC2H6YYz9a4i5?=
 =?iso-8859-1?Q?zPp7pEzSrqET3xkeaEaaYcrK1yQs1P79te5HVAo15KkK+PSyrlq8sdWsRN?=
 =?iso-8859-1?Q?/P/7AfvFO68qRVPh59yeebx7cqerQlQBODHJ/DChjGOoRSAthoLvGqdU4f?=
 =?iso-8859-1?Q?Ap2SpHnMoLj41KyNY0yzyL6yp9QhvrNnwJl+I6jEJDdFZLy5osbKl3NYbR?=
 =?iso-8859-1?Q?wNesE0YaKeObIUqt59pKPwqRfMFU25m/fYa7CcLAisVHA/EFwxp7oXaqla?=
 =?iso-8859-1?Q?zXUzxQgIldF1Wx32HQH/gQFGfc+SD7sY+RKQynCfxraI5oo72ZELtIkAEf?=
 =?iso-8859-1?Q?2MGTHe9rgdYi4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aeda77-3bf9-4b4d-c91a-08db00422f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 08:40:46.2196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H/jtq8aloGAF7oolyE+MCCVn0kotGrH9uX4Q1QtepIUAESObSYKfPaQZNnWXc0wcZ09vYxlfdnYxms4bTSh46A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1857
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdU26qHDJBSXcC1mSyXZad1EwrLbf+Tr3dBQTHF8WBg=;
 b=2Pe7H/B8pfoAmkewDfkIen0vkL3vsfOKFQV4Qn19hekxcJ2dw6Ee9mcySoRU0o7l9HKWsWxswY8oqwhTvfgy+xUlxviEH0h8sx3Z8xW4vUgBC3wzQl1Y4JcXwybmoiJFk3YQ1akVfEE8tiS5iLs2hF5gLB3s6+xjWk/K2418wSk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=2Pe7H/B8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH v3 8/8] package/tensorflow-lite: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, all,

I successfully compiled tensorflow-lite and ran
 the label_image example on armv7
with GCC 8.4 and GCC 7.5.

> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package adds the tensorflow lite runtime to buildroot.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>

Tested-by: Daniel Lang <d.lang@abatec.at>

> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - drop architecture restrictions which appear inaccurate after adding neon-2-sse
>   - disable android only nnapi
> Changes v1 -> v2:
>   - fix label_image build
>   - more explicit cmake config

[SNIP]

> diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
> new file mode 100644
> index 0000000000..d551c14077
> --- /dev/null
> +++ b/package/tensorflow-lite/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_TENSORFLOW_LITE
> +       bool "tensorflow-lite"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9

BR2_TOOLCHAIN_GCC_AT_LEAST_7 should be enough.
As mentioned I tested it for armv7 with GCC 8.4 and GCC 7.5
The justification for GCC 7 being tensorflows need for C++17.

> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       depends on BR2_SHARED_LIBS
> +       select BR2_PACKAGE_CPUINFO
> +       select BR2_PACKAGE_EIGEN
> +       select BR2_PACKAGE_FARMHASH
> +       select BR2_PACKAGE_FFT2D
> +       select BR2_PACKAGE_FLATBUFFERS
> +       select BR2_PACKAGE_GEMMLOWP
> +       select BR2_PACKAGE_LIBABSEIL_CPP
> +       select BR2_PACKAGE_NEON_2_SSE
> +       select BR2_PACKAGE_RUY
> +       help
> +         Tensorflow Lite dynamic library and headers: Inference engine
> +         to run previously trained machine learning models.
> +
> +comment "tensorflow-lite needs needs a toolchain w/ gcc >= 9"
> +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +
> +comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
> +                       !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "tensorflow-lite needs a toolchain w/ shared libraries"
> +       depends on !BR2_SHARED_LIBS
> diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorflow-lite/tensorflow-lite.hash
> new file mode 100644
> index 0000000000..7d9035707b
> --- /dev/null
> +++ b/package/tensorflow-lite/tensorflow-lite.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48  tensorflow-lite-2.11.0.tar.gz
> +# License files, locally calculated
> +sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65  LICENSE
> diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflow-lite/tensorflow-lite.mk
> new file mode 100644
> index 0000000000..aa69eb3bd1
> --- /dev/null
> +++ b/package/tensorflow-lite/tensorflow-lite.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# tensorflow-lite
> +#
> +################################################################################
> +
> +TENSORFLOW_LITE_VERSION = 2.11.0
> +TENSORFLOW_LITE_SITE =  $(call github,tensorflow,tensorflow,v$(TENSORFLOW_LITE_VERSION))
> +TENSORFLOW_LITE_INSTALL_STAGING = YES
> +TENSORFLOW_LITE_LICENSE = Apache-2.0
> +TENSORFLOW_LITE_LICENSE_FILES = LICENSE
> +TENSORFLOW_LITE_SUBDIR = tensorflow/lite
> +TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD = NO
> +TENSORFLOW_LITE_DEPENDENCIES += \
> +       host-pkgconf \
> +       host-flatbuffers \
> +       cpuinfo \
> +       eigen \
> +       farmhash \
> +       fft2d \
> +       flatbuffers \
> +       gemmlowp \
> +       libabseil-cpp \
> +       neon-2-sse \
> +       ruy
> +
> +TENSORFLOW_LITE_CONF_OPTS = \
> +       -Dabsl_DIR=$(STAGING_DIR)/usr/lib/cmake/absl \
> +       -DBUILD_SHARED_LIBS=ON \
> +       -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/gemmlowp" \
> +       -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
> +       -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> +       -DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
> +       -DFARMHASH_SOURCE_DIR=$(FARMHASH_DIR) \
> +       -Dfarmhash_DIR=$(STAGING_DIR)/usr/lib \
> +       -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
> +       -DFETCHCONTENT_QUIET=OFF \
> +       -DFFT2D_SOURCE_DIR=$(STAGING_DIR)/usr/include/fft2d \
> +       -DFlatBuffers_DIR=$(STAGING_DIR)/usr/lib/cmake/flatbuffers \
> +       -DNEON_2_SSE_DIR=$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
> +       -DTFLITE_ENABLE_EXTERNAL_DELEGATE=ON \
> +       -DTFLITE_ENABLE_GPU=OFF \
> +       -DTFLITE_ENABLE_INSTALL=ON \
> +       -DTFLITE_ENABLE_MMAP=ON \
> +       -DTFLITE_ENABLE_NNAPI=OFF \
> +       -DTFLITE_ENABLE_RUY=ON \
> +       -DTFLITE_ENABLE_XNNPACK=OFF
> +
> +$(eval $(cmake-package))
> -- 
> 2.34.1

Regards,
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
