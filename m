Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F0FC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D29B41B49;
	Mon, 10 Apr 2023 21:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D29B41B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBtC9Gmxi5Ol; Mon, 10 Apr 2023 21:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD36419D6;
	Mon, 10 Apr 2023 21:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD36419D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE291BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BFFA40993
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BFFA40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlviIQDpK0VH for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7849F4056B
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7849F4056B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 649F183EB4; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:16:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a6a11f64b305e272d34e84d1e9e9b61ada24218
X-Git-Newrev: d9b244d8a3c83b39f67444f36b21a88cbaf4547b
X-Patchwork-Hint: ignore
Message-Id: <20230410211718.649F183EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu: define start qemu script
 outside of post-image script
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9b244d8a3c83b39f67444f36b21a88cbaf4547b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following moves the definition of the QEMU board's `start-qemu.sh`
helper script from being inlined in the post-image script into its own
file. This should, in theory, make it easier to maintain the script in
the future.

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr:
  - don't sub-shell in the script
  - merge all 3 sed calls into one
  - create dest file with the sed, don't cp first
  - also substitute HOST_DIR
  - fix shellcheck
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh    | 23 ++++++-----------------
 board/qemu/start-qemu.sh.in | 14 ++++++++++++++
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 88f0413496..57306dd546 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -41,21 +41,10 @@ case ${DEFCONFIG_NAME} in
     ;;
 esac
 
-cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
-	#!/bin/sh
-	(
-	BINARIES_DIR="\${0%/*}/"
-	cd \${BINARIES_DIR}
-
-	if [ "\${1}" = "serial-only" ]; then
-	    EXTRA_ARGS='${SERIAL_ARGS}'
-	else
-	    EXTRA_ARGS='${DEFAULT_ARGS}'
-	fi
-
-	export PATH="${HOST_DIR}/bin:\${PATH}"
-	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
-	)
-_EOF_
-
+sed "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
+    "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
+    "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
+    "s|@HOST_DIR@|${HOST_DIR}|g" \
+    <"${QEMU_BOARD_DIR}/start-qemu.sh.in" \
+    >"${START_QEMU_SCRIPT}"
 chmod +x "${START_QEMU_SCRIPT}"
diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
new file mode 100644
index 0000000000..4dc9bfbb0d
--- /dev/null
+++ b/board/qemu/start-qemu.sh.in
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BINARIES_DIR="${0%/*}/"
+# shellcheck disable=SC2164
+cd "${BINARIES_DIR}"
+
+if [ "${1}" = "serial-only" ]; then
+    EXTRA_ARGS='@SERIAL_ARGS@'
+else
+    EXTRA_ARGS='@DEFAULT_ARGS@'
+fi
+
+export PATH="@HOST_DIR@/bin:${PATH}"
+exec @QEMU_CMD_LINE@ ${EXTRA_ARGS}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
