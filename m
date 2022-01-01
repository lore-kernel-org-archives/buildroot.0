Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFFB60A94;
	Sat,  1 Jan 2022 13:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUyMl9HfJCgO; Sat,  1 Jan 2022 13:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370D360B4A;
	Sat,  1 Jan 2022 13:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0821BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C304019D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqNY6BKNCuje for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:06:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FCB140133
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D31538261A; Sat,  1 Jan 2022 13:00:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 14:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20dd9453f32c9898ae4a0dc482bbb0a21853090c
X-Git-Newrev: e644e5df39c4d63ce7ae28ce2d02bfbf2a230cff
X-Patchwork-Hint: ignore
Message-Id: <20220101130033.D31538261A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: enable options when
 libcurl is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=e644e5df39c4d63ce7ae28ce2d02bfbf2a230cff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump to 8.1910.0, items requiring libcurl were
disabled by default. This patch selectively enables options
which depend on libcurl when that package is enabled in the
build.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Fabrice: Disable mmkubernetes which also depends on lognorm and while
at it also disable mmnormalize which is available since version 6.1.2
(from 2010) and
https://github.com/rsyslog/rsyslog/commit/b9d3cdceabf91bc28f8f6d31cfe9332724e37bbf]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rsyslog/rsyslog.mk | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6cf53ccb82..afd1a5557e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -28,14 +28,29 @@ endif
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-# Disable items requiring libcurl
-RSYSLOG_CONF_OPTS += --disable-elasticsearch \
+# Disable items requiring lognorm
+RSYSLOG_CONF_OPTS += \
+	--disable-mmkubernetes \
+	--disable-mmnormalize
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+RSYSLOG_DEPENDENCIES += libcurl
+RSYSLOG_CONF_OPTS += \
+	--enable-clickhouse \
+	--enable-elasticsearch \
+	--enable-fmhttp \
+	--enable-imdocker \
+	--enable-omhttp \
+	--enable-omhttpfs
+else
+RSYSLOG_CONF_OPTS += \
 	--disable-clickhouse \
-	--disable-omhttp \
+	--disable-elasticsearch \
 	--disable-fmhttp \
 	--disable-imdocker \
-	--disable-omhttpfs \
-	--disable-mmkubernetes
+	--disable-omhttp \
+	--disable-omhttpfs
+endif
 
 ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
 RSYSLOG_DEPENDENCIES += civetweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
