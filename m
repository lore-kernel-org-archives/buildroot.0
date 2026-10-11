Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEDACA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 889A880C9C;
	Sun, 11 Oct 2026 19:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q__vumW1Kmyk; Sun, 11 Oct 2026 19:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A587380C71
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746153;
	b=hE5IjWhBCgaLqQT0MRiu4+Dd2zeK2WbpcRnhiUcZsJo8ZSRhCl/5r5ZHJoYQxvLdq4jJ
	 0hXj3Vr+FtmMU6cUhKml+MuWcDyUkuuuUiN8VCPKF9ZnnrlcqVSRND0sB1bd5ZS/52MPN
	 lEOSLmqBVRU8QAsDhjf47qgGJB/+wPtuMppMSxnm060TkbDY0r8ImB6SIpARhE6covzcV
	 VJwu38dBG7XzAG5DXjk0lOMo/iWra8gB6G1J1ZwnoGRBL6w8qE3RrDcNP1gpAJObHSaCy
	 twRDsIutQCXwsb2zWVMErrC+0uwWkKdxhur4JESWS3HKIDfFdo8lwRSkx+n3c9RQ9nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=q7msj58yHjEgqInXk0mCsfhInTryGbQasZxKZnWqnTI=;
	b=EIk9eGa2Tp3ROxAgk/3jK40W+6tmF6xI282wSGgwqPF4YXwIqIR8JIfREFd/V3RWc1uk
	 opVtgRJ7hVEhhVVmbP7L+950Ikb5ifDjh9AKgFOu3JqWo6OSHMdLUzFgXKpzAvbpmrekS
	 Yd4N2zHGA0uUnao9ecFNqH2ccHD2hzvF1pW97H+CFzGzxrZWYD6ziUpfCoQYmt/fuJcqx
	 fYEau2uz71+Nqu6ui+RW7u81iLINMeYDafZSJwhFN7fsM3e/n9c7uu4Z6KoEH8Nx8MQgq
	 UwactgFev8TWAhQ6haJrRI2VfVva3DyrwVS7XFNpvqhUHwGr6x7JzfFXWYUZ37B9Szw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746153;
	bh=q7msj58yHjEgqInXk0mCsfhInTryGbQasZxKZnWqnTI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PIroDrSo3GBSRxm2p6GkSt4vzQ8KBKU+kcCbLPN5YjErFNgf4XzoQuXba/VbnQFMV
	 TLfu04/7c+yxT97FIMhlIOovpYeBLr/1rR1BsU/uyzS8Fk/cGgV2MCXrZjDhikMCnq
	 a39J4PsbcMWWGQl1jl1PjikpNwph8NnThma0oJVLFzuEBKs5xXAL9E/0PTwr5phV5O
	 NqAe7CBShOJkrU7OnPDWunUs1SCh7hYRnaeMZBH6uT2KMqZnneW1240gffhxq2EpK7
	 7kjAij9rGnNssh3swei1m9MfqscvPzw8JEeNd/HN7pyyNVtO8jJQp+x4YtR760fqrb
	 hmIMYpfCUtG3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A587380C71;
	Sun, 11 Oct 2026 19:15:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B03BB1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 966C460614
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raGB1Bqv2ET1 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9A7C9605F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746148;
 b=LGsHYL6qUDUHU+ilnRfzuysTug3i0Wt8Q2vJORpJGE7Wj+Vtg9YQO57o/KebmB7oq2sB
 porSVesKBUFemBIOmUgAy87Wqf2OtLz/beFEkbHrcFkUBvWXrC7LeMG1GdF6SctDjVLmg
 uJZOmZibN+oDuie1cmFWUSBrFEzU8jl9bQkIXjeltn4QeYKRh8sIkWDWlEjYXKVQ/9aT3
 SYuC2Au1Z8Iu3kBhLUQ28RieMHMKQN5r8myy3xhHhYJqWumeONOWDGhAbfHkrHVbRsdoU
 I7FFFu6liyqP4nNsxuRbIflPHxY56Zzqn/Fc3O4YgPJS8s7zZzxSqVJ3P/hay76UrEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=agrvj/aK68+3U88/g8nQBORZslgBiwkQletid+FXBQE=;
 b=JFgLKwqTmBVcqY+heLiTQsSTUXcnZhWAluze6MKbZonDj/DlRx/FgEXLQ5SLQvwnyxOD
 6PWa791dANjo4KH+TP3f/FrEcvlt/5zKkIWkTRC2sUWWbtPIcum/RXGvK1/uvpQrIHYVV
 ROi4EogwGNxPMI9AGckQRoJDrBnxS2u19e/+ykOl37ptvLcLKXOqqiZAnyUniKOzxrtxi
 VMcKdtzdsBlHuLdWTpwx+TTLhAxm/cA1GzAwiXIx1UPGHjyI2UTa/NofRPVh0PI7KJNo/
 oVdDMhatWj0xKamVXh99rGKmU85A/YMmw0QKq2wc1gxLpiB1a2YahEEtHAi4pr/nwBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A7C9605F0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C13D29525A; Sun, 11 Oct 2026 19:14:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 20:45:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4738cdae83bccd1f98ddc57589cedd3221c5a1a5
X-Git-Newrev: afdd9c079de340ad2877baf7307555b271f04d87
X-Patchwork-Hint: ignore
Message-Id: <20261011191429.C13D29525A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: Support boot.scr for
 U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8702041529112031810=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8702041529112031810==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/afdd9c079de340ad2877baf7307555b271f04d87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If using U-Boot as "kernel" for the raspberrypi bootloader, include
boot.scr in the boot partition if it exists.

To use this, use BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE to set a config
file that uses U-Boot, and enable building a boot script in the U-Boot
host tool settings.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/raspberrypi/post-image.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9b9eac972b..e4611d05dd 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -19,6 +19,12 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	KERNEL=$(sed -n 's/^kernel=//p' "${BINARIES_DIR}/rpi-firmware/config.txt")
 	FILES+=( "${KERNEL}" )
 
+	# If config.txt calls for running U-Boot, include the boot
+	# script if any.
+	if [ "${KERNEL}" = "u-boot.bin" ] && [ -e "${BINARIES_DIR}/boot.scr" ]; then
+		FILES+=( "boot.scr" )
+	fi
+
 	BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
 	sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${BOARD_DIR}/genimage.cfg.in" \
 		> "${GENIMAGE_CFG}"

--===============8702041529112031810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8702041529112031810==--
