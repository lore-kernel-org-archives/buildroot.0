Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF69C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E37400DD;
	Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E37400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctMRaVNuzW3Z; Thu, 26 Oct 2023 09:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F75941712;
	Thu, 26 Oct 2023 09:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F75941712
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D04C71BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABCB66124C
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCB66124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZg8l06xQyzN for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:06 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49A7A61261
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A7A61261
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso107222466b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312423; x=1698917223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6evyJNZybTofUTmhUz/N9KFK+OTBPzAQuy32ltJXWD4=;
 b=W5nKW5Hp7q1FVE6u0oFujFQJcWDTURhi1oVtxkvZRa5gMg5GCCH/KuH+d5nI9+LxQD
 Sb1UCMb9Sm3lky4jm8rj5JJvVvZSGXQlzwwIeZvhNNobHxWW9sGOaep7XrAsbSrxQZwB
 AmJ8c+xlcz/bdA3nChwMy962vJnf7zFqWg+YB0wkXRrn7ziztOZ5YndFFqogz+2UDKfO
 lwIlwt5YMbo52dUAdSaLKBzCOc6H3DL3iACQMf6ayITBq9fRCgAbVZT5h+T3giuGFdXY
 6j6iTqOBNPVZajg2Ia6ApBThrpUiMY+WCRkLvFU7bo0Ne5NmGbX6ZOd6ImssUl/g/zFn
 OUww==
X-Gm-Message-State: AOJu0YwN6hx0bH/UuhJSuSgYMa7umjDaBv90G4d5B82gsmn4QKOdy+0X
 vg1SdDr7F4oSmzK11XCJNaF1MBO/GmLKXpZIUVv9DUdr4OZSa68V
X-Google-Smtp-Source: AGHT+IFEUZUoGO5IYaOwfp/BvmB4KBirvjiepvGSVpyQZk2qNsiiTGDSfEAbmctubuQZp52ypCUR8Q==
X-Received: by 2002:a17:906:9c83:b0:9a1:bd33:4389 with SMTP id
 fj3-20020a1709069c8300b009a1bd334389mr13135524ejc.74.1698312423443; 
 Thu, 26 Oct 2023 02:27:03 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:03 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:31 +0200
Message-ID: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312423; x=1698917223;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6evyJNZybTofUTmhUz/N9KFK+OTBPzAQuy32ltJXWD4=;
 b=S7mikiBzELlYFkAVt84TTTKELgTlpkG7swaiJCGpUnqiBMkSuZBtJr9Ncycetw5Z3b
 MWeADwDqPRwVuciyyksCwJ1K6140chSJNIitmu9IS0B8sGH6XrovbcAMHQqRSaDTZhYC
 PdUzqI3BV+YfTsqreX9Z020rpo+4HRoZoz7aA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=S7mikiBz
Subject: [Buildroot] [PATCH 00/30] package/python3: bump version to 3.12.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Major changes:

Drop the following packages:
  python-pygame
  python-pyxb
  python-crossbar

Remove distutils as an option

I tested every single python package test in buildroot currently
available and every single one passes on Debian 11 and FC38/39.

Adam Duskett (16):
  package/scons: bump version to 4.5.2
  package/python-wsaccel: bump version to 0.6.6
  package/python-systemd: bump version to 235
  package/python-iptables: bump version to 1.0.1
  package/libftdi: add patch to move from distutils to sysconfig
  package/python-constantly: update versioneer to 0.29
  package/python-magic-wormhole: update versioneer to 0.29
  package/python-magic-wormhole-mailbox-server: update versioneer to
    0.29
  package/python-magic-wormhole-transit-relay: update versioneer to 0.29
  package/python-spake2: update versioneer to 0.29
  package/python-iptables: use sysconfig.get_path instead of
    get_python_lib
  package/python-pathtools: add 0001-replace-imp.patch
  package/python-pyxb: Drop package
  package/python-pygame: drop package
  package/python-crossbar: drop package
  package/python3: bump version to 3.12.0

Bernd Kuhls (14):
  package/python3: use upstream build system to disable berkeleydb
    module
  package/python3: use upstream build system to disable uuid module
  package/python3: use upstream build system to disable bzip2/zlib/xz
    modules
  package/python3: use upstream build system to disable curses/readline
    modules
  package/python3: use upstream build system to disable ssl module
  package/python3: use upstream build system to disable ossaudiodev
    module
  package/python3: use upstream build system to disable unicodedata
    module
  package/python3: use upstream build system to disable nis module
  package/python3: use upstream build system to disable decimal module
  package/python3: use upstream build system to disable CJK codecs
  package/python3: use upstream build system to disable pyexpat module
  package/python3: use upstream build system to disable sqlite3 module
  package/python3: update patch and partly use upstream build system to
    disable tk module
  package/python3: Remove infrastructure to disable the build of certain
    extensions

 .checkpackageignore                           |   14 -
 Config.in.legacy                              |   30 +
 package/Config.in                             |    3 -
 ...003-move-from-distutils-to-sysconfig.patch |   32 +
 package/pkg-python.mk                         |   44 +-
 .../0001-Update-versioneer-to-0.29.patch      | 2619 +++++++++++++++++
 .../0001-Avoid-intentional-syntax-error.patch |   29 -
 ...s-min.txt-drop-indirect-dependencies.patch |   74 -
 ...ice-wap-use-markupsafe-instead-of-we.patch |   53 -
 package/python-crossbar/Config.in             |   71 -
 package/python-crossbar/python-crossbar.hash  |    5 -
 package/python-crossbar/python-crossbar.mk    |   14 -
 ...g-get_path-instead-of-get_python_lib.patch |   40 +
 package/python-iptables/python-iptables.hash  |    4 +-
 package/python-iptables/python-iptables.mk    |    4 +-
 .../0002-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
 .../0001-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
 .../0001-Update-versioneer-to-0.29.patch      | 2185 ++++++++++++++
 .../python-pathtools/0001-replace-imp.patch   |   55 +
 package/python-pygame/Config.in               |   50 -
 package/python-pygame/python-pygame.hash      |    3 -
 package/python-pygame/python-pygame.mk        |  111 -
 package/python-pyxb/Config.in                 |    8 -
 package/python-pyxb/python-pyxb.hash          |    4 -
 package/python-pyxb/python-pyxb.mk            |   14 -
 .../0001-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
 package/python-systemd/python-systemd.hash    |    4 +-
 package/python-systemd/python-systemd.mk      |    6 +-
 package/python-wsaccel/python-wsaccel.hash    |    4 +-
 package/python-wsaccel/python-wsaccel.mk      |    4 +-
 ...e-the-build-of-pyc-files-conditional.patch |   24 +-
 ...taddrinfo-configure-test-when-cross-.patch |    2 +-
 ...re-to-disable-the-build-of-certain-e.patch |  108 -
 ...-header-paths-for-cross-compilation.patch} |   31 +-
 ...tch => 0004-Serial-ioctl-workaround.patch} |    0
 ...ook-in-usr-lib-termcap-for-libraries.patch |   31 -
 ...g.sh.in-ensure-sed-invocations-only.patch} |    0
 ...0006-Add-an-option-to-disable-pydoc.patch} |   50 +-
 .../0006-Don-t-add-multiarch-paths.patch      |   37 -
 .../0007-Abort-on-failed-module-build.patch   |   30 -
 ...07-Add-an-option-to-disable-lib2to3.patch} |   74 +-
 ... 0008-Add-an-option-to-disable-IDLE.patch} |   43 +-
 ...e-shebang-of-Python-scripts-for-cros.patch |   35 -
 ...hon-config.sh-don-t-reassign-prefix.patch} |    0
 ...d-an-option-to-disable-the-tk-module.patch |   79 +
 ...fix-building-on-older-distributions.patch} |   12 +-
 ...p-CC-print-multiarch-output-for-mus.patch} |    2 +-
 ...option-to-disable-the-sqlite3-module.patch |   62 -
 ...ng-doesn-t-set-errno-when-encryptio.patch} |    0
 ...d-an-option-to-disable-the-tk-module.patch |   77 -
 ...-option-to-disable-the-curses-module.patch |   61 -
 .../0016-Add-an-option-to-disable-expat.patch |   82 -
 ...-Add-an-option-to-disable-CJK-codecs.patch |   30 -
 .../0018-Add-an-option-to-disable-NIS.patch   |   33 -
 ...Add-an-option-to-disable-unicodedata.patch |   30 -
 ...021-Add-an-option-to-disable-decimal.patch |   54 -
 ...on-to-disable-the-ossaudiodev-module.patch |   30 -
 ...an-option-to-disable-openssl-support.patch |   30 -
 ...ption-to-disable-the-readline-module.patch |   30 -
 ...to-disable-zlib-bzip2-and-xz-modules.patch |   42 -
 ...Add-an-option-to-disable-uuid-module.patch |   33 -
 ...ion-to-disable-the-berkeleydb-module.patch |   30 -
 package/python3/python3.hash                  |    6 +-
 package/python3/python3.mk                    |   81 +-
 package/scons/scons.hash                      |    4 +-
 package/scons/scons.mk                        |    7 +-
 .../tests/package/sample_python_crossbar.py   |    4 -
 .../tests/package/test_python_crossbar.py     |   23 -
 68 files changed, 11778 insertions(+), 1595 deletions(-)
 create mode 100644 package/libftdi/0003-move-from-distutils-to-sysconfig.patch
 create mode 100644 package/python-constantly/0001-Update-versioneer-to-0.29.patch
 delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
 delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
 delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
 delete mode 100644 package/python-crossbar/Config.in
 delete mode 100644 package/python-crossbar/python-crossbar.hash
 delete mode 100644 package/python-crossbar/python-crossbar.mk
 create mode 100644 package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
 create mode 100644 package/python-magic-wormhole-mailbox-server/0002-Update-versioneer-to-0.29.patch
 create mode 100644 package/python-magic-wormhole-transit-relay/0001-Update-versioneer-to-0.29.patch
 create mode 100644 package/python-magic-wormhole/0001-Update-versioneer-to-0.29.patch
 create mode 100644 package/python-pathtools/0001-replace-imp.patch
 delete mode 100644 package/python-pygame/Config.in
 delete mode 100644 package/python-pygame/python-pygame.hash
 delete mode 100644 package/python-pygame/python-pygame.mk
 delete mode 100644 package/python-pyxb/Config.in
 delete mode 100644 package/python-pyxb/python-pyxb.hash
 delete mode 100644 package/python-pyxb/python-pyxb.mk
 create mode 100644 package/python-spake2/0001-Update-versioneer-to-0.29.patch
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (64%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0004-Serial-ioctl-workaround.patch} (100%)
 delete mode 100644 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0006-Add-an-option-to-disable-pydoc.patch} (54%)
 delete mode 100644 package/python3/0006-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python3/0007-Abort-on-failed-module-build.patch
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0007-Add-an-option-to-disable-lib2to3.patch} (59%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0008-Add-an-option-to-disable-IDLE.patch} (57%)
 delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0009-python-config.sh-don-t-reassign-prefix.patch} (100%)
 create mode 100644 package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0011-fix-building-on-older-distributions.patch} (82%)
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (97%)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch
 delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
 delete mode 100644 support/testing/tests/package/sample_python_crossbar.py
 delete mode 100644 support/testing/tests/package/test_python_crossbar.py

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
