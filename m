Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262444161E;
	Wed,  6 Apr 2022 14:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATv94sjSy5jQ; Wed,  6 Apr 2022 14:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CBEF40922;
	Wed,  6 Apr 2022 14:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68311BF300
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C723E83104
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f22fX3thKDhl for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:12:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DA3082718
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 14:12:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k23so4575768ejd.3
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 07:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/GC6qIy/NG9842JHUyWtWvztTHxghKWyZDo5KN2oRsY=;
 b=RtlLylLMwAZ7WCB+222fQL7Ah+TyEIzSGsuyfWyFOg8XWuzdNvd3bdFAi6Sqf/y79+
 cGHOGFSrKjNzleC4ipQKTxFEcDp9D/xK4cUY0dc61ua0tbcZU/bpeMWHRUPvHjdlKpi2
 uwf/K4o7l0fLF9BH1yFvvXU85qxBNwXEtSf4pwbvLeZr83A6oiN/LNteU2EpEbqsahPP
 jlszL2nTv+wr5cj1XurCRKY32fpuABvhp9MlCct4ou8q5ho+6HGnDtUWuQzZRei9iuo8
 ld6LUwy2zisKtzoiQMj0CAnfDCONK6WQH0s/sTT0YFwQXyc6qXHqC8lBSJd60lrDuqjQ
 Oiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/GC6qIy/NG9842JHUyWtWvztTHxghKWyZDo5KN2oRsY=;
 b=36R4/5MVm0G1Gsg91lb6onl5zS5NzCwf75qL8fVRdYe0iOQWXAyhQ8FnRgmjx3lJNj
 SfhuCwLMz34MgcE4s/sR0XiOCM7VRzq4RxFQghiVzzUgkhQ/IzLU5aAf5wZP0ffRDl2/
 I3k1O4nGNI7URmyhwg6cUTK8kwmMPa7hKmpLzP1lB4/aKucWsZCHb3ouVFQSh/jKGir7
 hkVVXWVlaredxrQuKViJ5O6Oehb7NKofznc4gZ5Bts92Lmsta+MmNudp9ozbJdgGZbOP
 e7Llzra30cngV1UJB8C+lB1BKZ64zpi8BO+eUGDoCnvOIvfUOvMC0kL4kAPgISfiEAr9
 cMzw==
X-Gm-Message-State: AOAM533k1fp6Ee7tJmNB4IDdkA/h5+vdUsntQsqHLJkZGojdyBIh+vpn
 EqKpS79EDAgg9e73zeQsW5w1u3915D8HEA==
X-Google-Smtp-Source: ABdhPJxB0Ci2lv/jSwGnlki59SyeY65bsw8J2NqHIXWTRoWQga1WKFLg2FFG3oUKfP+GvRHTDe/Smg==
X-Received: by 2002:a17:907:9482:b0:6da:8ad6:c8b5 with SMTP id
 dm2-20020a170907948200b006da8ad6c8b5mr8401589ejc.372.1649254362080; 
 Wed, 06 Apr 2022 07:12:42 -0700 (PDT)
Received: from [192.168.0.179] ([83.217.130.159])
 by smtp.gmail.com with ESMTPSA id
 sh31-20020a1709076e9f00b006dff86479d7sm6662798ejc.21.2022.04.06.07.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:12:41 -0700 (PDT)
Message-ID: <41d50cfd-3009-13d4-6f41-f0b2bdf3297f@mind.be>
Date: Wed, 6 Apr 2022 16:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
 <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
 <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 21:38, James Hilliard wrote:
> On Tue, Apr 5, 2022 at 11:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 05/04/2022 13:50, James Hilliard wrote:
>>> Currently we only test a limited set of toolchains that are mostly
>>> prebuilt, add a flag to allow using randconfig for randomizing
>>> additional toolchain settings instead of randpackageconfig.
>>>
>>> To avoid invalid configs we need to add additional config validation
>>> filtering and fixups.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>> Changes v3 -> v4:
>>>     - use fixup_config instead of other retries to filter bad configs
>>
>>    Well, I don't like this. It means we have to duplicate the logic for checking
>> the bad configs in two places: in the mk file and in genrandconfig.
> 
> Well it seems to work better since instead of regenerating it tries to
> fixup the config. I think this gives better statistical coverage of some
> config options.

  It will create a bias towards the default option for the options you exclude. 
See below.

> 
>>
>>    If the problem is that you sometimes don't end up with a valid config even
>> after 100 iterations, then I think a better solution is to feed valid values for
>> the string options. That way, we still do a build test of e.g.
>> BR2_ROOTFS_SKELETON_CUSTOM.
> 
> That looks a bit tricky, although we could probably add it for some cases
> that we want test coverage for.
> 
>>
>>    [Others may disagree with me of course.]
>>
>>    Regards,
>>    Arnout
>>
>>
>>> Changes v2 -> v3:
>>>     - properly check exit codes
>>> Changes v1 -> v2:
>>>     - refactor fixup_config control flow
>>> ---
>>>    utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 206 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
>>> index 3483d55c14..59fe34e58d 100755
>>> --- a/utils/genrandconfig
>>> +++ b/utils/genrandconfig
>>> @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
>>>            configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
>>>            configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
>>>
>>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
>>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:

  Here, the BR2_ROOTFS_SKELETON_CUSTOM_PATH check is basically redundant: 
randconfig will never fill something in for the string, so it is always empty.

>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')

  Thus, the result is that if a config is generated with 
BR2_ROOTFS_SKELETON_CUSTOM=y, it will be removed again and revert to its default.

  In this case, there are just two choices so it doesn't make a difference. But 
if there are more than two choices, removing one of them creates a bias towards 
the default option. I wouldn't call this "better statistical coverage". 
Statistically, taking a completely random sampling and then discarding samples 
that are somehow not appropriate is considered "better" than fudging 
inappropriate samples in a certain direction.


  Regards,
  Arnout



>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
>>> +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
>>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
>>> +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
>>> +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
>>> +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
>>> +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
>>> +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
>>> +
>>> +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
>>> +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
>>> +
>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
>>> +
>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
>>> +
>>> +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
>>> +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
>>> +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
>>> +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
>>> +
>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
>>> +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
>>> +
>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
>>> +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
>>> +
>>> +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
>>> +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
>>> +
>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
>>> +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
>>> +
>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
>>> +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
>>> +
>>> +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
>>> +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
>>> +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
>>> +
>>> +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
>>> +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
>>> +
>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
>>> +
>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
>>> +
>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
>>> +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
>>> +
>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>>> +            return False
>>> +
>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>>> +            return False
>>> +
>>> +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
>>> +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>> +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>> +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
>>> +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
>>> +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
>>> +
>>>        with open(configfile, "w+") as configf:
>>>            configf.writelines(configlines)
>>>
>>> @@ -331,11 +517,14 @@ def gen_config(args):
>>>
>>>        sysinfo = SystemInfo()
>>>
>>> -    # Select a random toolchain configuration
>>> -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
>>> +    if args.toolchains_csv:
>>> +        # Select a random toolchain configuration
>>> +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
>>>
>>> -    i = randint(0, len(configs) - 1)
>>> -    toolchainconfig = configs[i]
>>> +        i = randint(0, len(configs) - 1)
>>> +        toolchainconfig = configs[i]
>>> +    else:
>>> +        toolchainconfig = []
>>>
>>>        configlines = list(toolchainconfig)
>>>
>>> @@ -409,7 +598,7 @@ def gen_config(args):
>>>            bounded_loop -= 1
>>>            subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>>                                   "KCONFIG_PROBABILITY=%d" % randint(1, 20),
>>> -                               "randpackageconfig"])
>>> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
>>>
>>>            if fixup_config(sysinfo, configfile):
>>>                break
>>> @@ -433,10 +622,18 @@ if __name__ == '__main__':
>>>        parser.add_argument("--buildrootdir", "-b",
>>>                            help="Buildroot directory (relative to current directory)",
>>>                            type=str, default='.')
>>> -    parser.add_argument("--toolchains-csv",
>>> -                        help="Path of the toolchain configuration file",
>>> -                        type=str,
>>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
>>> +
>>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
>>> +    toolchains_csv.add_argument("--toolchains-csv",
>>> +                                dest="toolchains_csv",
>>> +                                help="Path of the toolchain configuration file",
>>> +                                type=str)
>>> +    toolchains_csv.add_argument("--no-toolchains-csv",
>>> +                                dest="toolchains_csv",
>>> +                                help="Generate random toolchain configuration",
>>> +                                action='store_false')
>>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
>>> +
>>>        args = parser.parse_args()
>>>
>>>        # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
