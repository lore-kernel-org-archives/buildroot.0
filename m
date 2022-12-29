Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC5C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5950D813F6;
	Mon, 20 Feb 2023 23:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5950D813F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4QCOCkZMofk; Mon, 20 Feb 2023 23:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8785783F03;
	Mon, 20 Feb 2023 23:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8785783F03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76DC11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B377612B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B377612B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POaDSWPFpNz7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 232B96108B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 232B96108B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 189D38648F; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:05:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 96d3e5fd2f5310e9f626084669a9ddaa55c92eda
X-Git-Newrev: 08ca8ff727c87fce2c6edcb9fc2df0885c22543b
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.189D38648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tiff: add libdeflate
 optional dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=08ca8ff727c87fce2c6edcb9fc2df0885c22543b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libdeflate is an optional dependency which is enabled by default since
version 4.2.0 and
https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tiff/Config.in | 5 +++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index f842c2ead8..cc9aa5cfd0 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -11,6 +11,11 @@ config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
 	default y
 
+config BR2_PACKAGE_TIFF_LIBDEFLATE
+	bool "Libdeflate usage (still requires Zlib)"
+	select BR2_PACKAGE_LIBDEFLATE
+	select BR2_PACKAGE_TIFF_ZLIB
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7981bdf2c9..a753065fde 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -33,6 +33,13 @@ ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_LIBDEFLATE),y)
+TIFF_CONF_OPTS += --enable-libdeflate
+TIFF_DEPENDENCIES += libdeflate
+else
+TIFF_CONF_OPTS += --disable-libdeflate
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
 TIFF_CONF_OPTS += --disable-packbits
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
