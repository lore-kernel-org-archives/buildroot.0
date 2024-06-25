Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D5C30653
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 10:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71FF6605F1;
	Tue, 25 Jun 2024 10:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQv5USdouhZE; Tue, 25 Jun 2024 10:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC677605FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC677605FA;
	Tue, 25 Jun 2024 10:03:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31961BF5D7
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 10:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A14A818DC
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 10:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjBBP3cX1D7N for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 10:03:27 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 25 Jun 2024 10:03:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3372C818D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3372C818D0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3372C818D0
 for <buildroot@busybox.net>; Tue, 25 Jun 2024 10:03:26 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 11:56:15 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 11:56:14 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:56:13 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 11:56:12 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="160758221"
Date: Tue, 25 Jun 2024 11:56:12 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612135727.11811-5-ps.report@gmx.net>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719309807; x=1750845807;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=DIpgmoT/3e3xakIULPVUJI7mRQaXT06vDbh3uThxsyg=;
 b=tCDvvc5T46+RatkFYyOp3meJGPD7kC8F55LrBQq/fV4Agd4kpJN54FI4
 naQUCENXKt6PnLsks6WDs7NXFpKP2bb2xxOD/Y1GV1+pmgFtytLSoGF1E
 Tp4AHGxyF4Xnm5Z/J7eAUSjoW3By3bZ4+2qrJiv/3kgdcVbqU4V6ByH+q
 i2uzwCdpKXiRBUOMbpvEEXxwig7/vKA9ZgBA6YZNgsIz0qeUUN8CzCOgM
 36opaqpPkKCD6WXuef8OM3GyS+wI4L/IBHgqpxKthpx7hxkwT3AC3UiUl
 3GhJgQa8wtchRHmRzz35ZR00W/qdt1tMck9Q9tj6KEjcIFq5vvq5cHAzp
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=tCDvvc5T
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-12 15:57 +0200, Peter Seiderer via buildroot spake thusly:
> Convert to cmake build with the following autoconf options without
> direct equivalent cmake option:

This change broke the build of host-xz:

    $ ./utils/docker-run
    (docker) $ make defconfig
    (docker) $ make host-xz
    -- The C compiler identification is GNU 10.2.1
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - done
    -- Check for working C compiler: /usr/bin/gcc - skipped
    -- Detecting C compile features
    -- Detecting C compile features - done
    -- Performing Test TUKLIB_LARGE_FILE_SUPPORT_BY_DEFAULT
    -- Performing Test TUKLIB_LARGE_FILE_SUPPORT_BY_DEFAULT - Success
    -- Check if the system is big endian
    -- Searching 16 bit integer
    -- Looking for sys/types.h
    -- Looking for sys/types.h - found
    -- Looking for stdint.h
    -- Looking for stdint.h - found
    -- Looking for stddef.h
    -- Looking for stddef.h - found
    -- Check size of unsigned short
    -- Check size of unsigned short - done
    -- Searching 16 bit integer - Using unsigned short
    -- Check if the system is big endian - little endian
    -- Performing Test HAVE___BUILTIN_BSWAPXX
    -- Performing Test HAVE___BUILTIN_BSWAPXX - Success
    -- Performing Test HAVE___BUILTIN_ASSUME_ALIGNED
    -- Performing Test HAVE___BUILTIN_ASSUME_ALIGNED - Success
    -- Looking for clock_gettime
    -- Looking for clock_gettime - found
    -- Looking for CLOCK_MONOTONIC
    -- Looking for CLOCK_MONOTONIC - found
    -- Performing Test IS_LINUX_WITH_GLIBC
    -- Performing Test IS_LINUX_WITH_GLIBC - Success
    -- Looking for pthread.h
    -- Looking for pthread.h - found
    -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
    -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
    -- Check if compiler accepts -pthread
    -- Check if compiler accepts -pthread - yes
    -- Found Threads: TRUE
    -- Looking for pthread_condattr_setclock
    -- Looking for pthread_condattr_setclock - found
    -- Looking for cap_rights_limit
    -- Looking for cap_rights_limit - not found
    -- Looking for pledge
    -- Looking for pledge - not found
    -- Performing Test HAVE_LINUX_LANDLOCK
    -- Performing Test HAVE_LINUX_LANDLOCK - Failed
    -- Checking how to detect the number of available CPU cores
    -- Performing Test TUKLIB_CPUCORES_SCHED_GETAFFINITY
    -- Performing Test TUKLIB_CPUCORES_SCHED_GETAFFINITY - Success
    -- Checking how to detect the amount of physical memory
    -- Performing Test TUKLIB_PHYSMEM_SPECIAL
    -- Performing Test TUKLIB_PHYSMEM_SPECIAL - Failed
    -- Performing Test TUKLIB_PHYSMEM_AIX
    -- Performing Test TUKLIB_PHYSMEM_AIX - Failed
    -- Performing Test TUKLIB_PHYSMEM_SYSCONF
    -- Performing Test TUKLIB_PHYSMEM_SYSCONF - Success
    -- Performing Test HAVE_FUNC_ATTRIBUTE_CONSTRUCTOR
    -- Performing Test HAVE_FUNC_ATTRIBUTE_CONSTRUCTOR - Success
    -- Looking for cpuid.h
    -- Looking for cpuid.h - found
    -- Looking for immintrin.h
    -- Looking for immintrin.h - found
    -- Performing Test HAVE__MM_MOVEMASK_EPI8
    -- Performing Test HAVE__MM_MOVEMASK_EPI8 - Success
    -- Performing Test HAVE_USABLE_CLMUL
    -- Performing Test HAVE_USABLE_CLMUL - Success
    -- Performing Test HAVE_ARM64_CRC32
    -- Performing Test HAVE_ARM64_CRC32 - Failed
    -- Looking for getopt_long
    -- Looking for getopt_long - found
    -- Looking for program_invocation_name
    -- Looking for program_invocation_name - found
    -- Looking for mbrtowc
    -- Looking for mbrtowc - found
    -- Looking for wcwidth
    -- Looking for wcwidth - found
    -- Looking for optreset
    -- Looking for optreset - not found
    -- Looking for posix_fadvise
    -- Looking for posix_fadvise - found
    -- Performing Test HAVE_STRUCT_STAT_ST_ATIM_TV_NSEC
    -- Performing Test HAVE_STRUCT_STAT_ST_ATIM_TV_NSEC - Success
    -- Looking for futimens
    -- Looking for futimens - found
    -- Configuring done
    CMake Error at CMakeLists.txt:1675 (add_executable):
      Target "xz" links to target "Intl::Intl" but the target was not found.
      Perhaps a find_package() call is missing for an IMPORTED target, or an
      ALIAS target is missing?


    CMake Error at CMakeLists.txt:1619 (add_executable):
      Target "lzmainfo" links to target "Intl::Intl" but the target was not
      found.  Perhaps a find_package() call is missing for an IMPORTED target, or
      an ALIAS target is missing?


    -- Generating done
    CMake Warning:
      Manually-specified variables were not used by the project:

        BUILD_DOC
        BUILD_DOCS
        BUILD_EXAMPLE
        BUILD_EXAMPLES
        BUILD_TEST
        BUILD_TESTS
        CMAKE_ASM_COMPILER
        CMAKE_CXX_COMPILER
        CMAKE_CXX_FLAGS
        CMAKE_FIND_ROOT_PATH_MODE_LIBRARY


    CMake Generate step failed.  Build files cannot be regenerated correctly.

Could you have a look, please?

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
