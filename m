Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9546BC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FB0440018;
	Sun, 24 Dec 2023 18:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB0440018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 76T7yssbwj3z; Sun, 24 Dec 2023 18:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0161F4052F;
	Sun, 24 Dec 2023 18:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0161F4052F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 195F41BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C67410E3
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6C67410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tioMpvtA_92z for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:39:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F66409FB
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F66409FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E41A582852; Sun, 24 Dec 2023 18:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 19:38:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c81af1667f74edaa977fa7c8677555c8efaaa068
X-Git-Newrev: df89e73e92abcddfdfa5d61cd00757a7c80a699d
X-Patchwork-Hint: ignore
Message-Id: <20231224183908.E41A582852@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: add option to build
 host-imagemagick with XML support
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

commit: https://git.buildroot.net/buildroot/commit/?id=df89e73e92abcddfdfa5d61cd00757a7c80a699d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
https://github.com/ImageMagick/ImageMagick/commit/25e3a4f3845f59536d19aba0ac0580aa6715147f
(which first appeared in version 7.1.1-19), ImageMagick does not trust
unvalidated XMP profiles in images anymore.

If such a XML profile is encountered inside e.g. a PNG image the
processing is aborted. Validating the XMP profile requires that
ImageMagick is compiled with XML support.
As host-imagemagick supports PNG file also activate XML support.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/Config.in.host | 11 +++++++++++
 package/imagemagick/imagemagick.mk | 14 +++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 5055101e23..26912e5f04 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -18,6 +18,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
+	select BR2_PACKAGE_HOST_IMAGEMAGICK_XML
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -29,4 +30,14 @@ comment "SVG support needs host gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_HOST_IMAGEMAGICK_XML
+	bool "XML support"
+	help
+	  Say 'y' here if you need ImageMagick to support XML. Indeed,
+	  ImageMagick does not trust unvalidated XMP profiles in
+	  images. If such a XML profile is encountered inside e.g. a
+	  PNG image the processing is aborted. Validating the XMP
+	  profile requires that ImageMagick is compiled with XML
+	  support.
+
 endif
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 719c6768af..53cf02abf4 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -238,22 +238,26 @@ HOST_IMAGEMAGICK_DEPENDENCIES += \
 	host-fontconfig \
 	host-freetype \
 	host-librsvg \
-	host-libxml2 \
 	host-pango
 HOST_IMAGEMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(HOST_DIR)/bin/xml2-config
 HOST_IMAGEMAGICK_CONF_OPTS += \
 	--with-fontconfig \
 	--with-freetype \
 	--with-pango \
-	--with-rsvg \
-	--with-xml
+	--with-rsvg
 else
 HOST_IMAGEMAGICK_CONF_OPTS += \
 	--without-fontconfig \
 	--without-freetype \
 	--without-pango \
-	--without-rsvg \
-	--without-xml
+	--without-rsvg
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_IMAGEMAGICK_XML),y)
+HOST_IMAGEMAGICK_CONF_OPTS += --with-xml
+HOST_IMAGEMAGICK_DEPENDENCIES += host-libxml2
+else
+HOST_IMAGEMAGICK_CONF_OPTS += --without-xml
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
