Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCDECD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84FC14191D;
	Wed,  3 Apr 2024 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEwhomk4mlSU; Wed,  3 Apr 2024 19:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4772141993
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4772141993;
	Wed,  3 Apr 2024 19:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B0501BF983
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D97607C2
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3Y4BdntVREY for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874246079A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 874246079A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 739038477A; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a5495b9160de730e43dd2a1b0fec0a974c7cae0
X-Git-Newrev: 330cb457feb3e380184ceec4553c1286aa894947
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.739038477A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: add optional dependency to
 libxcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=330cb457feb3e380184ceec4553c1286aa894947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing squid's libcrypt dependency this
broke the squid build using glibc version 2.39.

To fix this select the libxcrypt dependency to squid when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/squid/Config.in | 1 +
 package/squid/squid.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 149884d815..ab13e735e1 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6a2b522336..e325c63cb0 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -52,6 +52,10 @@ else
 SQUID_CONF_OPTS += --without-mit-krb5
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SQUID_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
