Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3083C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D14AF4158D;
	Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIdgiPZm87rZ; Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D28404BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11D28404BC;
	Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE05B1BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B840784469
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KSkq5EqLLXl for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 118B484468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118B484468
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 118B484468
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:21:59 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso24489621fa.2
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382118; x=1718986918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URwMJ+GRo2QidPfvL3KPJFs0PhpGTgaBhnfj/LVKOz0=;
 b=THJc4JWO1/7YC6Kcpj+ADguG5isIbP0UzaCH9EaDykKTQu7rYJM+jqrLtLMsoe6ETt
 a1enSYAd/HYU9G3kE7dUqkTB8O9PRTNFWJEaS2e5wfnd0kIXpwNvnOWis9YIS+3A99uR
 +4TZ+JqVsq7uZ7u9xR0i9HfdojUl2QQF1KUMkL5YqJ8ZNPuX/KZg2zI/wyRVBAXu7ttn
 xO+Y/PkxtlEQIhpvLd74TtWGxoIWuWy0fhEdoKZssW0cizBogt/pEv5B2LVWVQoCcJGQ
 ecwpvDXzRIEysUus3XKnQYzT7CXlYXmSKwaDuj/LI0LFOCvdxHNXTOBeMqkWzHda0olO
 8GtA==
X-Gm-Message-State: AOJu0Yy80JTpFAO/WSmpN1l8vXKaY1MCDlkNz0lnXJm6T2sH7lU+QdAS
 HfB6JGm370a+pFcLD5Vs0H8lTH1yhL8HTerTE+aEEOyo7F4JlTryj4HZyg==
X-Google-Smtp-Source: AGHT+IGFk9IN8ockQrM9LvFsBrBbN8vaDAgkCi0xr+Asyr6N9jDTZ68X3IqegNl5CxMrq0SaW1fCUg==
X-Received: by 2002:a2e:9210:0:b0:2eb:d9c4:ae1a with SMTP id
 38308e7fff4ca-2ec0e5ffc80mr19783121fa.40.1718382117492; 
 Fri, 14 Jun 2024 09:21:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602efdesm68351575e9.17.2024.06.14.09.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:21:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:56 +0200
Message-ID: <cover.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382118; x=1718986918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=URwMJ+GRo2QidPfvL3KPJFs0PhpGTgaBhnfj/LVKOz0=;
 b=bymp+1iuLfCAvE3wKZoub0fow8CIjzhGoTHUB1V4kSHMNK9LIwHNXdPqmobaqBZ5WS
 iCOgqEXT8HGRP7oc2BU1wYj3h1aTqMShCdMItKNygO/wMMIjagRIpYNhUllUHmZC+IR9
 V2jpnO0m0X5GyleRW62gtahLqW6/kj+1LRbB1oay64yldycuXSJ+4UydyJbLtond6zEx
 KzRNxHlqsEz6vxI2zbkCKrcX3uC8j8SjKu2Bls3MIv1gqqAjAEAVhhrFPoMHAqgmESH1
 RbG5IR5VOM8IrQ1OOuaVX0scsJLhWNm9CL4cIaYCRCUk/h3KL2vCTUZQcPkaOlxgsk+F
 jhEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bymp+1iu
Subject: [Buildroot] [PATCH 0/6] package: bump to python 3.12,
 rust 1.79.0 (branch yem/python3.12)
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series is a follow-up to the previous efforts by Adam, then by
Vincent, at bumping python to version 3.12.

Bumping to python 3.12 requires bumping pydantic-core, so it builds
again against python 3.12. However, it now has a more stringent
requirement on the rust version: when previously it was satisfied with
rust 1.74.1 as we packaged, it now requires at least 1.75.0.

So we also need to bump rust. Instead of just updating to 1.75.0, just
udpate to the latest version, 1.76.0, released just a days ago (the
actual version bump was done the very day it was released upstream,
yeah!).

Updating rust is a pain, because we need to update a lot of hashes, so
introduce a new helper script that does the job. It is inspired by a
previous proposal by James, but completely rewriten to be much simpler
(following the review on the previous patch).

This series has been tested in two ways:

  - by emabling all the python modules, except for scipy which is known
    broken and will be addressed in another series, and all rust
    packages, and doing a build from scratch once with rust-bin, once
    with rust-src; note that host-bindgen and host-sentry-cli have no
    in-tree users, so their builds were manually trigerred as well;

  - running all the runtime tests involving python or rust packages,
    again except for scipy.

Cargo 1.79.0 vendors packages the same 1.74.1 did, so we did not have to
change the hashes of any of the cargo-vendored packages.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Vincent Fazio (1):
      package/python3: bump python to 3.12.4

Yann E. MORIN (5):
      package/sentry-cli: needs pkgconf and openssl
      utils/update-rust: add script to automatically update the rust version
      package/rust: update to 1.79.0
      package/python-web2py: fix build with python 3.12
      package/python-pydantic-core: bump for fixes with python 3.12

 .checkpackageignore                                |  33 +--
 .../python-pydantic-core/python-pydantic-core.hash |   2 +-
 .../python-pydantic-core/python-pydantic-core.mk   |   7 +-
 .../0001-fix-regexen-and-classname.patch           | 294 +++++++++++++++++++++
 package/python-web2py/Config.in                    |   8 +-
 ...1-Make-the-build-of-pyc-files-conditional.patch |  32 +--
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   8 +-
 .../0003-Add-an-option-to-disable-pydoc.patch      |  84 ++++++
 ...ructure-to-disable-the-build-of-certain-e.patch | 108 --------
 ...=> 0004-Add-an-option-to-disable-lib2to3.patch} |  93 +++----
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  31 ---
 ...ch => 0005-Add-an-option-to-disable-IDLE.patch} |  63 ++---
 .../python3/0005-Don-t-add-multiarch-paths.patch   |  37 ---
 .../0006-Abort-on-failed-module-build.patch        |  30 ---
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |  44 +++
 ...Add-option-to-disable-the-sqlite3-module.patch} |  35 ++-
 package/python3/0007-Serial-ioctl-workaround.patch |  33 ---
 .../0008-Add-an-option-to-disable-pydoc.patch      | 102 -------
 ...08-Add-an-option-to-disable-the-tk-module.patch |  81 ++++++
 ...d-an-option-to-disable-the-curses-module.patch} |  39 ++-
 ...h => 0010-Add-an-option-to-disable-expat.patch} |  59 +++--
 ...11-Add-an-option-to-disable-the-tk-module.patch |  77 ------
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |  10 +-
 ...x-cross-compiles-when-host-and-target-us.patch} |  28 +-
 .../0014-Add-an-option-to-disable-CJK-codecs.patch |  30 ---
 .../0015-Add-an-option-to-disable-NIS.patch        |  33 ---
 ...0016-Add-an-option-to-disable-unicodedata.patch |  30 ---
 .../0018-Add-an-option-to-disable-decimal.patch    |  54 ----
 ...-option-to-disable-the-ossaudiodev-module.patch |  30 ---
 ...-Add-an-option-to-disable-openssl-support.patch |  30 ---
 ...-an-option-to-disable-the-readline-module.patch |  30 ---
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  42 ---
 ...0023-Add-an-option-to-disable-uuid-module.patch |  33 ---
 ...n-option-to-disable-the-berkeleydb-module.patch |  30 ---
 ...Clibc-ng-doesn-t-set-errno-when-encryptio.patch |  42 ---
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |  79 +++---
 package/rust-bin/rust-bin.hash                     | 177 +++++--------
 package/rust-bin/rust-bin.mk                       |   2 +-
 package/rust/rust.hash                             |   8 +-
 package/rust/rust.mk                               |   2 +-
 package/rustc/Config.in.host                       |  12 +-
 package/sentry-cli/sentry-cli.mk                   |   2 +-
 utils/genrandconfig                                |   7 +
 utils/update-rust                                  | 143 ++++++++++
 45 files changed, 974 insertions(+), 1186 deletions(-)
 create mode 100644 package/python-web2py/0001-fix-regexen-and-classname.patch
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
 create mode 100755 utils/update-rust

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
