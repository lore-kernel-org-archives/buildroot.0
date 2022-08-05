Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26547C25B08
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC4E240AA1;
	Fri,  5 Aug 2022 16:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC4E240AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMDlLe15ipfa; Fri,  5 Aug 2022 16:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CD04044D;
	Fri,  5 Aug 2022 16:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CD04044D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109391C11A5
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB3F8125D
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB3F8125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTZYZBP8aGQf for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:32:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 719D780AC0
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719D780AC0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6CBF586E9A; Fri,  5 Aug 2022 16:18:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Aug 2022 18:31:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 240aae4793022e4fe26ed7fa745d30e33a02fc4b
X-Git-Newrev: 32e97c658860572ca7a2dd22dc6bea0ca6f04eb4
X-Patchwork-Hint: ignore
Message-Id: <20220805161835.6CBF586E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: create symlinks
 for libGLESv2 and libGLESv1_CM.so
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

commit: https://git.buildroot.net/buildroot/commit/?id=32e97c658860572ca7a2dd22dc6bea0ca6f04eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At least libepoxy, a user of OpenGL ES, expects libraries to be
available as libGLESv2.so.2 and libGLESv1_CM.so.1. While other OpenGL
implementations comply with this, gcnano-binaries does not, and
installs its libraries directly as .so, without any ABI version,
causing runtime failures with libepoxy or SDL2, as it tries to
dlopen() the OpenGL ES libraries with their ABI suffix.

See for example the libepoxy code:

  https://github.com/anholt/libepoxy/blob/master/src/dispatch_common.c#L191

Fix this issue by adding the relevant symlinks.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcnano-binaries/gcnano-binaries.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index dc309ec3c2..ce9b24cc3a 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -44,10 +44,17 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
 
+# This creates:
+#   libGLESv2.so.2    -> libGLESv2.so
+#   libGLESv1_CM.so.1 -> libGLESv1_CM.so
+# symlinks, as most OpenGL implementations have them, and they are
+# expected by some users such as libepoxy.
 define GCNANO_BINARIES_INSTALL
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
 	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
 	find . -type l -exec cp -a {} $(1)/usr/lib \;
+	ln -sf libGLESv2.so $(1)/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv1_CM.so $(1)/usr/lib/libGLESv1_CM.so.1
 	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
