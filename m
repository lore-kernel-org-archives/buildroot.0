Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84411C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F9740A01;
	Sun,  3 Dec 2023 22:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F9740A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UonSd9WIZixc; Sun,  3 Dec 2023 22:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A73640A1F;
	Sun,  3 Dec 2023 22:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A73640A1F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1F51BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53649409D7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53649409D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vV-p1oueSroc for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D22D40A2F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D22D40A2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AEC787934; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 23:17:31 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: dedfab8614082e493b084b8c2085d1bd597be946
X-Git-Newrev: b1509f719d8d4ce7da1757fd29b0c0dd6bc38f25
X-Patchwork-Hint: ignore
Message-Id: <20231203222432.5AEC787934@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libmemcached: fix
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1509f719d8d4ce7da1757fd29b0c0dd6bc38f25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following static build failure raised since bump to version
1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

CMake Error at /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/bin/cmake_install.cmake:60 (file):
  file RPATH_CHANGE could not write new RPATH:

    $ORIGIN/../lib

  to the file:

    /home/autobuild/autobuild/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/bin/memcapable

  No valid ELF RPATH or RUNPATH entry exists in the file;
Call Stack (most recent call first):
  /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/cmake_install.cmake:52 (include)
  /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/cmake_install.cmake:52 (include)

Fixes:
 - http://autobuild.buildroot.org/results/778ff517d465896f54a3cd5316a66c54f66fd4cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b47b2065b249b3f50f3164d8a8114b108f596559)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 63df8f5c20..b72f127a1d 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -18,7 +18,8 @@ LIBMEMCACHED_CPE_ID_VENDOR = awesome
 # unexpected build failures with packages that use libmemcached (e.g. c-icap)
 LIBMEMCACHED_CONF_OPTS += \
 	-DCMAKE_BUILD_TYPE=Release \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
+	-DCMAKE_SKIP_RPATH=ON
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
