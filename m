Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 09:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1794B402F3;
	Sun, 20 Mar 2022 09:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvxhhzIi9t7j; Sun, 20 Mar 2022 09:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D629C40201;
	Sun, 20 Mar 2022 09:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D344B1BF59E
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D03CF60B64
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WElr8IuLEXc for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6FF606FF
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27BE284349; Sun, 20 Mar 2022 09:47:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 10:49:02 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f720577998f15f229221063088e0a7a1839f413d
X-Git-Newrev: 330d79828dcd97b955c6dec2740955a15332817f
X-Patchwork-Hint: ignore
Message-Id: <20220320094746.27BE284349@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libsrtp: drop
 shared library dependency from openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=330d79828dcd97b955c6dec2740955a15332817f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

openssl handling needs shared library support since commit
67cebbdf5f349cc176037fa15c281a9462dae591 however this is not needed
since version 2 and
https://github.com/cisco/libsrtp/commit/333fa84e8ed1395753fd1c0c4eb5534208510f26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 19294eb352feb9cc96bc7eeb8942da27f715ab87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 2 +-
 package/libsrtp/libsrtp.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 0a26fb38ea..2b7854b982 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -247,7 +247,7 @@ ASTERISK_CONF_OPTS += --without-speex --without-speexdsp
 endif
 
 # asterisk needs an openssl-enabled libsrtp
-ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
+ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL),yy)
 ASTERISK_DEPENDENCIES += libsrtp
 ASTERISK_CONF_OPTS += --with-srtp
 else
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index f2ba600dd6..e7a771c6b2 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -21,8 +21,7 @@ endif
 
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
-# openssl handling needs libdl support
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --disable-nss --enable-openssl
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
