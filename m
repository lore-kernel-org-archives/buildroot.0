Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3251FE743EE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E18CC83C09;
	Fri, 29 Sep 2023 07:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18CC83C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gTztkw55hEq; Fri, 29 Sep 2023 07:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC71783C0A;
	Fri, 29 Sep 2023 07:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC71783C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F07B91BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C941041865
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C941041865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qi-ep_ESbGci for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0EF74155F
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0EF74155F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC15782D97; Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 09:11:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce17f93e828a07292e03653be04a49480250f23f
X-Git-Newrev: e37ee5acdcebb59c0bcc89eca69540cea2ed441d
X-Patchwork-Hint: ignore
Message-Id: <20230929071414.BC15782D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/post-image.sh: generate
 genimage config from template if not present
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

commit: https://git.buildroot.net/buildroot/commit/?id=e37ee5acdcebb59c0bcc89eca69540cea2ed441d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi genimage configurations are all identical, except for the boot
partition files, which include:

- Device tree files (*.dtb)
- rpi-firmware files (rpi-firmware/*)
- Kernel image (Image/zImage)

All of these are quite simple to figure out programmatically based on the
content of BINARIES_DIR, so extend post-image.sh to fall back to generating
a genimage configuration based on genimage.cfg.in if a board specific one
does not exist.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage.cfg.in | 25 +++++++++++++++++++++++++
 board/raspberrypi/post-image.sh   | 17 +++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/board/raspberrypi/genimage.cfg.in b/board/raspberrypi/genimage.cfg.in
new file mode 100644
index 0000000000..fd38b86a0c
--- /dev/null
+++ b/board/raspberrypi/genimage.cfg.in
@@ -0,0 +1,25 @@
+image boot.vfat {
+	vfat {
+		files = {
+#BOOT_FILES#
+		}
+	}
+
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 6cad20fb9e..9b9eac972b 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -7,6 +7,23 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+# generate genimage from template if a board specific variant doesn't exists
+if [ ! -e "${GENIMAGE_CFG}" ]; then
+	GENIMAGE_CFG="${BINARIES_DIR}/genimage.cfg"
+	FILES=()
+
+	for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
+		FILES+=( "${i#${BINARIES_DIR}/}" )
+	done
+
+	KERNEL=$(sed -n 's/^kernel=//p' "${BINARIES_DIR}/rpi-firmware/config.txt")
+	FILES+=( "${KERNEL}" )
+
+	BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
+	sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${BOARD_DIR}/genimage.cfg.in" \
+		> "${GENIMAGE_CFG}"
+fi
+
 # Pass an empty rootpath. genimage makes a full copy of the given rootpath to
 # ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
 # space. We don't rely on genimage to build the rootfs image, just to insert a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
