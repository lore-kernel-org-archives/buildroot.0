Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33083ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8DFB4041C;
	Sun, 11 Sep 2022 19:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8DFB4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bky3jmpwzqdj; Sun, 11 Sep 2022 19:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47DE40119;
	Sun, 11 Sep 2022 19:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47DE40119
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83DAF1BF281
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A8B3424DF
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8B3424DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as60OCxyCVo9 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:42:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0B3424DD
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0B3424DD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 536D683701; Sun, 11 Sep 2022 19:42:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 21:39:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d35fd78cf44c1764b21e396bd383bd8e65a5ac
X-Git-Newrev: ddedf5e785956d37bd971f1f804f8333cd9cc592
X-Patchwork-Hint: ignore
Message-Id: <20220911194240.536D683701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5xmlpatterns: fix build
 failure due to gcc bug 90620
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddedf5e785956d37bd971f1f804f8333cd9cc592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 3bb4ef74fd..6711e9bf70 100644
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
