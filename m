Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AF4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CDFA40AED;
	Sat, 23 Jul 2022 13:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CDFA40AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rZooOc8XCFi; Sat, 23 Jul 2022 13:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325DC40537;
	Sat, 23 Jul 2022 13:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 325DC40537
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4471BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6656D60FDE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6656D60FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vO1ob_qbwgLA for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D7260FD1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57D7260FD1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:04:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bu1so9822626wrb.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q/vTygHfv+183jronIJbexwHXtsWXAvCe3jsP65VUvs=;
 b=41wQb3RkSdJl8pdBkh1mI0j9AVkKCgIJDZCaDnh6LPbf5woDpLhcHpKoD/MLwBhdAE
 FopDYjznELxoJgMZHJ6Xm5ztCA6GYW+Ktj0vTfckxFg/QD53YUb/3dWvN+EKaSVNVHTG
 3V2Gp2GVT2vXfnKdEibsg4U2kUQcI+DDQFI8+kVZFSefdOQY9Y46luUWZMSBvAePz5m/
 bwB+VT67pz92guq4DiPfy02gSlpzCB9Pj1b1aaJipVhLqd6CQseC6foH9vw1HGq+CnLV
 NtW4VgHHkvhB/yqtNESNBxKWoZ8XrkEQ6qC+cP4odQE7oZElvmJfsN+DQwVA9C4cGqpq
 lspQ==
X-Gm-Message-State: AJIora/d/U61l0+ZdqC6/IuPbmQp8TOV4pz0mUTA9BdtQ0F6MJmmrNO7
 C9fskUP1bQfWX+pho1HQKgA1O/SjY3I=
X-Google-Smtp-Source: AGRyM1t9Jf5bFf+Lmb3c4uW6JmEZM6/aUIoMTyACk+HTjvMksz+4PI+tkBJ22eDKf/msF0PX+RRWnA==
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id
 u16-20020adfeb50000000b0021e3d133a91mr2673618wrn.484.1658581483364; 
 Sat, 23 Jul 2022 06:04:43 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d550c000000b0021e4fd8e10bsm512075wrv.11.2022.07.23.06.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:04:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:04:41 +0200
Message-Id: <bcc839d2bff29df0a448030a865b4523e3ee89cf.1658581474.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658581474.git.yann.morin.1998@free.fr>
References: <cover.1658581474.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/vTygHfv+183jronIJbexwHXtsWXAvCe3jsP65VUvs=;
 b=M+D+zi7N43cCYhFigdr+emNNQMeU0t6x3shToqQ49lqZ1HuDRhdE/sBLzVQKjp6+xO
 CUiTvOeSEPXA4WbmuQ+7eooPwe7e5RTajOxpijRlcJiWTOl4t9QEnUqXZ8bNowhHIomP
 NJlESefXPrPB+WOZDTkWH39RVV7U00anH1bBjBGJM2kvgAdSMbMg3K8YLo7VfbsaAXaR
 64otIHKLjoJCH4J4+I4gDaVQWXHSjfUaIaJ59iNMm+9MX0xc7FB2pkSyCsrLL5oPR7c2
 OUw3jGoyG+g80YjK/RlXQtEouZhqFxmm1rEJrx8Hb/LFAvOIkxarXsRJ4DIhohPbeFTy
 d/nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M+D+zi7N
Subject: [Buildroot] [PATCH 3/3] package/python3: use the provided pyc
 compiler
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
 Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@xes-inc.com>

Previously, we used support/scripts/pycompile.py to generate the pyc
files for the python libraries.

While the script worked, it did not follow the PEP 3147 layout
requirements for py+pyc deployments.

Now, use the package's own compileall.py script. This will follow
PEP 3147 guidelines. It also supports "legacy" pyc only deployments as
described here:
  https://peps.python.org/pep-3147/#case-4-legacy-pyc-files-and-source-less-imports

With this change, we no longer need to hack support for side-by-side pyc
files because files will be deployed as appropriate.

This also has the added benefit of not requiring python3 on the host to
build host-python3.

Fixes: #14911

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[yann.morin.1998@free.fr:
  - build-tested in a python-less environment
  - build+run-tested with the runtime-test infra
]
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0011-Add-an-option-to-disable-pydoc.patch} |   0
 ...Add-importlib-fix-for-PEP-3147-issue.patch | 105 ------------------
 ...12-Add-an-option-to-disable-lib2to3.patch} |   0
 ...ption-to-disable-the-sqlite3-module.patch} |   0
 ...-an-option-to-disable-the-tk-module.patch} |   0
 ...option-to-disable-the-curses-module.patch} |   0
 ...0016-Add-an-option-to-disable-expat.patch} |   0
 ...Add-an-option-to-disable-CJK-codecs.patch} |   0
 ...> 0018-Add-an-option-to-disable-NIS.patch} |   0
 ...dd-an-option-to-disable-unicodedata.patch} |   0
 ... 0020-Add-an-option-to-disable-IDLE.patch} |   0
 ...21-Add-an-option-to-disable-decimal.patch} |   0
 ...n-to-disable-the-ossaudiodev-module.patch} |   0
 ...n-option-to-disable-openssl-support.patch} |   0
 ...tion-to-disable-the-readline-module.patch} |   0
 ...o-disable-zlib-bzip2-and-xz-modules.patch} |   0
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...Fix-cross-compiling-the-uuid-module.patch} |   0
 ...dd-an-option-to-disable-uuid-module.patch} |   0
 ...fix-building-on-older-distributions.patch} |   0
 ...p-CC-print-multiarch-output-for-mus.patch} |   0
 ...on-to-disable-the-berkeleydb-module.patch} |   0
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 package/python3/python3.mk                    |  47 +-------
 support/scripts/pycompile.py                  |  91 ---------------
 25 files changed, 3 insertions(+), 240 deletions(-)
 rename package/python3/{0012-Add-an-option-to-disable-pydoc.patch => 0011-Add-an-option-to-disable-pydoc.patch} (100%)
 delete mode 100644 package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
 rename package/python3/{0013-Add-an-option-to-disable-lib2to3.patch => 0012-Add-an-option-to-disable-lib2to3.patch} (100%)
 rename package/python3/{0014-Add-option-to-disable-the-sqlite3-module.patch => 0013-Add-option-to-disable-the-sqlite3-module.patch} (100%)
 rename package/python3/{0015-Add-an-option-to-disable-the-tk-module.patch => 0014-Add-an-option-to-disable-the-tk-module.patch} (100%)
 rename package/python3/{0016-Add-an-option-to-disable-the-curses-module.patch => 0015-Add-an-option-to-disable-the-curses-module.patch} (100%)
 rename package/python3/{0017-Add-an-option-to-disable-expat.patch => 0016-Add-an-option-to-disable-expat.patch} (100%)
 rename package/python3/{0018-Add-an-option-to-disable-CJK-codecs.patch => 0017-Add-an-option-to-disable-CJK-codecs.patch} (100%)
 rename package/python3/{0019-Add-an-option-to-disable-NIS.patch => 0018-Add-an-option-to-disable-NIS.patch} (100%)
 rename package/python3/{0020-Add-an-option-to-disable-unicodedata.patch => 0019-Add-an-option-to-disable-unicodedata.patch} (100%)
 rename package/python3/{0021-Add-an-option-to-disable-IDLE.patch => 0020-Add-an-option-to-disable-IDLE.patch} (100%)
 rename package/python3/{0022-Add-an-option-to-disable-decimal.patch => 0021-Add-an-option-to-disable-decimal.patch} (100%)
 rename package/python3/{0023-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0022-Add-an-option-to-disable-the-ossaudiodev-module.patch} (100%)
 rename package/python3/{0024-Add-an-option-to-disable-openssl-support.patch => 0023-Add-an-option-to-disable-openssl-support.patch} (100%)
 rename package/python3/{0025-Add-an-option-to-disable-the-readline-module.patch => 0024-Add-an-option-to-disable-the-readline-module.patch} (100%)
 rename package/python3/{0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (100%)
 rename package/python3/{0027-python-config.sh-don-t-reassign-prefix.patch => 0026-python-config.sh-don-t-reassign-prefix.patch} (100%)
 rename package/python3/{0028-Fix-cross-compiling-the-uuid-module.patch => 0027-Fix-cross-compiling-the-uuid-module.patch} (100%)
 rename package/python3/{0029-Add-an-option-to-disable-uuid-module.patch => 0028-Add-an-option-to-disable-uuid-module.patch} (100%)
 rename package/python3/{0030-fix-building-on-older-distributions.patch => 0029-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 rename package/python3/{0032-Add-an-option-to-disable-the-berkeleydb-module.patch => 0031-Add-an-option-to-disable-the-berkeleydb-module.patch} (100%)
 rename package/python3/{0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 support/scripts/pycompile.py

diff --git a/package/python3/0012-Add-an-option-to-disable-pydoc.patch b/package/python3/0011-Add-an-option-to-disable-pydoc.patch
similarity index 100%
rename from package/python3/0012-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0011-Add-an-option-to-disable-pydoc.patch
diff --git a/package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
deleted file mode 100644
index b18f94ab4e..0000000000
--- a/package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From e2ea659eac1849db471d3c01a0d0af9d6fca2e9a Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Wed, 22 Feb 2017 16:48:49 -0800
-Subject: [PATCH] Add importlib fix for PEP 3147 issue
-
-Python 3 has a new standard for installing .pyc file, called PEP
-3147. Unfortunately, this standard requires both the .py and .pyc
-files to be installed for a Python module to be found. This is quite
-annoying on space-constrained embedded systems, since the .py file is
-technically not required for execution.
-
-This patch changes cache_from_source() and source_from_cache() in
-importlib to get rid of the "__pycache__" directory.
-This effectively disables PEP 3147 for:
-
-* The python standard library
-* Packages built with distutils or setuptools
-* Packages built with automake that use the `py-compile` helper
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Lib/importlib/_bootstrap_external.py | 44 ++++------------------------
- 1 file changed, 5 insertions(+), 39 deletions(-)
-
-diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 25a3f8c0e0..2cb9a9aa52 100644
---- a/Lib/importlib/_bootstrap_external.py
-+++ b/Lib/importlib/_bootstrap_external.py
-@@ -392,8 +392,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
-     a True value is the same as setting 'optimization' to the empty string
-     while a False value is equivalent to setting 'optimization' to '1'.
- 
--    If sys.implementation.cache_tag is None then NotImplementedError is raised.
--
-     """
-     if debug_override is not None:
-         _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -405,10 +403,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
-     path = _os.fspath(path)
-     head, tail = _path_split(path)
-     base, sep, rest = tail.rpartition('.')
--    tag = sys.implementation.cache_tag
--    if tag is None:
--        raise NotImplementedError('sys.implementation.cache_tag is None')
--    almost_filename = ''.join([(base if base else rest), sep, tag])
-+    almost_filename = ''.join([(base if base else rest)])
-     if optimization is None:
-         if sys.flags.optimize == 0:
-             optimization = ''
-@@ -445,46 +440,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
-             head.lstrip(path_separators),
-             filename,
-         )
--    return _path_join(head, _PYCACHE, filename)
-+    return _path_join(head, filename)
- 
- 
- def source_from_cache(path):
-     """Given the path to a .pyc. file, return the path to its .py file.
- 
-     The .pyc file does not need to exist; this simply returns the path to
--    the .py file calculated to correspond to the .pyc file.  If path does
--    not conform to PEP 3147/488 format, ValueError will be raised. If
--    sys.implementation.cache_tag is None then NotImplementedError is raised.
--
-+    the .py file calculated to correspond to the .pyc file.
-     """
--    if sys.implementation.cache_tag is None:
--        raise NotImplementedError('sys.implementation.cache_tag is None')
--    path = _os.fspath(path)
--    head, pycache_filename = _path_split(path)
--    found_in_pycache_prefix = False
--    if sys.pycache_prefix is not None:
--        stripped_path = sys.pycache_prefix.rstrip(path_separators)
--        if head.startswith(stripped_path + path_sep):
--            head = head[len(stripped_path):]
--            found_in_pycache_prefix = True
--    if not found_in_pycache_prefix:
--        head, pycache = _path_split(head)
--        if pycache != _PYCACHE:
--            raise ValueError(f'{_PYCACHE} not bottom-level directory in '
--                             f'{path!r}')
--    dot_count = pycache_filename.count('.')
--    if dot_count not in {2, 3}:
--        raise ValueError(f'expected only 2 or 3 dots in {pycache_filename!r}')
--    elif dot_count == 3:
--        optimization = pycache_filename.rsplit('.', 2)[-2]
--        if not optimization.startswith(_OPT):
--            raise ValueError("optimization portion of filename does not start "
--                             f"with {_OPT!r}")
--        opt_level = optimization[len(_OPT):]
--        if not opt_level.isalnum():
--            raise ValueError(f"optimization level {optimization!r} is not an "
--                             "alphanumeric value")
--    base_filename = pycache_filename.partition('.')[0]
-+    head, filename = _path_split(path)
-+    base_filename = filename.partition('.')[0]
-     return _path_join(head, base_filename + SOURCE_SUFFIXES[0])
- 
- 
--- 
-2.25.1
-
diff --git a/package/python3/0013-Add-an-option-to-disable-lib2to3.patch b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
similarity index 100%
rename from package/python3/0013-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0012-Add-an-option-to-disable-lib2to3.patch
diff --git a/package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
similarity index 100%
rename from package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
diff --git a/package/python3/0015-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
similarity index 100%
rename from package/python3/0015-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
diff --git a/package/python3/0016-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
similarity index 100%
rename from package/python3/0016-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
diff --git a/package/python3/0017-Add-an-option-to-disable-expat.patch b/package/python3/0016-Add-an-option-to-disable-expat.patch
similarity index 100%
rename from package/python3/0017-Add-an-option-to-disable-expat.patch
rename to package/python3/0016-Add-an-option-to-disable-expat.patch
diff --git a/package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
similarity index 100%
rename from package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
diff --git a/package/python3/0019-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
similarity index 100%
rename from package/python3/0019-Add-an-option-to-disable-NIS.patch
rename to package/python3/0018-Add-an-option-to-disable-NIS.patch
diff --git a/package/python3/0020-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
similarity index 100%
rename from package/python3/0020-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0019-Add-an-option-to-disable-unicodedata.patch
diff --git a/package/python3/0021-Add-an-option-to-disable-IDLE.patch b/package/python3/0020-Add-an-option-to-disable-IDLE.patch
similarity index 100%
rename from package/python3/0021-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0020-Add-an-option-to-disable-IDLE.patch
diff --git a/package/python3/0022-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
similarity index 100%
rename from package/python3/0022-Add-an-option-to-disable-decimal.patch
rename to package/python3/0021-Add-an-option-to-disable-decimal.patch
diff --git a/package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 100%
rename from package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
diff --git a/package/python3/0024-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
similarity index 100%
rename from package/python3/0024-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0023-Add-an-option-to-disable-openssl-support.patch
diff --git a/package/python3/0025-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
similarity index 100%
rename from package/python3/0025-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
diff --git a/package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 100%
rename from package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
diff --git a/package/python3/0027-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0027-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0028-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
similarity index 100%
rename from package/python3/0028-Fix-cross-compiling-the-uuid-module.patch
rename to package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
diff --git a/package/python3/0029-Add-an-option-to-disable-uuid-module.patch b/package/python3/0028-Add-an-option-to-disable-uuid-module.patch
similarity index 100%
rename from package/python3/0029-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0028-Add-an-option-to-disable-uuid-module.patch
diff --git a/package/python3/0030-fix-building-on-older-distributions.patch b/package/python3/0029-fix-building-on-older-distributions.patch
similarity index 100%
rename from package/python3/0030-fix-building-on-older-distributions.patch
rename to package/python3/0029-fix-building-on-older-distributions.patch
diff --git a/package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 100%
rename from package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
diff --git a/package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0031-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 100%
rename from package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0031-Add-an-option-to-disable-the-berkeleydb-module.patch
diff --git a/package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 40711dc99c..48d02588ff 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -182,47 +182,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-idle3 \
 	--disable-pyc-build
 
-#
-# Some of CPython's source code is generated using Python interpreter
-# and some helper tools such as "Programs/_freeze_importlib" or
-# "Parser/pgen" (look for regen-* targets in Makefile.pre.in for more
-# info). Normally CPython codebase ships with those files
-# pre-generated, so just regular "make" with no additional steps
-# should be sufficient for a succesfull build, however due to
-# Buildroot's "Add importlib fix for PEP 3147 issue" custom patch we
-# end up modifying "Lib/importlib/_bootstrap_external.py" which means
-# we have to do "regen-importlib" step before building CPython
-# (Importlib is a builtin module that needs to be "frozen"/converted
-# to a C array of bytecode using "Programs/_freeze_importlib")
-#
-# To achive that we add pre-build steps to host-python3 as well as
-# python3 that execute "regen-importlib" target.
-#
-# Unfortunately, for the target Python, "Programs/_freeze_importlib"
-# is built for the target, while we need to run them at build time. So
-# when installing host-python3, we copy them to $(HOST_DIR)/bin...
-#
-define HOST_PYTHON3_MAKE_REGEN_IMPORTLIB
-	$(HOST_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) regen-importlib
-	cp $(@D)/Programs/_freeze_importlib $(HOST_DIR)/bin/python-freeze-importlib
-endef
-
-HOST_PYTHON3_PRE_BUILD_HOOKS += HOST_PYTHON3_MAKE_REGEN_IMPORTLIB
-#
-# ... And then, when building the target python we first buid
-# 'Programs/_freeze_importlib' to force GNU Make to update all of the
-# prerequisites of 'Programs/_freeze_importlib', then copy our stashed
-# "host-usable" version over the one that was just build and then
-# build "regen-importlib" target
-#
-define PYTHON3_MAKE_REGEN_IMPORTLIB
-	$(TARGET_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) Programs/_freeze_importlib
-	cp $(HOST_DIR)/bin/python-freeze-importlib $(@D)/Programs/_freeze_importlib
-	$(TARGET_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) regen-importlib
-endef
-
-PYTHON3_PRE_BUILD_HOOKS += PYTHON3_MAKE_REGEN_IMPORTLIB
-
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
@@ -292,9 +251,9 @@ define PYTHON3_CREATE_PYC_FILES
 	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
-		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(VERBOSE),--verbose) \
-		--strip-root $(TARGET_DIR) \
+		$(PYTHON3_DIR)/Lib/compileall.py \
+		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
+		-s $(TARGET_DIR) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
deleted file mode 100644
index 8774144a90..0000000000
--- a/support/scripts/pycompile.py
+++ /dev/null
@@ -1,91 +0,0 @@
-#!/usr/bin/env python3
-
-"""
-Byte compile all .py files from provided directories. This script is an
-alternative implementation of compileall.compile_dir written with
-cross-compilation in mind.
-"""
-
-import argparse
-import os
-import py_compile
-import re
-import sys
-
-
-def compile_one(host_path, strip_root=None, verbose=False):
-    """
-    Compile a .py file into a .pyc file located next to it.
-
-    :arg host_path:
-        Absolute path to the file to compile on the host running the build.
-    :arg strip_root:
-        Prefix to remove from the original source paths encoded in compiled
-        files.
-    :arg verbose:
-        Print compiled file paths.
-    """
-    if os.path.islink(host_path) or not os.path.isfile(host_path):
-        return  # only compile real files
-
-    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]*\.py$",
-                    os.path.basename(host_path)):
-        return  # only compile "importable" python modules
-
-    if strip_root is not None:
-        # determine the runtime path of the file (i.e.: relative path to root
-        # dir prepended with "/").
-        runtime_path = os.path.join("/", os.path.relpath(host_path, strip_root))
-    else:
-        runtime_path = host_path
-
-    if verbose:
-        print("  PYC  {}".format(runtime_path))
-
-    # will raise an error if the file cannot be compiled
-    py_compile.compile(host_path, cfile=host_path + "c",
-                       dfile=runtime_path, doraise=True)
-
-
-def existing_dir_abs(arg):
-    """
-    argparse type callback that checks that argument is a directory and returns
-    its absolute path.
-    """
-    if not os.path.isdir(arg):
-        raise argparse.ArgumentTypeError('no such directory: {!r}'.format(arg))
-    return os.path.abspath(arg)
-
-
-def main():
-    parser = argparse.ArgumentParser(description=__doc__)
-    parser.add_argument("dirs", metavar="DIR", nargs="+", type=existing_dir_abs,
-                        help="Directory to recursively scan and compile")
-    parser.add_argument("--strip-root", metavar="ROOT", type=existing_dir_abs,
-                        help="""
-                        Prefix to remove from the original source paths encoded
-                        in compiled files
-                        """)
-    parser.add_argument("--verbose", action="store_true",
-                        help="Print compiled files")
-
-    args = parser.parse_args()
-
-    try:
-        for d in args.dirs:
-            if args.strip_root and ".." in os.path.relpath(d, args.strip_root):
-                parser.error("DIR: not inside ROOT dir: {!r}".format(d))
-            for parent, _, files in os.walk(d):
-                for f in files:
-                    compile_one(os.path.join(parent, f), args.strip_root,
-                                args.verbose)
-
-    except Exception as e:
-        print("error: {}".format(e))
-        return 1
-
-    return 0
-
-
-if __name__ == "__main__":
-    sys.exit(main())
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
