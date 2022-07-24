Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799ACC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07415400F1;
	Sun, 24 Jul 2022 05:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07415400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51KbxqUkmiBj; Sun, 24 Jul 2022 05:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F620400AC;
	Sun, 24 Jul 2022 05:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F620400AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1611BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E9F41716
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E9F41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofee0IoPf_6h for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F281F416ED
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F281F416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:19 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j70so9942586oih.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hi+11o7M3YPWvNvr4D+0IkKOq8xGBimddD+fS5EfTF0=;
 b=4+Ya4kvfRXU0HAmNWJ5d0NUhWMe16UKiAEVsnucxcP+wujPQwUtRMCbsFUgsb2b/uv
 /Cf5ptRKbpWK25X5B00FIQUbbiG5lsoa/WQsAQvrbkKpbG8XFwv67gTLAv+P2h7uaen5
 O7RvgZLfRLZDkR1gVX3Z+DDNYF+l42RTmwIxcZQy49By+Kp6i6z9d9mc2pypAhhBvp1c
 iQVYoKcSLEsewvfb7v0DdzgYqzhgvQToH4WA6nMOP9dKUgNgHInRk7AoGNYh4VBDsUbB
 XC0/JfXeIl+I2UdhyxaoodLEcc0yW5d6N5aDG8r0ebttPLh4QfoJtWhAfXSIiux61EtO
 8gsQ==
X-Gm-Message-State: AJIora+j4RPf99AqAIk0QdBUbya+rGJtwF7Iv+QJVNUTqQ3whE9km1Le
 PS7HIaIxQ4EDxEFivbNnnG2gU1hiwiQ=
X-Google-Smtp-Source: AGRyM1s7AmyyRJztKKxp+Q2jgqbYkaP9sz682MtA7cs6CoRgyBIbsKNRhHYPHz9VasgTSxg7zVqRhg==
X-Received: by 2002:a05:6808:1647:b0:335:4374:487 with SMTP id
 az7-20020a056808164700b0033543740487mr3005706oib.121.1658641818915; 
 Sat, 23 Jul 2022 22:50:18 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:17 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:48:56 -0300
Message-Id: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hi+11o7M3YPWvNvr4D+0IkKOq8xGBimddD+fS5EfTF0=;
 b=Ff4wJvUTlhP3d/MAcHJ6gWWHCxj3IyrueSkn+ZJmNx9I4SIJPaguONwDY05QJ40SSK
 O8O1ewTK97NvlDxttRUC8p73RCs7zU+gftL8JNK8XKKQ2thxC6n1owEpZp96tk2j+RSn
 mlV4vA2FMB1fjr+TzEdBkQJ5g2azLU+UGowFyEl/ObWD2foUXe8Zl2WLv0cIT47rcY9H
 qvLD7L9hi/r96j0Byh094Pt54wz5svx6OhIbP7XjLOAq6MdapT9/ASayeWdl2k7TeV/w
 B6qEAojU/Mu/4F3OqBuCMGDJ0g9LBps4J007gJ5a7zV5hQHNrAunyTv+4j9Jz9ef7xSA
 X+MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ff4wJvUT
Subject: [Buildroot] [PATCH 00/16] Preventing style regressions using
 check-package
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series:
- adds 'make check-package' to the workflow of sending patches to the
  list;
- ensures reproducible results for check-package (that will call
  shellcheck and flake8);
- merges check-flake8 into check-package;
- makes check-package to check all shell scripts in the tree;
- makes check-package to check new directories in the tree;

The results of 'make check-package' already depends on the version of
shellcheck installed on the host and would also depend on the version of
flake8 installed on the host, making the results even less reproducible.
So in order to ensure reproducible results, this series makes
'make check-package' always run inside the docker image.

After merging check-flake8 into check-package, 'make check-package'
takes much more time to run, 1-2 minutes instead of seconds.
But:
 - it ensures reproducible results, since all tests run inside the
   docker image;
 - it simplifies the dependency to the host tools when checking style:
   instead of installing shellcheck, flake8, and a growing number of
   python modules, the developer only needs docker and the docker image;
 - it standardizes the use and the developer must know only about one
   target: 'make check-package' instead of 'make check-flake8', 'make
   check-shellcheck', 'make check-somethingelse';

Patch 1 is completely unrelated, just to update my entries on DEVELOPERS
file before changing it in a later patch.

Patches 2 to 7 ensure reproducible on check-package results, standardize
the check for all files in the tree (yet limited by the list of
directories the check-package script knows that it understand) and add a
fine-grained ignore list for warnings in the tree, making the creation
of a new check_function in check-package to take effect immediately when
added to the tree.

Patch 8 adds 'make check-package' to the default workflow of sending
patches, since its results are now reproducible and depend only on
docker installed on the host.

Patches 9 to 14 expand the list of files check-package do understand:
all shell scripts, all python scripts, and new directories: board,
support, utils.
At the end of this series, this is the output from check-package:
374966 lines processed
0 warnings generated

Patch 15 is an example of fixing an ignored warning (and removing the
entry from the ignored list).

Patch 16 is an example of adding a new check_function to check-package
without fixing all warnings it would generate first.
Notice that even we are adding warnings to the ignore list, any new
patch sent to the list that triggers that new check_funtion will
generate warnings, preventing regressions.

This series intentionally do NOT make pkg-stats to check shell and
python scripts in the tree. pkg-stats remains counting warnings only to
files that do not depend on external tools (shellcheck, flake8) and
therefore already have reproducible results.
This change of checking all files in pkg-stats to count in the Warning
column is technically feasible, but in order to ensure reproducible
results, pkg-stats would need to run inside the docker image, and new
python modules would need to be added to the image: python3-aiohttp,
requests, ... too much complexity, I think.

Regards,
Ricardo

Ricardo Martincoski (16):
  DEVELOPERS: update entries for Ricardo Martincoski
  utils/check-package: improve shellcheck reproducibility
  utils/check-package: create an ignore list
  support/testing: test check-package ignore list
  utils/check-package: add --failed-only
  Makefile: make check-package assume a git tree
  Makefile: run check-* inside docker image
  docs/manual: check-package before submitting patch
  support/docker: add python3-magic
  utils/check-package: check all shell scripts
  utils/check-package: check files in utils/
  utils/check-package: check files in board/
  utils/check-package: check files in support/
  Makefile: merge check-flake8 into check-package
  utils/docker-run: fix shellcheck warnings
  utils/checkpackagelib: warn about $(HOST_DIR)/usr

 .checkpackageignore                           | 1102 +++++++++++++++++
 .shellcheckrc                                 |    0
 DEVELOPERS                                    |   10 +-
 Makefile                                      |   20 +-
 docs/manual/contribute.txt                    |    6 +
 support/docker/Dockerfile                     |    2 +
 support/misc/gitlab-ci.yml.in                 |    4 -
 support/scripts/generate-gitlab-ci-yml        |    2 +-
 support/scripts/pkg-stats                     |    2 +-
 .../utils/br2-external/.checkpackageignore    |    1 +
 .../br2-external/package/.checkpackageignore  |    1 +
 .../package/.checkpackageignore_outdated      |    1 +
 .../tests/utils/br2-external/utils/x-python   |    2 +
 .../utils/br2-external/utils/x-shellscript    |    2 +
 .../testing/tests/utils/test_check_package.py |   65 +
 utils/check-package                           |  122 +-
 utils/checkpackagelib/lib_mk.py               |   12 +
 utils/checkpackagelib/lib_python.py           |    1 +
 utils/checkpackagelib/lib_shellscript.py      |    5 +
 utils/checkpackagelib/lib_sysv.py             |    3 +
 utils/checkpackagelib/test_lib_mk.py          |   23 +
 utils/checkpackagelib/test_tool.py            |   28 +
 utils/checkpackagelib/tool.py                 |   20 +
 utils/docker-run                              |    2 +-
 24 files changed, 1396 insertions(+), 40 deletions(-)
 create mode 100644 .checkpackageignore
 create mode 100644 .shellcheckrc
 create mode 100644 support/testing/tests/utils/br2-external/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
 create mode 100644 support/testing/tests/utils/br2-external/utils/x-python
 create mode 100755 support/testing/tests/utils/br2-external/utils/x-shellscript
 create mode 100644 utils/checkpackagelib/lib_python.py
 create mode 100644 utils/checkpackagelib/lib_shellscript.py

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
