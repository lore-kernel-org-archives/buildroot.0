Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE62C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 18:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F7A60FA8;
	Tue, 28 Jan 2025 18:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgBjO-kK0qN2; Tue, 28 Jan 2025 18:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F16660FC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F16660FC6;
	Tue, 28 Jan 2025 18:12:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E839BAF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C72E381138
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SujsUBEIKkyU for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 18:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DED80CA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11DED80CA7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:12:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED8E686582; Tue, 28 Jan 2025 18:12:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 19:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a630519312f39faceb0039e7cf3ef2635a00101
X-Git-Newrev: 294d13bb85929cbef3f921e2f4b399f6216cc1a1
X-Patchwork-Hint: ignore
Message-Id: <20250128181205.ED8E686582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/genimage.sh: add shell
 option -e
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7421347553300001789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7421347553300001789==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=294d13bb85929cbef3f921e2f4b399f6216cc1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 6889056f1e (support/scripts/genimage.sh) adds support for
creating bmap images.

Since then, the script genimage.sh looses the error returned by the
genimage command.

As a consequence, the target-finalize target looses the error as well,
and so on up to make.

This adds the shell option -e to exit immediately if a command ends with
an error, so the error is not ignored.

Fixes:

	gportay@archlinux ~/src/rtone-br2-external $ make
	(...)
	>>>   Executing post-image script support/scripts/genimage.sh
	INFO: cmd: "mkdir -p "/home/gportay/src/rtone-br2-external/output/build/genimage.tmp"" (stderr):
	INFO: cmd: "rm -rf "/home/gportay/src/rtone-br2-external/output/build/genimage.tmp"/*" (stderr):
	INFO: cmd: "mkdir -p "/home/gportay/src/rtone-br2-external/output/build/genimage.tmp"" (stderr):
	INFO: cmd: "cp -a "/tmp/tmp.EclKGwtA4R" "/home/gportay/src/rtone-br2-external/output/build/genimage.tmp/root"" (stderr):
	INFO: cmd: "mkdir -p "/home/gportay/src/rtone-br2-external/output/images"" (stderr):
	INFO: vfat(efi-part.vfat): cmd: "mkdosfs   '/home/gportay/src/rtone-br2-external/output/images/efi-part.vfat'" (stderr):
	INFO: vfat(efi-part.vfat): adding file 'efi-part/EFI' as 'EFI' ...
	INFO: vfat(efi-part.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -sp -i '/home/gportay/src/rtone-br2-external/output/images/efi-part.vfat' '/home/gportay/src/rtone-br2-external/output/images/efi-part/EFI' '::EFI'" (stderr):
	Disk full
	INFO: vfat(efi-part.vfat): cmd: "rm -f "/home/gportay/src/rtone-br2-external/output/images/efi-part.vfat"" (stderr):
	ERROR: vfat(efi-part.vfat): failed to generate efi-part.vfat
	INFO: cmd: "rm -rf "/home/gportay/src/rtone-br2-external/output/build/genimage.tmp/"" (stderr):
	make[1]: Leaving directory '/home/gportay/src/rtone-br2-external/buildroot'
	gportay@archlinux ~/src/rtone-br2-external $ echo $?
	0

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/scripts/genimage.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index df224241ab..8657940be5 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 
+set -e
+
 die() {
   cat <<EOF >&2
 Error: $@

--===============7421347553300001789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7421347553300001789==--
