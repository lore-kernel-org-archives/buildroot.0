Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AD8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5793960FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5793960FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3256660808;
	Mon, 27 Sep 2021 14:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbicUjP829vr; Mon, 27 Sep 2021 14:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FE06081E;
	Mon, 27 Sep 2021 14:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18FED1BF983
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E3938176F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EloVrX2X4wG9 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D82781815
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3DAC58D255; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:20:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e00787fb9c442c61023edd765e657df85b07793
X-Git-Newrev: e1319f20a54074212d97e251d7508a2ec3d3cf41
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.3DAC58D255@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: needs fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1319f20a54074212d97e251d7508a2ec3d3cf41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdbm needs fork since
https://git.savannah.gnu.org/cgit/gdbm.git/commit/?id=9016182fe92dcdfa9103acd144ab01f30463ac72
which will result in the following build failure since bump to version
1.21 in commit 60add404db424e2652673a7b6a3ba2bc80380b42:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libgdbmapp.a(gdbmshell.o): in function `shell_handler':
gdbmshell.c:(.text+0x3dc): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/effc22ac47350bdbc19074dd724eab16f53913b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdbm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index 6c668722d9..debe5660d7 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GDBM
 	bool "gdbm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
