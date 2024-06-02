Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52493C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EAA81F2B;
	Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkJXNEIBK6UK; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A112582125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A112582125;
	Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5A841BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D404C606EA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYXV7IfOaZxd for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86B7E606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B7E606A9
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86B7E606A9
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-351da5838fcso3640793f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360791; x=1717965591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlCZEIg0Youc+cNxoDrQrx2ksoXtens4+mBRCH95jGM=;
 b=EUkGukxqr3WipnrOOJWoA26jpOmVUKIP/8dJ0sQd/pTH3QJ4RBgVy1C9iC8C4vSKLT
 ErYWfqW+Cec+wzTvo3Vh109R6BA9oqVCMuqTMd05FVHlthBuW9gwgX+ZPIqqaPQq7l5y
 zYyF3ycBgE4aiDH+nDziUOx0C+oamnQEKfOM4AlZvQfXYZ17OR6CH/eZ9e3EY+Yy68Ni
 DcdjuAngG1g7R548KNme3ImwtNEc8FiEyqxIWLucOe38gE7BdWQnazoTd/uB4nohQrR5
 su+W8UF6hIC48QmCO9mARpiHBn3j2SrPku+0byjCXJ/SkhrxQNxHOqzugjpgV95vI6/6
 jJxQ==
X-Gm-Message-State: AOJu0YwGCIrPD6lSgY4jLGE0HD8+kPfZxkASTfG6v48CsDgwCnUoLnF4
 UplVqa5dXWZ+5gTRBXzH7HPK8kwm8ildVx+1dOBtFpKBY3CJapPmqgFoVA==
X-Google-Smtp-Source: AGHT+IEqZfVvgNg6Mn3is0RlYQTbYj4Ep3Wd9J9MGOidK12QaGQ5loAdLscJRmE2cR15JPFAQ+JUbg==
X-Received: by 2002:adf:f6d2:0:b0:354:f496:8a96 with SMTP id
 ffacd0b85a97d-35e0f32d113mr4756995f8f.64.1717360791326; 
 Sun, 02 Jun 2024 13:39:51 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f66sm6947900f8f.11.2024.06.02.13.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:50 +0200
Message-ID: <cover.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360791; x=1717965591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=tlCZEIg0Youc+cNxoDrQrx2ksoXtens4+mBRCH95jGM=;
 b=fyM64FZ7buwO03vk49qPdo5loremsMCuiipM99HqJdn1v+2jByqn7g6LRL4y+ROjJI
 16kXNVOhMvyZIDjjKTxKCryxQtygmhjMj3sWnhBLjhTjEYH0Q2lvke2NQ4IS/lSJ8XuD
 lpf8iOpSQXDMPJGBM4+PoK0wQTsaGWF4kmrG1jh/Oz0QiyIECV81fUfAH6FdJnsvXng5
 +/bbvAhYozXy9EziOmk+suFjvL8g8LmoiNzVLKw5CH+AXwnn+HP+Z/+9+kqyJuekr00/
 /3/pXocWVmAqobnjWQx2Zb36LAOa7tUPov/j6Qs4pPwSJtT7MFqtV6Vytynd+qnXDqBL
 TMZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fyM64FZ7
Subject: [Buildroot] [PATCH 00/16] support/download: allow downloading
 unlocked cargo packages (branch yem/cargo-unchained)
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Some maintainers refuse to commit a CArgo.lock in their repository [0],
so there are cargo packages that are unlocked.

However, we currently require that a Cargo.lock be present: we call
"cargo venodor --locked"; if there is no Cargo.lock, cargo fails.

This series adds support for downloading unlocked cargo packages; the
series is articulated in three steps:

 1. preparatory cleanups (shelcheck, readability...)

 2. extend the download infra to pass arbitrary options to the
    post-process helpers; use that to pass the path of the manifest
    instead of using an environment variable

 3. add support for unlocked cargo packages by passing a new option to
    the cargo post-process helper; add documentation and check-package.

 4. (off-by-one) add an RFC-style package to demonstrate the unlocked
    cargo package

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (16):
      package/pkg-download: symplify calling parameters
      package/pkg-generic: split long, unreadable DOWNLOAD line
      utils/check-package: add option to run the test-suite
      utils/checkpackagelib: instruct shellcheck to follow included files
      support/download/dl-wrapper: fix shellcheck errors
      support/download/cargo-post-process: fix shellcheck
      support/download: pass post-process options to post-process helper
      support/download: accept manifest path as a post-process option
      pakcage/pkg-cargo: use post-process opts to pass manifest path
      package/pkg-python: use post-process opts to pass Cargo manifest path
      package/python-bcrypt: use post-process opts to pass Cargo manifest path
      support/download: no longer support BR_CARGO_MANIFEST_PATH in cargo post-process
      docs/manual: rephrase end of vendoring section
      package/pkg-cargo: add support for unlocked packages
      utils/checkpackagelib: add test for default _CARGO_LOCKED
      RFC: package/anvil: new package

 .checkpackageignore                    |  2 --
 docs/manual/adding-packages-cargo.adoc | 27 +++++++++++++++++++++++----
 package/Config.in                      |  1 +
 package/anvil/Config.in                | 20 ++++++++++++++++++++
 package/anvil/anvil.mk                 | 30 ++++++++++++++++++++++++++++++
 package/pkg-cargo.mk                   | 17 +++++++++++++++--
 package/pkg-download.mk                | 33 ++++++++++++++++-----------------
 package/pkg-generic.mk                 | 12 +++++++++---
 package/pkg-python.mk                  |  6 +++---
 package/python-bcrypt/python-bcrypt.mk |  5 ++---
 support/download/cargo-post-process    | 33 ++++++++++++++++++++++++++++-----
 support/download/dl-wrapper            | 26 ++++++++++++++++++--------
 utils/check-package                    | 10 ++++++++++
 utils/checkpackagelib/lib_mk.py        |  8 ++++++++
 utils/checkpackagelib/readme.txt       |  1 +
 utils/checkpackagelib/test_lib_mk.py   | 18 ++++++++++++++++++
 utils/checkpackagelib/tool.py          |  2 +-
 17 files changed, 203 insertions(+), 48 deletions(-)
 create mode 100644 package/anvil/Config.in
 create mode 100644 package/anvil/anvil.mk

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
