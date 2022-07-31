Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6611EC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E20CF40614;
	Sun, 31 Jul 2022 19:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E20CF40614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-zqWtitjL7J; Sun, 31 Jul 2022 19:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C384B400CE;
	Sun, 31 Jul 2022 19:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C384B400CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E49031BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB67C82977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB67C82977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVCjXRAyGMgq for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944128294A
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 944128294A
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:35:44 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id e3so2537539vkg.4
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lDglVasOe/vU46iUZB2beBTcrD6eOHb7zHiQwoTWZao=;
 b=Jl08iQxnUhVAs05/K4V+hbWSJIbMAWOhUcujf1w79BcUS1PpPULdrm3v/M/j4hVPaC
 kZdIlZ61XnCKrIjEDnwRaZsrns1nBHAiPerSNIBGCIxCRB/SRAIACKl1+Zhrp3tAzjBn
 8/I/3NwJbwZmHujc5FEvG2GCeDaiTVJ6riJSO4IJ951LLHUCy1bVVxHNYiTqYiEsZ4Yo
 sGMWSknaC5mqc059oBJjwoHgxjBk1S586QYk++PjWrgTAlHHmwTbEIrCOe6usRAxhm+P
 AL1BSPQcWZiftp0rC0hEUksI5MzRZBzU/j+r24R+Essx0BoYHElAmNzwK3CHYd/NiZFS
 LwrA==
X-Gm-Message-State: AJIora/fHPFgakM/uFFIeOWBP4TnSJva1YYCZSDm89JX043sJvVtmgHx
 AoM06OC8pdqDnOWxTs6Wpvay1B96uW4=
X-Google-Smtp-Source: AGRyM1sUnB+BKiak80hGYZcr+iivpoSEvAaiZx+nujSv02p/+6pGynHs2Ffp5yQTZesW6wUDTZSRsg==
X-Received: by 2002:a1f:aa8b:0:b0:376:e14b:c10e with SMTP id
 t133-20020a1faa8b000000b00376e14bc10emr4582432vke.19.1659296143380; 
 Sun, 31 Jul 2022 12:35:43 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:41 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:07 -0300
Message-Id: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lDglVasOe/vU46iUZB2beBTcrD6eOHb7zHiQwoTWZao=;
 b=AAPpBNdB2j5yxY6cET2r3oIcAbPhoZJgLwAMVxfe/95UsR6Xwolg0N6T4TguTI8S6p
 EJYp1q5Mz79uLulyrFSFpDJVOV0YXVkkgM3ro1wG2wL2/7PxRZPDT+FrML0FXZHFu3ga
 15S0foRhoLKDflX1qc4jB2MOzAYLsXroWjTMMgEsG7xhjROO200egrQj8V2j66KVMaUZ
 NPG/83z5+0qKBcMENZe4WmuiO6cVSSAQ9cy9VVDG6r/xPeZQQ7fginEs3Hd5kkvev5x8
 iD1yMBSGUMVxwFd9gJQeFPG89VJvsh3iolaX84E+erizBR2kvxAqe5H6zMMIeziPFtP5
 4nfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AAPpBNdB
Subject: [Buildroot] [PATCH v2 00/14] Preventing style regressions using
 check-package v2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Cc: Romain Naour <romain.naour@gmail.com>
Changes v1 -> v2:
  - drop patches already applied
  - drop patch starting a docker container from makefile (after review
    from Romain)
  - reword the manual (Romain)
  - mention utils/docker-run in the manual
  - create a make target to help update .checkpackageignore
  - add a RFC patch for a git pre-commit hook

This series:
- adds 'make check-package' to the workflow of sending patches to the
  list;
- ensures reproducible results for check-package (that will call
  shellcheck and flake8) when called with utils/docker-run;
- merges check-flake8 into check-package;
- makes check-package to check all shell scripts in the tree;
- makes check-package to check new directories in the tree;

The results of 'make check-package' already depends on the version of
shellcheck installed on the host and would also depend on the version of
flake8 installed on the host, making the results even less reproducible.
So in order to ensure reproducible results in local builds, specially
for newcomers, mention in the manual to run
'utils/docker-run make check-package' before sending patches to the
list.

After merging check-flake8 into check-package, 'make check-package'
takes much more time to run, 1-2 minutes instead of seconds.
But:
 - it can run inside the docker image, what ensures reproducible
 results;
 - it simplifies the dependency to the host tools when checking style:
   instead of installing shellcheck, flake8, and a growing number of
   python modules, the developer only needs docker and the docker image;
 - it standardizes the use and the developer must know only about one
   target: 'make check-package' instead of 'make check-flake8', 'make
   check-shellcheck', 'make check-somethingelse';

Patches 1 to 4 standardize the check for all files in the tree (yet
limited by the list of directories the check-package script knows that
it understand) and add a fine-grained ignore list for warnings in the
tree, making the creation of a new check_function in check-package to
take effect immediately when added to the tree.

Patch 5 adds 'utils/docker-run make check-package' to the default
workflow of sending patches, since its results are now reproducible and
depend only on docker installed on the host.

Patches 6 to 11 expand the list of files check-package do understand:
all shell scripts, all python scripts, and new directories: board,
support, utils.
At the end of this series, this is the output:

$ utils/docker-run make check-package
375242 lines processed
0 warnings generated

$ utils/docker-run make .checkpackageignore 
375242 lines processed
1422 warnings generated

Patch 12 is an example of fixing an ignored warning (and removing the
entry from the ignored list).

Patch 13 was in v1 an example of adding a new check_function to
check-package without fixing all warnings it would generate first. But
the fix was already applied.

Patch 14 is a RFC patch adding a git pre-commit hook that triggers
check-package.

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

Ricardo Martincoski (14):
  utils/check-package: decouple adding rules from fixing all intree
    files
  support/testing: test check-package ignore list
  Makefile: add target to update .checkpackageignore
  Makefile: make check-package assume a git tree
  docs/manual: check-package before submitting patch
  support/docker: add python3-magic
  utils/check-package: check all shell scripts
  utils/check-package: check files in utils/
  utils/check-package: check files in board/
  utils/check-package: check files in support/
  Makefile: merge check-flake8 into check-package
  utils/docker-run: fix shellcheck warnings
  utils/checkpackagelib: warn about $(HOST_DIR)/usr
  utils/git_hooks: new script

 .checkpackageignore                           | 340 ++++++++++++++++++
 DEVELOPERS                                    |   1 +
 Makefile                                      |  17 +-
 docs/manual/contribute.txt                    |   6 +
 support/docker/Dockerfile                     |   1 +
 support/misc/gitlab-ci.yml.in                 |   4 -
 support/scripts/generate-gitlab-ci-yml        |   2 +-
 support/scripts/pkg-stats                     |   2 +-
 .../utils/br2-external/.checkpackageignore    |   1 +
 .../br2-external/package/.checkpackageignore  |   1 +
 .../package/.checkpackageignore_outdated      |   1 +
 .../tests/utils/br2-external/utils/x-python   |   2 +
 .../utils/br2-external/utils/x-shellscript    |   2 +
 .../testing/tests/utils/test_check_package.py |  65 ++++
 utils/check-package                           | 124 ++++++-
 utils/checkpackagelib/lib_mk.py               |  12 +
 utils/checkpackagelib/lib_python.py           |   1 +
 utils/checkpackagelib/lib_shellscript.py      |   5 +
 utils/checkpackagelib/lib_sysv.py             |   3 +
 utils/checkpackagelib/test_lib_mk.py          |  23 ++
 utils/checkpackagelib/test_tool.py            |  28 ++
 utils/checkpackagelib/tool.py                 |  20 ++
 utils/docker-run                              |  15 +-
 utils/git_hooks/pre-commit                    |  46 +++
 24 files changed, 686 insertions(+), 36 deletions(-)
 create mode 100644 .checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
 create mode 100644 support/testing/tests/utils/br2-external/utils/x-python
 create mode 100755 support/testing/tests/utils/br2-external/utils/x-shellscript
 create mode 100644 utils/checkpackagelib/lib_python.py
 create mode 100644 utils/checkpackagelib/lib_shellscript.py
 create mode 100644 utils/git_hooks/pre-commit

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
