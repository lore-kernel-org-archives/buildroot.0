Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E00CA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A80280F10;
	Wed,  7 Oct 2026 08:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UszdyRi-AQOJ; Wed,  7 Oct 2026 08:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9E66980F16
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360510;
	b=q6wesk8IpXCCL8iZ8lRL44bqKRGot+kEeFunJk9ZNDuMNn/0S+NomIRCAury8fuVWMAf
	 S0Gggp5jWYyXmNiglLssyuDLXH2Qg/KhyIx4ZNT7/iQyNxJVryXcU2YuP710lEY+JxBoY
	 4dLHoXsx5rPkbgVdEi/upiiLtWddM83Yo1XuwSO8tM4pViQ1Zg20kNWKJD1awlkxYQDlz
	 yoCmObmm/z8uDBDfONhBKI0H14KJJUmK4UoNIz9szZBL9X6Fop916XQiC/8BtrCBlV1eW
	 QsIvLh//0tXx+Abqn7qbcAI2QOuUdLglyUKSv01tfwCBpMQzSPp5NAWuYK7y4TDFBqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360510;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s5QO7rWbAyLg7RmbZAlwbUz9hqPDwgTrqXty/bv+Txw=;
	b=eLH1lQ1chPBEif3sDaKhuYGqd8033lD9V6H9YWia9pYBqNGAcTsfgnYmY27+wFqHZ0Qz
	 xAR9N6jqnL3RgLVJEJs9QlddnfGbgbXCYYeWEFu4MP4eb8mC8yFw0Pf4hVgXo3rqcCwCq
	 hOrp2R/XbEu7qKVtOq4CUzhbXqm/MulfS2uscZTbJXFk/La8U7AvrBhQrcxbzVgQ9IuZ5
	 WSSKhCyLrmmnqvF8KAeDyPJHxxnlLl+CfSWy+ej6TSTBDOOfD6yOsWAaNTf9ZddkIvKGG
	 DrieysyYzIR2szsnqaF2pZpbIuIeFeUj0njh0hJDIqCDAZQzHsXtZMrloRam8xgppiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360510;
	bh=s5QO7rWbAyLg7RmbZAlwbUz9hqPDwgTrqXty/bv+Txw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HSCQ+ocVPawKacoJGh71vaVeqw2+xSQEDpNXVhfK5/DZRz1z2hkd1bHgICmWRBlJW
	 Rz2H1P7zu3GuVEzeUvik/lEwLwZho8tB2/TdXdffXlU1yzeO7MqikDobpE7I8JrLEe
	 KF3NiO/sxsDiaq9b0W6KMEhPmt0K5WxP2m/9wRRo8tLupT/c9Uy9mr0AShemRz0WDR
	 n32z4wSE6+SBGTj4VN23hBvHad0/F7ndNd+NrevKuv5nflzgjuu4LUHFA2+0jbpBgw
	 pjtjqE3uYXil1A91MxLiQCYUFPJGbWPjk+kUCUtefbEGP2OoGmrJdPo7dOnIfotfls
	 lbjnhB3L+YBew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E66980F16;
	Wed,  7 Oct 2026 08:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A08A8317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92223606B0
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRWuOr-qPAvM for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 07:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D818060670
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791359909;
 b=YtOFzCjpdPCnBBx+2nz5hJ0EIFGbtWsuicOpenWKUyfuBNjfwoq32oNvIVcVMz1yF7bj
 Hj3Nm/Ki5T3TkdAG7BApmE/POAzho+ynp+zNbUT12hwol/wvHYugU8jRozuqrcMHLX52L
 W/9yJRwZ6XcaeC41zj+qZzcP8ev6aI6QTNy6A8ltpuG0m8zTXr2rlt+LuUcEdUhACom93
 hb33b2VtMJ3LQ+GnY48X+SIkP26xhF9xSzTldUyB1a15WrR3pF58vc0et8NyIxx9O2AgG
 Qggp4U8VtlGcz3x+hSV+aclfIEWKhRKGTDeVg35eRGYuPnlyyF0olhipmfbP0mcacAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791359909;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ofDIthEPIeTsZdDagn5H9QvpINV7O0GuN4m9VcchRXw=;
 b=NnL1ta2NUt+DZKYSQmZusCRB6q2hW8bYqNmPSJIq44WeQVPnmOZXJajhc3KjmkUMHoZQ
 RH6HO98W+H1Taex96vo4NiUp4b98rf8lEox7H8fEXD/tTrAE1TNFsF02Wtqk7+Peiidu6
 HbNW50foco5Ddlpusn9dPtBcMECAG2NDCeN6sSXUFMzYQJbKqmmJLuIo3En1iFd1Znsr5
 WGsqWhQXBDO1Gbs3Os9713fBubI2D2zIe3AKWlIi1te14OgQ6WcrR+/Asp7yo4Cg8LUrJ
 bLoW1WAGSIMe/KnHafZXcEVWTfQl9VhZPOsWYb4CuHBl6okoacgVd72FZph2fFGTpsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D818060670
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE648DA9C; Wed,  7 Oct 2026 07:57:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 09:57:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 716a71553911e0c812c3eeca74974064844e79aa
X-Git-Newrev: 721e51f58a5477c5eccc9d2a41c6c7ee5e5529e3
X-Patchwork-Hint: ignore
Message-Id: <20261007075713.2DE648DA9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: reject qemu user mode
 on hosts with large pages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/721e51f58a5477c5eccc9d2a41c6c7ee5e5529e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Qemu in user mode cannot load target binaries laid out for 4k pages
when the host uses larger pages, as the 16k pages of the Asahi Linux
kernel on Apple Silicon. The dynamic loader then fails with e.g.:

  GLib-2.0: error while loading shared libraries: libz.so.1: failed
  to map segment from shared object

or, depending on the target:

  qemu-aarch64: .../GLib-2.0: Error mapping file: Invalid argument
  torque: error while loading shared libraries: libz.so.1: ELF load
  command address/offset not page-aligned

This hits every package running target code through qemu at build
time, i.e. gobject-introspection and nodejs, on mips, sparc64 and
aarch64 alike, and is not something Buildroot can fix in the
packages themselves.

As this only depends on the build host, reject such configurations
in genrandconfig when the host page size is larger than 4k.

Fixes:
https://autobuild.buildroot.org/results/4848e735fe83dfeef4f24d32655c567951fd113a (mips)
https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 (sparc64)
https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 (aarch64)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 727c8193c4..8437d6342d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -124,6 +124,13 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
        'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
         return False
+    # Qemu in user mode cannot load target binaries laid out for 4k
+    # pages on a host with larger pages (e.g. 16k on Apple Silicon),
+    # so packages running target code at build time (gobject-
+    # introspection, nodejs) fail there.
+    if 'BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y\n' in configlines and \
+       os.sysconf('SC_PAGE_SIZE') > 4096:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
