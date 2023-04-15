Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4561FC77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 07:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8920A84463;
	Sat, 15 Apr 2023 07:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8920A84463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IY95vQ4n4SP; Sat, 15 Apr 2023 07:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4715843FF;
	Sat, 15 Apr 2023 07:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4715843FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24F5B1BF28B
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 07:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F23D960BD1
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 07:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23D960BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVcUbLBrBKeR for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 07:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3C9E60BC5
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 07:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C9E60BC5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCDA983918; Sat, 15 Apr 2023 07:10:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 09:06:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e90591b22caedfe72c87a8e3315ce8da6d1a4a9
X-Git-Newrev: a94014898909f4538b106d21a5399ef7cc3608eb
X-Patchwork-Hint: ignore
Message-Id: <20230415071014.CCDA983918@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu: restore readme globbing
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

commit: https://git.buildroot.net/buildroot/commit/?id=a94014898909f4538b106d21a5399ef7cc3608eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QEMU board's post-image script will glob through various
`readme.txt` files for an appropriate command line to use. Recent linter
changes [1] prevents this from happening, and results in the following
build error:

    >>>   Executing post-image script board/qemu/post-image.sh
    sed: can't read board/qemu/*/readme.txt: No such file or directory

Reverting part of the shellcheck fixes for the README file arguments and
marking a linter exception.

[1]: b32d7c99c64d6dcb7a68036a7abfa86b8b558627

Signed-off-by: James Knight <james.d.knight@live.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998@free.fr: also reinstate plural to the variable name]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 763287ca39..fe46d0d4af 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -2,7 +2,7 @@
 
 QEMU_BOARD_DIR="$(dirname "$0")"
 DEFCONFIG_NAME="$(basename "$2")"
-README_FILE="${QEMU_BOARD_DIR}/*/readme.txt"
+README_FILES="${QEMU_BOARD_DIR}/*/readme.txt"
 START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
 
 if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
@@ -12,7 +12,8 @@ fi
 
 # Search for "# qemu_*_defconfig" tag in all readme.txt files.
 # Qemu command line on multilines using back slash are accepted.
-QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' \ "${README_FILE}")"
+# shellcheck disable=SC2086 # glob over each readme file
+QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' ${README_FILES})"
 
 if [ -z "${QEMU_CMD_LINE}" ]; then
     # No Qemu cmd line found, can't test.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
