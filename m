Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FC9C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 08:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198B360C0C;
	Thu, 27 Oct 2022 08:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198B360C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DDsAO6bWpjB; Thu, 27 Oct 2022 08:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E98460AA7;
	Thu, 27 Oct 2022 08:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E98460AA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02E951BF86C
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 08:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D241D60B43
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 08:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D241D60B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SxPTfcsWzw0 for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 08:57:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF3B607F5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF3B607F5
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 08:57:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u6so740262plq.12
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 01:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e++y8clSmFXQDxDkcY45wbEoPZhU0Jz/yQuxwO1/dXE=;
 b=e8DKLoU6GfY0K7VJr3rLPDFOTPp69OrILUuX7OGgUUNQOwcpMlCHAXfNxvm/ilZwTn
 /kLvb+fbHnX4lmPAYFaBmfP1XqEr+8owW78WNzGJ593yFfB2fGt+GdLARQ0Y+qrXSoIb
 9F/AeJqsEitsWtIn/NEzAvu1pHuatUiySWHTsBeA7g6XJP+rJVHTdzENnf3YrzBksaki
 buR5g6JBORTMC4l5NTaJ9fgKaRjvRBQshKsKOKHeHfs4oPmNYHUPSgXrz6+4g8u524o/
 z7LeYf2Akbfwb1Uc/F1SZFxFlauDC8zfqEYq3RKDviTGMvLBnrbTq/vyGMJMf2eewGf0
 +Gdg==
X-Gm-Message-State: ACrzQf1ogVydpfrtsMnILetrqQpFHGuhFWVnq/Nxa1uev1hS6GvnHDTy
 YH80+hQ2AC9C9llJ2in9ESTM87S6A88cMp4PwxbeZnaD
X-Google-Smtp-Source: AMsMyM4eXUTtJirA++Oieg59LsBf4zBnAa4IYvH3zpMtsH3QSb0cY1XCjwLN1vj5bU7BcIe4El3BcRlZ5UKLHcMsFKU=
X-Received: by 2002:a17:90a:4404:b0:209:a883:7f45 with SMTP id
 s4-20020a17090a440400b00209a8837f45mr9002107pjg.106.1666861025763; Thu, 27
 Oct 2022 01:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221002150443.159058-1-robimarko@gmail.com>
 <CA+_SqVb_myPvacmgT4+hvk09VqxB0zSTWVNMPcfQX7_vjc8paA@mail.gmail.com>
In-Reply-To: <CA+_SqVb_myPvacmgT4+hvk09VqxB0zSTWVNMPcfQX7_vjc8paA@mail.gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 27 Oct 2022 10:56:54 +0200
Message-ID: <CAOX2RU5K8mPkSmwJQFgMAXcVm2ujARobsKJb=rVCobSANDnRCg@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e++y8clSmFXQDxDkcY45wbEoPZhU0Jz/yQuxwO1/dXE=;
 b=ITreQP2VXxGvD9RE97fh68Plz80lkgOjSYHadW6Pp1SSKkYadPcNilRr8iaU08dIyi
 EZyO8NSZyihsK7ti7f6ma8VMQkh0bNo7t1jyYul5tLmDUij4UX0Rs+pVlg2ohh9nYeTa
 uruhplZBF8BqOyxUt8XrBATUML1dJNQ7q3nZfZSyUaUC9NbLHkJqjkvQAZlI0LkdI6dZ
 at5yGkeJRJvnACG/7pHDKrnHwQ3NYeTbg5nI7Vai1AJsSIv5U+1Hbi+NMB1Rd7zqA8S8
 NzeFK4tKF9DkpRqEc/klIqkcMS2mTieR2S2/4PSTzvMoOK9e32z/oHEW8WKyJQD+VMKZ
 HtAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ITreQP2V
Subject: Re: [Buildroot] [PATCH v2] package/mdio-tools: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Oct 2022 at 18:15, Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
>
>
>
> On Sun, Oct 2, 2022 at 5:05 PM Robert Marko <robimarko@gmail.com> wrote:
>>
>> mdio-tools are kernel module and accompanying tools for low-level
>> debugging of devices attached on MDIO bus like PHY-s, switches etc.
>>
>> Userspace tools provide C22 or C45 reads and writes, benchmarking
>> and even dedicated Marvell Link Street tools via the included
>> kernel module.
>>
>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>> ---
>> Changes in v2:
>> * Correct license
>> * Add host-pkgconf to DEPENDENCIES
>> * Add minimal required kernel config options
>> ---
>>  package/Config.in                  |  1 +
>>  package/mdio-tools/Config.in       |  9 +++++++++
>>  package/mdio-tools/mdio-tools.hash |  3 +++
>>  package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
>>  4 files changed, 33 insertions(+)
>>  create mode 100644 package/mdio-tools/Config.in
>>  create mode 100644 package/mdio-tools/mdio-tools.hash
>>  create mode 100644 package/mdio-tools/mdio-tools.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index e3a34d6e97..ed41e8bdd4 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -536,6 +536,7 @@ endmenu
>>         source "package/mbpfan/Config.in"
>>         source "package/mdadm/Config.in"
>>         source "package/mdevd/Config.in"
>> +       source "package/mdio-tools/Config.in"
>>         source "package/memtest86/Config.in"
>>         source "package/memtester/Config.in"
>>         source "package/memtool/Config.in"
>> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
>> new file mode 100644
>> index 0000000000..feb1e825ac
>> --- /dev/null
>> +++ b/package/mdio-tools/Config.in
>> @@ -0,0 +1,9 @@
>> +comment "mdio-tools needs a Linux kernel to be built"
>> +       depends on !BR2_LINUX_KERNEL
>> +
>> +config BR2_PACKAGE_MDIO_TOOLS
>> +       bool "mdio-tools"
>> +       depends on BR2_LINUX_KERNEL
>
>
> depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>
> I think you miss this here

Thanks, I completely missed it.
Added in v3.

Regards,
Robert
>
>>
>> +       select BR2_PACKAGE_LIBMNL
>> +       help
>> +         Low-level debug tools for MDIO devices
>> diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
>> new file mode 100644
>> index 0000000000..0111165f27
>> --- /dev/null
>> +++ b/package/mdio-tools/mdio-tools.hash
>> @@ -0,0 +1,3 @@
>> +# Locally computed
>> +sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
>> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
>> new file mode 100644
>> index 0000000000..308a23824b
>> --- /dev/null
>> +++ b/package/mdio-tools/mdio-tools.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# mdio-tools
>> +#
>> +################################################################################
>> +
>> +MDIO_TOOLS_VERSION = 1.2.0
>> +MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
>> +MDIO_TOOLS_LICENSE = GPL-2.0
>> +MDIO_TOOLS_LICENSE_FILES = COPYING
>> +MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
>> +
>> +MDIO_TOOLS_MODULE_SUBDIRS = kernel
>> +define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
>> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
>> +       $(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
>> +endef
>> +
>> +$(eval $(kernel-module))
>> +$(eval $(autotools-package))
>> --
>> 2.37.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
>
> --
>
> Angelo Compagnucci
>
> Software Engineer
>
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
>
> Via le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
> [`as] https://www.amarulasolutions.com|
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
