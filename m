Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50727C55175
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D85F60720;
	Mon,  3 Aug 2026 07:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_PzoMoxKwtd; Mon,  3 Aug 2026 07:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666BC60708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785742227;
	bh=nAekWGJHaS/kP9DUoNuXKRGRCOy3RPdhqZezkyavsXY=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OeFanBGqPiB7re1Ksd6Z+jn4yVPnpg7pIqt/UqdzPCzbXh2XYzTUVLYyDYLF4Epvn
	 4Nphzx7RI3OBZI6eWpV/wQ4cHrQ1rglWl+q06yIy+Q5hdduxk9K1dzH98+RAkMPaoB
	 IxSuz5DaVhGpI7LfAkKzZ5ONnXdcEsyyo/Ys70DBW5EIdzmqOQZWxUyq0+us6+I2q3
	 4kUGrnv888kfF5YAKXYZIWzfF8s8lAmrMJ3ZU01skDdmHWQLsoO58zDqJBT8AmVfyv
	 H7hMGJ7vz0bJgSHHHBPbH5/vQLXWOycs4Xj2e8TAlt4vW0AHrnMGIL/XYzh/mJnPsz
	 BWpILLprH9WzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666BC60708;
	Mon,  3 Aug 2026 07:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1395218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2C2380A98
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s2cit-NJq2e for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 07:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F18F980982
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18F980982
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F18F980982
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:30:22 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 3 Aug
 2026 09:30:16 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 3 Aug 2026 09:30:16 +0200
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "matthew.l.weber3@boeing.com"
 <matthew.l.weber3@boeing.com>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "brian.j.wood2@boeing.com"
 <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
Thread-Index: AQHc+YuXTzdLiwMkWUa9AkR/oxy/jbY6avKAgAAIK4CAULKuAIAA+XIA
Date: Mon, 3 Aug 2026 07:30:16 +0000
Message-ID: <abe25eb9-6ee7-4b47-891d-8816d256fa8e@actia.se>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <b2810e66-cb1b-434f-8991-3bffe94a5d80@actia.se>
 <BL1PR12MB503266705EAD51DC752299B2F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
 <BL1PR12MB5032FE2DD74892018E92A4DCF0D62@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032FE2DD74892018E92A4DCF0D62@BL1PR12MB5032.namprd12.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14556677260
Content-ID: <A84843D267FD904E9161CBE571EA5088@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 8/2/26 6:37 PM, Frager, Neal wrote:
> AMD General
> 
> Hi John, Matt,
> 
>> Add the ability to configure specific Xen versions while leaving the default
>> version unchanged to avoid breaking any builds already using Xen 4.19.5.
>>
>> Since the version can be configured, the 3 patches need to be moved to the
>> 4.19.5 directory, so they are only applied when using this version.
>>
>> Signed-off-by: Neal Frager <neal.frager@amd.com>
>> ---
>>    .../{ => 4.19.5}/0001-No-trace-backend.patch  |  0
>>    ...2-Arm-platforms-fix-build-with-gcc15.patch |  0
>>    .../0003-Update-linker-flags.patch            |  0
>>    package/xen/Config.in                         | 25 +++++++++++++++++++
>>    package/xen/xen.mk                            |  6 +++--
>>    5 files changed, 29 insertions(+), 2 deletions(-)
>>    rename package/xen/{ => 4.19.5}/0001-No-trace-backend.patch (100%)
>>    rename package/xen/{ => 4.19.5}/0002-Arm-platforms-fix-build-with-gcc15.patch (100%)
>>    rename package/xen/{ => 4.19.5}/0003-Update-linker-flags.patch (100%)
>>
>> diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/4.19.5/0001-No-trace-backend.patch
>> similarity index 100%
>> rename from package/xen/0001-No-trace-backend.patch
>> rename to package/xen/4.19.5/0001-No-trace-backend.patch
>> diff --git a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
>> similarity index 100%
>> rename from package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
>> rename to package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
>> diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/4.19.5/0003-Update-linker-flags.patch
>> similarity index 100%
>> rename from package/xen/0003-Update-linker-flags.patch
>> rename to package/xen/4.19.5/0003-Update-linker-flags.patch
>> diff --git a/package/xen/Config.in b/package/xen/Config.in
>> index dc4d434810..bb44202824 100644
>> --- a/package/xen/Config.in
>> +++ b/package/xen/Config.in
>> @@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
>>
>>    if BR2_PACKAGE_XEN
>>
>> +choice
>> +       prompt "Xen Version"
>> +       help
>> +         Select the specific Xen version you want to use
>> +
>> +config BR2_PACKAGE_XEN_LATEST_VERSION
>> +       bool "4.19.5"
>> +
>> +config BR2_PACKAGE_XEN_CUSTOM_VERSION
>> +       bool "Custom version"
>> +       help
>> +         This option allows to use a specific official version
>> +
>> +endchoice
>> +
>> +config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
>> +       string "Xen version"
>> +       depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
>> +
>> +config BR2_PACKAGE_XEN_VERSION
>> +       string
>> +       default "4.19.5"        if BR2_PACKAGE_XEN_LATEST_VERSION
>> +       default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
>> +                               if BR2_PACKAGE_XEN_CUSTOM_VERSION
>> +
>>    config BR2_PACKAGE_XEN_HYPERVISOR
>>           bool "Xen hypervisor"
>>           help
>> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
>> index 5756dfc68c..e354718021 100644
>> --- a/package/xen/xen.mk
>> +++ b/package/xen/xen.mk
>> @@ -4,8 +4,7 @@
>>    #
>>    ################################################################################
>>
>> -XEN_VERSION = 4.19.5
>> -XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>> +XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
>>    XEN_SELINUX_MODULES = systemd udev xen
>>    XEN_LICENSE = GPL-2.0
>>    XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
>> @@ -13,6 +12,9 @@ XEN_CPE_ID_VENDOR = xen
>>    XEN_CPE_ID_PREFIX = cpe:2.3:o
>>    XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
>>
>> +# Handle stable official Xen versions
>> +XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>> +
> 
>> Moving this seems like it should be part of the next patch.
> 
>> But doesn't matter that much to me, so, with or without:
> 
>> Reviewed-by: John Ernberg <john.ernberg@actia.se>
> 
>> I see your point.  If someone finds something that really does require a
>> change, I will include this change in a v2. Otherwise, I agree that it is not
>> so important.
> 
>> To be honest, my original development had patches 1 and 2 squashed together
>> because the second patch was the one I really wanted to test and verify. This
>> move in the first patch is a remnant of my splitting the patch in two before
>> submission.
> 
>>    # Calculate XEN_ARCH
>>    ifeq ($(ARCH),aarch64)
>>    XEN_ARCH = arm64
>> --
>> 2.25.1
>>
> 
> I am going rebase this patch series tomorrow since a version bump was applied,
> and these patches no longer apply cleanly to master.
> 
> The only thing I will change is moving the XEN_SITE line move from the first
> patch to the second based on John's feedback.
> 
> Given there is no functional change to my patch series, would you like me to
> keep your Reviewed-by and Tested-by tags in my v2 submission or would you like
> to review and test again first?
> You may keep my review tags unless you feel the rebase is so invasive I 
should review it again.

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
