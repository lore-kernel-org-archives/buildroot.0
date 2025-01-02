Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D08C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2102D4EF0D;
	Fri, 28 Feb 2025 16:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SI2zAxddIt5F; Fri, 28 Feb 2025 16:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA424F12D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA424F12D;
	Fri, 28 Feb 2025 16:49:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20BDB711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A3D424EE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mWUnUNItDdl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F068426F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F068426F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6545587C2C; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 19:46:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 892677f4f583031de048d81855e339dca15183ed
X-Git-Newrev: e71036045b9b0d9b2c1bd3a2d17f57187ffdde9d
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.6545587C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/c-icap: memcached code
 needs <crypt.h>
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

commit: https://git.buildroot.net/buildroot/commit/?id=e71036045b9b0d9b2c1bd3a2d17f57187ffdde9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The memcached code of c-icap needs <crypt.h>, which is no longer
provided by glibc since glibc 2.39. So add some logic to add a
dependency on libxcrypt when needed.

Fixes:

  http://autobuild.buildroot.net/results/63b04f86bb8794b79d206659a883acef96dfebf0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
