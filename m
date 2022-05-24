Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42520C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 22:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF274612AE;
	Tue, 24 May 2022 22:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sSIdaqosMEb; Tue, 24 May 2022 22:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE2D612AA;
	Tue, 24 May 2022 22:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A54991BF82D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FF1260009
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDWOTZUgF3dw for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 22:07:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3B8612A3
 for <buildroot@buildroot.org>; Tue, 24 May 2022 22:07:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tcgjn5UgDbMeitcgjn5S0d; Wed, 25 May 2022 00:07:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653430057; bh=wGv7Z10hCyBTbWYkU/eqDVfijWPTAHO/aY+TCNI12tM=;
 h=From:To:Subject:Date:MIME-Version;
 b=fYPSNqEKxmC+9o9mHz1NcyCzC6vLDr3CEFjG+rJOne2rXlEk0SjSYOtnjwagXuytR
 IOFkB/3l7p6OfjNcrWdtOL5oldaMnajJDu5B6W8FICtrMW6SR92dgb/4Mar6e4oZPr
 L+HUwLjnCxNAascoomYFcy8fOHRuiyhSHoi1lLC9CU6PvANyTPM0Hz4UTEbYb+qDY8
 tojXpCgCy53pJ2OX338TBefWtaDHSQhr83Z9tGuwiONh9K0Ra2stF9VNnBanKaX5iR
 K+Nc/iRSVsVmNeUnbFrHYeT6cQME7IvFLt/Ekf34j0nRIDgV9gqtutjK8vTYgV/QTF
 BM1yQtOrfkF/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 May 2022 00:07:34 +0200
Message-Id: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKuQ/9ND0TC2y2TQ8Cgm2JfIqvbG/Jq7lx9P2LziddyYGC6wprICTMyKr/J1EtHu1y9V9I5xxL6xuAV0qLqjc8IjipcC0uREL8PaEilThWUmmroyfQAS
 TlUsEAGYzng3yXPVXkXMMfoLiLpbHlxP9kaND72GVm7p2xFFDPPpnIphwtfy2EkPk1CiymUtUKzSqQAHg3dk8rU5Zs194RS/H/97mUrHetp9VE8Ft8kQG/KT
 D0XEnMNro3zf/GsVuSgxmGu4tE+tM2M2ncYW5to14NRtymdYjOkb2Ow1wscQWybnypWJ6rvWshsOAeT3AoYVj/vJgXIVPeBfrpSPA8RVhlRT1R10/XrPBX5U
 Uudh3vVL
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on Aarch64
 host for powerpc64 target
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building on Aarch64 host for powerpc64 we get this error:
gcc: error: unrecognized command-line option '-m64'

This happens because we don't have the flexibility to override the LDFLAGS
when linking nsinstall host tool that is built in libnss. Also libnss uses
the same LDFLAGS it uses for target and that is not correct.
So let's add a patch to add NATIVE_LDFLAGS variable to override LFDFLAGS
when building nsinstall utility and set it to HOST_LDFLAGS in libnss.mk

Fixes:
http://autobuild.buildroot.net/results/67500395f19aa698b98404cde8d20463e55504bf/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Patch is pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1771036
---
 ...36-Fix-build-failure-on-Aarch64-host.patch | 36 +++++++++++++++++++
 package/libnss/libnss.mk                      |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch

diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
new file mode 100644
index 0000000000..2ca373cd21
--- /dev/null
+++ b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
@@ -0,0 +1,36 @@
+From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 24 May 2022 23:40:45 +0200
+Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
+
+If trying to build on Aarch64 host for powerpc64 target we can't override
+the LDFLAGS leading to this build failure:
+gcc: error: unrecognized command-line option '-m64'
+
+So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
+any build environment can pass LDFLAGS that fits better for host
+architecture.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ coreconf/nsinstall/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
+index 08dfbc2fe..5061789ff 100644
+--- a/nss/coreconf/nsinstall/Makefile
++++ b/nss/coreconf/nsinstall/Makefile
+@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
+ OS_CFLAGS=$(NATIVE_FLAGS)
+ endif
+ 
++ifdef NATIVE_LDFLAGS
++LDFLAGS=$(NATIVE_LDFLAGS)
++endif
++
+ include $(DEPTH)/coreconf/rules.mk
+ 
+ # Redefine MAKE_OBJDIR for just this directory
+-- 
+2.34.1
+
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 540092dfcf..0d0f1d84b9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -92,7 +92,9 @@ define LIBNSS_BUILD_CMDS
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
+		$(LIBNSS_BUILD_VARS) \
+		NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX" \
+		NATIVE_LDFLAGS="$(HOST_LDFLAGS)"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
