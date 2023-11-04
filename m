Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 429C94014B;
	Sat,  4 Nov 2023 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429C94014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mF5VM190C9XE; Sat,  4 Nov 2023 17:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90BA94014D;
	Sat,  4 Nov 2023 17:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BA94014D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01C191BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC614014D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC614014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKH6c6c4z0zI for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:41:37 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD8EB4014B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8EB4014B
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99de884ad25so481038766b.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699119695; x=1699724495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jwAoyY1gFVWn/MkvPzZyC5gRvxnFlBfxf5JIMVfE+zM=;
 b=C/pQYtnVTe1Z8EpTdjUcDxP3MivegElU6NG5nQ2v+jI4TrD93fzHcTTvsd+hqH2lK+
 9+iIpEdMJfCU24X7vqc5a6ZQGTvkKIeMbl20Iorv/Ifi+NMn/KMh0sB2Xa8FHgG4/Dcz
 QBOkiBJK0i3TexVzIJVzK/Ap8h5QKN9LS/XFtH8NkO8uBVuFwHUFzw+t3OFb57yq1Q36
 K2L8gMRAHKLLxbq8/NOsmMG56D/X5uElQR9AKLnsJeze8ILtsygmt7hVPjrZHMODovm0
 DlKcRMYybCG3eYpPOG2FAd2zDAMy1IbiGBxvVL0Tu6SfCOX8xsbiiaUheW06v9TwXe+z
 SJUA==
X-Gm-Message-State: AOJu0YxhfBW+R0rHR8pI9EEX/am9aYOqgBkwPlVI9Gx7IIhjB4hIX5qH
 N2B1SZlZjAwFTapnpppEnzYcsA==
X-Google-Smtp-Source: AGHT+IEDO/eIctFPX46LnKniQbAUNP+xDf9QnsbMGU4eHBrKR5xsWlqByavFnLjPk9tXUY224FQXDw==
X-Received: by 2002:a17:907:7255:b0:9c3:8242:e665 with SMTP id
 ds21-20020a170907725500b009c38242e665mr9785124ejc.8.1699119694830; 
 Sat, 04 Nov 2023 10:41:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 mr31-20020a170907829f00b009dda52b1147sm1387277ejc.126.2023.11.04.10.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:41:34 -0700 (PDT)
Message-ID: <ffcd63d1-adcd-4031-8950-d4e29ba97bef@mind.be>
Date: Sat, 4 Nov 2023 18:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699119695; x=1699724495; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwAoyY1gFVWn/MkvPzZyC5gRvxnFlBfxf5JIMVfE+zM=;
 b=e5Q9z64ti3BgDFvzt9vjvKMUfjtmO8DEPcFyuxvQvnCMvxcBjD2xB6aSFHmPGdjOPu
 d61DCHiTb7rlAsNotIwVIDKtePA6/ZaDkRE1cgzAZA3nreTnLXKas6yL3gXm07SZfZSj
 asLUeCVP63l39ve5AZbj4ZO1IEvVm+5oXJd0K+980gIDmOIPwSw93milmnale1r0HlaS
 py5NoFT3siBe/KQaNVLTXu47ma9rTD+BJXAIT7D1WDGbHcqU26IzhXRLQIO0pIBGuZf+
 b/AMZip1Vxxncq8u1jowrGpy5xYdvTR1inKLdV9Ra3yu7ONY3MsROT6zm8x4FlWxC1XV
 CqsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e5Q9z64t
Subject: Re: [Buildroot] [PATCH 00/30] package/python3: bump version to
 3.12.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

On 26/10/2023 11:26, Adam Duskett wrote:
> Major changes:
> 
> Drop the following packages:
>    python-pygame
>    python-pyxb
>    python-crossbar
> 
> Remove distutils as an option
> 
> I tested every single python package test in buildroot currently
> available and every single one passes on Debian 11 and FC38/39.
> 
> Adam Duskett (16):
>    package/scons: bump version to 4.5.2
>    package/python-wsaccel: bump version to 0.6.6
>    package/python-systemd: bump version to 235
>    package/python-iptables: bump version to 1.0.1
>    package/libftdi: add patch to move from distutils to sysconfig
>    package/python-constantly: update versioneer to 0.29
>    package/python-magic-wormhole: update versioneer to 0.29
>    package/python-magic-wormhole-mailbox-server: update versioneer to
>      0.29
>    package/python-magic-wormhole-transit-relay: update versioneer to 0.29
>    package/python-spake2: update versioneer to 0.29
>    package/python-iptables: use sysconfig.get_path instead of
>      get_python_lib
>    package/python-pathtools: add 0001-replace-imp.patch

  I will try to apply these patches.

>    package/python-pyxb: Drop package
>    package/python-pygame: drop package
>    package/python-crossbar: drop package
>    package/python3: bump version to 3.12.0

  It was suggested to wait for 3.12.1, so let's do that.

> 
> Bernd Kuhls (14):
>    package/python3: use upstream build system to disable berkeleydb
>      module
>    package/python3: use upstream build system to disable uuid module
>    package/python3: use upstream build system to disable bzip2/zlib/xz
>      modules
>    package/python3: use upstream build system to disable curses/readline
>      modules
>    package/python3: use upstream build system to disable ssl module
>    package/python3: use upstream build system to disable ossaudiodev
>      module
>    package/python3: use upstream build system to disable unicodedata
>      module
>    package/python3: use upstream build system to disable nis module
>    package/python3: use upstream build system to disable decimal module
>    package/python3: use upstream build system to disable CJK codecs
>    package/python3: use upstream build system to disable pyexpat module
>    package/python3: use upstream build system to disable sqlite3 module

  I think all of these can be squashed into the patch that does the bump itself, 
no? That would make review quite a bit easier I think, and it also makes more 
sense IMHO (since we don't want to backport those patches to stable branches 
anyway, and if we revert the bump we also want to revert the "use upstream build 
system" bits).


  Regards,
  Arnout

>    package/python3: update patch and partly use upstream build system to
>      disable tk module
>    package/python3: Remove infrastructure to disable the build of certain
>      extensions
> 
>   .checkpackageignore                           |   14 -
>   Config.in.legacy                              |   30 +
>   package/Config.in                             |    3 -
>   ...003-move-from-distutils-to-sysconfig.patch |   32 +
>   package/pkg-python.mk                         |   44 +-
>   .../0001-Update-versioneer-to-0.29.patch      | 2619 +++++++++++++++++
>   .../0001-Avoid-intentional-syntax-error.patch |   29 -
>   ...s-min.txt-drop-indirect-dependencies.patch |   74 -
>   ...ice-wap-use-markupsafe-instead-of-we.patch |   53 -
>   package/python-crossbar/Config.in             |   71 -
>   package/python-crossbar/python-crossbar.hash  |    5 -
>   package/python-crossbar/python-crossbar.mk    |   14 -
>   ...g-get_path-instead-of-get_python_lib.patch |   40 +
>   package/python-iptables/python-iptables.hash  |    4 +-
>   package/python-iptables/python-iptables.mk    |    4 +-
>   .../0002-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
>   .../0001-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
>   .../0001-Update-versioneer-to-0.29.patch      | 2185 ++++++++++++++
>   .../python-pathtools/0001-replace-imp.patch   |   55 +
>   package/python-pygame/Config.in               |   50 -
>   package/python-pygame/python-pygame.hash      |    3 -
>   package/python-pygame/python-pygame.mk        |  111 -
>   package/python-pyxb/Config.in                 |    8 -
>   package/python-pyxb/python-pyxb.hash          |    4 -
>   package/python-pyxb/python-pyxb.mk            |   14 -
>   .../0001-Update-versioneer-to-0.29.patch      | 2194 ++++++++++++++
>   package/python-systemd/python-systemd.hash    |    4 +-
>   package/python-systemd/python-systemd.mk      |    6 +-
>   package/python-wsaccel/python-wsaccel.hash    |    4 +-
>   package/python-wsaccel/python-wsaccel.mk      |    4 +-
>   ...e-the-build-of-pyc-files-conditional.patch |   24 +-
>   ...taddrinfo-configure-test-when-cross-.patch |    2 +-
>   ...re-to-disable-the-build-of-certain-e.patch |  108 -
>   ...-header-paths-for-cross-compilation.patch} |   31 +-
>   ...tch => 0004-Serial-ioctl-workaround.patch} |    0
>   ...ook-in-usr-lib-termcap-for-libraries.patch |   31 -
>   ...g.sh.in-ensure-sed-invocations-only.patch} |    0
>   ...0006-Add-an-option-to-disable-pydoc.patch} |   50 +-
>   .../0006-Don-t-add-multiarch-paths.patch      |   37 -
>   .../0007-Abort-on-failed-module-build.patch   |   30 -
>   ...07-Add-an-option-to-disable-lib2to3.patch} |   74 +-
>   ... 0008-Add-an-option-to-disable-IDLE.patch} |   43 +-
>   ...e-shebang-of-Python-scripts-for-cros.patch |   35 -
>   ...hon-config.sh-don-t-reassign-prefix.patch} |    0
>   ...d-an-option-to-disable-the-tk-module.patch |   79 +
>   ...fix-building-on-older-distributions.patch} |   12 +-
>   ...p-CC-print-multiarch-output-for-mus.patch} |    2 +-
>   ...option-to-disable-the-sqlite3-module.patch |   62 -
>   ...ng-doesn-t-set-errno-when-encryptio.patch} |    0
>   ...d-an-option-to-disable-the-tk-module.patch |   77 -
>   ...-option-to-disable-the-curses-module.patch |   61 -
>   .../0016-Add-an-option-to-disable-expat.patch |   82 -
>   ...-Add-an-option-to-disable-CJK-codecs.patch |   30 -
>   .../0018-Add-an-option-to-disable-NIS.patch   |   33 -
>   ...Add-an-option-to-disable-unicodedata.patch |   30 -
>   ...021-Add-an-option-to-disable-decimal.patch |   54 -
>   ...on-to-disable-the-ossaudiodev-module.patch |   30 -
>   ...an-option-to-disable-openssl-support.patch |   30 -
>   ...ption-to-disable-the-readline-module.patch |   30 -
>   ...to-disable-zlib-bzip2-and-xz-modules.patch |   42 -
>   ...Add-an-option-to-disable-uuid-module.patch |   33 -
>   ...ion-to-disable-the-berkeleydb-module.patch |   30 -
>   package/python3/python3.hash                  |    6 +-
>   package/python3/python3.mk                    |   81 +-
>   package/scons/scons.hash                      |    4 +-
>   package/scons/scons.mk                        |    7 +-
>   .../tests/package/sample_python_crossbar.py   |    4 -
>   .../tests/package/test_python_crossbar.py     |   23 -
>   68 files changed, 11778 insertions(+), 1595 deletions(-)
>   create mode 100644 package/libftdi/0003-move-from-distutils-to-sysconfig.patch
>   create mode 100644 package/python-constantly/0001-Update-versioneer-to-0.29.patch
>   delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
>   delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
>   delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
>   delete mode 100644 package/python-crossbar/Config.in
>   delete mode 100644 package/python-crossbar/python-crossbar.hash
>   delete mode 100644 package/python-crossbar/python-crossbar.mk
>   create mode 100644 package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
>   create mode 100644 package/python-magic-wormhole-mailbox-server/0002-Update-versioneer-to-0.29.patch
>   create mode 100644 package/python-magic-wormhole-transit-relay/0001-Update-versioneer-to-0.29.patch
>   create mode 100644 package/python-magic-wormhole/0001-Update-versioneer-to-0.29.patch
>   create mode 100644 package/python-pathtools/0001-replace-imp.patch
>   delete mode 100644 package/python-pygame/Config.in
>   delete mode 100644 package/python-pygame/python-pygame.hash
>   delete mode 100644 package/python-pygame/python-pygame.mk
>   delete mode 100644 package/python-pyxb/Config.in
>   delete mode 100644 package/python-pyxb/python-pyxb.hash
>   delete mode 100644 package/python-pyxb/python-pyxb.mk
>   create mode 100644 package/python-spake2/0001-Update-versioneer-to-0.29.patch
>   delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
>   rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (64%)
>   rename package/python3/{0008-Serial-ioctl-workaround.patch => 0004-Serial-ioctl-workaround.patch} (100%)
>   delete mode 100644 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
>   rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
>   rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0006-Add-an-option-to-disable-pydoc.patch} (54%)
>   delete mode 100644 package/python3/0006-Don-t-add-multiarch-paths.patch
>   delete mode 100644 package/python3/0007-Abort-on-failed-module-build.patch
>   rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0007-Add-an-option-to-disable-lib2to3.patch} (59%)
>   rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0008-Add-an-option-to-disable-IDLE.patch} (57%)
>   delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
>   rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0009-python-config.sh-don-t-reassign-prefix.patch} (100%)
>   create mode 100644 package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
>   rename package/python3/{0028-fix-building-on-older-distributions.patch => 0011-fix-building-on-older-distributions.patch} (82%)
>   rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (97%)
>   delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
>   rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
>   delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
>   delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
>   delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
>   delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
>   delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
>   delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
>   delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch
>   delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
>   delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch
>   delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
>   delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
>   delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch
>   delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
>   delete mode 100644 support/testing/tests/package/sample_python_crossbar.py
>   delete mode 100644 support/testing/tests/package/test_python_crossbar.py
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
