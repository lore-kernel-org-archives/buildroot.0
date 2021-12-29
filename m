Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF67CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 17:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DCA826C1;
	Wed, 29 Dec 2021 17:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIlEP2C5TBze; Wed, 29 Dec 2021 17:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9DC82438;
	Wed, 29 Dec 2021 17:32:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6651BF36C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37D8E607B5
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vz7YgclBoQqu for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 17:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68606606E7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6102782965; Wed, 29 Dec 2021 17:26:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 18:31:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88c60dbe91a7193f888d01e73f4fe0aa3e8d5d57
X-Git-Newrev: a60b29937bb753846c21d966eca6737d9a5477ad
X-Patchwork-Hint: ignore
Message-Id: <20211229172620.6102782965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=a60b29937bb753846c21d966eca6737d9a5477ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with -latomic if needed to avoid the following build failure since
bump to version 2.68.2 in commit
dddb65efbdf2c7952f22a1e51009f17f1676db4a:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: glib/glibmm/libglibmm-2.68.so.1.3.0.p/main.cc.o: in function `Glib::Source::reference() const':
main.cc:(.text+0xd40): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/6a2709956fbb16ac3cbf676acb242c88f83fcdae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 578267c75e..525da6b618 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -15,9 +15,15 @@ GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
 GLIBMM_CONF_OPTS = -Dbuild-examples=false
 
 GLIBMM_CXXFLAGS = $(TARGET_CXXFLAGS)
+GLIBMM_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 GLIBMM_CXXFLAGS += -O0
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GLIBMM_LDFLAGS += -latomic
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
