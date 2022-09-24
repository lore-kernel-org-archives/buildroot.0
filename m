Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9D6C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74C441C5A;
	Sat, 24 Sep 2022 21:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B74C441C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qglePNDK_6Ys; Sat, 24 Sep 2022 21:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8796241D08;
	Sat, 24 Sep 2022 21:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8796241D08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 524911BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27468419E4
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27468419E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qlz1JZ2Appe for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E2F415E6
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E2F415E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0198985FA6; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:39:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06767e7d7792fd1ab1d0fae836701ad2acf54c6e
X-Git-Newrev: 9c45f0706c322c5ed7c388f8300ac07c1bc229cc
X-Patchwork-Hint: ignore
Message-Id: <20220924214014.0198985FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daq3: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c45f0706c322c5ed7c388f8300ac07c1bc229cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to
version 3.0.9 in commit c05fe1d621c7c5147f687b39f61988918efec566 and
https://github.com/snort3/libdaq/commit/c2ae4668fb4c8f53523a47f93a120c62364f3d02:

libtool: compile:  no -DHAVE_CONFIG_H -I. -I.. -fvisibility=hidden -Wall -Wmissing-declarations -Wpointer-arith -Wcast-align -Wcast-qual -Wformat -Wformat-nonliteral -Wformat-security -Wundef -Wwrite-strings -Wextra -Wsign-compare -Wno-unused-parameter -fno-strict-aliasing -fdiagnostics-show-option -I../api -DBUILDING_SO -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -c gwlb/daq_gwlb.cc  -o gwlb/.libs/daq_gwlb_la-daq_gwlb.o
../libtool: line 1763: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/48b4673f46c9065e97e95872f9aa947c4f3fc21b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/daq3/daq3.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index 6ecd1134c7..bab957e052 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -13,6 +13,12 @@ DAQ3_DEPENDENCIES = host-pkgconf
 # From git
 DAQ3_AUTORECONF = YES
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+DAQ3_CONF_OPTS += --enable-gwlb-module
+else
+DAQ3_CONF_OPTS += --disable-gwlb-module
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 DAQ3_DEPENDENCIES += libnetfilter_queue
 DAQ3_CONF_OPTS += --enable-nfq-module
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
