Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67790C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0953E81A92;
	Sun, 20 Mar 2022 09:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUen7asfr4Hl; Sun, 20 Mar 2022 09:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44B1381A4E;
	Sun, 20 Mar 2022 09:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A38B1BF59E
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 09:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7610D60B64
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 09:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHdkH1e1Buh5 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 09:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9764606FF
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B4466841F2; Sun, 20 Mar 2022 09:47:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 10:49:11 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: aae7c1ec1e278582f6984e27054ddb70dadd96fb
X-Git-Newrev: 7355863f64dccba8860ad4e94ca86286e232746d
X-Patchwork-Hint: ignore
Message-Id: <20220320094741.B4466841F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libsrtp: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=7355863f64dccba8860ad4e94ca86286e232746d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 6852a13559..643371834b 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -246,7 +246,7 @@ ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
 # asterisk needs an openssl-enabled libsrtp
-ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
+ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL),yy)
 ASTERISK_DEPENDENCIES += libsrtp
 ASTERISK_CONF_OPTS += --with-srtp
 else
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 5cbd97957a..212d1b1749 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -25,8 +25,7 @@ endif
 # host-pkgconf to make sure pkg-config is installed.
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
-# openssl handling needs libdl support
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --enable-openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
