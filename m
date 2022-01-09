Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D867400F3;
	Sun,  9 Jan 2022 14:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q191IzsPYros; Sun,  9 Jan 2022 14:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B61400FE;
	Sun,  9 Jan 2022 14:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1591BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB97560B3B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxE3A93nMnEN for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE14360B24
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F34A7817B8; Sun,  9 Jan 2022 14:42:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65054d1a1964548a72c320b075cb20a122117952
X-Git-Newrev: 0d9b84b7a83fef1048a026a3d1804c8b32a0990d
X-Patchwork-Hint: ignore
Message-Id: <20220109144257.F34A7817B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: invoke systemd-tmpfilesd
 on final image
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d9b84b7a83fef1048a026a3d1804c8b32a0990d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Especially for read-only filesystems it is helpful to
pre-create all folders for non-volatile paths.

This needs to run under fakeroot to allow setting
uids/gids/perms for the target fs.

systemd-tmpfilesd supports specifiers and target rootfs,
but some specifiers resolve to information from the host,
it is necessary to specially handle (skip) entries that
contain problematic specifiers.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/fakeroot_tmpfiles.sh | 59 ++++++++++++++++++++++++++++++++++++
 package/systemd/systemd.mk           |  8 ++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/systemd/fakeroot_tmpfiles.sh
new file mode 100755
index 0000000000..9498638f0b
--- /dev/null
+++ b/package/systemd/fakeroot_tmpfiles.sh
@@ -0,0 +1,59 @@
+#!/bin/sh
+#
+# The systemd-tmpfiles has the ability to grab information
+# from the filesystem (instead from the running system).
+#
+# tmpfs directories (/tmp, /proc, ...) are skipped since they're not
+# relevant for the rootfs image.
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
+    HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
+
+[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
+    { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
+
+${HOST_SYSTEMD_TMPFILES} --no-pager --cat-config --root="$1" |
+    sed -e '/^[[:space:]]*#/d' -e 's,^[[:space:]]*,,' -e '/^$/d' |
+    while read -r line; do
+        # it is allowed to use quotes around arguments,
+        # so let the shell pack the arguments
+        eval "set -- $line"
+
+        # dont output warnings for directories we dont process
+        [ "${2#/dev}" = "${2}" ] && [ "${2#/proc}" = "${2}" ] &&
+            [ "${2#/run}" = "${2}" ] && [ "${2#/sys}" = "${2}" ] &&
+            [ "${2#/tmp}" = "${2}" ] && [ "${2#/mnt}" = "${2}" ] ||
+            continue
+
+        # blank out all specs that are ok to use,
+        # test if some remain. (Specs up to date with v250)
+        if echo "$2 ${7-}" | sed -e 's,%[%BCEgGhLMosStTuUVwW],,g' | grep -v -q '%'; then
+            # no "bad" specifiers, pass the line unmodified
+            eval "printf '%s\n' '$line'"
+        else
+            # warn
+            eval "printf 'ignored spec: %s\n' '$line' 1>&2"
+        fi
+    done |
+    TMPDIR= TEMP= TMP= ${HOST_SYSTEMD_TMPFILES} --create --boot --root="$1" \
+        --exclude-prefix=/dev --exclude-prefix=/proc --exclude-prefix=/run \
+        --exclude-prefix=/sys --exclude-prefix=/tmp --exclude-prefix=/mnt \
+        -
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7bf8018438..4cf8dd5707 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -709,6 +709,12 @@ define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
+define SYSTEMD_CREATE_TMPFILES_HOOK
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+		$(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
+
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef
@@ -783,7 +789,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dvconsole=false \
 	-Dquotacheck=false \
 	-Dsysusers=false \
-	-Dtmpfiles=false \
+	-Dtmpfiles=true \
 	-Dimportd=false \
 	-Dhwdb=false \
 	-Drfkill=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
