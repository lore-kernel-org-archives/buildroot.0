Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80278827A9;
	Thu, 30 Dec 2021 12:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTDK-y-s9VnE; Thu, 30 Dec 2021 12:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF3B80D5E;
	Thu, 30 Dec 2021 12:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDDF1BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA3780BE4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_KZ6xwHTDAp for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 036BF80BFB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 458E582DA1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47eead8aad83528bde1cc89d4b8abb5f18a1ef3d
X-Git-Newrev: 1b4e5f4c57f71e0b0677792818cd6fb526e65493
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.458E582DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: argp is needed for SSH
 plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b4e5f4c57f71e0b0677792818cd6fb526e65493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

argp is needed for SSH plugin to avoid the following build failure
raised since bump to version 2.4.2 in commit
b537fe14339592023221a7c200257eb3a923c0be:

configure: error: You need argp library.

Fixes:
 - http://autobuild.buildroot.org/results/6740792920a28c91f4f82a8f8c2fb525ed80410a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/Config.in     | 2 ++
 package/cryptsetup/cryptsetup.mk | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index d9c9d4d4f4..f36883ea47 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2, libargon2
 	depends on !BR2_STATIC_LIBS # lvm2, libargon2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
+		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 980a36faa8..676cd25be4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -34,7 +34,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
-CRYPTSETUP_DEPENDENCIES += libssh
+CRYPTSETUP_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
+	libssh
 CRYPTSETUP_CONF_OPTS += --enable-ssh-token
 else
 CRYPTSETUP_CONF_OPTS += --disable-ssh-token
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
