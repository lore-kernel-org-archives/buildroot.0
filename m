Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8221CC53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFBCD81255;
	Sun,  8 Jan 2023 15:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFBCD81255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0dyTlTkCJCq; Sun,  8 Jan 2023 15:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BEB8127C;
	Sun,  8 Jan 2023 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BEB8127C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D309C1BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB4DF606E6
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4DF606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uPU1_IsE-Sz for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6AED6059C
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6AED6059C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A359C87695; Sun,  8 Jan 2023 15:38:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 16:38:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6195c53041f5a8aa375b9715f90beb5188d33e5
X-Git-Newrev: a92e9e5fb87caff46fbbe8f368564eddf4ff389d
X-Patchwork-Hint: ignore
Message-Id: <20230108153844.A359C87695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bustle: fix pcap-config call
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

commit: https://git.buildroot.net/buildroot/commit/?id=a92e9e5fb87caff46fbbe8f368564eddf4ff389d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libpcap to version
1.10.2 in commit 6bee8635d90f3f9e3d04e03a9db2f37a387e077 and
https://github.com/the-tcpdump-group/libpcap/commit/d0cba780dc2b2bb4f3ca9427d1a0f03479f45707:

pcap-config: Invalid command-line option pcap-config specified
Usage: pcap-config [ --help ] [ --static | --static-pcap-only ] [ --libs | --additional-libs ]
perl -nle 'm/^Version:\s+(.*)$/ and print $1' \
	bustle.cabal > dist/build/autogen/version.txt
echo '#define BUSTLE_VERSION "'`cat dist/build/autogen/version.txt`'"' > dist/build/autogen/version.h
/home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -Idist/build/autogen -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  \
	-o dist/build/bustle-pcap c-sources/pcap-reader.c c-sources/pcap-monitor.c c-sources/bustle-pcap.c \
	-I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libmount -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/blkid -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gio-unix-2.0 -pthread -L/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0
/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/cc5SQkTV.o: in function `bustle_pcap_reader_finalize':
pcap-reader.c:(.text+0x254): undefined reference to `pcap_close'

Fixes:
 - http://autobuild.buildroot.org/results/f3dcb617488e4172e639e3bd51a93bc9822ea186

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Makefile-fix-pcap-config-call.patch       | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/bustle/0001-Makefile-fix-pcap-config-call.patch b/package/bustle/0001-Makefile-fix-pcap-config-call.patch
new file mode 100644
index 0000000000..b02bea641b
--- /dev/null
+++ b/package/bustle/0001-Makefile-fix-pcap-config-call.patch
@@ -0,0 +1,45 @@
+From 77e2de892cd359f779c84739682431a66eb8cf31 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Jan 2023 11:03:52 +0100
+Subject: [PATCH] Makefile: fix pcap-config call
+
+Fix the following build failure raised since libpcap version 1.10.2 and
+https://github.com/the-tcpdump-group/libpcap/commit/d0cba780dc2b2bb4f3ca9427d1a0f03479f45707:
+
+pcap-config: Invalid command-line option pcap-config specified
+Usage: pcap-config [ --help ] [ --static | --static-pcap-only ] [ --libs | --additional-libs ]
+perl -nle 'm/^Version:\s+(.*)$/ and print $1' \
+	bustle.cabal > dist/build/autogen/version.txt
+echo '#define BUSTLE_VERSION "'`cat dist/build/autogen/version.txt`'"' > dist/build/autogen/version.h
+/home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -Idist/build/autogen -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  \
+	-o dist/build/bustle-pcap c-sources/pcap-reader.c c-sources/pcap-monitor.c c-sources/bustle-pcap.c \
+	-I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libmount -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/blkid -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gio-unix-2.0 -pthread -L/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/cc5SQkTV.o: in function `bustle_pcap_reader_finalize':
+pcap-reader.c:(.text+0x254): undefined reference to `pcap_close'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f3dcb617488e4172e639e3bd51a93bc9822ea186
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/bustle/bustle/-/merge_requests/21]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8865819..721e714 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,7 +2,7 @@ CFLAGS = -g -O2 -Wall -Wunused -Waddress
+ DBUS_FLAGS = $(shell pkg-config --cflags --libs dbus-1)
+ GIO_FLAGS := $(shell pkg-config --cflags --libs 'glib-2.0 >= 2.26' gio-2.0 gio-unix-2.0)
+ PCAP_CONFIG ?= pcap-config
+-PCAP_FLAGS := $(shell $(PCAP_CONFIG) --cflags pcap-config --libs)
++PCAP_FLAGS := $(shell $(PCAP_CONFIG) --cflags --libs)
+ DESTDIR =
+ PREFIX = /usr/local
+ BINDIR = $(DESTDIR)$(PREFIX)/bin
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
