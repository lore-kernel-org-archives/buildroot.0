Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D84C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C49400C6;
	Fri, 28 Jan 2022 12:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zJYmZ-vLXQY; Fri, 28 Jan 2022 12:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A731B404CD;
	Fri, 28 Jan 2022 12:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4651C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08AB584C69
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2R1xGuUzqGYT for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:46:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4529984C64
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:46:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D32F818E2; Fri, 28 Jan 2022 12:39:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:32:38 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: bf066e053c6f0e84294dae7f5cf908064f6e7623
X-Git-Newrev: 4d77ea65bb7e23083b0af6ea0625bb7e7a973491
X-Patchwork-Hint: ignore
Message-Id: <20220128123916.3D32F818E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gst1-rtsp-server: fix introspection
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d77ea65bb7e23083b0af6ea0625bb7e7a973491
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit fa3e7a63b93620b8227d66c6a973cd6140432cf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
