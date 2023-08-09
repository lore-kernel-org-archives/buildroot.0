Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17790C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7FE60648;
	Wed,  9 Aug 2023 21:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7FE60648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90bJHxXET-Mn; Wed,  9 Aug 2023 21:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A275460AFF;
	Wed,  9 Aug 2023 21:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A275460AFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E89151BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C233C4063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C233C4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAqTZocl0r2f for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:14:08 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEA72400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEA72400D9
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 43EA6A4C028B;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVF-0001EZ-1R;
 Wed, 09 Aug 2023 23:14:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:47 +0200
Message-Id: <20230809211401.3587177-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=Bi65EOpSfPoLJnjY690U1YCr6QJIrzqIuW2vYBl5CM4=;
 h=From:To:Cc:Subject:Date:From;
 b=Rfe5nNXCMbql4RwqhUn1prguZY6KfiIiK7lQpPcTrSNm/RuPSRc7lYuTwRY1d1OuJ
 LSWvxeFV4M2jkM6d+u09V7WA+LDFn80REkzlnA6CuQ8Ax05T4Tia6zu8sCRxAN8aR/
 9/uypu4P3/brB528dPyaJ4Q/qljFLxop5gjaasRH5h1cRyXhcaL4ZYt67sQ97H0tWD
 4z4nR1G0Gebrr9UI0hBTwHf+38waT4Y67btgsY20XMpH3WUvwhTBQA/vbFyZTleQh6
 5yozMJSl7T+3EY41t4oaq91SZiahSB0LbKTTTnvsEDLX/8dPXk/vQCP3h9YJ9i7cOv
 OY8/Zav22wuCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Rfe5nNXC
Subject: [Buildroot] [PATCH/next v3 00/14] package/python3: Update
 infrastructure to disable the build of certain extensions
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

python 3.12, currently at rc1, will remove toplevel setup.py
https://github.com/python/cpython/commit/81dca70d704d0834d8c30580e648a973250b2973
so our patches using DISABLED_EXTENSIONS need to be adjusted.

Fortunately the build system of python 3.11 already contains a mechanism
to en-/disable most modules so we can update the current package which
will make the bump to 3.12 easier. In order remove our own code we need
to backport three new patches from the 3.12 branch.

Regards, Bernd

v3: fixed tk patch
v2: fixed bug in pyexpat patch, patched .checkpackageignore as well

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

 .checkpackageignore                           |  14 -
 ...re-to-disable-the-build-of-certain-e.patch | 108 ---
 ...-header-paths-for-cross-compilation.patch} |   0
 ...ok-in-usr-lib-termcap-for-libraries.patch} |   0
 ...h => 0005-Don-t-add-multiarch-paths.patch} |   0
 ...> 0006-Abort-on-failed-module-build.patch} |   0
 ...tch => 0007-Serial-ioctl-workaround.patch} |   0
 ...-shebang-of-Python-scripts-for-cros.patch} |   0
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 ...0010-Add-an-option-to-disable-pydoc.patch} |   0
 ...11-Add-an-option-to-disable-lib2to3.patch} |   0
 ... 0012-Add-an-option-to-disable-IDLE.patch} |   0
 ...option-to-disable-the-sqlite3-module.patch |  62 --
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...d-an-option-to-disable-the-tk-module.patch |  33 +-
 ...-option-to-disable-the-curses-module.patch |  61 --
 ...fix-building-on-older-distributions.patch} |   0
 .../0016-Add-an-option-to-disable-expat.patch |  82 --
 ...p-CC-print-multiarch-output-for-mus.patch} |   0
 ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 .../0018-Add-an-option-to-disable-NIS.patch   |  33 -
 ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++
 ...Add-an-option-to-disable-unicodedata.patch |  30 -
 .../0019-Port-_ctypes-to-PY_STDLIB_MOD.patch  | 441 +++++++++++
 ...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 ++++++++++++++++++
 ...021-Add-an-option-to-disable-decimal.patch |  54 --
 ...on-to-disable-the-ossaudiodev-module.patch |  30 -
 ...an-option-to-disable-openssl-support.patch |  30 -
 ...ption-to-disable-the-readline-module.patch |  30 -
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -
 ...Add-an-option-to-disable-uuid-module.patch |  33 -
 ...ion-to-disable-the-berkeleydb-module.patch |  30 -
 package/python3/python3.mk                    |  77 +-
 34 files changed, 1512 insertions(+), 719 deletions(-)
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (100%)
 rename package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch => 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (100%)
 rename package/python3/{0006-Don-t-add-multiarch-paths.patch => 0005-Don-t-add-multiarch-paths.patch} (100%)
 rename package/python3/{0007-Abort-on-failed-module-build.patch => 0006-Abort-on-failed-module-build.patch} (100%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0007-Serial-ioctl-workaround.patch} (100%)
 rename package/python3/{0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch => 0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (100%)
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0010-Add-an-option-to-disable-pydoc.patch} (100%)
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0011-Add-an-option-to-disable-lib2to3.patch} (100%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0012-Add-an-option-to-disable-IDLE.patch} (100%)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0013-python-config.sh-don-t-reassign-prefix.patch} (100%)
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0015-fix-building-on-older-distributions.patch} (100%)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
 create mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
 create mode 100644 package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
 create mode 100644 package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch
 delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
