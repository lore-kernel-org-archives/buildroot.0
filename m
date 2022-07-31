Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FE4C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27BD417B2;
	Sun, 31 Jul 2022 19:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27BD417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OXwYY4Pnxki; Sun, 31 Jul 2022 19:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B47408F9;
	Sun, 31 Jul 2022 19:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B47408F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A82821BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8335982A7F
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8335982A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au_0Pk1MDL8J for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF4782977
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EF4782977
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:27 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id k129so9309830vsk.2
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=R1YwVVs5Cr5NJ3BzeaXtiSuuH6bFoxRnGTszwArzho8=;
 b=ZgkJbL96/2hYn0NDF+KnikU2uovVYcG0GujMc4d838dJLgLrJTwkAOtuEn4CjjRCQv
 GZaK40G/Ic/Kb5vfCLo0BvUpiXdTJnvGFhEqPLQ7ASvgO9FJv+CxcqyVVPvFwB5E3Xup
 ymTId8doYaEX43rZNeyFAu9yq64a56KzovZ+DFs83dtzJqhUqguoMd20NigH3Mii1s47
 OqvP1/ugSWdiB4iSgfecq0vdvOnUzSsKwiqIuWi9qCOCpUs/BBRUytB3fV77Vm1HoeFT
 Ft//Iyhb9vFIOFYIVgbEsAqbcKOl+6AuiDrPuPUmQzDi32xzM4/RsuKIhysMH1k4QHkt
 Og/Q==
X-Gm-Message-State: AJIora97BlGDX8qMbCJ+E4EXoyRIC4PdbFOMvD1xZitAPjc6D6DU8NHx
 5LM7ZGP9RCA+asdgGFiixYc8nza0ZDA=
X-Google-Smtp-Source: AGRyM1t0rnHxi+LATa5uGeORI/N3Vubi3HiknLWFNS1O5b6jPb4LQYtd0vbbLFmBU9QmgYSADxR9xQ==
X-Received: by 2002:a05:6102:f0b:b0:35e:e757:838c with SMTP id
 v11-20020a0561020f0b00b0035ee757838cmr4695433vss.8.1659296186265; 
 Sun, 31 Jul 2022 12:36:26 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:24 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:21 -0300
Message-Id: <20220731193521.1217825-15-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=R1YwVVs5Cr5NJ3BzeaXtiSuuH6bFoxRnGTszwArzho8=;
 b=IorX7mcyjuMadDabvNB1mUHXpyr3ftTLelIDcZt02LNn9b3OjyUogxSqoOuvJR/KDP
 SRL98TbI2ttNq9c9l8rPmSCuWt7MCKpeqtA8XjiX4CCYI4QHaIJHhCPTBHcyt59am9oA
 1ko5p72jXylVCJ56jpT9BSw/ie1NMbzbfsNRGMszbQCEjp7J0eKIhCPE4ice1OEEVO7i
 yiJf/NbzJ4KfJQgjCTVYhLmMWKtNR+pBeuU3bXMlNE4nO1vCvHY+P2dnlL7+EV5Z2lnm
 09Bvql3iIhbLrA+vvU9CSh6ghlFMLPdlmOUfqIGOXW3nOsUdiRJqq3XqRVv0tbk47z2d
 uXwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IorX7mcy
Subject: [Buildroot] [RFC 14/14] utils/git_hooks: new script
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

Add a pre-commit hook that can be used by any buildroot developer to
prevent local commits that introduce warnings that check-package would
catch.
It can also be used by maintainers.
This hook checks only the files added/changed by the commit, so it runs
fast.
It also skips the check when working in branches that do not have this
infra.
But when there is a change to check-package itself in the commit being
performed, the shole tree is checked, since new warnings in the tree can
occur.

At same time, add an option -T to utils/docker-run so docker can run
without a tty, otherwise calling it from inside the commit hook would
lead to this error:
 the input device is not a TTY

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - new patch, only a RFC!

Please someone do a thorough review on this patch.
Last time I wrote a pre-commit hook was more than 10 years ago. :)

Output from local tests:

$ git checkout origin/2022.05.x
$ echo >> utils/check-package
$ git add -u
$ git commit -m 'another branch'
check-package will run in the full tree...
the input device is not a TTY
the input device is not a TTY
check-package SKIPPED for commit.
[detached HEAD aaf6ab603a] another branch
 1 file changed, 1 insertion(+)
$

$ git checkout make-check-package-standardize-flake8
$ echo >> utils/check-package
$ git add -u
$ git commit -m 'check full tree'
check-package will run in the full tree...
utils/check-package:0: run 'flake8' and fix the warnings
check-package FAILED for commit.
$

$ git checkout make-check-package-standardize-flake8
$ git rm support/libtool/buildroot-libtool-v2.4.patch
$ git commit -m 'check full tree'
check-package will run in the full tree...
Commit successfully checked with check-package.
[make-check-package-standardize-flake8 b761eccc68] check full tree
 1 file changed, 89 deletions(-)
 delete mode 100644 support/libtool/buildroot-libtool-v2.4.patch
$
 # notice the entry on .checkpackageignore remains for deleted files
 # but it can be removed from time to time by using:
 # $ utils/docker-run make .checkpackageignore

$ git checkout make-check-package-standardize-flake8
$ sed -e 's,  , ,g' -i package/atop/atop.hash
$ git add -u
$ git commit -m 'only changed'
package/atop/atop.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)
package/atop/atop.hash:5: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)
check-package FAILED for commit.
$

$ git checkout make-check-package-standardize-flake8
$ cp package/busybox/S02sysctl package/busybox/S02sysctl2
$ git add package/busybox/S02sysctl2
$ git commit -m 'only added'
package/busybox/S02sysctl2:0: DAEMON variable not defined (http://nightly.buildroot.org/#adding-packages-start-script)
check-package FAILED for commit.
$
---
 DEVELOPERS                 |  1 +
 utils/docker-run           | 13 ++++++++++-
 utils/git_hooks/pre-commit | 46 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 utils/git_hooks/pre-commit

diff --git a/DEVELOPERS b/DEVELOPERS
index 88e0d02c69..5908ca7f33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2499,6 +2499,7 @@ F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
 F:	utils/docker-run
+F:	utils/git_hooks/
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
diff --git a/utils/docker-run b/utils/docker-run
index f42dc33d0e..bcddcd5a1b 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -1,12 +1,23 @@
 #!/usr/bin/env bash
 set -o errexit -o pipefail
+
+tty="-t"
+while getopts "T" OPT; do
+    case "${OPT}" in
+    T) tty=;;
+    *) exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
 # shellcheck disable=SC2016
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
-exec docker run -it --rm \
+# shellcheck disable=SC2086
+exec docker run -i ${tty} --rm \
     --user "$(id -u)":"$(id -g)" \
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
     --workdir "${MAIN_DIR}" \
diff --git a/utils/git_hooks/pre-commit b/utils/git_hooks/pre-commit
new file mode 100644
index 0000000000..c8764c4d57
--- /dev/null
+++ b/utils/git_hooks/pre-commit
@@ -0,0 +1,46 @@
+#!/bin/sh
+# In order to prevent commits with check-package warnings, do the following:
+# cp utils/git_hooks/pre-commit .git/hooks/pre-commit
+# chmod +x .git/hooks/pre-commit
+
+# shellcheck disable=SC1091
+. git-sh-setup
+cd_to_toplevel
+
+full_tree=0
+if git diff --cached --name-only HEAD | grep -q '^utils/\(checkpackagelib\|check-package\)'; then
+    full_tree=1
+else
+    removed_typechanged=$(git diff --cached --name-only --diff-filter=acmr HEAD | wc -l)
+    if [ "$removed_typechanged" != 0 ]; then
+        full_tree=1
+    fi
+fi
+
+if [ $full_tree = 1 ]; then
+    echo "check-package will run in the full tree..."
+    # shellcheck disable=SC2046 disable=SC2006
+    utils/docker-run -T utils/check-package -q `git ls-files`
+    result=$?
+else
+    added_changed_renamed=$(git diff --cached --name-only --diff-filter=ACMR HEAD | wc -l)
+    if [ "$added_changed_renamed" = 0 ]; then
+        echo "No files in commit to be passed to check-package."
+        exit 0
+    fi
+    git diff --cached --name-only --diff-filter=ACMR -z HEAD | \
+        xargs -0 utils/docker-run -T utils/check-package -q
+    result=$?
+fi
+
+if [ $result = 0 ]; then
+    echo "Commit successfully checked with check-package."
+    exit 0
+fi
+if utils/docker-run -T true; then
+    echo "check-package FAILED for commit."
+    exit $result
+else
+    # probably in a branch without 'utils/docker-run -T'
+    echo "check-package SKIPPED for commit."
+fi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
