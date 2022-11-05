Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F058BC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FE1817BD;
	Sat,  5 Nov 2022 22:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88FE1817BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIBDz5AC2_pR; Sat,  5 Nov 2022 22:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CC781763;
	Sat,  5 Nov 2022 22:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CC781763
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8D5F1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8362840499
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8362840499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQW-9hrnvAvm for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B2040493
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B2040493
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C15387FA3; Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:46:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19bd315208ccdd01d7b8147d43d05799f3deaa1c
X-Git-Newrev: 1ca100c2d2478cb8ef615edd1ad3cc2e1d90047b
X-Patchwork-Hint: ignore
Message-Id: <20221105224837.6C15387FA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socat: fix printf feature detection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ca100c2d2478cb8ef615edd1ad3cc2e1d90047b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

socal configure uses AC_TRY_RUN to detect printf features. This does
not work for cross compilation.

All C libraries we use support C99 snprintf. Only glibc and uClibc
support the deprecated Z modifier.

These issues were noticed by an inspection of configure.ac.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
