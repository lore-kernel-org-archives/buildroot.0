Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8224FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 16:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 346A6400FB;
	Wed,  1 May 2024 16:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmxh4Johe-sJ; Wed,  1 May 2024 16:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB1F4029F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EB1F4029F;
	Wed,  1 May 2024 16:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25DF81BF28C
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1157B40259
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCMVEqqoZt5I for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 16:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47354024C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E47354024C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 16:42:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2BEB8638E; Wed,  1 May 2024 16:42:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 18:40:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebd44d7c5b8b4e24e401863bb779adea2ff3a226
X-Git-Newrev: 8996fedefbba7e5dfded9b7389062aba4469deaa
X-Patchwork-Hint: ignore
Message-Id: <20240501164207.C2BEB8638E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: needs libxcrypt with
 glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=8996fedefbba7e5dfded9b7389062aba4469deaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We unconditionally configure asterisk with --with-crypt, so the build
currently fails under glibc since it removed crypt in 2.39, and we
explicitly remove it from external toolchains as well, whatever the
version, causing build failures such as:

    checking for mandatory modules:  OPENSSL BKTR CRYPT ILBC JANSSON LIBEDIT LIBJWT LIBXML2 PJPROJECT SQLITE3 ZLIB... fail
    configure: ***
    configure: *** The CRYPT installation appears to be missing or broken.
    configure: *** Either correct the installation, or run configure
    configure: *** including --without-crypt.

Fixing this could be done in two ways: either make libxcrypt a mandatory
dependency under glibc, and continue unconditionally enabling crypt
support, or only enable crypt support when libxcrypt is available or
this was a non-glibc toolchain.

We chose the first option, to keep the existing behaviour (crypt support
is always enabled), to be aligned with other packages (libxcrypt is
selected under glibc toolchains), and because it is also the simplest.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/asterisk/Config.in   | 1 +
 package/asterisk/asterisk.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index ba5a574042..71c741acfd 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBILBC
 	select BR2_PACKAGE_LIBJWT
 	select BR2_PACKAGE_LIBPJSIP
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index c37aa5ec9d..be27509441 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -238,6 +238,11 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+# --with-crypt is unconditional, relies on the C library if present
+ASTERISK_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
