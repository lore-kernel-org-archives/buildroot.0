Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7033C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9732182093;
	Tue,  8 Aug 2023 18:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9732182093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXZECsmrD3xL; Tue,  8 Aug 2023 18:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B75820F2;
	Tue,  8 Aug 2023 18:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B75820F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80F1D1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B29E60DF4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B29E60DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24M3vdfKbRDg for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:52:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF5760D80
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF5760D80
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3915BA4C10EA;
 Tue,  8 Aug 2023 20:51:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnQ-0005AS-0s;
 Tue, 08 Aug 2023 20:51:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:50:52 +0200
Message-Id: <20230808185108.3787835-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520669;
 bh=nC2XtM3qUXUJ4c/qb+phdQnZNxmAZ9W1a6NoNmdkVeg=;
 h=From:To:Cc:Subject:Date:From;
 b=aUcJ+qeqEEb7aL7wH8860K+fIVKqnRM4DtUt2ecP0FIeDVtbWs/Gc0Dr0kju1ymrk
 5h3TwjJJLeA74jjFTC08xxFPwaCO/4nOVpgev+oExGvn9mnvRfGEqOC7qFQzVOjik3
 OJm+1fYvCkQRZLDFMCZyU2iZE7XIkJuvOAg6yaDwWTaGQn8rO8Vzb34wiyDcsFgljh
 pf0mWbsyZmGbCds13nWNu3OaQz1gaaOM6NdND1HZvQqr1fTWTnfvUMIAgyU5R9UtZy
 HTZvetrPWd2sjQB7RP5fMJmOvLYHVBYqjNJrhbl42OuWyx0wVUres2KH9O6rWWstoA
 UFBmOeyjfApdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=aUcJ+qeq
Subject: [Buildroot] [PATCH/next 00/16] package/python3: Update
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

python 3.12, currently at rc1, will removed toplevel setup.py
https://github.com/python/cpython/commit/81dca70d704d0834d8c30580e648a973250b2973
so our patches using DISABLED_EXTENSIONS need to be adjusted.

Fortunately the build system of python 3.11 already contains a mechanism
to en-/disable most modules so we can update the current package which
will make the bump to 3.12 easier. In order remove our own code we need
to backport three new patches from the 3.12 branch.

Regards, Bernd


Bernd Kuhls (16):
  package/berkeleydb: add option for historic dbm interface
  package/python3: berkeleydb support needs the dbm interface
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
  package/python3: use upstream build system to disable tk module
  package/python3: use upstream build system to disable sqlite3 module
  package/python3: Remove infrastructure to disable the build of certain
    extensions

 package/berkeleydb/Config.in                  |   5 +
 package/berkeleydb/berkeleydb.mk              |   1 +
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
 ...d-an-option-to-disable-the-tk-module.patch |  77 --
 ...p-CC-print-multiarch-output-for-mus.patch} |   0
 ...-option-to-disable-the-curses-module.patch |  61 --
 ...fix-building-on-older-distributions.patch} |   0
 .../0016-Add-an-option-to-disable-expat.patch |  82 --
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -
 ...17-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++
 .../0018-Add-an-option-to-disable-NIS.patch   |  33 -
 .../0018-Port-_ctypes-to-PY_STDLIB_MOD.patch  | 441 +++++++++++
 ...Add-an-option-to-disable-unicodedata.patch |  30 -
 ...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 ++++++++++++++++++
 ...021-Add-an-option-to-disable-decimal.patch |  54 --
 ...on-to-disable-the-ossaudiodev-module.patch |  30 -
 ...an-option-to-disable-openssl-support.patch |  30 -
 ...ption-to-disable-the-readline-module.patch |  30 -
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -
 ...Add-an-option-to-disable-uuid-module.patch |  33 -
 ...ion-to-disable-the-berkeleydb-module.patch |  30 -
 package/python3/Config.in                     |   1 +
 package/python3/python3.mk                    |  79 +-
 36 files changed, 1507 insertions(+), 763 deletions(-)
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
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0014-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0015-fix-building-on-older-distributions.patch} (100%)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0016-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
 create mode 100644 package/python3/0017-Port-_dbm-module-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
 create mode 100644 package/python3/0018-Port-_ctypes-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
 create mode 100644 package/python3/0019-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
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
