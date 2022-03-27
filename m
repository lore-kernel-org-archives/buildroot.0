Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CC7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F02B860E6F;
	Sun, 27 Mar 2022 16:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KK2htAByKkkj; Sun, 27 Mar 2022 16:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0232E60B9D;
	Sun, 27 Mar 2022 16:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29BD81BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A044098B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5r03LdTJEAN for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7455740986
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1C33885DB9; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:55:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f3d6d2e6a924b9075accb27cf5d7351a30d8f17
X-Git-Newrev: d76b7564f1bb61762181ecd1fc69c72a925ed25c
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.1C33885DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: fix build without
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=d76b7564f1bb61762181ecd1fc69c72a925ed25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads and openvpn raised since
commit 0199dc161769e5f28e9aebc634230ece08ff5008:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'

Fixes:
 - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...kcs11h-core.c-fix-build-without-slotevent.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
new file mode 100644
index 0000000000..5b2829c5ca
--- /dev/null
+++ b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
@@ -0,0 +1,37 @@
+From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Mar 2022 08:50:15 +0100
+Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
+
+Fix the following build failure with --disable-slotevent:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
+---
+ lib/pkcs11h-core.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
+index d7bb4cd..0bf11e8 100644
+--- a/lib/pkcs11h-core.c
++++ b/lib/pkcs11h-core.c
+@@ -726,9 +726,11 @@ pkcs11h_setProperty (
+ 
+ 	switch (property) {
+ 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
++#if defined(ENABLE_PKCS11H_SLOTEVENT)
+ 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
+ 				goto cleanup;
+ 			}
++#endif
+ 		break;
+ 	}
+ cleanup:
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
