Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D24C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1521C41EF2;
	Sat,  6 May 2023 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1521C41EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3by_7c07FD0; Sat,  6 May 2023 21:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E749A41EC1;
	Sat,  6 May 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E749A41EC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAFD31BF27A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 21:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF31E41EC1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF31E41EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4a-tCB3RqZ2m for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 21:46:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE23F41EBE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE23F41EBE
 for <buildroot@buildroot.org>; Sat,  6 May 2023 21:46:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so20392715e9.2
 for <buildroot@buildroot.org>; Sat, 06 May 2023 14:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683409580; x=1686001580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adBurWay2EeDujZh0A8scvBYuuJ9MIggKivkgMvzRUc=;
 b=ACXjKhStz529n3Xs+MnfyvxHnyPUzLjz1mcoJ1akI6z51hhEib8wqaVDr426+esN+E
 jPPgbDxXARAuY4EA0obd7Acsls+JXqLCoWRDEhRf4mimViCo2T4q5c2KnzgnIKqMNRT6
 EIQkHXI2cvHO+l0Dcu8CBh7XJsd3sAFAV786HCU4NlQ/6KBbz6MTfQo3hQAmrDUHHqN7
 WG3KX8365FdNIZLPQK65GI3URpvm5w2lcqErbIAl9lmo0zMNHJcXrZhRsd9EHYbE1XP4
 HfaiYK8orSxP4MLlBjRaMPRQEsM25IFdk8oOdlfhKir+gdBmyYwD5al6ryHgSdV+IoaN
 7qnw==
X-Gm-Message-State: AC+VfDy68+rLRGCvv3W2EE7yH6RrXU7hlfaHDRml1gYtvPSv1wd3uuMr
 QQaIusTxKr9ZePnygraSPUaTZ3eIPAY=
X-Google-Smtp-Source: ACHHUZ4Jpaq/P3gqR7iY5gDD08z+CB58dmaBedOYwjlfOxHyDC4Dy0Wts7xx0RZ55lINx4pVcf9RdQ==
X-Received: by 2002:a7b:cc10:0:b0:3f1:7aff:e14a with SMTP id
 f16-20020a7bcc10000000b003f17affe14amr3494059wmh.39.1683409579811; 
 Sat, 06 May 2023 14:46:19 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003f183127434sm11883650wml.30.2023.05.06.14.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 14:46:19 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 23:46:18 +0200
Message-Id: <20230506214618.373562-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683409580; x=1686001580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=adBurWay2EeDujZh0A8scvBYuuJ9MIggKivkgMvzRUc=;
 b=p141yrVO/Y6V7fWDwE8PPLcKhJqmwsDDISQO6ctTsyGZJ88G7aPuX8PiK2CqYug3c1
 CfJe2CJg2ntgIKdrUFCgYa8WZacKz5qI6wdnPsL9X2XS84Z4gW86BCaQcZgOczzNy99n
 6I3tUhTpCI1Z/auLUfmhrQhlX2UAULJvcr3U2ifYebX2SMktjCiviYw+VFLLCVs1CYMy
 o2l2ARSYLqVhWJKqaBl6sry2baaFmH4igQSoH40Dk02fZ8cE0prypRkl7p922nsMm0gx
 jzYW0hh+cItMWW49mseoVJ257Ru807WDv240ALuC6+SOY/gzgITKQO9+5K8rY5qROyEB
 jO7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p141yrVO
Subject: [Buildroot] [PATCH] utils/docker-run: make it work in
 workdirs/woktrees
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is quite customary to use a single repository with multiple workdirs,
one for each active branch, with either the aging 'git new-workdir' or
the more recent 'git worktree'.

However, in a workdir/worktree, most entries in .git/ are only symlinks
to the actual files in the main repository.

Currently, utils/docker-run only bind-mounts the current working copy.
If that is a workdir/worktree, then it is going to be missing the actual
git data, resulting in errors like:

    $ ./utils/docker-run make check-package
    fatal: not a git repository (or any parent up to mount point [....]/buildroot)
    Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
    No files to check style
    make: *** [Makefile:1257: check-package] Error 1

So, we also bind-mount the actual git directory. If that is a subdir
of the current working copy, then it is already mounted and thus the
bind-mount is superfluous but harmless; for simplicity, we mount it
unconditionally.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/docker-run | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 135a1451b6..17c587a484 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -2,6 +2,8 @@
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
+# GIT_DIR to support workdirs/worktrees
+GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
 # shellcheck disable=SC2016
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
@@ -11,6 +13,7 @@ declare -a docker_opts=(
     --rm
     --user "$(id -u):$(id -g)"
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
+    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
     --workdir "${MAIN_DIR}"
 )
 if tty -s; then
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
