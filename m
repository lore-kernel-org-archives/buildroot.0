Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01969C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553D260C12;
	Sun, 14 Aug 2022 23:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553D260C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4apSQ_xYjC19; Sun, 14 Aug 2022 23:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 623A060C0A;
	Sun, 14 Aug 2022 23:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623A060C0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 166811BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAF9408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFAF9408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wlYC2qEyxfp for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7979140298
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7979140298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:17 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id b4so2333743uaw.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=yrrw6AjQ/3+AKT1SjFBb/CMSmdUUg8rROM8BQahygd0=;
 b=R+BmjDUPz5qp4Dg7gL9Jbg1Kjir1DwiC6ZEAyc1qoIexFnuB5wAqf/+7gSO+slYO8n
 +IhvZLWMgxHoT5Ei+KHGOYbejCcLJvo2/O1Ghmyoy0eUD4hxhiT8KRnyutfZjvnw++rk
 0BPZhmRlJjXnrCfbRa7yCOGPa7NumES+znKfo5dcisMlgEYQOQo0FbLBzJD+DxL/FuJJ
 0TwKAV3cESUs8+GA4Dy2CnFnLFw4DcUGAhd6Zx3QOZJ3D4YewljeNLRMtBHwAfRFavND
 m9RFv81pq7+HDKay83o6vxxPEoHLRQ/drctwjQpRcOkz2VfXbnWv6hWeAR7AsRh2rfCK
 bkpg==
X-Gm-Message-State: ACgBeo2Mopc/psTC9BrE5L9a0Zvd/ZKSkvle+7ZWbP7zsYZ+26NsDjij
 v23I9mxX8vfAvA4ujJX/g3p/cGIi4Cc=
X-Google-Smtp-Source: AA6agR6shW+Wb3hOLGR5FXQEhfy91zbjz99lds0fBXF02CGAYjFaT0sfHMRJk6iEHe/G+Whkqn9SVA==
X-Received: by 2002:ab0:32d8:0:b0:384:cced:87fb with SMTP id
 f24-20020ab032d8000000b00384cced87fbmr5176676uao.52.1660520356178; 
 Sun, 14 Aug 2022 16:39:16 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:14 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:12 -0300
Message-Id: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=yrrw6AjQ/3+AKT1SjFBb/CMSmdUUg8rROM8BQahygd0=;
 b=a9prwk9Iy8IyXHrc4Hfe8qj9XKWUIv03tidJSClLmIZHTemWmO2t4zOZsKMAccMJOh
 VkBa1dqPguuaMgxjZIeEuC3tUxQwXS/2zltElxvjbFs9mIeLXlfuwYT58WTvWTxvP096
 h6CCUhRXOFaARhWu1nFlQhO458NT6DpWPBFwGfJDyPoUGgicxucsl6iuA1aRYTMsy8Cu
 7ND5KhT00syZ1Lh9q+yu7APcU2iwB8TxeXCt8LoV36XOfFexweCfQjO9CsGMZFtA69wd
 DJcWxrUMNzWVz++jw2AEgonHgvPI6TqRERTmxKketFhbGZmWXfAJ3qR4RAVdLqgQXwlT
 wEWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a9prwk9I
Subject: [Buildroot] [PATCH 00/33] fix typos
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NOTICE: these patches were not build-tested!

Ricardo Martincoski (33):
1) typos on help and internal variables, found by code inspection:
  package/tclap: fix typo on help
  package/ti-gfx: fix typo on help
  package/gcnano-binaries: fix typo on help
  package/ace: fix typo on variable names
2) for consistency:
  package/c-capnproto: use space after depends on
  package/kvm-unit-tests: do not use "select...if SYMBOL=y"
  Config.in.legacy: add missing select
3) typos on symbols used by packages:
  package/libvncserver: fix typo on BR2_nios2
  package/libgpg-error: fix typo for BR2_aarch64_be
  package/freeswitch: fix typo on BR2_powerpc64le
  package/uclibc: drop old SPARC symbols
  package/tcf-agent: drop bogus BR2_powerpcle
  package/qemu: fix typo on STAGING_DIR
  package/tesseract-ocr: fix typo on BR2_PACKAGE_TESSERACT_OCR_LANG_GER
  package/wolftpm: fix typo on BR2_PACKAGE_WOLFTPM_NUVOTON
  package/kodi: fix typo on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
  package/sconeserver: fix typo on BR2_STATIC_LIBS
  package/libglvnd: fix typo on BR2_PACKAGE_XORGPROTO
  boot/optee-os: fix typo on BR2_TARGET_OPTEE_OS_LATEST
  package/busybox: fix typo on BR2_PACKAGE_NETCAT_OPENBSD
  package/jquery-ui-themes: fix typo on
    BR2_PACKAGE_JQUERY_UI_THEMES_VADER
  package/gstreamer1/gst1-plugins-bad: fix typo on
    BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
  package/pcsc-lite: fix typo on BR2_PACKAGE_PCSC_LITE_*
4) bogus symbols referenced by packages
  package/zeek: drop bogus PYTHON3_HASHLIB
  package/cups: drop bogus libpaper dependency
  package/ranger: drop bogus BR2_PACKAGE_PYTHON_PYC_ONLY
  package/openocd: drop bogus BR2_PACKAGE_OPENOCD_ZY1000*
  package/directfb: drop bogus BR2_PACKAGE_DIRECTFB_CYBER5K
  package/x11r7/xserver_xorg-server: drop bogus
    BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
  package/gstreamer1/gst1-plugins-good: drop bogus
    BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
  package/libsepol: drop bogus BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
  package/python-pygame: drop bogus
    BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
5) the WIP script that found (2), (3) and (4)
  utils/check-symbols: new script

 Config.in.legacy                              |   1 +
 boot/optee-os/optee-os.mk                     |   2 +-
 package/ace/ace.mk                            |  14 +-
 package/busybox/busybox.mk                    |   2 +-
 package/c-capnproto/Config.in                 |   2 +-
 package/cups/cups.mk                          |   8 +-
 package/directfb/directfb.mk                  |   1 -
 package/freeswitch/freeswitch.mk              |   2 +-
 package/gcnano-binaries/Config.in             |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in |   4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |   4 -
 package/jquery-ui-themes/Config.in            |   2 +-
 package/kodi/Config.in                        |   2 +-
 package/kvm-unit-tests/Config.in              |   2 +-
 package/libglvnd/Config.in                    |   2 +-
 package/libgpg-error/Config.in                |   4 +-
 package/libsepol/Config.in                    |   1 -
 package/libvncserver/Config.in                |   2 +-
 package/openocd/openocd.mk                    |   2 -
 package/pcsc-lite/pcsc-lite.mk                |   4 +-
 package/python-pygame/Config.in               |   6 -
 package/qemu/qemu.mk                          |   2 +-
 package/ranger/ranger.mk                      |   2 +-
 package/sconeserver/Config.in                 |   2 +-
 package/tcf-agent/Config.in                   |   2 +-
 package/tclap/Config.in                       |   2 +-
 package/tesseract-ocr/tesseract-ocr.mk        |   2 +-
 package/ti-gfx/Config.in                      |   2 +-
 package/uclibc/Config.in                      |   3 +-
 package/wolftpm/wolftpm.mk                    |   2 +-
 package/x11r7/xserver_xorg-server/Config.in   |   6 +-
 package/zeek/Config.in                        |   1 -
 support/misc/gitlab-ci.yml.in                 |   8 ++
 support/scripts/generate-gitlab-ci-yml        |   2 +-
 utils/check-symbols                           |  50 +++++++
 utils/checksymbolslib/__init__.py             |   0
 utils/checksymbolslib/db.py                   |  63 +++++++++
 utils/checksymbolslib/file.py                 |  75 +++++++++++
 utils/checksymbolslib/kconfig.py              | 126 ++++++++++++++++++
 utils/checksymbolslib/makefile.py             |  47 +++++++
 utils/checksymbolslib/test_db.py              |  34 +++++
 utils/checksymbolslib/test_file.py            |  61 +++++++++
 utils/checksymbolslib/test_kconfig.py         |  46 +++++++
 43 files changed, 548 insertions(+), 59 deletions(-)
 create mode 100755 utils/check-symbols
 create mode 100644 utils/checksymbolslib/__init__.py
 create mode 100644 utils/checksymbolslib/db.py
 create mode 100644 utils/checksymbolslib/file.py
 create mode 100644 utils/checksymbolslib/kconfig.py
 create mode 100644 utils/checksymbolslib/makefile.py
 create mode 100644 utils/checksymbolslib/test_db.py
 create mode 100644 utils/checksymbolslib/test_file.py
 create mode 100644 utils/checksymbolslib/test_kconfig.py

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
