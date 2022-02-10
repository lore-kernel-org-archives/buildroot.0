Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF69C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7CF040546;
	Thu, 10 Feb 2022 19:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FeQ1srivb5r; Thu, 10 Feb 2022 19:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C08D8402BC;
	Thu, 10 Feb 2022 19:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9F41BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C92E40156
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36DlPoMYUqGy for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 747D7401F2
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521348;
 bh=1bdUtbAxXnLIotVtpz2S9s1EY0LPjshvK2CdfiNHzWw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Dw2Hs8v+QD4xNoN0dK5pQsSDjx4hWg/6XcQ3hhq22HJmQfMqCyblyTkcyEkV2HfrH
 XNDfAuC1MDpDQklUT4g80Zj9xg2IrrxzXr8MWY7fnbgxv5t2PlM6vxAYawQRZCl6bx
 WDsCSI5HQq2QIXckv4/Tu8ozXlF4T3mYDJXJDLbk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1nvA7I3fbL-00fmYA; Thu, 10
 Feb 2022 20:29:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:01 +0100
Message-Id: <20220210192905.4500-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AynQ01UFMP06YfcNAGb9zzUR4DNvY7w2Ile09XeUQ38hMtFqMXI
 5ZHkCzVjLZi1Ewco1VTm/ud5bwc0DQ6Z6Jh4c2j13f3M2DJimjZe3CKYjVU6zw7Ot6tUbPo
 8K/Y08xDQy6QsgfefttGR2dOxLdTn/YleaIevoRkF25ksV+1vp+zLZWiNGuLGyvn9sC4zFt
 uMvATKY1U1ii7i6KY1kow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AmUjmNnZP74=:vJBWR5uYtoMQAobB9KHhIA
 09fPuLTWolX23XdbP03DgJHSF/Hmdf+bYDf5OuZkvqV8ylJIc+ntOhFrJaTb/E9Zm+ir68FYA
 VqsDYLeC9HlCG0A9xsrd6nSB29RQcvvsu3D45soDrLtinUB2DjBNFAqHm3ICgd3C+IjMNu+kQ
 aOoZ1YT/s+AdCAihcDM6ZGISz5kYM4UZpCY96a+k9cH18aN9R1xpMXkK0wp+1bgGkLxoCxiGh
 QstfMpQc2qMJmWuuXjtPmla1SeDZvYYG2RKsLhzh/dLVU8hxiIQfmtKDsYRMnEIMEhsNMrAEl
 vHtl7DYUB0Bu+LrGH2KAUtkwixAbpZK2yr3wuPNvJmHCDtBcsqU7TDVmyPRMs5YnUlAw7lUec
 hXf+fWZancphvdpV/j70Uzs6yGwf9qooc/d6lNdyGQql4SBA0CAueFLPQ8YfBn0qkpRunc2BA
 ATpltc5oeP9BJC+yKSqRUqZr6erbCvGROO+wMTxvBZincH/v36dFOqhYx1Iht3z8FtL0RhGwu
 bPxcNcABwruPsYn6Vg0sNlC/qrZl00EfwP/kREgf54x3KJWV2b1DE9xdBQODPMbktB1tA0eZb
 zuSpbsH2H4trHdgRckiVej6J+KYg6Jo7Yo3my5bGRfIb0UUBvnIHX4UlrIDwOtSWUaFafv1zo
 3+1EcP3wQ+va9YbSYmCMA7i25sQOefzDH0c0MvqIr6FvycELN5dgLxh0IlcvrSW0WzHsAQEDP
 iQ1NNXu23iobo6HsR0DwjVzl7iJinUPcqh/zH/q4+gb2u63bulyGpTQEctT6uoEP43zvTrgmS
 rC2Jz7rpffZKVPsInwGM0VD1YiLu4YOlFuhefjiDWSXvDx4g9GsHtq5qwLHgF8U9/fOvSXOkD
 fpJuPKTnS7C49mhikI+nUwKYBGQzAMoxCGC53lBd9vojbKdrMFDu+EV4G+rN96XpGNuIITVId
 QWfAc7drg4s4Wmf04C8U0AvVSFNtzh9oLv3GbD8u/5PGiD7tuexHCbMbwiF8ctO01F9EMMDar
 xw47s28GTCjBPthH0OY8MmPMb0uyD5nyyW54bug43UGhP5oXOPAWbgAqkq/RYHpc4koGOORii
 DiYkxSUQso//JA=
Subject: [Buildroot] [PATCH v2 09/13] package/gst1-rtsp-server: bump version
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
