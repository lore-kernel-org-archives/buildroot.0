Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A752C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1705140306;
	Mon, 10 Apr 2023 21:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1705140306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lppLKhf8VRvw; Mon, 10 Apr 2023 21:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69CF41977;
	Mon, 10 Apr 2023 21:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E69CF41977
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A30A61BF3DA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AF13408DD
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF13408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGgQ0XSp7Y5P for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BECF417C7
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BECF417C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A1C483ED4; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16c497e0a66d4ab02d0bb6eb689340ba5d5b566f
X-Git-Newrev: 5de78f181acc53959b0a446a3fb116ecdec13577
X-Patchwork-Hint: ignore
Message-Id: <20230410211718.7A1C483ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/start-qemu.sh.in: support
 launching with host system's qemu
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

commit: https://git.buildroot.net/buildroot/commit/?id=5de78f181acc53959b0a446a3fb116ecdec13577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides the ability to use a host system's QEMU. While a Buildroot
generated QEMU should work for most cases, a developer may wish to use
the system's QEMU for options which may not have been configured in the
Buildroot's QEMU build (e.g. configuring a different display mode).

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr:
  - use false/true instead of 0/1
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/start-qemu.sh.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
index cbc33a76d1..38024b449e 100644
--- a/board/qemu/start-qemu.sh.in
+++ b/board/qemu/start-qemu.sh.in
@@ -5,9 +5,11 @@ BINARIES_DIR="${0%/*}/"
 cd "${BINARIES_DIR}"
 
 mode_serial=false
+mode_sys_qemu=false
 while [ "$1" ]; do
     case "$1" in
     --serial-only|serial-only) mode_serial=true; shift;;
+    --use-system-qemu) mode_sys_qemu=true; shift;;
     --) shift; break;;
     *) echo "unknown option: $1" >&2; exit 1;;
     esac
@@ -19,5 +21,8 @@ else
     EXTRA_ARGS='@DEFAULT_ARGS@'
 fi
 
-export PATH="@HOST_DIR@/bin:${PATH}"
+if ! ${mode_sys_qemu}; then
+    export PATH="@HOST_DIR@/bin:${PATH}"
+fi
+
 exec @QEMU_CMD_LINE@ ${EXTRA_ARGS} "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
