Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B7C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 16:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E17A4177C;
	Wed, 30 Aug 2023 16:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E17A4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDra3ZQWHn4b; Wed, 30 Aug 2023 16:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8B541776;
	Wed, 30 Aug 2023 16:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8B541776
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52AE91BF3E5
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 16:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B3961191
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 16:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B3961191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slm0JLZQE1yT for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 16:07:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4854E61015
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 16:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4854E61015
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 347A6865BA; Wed, 30 Aug 2023 16:07:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 18:04:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 34dde405262f7570422f9e8a84d0b103ffd2032c
X-Git-Newrev: 7812ee6b6cc08a94fbde10f15a41925efa18be25
X-Patchwork-Hint: ignore
Message-Id: <20230830160721.347A6865BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/php: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=7812ee6b6cc08a94fbde10f15a41925efa18be25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure:
/tmp/ccqcLrVb.s:4053: Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
/tmp/ccqcLrVb.s:4076: Error: selected processor does not support `umlal r0,r3,r1,r2' in Thumb mode
/tmp/ccqcLrVb.s:8644: Error: selected processor does not support `umlal r0,r3,r2,r4' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/1d09a0a58cbc1712416de746d57d4532df580673/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 73ddf7bf509813a1a9008fa61c8706e200340fe9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6a2a6ae71b..68aeceb33e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -84,6 +84,13 @@ else
 PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
 endif
 
+# php has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+PHP_CFLAGS += -marm
+endif
+
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
