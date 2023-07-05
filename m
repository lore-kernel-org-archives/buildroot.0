Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A45EEB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CB3417D4;
	Wed,  5 Jul 2023 16:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7CB3417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gDg8V7qvTqZ; Wed,  5 Jul 2023 16:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74EC5416E5;
	Wed,  5 Jul 2023 16:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74EC5416E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88C4F1BF59F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C764148A
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C764148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knWD0b7pjUdj for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:46:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A353404C9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A353404C9
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:46:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD700E000B;
 Wed,  5 Jul 2023 16:46:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qH5e1-002ofC-83; Wed, 05 Jul 2023 18:46:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:46:15 +0200
Message-Id: <20230705164616.671351-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230705164616.671351-1-peter@korsgaard.com>
References: <20230705164616.671351-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] board/raspberrypi/post-image.sh: generate
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rpi genimage configurations are all identical, except for the boot
partition files, which include:

- Device tree files (*.dtb)
- rpi-firmware files (rpi-firmware/*)
- Kernel image (Image/zImage)

All of these are quite simple to figure out programatically based on the
content of BINARIES_DIR, so extend post-image.sh to fall back to generating
a genimage configuration based on genimage.cfg.in if a board specific one
does not exist.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage.cfg.in | 25 +++++++++++++++++++++++++
 board/raspberrypi/post-image.sh   | 17 +++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 board/raspberrypi/genimage.cfg.in

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
