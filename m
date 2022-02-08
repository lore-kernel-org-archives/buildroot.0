Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5427C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F7DC60F27;
	Tue,  8 Feb 2022 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXdmtRrqs-an; Tue,  8 Feb 2022 21:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5450F60F38;
	Tue,  8 Feb 2022 21:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8F61BF9A4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92E50408CF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWKO9SKSNGXT for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA8D840133
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355448;
 bh=1bdUtbAxXnLIotVtpz2S9s1EY0LPjshvK2CdfiNHzWw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B+J16KBUCFRFjI8ZBdF3el3iy45ZmsaLccSeMl9xKksYraWOuY4d9cTMwI62ZUBp2
 zCpQhIUSyfmQotZtmjkBeq9JSXf9dAbQhh1zpKxTXi6oyi576mCsl50c+Fv2a4b/f5
 nHYhJKpz7U57sr8Iqjsae+lDmc9kJkvZtmTGxdFM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0G1n-1oDKz11TQV-00xMCg; Tue, 08
 Feb 2022 22:24:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:01 +0100
Message-Id: <20220208212405.19243-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5qpZy/+48BJdv1+I6N8cK/9R7DgxYpIaqNlr/FOUfj3wP93WHul
 hIStlpyQKGpPB/wizfMK4iRYvyj+ODdkc1Z80/EWdek5czge7+zV0eQDfFRp3mh4GEBzE4s
 6bweQ9oVFAOtK+MQmqrZ0MQLSpAWxlbG62fR8clSuDmc/lRPXM+Le+s4aj723+tQ9UelEUR
 bQ8dgiULGXHI8n7UdXtbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QAuQ3RhizBI=:d8FHYVyee7N/+Vbga7PGgf
 xDEeQ8TR6Ju0mf3x2Cblwd8f0V2efFBBf5vRH+owXmSYdJgxWd8ZWbxXYM0o2h6FUe7om+9y8
 VUmYi8qo4PCFUrvdCHotb1gUBegSP+9NcwvknQt8ZwSUxrnYJSSfbW8aZHcO4XHo88jC+MkyU
 +yxoNscJa8ogSODChYArjcrLpykxNQgCKgjgfZCb29OYQrV5Um6saeIXbhG5kjTVhvB8c0JYs
 8OG4TeGV5cLViF5LFcRev4wXi+ptTqBo0YZe1xfWSHp9xnv753dFCljTluhv2suuH4WBVb1QJ
 kd+i48B1RtQwaU/TiN3e+1JTVSK4RPCkO3pbdXlUvMUTSODOxb5/jfpHAlh0CvKScDAAd9moY
 NnwWWihyFUb1qySwrkje31J8EkgWJy+8Wa2qo366eol2ak7Wk4ZrtR8eq+N4MunS18ajVhb4c
 Pe70UJ4A9TYpZ3nNAbYZAXavOHd9HYerA2FYGqn8yQQnMkIrToKaOhP01LCgdbscC4kw/djLR
 gxUDwJ5YPSYYr54QeQDXWYxccHnJ3x5WKm/X6BiCH0wx7fG15/norVxF8teLjKU+sNs9KkgXE
 eWR5AYZQZ3z7ZI70rd5Sl7/nb84OR7f42K9tHo6vSVKxO4esar3MiEX3kL5qO7QA7/xkhbxKt
 UPJJtcpmuvovUy6TwlD8ysscYIb2VJhpkjtwQaaAlbEMXz1dN4fsL2Z5dbCkONo9aGLRXJUZT
 wnLx2MeMZhi/J108vegMGbUy2AiHDTb178DH5kIJnQ8dcN1Uh0yXgsjVEEJF3s1DNlGEGRI7G
 KUVeaMj56upt6zYH2BrU97ihmpxYzVf9vaZ35/GCdUrgwedAV59bd8Q/WdwgEyGgbPyHrVisw
 R8vn/LCx6SYQtJA1eANgAXA/5g7JBL9Lp4uPMy3eWS+wObXwI0eE2PQVuMD8UZiavAQ3qY4/5
 BZNcppdHprN6e9FtQnkL7fbBXMQA/xdaTasf6YnwQbEldG/8t699OPnis5IsGLpfU3FkffC3P
 u/wMaKtVVFM98QnS6/Jejp8NtoCINf1AUThlJtSar8UmvhO5QmN9QSbuf+WhfjdMtbKM1P1mD
 Xnu6Wyzf4VVWik=
Subject: [Buildroot] [PATCH v1 09/13] package/gst1-rtsp-server: bump version
 to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- removed 0001-gst-rtsp-server-meson.build-add-gst_dep.patch
  (upstream accepted [1])

- update COPYING/COPYING.LIB hash (license text update from LGPL-2.0+ to
  LGPL-2.1+, see [2]) and adjust GST1_RTSP_SERVER_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e637aae629f5b95b748a6f23abecc2b502272822.patch
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/cc5cdab0165e3bdf5f4f748b3ba2a3493d304e70.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-rtsp-server-meson.build-add-gst_dep.patch | 41 -------------------
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  8 ++--
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  4 +-
 3 files changed, 6 insertions(+), 47 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
deleted file mode 100644
index b63f634598..0000000000
--- a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b6bc8fbb72d6d3914c616dc64d15b961493cb9c2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 20 Dec 2021 10:09:36 +0100
-Subject: [PATCH] gst/rtsp-server/meson.build: add gst_dep
-
-Add gst_dep to gst_rtsp_server_deps, in the context of buildroot, this
-will avoid the following build failure, because the correct girdir
-location will be retrieved from gstreamer-1.0.pc:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
-Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
-error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
-If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
-Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
-
-Fixes:
- - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/merge_requests/217]
----
- gst/rtsp-server/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/rtsp-server/meson.build b/gst/rtsp-server/meson.build
-index 24d7c39..874da14 100644
---- a/gst/rtsp-server/meson.build
-+++ b/gst/rtsp-server/meson.build
-@@ -55,7 +55,7 @@ rtsp_server_headers = [
- 
- install_headers(rtsp_server_headers, subdir : 'gstreamer-1.0/gst/rtsp-server')
- 
--gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep]
-+gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep, gst_dep]
- gst_rtsp_server = library('gstrtspserver-@0@'.format(api_version),
-   rtsp_server_sources,
-   include_directories : rtspserver_incs,
--- 
-2.33.0
-
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index fadef41351..00ff974c6e 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.6.tar.xz.sha256sum
-sha256  826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9  gst-rtsp-server-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.0.tar.xz.sha256sum
+sha256  c209f5ed906da713fdd44a8844e909aa6c8af3dfb630259b092cfb77a7755843  gst-rtsp-server-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 55403754f3..d22dd5e7cc 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.18.6
+GST1_RTSP_SERVER_VERSION = 1.20.0
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
-GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
+GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
 GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
 GST1_RTSP_SERVER_CPE_ID_VENDOR = gstreamer_project
 GST1_RTSP_SERVER_CPE_ID_PRODUCT = gst-rtsp-server
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
