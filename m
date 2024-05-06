Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04466C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C904782423;
	Mon,  6 May 2024 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njWuR6klQuRO; Mon,  6 May 2024 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9213D82BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9213D82BF4;
	Mon,  6 May 2024 20:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAFBC1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45DC40217
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6-Iw06lxsBL for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83BA440108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83BA440108
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83BA440108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:23:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34db6a299b8so1530838f8f.3
 for <buildroot@buildroot.org>; Mon, 06 May 2024 13:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715026990; x=1715631790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/ldknVO4SLkBQmZTO3N+25DRoxJjCEq2u/+D5auue4=;
 b=Q2DF33uRMQV2i4esHA/8RcWDfUYg9gVi7DVaRYNGqPuA13Vdcch4d1YoMn0t5V6DgM
 1FanlBbY5Az6MBU2+VllrhB47NVMn1dj73iy9vhNxnZhtihi5ioIuiYNWtlenkjQZdGf
 xGAgF65uaExFRnaDDVTj07mVsmKyW2cZQsYLt+FFV46NVymi30wIEpRrA2WKqjItEZpf
 LvZK68GbXVaqrmUm+0BQJPyp3fvGQPKLetKzpxR8K01nOMjk0mAkgCqA8qB33iphijQs
 xu/2pcV713xhEhgzJuZ7CQjpoa4FqgGzmq9feUng3qORjDoybN2mY3WAGm+geiPPecrV
 0oRQ==
X-Gm-Message-State: AOJu0Yx/LHvduzoE8SGnS+fbt0n+yxZ16wdzpbsUvrNe+5Proh8+YVBD
 yvpdw2whqfz3O7NYBkZTcdXGQ2gncIv6xKrg6PReCtunxRfG8cX3Br/dPA==
X-Google-Smtp-Source: AGHT+IGnJ8mFaFA+gvJrIFWJ217i1W84Yn+ommC7B0xcGw4dEKoxwkFOR12yZA0YRbUAT/adg9HvVA==
X-Received: by 2002:adf:ea47:0:b0:34c:b54d:5fc2 with SMTP id
 j7-20020adfea47000000b0034cb54d5fc2mr7583946wrn.19.1715026989651; 
 Mon, 06 May 2024 13:23:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0041bc41287cesm17181283wmo.16.2024.05.06.13.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:23:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 22:23:04 +0200
Message-ID: <20240506202304.509499-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715026990; x=1715631790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/ldknVO4SLkBQmZTO3N+25DRoxJjCEq2u/+D5auue4=;
 b=E1m6oKLViTFfQdyQdsmKxZRvlnNdTVPdKi/uoOg1g6nuOrIT0DSki9iMz+Dz606K5Z
 UCErpwLgpfUtr/rBMzDHdAsu6M2PWkfo/B7kKjOleVJYgjWyIKcEe4Wej2/A3EwfL2de
 HJ/OHEtAB3vyeMJQZWkC545BXSy3onZ8SN2gL/0mxgpN//4KFUSArcgPsdUNIE2iQadw
 jmyQobji2YA0SMX0VFDGwFuuK5OEOkol8ZfHMsRvExVEWmg+Ro9TttH/x4y2KGj4Onym
 4eml6SnXCASeGThJkGKXfmFRa/2g8gnFiI/cfjjBJdanNZClnFXZjBc9es4V4MkJnjeN
 HVrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E1m6oKLV
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix static build
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

Fix the following static build failure raised since bump to version
version 6.0.14 in commit ce17f93e828a07292e03653be04a49480250f23f and
https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5:

configure:22378: checking for pcap_open_dead in -lpcap
configure:22407: /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -std=c11 -march=native -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -rdynamic conftest.c -lpcap  -ljansson -lpthread -lyaml -lpcre -latomic -lz >&5
/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o): in function `nl80211_init':
pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'

[...]

checking for pcap_open_dead in -lpcap... no

Fixes: ce17f93e828a07292e03653be04a49480250f23f
 - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-configure.ac-fix-static-build.patch  | 52 +++++++++++++++++++
 package/suricata/suricata.mk                  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 package/suricata/0002-configure.ac-fix-static-build.patch

diff --git a/package/suricata/0002-configure.ac-fix-static-build.patch b/package/suricata/0002-configure.ac-fix-static-build.patch
new file mode 100644
index 0000000000..fc5384a114
--- /dev/null
+++ b/package/suricata/0002-configure.ac-fix-static-build.patch
@@ -0,0 +1,52 @@
+From 6e1d8aceea8c4e49f00d8e630b681641a36c688f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 May 2024 09:31:05 +0200
+Subject: [PATCH] configure.ac: fix static build
+
+static build is broken since
+https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5
+because AC_CHECK_LIB is called before PKG_CHECK_MODULES:
+
+configure:22378: checking for pcap_open_dead in -lpcap
+configure:22407: /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -std=c11 -march=native -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -rdynamic conftest.c -lpcap  -ljansson -lpthread -lyaml -lpcre -latomic -lz >&5
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o): in function `nl80211_init':
+pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'
+
+[...]
+
+checking for pcap_open_dead in -lpcap... no
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://redmine.openinfosecfoundation.org/issues/7008
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 232ee9bed..6277cb9b6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1219,6 +1219,8 @@
+         fi
+     fi
+ 
++    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
++
+     if test "$have_wpcap" != "yes"; then
+         AC_CHECK_LIB(pcap, pcap_open_dead, [], [
+             echo
+@@ -1234,8 +1236,6 @@
+         PCAP_LIB_NAME="pcap"
+     fi
+ 
+-    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
+-
+     AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
+     if test "$HAVE_PCAP_CONFIG" = "no" -o "$cross_compiling" = "yes"; then
+         AC_MSG_RESULT(no pcap-config is use)
+-- 
+2.43.0
+
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 2083e0caba..e60ed2fce8 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -10,6 +10,7 @@ SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
 SURICATA_CPE_ID_VENDOR = oisf
 # 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+# 0002-configure.ac-fix-static-build.patch
 SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
