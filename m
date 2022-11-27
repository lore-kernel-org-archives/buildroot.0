Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B8BC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF7881A9C;
	Sun, 27 Nov 2022 13:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF7881A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Blfxux70ex1b; Sun, 27 Nov 2022 13:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE98A81AAB;
	Sun, 27 Nov 2022 13:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE98A81AAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB2C1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2611381AAB
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2611381AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIkt2dcC99ad for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:07:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB5B81A9C
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB5B81A9C
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:07:56 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v82so9037518oib.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Hpgd+3sZpaVm+IRt4OFTLJy7FYrjmLgcZdpLJ0QzqE=;
 b=P1HkvJ1P7CtOQ7S8khJSMSzF38+lUUH0qzquLI7yofFKGo7OH20VtzKAgUqEg54D5D
 FCSuK47wf1lr5+jYiWq1TmKZGtnYjknS8r7caUHiaKgTrZiX4cHYLbTNqDrxR8MXuQtj
 FSLST9iYwmUzzKt/e/yLQyrlCV/tH5fqjOCBG6CajYQ8obMjwt1CmvqE4AU3gHa7uryh
 I36axxMtsvP0sFql5rvS6uRjN9jHE/cx/BEGFiQMBCAKGEuu9DU7IK2GSW7b6G2Y/MUy
 KbJxqgUDVnhbWrcYwjUnDbVUDsE26AMxxtkPntD6atGBmFfHXVUAn7tJg3XlDZ7tJCgm
 C/sA==
X-Gm-Message-State: ANoB5plzWnRHUcByaM5PaKMB8eYZKp+b9+Y8DR537JoXEMUV/JNQK3aZ
 xTUiHR+clymHDytELbjUbT9YUt+tqv8=
X-Google-Smtp-Source: AA0mqf7iLTU4qi9LCLR9QmQcvhQ8rpaIrTjjpORfjiwA448v4TRr1AB+lB+XcYeTAv/tbil6RrJ0hQ==
X-Received: by 2002:aca:d0a:0:b0:35a:429f:3460 with SMTP id
 10-20020aca0d0a000000b0035a429f3460mr13288041oin.202.1669554475593; 
 Sun, 27 Nov 2022 05:07:55 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:07:54 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:14 -0300
Message-Id: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Hpgd+3sZpaVm+IRt4OFTLJy7FYrjmLgcZdpLJ0QzqE=;
 b=CrsPwDU4be1ruQcPRIieROvBhRBp7QR0HDmA/lDgt0zsIJyKs7Pi9tl+RjLtyeIFgK
 8Nxfj80gu/y/tApRZMhajDybW4SZFvnpkWkotOyqdxrO/POUUxVOuEcQ/YUay8SUNYj8
 1LDug4yGjmdJ/0Hvsrc3cYBDJC0Xo55wKK0vzml6xxiyZpwqWpDaFeFqU89pCVqgteQ2
 hB+7Lk9kO2+GYQeQuK+7NZQc45azQ3yU95SNKTDSnExny2PEd7sIW2shnGJI0PrH7/X5
 Sl9hYDUBNynqW0arcF4gHFiWlRgkvqNk0N7eoHWEwFS9vM3t6i3GpnccyOxtT0zqPTvz
 m7BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CrsPwDU4
Subject: [Buildroot] [next 00/25] check-symbols v2
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The script check-symbols checks for inconsistencies on symbols declared
in Config.in and used in .mk files.

Patch 25 is actually v2 for
http://patchwork.ozlabs.org/project/buildroot/patch/20220814233845.2247022-34-ricardo.martincoski@gmail.com/
But v1 was only a prototype/WIP.
There was so many changes from v1 that I honestly gave up keeping track
of them. Because of that, no changelog on this patch.

All other patches in the series are new, found while developing this
script. Because of that, no changelog for patches 1 to 24.

Patches 1 and 2 fix typos on text (help text, CHANGES, ...).

Patch 3 fixes a duplicate symbol on Config.in.legacy, result of a
copy&paste error.
Patch 4 makes check-package to warn about occurrences of duplicated
symbols.

Patch 5 makes the test using test-pkg on GitLab CI easier for defconfigs
that contain disabled options. It was used to test patches 9 and 10
without changing the default git configuration.

Patches 6, 7 and 8 fix the use of ifdef on .mk files.
While testing patch 8, an issue passing config options and an
improvement raised for package pugixml.
Patch 9 fixes the issue.
Patch 10 implements the improvement when passing build options.
Patch 11 adds a comment to busybox.mk, copied from uclibc.mk about
overriding a variable.
Patch 12 makes check-package to warn about the use of ifdef in .mk
files.

While developing patch 25, I noticed that toolchain and
toolchain-buildroot are not really virtual packages but both use the
virtual package infra. Patch 13 add comments to explain why.
Patches 14 and 15 remove usage of legacy symbols from packages.
Patch 16 removes an unused symbol.
Patch 17 fixes a select of a config that belongs to a choice.
Patches 18, 19, 20, 21, 22 and 23 fix legacy handling.
Patch 24 fixes a typo just merged only on next branch.
Patch 25 is the actual goal of this series, adding check-symbols script.

Example usage of the script applying only patch 25 to next:
$ time utils/docker-run utils/check-symbols
Config.in.legacy:634: BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 is part of a "choice" and should not be "select"ed
Config.in.legacy:643: BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1 is part of a "choice" and should not be "select"ed
Config.in.legacy:705: BR2_PACKAGE_OPENJDK_VERSION_11 is part of a "choice" and should not be "select"ed
Config.in.legacy:713: BR2_PACKAGE_OPENJDK_VERSION_17 is part of a "choice" and should not be "select"ed
Config.in.legacy:2097: BR2_PACKAGE_LUA_5_3 is part of a "choice" and should not be "select"ed
Config.in.legacy:2605: BR2_PACKAGE_TI_SGX_AM335X not referenced but has a comment stating it is
Config.in.legacy:2615: BR2_PACKAGE_TI_SGX_AM437X not referenced but has a comment stating it is
Config.in.legacy:2625: BR2_PACKAGE_TI_SGX_AM4430 not referenced but has a comment stating it is
Config.in.legacy:2635: BR2_PACKAGE_TI_SGX_AM5430 not referenced but has a comment stating it is
Config.in.legacy:3973: BR2_GCC_VERSION_ARC is part of a "choice" and should not be "select"ed
Config.in.legacy:4316: BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB is part of a "choice" and should not be "select"ed
Config.in.legacy:4324: BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB is part of a "choice" and should not be "select"ed
boot/uboot/Config.in:445: BR2_TARGET_XLOADER is a legacy symbol and should not be referenced
package/fwts/Config.in:31: BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE defined but not referenced
package/gitlab-runner/Config.in:14: BR2_PACKAGE_LIBCURL_OPENSSL is part of a "choice" and should not be "select"ed
package/rpi-userland/Config.in:43: BR2_arch64 referenced but not defined
system/Config.in:81: BR2_TARGET_GENERIC_PASSWD_MD5 is a legacy symbol and should not be referenced
real    0m4,703s
user    0m0,057s
sys     0m0,020s

The new GitLab CI jobs can be seen here, with the whole series applied
to next:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706073924

Regards,
Ricardo

Ricardo Martincoski (25):
  *: fix typo for separate(d|) in text
  package,legacy: fix typo for "daemon" on help text
  Config.in.legacy: fix typo on BR2_PACKAGE_MEDIAART_BACKEND_QT
  utils/checkpackagelib: warn about redefined config
  support/scripts/generate-gitlab-ci-yml: improve test-pkg support
  package/fwts: use ifeq instead of ifdef
  package/live555: fix build config with locale
  package/pugixml: unconditionally set BUILD_DEFINES
  package/pugixml: fix configuration options
  package/pugixml: use explicit build options
  package/busybox: add comment about variable override
  utils/checkpackagelib: warn about ifdef on .mk
  toolchain/toolchain-buildroot: add comment about using virtual package
    infra
  boot/uboot: remove use of legacy xloader symbol
  system: remove use of legacy md5 option
  package/linux-headers: remove bogus symbol
    BR2_PACKAGE_HOST_LINUX_HEADERS
  package/gitlab-runner: ensure use of LIBCURL_OPENSSL
  package/openpowerlink: properly handle legacy options
  package/gcc: properly handle legacy for renamed ARC option
  package/lua: properly handle legacy for removed version
  package/ti-sgx-km: properly handle legacy for removed options
  package/openjdk: properly handle legacy for renamed options
  package/sunxi-mali-utgard: properly handle legacy for renamed options
  package/rpi-userland: fix typo for BR2_aarch64
  utils/check-symbols: new script

 CHANGES                                       |   4 +-
 Config.in.legacy                              | 101 ++--
 DEVELOPERS                                    |   2 +
 boot/uboot/Config.in                          |   1 -
 package/busybox/busybox.mk                    |   3 +
 package/fwts/fwts.mk                          |   2 +-
 package/gcc/Config.in.host                    |   1 +
 package/gitlab-runner/Config.in               |   1 -
 package/gitlab-runner/gitlab-runner.mk        |   4 +
 package/leafnode2/leafnode2.mk                |   2 +-
 package/linux-headers/Config.in.host          |   3 -
 package/live555/live555.mk                    |   2 +-
 package/lua/Config.in                         |   1 +
 package/ngircd/Config.in                      |   2 +-
 package/openjdk/Config.in                     |   2 +
 package/openpowerlink/Config.in               |   2 +
 package/pugixml/pugixml.mk                    |  24 +-
 package/rp-pppoe/Config.in                    |   2 +-
 package/rpi-userland/Config.in                |   2 +-
 package/sunxi-mali-utgard/Config.in           |   2 +
 package/uclibc/uclibc.mk                      |   1 +
 support/misc/gitlab-ci.yml.in                 |   8 +
 support/scripts/generate-gitlab-ci-yml        |   4 +-
 system/Config.in                              |   3 +-
 .../toolchain-buildroot.mk                    |   3 +
 toolchain/toolchain/toolchain.mk              |   3 +
 utils/check-symbols                           |  78 ++++
 utils/checkpackagelib/lib_config.py           |  38 ++
 utils/checkpackagelib/lib_mk.py               |  18 +
 utils/checkpackagelib/test_lib_config.py      |  78 ++++
 utils/checkpackagelib/test_lib_mk.py          |  48 ++
 utils/checksymbolslib/__init__.py             |   0
 utils/checksymbolslib/br.py                   | 140 ++++++
 utils/checksymbolslib/db.py                   | 205 ++++++++
 utils/checksymbolslib/file.py                 |  83 ++++
 utils/checksymbolslib/kconfig.py              | 139 ++++++
 utils/checksymbolslib/makefile.py             | 100 ++++
 utils/checksymbolslib/test_db.py              | 286 ++++++++++++
 utils/checksymbolslib/test_file.py            | 152 ++++++
 utils/checksymbolslib/test_kconfig.py         | 438 ++++++++++++++++++
 utils/checksymbolslib/test_makefile.py        | 304 ++++++++++++
 utils/checksymbolslib/test_util.py            |  15 +
 42 files changed, 2242 insertions(+), 65 deletions(-)
 create mode 100755 utils/check-symbols
 create mode 100644 utils/checksymbolslib/__init__.py
 create mode 100644 utils/checksymbolslib/br.py
 create mode 100644 utils/checksymbolslib/db.py
 create mode 100644 utils/checksymbolslib/file.py
 create mode 100644 utils/checksymbolslib/kconfig.py
 create mode 100644 utils/checksymbolslib/makefile.py
 create mode 100644 utils/checksymbolslib/test_db.py
 create mode 100644 utils/checksymbolslib/test_file.py
 create mode 100644 utils/checksymbolslib/test_kconfig.py
 create mode 100644 utils/checksymbolslib/test_makefile.py
 create mode 100644 utils/checksymbolslib/test_util.py

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
