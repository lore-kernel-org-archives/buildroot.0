Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48695C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F245460E3D;
	Sun, 19 Jun 2022 13:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F245460E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uxPst7mv8Vt; Sun, 19 Jun 2022 13:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B2AA60B78;
	Sun, 19 Jun 2022 13:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2AA60B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17F6F1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F39C460AAD
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39C460AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBGCRoxvt0bx for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:43:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB0FC60E2C
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0FC60E2C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0C7487305; Sun, 19 Jun 2022 13:31:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:42:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3fa20a575ab30cafffbac613c727b00f8bda2f6f
X-Git-Newrev: 5b53f4072ba4adeca5d74949a0b3f3b3b2070ddb
X-Patchwork-Hint: ignore
Message-Id: <20220619133121.B0C7487305@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libmediaart: link
 with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b53f4072ba4adeca5d74949a0b3f3b3b2070ddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
raised since bump to version 1.9.5 in commit
3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libmediaart/libmediaart-2.0.so.0.905.0.p/extractqt.cpp.o: in function `std::__atomic_base<int>::operator--()':
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/10.3.0/bits/atomic_base.h:334: undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/39aa4ecd37de774e06f67a6e1c4495dc1f0917b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bd396de5ecd0c26be64e3c8fcd6edc9afe8dec1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmediaart/libmediaart.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 77665fd95b..de92cde849 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -24,6 +24,9 @@ else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 LIBMEDIAART_DEPENDENCIES += qt5base
 LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBMEDIAART_LDFLAGS += -latomic
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
