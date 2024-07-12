Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B03C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CE4C414BA;
	Fri, 12 Jul 2024 07:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4lLUhK6vcc4; Fri, 12 Jul 2024 07:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE0EF412C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE0EF412C2;
	Fri, 12 Jul 2024 07:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2BE1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A555409A6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wV5bBLeQ9llh for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F7C411CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F7C411CD
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13BCB857AA; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 09:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a7c709012f9db0f4dcaee02d611e8d1427226a3
X-Git-Newrev: 86d87085ea2cbbc664715db56eb984ee63a19aa9
X-Patchwork-Hint: ignore
Message-Id: <20240712071537.13BCB857AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/common/imx: add support
 for i.MX 8ULP
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=86d87085ea2cbbc664715db56eb984ee63a19aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
[Arnout: remove newly introduced shellcheck errors]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index b353d506fe..0f5dff674f 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -58,6 +58,25 @@ main ()
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x920000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP=y$" "${BR2_CONFIG}"; then
+		SPL_LOAD_ADDR=0x22020000
+		ATF_LOAD_ADDR=0x20040000
+		"${HOST_DIR}/bin/mkimage_imx8" -commit > "${BINARIES_DIR}/mkimg.commit"
+		cat "${BINARIES_DIR}/u-boot.bin" "${BINARIES_DIR}/mkimg.commit" > "${BINARIES_DIR}/u-boot-hash.bin"
+		rm -f "${BINARIES_DIR}/mkimg.commit"
+		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" "${BR2_CONFIG}"; then
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -ap "${BINARIES_DIR}/tee.bin" a35 0xa6000000 -out "${BINARIES_DIR}/u-boot-atf-container.img"
+		else
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -out "${BINARIES_DIR}/u-boot-atf-container.img"
+		fi
+		if [ -e "${BINARIES_DIR}/m33_image.bin" ]; then
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" -m4 "${BINARIES_DIR}/m33_image.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
+		else
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
+		fi
+		flashbin_size="$(wc -c "${BINARIES_DIR}/imx8-boot-sd.bin" | awk '{print $1}')"
+		pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
+		dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx8-boot-sd.bin" bs=1K seek=${pad_cnt}
 	else
 		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
 		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
