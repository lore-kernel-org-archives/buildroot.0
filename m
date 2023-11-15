Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3745C48BFA
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 14:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BBEC400D0;
	Wed, 15 Nov 2023 14:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BBEC400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKEmoIQnbSOS; Wed, 15 Nov 2023 14:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D38A7417FE;
	Wed, 15 Nov 2023 14:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38A7417FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 417031BF315
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 14:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1923360FBF
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 14:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1923360FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urPml09XqA2O for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 14:00:31 +0000 (UTC)
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on070b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::70b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 906DD60F9D
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 14:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906DD60F9D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=XC/Ne/yAju6ufG05MsLJ7ONGHSMgLDBo+kA25vhqEjJxTU8dF6M080bhqf4yIuASRnbTpnymsdHYCFiIslLwnzMET0AeknJ1DFgSPZ6Yste1OdhH8Ge2V/hIbBU0CybzN7TUmAMsy+I/x03YDU8LBu+3f6gHUsLb8iCoxqthCmRbNx7XM0hYPVQ7M9+HNS8J/9RbE4Zec80QEaaJyuwKCVupYGYXvGjRLdGu7wvTv5hBP4z9HrmYj6+PpgYAnsl2vzu8UWiYjfDzIDGrKw2w5H92CWcb9VGEZy7mVXtlLA5OC77wupdfSuTPkk3x+oO17CsWMtgViK54RHcnRTGAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1/o9wc/Sw8hm23FtLfYNmldoIV7CRxhzqFemmdqLlo=;
 b=xJ8uRLPyfgvlDomWmg6yi310oCaUuo55fvUilXu/6XCNwGtjWYvpVxiJzWzBrV+mH6b21eU4CDainAcNSHFgk4FYwEmsve3oTCSWKR7MxH/Exiw/7AyjsqkIOMHlIj88rwzol//opj+yJAVYF7QynO3tEUixS6emmOfLYlDbLi+O1rOOd747+MbFyc/1VSnN1EzpLYFyBpkbzqzrS+DQr6Kz5MNooXyMscQ+H6MzJYqsA1eBkBOtsdOehr/jvn9uJkvDDBMaQ6VCtx33eLOGDTtIWOGOzKzYuf2typyUyFiQF1aQN5QvyhAo779YAOE1MG2YeB1MKPRrm0zwAB9aNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1115.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.37; Wed, 15 Nov
 2023 14:00:26 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::25a1:dc1c:e112:be38]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::25a1:dc1c:e112:be38%2]) with mapi id 15.20.6954.037; Wed, 15 Nov 2023
 14:00:26 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Thread-Topic: [External] - [PATCH 1/2] package/libgpiod2: new package
Thread-Index: AQHaF6rp+tVCQP4E+E64V5gRrst1hLB7YB6Q
Date: Wed, 15 Nov 2023 14:00:26 +0000
Message-ID: <PH1P110MB16032C088AF64E8E78CC8BC99FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
 <20231115100222.29685-2-bstruempfel@ultratronik.de>
In-Reply-To: <20231115100222.29685-2-bstruempfel@ultratronik.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1115:EE_
x-ms-office365-filtering-correlation-id: e7ee9782-72a3-4f43-2452-08dbe5e33858
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Elkt7oC+zcip8tDitomzcWaolG4APADVQeRlj0xJmPgp0udhGZPTB51tXO1d9/7xZusJkV+vnS6N36mSO03mNOBLmxbu/hcm4tfn1Z4lsXaLzJ2nEsoXq7NrM02QCVlmT6RzbRWjbPbMtD6av50IAuInlttwmaPi8QNO3HXQ3DsUpTrAwzxh1fUi0++sBtwyQQBwu+yXZiAozLv+xfF7uiUxeCTIKaNCx7p5LlQdd1hHTZ0A4DZWHuVRpVm5OT9JnOPAWJeGq7e2FuEEDM59thTOeMl7z5HVG+II3Fk0N3bjxp+5rSDPwz08YnIIq5m/Iidy0BCjgCZZKbrXl/+wd3dbzq1r1aavcaGHwJa9PdAPXqywafMw0ZfumNDI2BflRFTOSgkXlrzHWyq9vGVbzg5wEQQ+vu906jMTjrPw9YF7mT0fNyJuHzbFpIo0o/BbvvPCL1glAQ+f7hoGjgIp0jFFRRNxrR7MkuMWFk4ANMjtN/adm99lb4eiYchqE9p2dVcbFLNCAEGuDej89ACDlmkhYzsyOHjzlVlBH21nSEoxf01GNa5VVoOUH3hOnnbsMminTbBWdTL7gAUK/Oko1cLXFshO2QIAmImye7iF1II+t/CaXwx9GucwA6DpbXJxgkG2ZGfrFzYqbeRcfv/PQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(396003)(366004)(136003)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6506007)(7696005)(52536014)(71200400001)(83380400001)(8676002)(8936002)(5660300002)(4326008)(2906002)(41300700001)(966005)(508600001)(6916009)(66946007)(76116006)(64756008)(54906003)(66446008)(66476007)(122000001)(41320700001)(66556008)(38100700002)(33656002)(86362001)(38070700009)(55016003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 5d0ovbiGeYXqVotIA0CXgDLElbB9j5NuhbaLPCpFTPjYBZZMFT4C1KPrJ25zHXJloSPaEQzSw0Txvbkwq7r4kUZboH9A1EPh631mc26bojwIjUe6Ven+TsY3pvLdMe6I8S9nlydEqkzQC9oFOWSBrrN43qyLvQiFCIzqeiSsV+dpJsMeM83H6CpcyXoB3TfNZCmQYZkmnEIL96TBm3j0sQZ+9Lgzcm5MensXgXepyunalvXah/lUefV2VHYfDFMCSEgldw337480QRBizVwNoleuaihvqiaMKlbwnF911aEMOCiJ8K8TPiqQzaXGUzTAXRs+8BQIlDCYQvv7+8VwFLPrHDozAJUN3dpiwtkoXvE1Lm8SVl2i9RW9J43/o03kVMXJjCkhuAgqwVrZcgts8bALGPGlk0i83rCQwM8HeoM=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ee9782-72a3-4f43-2452-08dbe5e33858
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 14:00:26.8292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1/o9wc/Sw8hm23FtLfYNmldoIV7CRxhzqFemmdqLlo=;
 b=AlkjREklEP/Az9VbXC/qJwvWl5WwfHUcqi+ftlRoWOpzKPnDFObd8SwgNvSASHUqeFsPVvEXgHXEm9/7lRqNVDNiauAUj1g2Lj/3oHgTcvWCsD9ArX4g+3ladWX4KEWwYvjKDAzMmbYP+L6aYonylSSh+AZ2jtMtH6AIVlEHLudcdaRclYO278Oz6+i9M+h5nAPN4dntPtzcHEjBCa1EGvgWZHeQMqUhIspQByVZJ14gHYh9MCoP8dYPhpN0pCQKOHLOKbyqnGtdB/CWMdnrMxbGrjl3jI3mRI0IeTAllK547p0uXARwy/qD6hWBtdT2DltFy2kjS8FqK3yiTvZOYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=AlkjREkl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH 1/2] package/libgpiod2: new
 package
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
Cc: "bstruempfel@ultratronik.de" <bstruempfel@ultratronik.de>,
 "bonet@grenoble.cnrs.fr" <bonet@grenoble.cnrs.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Boerge,

> -----Original Message-----
> From: Boerge Struempfel <boerge.struempfel@gmail.com>
> Sent: Wednesday, November 15, 2023 4:02 AM
> Cc: boerge.struempfel@gmail.com; bstruempfel@ultratronik.de;
> dev@andin.de; bonet@grenoble.cnrs.fr; Vincent Fazio <vfazio@xes-
> inc.com>; arnout@mind.be; buildroot@buildroot.org
> Subject: [External] - [PATCH 1/2] package/libgpiod2: new package
> 
> From: Boerge Struempfel <boerge.struempfel@gmail.com>
> 
> Due to a significant api change as well as more recent kernel version
> requirements, we introduce a separate package for version 2.0 and higher.
> The new package is incompatible to libgpiod 1.x. This allows for iteratively
> updating all dependent packages without breaking anything as a result.
> 
> Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
> ---
>  package/Config.in                |  1 +
>  package/libgpiod2/Config.in      | 24 +++++++++++++++++
>  package/libgpiod2/libgpiod2.hash |  4 +++
>  package/libgpiod2/libgpiod2.mk   | 44
> ++++++++++++++++++++++++++++++++
>  4 files changed, 73 insertions(+)
>  create mode 100644 package/libgpiod2/Config.in  create mode 100644
> package/libgpiod2/libgpiod2.hash  create mode 100644
> package/libgpiod2/libgpiod2.mk
> 
> diff --git a/package/Config.in b/package/Config.in index
> 5a3410d758..33d4ef3baa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1718,6 +1718,7 @@ menu "Hardware handling"
>         source "package/libftdi1/Config.in"
>         source "package/libgphoto2/Config.in"
>         source "package/libgpiod/Config.in"
> +       source "package/libgpiod2/Config.in"
>         source "package/libgudev/Config.in"
>         source "package/libhid/Config.in"
>         source "package/libiio/Config.in"
> diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in new
> file mode 100644 index 0000000000..289bcdd373
> --- /dev/null
> +++ b/package/libgpiod2/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_LIBGPIOD2
> +       bool "libgpiod2"
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10

I could be wrong, but I don't think we need a header version check.

While libgpiod 2.x requires Linux 5.10, I believe it vendors the uapi header, similar to ethtool, so it doesn't actually utilize the kernel headers provided by the toolchain to avoid issues with missing symbols.

We should add help text or info in the commit message to mention the 5.10 requirement as guidance otherwise the IOCTLs will not work.
I think CONFIG_GPIO_CDEV is defined by default in the kernel so there may not be a need to call that out.

> +       depends on !BR2_PACKAGE_LIBGPIOD
> +       help
> +         This is a C library that abstracts the GPIO character
> +         device operations on linux.
> +
> +         https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> +
> +if BR2_PACKAGE_LIBGPIOD2
> +
> +config BR2_PACKAGE_LIBGPIOD2_TOOLS
> +       bool "install tools"
> +       help
> +         Include a set of command-line tools for managing GPIOs.
> +
> +endif
> +
> +comment "libgpiod2 needs kernel headers >= 5.10"
> +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +
> +comment "consider switching to libgpiod2"
> +       depends on BR2_PACKAGE_LIBGPIOD
> diff --git a/package/libgpiod2/libgpiod2.hash
> b/package/libgpiod2/libgpiod2.hash
> new file mode 100644
> index 0000000000..d257ccaf7d
> --- /dev/null
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -0,0 +1,4 @@
> +# From
> https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> +sha256
> +c3c923dc63b7b1b02639c9179c81e3d9febf0887bbaa59775990229cdbedb88b
> +libgpiod-2.0.2.tar.xz # Hash for license file
> +sha256
> +eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11
> +COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk
> b/package/libgpiod2/libgpiod2.mk new file mode 100644 index
> 0000000000..a7d4759092
> --- /dev/null
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -0,0 +1,44 @@
> +#########################################################
> ##############
> +#########
> +#
> +# libgpiod2
> +#
> +#########################################################
> ##############
> +#########
> +
> +# Be careful when bumping versions.
> +# Dependency on kernel header versions may change.
> +LIBGPIOD2_VERSION = 2.0.2

Note that Bartosz tagged v2.1 a couple of weeks ago in case we're interested in taking those fixes now.

> +LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
> +LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> +LIBGPIOD2_LICENSE = LGPL-2.1+
> +LIBGPIOD2_LICENSE_FILES = COPYING
> +LIBGPIOD2_INSTALL_STAGING = YES
> +LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive # We're
> +patching configure.ac LIBGPIOD2_AUTORECONF = YES
> +LIBGPIOD2_AUTORECONF_OPTS =
> +--include=$(HOST_DIR)/share/autoconf-archive
> +LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
> +
> +ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> +LIBGPIOD2_CONF_OPTS += --enable-tools
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-tools
> +endif
> +
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx else
> LIBGPIOD2_CONF_OPTS
> ++= --disable-bindings-cxx endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-python
> LIBGPIOD2_DEPENDENCIES
> ++= python3 LIBGPIOD2_CONF_ENV += \
> +       PYTHON=$(HOST_DIR)/bin/python3 \
> +       PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --
> includes`" \
> +       PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-bindings-python endif
> +
> +$(eval $(autotools-package))
> --
> 2.42.0
> 
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
