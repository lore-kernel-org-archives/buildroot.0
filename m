Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABF0C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 10:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A1061178
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 10:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9A1061178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925A360682;
	Sun, 22 Aug 2021 10:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IBNSR7wJc03; Sun, 22 Aug 2021 10:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04FDF606DC;
	Sun, 22 Aug 2021 10:38:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE5291BF2FC
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 10:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5DE606DC
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 10:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw40mkbJdLWT for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 10:38:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E8DD60682
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 10:38:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u15so8655910wmj.1
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=tRjdZnUVj8kicbmTsFET7ozIGz30kbBRK8l9XSbFo/8=;
 b=vC0mpwNpCD+k1lXVG7VYh8fWl3ImmbJEYLm8EopTwLne/V2iLxuZYCCeT0y+UYo8re
 rMZ0YYQzw480LTwkGEV7RNg2oSZdmvFI+6DjmQjIU9RRMPF48qk7nTBB1Zqhq1dtkm04
 0b35vcZibwEmfHoBug9Mp8z/n5L4ItTxT8zE38wfVNH5pMkp5yoZTKOme0zhsxpuHBQp
 Tm7thSZ8f9y4HUzjLv8ISf9jVfTmlzC6H5DRkW9iSPRjGrXkklsNAgp6LeKBx3jR8M2m
 RnYq/L2AJU4rm6NZWEXK/KzOQUOesie5kNzmzyErC9ZW2S0m9e7yNcnu503yO4WV0aiF
 m4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=tRjdZnUVj8kicbmTsFET7ozIGz30kbBRK8l9XSbFo/8=;
 b=YzSLOHApp0nvitpr4RRrzoe6qCpFnD6cGrsdFs8ylEmLR3aHkfW7Tj4m8wvY28Shq+
 j4gzApTeHyJA1lgmIO04kBcASRu/gZLkgcCQJgoWiIJGxKQi+j/ktNV2IZhLqafWd4/4
 GxvObOJFj1Up8F10G4YezVVG5WTUJmwjqSxcOv7WLSxLAz3vxK/aKwpfb2pagXGE2Z57
 CUPdB+k3HCCu35+GhmwcPV9L/3sK7QB53jvdLXEzz/uoLeV5s6tcVKBrUWGnyfYCYaJb
 Fu8/YLU62FqmlkWpUm4QfStiPQFriTJb3edPdoHevsuBHJ4ITHzsUD3Yt9D854TxOmW6
 jqDQ==
X-Gm-Message-State: AOAM532Gslz/DUENM/fJ+9qkWHXea82i29LXR/QzjHbpOYafCMgJ5ReW
 MUhE/DA8NDd8OsryRT9ejJQIcwYnNEM=
X-Google-Smtp-Source: ABdhPJwnRMEzy2xNOCOtSyjgI7eejIIJkAXcGx6qRCoDPgmVgqEdIOjK1I3RAX+3JSCTdK8EuT2F+Q==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr11783757wme.74.1629628709315; 
 Sun, 22 Aug 2021 03:38:29 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id g21sm15411336wmk.8.2021.08.22.03.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 03:38:28 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
References: <20210317095228.447428-1-salvador.joseluis@gmail.com>
 <20210413211601.GF359705@scaer>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <640d83d7-f2f3-ebcc-da79-5bee7bf72ae6@gmail.com>
Date: Sun, 22 Aug 2021 12:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210413211601.GF359705@scaer>
Content-Type: multipart/mixed; boundary="------------68D272E5348833B83D5663AC"
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3] package/zfs: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a multi-part message in MIME format.
--------------68D272E5348833B83D5663AC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello José Luis, All,

Le 13/04/2021 à 23:16, Yann E. MORIN a écrit :
> José Luis, All,
> 
> On 2021-03-17 10:52 +0100, José Luis Salvador Rufo spake thusly:
>> OpenZFS is an advanced file system and volume manager which was originally
>> developed for Solaris and is now maintained by the OpenZFS community. This
>> repository contains the code for running OpenZFS on Linux and FreeBSD.
>>
>> http://zfsonlinux.org/
>>
>> Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
> 
> I did a few substancial changes:
> 
>   - fix test case on how to use a pre-built toolchain
>   - reorder the test case config
>   - add test case with glibc
>   - drop superflous test timeout override
>   - only select libtirpc when C library lacks native RPC
>   - drop unused ZFS_MODULES variable
>   - drop ZFS_CPE_ID_PREFIX and ZFS_AUTORECONF_OPTS which are defaults
>   - drop NLS options, already set in a generic manner
>   - drop incomplete/improper sysvinit support
>   - some cosmetics
> 
> Applied to master with the above changes, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>> Changes v2 -> v3:
>>   - Updated OpenZFS to 2.0.4
>> Changes v1 -> v2:
>>   (suggested by Yann E. MORIN)
>>   - Config.in: check-package accomplished
>>   - Config.in: fixed Config.in dependences
>>   - zfs.hash: proper zfs.hash format
>>   - zfs.mk: added cpe for openzfs
>>   - zfs.mk: uclibc patch merged into upstream
>>   - zfs.mk: removed futile comments as "zfs needs"
>>   - zfs.mk: added comments about the kernel dependence
>>   - zfs.mk: removed autotools default arguments values
>>   - zfs.mk: added optional PAM dependence
>>   - zfs.mk: replaced inline conditionals by full explained blocks
>>   - zfs.mk: added comments about optionals systemd and sysv
>>   - zfs.mk: removed --disable-silent-rules
>>   - zfs.mk: reordered autoreconf
>>   - zfs.mk: removed futile shared, static, and both logic
>>   - zfs.mk: fixed optional python(2|3) support for pyzfs
>>   - zfs.mk: removed futile kernel fragment
>>   - test_zfs: replaced external toolchain by already defined bootlin
>>   - test_zfs: increased memory a bit to prevents OOM
>>   - test_zfs: added pyzfs test
>>
>>  DEVELOPERS                                |  4 +
>>  package/Config.in                         |  1 +
>>  package/zfs/Config.in                     | 32 ++++++++
>>  package/zfs/zfs.hash                      |  6 ++
>>  package/zfs/zfs.mk                        | 90 +++++++++++++++++++++++
>>  support/testing/tests/package/test_zfs.py | 61 +++++++++++++++

The test_zfs doesn't build in our gitlab CI:

https://gitlab.com/kubu93/buildroot/-/jobs/1522848483

zfs use the host compiler to check if it can build zfs modules for the target

checking kernel source directory...
/builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13
checking kernel build directory...
/builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13
checking kernel source version... 5.12.13
checking kernel file name for module symbols... Module.symvers
checking whether modules can be built... no
configure: error:
	*** Unable to build an empty module.
		
See build-host-gcc-6.log

  CC [M]
/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.o
In file included from <command-line>:0:0:
./arch/x86/include/asm/segment.h: In function 'vdso_read_cpunode':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline

The check pass if a newer host gcc is used (gcc 10.3 here).

Can you have a look ?

Best regards,
Romain

--------------68D272E5348833B83D5663AC
Content-Type: text/x-log; charset=UTF-8;
 name="build-host-gcc-6.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="build-host-gcc-6.log"

$ gcc --version
gcc (Debian 6.3.0-18) 6.3.0 20170516

make[2]: Entering directory '/home/br-user/buildroot/testsuite/TestZfsGlibc/build/linux-5.12.13'
  CC [M]  /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.o
In file included from <command-line>:0:0:
./arch/x86/include/asm/segment.h: In function 'vdso_read_cpunode':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:240:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/segment.h:262:2: note: in expansion of macro 'alternative_io'
  alternative_io ("lsl %[seg],%[p]",
  ^~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/bitops.h:17:0,
                 from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/list.h:9,
                 from ./include/linux/module.h:12,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/alternative.h:108:2: error: expected identifier or '(' before string constant
  "# ALT: oldnstr\n"      \
  ^
./arch/x86/include/asm/alternative.h:159:2: note: in expansion of macro 'OLDINSTR'
  OLDINSTR(oldinstr, 1)      \
  ^~~~~~~~
./arch/x86/include/asm/alternative.h:240:23: note: in expansion of macro 'ALTERNATIVE'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
                       ^~~~~~~~~~~
./arch/x86/include/asm/segment.h:262:2: note: in expansion of macro 'alternative_io'
  alternative_io ("lsl %[seg],%[p]",
  ^~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:240:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/segment.h:262:2: note: in expansion of macro 'alternative_io'
  alternative_io ("lsl %[seg],%[p]",
  ^~~~~~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_slow_inc':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:278:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:278:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:278:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_slow_dec':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:284:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:284:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:284:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_enable':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:306:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:306:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:306:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:309:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
   ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:309:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
   ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:309:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
   ^~~~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_disable':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:317:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:317:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
 #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,        \
                                   ^~~~
./include/linux/jump_label.h:317:2: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
  STATIC_KEY_CHECK_USE(key);
  ^~~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:320:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
   ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:320:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
   ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/jump_label.h:320:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
   ^~~~~~~~~~~~
./arch/x86/include/asm/page_64.h: In function 'clear_page':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:256:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,\
  ^~~~~~~~~~
./arch/x86/include/asm/page_64.h:49:2: note: in expansion of macro 'alternative_call_2'
  alternative_call_2(clear_page_orig,
  ^~~~~~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/bitops.h:17:0,
                 from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/list.h:9,
                 from ./include/linux/module.h:12,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/alternative.h:128:2: error: expected identifier or '(' before string constant
  "# ALT: oldinstr2\n"         \
  ^
./arch/x86/include/asm/alternative.h:168:2: note: in expansion of macro 'OLDINSTR_2'
  OLDINSTR_2(oldinstr, 1, 2)     \
  ^~~~~~~~~~
./arch/x86/include/asm/alternative.h:256:23: note: in expansion of macro 'ALTERNATIVE_2'
  asm_inline volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,\
                       ^~~~~~~~~~~~~
./arch/x86/include/asm/page_64.h:49:2: note: in expansion of macro 'alternative_call_2'
  alternative_call_2(clear_page_orig,
  ^~~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:256:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,\
  ^~~~~~~~~~
./arch/x86/include/asm/page_64.h:49:2: note: in expansion of macro 'alternative_call_2'
  alternative_call_2(clear_page_orig,
  ^~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/special_insns.h: In function 'clflushopt':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:240:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/special_insns.h:217:2: note: in expansion of macro 'alternative_io'
  alternative_io(".byte " __stringify(NOP_DS_PREFIX) "; clflush %P0",
  ^~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/bitops.h:17:0,
                 from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/list.h:9,
                 from ./include/linux/module.h:12,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/alternative.h:108:2: error: expected identifier or '(' before string constant
  "# ALT: oldnstr\n"      \
  ^
./arch/x86/include/asm/alternative.h:159:2: note: in expansion of macro 'OLDINSTR'
  OLDINSTR(oldinstr, 1)      \
  ^~~~~~~~
./arch/x86/include/asm/alternative.h:240:23: note: in expansion of macro 'ALTERNATIVE'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
                       ^~~~~~~~~~~
./arch/x86/include/asm/special_insns.h:217:2: note: in expansion of macro 'alternative_io'
  alternative_io(".byte " __stringify(NOP_DS_PREFIX) "; clflush %P0",
  ^~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:240:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/special_insns.h:217:2: note: in expansion of macro 'alternative_io'
  alternative_io(".byte " __stringify(NOP_DS_PREFIX) "; clflush %P0",
  ^~~~~~~~~~~~~~
./arch/x86/include/asm/processor.h: In function 'prefetch':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:221:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/processor.h:735:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchnta %P1",
  ^~~~~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/bitops.h:17:0,
                 from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/list.h:9,
                 from ./include/linux/module.h:12,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/alternative.h:108:2: error: expected identifier or '(' before string constant
  "# ALT: oldnstr\n"      \
  ^
./arch/x86/include/asm/alternative.h:159:2: note: in expansion of macro 'OLDINSTR'
  OLDINSTR(oldinstr, 1)      \
  ^~~~~~~~
./arch/x86/include/asm/alternative.h:221:23: note: in expansion of macro 'ALTERNATIVE'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
                       ^~~~~~~~~~~
./arch/x86/include/asm/processor.h:735:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchnta %P1",
  ^~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:221:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/processor.h:735:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchnta %P1",
  ^~~~~~~~~~~~~~~~~
./arch/x86/include/asm/processor.h: In function 'prefetchw':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:221:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/processor.h:747:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchw %P1",
  ^~~~~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/bitops.h:17:0,
                 from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/list.h:9,
                 from ./include/linux/module.h:12,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/alternative.h:108:2: error: expected identifier or '(' before string constant
  "# ALT: oldnstr\n"      \
  ^
./arch/x86/include/asm/alternative.h:159:2: note: in expansion of macro 'OLDINSTR'
  OLDINSTR(oldinstr, 1)      \
  ^~~~~~~~
./arch/x86/include/asm/alternative.h:221:23: note: in expansion of macro 'ALTERNATIVE'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
                       ^~~~~~~~~~~
./arch/x86/include/asm/processor.h:747:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchw %P1",
  ^~~~~~~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/alternative.h:221:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature) \
  ^~~~~~~~~~
./arch/x86/include/asm/processor.h:747:2: note: in expansion of macro 'alternative_input'
  alternative_input(BASE_PREFETCH, "prefetchw %P1",
  ^~~~~~~~~~~~~~~~~
./include/linux/thread_info.h: In function 'copy_overflow':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/thread_info.h:199:2: note: in expansion of macro 'WARN'
  WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
  ^~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/thread_info.h:199:2: note: in expansion of macro 'WARN'
  WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
  ^~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:98:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   ^~~~~~~~~~~~
./include/asm-generic/bug.h:130:3: note: in expansion of macro '__WARN_printf'
   __WARN_printf(TAINT_WARN, format);   \
   ^~~~~~~~~~~~~
./include/linux/thread_info.h:199:2: note: in expansion of macro 'WARN'
  WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
  ^~~~
./include/linux/thread_info.h: In function 'check_copy_size':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/thread_info.h:215:6: note: in expansion of macro 'WARN_ON_ONCE'
  if (WARN_ON_ONCE(bytes > INT_MAX))
      ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/thread_info.h:215:6: note: in expansion of macro 'WARN_ON_ONCE'
  if (WARN_ON_ONCE(bytes > INT_MAX))
      ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/thread_info.h:215:6: note: in expansion of macro 'WARN_ON_ONCE'
  if (WARN_ON_ONCE(bytes > INT_MAX))
      ^~~~~~~~~~~~
./include/linux/rcupdate.h: In function 'rcu_head_after_call_rcu':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/rcupdate.h:985:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(func != (rcu_callback_t)~0L);
  ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/rcupdate.h:985:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(func != (rcu_callback_t)~0L);
  ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/rcupdate.h:985:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(func != (rcu_callback_t)~0L);
  ^~~~~~~~~~~~
./include/linux/ktime.h: In function 'ktime_divns':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/ktime.h:154:2: note: in expansion of macro 'WARN_ON'
  WARN_ON(div < 0);
  ^~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/ktime.h:154:2: note: in expansion of macro 'WARN_ON'
  WARN_ON(div < 0);
  ^~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/ktime.h:154:2: note: in expansion of macro 'WARN_ON'
  WARN_ON(div < 0);
  ^~~~~~~
./include/linux/srcu.h: In function 'srcu_read_unlock':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/srcu.h:182:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(idx & ~0x1);
  ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/srcu.h:182:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(idx & ~0x1);
  ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/srcu.h:182:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(idx & ~0x1);
  ^~~~~~~~~~~~
./include/linux/xarray.h: In function 'xa_mk_value':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/xarray.h:54:2: note: in expansion of macro 'WARN_ON'
  WARN_ON((long)v < 0);
  ^~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/xarray.h:54:2: note: in expansion of macro 'WARN_ON'
  WARN_ON((long)v < 0);
  ^~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:94:19: note: in expansion of macro '__WARN_FLAGS'
 #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                   ^~~~~~~~~~~~
./include/asm-generic/bug.h:121:3: note: in expansion of macro '__WARN'
   __WARN();      \
   ^~~~~~
./include/linux/xarray.h:54:2: note: in expansion of macro 'WARN_ON'
  WARN_ON((long)v < 0);
  ^~~~~~~
./include/linux/xarray.h: In function 'xas_set_order':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:75:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, 0);     \
  ^~~~~~~~~~
./include/asm-generic/bug.h:63:57: note: in expansion of macro 'BUG'
 #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                         ^~~
./include/linux/xarray.h:1598:2: note: in expansion of macro 'BUG_ON'
  BUG_ON(order > 0);
  ^~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:75:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, 0);     \
  ^~~~~~~~~~
./include/asm-generic/bug.h:63:57: note: in expansion of macro 'BUG'
 #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                         ^~~
./include/linux/xarray.h:1598:2: note: in expansion of macro 'BUG_ON'
  BUG_ON(order > 0);
  ^~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:75:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, 0);     \
  ^~~~~~~~~~
./include/asm-generic/bug.h:63:57: note: in expansion of macro 'BUG'
 #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                         ^~~
./include/linux/xarray.h:1598:2: note: in expansion of macro 'BUG_ON'
  BUG_ON(order > 0);
  ^~~~~~
./include/linux/kernfs.h: In function 'kernfs_enable_ns':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:330:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kernfs_type(kn) != KERNFS_DIR);
  ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:330:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kernfs_type(kn) != KERNFS_DIR);
  ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:330:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kernfs_type(kn) != KERNFS_DIR);
  ^~~~~~~~~~~~
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:331:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(!RB_EMPTY_ROOT(&kn->dir.children));
  ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:331:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(!RB_EMPTY_ROOT(&kn->dir.children));
  ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kernfs.h:331:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(!RB_EMPTY_ROOT(&kn->dir.children));
  ^~~~~~~~~~~~
./include/linux/kobject.h: In function 'kobject_has_children':
././include/linux/compiler_types.h:250:24: error: expected '(' before '__inline'
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kobject.h:133:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kref_read(&kobj->kref) == 0);
  ^~~~~~~~~~~~
In file included from ./include/linux/bug.h:5:0,
                 from ./include/linux/jump_label.h:250,
                 from ./include/linux/static_key.h:1,
                 from ./arch/x86/include/asm/nospec-branch.h:6,
                 from ./arch/x86/include/asm/paravirt_types.h:45,
                 from ./arch/x86/include/asm/ptrace.h:94,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:13,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.c:64:
./arch/x86/include/asm/bug.h:36:22: error: expected identifier or '(' before string constant
  asm_inline volatile("1:\t" ins "\n"    \
                      ^
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kobject.h:133:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kref_read(&kobj->kref) == 0);
  ^~~~~~~~~~~~
In file included from <command-line>:0:0:
././include/linux/compiler_types.h:250:24: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 #define asm_inline asm __inline
                        ^
./arch/x86/include/asm/bug.h:36:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile("1:\t" ins "\n"    \
  ^~~~~~~~~~
./arch/x86/include/asm/bug.h:88:2: note: in expansion of macro '_BUG_FLAGS'
  _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));  \
  ^~~~~~~~~~
./include/asm-generic/bug.h:104:3: note: in expansion of macro '__WARN_FLAGS'
   __WARN_FLAGS(BUGFLAG_ONCE |   \
   ^~~~~~~~~~~~
./include/linux/kobject.h:133:2: note: in expansion of macro 'WARN_ON_ONCE'
  WARN_ON_ONCE(kref_read(&kobj->kref) == 0);
  ^~~~~~~~~~~~
cc1: all warnings being treated as errors
scripts/Makefile.build:271: recipe for target '/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.o' failed
make[3]: *** [/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest/conftest.o] Error 1
make[3]: Target '__build' not remade because of errors.
Makefile:1859: recipe for target '/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest' failed
make[2]: *** [/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conftest] Error 2
make[2]: Target 'modules' not remade because of errors.
make[2]: Leaving directory '/home/br-user/buildroot/testsuite/TestZfsGlibc/build/linux-5.12.13'

--------------68D272E5348833B83D5663AC
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--------------68D272E5348833B83D5663AC--
