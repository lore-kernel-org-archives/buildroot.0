Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F22DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFA381B9A;
	Sun,  3 Apr 2022 19:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WjvY0xw136b; Sun,  3 Apr 2022 19:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B09781B70;
	Sun,  3 Apr 2022 19:05:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 324331BF995
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F8A040395
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVLnClY9F_P0 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635AA40376
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 09CAA8607A; Sun,  3 Apr 2022 18:55:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:03:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c49b46e9cc90e4c974225413bde15fdeb5de446c
X-Git-Newrev: f413bf2c641954d2202287c3858a007a24e02a6a
X-Patchwork-Hint: ignore
Message-Id: <20220403185526.09CAA8607A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: zlib is optional,
 not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=f413bf2c641954d2202287c3858a007a24e02a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is not mandatory since at least version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/fc1c25f9c7af440f2fc579b150025addfa5421a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cppcms/Config.in | 1 -
 package/cppcms/cppcms.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 1d7635a83e..25fd93a7d0 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index b289617bbc..530b44427b 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
+CPPCMS_DEPENDENCIES = pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
@@ -28,6 +28,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
+CPPCMS_DEPENDENCIES += zlib
+else
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=ON
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
 CPPCMS_CONF_OPTS += -DDISABLE_POSIX_LOCALE=on
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
