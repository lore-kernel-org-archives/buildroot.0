Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6885FC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B9B601FC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23B9B601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E693660644;
	Tue,  3 Aug 2021 22:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81v09PsdaxvA; Tue,  3 Aug 2021 22:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C55605BF;
	Tue,  3 Aug 2021 22:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12C041BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F9F1608DB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wy4rEBCjQkhy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A945608CE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B2D9C88088; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Jun 2021 13:59:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6bccac75ea3f8cd66bcde3747067add14b0c4f2c
X-Git-Newrev: 047a9d9eaa254616a44ae9edebf611ab16453922
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.B2D9C88088@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bmap-tools: enable
 host package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=047a9d9eaa254616a44ae9edebf611ab16453922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bmaptool allows to drastically reduce the amount of data to transfer
when writing to an SD card. Example with a 544 MiB sdcard.img:

$ bmaptool create sdcard.img > sdcard.bmap
$ gzip sdcard.img
$ bmaptool copy sdcard.img.gz /dev/sdc
bmaptool: info: discovered bmap file 'sdcard.bmap'
bmaptool: info: block map format version 2.0
bmaptool: info: 139265 blocks of size 4096 (544.0 MiB), mapped 23918 blocks (93.4 MiB or 17.2%)
bmaptool: info: copying image 'sdcard.img.gz' to block device '/dev/sdc' using bmap file 'sdcard.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/sdc'
bmaptool: info: copying time: 7.7s, copying speed 12.1 MiB/sec

So it means that instead of writing 544 MiB, only 93.4 MiB had to be
written.

In terms of implementation details, compared to the target bmap-tools
package, there are fewer "selects" that are needed because:

 - The dependency on setuptools is not needed, because the package
   uses the setuptools SETUP_TYPE, so host-python-setuptools is
   already a build dependency.

 - host-python and host-python3 are always built with Expat XML
   support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host            |  1 +
 package/bmap-tools/Config.in.host | 12 ++++++++++++
 package/bmap-tools/bmap-tools.mk  |  1 +
 3 files changed, 14 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 064c98af3d..8d443ea255 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
+	source "package/bmap-tools/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
new file mode 100644
index 0000000000..a20829030d
--- /dev/null
+++ b/package/bmap-tools/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_BMAP_TOOLS
+	bool "host bmap-tools"
+	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
+	help
+	  Tool to flash image files to block devices using the block map
+	  bmaptool is a generic tool for creating the block map (bmap)
+	  for a file, and copying files using the block map. The idea is
+	  that large file containing unused blocks, like raw system
+	  image files, can be copied or flashed a lot faster with
+	  bmaptool than with traditional tools like "dd" or "cp".
+
+	  https://github.com/intel/bmap-tools
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index c8b41c225f..32399ca151 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -11,3 +11,4 @@ BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
