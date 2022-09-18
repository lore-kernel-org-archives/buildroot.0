Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621DC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8541860E82;
	Sun, 18 Sep 2022 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8541860E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdgVvZNgFn8R; Sun, 18 Sep 2022 21:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E7560BE7;
	Sun, 18 Sep 2022 21:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E7560BE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 218231BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 681D740A38
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681D740A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRBY7LiuxxCN for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AE02403E7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AE02403E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73E98856ED; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:14:53 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 34084edd257a436edf97b7e9d9c048fa4260c294
X-Git-Newrev: d67813e586158b0a9421bb0af3bddeebe32277d4
X-Patchwork-Hint: ignore
Message-Id: <20220918212044.73E98856ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/qt5/qt5xmlpatterns: fix build failure due to gcc bug 90620
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

commit: https://git.buildroot.net/buildroot/commit/?id=d67813e586158b0a9421bb0af3bddeebe32277d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The qt5xmlpatterns package exhibits gcc bug 90620 [0] when built for the
Microblaze architecture with optimization enabled, which causes a build
failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y.

Fixes:
    http://autobuild.buildroot.net/results/346/346e6d502a8927c8e95eea156f5b2943a85d0a6b/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ddedf5e785956d37bd971f1f804f8333cd9cc592)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 27818ecb78..08f6d56747 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -20,4 +20,8 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
+QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
+endif
+
 $(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
