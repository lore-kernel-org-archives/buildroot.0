Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC260C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B0842860;
	Fri, 10 Nov 2023 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B0842860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDxav00MbnNh; Fri, 10 Nov 2023 21:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821C042720;
	Fri, 10 Nov 2023 21:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821C042720
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 617B41BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5E961022
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5E961022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4K87ETJm2-Y for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:12:32 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F35C60B88
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F35C60B88
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so4034497a12.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650750; x=1700255550;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DAX/2X+AfXyMZzv9NHTpsxoJo/g/cZCbJ3AQOZKDcmU=;
 b=PcAbHOfPXxcZdwkWPxW6dzzP57W8ebYk4KIMJfKMjwD+YS5Xw+Q3Oj7Aw9wXBqvd7B
 skmHWlgqAYovR5lkyK0Lg20FjkQjxVFl72jNw0UqJimwzJiSf1uIPSTJlnlEVqKJ4Lwu
 8Jg7eEum/Du12n+rFFt5ox4UTJsd8IlFGOB2nuxonbchTe+JCHZcJwLdsDcdK572WSxd
 G6znkDGIP7+rsSMev1t8fkarzv3k1YokWYI0SzSyOkf3J9wmwnYbT6AV9dcydlVWk9KJ
 Q1b9jALUaVAqw1794uC5WLYXDyJr5O+lnhpkLPc5ke/gVygLHxTkJ5arlxITmNQUJa16
 6T3Q==
X-Gm-Message-State: AOJu0Yz27zGuMV9QOV3/s+sNPLzMpfjC6en2G6paw20LsG/9m3fE8z+R
 vGHhHDvOCWdr91qUIRPYMV9jV5wPX3t9QS+lZ+U=
X-Google-Smtp-Source: AGHT+IG8i3SjpI8os0qY04hIF72dem8AvckeLwHu3Ae1NI+ZEVmnkod0YgwTCWrKGDAyG+Pg8XS11g==
X-Received: by 2002:aa7:d943:0:b0:540:3a46:cdcd with SMTP id
 l3-20020aa7d943000000b005403a46cdcdmr334964eds.29.1699650750169; 
 Fri, 10 Nov 2023 13:12:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a056402174600b00530a9488623sm86419edx.46.2023.11.10.13.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:12:29 -0800 (PST)
Message-ID: <6ba76ec0-39a1-4da0-a863-b7749539d6d9@mind.be>
Date: Fri, 10 Nov 2023 22:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>,
 buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699650750; x=1700255550; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DAX/2X+AfXyMZzv9NHTpsxoJo/g/cZCbJ3AQOZKDcmU=;
 b=Kx4+xK5ovcziH/Xs8QmTVOcMjC9DvoUYvxztZogwQO38cDDRqLXzfHdqV5hx+YH75s
 +jM83m9ci+O+29orSLZXPNipdhprNRTddyMjX74k6hpmVOCbIbd7erjhncdv+d6MlWTk
 4LwXJRLBPgLpDAUhXzmZ2IhWrY/TgWD0Vory9dbf6X0zlMMoR9F5dCGtPSMdBx0udaPh
 H/0/fPvft9oE2fmCAUtE8/FXsbkhxova+/2XO8LqHmjlUvfu33wa4+8rhpBVQLVnh3HP
 WEL23tfqrxedO4RYl5ux680s+2cLDYdgY68glttGOPcYUqzWHTGL3ACdlHxC/aMZuDE1
 kcnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kx4+xK5o
Subject: Re: [Buildroot] [PATCH v3 0/7] Python3: bump version to 3.12.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/11/2023 16:58, Adam Duskett wrote:
> Hopefully the last series to commit!
> 
> Changes:
> 
>    - Drop python-pygame with a new message about compilation failures.
>    - Squash Bernd's patch series into the python 3.12.0 version bump patch
>    - Add "package" at the end of the Config.in.legacy python-crossbar help
>    - Add a Config.in.legacy option for python-pygame
> 
> Adam Duskett (7):
>    package/python-systemd: bump version to 235
>    package/python-versioneer: new package
>    package/python-constantly: bump version to 23.10.4

  Applied these three to master.

  James, I know you submitted similar patches, but v1 of this series came 
earlier so I chose Adam's.

>    package/python-pygame: drop package
>    package/python-crossbar: drop package

  I left these two for the time being to give people a little bit of time to 
provide actual fixes.

>    package/scons: bump version to 4.5.2

  I applied this one as well.

  Regards,
  Arnout

>    package/python3: bump version to 3.12.0
> 
>   Config.in.legacy                              |  23 ++++
>   DEVELOPERS                                    |   3 +-
>   package/Config.in                             |   2 -
>   .../python-constantly/python-constantly.hash  |   4 +-
>   .../python-constantly/python-constantly.mk    |   5 +-
>   .../0001-Avoid-intentional-syntax-error.patch |  29 -----
>   ...s-min.txt-drop-indirect-dependencies.patch |  74 ------------
>   ...ice-wap-use-markupsafe-instead-of-we.patch |  53 ---------
>   package/python-crossbar/Config.in             |  71 -----------
>   package/python-crossbar/python-crossbar.hash  |   5 -
>   package/python-crossbar/python-crossbar.mk    |  14 ---
>   package/python-pygame/Config.in               |  50 --------
>   package/python-pygame/python-pygame.hash      |   3 -
>   package/python-pygame/python-pygame.mk        | 111 ------------------
>   package/python-systemd/python-systemd.hash    |   4 +-
>   package/python-systemd/python-systemd.mk      |   6 +-
>   .../python-versioneer/python-versioneer.hash  |   5 +
>   .../python-versioneer/python-versioneer.mk    |  14 +++
>   ...e-the-build-of-pyc-files-conditional.patch |  24 ++--
>   ...taddrinfo-configure-test-when-cross-.patch |   2 +-
>   ...re-to-disable-the-build-of-certain-e.patch | 108 -----------------
>   ...-header-paths-for-cross-compilation.patch} |  31 ++---
>   ...tch => 0004-Serial-ioctl-workaround.patch} |   0
>   ...ook-in-usr-lib-termcap-for-libraries.patch |  31 -----
>   ...g.sh.in-ensure-sed-invocations-only.patch} |   0
>   ...0006-Add-an-option-to-disable-pydoc.patch} |  50 ++------
>   .../0006-Don-t-add-multiarch-paths.patch      |  37 ------
>   .../0007-Abort-on-failed-module-build.patch   |  30 -----
>   ...07-Add-an-option-to-disable-lib2to3.patch} |  74 +++++-------
>   ... 0008-Add-an-option-to-disable-IDLE.patch} |  43 ++-----
>   ...e-shebang-of-Python-scripts-for-cros.patch |  35 ------
>   ...hon-config.sh-don-t-reassign-prefix.patch} |   0
>   ...d-an-option-to-disable-the-tk-module.patch |  79 +++++++++++++
>   ...fix-building-on-older-distributions.patch} |  12 +-
>   ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
>   ...option-to-disable-the-sqlite3-module.patch |  62 ----------
>   ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
>   ...d-an-option-to-disable-the-tk-module.patch |  77 ------------
>   ...-option-to-disable-the-curses-module.patch |  61 ----------
>   .../0016-Add-an-option-to-disable-expat.patch |  82 -------------
>   ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -----
>   .../0018-Add-an-option-to-disable-NIS.patch   |  33 ------
>   ...Add-an-option-to-disable-unicodedata.patch |  30 -----
>   ...021-Add-an-option-to-disable-decimal.patch |  54 ---------
>   ...on-to-disable-the-ossaudiodev-module.patch |  30 -----
>   ...an-option-to-disable-openssl-support.patch |  30 -----
>   ...ption-to-disable-the-readline-module.patch |  30 -----
>   ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -------
>   ...Add-an-option-to-disable-uuid-module.patch |  33 ------
>   ...ion-to-disable-the-berkeleydb-module.patch |  30 -----
>   package/python3/python3.hash                  |   6 +-
>   package/python3/python3.mk                    |  81 ++++++++-----
>   package/scons/scons.hash                      |   4 +-
>   package/scons/scons.mk                        |   9 +-
>   54 files changed, 274 insertions(+), 1484 deletions(-)
>   delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
>   delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
>   delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
>   delete mode 100644 package/python-crossbar/Config.in
>   delete mode 100644 package/python-crossbar/python-crossbar.hash
>   delete mode 100644 package/python-crossbar/python-crossbar.mk
>   delete mode 100644 package/python-pygame/Config.in
>   delete mode 100644 package/python-pygame/python-pygame.hash
>   delete mode 100644 package/python-pygame/python-pygame.mk
>   create mode 100644 package/python-versioneer/python-versioneer.hash
>   create mode 100644 package/python-versioneer/python-versioneer.mk
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
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
