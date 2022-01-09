Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C277C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF37960B3A;
	Sun,  9 Jan 2022 11:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_Fh3DjTWlYW; Sun,  9 Jan 2022 11:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D5D60B35;
	Sun,  9 Jan 2022 11:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29E781BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2646481347
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYIrPXqOTq4P for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 150C281317
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:07:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso5610330wme.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fnWVrKLdiVSIM+HfeYpgQbccoEwVQD8dDY7RpYUvFk4=;
 b=DKZTlxAL+tsVEdd/kvrXq8wd2Y84zDjSFroaApKQRILiF2D00J6w98SZeUCX6RZq0k
 cXHKcm+mche652TD1yn9aJCBF9Byn/zLRSXEaGIAi4XWZlHCSw99SlPpziYgCYK0RaFQ
 BtDHbAfK1HWlIaxcPpmFxgt1jSClXlm3Xq4WODqr2UO4vaxWPTcFCD2OY/nvr9VP67kh
 EdzRsM1f5xH7fpdoa9ai20QJuw39OS9ZGLfonnkxx8HHIVsnZeD7ogEXAhLGb7ogLp/k
 RKFzGAkCz1afy670FyyAyotsVNihtMVym7WpAkZb+U7dmRiUkBcGNXX9ykTNAaSrQOU4
 gtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fnWVrKLdiVSIM+HfeYpgQbccoEwVQD8dDY7RpYUvFk4=;
 b=nn19fe90ZqytIIENi79/QekcoUO/lXdf/wG+qXazrhV/1wlB2gMSvSgM0hj0wD/uaF
 QaZE89tfFWl7fpOpK7ClnEqQg7h22JDxnDBPHz0RSwagQpJdtG/mdTVUy5a0NVLWRdkq
 8MN0bjAkkU3yvWb4usrqcME9NXUHUCM0LEc1JDUppYSADpdia1CADqqkDM0Q7nfvfC6S
 YgtMf03yHtr1/+tK8QxbyN4OGNl0e7ew0/zO1S2dqHm5TKwRiziXNh0Q2tu4wVZ/yAvI
 WYoPqah4C6qxchfHZzsCJeF5vbsBqbfGicoxYaRTJnGqYBs/SSouAxPACUvnhrswI20u
 09JQ==
X-Gm-Message-State: AOAM531qkZOZMWYSdPzKI8bn+cNrqUhoRoDhZINBHSwQCjOaaEtpxyr9
 sYbJkn1MdBZ67uC2Y0JX3PSYRVqrHBQ=
X-Google-Smtp-Source: ABdhPJyCnOt1kliAPAHnUL+B9IfaLOId0WxVM2Xj2komPCKblW/zrChP8vBLyvgrdLSP+B5AzLsENw==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr17975749wmr.78.1641726467377; 
 Sun, 09 Jan 2022 03:07:47 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id g12sm4189411wrd.71.2022.01.09.03.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:07:47 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:07:35 +0100
Message-Id: <20220109110736.3963-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/systemd: invoke systemd-tmpfilesd on
 final image
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
Cc: Norbert Lange <nolange79@gmail.com>, jeremy.rosen@smile.fr,
 yann.morin.1998@free.fr, maxime.hadjinlian@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Especially for read-only filesystems it is helpfull to
pre-create all folders for non-volatile paths.

This needs to run under fakeroot to allow setting
uids/gids/perms for the target fs.

systemd-tmpfilesd supports specifiers and target rootfs,
but some specifiers resolve to information from the host,
it is necessary to specially handle (skip) entries that
contain problematic specifiers.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2
*   add a script to skip/handle specifiers that might
    otherwise take information from the host
v2->v3
*   adopt fakeroot_tmpfiles.sh to current systemd-tmpfilesd (v250),
    several more specifiers are supported directly for our usecase.
---
 package/systemd/fakeroot_tmpfiles.sh | 57 ++++++++++++++++++++++++++++
 package/systemd/systemd.mk           |  9 ++++-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 package/systemd/fakeroot_tmpfiles.sh

diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/systemd/fakeroot_tmpfiles.sh
new file mode 100644
index 0000000000..7e9b02cc0a
--- /dev/null
+++ b/package/systemd/fakeroot_tmpfiles.sh
@@ -0,0 +1,57 @@
+#!/bin/sh
+#
+# The systemd-tmpfiles has the ability to grab information
+# from the filesystem (instead from the running system).
+#
+# However there are a few specifiers that *always* will grab
+# information from the running system examples are %a, %b, %m, %H
+# (Architecture, Boot UUID, Machine UUID, Hostname).
+# 
+# See [1] for historic information.
+#
+# This script will (conservatively) skip tmpfiles lines that have
+# such an specifier to prevent leaking host information.
+#
+# shell expansion is critical to be POSIX compliant,
+# this script wont work with zsh in its default mode for example.
+#
+# The script takes several measures to handle more complex stuff
+# like passing this correctly:
+# f+  "/var/example" - - - - %B\n%o\n%w\n%W%%\n
+#
+# [1] - https://github.com/systemd/systemd/pull/16187
+
+[ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
+  HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
+
+[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
+  { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
+
+${HOST_SYSTEMD_TMPFILES} --no-pager --cat-config --root="$1" |
+  sed -e '/^[[:space:]]*#/d' -e 's,^[[:space:]]*,,' -e '/^$/d' |
+    while read -r line; do
+      # it is allowed to use quotes around arguments,
+      # so let the shell pack the arguments
+      eval "set -- $line"
+
+      # dont output warnings for directories we dont process
+      [ "${2#/dev}" = "${2}" ] && [ "${2#/proc}" = "${2}" ] &&
+        [ "${2#/run}" = "${2}" ] && [ "${2#/sys}" = "${2}" ] &&
+        [ "${2#/tmp}" = "${2}" ] && [ "${2#/mnt}" = "${2}" ] ||
+          continue
+
+      # blank out all specs that are ok to use,
+      # test if some remain. (Specs up to date with v250)
+      if echo "$2 ${7-}" | sed -e 's,%[%BCEgGhLMosStTuUVwW],,g' | grep -v -q '%'; then
+        # no "bad" specifiers, pass the line unmodified
+        eval "printf '%s\n' '$line'"
+      else
+        # warn
+        eval "printf 'ignored spec: %s\n' '$line' 1>&2"
+      fi
+    done |
+\
+TMPDIR= TEMP= TMP= ${HOST_SYSTEMD_TMPFILES} --create --boot --root="$1" \
+  --exclude-prefix=/dev --exclude-prefix=/proc --exclude-prefix=/run --exclude-prefix=/sys \
+  --exclude-prefix=/tmp --exclude-prefix=/mnt \
+  -
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7bf8018438..e136229c8e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -709,10 +709,15 @@ define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
+define SYSTEMD_CREATE_TMPFILES_HOOK
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+		/bin/sh $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
+endef
+
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
@@ -783,7 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dvconsole=false \
 	-Dquotacheck=false \
 	-Dsysusers=false \
-	-Dtmpfiles=false \
+	-Dtmpfiles=true \
 	-Dimportd=false \
 	-Dhwdb=false \
 	-Drfkill=false \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
