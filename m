Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C210C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBD00409DE;
	Mon, 14 Nov 2022 07:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD00409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8as8WQDS8mCK; Mon, 14 Nov 2022 07:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC87409D9;
	Mon, 14 Nov 2022 07:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC87409D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 663361BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41216409D9
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41216409D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZY5PDscSNtV for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EBD0409D6
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EBD0409D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D5CD838C2; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 08:16:04 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: adc5d125397c841d8e8d9791a975636cc629d782
X-Git-Newrev: ee698523b2d4bf766caca94fa1faf15d832ec645
X-Patchwork-Hint: ignore
Message-Id: <20221114072057.2D5CD838C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libidn2: fix
 build with libunistring
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee698523b2d4bf766caca94fa1faf15d832ec645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libunistring raised since the
addition of the package in commit
ffb85a4a16df94e4980057a194e5fdc3c8332e32:

/home/autobuild/autobuild/instance-2/output-1/per-package/libidn2/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: warning: libunistring.so.2, needed by ../lib/.libs/libidn2.so, not found (try using -rpath or -rpath-link)
/home/autobuild/autobuild/instance-2/output-1/per-package/libidn2/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../lib/.libs/libidn2.so: undefined reference to `u8_strconv_to_encoding'

[...]

aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

Fixes:
 - http://autobuild.buildroot.org/results/30ac50512cd4b4cb3ecc97514a72d1f316a1b33a
 - http://autobuild.buildroot.org/results/c225ff4ef007b9a3ca56e6b601687aaa33699675

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9e5b0255d47babf45f1f6e13dccf65bbbc9f84c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn2/libidn2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 19fbe4aafd..778e26225e 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -13,10 +13,12 @@ LIBIDN2_DEPENDENCIES = \
 	host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN2_CONF_OPTS = --without-included-libunistring
 LIBIDN2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
 LIBIDN2_DEPENDENCIES += libunistring
+LIBIDN2_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr/lib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN2_BINARY),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
