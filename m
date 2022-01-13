Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2745C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BBC7401CE;
	Thu, 13 Jan 2022 21:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAqY8U4Wg82W; Thu, 13 Jan 2022 21:07:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AB9640222;
	Thu, 13 Jan 2022 21:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF2F1BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749FC6FC74
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhlTiPkbK_KU for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:07:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41616FC73
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5938B83591; Thu, 13 Jan 2022 21:00:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 22:02:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b8abbe72c281bf646373b53abc2471631b8be71
X-Git-Newrev: fa3e7a63b93620b8227d66c6a973cd6140432cf3
X-Patchwork-Hint: ignore
Message-Id: <20220113210055.5938B83591@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-rtsp-server: fix
 introspection
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa3e7a63b93620b8227d66c6a973cd6140432cf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with introspection:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-gst-rtsp-server-meson.build-add-gst_dep.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
new file mode 100644
index 0000000000..b63f634598
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
@@ -0,0 +1,41 @@
+From b6bc8fbb72d6d3914c616dc64d15b961493cb9c2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 Dec 2021 10:09:36 +0100
+Subject: [PATCH] gst/rtsp-server/meson.build: add gst_dep
+
+Add gst_dep to gst_rtsp_server_deps, in the context of buildroot, this
+will avoid the following build failure, because the correct girdir
+location will be retrieved from gstreamer-1.0.pc:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
+Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
+If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
+Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/merge_requests/217]
+---
+ gst/rtsp-server/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/rtsp-server/meson.build b/gst/rtsp-server/meson.build
+index 24d7c39..874da14 100644
+--- a/gst/rtsp-server/meson.build
++++ b/gst/rtsp-server/meson.build
+@@ -55,7 +55,7 @@ rtsp_server_headers = [
+ 
+ install_headers(rtsp_server_headers, subdir : 'gstreamer-1.0/gst/rtsp-server')
+ 
+-gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep]
++gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep, gst_dep]
+ gst_rtsp_server = library('gstrtspserver-@0@'.format(api_version),
+   rtsp_server_sources,
+   include_directories : rtspserver_incs,
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
