Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA11C4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DBDE40122;
	Fri, 23 Dec 2022 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DBDE40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wuojwi4z8sXX; Fri, 23 Dec 2022 22:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68C9440162;
	Fri, 23 Dec 2022 22:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C9440162
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B62F1BF297
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 22:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65FE41BD5
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 22:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65FE41BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAiFy7WcjG_O for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 22:01:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570AD41BD4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 570AD41BD4
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 22:01:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w15so5579517wrl.9
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 14:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cTLIRzBbI4LfjmW0FUoQ6PRYsv6V7M8FVI9pdZj98o=;
 b=bxMMnuIbfBO4/3O/rtWs6yLo1MuPhOBHUPo3Km6nzQfRqcqy90JX1bA0do04rhLUeH
 E/Esl8YvpfJQs3oI0YGoi6x1+TBwuucjVrO9Dh50TzNqt0v5JMHrPHvVFJ6Tc76riptS
 GydRZWT7hu21emRqxUwWdApqdm58ppz2S3yT4tW0tGS+YU0x+6YDfROsBElEL5MGAao+
 4Ef51YhgMbpiNFI1m8+YFrOuV2L99Jihc44TKqjj+EP0TZfdlWA88ksl5DqCOOxLZKVR
 0R5ts6sVqx3JMx0snIBsnbQqsXn/n05hiJrhtuNyA7xe56zbgrZ+XlJ8Bvim2/BajEkC
 2uNA==
X-Gm-Message-State: AFqh2kqHscDqqIVGWrruHTDmhoPlCUbTwz7mYMoMTrayrc8LHF2WCQlO
 TKiZ74FFQ5f0db0By0Q8H0jHph6lUQ8=
X-Google-Smtp-Source: AMrXdXuEE6qqB1ZNDrsRKYejdR9cxNU7L9vQtwOJX87U2kInFvHnqG+cQip3e9va/OTytXpJHF/MEw==
X-Received: by 2002:adf:f244:0:b0:242:6588:3aa9 with SMTP id
 b4-20020adff244000000b0024265883aa9mr6927382wrp.32.1671832865153; 
 Fri, 23 Dec 2022 14:01:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z8-20020a056000110800b00241dd5de644sm3871340wrw.97.2022.12.23.14.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 14:01:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 23:01:00 +0100
Message-Id: <20221223220100.58811-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1cTLIRzBbI4LfjmW0FUoQ6PRYsv6V7M8FVI9pdZj98o=;
 b=NTDModsQLl4wF6kUdI0LO5/YrOGN28r5d7MY2sKY1siKAbjGjb3HH1DP6b/S/Ao77S
 b/C69j+QmMVNYN147lC9YCBZ/9C0aw+oS3ISSuFhlmZ0cC9LKhOhtNv1l4BCw7z2awoP
 DeK1btDJpBTqkDpgiI1bXE1y+EDduUbzHnpVQbkiRYABJEpoAiaWbfVY0E+r1RN0nKYn
 /XkbMcOPWaP8oFTDr2tYPWcvafXqT+BB3jDiW8VqNtzacWXJyDOaQHmjxH/+j+aju4co
 FPtmSDa1NYifAPCf7BBh4ew8r2LzZYLAsmJ8xFxiaOY5+U4FMcDJo5yZI5db2GJrIdoV
 jA3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NTDModsQ
Subject: [Buildroot] [PATCH 1/1] package/orc: bump to version 0.4.33
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

Drop patch (already in version)

https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.33/RELEASE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...powerpc.c-fix-build-with-kernel-4.11.patch | 70 -------------------
 package/orc/orc.hash                          |  4 +-
 package/orc/orc.mk                            |  2 +-
 3 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch

diff --git a/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch b/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
deleted file mode 100644
index 0a4e7010f2..0000000000
--- a/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a45f6d49ec090ad94333c0865c378d2d96ab2af4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Feb 2021 20:17:43 +0100
-Subject: [PATCH] orc/orccpu-powerpc.c: fix build with kernel < 4.11
-
-Build with powerpc and kernel < 4.11 is broken since version 0.4.30 and
-https://gitlab.freedesktop.org/gstreamer/orc/-/commit/a999325abea6a5549d60d99ddeb0271d2aa00235:
-
-FAILED: orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/powerpc-linux-gcc -Iorc/liborc-0.4.so.0.32.0.p -Iorc -I../orc -I. -I.. -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -std=gnu99 -O3 -DHAVE_CONFIG_H -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -pthread -DORC_ENABLE_UNSTABLE_API -D_GNU_SOURCE -DBUILDING_ORC -MD -MQ orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -MF orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o.d -o orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -c ../orc/orccpu-powerpc.c
-../orc/orccpu-powerpc.c: In function 'orc_check_powerpc_proc_auxv':
-../orc/orccpu-powerpc.c:164:21: error: 'AT_L1D_CACHESIZE' undeclared (first use in this function); did you mean 'AT_DCACHEBSIZE'?
-  164 |       if (buf[i] == AT_L1D_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~~
-      |                     AT_DCACHEBSIZE
-../orc/orccpu-powerpc.c:164:21: note: each undeclared identifier is reported only once for each function it appears in
-../orc/orccpu-powerpc.c:168:21: error: 'AT_L2_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
-  168 |       if (buf[i] == AT_L2_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~
-      |                     AT_ICACHEBSIZE
-../orc/orccpu-powerpc.c:172:21: error: 'AT_L3_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
-  172 |       if (buf[i] == AT_L3_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~
-      |                     AT_ICACHEBSIZE
-
-Indeed, AT_{L1D,L2,L3}_CACHESIZE is only defined since kernel 4.11 and
-https://github.com/torvalds/linux/commit/98a5f361b8625c6f4841d6ba013bbf0e80d08147
-
-Fixes:
- - http://autobuild.buildroot.org/results/0821e96cba3e455edd47b87485501d892fc7ac6a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/56]
----
- orc/orccpu-powerpc.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/orc/orccpu-powerpc.c b/orc/orccpu-powerpc.c
-index 6796f17..340cf05 100644
---- a/orc/orccpu-powerpc.c
-+++ b/orc/orccpu-powerpc.c
-@@ -161,18 +161,24 @@ orc_check_powerpc_proc_auxv (void)
-         _orc_cpu_name = (char*)buf[i + 1];
-         found++;
-       }
-+#ifdef AT_L1D_CACHESIZE
-       if (buf[i] == AT_L1D_CACHESIZE) {
-         _orc_data_cache_size_level1 = buf[i + 1];
-         found++;
-       }
-+#endif
-+#ifdef AT_L2_CACHESIZE
-       if (buf[i] == AT_L2_CACHESIZE) {
-         _orc_data_cache_size_level2 = buf[i + 1];
-         found++;
-       }
-+#endif
-+#ifdef AT_L3_CACHESIZE
-       if (buf[i] == AT_L3_CACHESIZE) {
-         _orc_data_cache_size_level3 = buf[i + 1];
-         found++;
-       }
-+#endif
-       if (found == 6)
-         break;
-     }
--- 
-2.30.0
-
diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index f48c2932ab..136fc3ece4 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.32.tar.xz.sha256sum
-sha256  a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0  orc-0.4.32.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.33.tar.xz.sha256sum
+sha256  844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a  orc-0.4.33.tar.xz
 
 # Locally calculated
 sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index a93a4f875a..be718e6f85 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.32
+ORC_VERSION = 0.4.33
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
