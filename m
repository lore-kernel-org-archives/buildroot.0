Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158A8C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CC641BA8;
	Mon, 10 Apr 2023 21:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CC641BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koL0IcQFdbE3; Mon, 10 Apr 2023 21:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802AC41A32;
	Mon, 10 Apr 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802AC41A32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38DC41BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B49441877
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B49441877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1nx6CLdQqFZ for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857FD408BE
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857FD408BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72E7E83EC5; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:16:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b32d7c99c64d6dcb7a68036a7abfa86b8b558627
X-Git-Newrev: 16c497e0a66d4ab02d0bb6eb689340ba5d5b566f
X-Patchwork-Hint: ignore
Message-Id: <20230410211718.72E7E83EC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/start-qemu.sh.in: rework
 argument handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=16c497e0a66d4ab02d0bb6eb689340ba5d5b566f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides the ability to forward command line options directly to QEMU.
When invoking `start-qemu.sh`, users can forward arguments by adding a
double dash (`--`) into the argument set, and any trailing arguments
will be forwarded into QEMU. For example, `start-qemu.sh -- --help`.

The original implementation supported a "serial-only" command line
argument to help run in a non-graphical mode for some use cases. These
changes try to promote a newly added `--serial-only` argument to drive
this mode; that being said, a `serial-only` argument will still be
accepted for backwards compatibility.

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr:
  - drop the warning: unknown options cause 'exit 1' already, and any
    leftover is explicitly for qemu.
  - use false/true instead of 0/1
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/start-qemu.sh.in | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
index 4dc9bfbb0d..cbc33a76d1 100644
--- a/board/qemu/start-qemu.sh.in
+++ b/board/qemu/start-qemu.sh.in
@@ -4,11 +4,20 @@ BINARIES_DIR="${0%/*}/"
 # shellcheck disable=SC2164
 cd "${BINARIES_DIR}"
 
-if [ "${1}" = "serial-only" ]; then
+mode_serial=false
+while [ "$1" ]; do
+    case "$1" in
+    --serial-only|serial-only) mode_serial=true; shift;;
+    --) shift; break;;
+    *) echo "unknown option: $1" >&2; exit 1;;
+    esac
+done
+
+if ${mode_serial}; then
     EXTRA_ARGS='@SERIAL_ARGS@'
 else
     EXTRA_ARGS='@DEFAULT_ARGS@'
 fi
 
 export PATH="@HOST_DIR@/bin:${PATH}"
-exec @QEMU_CMD_LINE@ ${EXTRA_ARGS}
+exec @QEMU_CMD_LINE@ ${EXTRA_ARGS} "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
