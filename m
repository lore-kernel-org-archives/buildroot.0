Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACA9C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 10:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3195A401F8;
	Sun,  8 Jan 2023 10:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3195A401F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXHN-TtQdnDF; Sun,  8 Jan 2023 10:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F29D40123;
	Sun,  8 Jan 2023 10:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F29D40123
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 470081BF588
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 10:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2909D81E44
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 10:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2909D81E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IxnOOLk19hu for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 10:11:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03B881E42
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E03B881E42
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 10:11:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so5786915wml.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 02:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMsCY6mY3N059qufhMMOjeswD1kz6QJiFOYdR/iyBxM=;
 b=arE9DrZZ6P+1DUT+n+NQwh2UUXVKkp/vGGjoT6MUjTLKC/UuE7QW3pnhbcVp5WvlVk
 +kMPIK3RZ3T0ojc2ip+1h8K7Y+5JtHWvAl3boRaNgGNG9ASfSFKYhncceS7DEBooiQrU
 1Fzlq9RnJnTmY50kEd5Fj4RamvvlQmkY3qZhBH/XedVJ7QkPbmtOW+xsUGtlPSqrnkHr
 wnw/7N7uD5Y8ZKubt2pEDRhBqZCHQLh3SqGPYn2YNyQ2endGIhrNHey1yUyfYfUAtq5g
 qBXJ8IXok61otpu1h/lUFUfvJf32UvrrilTjYcXf+iGrnC+bY/UWTnLS6F/L4xbdlbPK
 yn8A==
X-Gm-Message-State: AFqh2kqc6EyzR07MNhVcjVYtCYehhBOL4B4tcPhrAaJvdEpaQdjOX4u8
 stIb+EY66gGNJ1XJaqTPlPM28IHuJno=
X-Google-Smtp-Source: AMrXdXsffUhKNH9/FHw+ozf+jbnhR1XM7ATIWp5ReeAhK/QJHJv6Y/2fqXDgJ+uhUV4+N25HBtiqdQ==
X-Received: by 2002:a05:600c:34d1:b0:3d7:72e3:f437 with SMTP id
 d17-20020a05600c34d100b003d772e3f437mr44250429wmq.21.1673172702654; 
 Sun, 08 Jan 2023 02:11:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm12526097wms.4.2023.01.08.02.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 02:11:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 11:11:37 +0100
Message-Id: <20230108101137.400527-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMsCY6mY3N059qufhMMOjeswD1kz6QJiFOYdR/iyBxM=;
 b=OddCTJzO+ML2SEXzQlynuja69IZD/h0tjABF16rum1uMxDdwxYRDi68FmvJ4aKhDEb
 hU6JHo48odFL6edq+f0GPpTlheABAWlBA2eIPQYuI7Z3q8jbzRyMFI2q8CnFXD6ync9L
 fN7jiVPDJ6DJ/S6N2W4CnYQdYVewjKLHRCwzdz0JykObWns3FZbxL4Xk5/rzaQ/iLeXj
 sycZgGUqAr9Tpj4boGIkCUC2X1XHuhIIevRVr+xsH57ttrggqIusRyPNe7l+9s38GHwr
 6/9YKZJuf5K6b0g21o0apveyIFSrq3lxhvJYbNwqdALIXZmlIQ7wLf1GCSV0eX5eNimB
 ihRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OddCTJzO
Subject: [Buildroot] [PATCH 1/1] package/bustle: fix pcap-config call
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../0001-Makefile-fix-pcap-config-call.patch  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/bustle/0001-Makefile-fix-pcap-config-call.patch

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
