Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F40DE7719A
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78AD60D9C;
	Wed,  8 Jan 2025 22:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkN_x8QMAUde; Wed,  8 Jan 2025 22:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E323260BAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E323260BAE;
	Wed,  8 Jan 2025 22:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 087E11EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 235A2409C1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErcsKw48l9gE for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DE6A40970
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DE6A40970
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72DD683F26; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:17:50 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 92f81d78a4bf4aeb7e4f18e236275cc50d68a22c
X-Git-Newrev: 1fae268c4e7b783827b883c53aadd5901d7e8356
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.72DD683F26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/c-icap: memcached
 code needs <crypt.h>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1fae268c4e7b783827b883c53aadd5901d7e8356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The memcached code of c-icap needs <crypt.h>, which is no longer
provided by glibc since glibc 2.39. So add some logic to add a
dependency on libxcrypt when needed.

Fixes:

  http://autobuild.buildroot.net/results/63b04f86bb8794b79d206659a883acef96dfebf0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e71036045b9b0d9b2c1bd3a2d17f57187ffdde9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-icap/Config.in | 3 +++
 package/c-icap/c-icap.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
index 8f7963c26a..3c1325ee39 100644
--- a/package/c-icap/Config.in
+++ b/package/c-icap/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_C_ICAP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# the libmemcached code uses <crypt.h>
+	select BR2_PACKAGE_LIBXCRYPT if \
+	       BR2_PACKAGE_LIBMEMCACHED && BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  c-icap is an implementation of an ICAP server. It can be
 	  used with HTTP proxies that support the ICAP protocol to
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 36ef1c8b12..4ece4c4b26 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -43,7 +43,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
 C_ICAP_CONF_OPTS += --with-memcached
-C_ICAP_DEPENDENCIES += libmemcached
+C_ICAP_DEPENDENCIES += libmemcached $(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 else
 C_ICAP_CONF_OPTS += --without-memcached
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
