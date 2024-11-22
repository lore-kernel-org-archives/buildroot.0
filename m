Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA96E69186
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 18:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8160A60624;
	Fri, 22 Nov 2024 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhqYnjcTeoIP; Fri, 22 Nov 2024 18:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955476111B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955476111B;
	Fri, 22 Nov 2024 18:10:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B660E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C20240120
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhNILWZz-jSg for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 18:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34F5640096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F5640096
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F5640096
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:10:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B3FF6B00539;
 Fri, 22 Nov 2024 19:10:21 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Fri, 22 Nov 2024 19:10:14 +0100
Message-ID: <20241122181014.96629-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732299023;
 bh=5K8fr6X4jWivNpwzcE1+KZiEkE0AleCokKNnzyjeV9g=;
 h=From:To:Cc:Subject:Date:From;
 b=oGN6mlTrn4lctA6vFS/b9tfk9wbTEp/jg0+VnY6Ilwfq4g46O9Ug3bCOO6uV+QDfB
 P3Kynf9mO1ft//l3UM+rKky88J4c+lB+g29Xmobaf+VTzWJ2YHgDjBSyybU62tNsTy
 90krVpxdn3sWGtTPYI/DwqlgytI3/Ry6qL1ULFXl2SSS8yGRAYdHgpTzNq4zORzeKR
 65SkiMZxMc4pYVWuDjxxqP8/pH5i7SIuV5jLx6x45VZSFcd4cks7OLcsVbAD4gl8rg
 Fd18DVqXIYctqwaozq64y6iIxXuWSXAT5+3fQ0Nm0y6g4DIIPHNx2y8nxbeGpwNimT
 nXDSm4i8/BBbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oGN6mlTr
Subject: [Buildroot] [PATCH v2 1/1] package/util-linux-libs: allowing
 building even on non-Y2038 compliant systems
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of util-linux to version 2.40.2 in Buildroot commit
f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
to 2.40.2"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

"--disable-year2038" was already added to util-linux in commit
11ae90b00 "package/util-linux: allowing building even on non-Y2038
compliant systems".

Fixes:
https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Change v1 -> v2:
- Add comment near --disable-year2038 (comment from Vincent)
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 0337e7e13a..9340d5ae4f 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -26,9 +26,13 @@ UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. util-linux-libs will support year2038
+# if the system is compliant even with this option passed
 UTIL_LINUX_LIBS_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown
+	--disable-makeinstall-chown \
+	--disable-year2038
 
 UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
