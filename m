Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8EEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 19:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C20F80C17;
	Mon, 14 Nov 2022 19:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C20F80C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfgh4oUPkEjo; Mon, 14 Nov 2022 19:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D33980C0E;
	Mon, 14 Nov 2022 19:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D33980C0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5E6C1BF2A6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 19:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F0B460681
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 19:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0B460681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9I2EcIzy987 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A81605F6
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A81605F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97BCB839C4; Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 20:36:14 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9e4dab0b6dd5dc0461822dbd6128d36821b5bcd5
X-Git-Newrev: 06e37ff050c8c23ce507e831837f20e9df7b082d
X-Patchwork-Hint: ignore
Message-Id: <20221114194841.97BCB839C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/socat: fix printf
 feature detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=06e37ff050c8c23ce507e831837f20e9df7b082d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

socal configure uses AC_TRY_RUN to detect printf features. This does
not work for cross compilation.

All C libraries we use support C99 snprintf. Only glibc and uClibc
support the deprecated Z modifier.

These issues were noticed by an inspection of configure.ac.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ca100c2d2478cb8ef615edd1ad3cc2e1d90047b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index e20577492d..c1bf4d260f 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -11,6 +11,14 @@ SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
 SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
 SOCAT_CPE_ID_VENDOR = dest-unreach
 
+SOCAT_CONF_ENV = ac_cv_have_c99_snprintf=yes
+
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC),y)
+SOCAT_CONF_ENV += ac_cv_have_z_modifier=yes
+else
+SOCAT_CONF_ENV += ac_cv_have_z_modifier=no
+endif
+
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 SOCAT_CONF_ENV += \
 	sc_cv_sys_crdly_shift=12 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
