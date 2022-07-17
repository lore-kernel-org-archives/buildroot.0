Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B7CCA481
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D1F60C0B;
	Sun, 17 Jul 2022 14:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D1F60C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBleVfnHYh7D; Sun, 17 Jul 2022 14:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30CE960ACC;
	Sun, 17 Jul 2022 14:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30CE960ACC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8A691BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D8840412
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82D8840412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGPjohzrJLMA for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 14:03:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B527D400DD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B527D400DD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6EFF883C0E; Sun, 17 Jul 2022 13:50:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 16:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 519b5ade92c80e3aaaa5cc5ac7e3bd34091aeae8
X-Git-Newrev: 7ff22c698a0ddb5a4424f09368c5523c2058c1a4
X-Patchwork-Hint: ignore
Message-Id: <20220717135007.6EFF883C0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff22c698a0ddb5a4424f09368c5523c2058c1a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 2.3.11 in commit 9b4914cc4ccdc30e239cd3e2e0e61b8ca5d24bab and
https://github.com/lurcher/unixODBC/commit/6df155fb213896b9507b421c58856e4376647ae1:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'

Fixes:
 - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...er-drivermanager.h-fix-build-without-thre.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
new file mode 100644
index 0000000000..9d54bbf5ef
--- /dev/null
+++ b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
@@ -0,0 +1,34 @@
+From 119cab666646cd9210439d4696a4bfa18343a2c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Jul 2022 00:29:28 +0200
+Subject: [PATCH] DriverManager/drivermanager.h: fix build without threads
+
+Fix the following build failure without threads raised since version
+2.3.10 and commit 6df155fb213896b9507b421c58856e4376647ae1:
+
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/lurcher/unixODBC/commit/119cab666646cd9210439d4696a4bfa18343a2c6]
+---
+ DriverManager/drivermanager.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/DriverManager/drivermanager.h b/DriverManager/drivermanager.h
+index 9528fae..abd324b 100644
+--- a/DriverManager/drivermanager.h
++++ b/DriverManager/drivermanager.h
+@@ -808,6 +808,8 @@ void pool_signal();
+ 
+ #define thread_protect(a,b)
+ #define thread_release(a,b)
++#define pool_timedwait(a)
++#define pool_signal()
+ 
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
