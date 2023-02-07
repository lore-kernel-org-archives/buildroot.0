Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E9C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF5E4091C;
	Tue,  7 Feb 2023 21:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF5E4091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMZ1NlavqxnD; Tue,  7 Feb 2023 21:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2985040994;
	Tue,  7 Feb 2023 21:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2985040994
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 597601BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4080040994
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4080040994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGYhh247Irb4 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:57:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C066C4091C
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C066C4091C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:57:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id l12so9139734edb.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0cVaUDQn7aUv/71Jxs4FmeflxvEW6Tmc2Apdnm5vvk=;
 b=p6Jl/y3p8IMvuAFtNBkq1NNzoKDj8TuhOpJwnUEIEANDnfyXN9jiWhF2X8s6KnXpF5
 sTAREWlFTae0//bj8wCfJ4rEFEWTMfKDE4nChbLxtYO/DkX9jRIekdJD5J+Ab8DHdnIp
 UFcZV5V0ObPUnYWetgizXEgGHeDQtOndADA8lZlsvRlQ5bOPB0T0vTk6EnJYFV6jav0z
 V0XOUGrtFWWHJKtIWWVIjsAhB5zEroZRteZOJBvHNelY2oG/6xO+aF29XBn5slsNwAzu
 nqdjvaS9q9/p0tF6c7Ey4BlaS174paoSy5WFMv4i4Bd4J8ECy9N90hyVrRRGtO22ioJV
 OdqQ==
X-Gm-Message-State: AO0yUKWza1wU5EN41cc8mHyHRmzrKBp3rvmwtrPNPtH6lrA5MHLrnz/a
 UdXLGPLGnw7bVKbN32i6AWepBAC7Aa1cT9CM
X-Google-Smtp-Source: AK7set8xc+Z+dgx9dE4BTevsPC9g62bMGRFosJzha6mIbWi950GsWUO8uiFWw0im6JqJBzX1Ly0MYg==
X-Received: by 2002:a50:d49e:0:b0:46d:35f6:5a9b with SMTP id
 s30-20020a50d49e000000b0046d35f65a9bmr5267976edi.24.1675807033920; 
 Tue, 07 Feb 2023 13:57:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fg10-20020a056402548a00b004a23558f01fsm6955344edb.43.2023.02.07.13.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 13:57:13 -0800 (PST)
Message-ID: <1fcf8ae7-38a5-a634-8354-cb11788de6ac@mind.be>
Date: Tue, 7 Feb 2023 22:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20230115114840.9027-1-nolange79@gmail.com>
 <6490dfd6-5f3b-3801-6955-7fa655f2a82b@mind.be>
 <CADYdroPxYT4xvVpFcL=DUJx0Ks3ep6bdfRvZURb=ZDtjLFRi=w@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADYdroPxYT4xvVpFcL=DUJx0Ks3ep6bdfRvZURb=ZDtjLFRi=w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q0cVaUDQn7aUv/71Jxs4FmeflxvEW6Tmc2Apdnm5vvk=;
 b=A0hIUdw+demXzzliVmMQgP23jvNloZGBmJ/40Bivk+GvNCuM9jH5A+rqkdd/S7TVDw
 C1kwDKQqfsOj2/vASnwjdCEBxVVNXEBgu8rC7SmMZ1s+LSLGIVw554QNDpN/x17dO4sm
 VP602tHzcOMcTAzDRsXd0+XZYBZ0J056T7aFEQA/0OuUWDGM6Vgj+sGkeWl3Bug9KDnl
 kd2b9q/kTsW1qW0Ahaotd6TqXUTLdslIZSHpBHO5d6ikD6Nix7KYUdjfpyuxVGuUSu/d
 QBp7v5UxbSQxnynJDu+2YWqDHxKR7alsUSpsoptEXYTrNpb7vZWcsisBazsfb8h9gD5F
 DI9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A0hIUdw+
Subject: Re: [Buildroot] [PATCH v8 1/4] package/systemd: bump to version
 252.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2023 19:38, Norbert Lange wrote:
> Am Di., 7. Feb. 2023 um 17:41 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>>
>> On 15/01/2023 12:48, Norbert Lange wrote:

[snip]
>>    Applied to master, thanks. (Not pushed yet, I may make more changes while
>> reviewing the rest of the series.)
> 
> Wouldnt mind if you do a stealthy bump to 254.5 before going through
> all testing trouble ;)

  I'm afraid I already pushed now...

  Regards,
  Arnout

> 
> Regards, Norbert
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> package/systemd: 252.4
>>> ---
>>>    package/systemd/Config.in    | 12 +++++++++---
>>>    package/systemd/systemd.hash |  5 +++--
>>>    package/systemd/systemd.mk   | 16 ++++++++++++++--
>>>    system/Config.in             |  6 +++---
>>>    4 files changed, 29 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>>> index 45a9e2d644..f35305c0be 100644
>>> --- a/package/systemd/Config.in
>>> +++ b/package/systemd/Config.in
>>> @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>>>        depends on !BR2_STATIC_LIBS # kmod
>>>        depends on BR2_TOOLCHAIN_USES_GLIBC
>>>        depends on BR2_TOOLCHAIN_HAS_SSP
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>>>        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>>>        depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>>>        select BR2_PACKAGE_HAS_UDEV
>>> @@ -51,7 +51,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>>>          an elaborate transactional dependency-based service control
>>>          logic.  It can work as a drop-in replacement for sysvinit.
>>>
>>> -       Systemd requires a Linux kernel >= 3.13 with the following
>>> +       Kernel versions below 4.15 ("recommended baseline") have
>>> +       significant gaps in functionality and are not recommended
>>> +       for use with this version of systemd.
>>> +
>>> +       Systemd requires a Linux kernel >= 3.15 with the following
>>>          options enabled:
>>>
>>>          - CONFIG_DEVTMPFS
>>> @@ -66,9 +70,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>>>          - CONFIG_PROC_FS
>>>          - CONFIG_FHANDLE (libudev, mount and bind mount handling)
>>>
>>> -       - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
>>> +       - CONFIG_NET_NS (Required for PrivateNetwork=, used in some
>>>            systemd units)
>>>
>>> +       - CONFIG_USER_NS (Required for PrivateUsers=)
>>> +
>>>          - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
>>>          - CONFIG_TMPFS_POSIX_ACL
>>>          - CONFIG_TMPFS_XATTR
>>> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
>>> index 3b98566f32..00c08edcd9 100644
>>> --- a/package/systemd/systemd.hash
>>> +++ b/package/systemd/systemd.hash
>>> @@ -1,5 +1,5 @@
>>>    # sha256 locally computed
>>> -sha256  638a2fc78828765fc97bc73f428205b6dc1d359149b6c6bfe4d2a649cba2cca8  systemd-250.8.tar.gz
>>> +sha256  cf2d27e67663d599a045101c7178cf0ec63d9df2962a54adf7de0d0357724f00  systemd-252.4.tar.gz
>>>    sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>>>    sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>>>    sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
>>> @@ -8,7 +8,8 @@ sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENS
>>>    sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
>>>    sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
>>>    sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
>>> +sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
>>>    sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
>>>    sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
>>>    sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
>>> -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
>>> +sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>> index b96873b73f..b0597f9bb4 100644
>>> --- a/package/systemd/systemd.mk
>>> +++ b/package/systemd/systemd.mk
>>> @@ -19,7 +19,7 @@
>>>    # - Diff sysusers.d with the previous version
>>>    # - Diff factory/etc/nsswitch.conf with the previous version
>>>    #   (details are often sprinkled around in README and manpages)
>>> -SYSTEMD_VERSION = 250.8
>>> +SYSTEMD_VERSION = 252.4
>>>    SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>>>    SYSTEMD_LICENSE = \
>>>        LGPL-2.1+, \
>>> @@ -29,6 +29,7 @@ SYSTEMD_LICENSE = \
>>>        BSD-3-Clause (tools/chromiumos), \
>>>        CC0-1.0 (few source files, see LICENSES/README.md), \
>>>        GPL-2.0 with Linux-syscall-note (linux kernel headers), \
>>> +     MIT-0 (few source files, see LICENSES/README.md), \
>>>        MIT (few source files, see LICENSES/README.md), \
>>>        OFL-1.1 (Heebo fonts)
>>>    SYSTEMD_LICENSE_FILES = \
>>> @@ -40,6 +41,7 @@ SYSTEMD_LICENSE_FILES = \
>>>        LICENSES/LGPL-2.0-or-later.txt \
>>>        LICENSES/Linux-syscall-note.txt \
>>>        LICENSES/lookup3-public-domain.txt \
>>> +     LICENSES/MIT-0.txt \
>>>        LICENSES/MIT.txt \
>>>        LICENSES/murmurhash2-public-domain.txt \
>>>        LICENSES/OFL-1.1.txt \
>>> @@ -61,7 +63,13 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
>>>    SYSTEMD_PROVIDES = udev
>>>
>>>    SYSTEMD_CONF_OPTS += \
>>> +     -Ddbus=false \
>>> +     -Ddbus-interfaces-dir=no \
>>> +     -Ddefault-compression='auto' \
>>>        -Ddefault-hierarchy=unified \
>>> +     -Ddefault-locale='C.UTF-8' \
>>> +     -Ddefault-user-shell=/bin/sh \
>>> +     -Dfirst-boot-full-preset=false \
>>>        -Didn=true \
>>>        -Dima=false \
>>>        -Dkexec-path=/usr/sbin/kexec \
>>> @@ -72,6 +80,7 @@ SYSTEMD_CONF_OPTS += \
>>>        -Dman=false \
>>>        -Dmount-path=/usr/bin/mount \
>>>        -Dmode=release \
>>> +     -Dnspawn-locale='C.UTF-8' \
>>>        -Dnss-systemd=true \
>>>        -Dquotacheck-path=/usr/sbin/quotacheck \
>>>        -Dquotaon-path=/usr/sbin/quotaon \
>>> @@ -82,6 +91,7 @@ SYSTEMD_CONF_OPTS += \
>>>        -Dsulogin-path=/usr/sbin/sulogin \
>>>        -Dsystem-gid-max=999 \
>>>        -Dsystem-uid-max=999 \
>>> +     -Dsysupdate=false \
>>>        -Dsysvinit-path= \
>>>        -Dsysvrcnd-path= \
>>>        -Dtelinit-path= \
>>> @@ -553,7 +563,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>>>    SYSTEMD_CONF_OPTS += \
>>>        -Defi=true \
>>>        -Dgnu-efi=true \
>>> -     -Defi-cc=$(TARGET_CC) \
>>>        -Defi-ld=bfd \
>>>        -Defi-libdir=$(STAGING_DIR)/usr/lib \
>>>        -Defi-includedir=$(STAGING_DIR)/usr/include/efi
>>> @@ -793,6 +802,8 @@ HOST_SYSTEMD_CONF_OPTS = \
>>>        -Dbinfmt=false \
>>>        -Drepart=false \
>>>        -Dcoredump=false \
>>> +     -Ddbus=false \
>>> +     -Ddbus-interfaces-dir=no \
>>>        -Dpstore=false \
>>>        -Doomd=false \
>>>        -Dlogind=false \
>>> @@ -801,6 +812,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>>>        -Dmachined=false \
>>>        -Dportabled=false \
>>>        -Dsysext=false \
>>> +     -Dsysupdate=false \
>>>        -Duserdb=false \
>>>        -Dhomed=false \
>>>        -Dnetworkd=false \
>>> diff --git a/system/Config.in b/system/Config.in
>>> index 806a747315..232bdfe763 100644
>>> --- a/system/Config.in
>>> +++ b/system/Config.in
>>> @@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
>>>        depends on BR2_TOOLCHAIN_USES_GLIBC
>>>        depends on BR2_TOOLCHAIN_HAS_SSP
>>>        depends on BR2_TOOLCHAIN_HAS_THREADS
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>>>        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>>>        depends on BR2_HOST_GCC_AT_LEAST_5
>>>        select BR2_ROOTFS_MERGED_USR
>>>        select BR2_PACKAGE_SYSTEMD
>>>        select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
>>>
>>> -comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
>>> +comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
>>>        depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>>>        depends on BR2_USE_MMU
>>>        depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>>>                !BR2_TOOLCHAIN_HAS_SSP || \
>>> -             !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
>>> +             !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
>>>                !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>>>                !BR2_HOST_GCC_AT_LEAST_5
>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
