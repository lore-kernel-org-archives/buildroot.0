Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1787CC27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA319415EA;
	Fri, 14 Jun 2024 16:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ji_I3glijYPV; Fri, 14 Jun 2024 16:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AAC7415DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AAC7415DD;
	Fri, 14 Jun 2024 16:22:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB7BD1BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D938C415D0
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIVUAjy0o6Lc for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14F6E400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14F6E400C7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14F6E400C7
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4217d808034so22589475e9.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382123; x=1718986923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6WUpHG6WyARdD6EwZfoCmbZwhqCl3p9uQ/wrzs0BIgg=;
 b=KVNloCfeGpvXbBqnRvcF8d6TlQLEWgVxalMzTfBqDBje1PxhdSA8QEgUcVsr8G6bIm
 LXLrUm+1pce9wKjUTIIpOp3ksKWB3+cy6hEA3U7OBIakgrf1fxLbxkcYqQPJeZ0leCwk
 yzHHKP2c53TuMifd5YY4jAAfmk9jLUzHpGM0SYITUXTtpVxZRqqMjygogCAAYnLGtJ2r
 RbfUr54o4YYPngIDuGBUO/tXsC3pwrn748skx604KrqO264Fnev/JKQAUe7NpJqwm8dE
 itZ1gxx06SZNc7+tE+Z7s9r386zHmz/YVSdw8gCBk/wFLAslvcpBmz6uKkIhlHRXIgr0
 UvHw==
X-Gm-Message-State: AOJu0YxbJUavOzWiXmYg8gT6Ygud/gDXbt6eWTMfVtpbrcJoSAenPZh/
 zqeIIr1N9YGhIBsEtLslc1rVv2dK2IhnRaYxk6ODF0p10Gu35UnFGCnLnw==
X-Google-Smtp-Source: AGHT+IHguLIDOs9B1Lb5HpFSEqxGhM4bdaPazXv1GwpsQc7OxgVYQ0wzhjKU5B1vI6vgmkwIepW0pg==
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id
 5b1f17b1804b1-4230482bd1emr26766835e9.20.1718382122240; 
 Fri, 14 Jun 2024 09:22:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f612800csm67133175e9.28.2024.06.14.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:58 +0200
Message-ID: <a9d5308762563ab908c3839d7db0e3c1b1064a6a.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718382114.git.yann.morin.1998@free.fr>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382123; x=1718986923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WUpHG6WyARdD6EwZfoCmbZwhqCl3p9uQ/wrzs0BIgg=;
 b=OKBRq1JO62YGhXEXAV4nUg9mRM1lgw1fcIdBPqM5u3I8cTCWp76J5c92Li1W0tROs5
 1KsCpVxKe1PlNh1M23QxqH894F77SMkPFaXYS5hw7H7OejJ06Lkzcr695JwG4UkDkQNg
 Tgd+cUxgxBUmJe3UhQU6TyhFNXbrgPqRi9w+fu/r207608TlpM5r54gMa8+yZ074ukep
 gmeNoyc2slZ946eYSZf+KXJPD37CSeQlFCjgQ91puV6/e9LC23a4UZe6I90b3scCxv7c
 pma23B0Jc2pubtoV3I8vt+2yXbuC8T/v5hjJkQb5E97q48gXEQ1uKZ4h3DhIdau6PMp/
 +O6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OKBRq1JO
Subject: [Buildroot] [PATCH 6/6] package/python3: bump python to 3.12.4
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Along with the version bump, a number of the patches have been dropped
or reworked.

Compiled shared module builds are now disabled via py_cv_module_* = n/a
when possible (see PY_STDLIB_MOD_SET_NA). Leveraging this method allows
dropping numerous patches.

Note: this method does not work when access to a compiled module is
wrapped by a python-based module such as sqlite, tkinter, etc. In these
cases, configure knobs are still required to disable these modules and
their wrappers.

Both setup.py and distutils are no longer utilized upstream, so patches
have been dropped or adjusted accordingly.

Patch 0007 has been dropped, the Xtensa architecture can avoid compile
errors by using a toolchain with kernel headers newer than 3.17 [0].
That would require a new, non-trivial dependency to be added, but it
would also need to be propagated to all packages that select python3; as
we consider xtensa with old headers to be a corner case, we decide to
not address the issue, and rather add an exclusion in genrandconfig to
avoid the issue in autobuilders.

Patch 0026 has been dropped, the issue is fixed in uClibc v1.0.37+ [1].
Note: uClibc is not generally supported by upstream CPython.

While we're making assumptions about uClibc, ac_cv_func_wcsftime=no is
no longer set as it was fixed in v1.0.0 [2].

Co-developed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Co-developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[See 36e635d2d5c0166476858aa239ccbe78e8f2af14]

Co-developed-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
[See 687b96db4d3518eadd16f74f7defdc05b1cfb736]

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f61bf8e7d19e0a3456a7a9ed97c399e4353698dc
[1]: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/libcrypt/crypt.c?id=2f6076cdaada2132b670b5ef25ad80c76a916c5a
[2]: https://lists.uclibc.org/pipermail/uclibc/2014-November/048723.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[yann.morin.1998@free.fr;
  - extend the commit log for the xtensa headers case
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                           |  33 ++----
 ...e-the-build-of-pyc-files-conditional.patch |  32 +++---
 ...taddrinfo-configure-test-when-cross-.patch |   8 +-
 .../0003-Add-an-option-to-disable-pydoc.patch |  84 ++++++++++++++
 ...re-to-disable-the-build-of-certain-e.patch | 108 ------------------
 ...04-Add-an-option-to-disable-lib2to3.patch} |  93 +++++++--------
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 -----
 ... 0005-Add-an-option-to-disable-IDLE.patch} |  63 +++++-----
 .../0005-Don-t-add-multiarch-paths.patch      |  37 ------
 .../0006-Abort-on-failed-module-build.patch   |  30 -----
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch |  44 +++++++
 ...ption-to-disable-the-sqlite3-module.patch} |  35 +++---
 .../0007-Serial-ioctl-workaround.patch        |  33 ------
 .../0008-Add-an-option-to-disable-pydoc.patch | 102 -----------------
 ...d-an-option-to-disable-the-tk-module.patch |  81 +++++++++++++
 ...option-to-disable-the-curses-module.patch} |  39 +++----
 ...0010-Add-an-option-to-disable-expat.patch} |  59 +++++-----
 ...d-an-option-to-disable-the-tk-module.patch |  77 -------------
 ...p-CC-print-multiarch-output-for-mus.patch} |  10 +-
 ...ss-compiles-when-host-and-target-us.patch} |  28 ++---
 ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -----
 .../0015-Add-an-option-to-disable-NIS.patch   |  33 ------
 ...Add-an-option-to-disable-unicodedata.patch |  30 -----
 ...018-Add-an-option-to-disable-decimal.patch |  54 ---------
 ...on-to-disable-the-ossaudiodev-module.patch |  30 -----
 ...an-option-to-disable-openssl-support.patch |  30 -----
 ...ption-to-disable-the-readline-module.patch |  30 -----
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -------
 ...Add-an-option-to-disable-uuid-module.patch |  33 ------
 ...ion-to-disable-the-berkeleydb-module.patch |  30 -----
 ...-ng-doesn-t-set-errno-when-encryptio.patch |  42 -------
 package/python3/python3.hash                  |   6 +-
 package/python3/python3.mk                    |  79 +++++++------
 utils/genrandconfig                           |   7 ++
 34 files changed, 446 insertions(+), 1057 deletions(-)
 create mode 100644 package/python3/0003-Add-an-option-to-disable-pydoc.patch
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0009-Add-an-option-to-disable-lib2to3.patch => 0004-Add-an-option-to-disable-lib2to3.patch} (55%)
 delete mode 100644 package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 rename package/python3/{0017-Add-an-option-to-disable-IDLE.patch => 0005-Add-an-option-to-disable-IDLE.patch} (51%)
 delete mode 100644 package/python3/0005-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python3/0006-Abort-on-failed-module-build.patch
 create mode 100644 package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
 rename package/python3/{0010-Add-option-to-disable-the-sqlite3-module.patch => 0007-Add-option-to-disable-the-sqlite3-module.patch} (60%)
 delete mode 100644 package/python3/0007-Serial-ioctl-workaround.patch
 delete mode 100644 package/python3/0008-Add-an-option-to-disable-pydoc.patch
 create mode 100644 package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0012-Add-an-option-to-disable-the-curses-module.patch => 0009-Add-an-option-to-disable-the-curses-module.patch} (58%)
 rename package/python3/{0013-Add-an-option-to-disable-expat.patch => 0010-Add-an-option-to-disable-expat.patch} (63%)
 delete mode 100644 package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (87%)
 rename package/python3/{0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch => 0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch} (91%)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-decimal.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python3/0020-Add-an-option-to-disable-openssl-support.patch
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
 delete mode 100644 package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-uuid-module.patch
 delete mode 100644 package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
 delete mode 100644 package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dd1fd31e86..5961b13ec0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1267,30 +1267,15 @@ package/python-web2py/S51web2py Shellcheck lib_sysv.Variables
 package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch lib_patch.Upstream
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
-package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch lib_patch.Upstream
-package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch lib_patch.Upstream
-package/python3/0005-Don-t-add-multiarch-paths.patch lib_patch.Upstream
-package/python3/0006-Abort-on-failed-module-build.patch lib_patch.Upstream
-package/python3/0007-Serial-ioctl-workaround.patch lib_patch.Upstream
-package/python3/0008-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
-package/python3/0009-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
-package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
-package/python3/0011-Add-an-option-to-disable-the-tk-module.patch lib_patch.Upstream
-package/python3/0012-Add-an-option-to-disable-the-curses-module.patch lib_patch.Upstream
-package/python3/0013-Add-an-option-to-disable-expat.patch lib_patch.Upstream
-package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch lib_patch.Upstream
-package/python3/0015-Add-an-option-to-disable-NIS.patch lib_patch.Upstream
-package/python3/0016-Add-an-option-to-disable-unicodedata.patch lib_patch.Upstream
-package/python3/0017-Add-an-option-to-disable-IDLE.patch lib_patch.Upstream
-package/python3/0018-Add-an-option-to-disable-decimal.patch lib_patch.Upstream
-package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch lib_patch.Upstream
-package/python3/0020-Add-an-option-to-disable-openssl-support.patch lib_patch.Upstream
-package/python3/0021-Add-an-option-to-disable-the-readline-module.patch lib_patch.Upstream
-package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch lib_patch.Upstream
-package/python3/0023-Add-an-option-to-disable-uuid-module.patch lib_patch.Upstream
-package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
-package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
-package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
+package/python3/0003-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
+package/python3/0004-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
+package/python3/0005-Add-an-option-to-disable-IDLE.patch lib_patch.Upstream
+package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch lib_patch.Upstream
+package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
+package/python3/0008-Add-an-option-to-disable-the-tk-module.patch lib_patch.Upstream
+package/python3/0009-Add-an-option-to-disable-the-curses-module.patch lib_patch.Upstream
+package/python3/0010-Add-an-option-to-disable-expat.patch lib_patch.Upstream
+package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch lib_patch.Upstream
diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 827b99d8e9..b35b06216c 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 9dd808909ea18f8e99272cbdf1e39151bff62037 Mon Sep 17 00:00:00 2001
+From 5d0f69ce7fc05adbd3c71e113c11da0aedbca33a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -9,38 +9,40 @@ the compilation of pyc.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smrinov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.12.0 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 6 ++++++
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4d1921bf435..f90ec2eeb1d 100644
+index 4a957fb004..9c5f3c031a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2139,6 +2139,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
- 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
- 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
- 	fi
+@@ -2329,6 +2329,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		$(DESTDIR)$(LIBDEST); \
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
 +ifeq (@PYC_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-j0 -d $(LIBDEST) -f \
-@@ -2166,6 +2167,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
- 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-j0 -d $(LIBDEST)/site-packages -f \
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
+@@ -2338,6 +2339,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index bbe7f891e7d..7b136bd2f0b 100644
+index 8a32cb58f4..611c33949a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1459,6 +1459,12 @@ fi
+@@ -1479,6 +1479,12 @@ fi
  
- AC_MSG_CHECKING(LDLIBRARY)
+ AC_MSG_CHECKING([LDLIBRARY])
  
 +AC_SUBST(PYC_BUILD)
 +
@@ -52,5 +54,5 @@ index bbe7f891e7d..7b136bd2f0b 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index e996823c47..e774e442dc 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 33cd52fb1295a6eb4dd42fbc73e565c5ce01bbd0 Mon Sep 17 00:00:00 2001
+From 3a0d7824f7ddd4dd0336c8419cb4246ba936d711 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7b136bd2f0b..1e84aa0bb7f 100644
+index 611c33949a..059ac2f883 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5137,7 +5137,7 @@ fi]))
+@@ -5428,7 +5428,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
@@ -23,5 +23,5 @@ index 7b136bd2f0b..1e84aa0bb7f 100644
    AS_VAR_IF([ipv6], [yes], [
      AC_MSG_ERROR([m4_normalize([
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0003-Add-an-option-to-disable-pydoc.patch b/package/python3/0003-Add-an-option-to-disable-pydoc.patch
new file mode 100644
index 0000000000..01ce235afd
--- /dev/null
+++ b/package/python3/0003-Add-an-option-to-disable-pydoc.patch
@@ -0,0 +1,84 @@
+From f910bdee70b07792c136aaced3850a08eaaafdee Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 22 Feb 2017 17:07:56 -0800
+Subject: [PATCH] Add an option to disable pydoc
+
+It removes 0.5 MB of data from the target plus the pydoc script
+itself.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ Makefile.pre.in | 9 ++++++++-
+ configure.ac    | 6 ++++++
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 9c5f3c031a..2243a658a9 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -2050,7 +2050,9 @@ bininstall: commoninstall altbininstall
+ 	-rm -f $(DESTDIR)$(BINDIR)/idle3
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
+ 	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
++ifeq (@PYDOC@,yes)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
++endif
+ 	-rm -f $(DESTDIR)$(BINDIR)/2to3
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
+ 	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
+@@ -2102,7 +2104,6 @@ LIBSUBDIRS=	asyncio \
+ 		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+-		pydoc_data \
+ 		re \
+ 		site-packages \
+ 		sqlite3 \
+@@ -2257,6 +2258,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 
+ COMPILEALL_OPTS=-j0
+ 
++ifeq (@PYDOC@,yes)
++LIBSUBDIRS += pydoc_data
++endif
++
+ TEST_MODULES=@TEST_MODULES@
+ 
+ .PHONY: libinstall
+@@ -2471,7 +2476,9 @@ libainstall: all scripts
+ 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
+ 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
++ifeq (@PYDOC@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
++endif
+ 	@if [ -s Modules/python.exp -a \
+ 		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
+ 		echo; echo "Installing support files for building shared extension modules on AIX:"; \
+diff --git a/configure.ac b/configure.ac
+index 059ac2f883..1a2dd28d1e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4511,6 +4511,12 @@ AS_VAR_IF([posix_threads], [stub], [
+   AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
+ ])
+ 
++AC_SUBST(PYDOC)
++
++AC_ARG_ENABLE(pydoc,
++	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
++	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
+-- 
+2.34.1
+
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
deleted file mode 100644
index f0c13387e8..0000000000
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 533aa8d7eb7ad27428410371504c6b94183852c1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 16:33:22 -0800
-Subject: [PATCH] Add infrastructure to disable the build of certain extensions
-
-Some of the extensions part of the Python core have dependencies on
-external libraries (sqlite, tk, etc.) or are relatively big and not
-necessarly always useful (CJK codecs for example). By extensions, we
-mean part of Python modules that are written in C and therefore
-compiled to binary code.
-
-Therefore, we introduce a small infrastructure that allows to disable
-some of those extensions. This can be done inside the configure.ac by
-adding values to the DISABLED_EXTENSIONS variable (which is a
-word-separated list of extensions).
-
-The implementation works as follow :
-
- * configure.ac defines a DISABLED_EXTENSIONS variable, which is
-   substituted (so that when Makefile.pre is generated from
-   Makefile.pre.in, the value of the variable is substituted). For
-   now, this DISABLED_EXTENSIONS variable is empty, later patches will
-   use it.
-
- * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
-   variables passed in the environment when calling the setup.py
-   script that actually builds and installs those extensions.
-
- * setup.py is modified so that the existing "disabled_module_list" is
-   filled with those pre-disabled extensions listed in
-   DISABLED_EXTENSIONS.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-then extended by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f90ec2eeb1d..5a40b7c5484 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -239,6 +239,8 @@ FILEMODE=	644
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -743,6 +745,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
- 	    *) quiet="";; \
- 	esac; \
- 	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
-+		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2289,7 +2292,8 @@ libainstall: all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: all
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
-+	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
-+		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 1e84aa0bb7f..b4d7d2cca6a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3612,6 +3612,8 @@ LIBS="$withval $LIBS"
- ],
- [AC_MSG_RESULT(no)])
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-diff --git a/setup.py b/setup.py
-index ad8fb81b218..2e15fedeab2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -56,7 +56,10 @@
- 
- 
- # This global variable is used to hold the list of modules to be disabled.
--DISABLED_MODULE_LIST = []
-+try:
-+    DISABLED_MODULE_LIST = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    DISABLED_MODULE_LIST = list()
- 
- # --list-module-names option used by Tools/scripts/generate_module_names.py
- LIST_MODULE_NAMES = False
--- 
-2.44.0
-
diff --git a/package/python3/0009-Add-an-option-to-disable-lib2to3.patch b/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
similarity index 55%
rename from package/python3/0009-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0004-Add-an-option-to-disable-lib2to3.patch
index 06f38e92b3..cc21cbd0b5 100644
--- a/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From 3fbd10c59a777c4ef7ee1bd3fb70808e25e11703 Mon Sep 17 00:00:00 2001
+From 572f3164d1dce13db30e897ab0be7c706fa7b731 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -14,19 +14,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Bernd Kuhls: ported to Python 3.11.4]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[ Vincent Fazio: fix scripts array to reflect upstream ]
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- Makefile.pre.in | 17 ++++++++++++-----
+ Makefile.pre.in | 19 ++++++++++++++-----
  configure.ac    |  6 ++++++
- setup.py        |  4 +++-
- 3 files changed, 21 insertions(+), 6 deletions(-)
+ 2 files changed, 20 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e87bc1fcd3..1a0ab0de42 100644
+index 2243a658a9..3f314d1354 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1881,7 +1881,9 @@ ifeq (@PYDOC@,yes)
+@@ -2054,7 +2054,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -36,7 +35,7 @@ index e87bc1fcd3..1a0ab0de42 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1927,7 +1929,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2101,7 +2103,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
  		importlib importlib/resources importlib/metadata \
  		json \
@@ -44,34 +43,34 @@ index e87bc1fcd3..1a0ab0de42 100644
  		logging \
  		multiprocessing multiprocessing/dummy \
  		re \
-@@ -1947,10 +1948,6 @@ LIBSUBDIRS=	asyncio \
- TESTSUBDIRS=	ctypes/test \
- 		distutils/tests \
- 		idlelib/idle_test \
--		lib2to3/tests \
--		lib2to3/tests/data \
--		lib2to3/tests/data/fixers \
--		lib2to3/tests/data/fixers/myfixes \
- 		test \
- 		test/audiodata \
- 		test/certdata \
-@@ -2074,6 +2071,14 @@ ifeq (@PYDOC@,yes)
+@@ -2207,10 +2208,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_importlib/resources/zipdata02 \
+ 		test/test_importlib/source \
+ 		test/test_json \
+-		test/test_lib2to3 \
+-		test/test_lib2to3/data \
+-		test/test_lib2to3/data/fixers \
+-		test/test_lib2to3/data/fixers/myfixes \
+ 		test/test_module \
+ 		test/test_peg_generator \
+ 		test/test_pydoc \
+@@ -2262,6 +2259,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
-+TESTSUBDIRS += lib2to3/tests			\
-+	lib2to3/tests/data			\
-+	lib2to3/tests/data/fixers		\
-+	lib2to3/tests/data/fixers/myfixes
++TESTSUBDIRS += test/test_lib2to3			\
++		test/test_lib2to3/data \
++		test/test_lib2to3/data/fixers \
++		test/test_lib2to3/data/fixers/myfixes
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-@@ -2176,10 +2181,12 @@ ifeq (@PYC_BUILD@,yes)
- 		-j0 -d $(LIBDEST)/site-packages -f \
+ 
+ .PHONY: libinstall
+@@ -2345,10 +2350,12 @@ ifeq (@PYC_BUILD@,yes)
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
 +ifeq (@LIB2TO3@,yes)
@@ -83,11 +82,21 @@ index e87bc1fcd3..1a0ab0de42 100644
  
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
+@@ -2474,7 +2481,9 @@ libainstall: all scripts
+ 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
+ 	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
+ 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
++ifeq (@LIB2TO3@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
++endif
+ 	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
+ ifeq (@PYDOC@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
 diff --git a/configure.ac b/configure.ac
-index d56d8f9d1c..bf91fb2f82 100644
+index 1a2dd28d1e..f0354c580d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7147,6 +7147,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7561,6 +7561,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -98,26 +107,8 @@ index d56d8f9d1c..bf91fb2f82 100644
 +	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
 +
  # generate output files
- AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
-diff --git a/setup.py b/setup.py
-index 25e6f4fc26..78d880f9db 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1598,10 +1598,12 @@ class DummyProcess:
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3']
-+    scripts = ['Tools/scripts/idle3']
- 
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc3' ]
-+    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/2to3' ]
- 
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
+ AC_CONFIG_FILES(m4_normalize([
+   Makefile.pre
 -- 
 2.34.1
 
diff --git a/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
deleted file mode 100644
index 0e3a844354..0000000000
--- a/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bd152d01185a371a04680bc772c6454678de34f5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:36:00 +0100
-Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 2e15fedeab2..b283ea3aeed 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1111,12 +1111,9 @@ def detect_readline_curses(self):
-                 pass # Issue 7384: Already linked against curses or tinfo.
-             elif curses_library:
-                 readline_libs.append(curses_library)
--            elif self.compiler.find_library_file(self.lib_dirs +
--                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
-+            elif self.compiler.find_library_file(self.lib_dirs, 'termcap'):
-                 readline_libs.append('termcap')
-             self.add(Extension('readline', ['readline.c'],
--                               library_dirs=['/usr/lib/termcap'],
-                                libraries=readline_libs))
-         else:
-             self.missing.append('readline')
--- 
-2.44.0
-
diff --git a/package/python3/0017-Add-an-option-to-disable-IDLE.patch b/package/python3/0005-Add-an-option-to-disable-IDLE.patch
similarity index 51%
rename from package/python3/0017-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0005-Add-an-option-to-disable-IDLE.patch
index fe44ef0d05..e9218af1c8 100644
--- a/package/python3/0017-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0005-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From dd4ac2662ae1feaa3a29c4088193e48645b080f7 Mon Sep 17 00:00:00 2001
+From ffa7fbceb54918eb518474c8f821fda0a58cf181 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -11,19 +11,18 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Vincent Fazio: fixup setup array to reflect upstream ]
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- Makefile.pre.in | 7 ++++++-
+ Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
- setup.py        | 4 +++-
- 3 files changed, 15 insertions(+), 2 deletions(-)
+ 2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8e5f6762d2..4e407cbcfa 100644
+index 3f314d1354..5fad7f82fb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1875,7 +1875,9 @@ bininstall: commoninstall altbininstall
+@@ -2048,7 +2048,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -33,7 +32,7 @@ index 8e5f6762d2..4e407cbcfa 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1925,7 +1927,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2100,7 +2102,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -41,8 +40,8 @@ index 8e5f6762d2..4e407cbcfa 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2090,6 +2091,10 @@ ifeq (@EXPAT@,yes)
- LIBSUBDIRS += $(XMLLIBSUBDIRS)
+@@ -2267,6 +2268,10 @@ TESTSUBDIRS += test/test_lib2to3			\
+ 		test/test_lib2to3/data/fixers/myfixes
  endif
  
 +ifeq (@IDLE@,yes)
@@ -50,13 +49,23 @@ index 8e5f6762d2..4e407cbcfa 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 
+ .PHONY: libinstall
+@@ -2484,7 +2489,9 @@ libainstall: all scripts
+ ifeq (@LIB2TO3@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
+ endif
++ifeq (@IDLE@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
++endif
+ ifeq (@PYDOC@,yes)
+ 	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
+ endif
 diff --git a/configure.ac b/configure.ac
-index cb7e980e5b..fe497ec9df 100644
+index f0354c580d..43086962e9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7206,6 +7206,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7567,6 +7567,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -67,28 +76,8 @@ index cb7e980e5b..fe497ec9df 100644
 +	[ IDLE="${enableval}" ], [ IDLE=yes ])
 +
  # generate output files
- AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
-diff --git a/setup.py b/setup.py
-index 78d880f9db..ca05faec97 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1598,12 +1598,14 @@ class DummyProcess:
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle3']
-+    scripts = []
- 
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc3' ]
-     if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/2to3' ]
-+    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/idle3' ]
- 
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
+ AC_CONFIG_FILES(m4_normalize([
+   Makefile.pre
 -- 
 2.34.1
 
diff --git a/package/python3/0005-Don-t-add-multiarch-paths.patch b/package/python3/0005-Don-t-add-multiarch-paths.patch
deleted file mode 100644
index 4557fbb31e..0000000000
--- a/package/python3/0005-Don-t-add-multiarch-paths.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3e953e494570ddb78823d12f66dae1759f4780a3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:36:27 +0100
-Subject: [PATCH] Don't add multiarch paths
-
-The add_multiarch_paths() function leads, in certain build
-environments, to the addition of host header paths to the CFLAGS,
-which is not appropriate for cross-compilation. This patch fixes that
-by simply removing the call to add_multiarch_paths() when we're
-cross-compiling.
-
-Investigation done by David <buildroot-2014@inbox.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index b283ea3aeed..585dd43828d 100644
---- a/setup.py
-+++ b/setup.py
-@@ -853,10 +853,10 @@ def configure_compiler(self):
-         if not CROSS_COMPILING:
-             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+            self.add_multiarch_paths()
-         # only change this for cross builds for 3.3, issues on Mageia
-         if CROSS_COMPILING:
-             self.add_cross_compiling_paths()
--        self.add_multiarch_paths()
-         self.add_ldflags_cppflags()
- 
-     def init_inc_lib_dirs(self):
--- 
-2.44.0
-
diff --git a/package/python3/0006-Abort-on-failed-module-build.patch b/package/python3/0006-Abort-on-failed-module-build.patch
deleted file mode 100644
index d3ec7c31e8..0000000000
--- a/package/python3/0006-Abort-on-failed-module-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 60b62c7e2c1fca4dcaf288f747376bfde111283b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:43:24 +0100
-Subject: [PATCH] Abort on failed module build
-
-When building a Python module fails, the setup.py script currently
-doesn't exit with an error, and simply continues. This is not a really
-nice behavior, so this patch changes setup.py to abort with an error,
-so that the build issue is clearly noticeable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index 585dd43828d..53b066cb18b 100644
---- a/setup.py
-+++ b/setup.py
-@@ -580,6 +580,7 @@ def print_three_column(lst):
-             print("Failed to build these modules:")
-             print_three_column(failed)
-             print()
-+            sys.exit(1)
- 
-         if self.failed_on_import:
-             failed = self.failed_on_import[:]
--- 
-2.44.0
-
diff --git a/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
new file mode 100644
index 0000000000..e594e6cd63
--- /dev/null
+++ b/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -0,0 +1,44 @@
+From 267516c76208e63b5a3ec7d4dead6c329d8763bb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 22:46:59 +0100
+Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
+
+We will need PY_STDLIB_MOD_SET_NA in next patches further up in the
+configure.ac script.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 43086962e9..561e33f550 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -95,6 +95,11 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
+   AS_VAR_POPDEF([py_libs])
+ ])
+ 
++AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
++  m4_foreach([mod], [$@], [
++    AS_VAR_SET([py_cv_module_]mod, [n/a])])
++])
++
+ AC_SUBST([BASECPPFLAGS])
+ if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
+     # If we're building out-of-tree, we need to make sure the following
+@@ -7258,11 +7263,6 @@ AC_ARG_ENABLE([test-modules],
+ AC_MSG_RESULT([$TEST_MODULES])
+ AC_SUBST([TEST_MODULES])
+ 
+-AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
+-  m4_foreach([mod], [$@], [
+-    AS_VAR_SET([py_cv_module_]mod, [n/a])])
+-])
+-
+ # stdlib not available
+ dnl Modules that are not available on some platforms
+ dnl AIX has shadow passwords, but access is not via getspent()
+-- 
+2.34.1
+
diff --git a/package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
similarity index 60%
rename from package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
index 5ed282208b..f26091ebfb 100644
--- a/package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,6 +1,6 @@
-From aba9392bf6bf68cfd63b1cecfdd3e96d5de2a0b7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:20:45 -0800
+From a8566f6ee2a2b859ba5562f2d9f06cb4d271f277 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
@@ -9,16 +9,17 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  Makefile.pre.in | 5 ++++-
- configure.ac    | 9 +++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
+ configure.ac    | 7 +++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 1a0ab0de426..1c7b38ce4f6 100644
+index 5fad7f82fb..7b6c9811a6 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1933,7 +1933,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
  		re \
  		site-packages \
@@ -26,8 +27,8 @@ index 1a0ab0de426..1c7b38ce4f6 100644
  		tkinter \
  		tomllib \
  		turtledemo \
-@@ -2079,6 +2078,10 @@ TESTSUBDIRS += lib2to3/tests			\
- 	lib2to3/tests/data/fixers/myfixes
+@@ -2272,6 +2271,10 @@ ifeq (@IDLE@,yes)
+ LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
 +ifeq (@SQLITE3@,yes)
@@ -35,13 +36,13 @@ index 1a0ab0de426..1c7b38ce4f6 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 
+ .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index bf91fb2f824..0013afc9aad 100644
+index 561e33f550..d1c54bd67c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4222,6 +4222,15 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4516,6 +4516,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -49,14 +50,12 @@ index bf91fb2f824..0013afc9aad 100644
 +AC_ARG_ENABLE(sqlite3,
 +	AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
 +	[ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
-+
-+if test "$SQLITE3" = "no" ; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
-+fi
++AS_IF([test "$SQLITE3" = "no"],
++      [PY_STDLIB_MOD_SET_NA([_sqlite3])])
 +
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0007-Serial-ioctl-workaround.patch b/package/python3/0007-Serial-ioctl-workaround.patch
deleted file mode 100644
index 34072f894e..0000000000
--- a/package/python3/0007-Serial-ioctl-workaround.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0061a02bbe82c9b3b631d3b820bab0ba18482ebc Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 23 Dec 2015 11:44:02 +0100
-Subject: [PATCH] Serial ioctl() workaround
-
-The ioctls.h of some architectures (notably xtensa) references structs from
-linux/serial.h. Make sure to include this header as well.
-
-Also, undef TIOCTTYGSTRUCT that require reference to internal kernel tty_struct,
-but isn't actually referenced in modern kernels.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- Modules/termios.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Modules/termios.c b/Modules/termios.c
-index 23771b2ce99..c1579af435d 100644
---- a/Modules/termios.c
-+++ b/Modules/termios.c
-@@ -15,7 +15,9 @@
- #endif
- 
- #include <termios.h>
-+#include <linux/serial.h>
- #include <sys/ioctl.h>
-+#undef TIOCTTYGSTRUCT
- 
- /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
-  * MDTR, MRI, and MRTS (apparently used internally by some things
--- 
-2.44.0
-
diff --git a/package/python3/0008-Add-an-option-to-disable-pydoc.patch b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
deleted file mode 100644
index ffb6a7796f..0000000000
--- a/package/python3/0008-Add-an-option-to-disable-pydoc.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From e6284624679a525440dc4bfddc1347f8add22fd8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:07:56 -0800
-Subject: [PATCH] Add an option to disable pydoc
-
-It removes 0.5 MB of data from the target plus the pydoc script
-itself.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Vincent Fazio: fix scripts array to reflect upstream ]
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
----
- Makefile.pre.in | 7 ++++++-
- configure.ac    | 6 ++++++
- setup.py        | 9 +++++++--
- 3 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5a40b7c548..e87bc1fcd3 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1877,7 +1877,9 @@ bininstall: commoninstall altbininstall
- 	-rm -f $(DESTDIR)$(BINDIR)/idle3
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
- 	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
-+ifeq (@PYDOC@,yes)
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-+endif
- 	-rm -f $(DESTDIR)$(BINDIR)/2to3
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
- 	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1928,7 +1930,6 @@ LIBSUBDIRS=	asyncio \
- 		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		logging \
- 		multiprocessing multiprocessing/dummy \
--		pydoc_data \
- 		re \
- 		site-packages \
- 		sqlite3 \
-@@ -2069,6 +2070,10 @@ TESTSUBDIRS=	ctypes/test \
- 		unittest/test \
- 		unittest/test/testmock
- 
-+ifeq (@PYDOC@,yes)
-+LIBSUBDIRS += pydoc_data
-+endif
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-diff --git a/configure.ac b/configure.ac
-index b4d7d2cca6..d56d8f9d1c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4222,6 +4222,12 @@ AS_VAR_IF([posix_threads], [stub], [
-   AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
- ])
- 
-+AC_SUBST(PYDOC)
-+
-+AC_ARG_ENABLE(pydoc,
-+	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
-+	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
-diff --git a/setup.py b/setup.py
-index 53b066cb18..25e6f4fc26 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1597,6 +1597,12 @@ class DummyProcess:
-     # turn off warnings when deprecated modules are imported
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
-+
-+    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3']
-+
-+    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/pydoc3' ]
-+
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
-           version = sys.version.split()[0],
-@@ -1621,8 +1627,7 @@ class DummyProcess:
-           # If you change the scripts installed here, you also need to
-           # check the PyBuildScripts command above, and change the links
-           # created by the bininstall target in Makefile.pre.in
--          scripts = ["Tools/scripts/pydoc3", "Tools/scripts/idle3",
--                     "Tools/scripts/2to3"]
-+          scripts = scripts
-         )
- 
- # --install-platlib
--- 
-2.34.1
-
diff --git a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
new file mode 100644
index 0000000000..97ee2d717c
--- /dev/null
+++ b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
@@ -0,0 +1,81 @@
+From c1ec9fa46cd7679fd009f66a3ebed8de95d84f10 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 22 Feb 2017 17:23:42 -0800
+Subject: [PATCH] Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Bernd Kuhls: ported to Python 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ Makefile.pre.in | 8 +++++---
+ configure.ac    | 7 +++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 7b6c9811a6..6d9527ddd0 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
+ 		multiprocessing multiprocessing/dummy \
+ 		re \
+ 		site-packages \
+-		tkinter \
+ 		tomllib \
+ 		turtledemo \
+ 		unittest \
+@@ -2212,7 +2211,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_peg_generator \
+ 		test/test_pydoc \
+ 		test/test_sqlite3 \
+-		test/test_tkinter \
+ 		test/test_tomllib \
+ 		test/test_tomllib/data \
+ 		test/test_tomllib/data/invalid \
+@@ -2232,7 +2230,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_tomllib/data/valid/dates-and-times \
+ 		test/test_tomllib/data/valid/multiline-basic-str \
+ 		test/test_tools \
+-		test/test_ttk \
+ 		test/test_unittest \
+ 		test/test_unittest/testmock \
+ 		test/test_warnings \
+@@ -2253,6 +2250,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_multiprocessing_forkserver \
+ 		test/test_multiprocessing_spawn
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += tkinter
++TESTSUBDIRS += test/test_tkinter test/test_ttk
++endif
++
+ COMPILEALL_OPTS=-j0
+ 
+ ifeq (@PYDOC@,yes)
+diff --git a/configure.ac b/configure.ac
+index d1c54bd67c..4c5cbe4153 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4529,6 +4529,13 @@ AC_ARG_ENABLE(pydoc,
+ 	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
+ 	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
+ 
++AC_SUBST(TK)
++AC_ARG_ENABLE(tk,
++	AS_HELP_STRING([--disable-tk], [disable tk]),
++	[ TK="${enableval}" ], [ TK=yes ])
++AS_IF([test "$TK" = "no"],
++	[PY_STDLIB_MOD_SET_NA([_tkinter])])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
+-- 
+2.34.1
+
diff --git a/package/python3/0012-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
similarity index 58%
rename from package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
index 0b15dfb01c..139bf1544b 100644
--- a/package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From d843bceff915b2a50b36a9db8552e0db5bd90f6d Mon Sep 17 00:00:00 2001
+From d7ea122e8ae506019761b92987b141fe7ea55f76 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -10,52 +10,51 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 4 +++-
- configure.ac    | 9 +++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
+ Makefile.pre.in | 5 ++++-
+ configure.ac    | 7 +++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6ab184fe5f8..09408c3471f 100644
+index 6d9527ddd0..283ca1bd60 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1918,7 +1918,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2095,7 +2095,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
 -		curses \
  		dbm \
- 		distutils distutils/command \
  		email email/mime \
-@@ -2084,6 +2083,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
- 	tkinter/test/test_ttk
+ 		encodings \
+@@ -2255,6 +2254,10 @@ LIBSUBDIRS += tkinter
+ TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
 +ifeq (@CURSES@,yes)
 +LIBSUBDIRS += curses
 +endif
++
+ COMPILEALL_OPTS=-j0
  
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
+ ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 342b295bcdd..5d52c813ba6 100644
+index 4c5cbe4153..92d663ed40 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4240,6 +4240,15 @@ if test "$TK" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
- fi
+@@ -4523,6 +4523,13 @@ AC_ARG_ENABLE(sqlite3,
+ AS_IF([test "$SQLITE3" = "no"],
+       [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
 +AC_SUBST(CURSES)
 +AC_ARG_ENABLE(curses,
 +	AS_HELP_STRING([--disable-curses], [disable curses]),
 +	[ CURSES="${enableval}" ], [ CURSES=yes ])
-+
-+if test "$CURSES" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
-+fi
++AS_IF([test "$CURSES" = "no"],
++      [PY_STDLIB_MOD_SET_NA([_curses], [_curses_panel])])
 +
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0013-Add-an-option-to-disable-expat.patch b/package/python3/0010-Add-an-option-to-disable-expat.patch
similarity index 63%
rename from package/python3/0013-Add-an-option-to-disable-expat.patch
rename to package/python3/0010-Add-an-option-to-disable-expat.patch
index 03d8271e5d..2363aeb01d 100644
--- a/package/python3/0013-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0010-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 3ed9d35554631a1e0c438636b60b6b9b699cba4b Mon Sep 17 00:00:00 2001
+From d1701f1c89e9d2319ede200052319183fbb4ae18 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -17,23 +17,23 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in |  5 ++++-
- configure.ac    | 20 ++++++++++++++------
- 2 files changed, 18 insertions(+), 7 deletions(-)
+ configure.ac    | 24 +++++++++++++-----------
+ 2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 09408c3471f..8e5f6762d20 100644
+index 283ca1bd60..13f7512f42 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1938,7 +1938,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2113,7 +2113,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
 -		$(XMLLIBSUBDIRS) \
  		xmlrpc \
+ 		zipfile zipfile/_path \
  		zoneinfo \
- 		__phello__
-@@ -2087,6 +2086,10 @@ ifeq (@CURSES@,yes)
- LIBSUBDIRS += curses
+@@ -2280,6 +2279,10 @@ ifeq (@SQLITE3@,yes)
+ LIBSUBDIRS += sqlite3
  endif
  
 +ifeq (@EXPAT@,yes)
@@ -41,36 +41,37 @@ index 09408c3471f..8e5f6762d20 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 
+ .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 5d52c813ba6..6e577f19b8c 100644
+index 92d663ed40..1cb95f41fd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3615,15 +3615,23 @@ LIBS="$withval $LIBS"
- AC_SUBST(DISABLED_EXTENSIONS)
+@@ -3823,17 +3823,19 @@ LIBS="$withval $LIBS"
+ [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
--AC_MSG_CHECKING(for --with-system-expat)
--AC_ARG_WITH(system_expat,
--            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]),
+-AC_MSG_CHECKING([for --with-system-expat])
+-AC_ARG_WITH(
+-  [system_expat],
+-  [AS_HELP_STRING(
+-     [--with-system-expat],
+-     [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]
+-  )], [], [with_system_expat="no"])
+-
+-AC_MSG_RESULT([$with_system_expat])
+-
+-AS_VAR_IF([with_system_expat], [yes], [
 +AC_MSG_CHECKING(for --with-expat)
 +AC_ARG_WITH(expat,
 +            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
-             [],
--            [with_system_expat="no"])
++            [],
 +            [with_expat="builtin"])
- 
--AC_MSG_RESULT($with_system_expat)
 +AC_MSG_RESULT($with_expat)
- 
--AS_VAR_IF([with_system_expat], [yes], [
-+if test "$with_expat" != "none"; then
-+   EXPAT=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} pyexpat"
-+   EXPAT=no
-+fi
++AS_IF([test "$with_expat" != "none"],
++      [EXPAT=yes],
++      [PY_STDLIB_MOD_SET_NA([pyexpat])
++       EXPAT=no])
 +AC_SUBST(EXPAT)
 +
 +AS_VAR_IF([with_expat], [system], [
@@ -78,5 +79,5 @@ index 5d52c813ba6..6e577f19b8c 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
deleted file mode 100644
index 2d5c002e0f..0000000000
--- a/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 61535b58452a18d6654a02fd25bfbc562bbbdbea Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:23:42 -0800
-Subject: [PATCH] Add an option to disable the tk module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.pre.in | 11 +++++++----
- configure.ac    |  9 +++++++++
- 2 files changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 1c7b38ce4f6..6ab184fe5f8 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1933,7 +1933,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
- 		re \
- 		site-packages \
--		tkinter \
- 		tomllib \
- 		turtledemo \
- 		unittest \
-@@ -2060,9 +2059,6 @@ TESTSUBDIRS=	ctypes/test \
- 		test/xmltestdata \
- 		test/xmltestdata/c14n-20 \
- 		test/ziptestdata \
--		tkinter/test \
--		tkinter/test/test_tkinter \
--		tkinter/test/test_ttk \
- 		unittest/test \
- 		unittest/test/testmock
- 
-@@ -2082,6 +2078,13 @@ ifeq (@SQLITE3@,yes)
- LIBSUBDIRS += sqlite3
- endif
- 
-+ifeq (@TK@,yes)
-+LIBSUBDIRS += tkinter
-+TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
-+	tkinter/test/test_ttk
-+endif
-+
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-diff --git a/configure.ac b/configure.ac
-index 0013afc9aad..342b295bcdd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4231,6 +4231,15 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_SUBST(TK)
-+AC_ARG_ENABLE(tk,
-+	AS_HELP_STRING([--disable-tk], [disable tk]),
-+	[ TK="${enableval}" ], [ TK=yes ])
-+
-+if test "$TK" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.44.0
-
diff --git a/package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 87%
rename from package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 1b7b972bdf..a92f78fe57 100644
--- a/package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From a1495856f48a8ce256d972f656184e38baced12e Mon Sep 17 00:00:00 2001
+From 3eccbd53df3c51c1c6ece217d19f1d01eb9575a7 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -25,15 +25,17 @@ to keep the configure script happy.
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [Peter: updated for 3.10.2]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[Vincent: fixup offsets for 3.12.4]
 ---
  configure.ac | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6205e6782cf..da884ddf441 100644
+index 1cb95f41fd..d142af404a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1104,7 +1104,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1128,7 +1128,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
@@ -47,5 +49,5 @@ index 6205e6782cf..da884ddf441 100644
  AC_SUBST([MULTIARCH])
  AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch b/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
similarity index 91%
rename from package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
rename to package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
index 6c66a3410b..5a7949b2fd 100644
--- a/package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
+++ b/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
@@ -1,4 +1,4 @@
-From ffe5a060a1b24bedc2aac5d60d6b3b7e40f55adc Mon Sep 17 00:00:00 2001
+From e7fa6023be567251b409527bd005b93335914501 Mon Sep 17 00:00:00 2001
 From: Vincent Fazio <5265893+vfazio@users.noreply.github.com>
 Date: Wed, 28 Feb 2024 13:55:04 -0600
 Subject: [PATCH] gh-115382: Fix cross compiles when host and target use same
@@ -48,10 +48,10 @@ Upstream: https://github.com/python/cpython/pull/116294
  6 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index ebe37118274..ba424236e11 100644
+index 122d441bd1..260aec3127 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -528,7 +528,20 @@ def _init_posix(vars):
+@@ -533,7 +533,20 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
@@ -74,10 +74,10 @@ index ebe37118274..ba424236e11 100644
      vars.update(build_time_vars)
  
 diff --git a/Lib/test/libregrtest/main.py b/Lib/test/libregrtest/main.py
-index a9725fa9673..121e2e73938 100644
+index e41646d2d1..f54e570728 100644
 --- a/Lib/test/libregrtest/main.py
 +++ b/Lib/test/libregrtest/main.py
-@@ -519,6 +519,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
+@@ -576,6 +576,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
                  '_PYTHON_PROJECT_BASE',
                  '_PYTHON_HOST_PLATFORM',
                  '_PYTHON_SYSCONFIGDATA_NAME',
@@ -86,7 +86,7 @@ index a9725fa9673..121e2e73938 100644
              }
              old_environ = os.environ
 diff --git a/Lib/test/pythoninfo.py b/Lib/test/pythoninfo.py
-index 74ebb5e5b8a..fa7fbca34e1 100644
+index 6efeaad812..d43e52c9e4 100644
 --- a/Lib/test/pythoninfo.py
 +++ b/Lib/test/pythoninfo.py
 @@ -326,6 +326,7 @@ def format_groups(groups):
@@ -98,7 +98,7 @@ index 74ebb5e5b8a..fa7fbca34e1 100644
  
          # Sanitizer options
 diff --git a/Tools/scripts/run_tests.py b/Tools/scripts/run_tests.py
-index 445a34ae3e8..4077a834245 100644
+index 445a34ae3e..4077a83424 100644
 --- a/Tools/scripts/run_tests.py
 +++ b/Tools/scripts/run_tests.py
 @@ -42,6 +42,7 @@ def main(regrtest_args):
@@ -110,23 +110,23 @@ index 445a34ae3e8..4077a834245 100644
          }
          environ = {
 diff --git a/configure b/configure
-index cb3db60f9c2..5fc0cffa977 100755
+index 6dc8a66e48..a69346db8c 100755
 --- a/configure
 +++ b/configure
-@@ -3262,7 +3262,7 @@ fi
+@@ -3689,7 +3689,7 @@ fi
      fi
          ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
      PYTHON_FOR_FREEZE="$with_build_python"
 -    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
 +    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $with_build_python" >&5
- $as_echo "$with_build_python" >&6; }
+     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $with_build_python" >&5
+ printf "%s\n" "$with_build_python" >&6; }
  
 diff --git a/configure.ac b/configure.ac
-index 852cbaa6e4c..5ca316a948b 100644
+index 1cb95f41fd..de420dde2c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -162,7 +162,7 @@ AC_ARG_WITH(
+@@ -169,7 +169,7 @@ AC_ARG_WITH([build-python],
      dnl Build Python interpreter is used for regeneration and freezing.
      ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
      PYTHON_FOR_FREEZE="$with_build_python"
@@ -136,5 +136,5 @@ index 852cbaa6e4c..5ca316a948b 100644
    ], [
      AS_VAR_IF([cross_compiling], [yes],
 -- 
-2.44.0
+2.34.1
 
diff --git a/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
deleted file mode 100644
index 7e13a07a1d..0000000000
--- a/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 494fae96f273517c43c65a5d9ea6b7d968352443 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:55 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 6e577f19b8c..13ffcf2637e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4239,6 +4239,12 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_ARG_ENABLE(codecs-cjk,
-+	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
-+	[ if test "$enableval" = "no"; then
-+		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
-+	fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0015-Add-an-option-to-disable-NIS.patch b/package/python3/0015-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index ee382ace7e..0000000000
--- a/package/python3/0015-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3f4f9bee66236e2052f9ff027e867a61ec56a585 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 13ffcf2637e..2faadb34f65 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4245,6 +4245,12 @@ AC_ARG_ENABLE(codecs-cjk,
- 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
- 	fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0016-Add-an-option-to-disable-unicodedata.patch b/package/python3/0016-Add-an-option-to-disable-unicodedata.patch
deleted file mode 100644
index f5e57c127e..0000000000
--- a/package/python3/0016-Add-an-option-to-disable-unicodedata.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 15490e1576d5836a7afc5a3eca75e087bb3f032e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:27 +0100
-Subject: [PATCH] Add an option to disable unicodedata
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 2faadb34f65..cb7e980e5b5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4251,6 +4251,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(unicodedata,
-+	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0018-Add-an-option-to-disable-decimal.patch b/package/python3/0018-Add-an-option-to-disable-decimal.patch
deleted file mode 100644
index dc966b915d..0000000000
--- a/package/python3/0018-Add-an-option-to-disable-decimal.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 12b5db4e25182962eb0b8bc21479a743c35a158c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:31 +0100
-Subject: [PATCH] Add an option to disable decimal
-
-This patch replaces the existing --with-system-libmpdec option with a
---with-libmpdec={system,builtin,none} option, which allows to tell
-Python whether we want to use the system libmpdec (already installed),
-the libmpdec builtin the Python sources, or no libmpdec at all.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[aduskett@gmail.com: Update for python 3.7.0]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- configure.ac | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fe497ec9dfb..20b3c2459f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3680,14 +3680,21 @@ fi
- AC_SUBST(LIBFFI_INCLUDEDIR)
- 
- # Check for use of the system libmpdec library
--AC_MSG_CHECKING(for --with-system-libmpdec)
--AC_ARG_WITH(system_libmpdec,
--            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),
-+AC_MSG_CHECKING(for --with-libmpdec)
-+AC_ARG_WITH(libmpdec,
-+            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
-             [],
--            [with_system_libmpdec="no"])
--AC_MSG_RESULT($with_system_libmpdec)
-+            [with_libmpdec="builtin"])
-+AC_MSG_RESULT($with_libmpdec)
-+if test "$with_libmpdec" != "none"; then
-+   MPDEC=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _decimal"
-+   MPDEC=no
-+fi
-+AC_SUBST(MPDEC)
- 
--AS_VAR_IF([with_system_libmpdec], [yes], [
-+AS_VAR_IF([with_libmpdec], [system], [
-   LIBMPDEC_CFLAGS=${LIBMPDEC_CFLAGS-""}
-   LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
-   LIBMPDEC_INTERNAL=
--- 
-2.44.0
-
diff --git a/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index d05e0a8a48..0000000000
--- a/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 17d7b6d56cf554dcc6fcb263e1fd2b9e3dbf4320 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 20b3c2459f4..87853f47329 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3728,6 +3728,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.44.0
-
diff --git a/package/python3/0020-Add-an-option-to-disable-openssl-support.patch b/package/python3/0020-Add-an-option-to-disable-openssl-support.patch
deleted file mode 100644
index 6e95ae49a4..0000000000
--- a/package/python3/0020-Add-an-option-to-disable-openssl-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 959521c99fed46efab9bf0a1ae4b77b2365cf0d1 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 22 Feb 2017 17:55:59 -0800
-Subject: [PATCH] Add an option to disable openssl support.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 87853f47329..3f8f0419767 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4270,6 +4270,12 @@ AC_ARG_ENABLE(unicodedata,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-   	  fi])
- 
-+AC_ARG_ENABLE(openssl,
-+	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
deleted file mode 100644
index 48b7f949ad..0000000000
--- a/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3ea53d30005a06134a9ef05051493efb9c30712b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:29:05 +0100
-Subject: [PATCH] Add an option to disable the readline module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 3f8f0419767..11a798b25bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4276,6 +4276,12 @@ AC_ARG_ENABLE(openssl,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
- 	  fi])
- 
-+AC_ARG_ENABLE(readline,
-+	AS_HELP_STRING([--disable-readline], [disable readline]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
deleted file mode 100644
index a1c5856dd7..0000000000
--- a/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 32dfbdc953a8c992c2b7a5562b899cbc3a7a6e70 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:31:11 +0100
-Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 11a798b25bb..bd18ebe7582 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4282,6 +4282,24 @@ AC_ARG_ENABLE(readline,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
- 	  fi])
- 
-+AC_ARG_ENABLE(bzip2,
-+	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
-+	  fi])
-+
-+AC_ARG_ENABLE(zlib,
-+	AS_HELP_STRING([--disable-zlib], [disable zlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+	  fi])
-+
-+AC_ARG_ENABLE(xz,
-+	AS_HELP_STRING([--disable-xz], [disable xz]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.44.0
-
diff --git a/package/python3/0023-Add-an-option-to-disable-uuid-module.patch b/package/python3/0023-Add-an-option-to-disable-uuid-module.patch
deleted file mode 100644
index ef791c5eff..0000000000
--- a/package/python3/0023-Add-an-option-to-disable-uuid-module.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1bf575c16a957dfc5ee6913b462d24a4e882698e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 18 Aug 2018 10:54:56 +0200
-Subject: [PATCH] Add an option to disable uuid module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index bd18ebe7582..6205e6782cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4318,6 +4318,15 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_SUBST(UUID)
-+AC_ARG_ENABLE(uuid,
-+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
-+	[ UUID="${enableval}" ], [ UUID=yes ])
-+
-+if test "$UUID" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.44.0
-
diff --git a/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
deleted file mode 100644
index 80a0077c65..0000000000
--- a/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7ee16a7096ccf9001f30b9076f562229efb9bcf3 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 11 Apr 2020 22:01:40 +0200
-Subject: [PATCH] Add an option to disable the berkeleydb module
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index da884ddf441..852cbaa6e4c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4331,6 +4331,12 @@ if test "$UUID" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
- fi
- 
-+AC_ARG_ENABLE(berkeleydb,
-+	AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _dbm"
-+	  fi])
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.44.0
-
diff --git a/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
deleted file mode 100644
index b55e1a2813..0000000000
--- a/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d6706e827f703c63ab519d104c53833fa5cebe03 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 12 Nov 2020 00:16:18 +0100
-Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
- is not available
-
-Since commit [1] in cpython, an exception is raised when an encryption method
-is not available. This eception is handled only if errno is set to EINVAL by
-crypt() but uClibc-ng doesn't set errno in crypt() [2].
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/830981961
-https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979
-
-[1] https://github.com/python/cpython/commit/0d3fe8ae4961bf551e7d5e42559e2ede1a08fd7c
-[2] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Daniel: updated for 3.10.7]
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
----
- Lib/crypt.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/crypt.py b/Lib/crypt.py
-index de4a14a3884..ba482487a7a 100644
---- a/Lib/crypt.py
-+++ b/Lib/crypt.py
-@@ -98,7 +98,9 @@ def _add_method(name, *args, rounds=None):
-         result = crypt('', salt)
-     except OSError as e:
-         # Not all libc libraries support all encryption methods.
--        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS}:
-+        # Not all libc libraries set errno when encryption method is not
-+        # available.
-+        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS} or e.errno == 0:
-             return False
-         raise
-     if result and len(result) == method.total_size:
--- 
-2.44.0
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 962d32b5d9..598164dca6 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3118/
-md5  b353b8433e560e1af2b130f56dfbd973  Python-3.11.8.tar.xz
+# From https://www.python.org/downloads/release/python-3123/
+md5  d68f25193eec491eb54bc2ea664a05bd  Python-3.12.4.tar.xz
 # Locally computed
-sha256  9e06008c8901924395bc1da303eac567a729ae012baa182ab39269f650383bb3  Python-3.11.8.tar.xz
+sha256  f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554  Python-3.12.4.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 86fa3b970d..a82bc47a57 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION_MAJOR = 3.12
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -22,21 +22,25 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-codecs-cjk \
-	--disable-nis \
-	--enable-unicodedata \
 	--disable-test-modules \
-	--disable-idle3 \
-	--disable-uuid \
-	--disable-ossaudiodev
+	--disable-idle3
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
 # python is called.
-# Make python believe we don't have 'hg', so that it doesn't try to
-# communicate over the network during the build.
+# TODO: nis and ossaudiodev modules will be dropped in 3.13: https://peps.python.org/pep-0594/
 HOST_PYTHON3_CONF_ENV += \
-	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	py_cv_module_unicodedata=yes \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a \
+	py_cv_module__uuid=n/a \
+	py_cv_module_nis=n/a \
+	py_cv_module_ossaudiodev=n/a
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
@@ -50,7 +54,7 @@ HOST_PYTHON3_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
 else
-HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
@@ -62,7 +66,9 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON3_CONF_OPTS += --disable-openssl
+HOST_PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 PYTHON3_INSTALL_STAGING = YES
@@ -76,13 +82,14 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
-PYTHON3_CONF_OPTS += --disable-berkeleydb
+PYTHON3_CONF_ENV += py_cv_module__dbm=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
+PYTHON3_CONF_OPTS += --with-readline
 PYTHON3_DEPENDENCIES += readline
 else
-PYTHON3_CONF_OPTS += --disable-readline
+PYTHON3_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
@@ -93,9 +100,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
 PYTHON3_DEPENDENCIES += mpdecimal
-PYTHON3_CONF_OPTS += --with-libmpdec=system
+PYTHON3_CONF_OPTS += --with-system-libmpdec
 else
-PYTHON3_CONF_OPTS += --with-libmpdec=none
+PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
@@ -115,51 +122,58 @@ ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
 PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
-PYTHON3_CONF_OPTS += --disable-openssl
+PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-PYTHON3_CONF_OPTS += --disable-codecs-cjk
+PYTHON3_CONF_ENV += \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-PYTHON3_CONF_OPTS += --disable-unicodedata
+PYTHON3_CONF_ENV += py_cv_module_unicodedata=n/a
 endif
 
 # Disable auto-detection of uuid.h (util-linux)
 # which would add _uuid module support, instead
 # default to the pure python implementation
-PYTHON3_CONF_OPTS += --disable-uuid
+PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-PYTHON3_CONF_OPTS += --disable-bzip2
+PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
 else
-PYTHON3_CONF_OPTS += --disable-xz
+PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 else
-PYTHON3_CONF_OPTS += --disable-zlib
+PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes
+	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a
 
 # GCC is always compliant with IEEE754
 ifeq ($(BR2_ENDIAN),"LITTLE")
@@ -168,12 +182,6 @@ else
 PYTHON3_CONF_ENV += ac_cv_big_endian_double=yes
 endif
 
-# uClibc is known to have a broken wcsftime() implementation, so tell
-# Python 3 to fall back to strftime() instead.
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
-endif
-
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 PYTHON3_DEPENDENCIES += gettext
 endif
@@ -186,7 +194,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
diff --git a/utils/genrandconfig b/utils/genrandconfig
index fb493f3f31..dbde656417 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -275,6 +275,13 @@ async def fixup_config(sysinfo, configfile):
        'BR2_TOOLCHAIN_BUILDROOT=y\n' in configlines:
         return False
 
+    # On xtensa, python needs headers >= 3.17, but propagating that to all packages
+    # is a bit tedious, so just catch it here.
+    if 'BR2_XTENSA_CUSTOM=y\n' in configlines and \
+       'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
+       'BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=y\n' not in configlines:
+        return False
+
     if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
         configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
         configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
