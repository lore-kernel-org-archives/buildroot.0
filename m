Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02F4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D23840932;
	Fri,  3 Dec 2021 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2_7-SETk7jl; Fri,  3 Dec 2021 16:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F62440923;
	Fri,  3 Dec 2021 16:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF791C1148
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE604098F
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBFzwj4I4sA4 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 733DC40977
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21FB092404; Fri,  3 Dec 2021 16:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 17:44:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4483f1aabccd49c917fc464372b09ba053c0d16
X-Git-Newrev: ff420a3195281460322c82e9d6f6106113699531
X-Patchwork-Hint: ignore
Message-Id: <20211203164019.21FB092404@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstreamer1: fix girdir
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff420a3195281460322c82e9d6f6106113699531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As already done for libglib2 in commit
b094f88a4d501101bfba9b65491209e6a0fe0397, fix girdir to avoid the
following build failure with gst1-plugins-base and introspection:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst-libs/gst/tag/GstTag-1.0.gir --output gst-libs/gst/tag/GstTag-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir

Fixes:
 - http://autobuild.buildroot.org/results/d1e2bdde97777ff61c185d375ba412a93e7ca467

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 9bdd00caec..1aab035e05 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -49,4 +49,14 @@ endif
 
 GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# By default, girdir uses datadir as its prefix of which pkg-config will not
+# append the sysroot directory. This results in a build failure with
+# gst1-plugins-base. Changing prefix to ${libdir}/../share prevents this error.
+define GSTREAMER1_FIX_GIRDIR
+	$(SED) "s%girdir=.*%girdir=\$${libdir}/../share/gir-1.0%g" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-1.0.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-base-1.0.pc
+endef
+GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_FIX_GIRDIR
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
