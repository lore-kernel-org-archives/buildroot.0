Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C13BC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA33B43775;
	Fri,  1 Dec 2023 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA33B43775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R95D-xSU5Sq6; Fri,  1 Dec 2023 20:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DE0437C7;
	Fri,  1 Dec 2023 20:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DE0437C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4F71BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 032BD437AA
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032BD437AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwMA_FbBfyGF for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90F8B437AD
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F8B437AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B9B487747; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:11:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a6067ffa3492c13ca3d72522422c9b12d2f8eb2c
X-Git-Newrev: fa11b1cc5b8f58d8ba79ac0c61c5473fcb6996df
X-Patchwork-Hint: ignore
Message-Id: <20231201201359.7B9B487747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rtty: fix wolfssl
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa11b1cc5b8f58d8ba79ac0c61c5473fcb6996df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following wolfssl build failure raised at least since bump to
version 7.4.0 in commit 6b5907bf65d27ed98532e9783f92f5575f38b3d2:

/home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c: In function 'ssl_last_error_string':
/home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c:143:24: error: implicit declaration of function 'ERR_peek_error_line_data'; did you mean 'wolfSSL_ERR_get_error_line_data'? [-Werror=implicit-function-declaration]
  143 |         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
      |                        wolfSSL_ERR_get_error_line_data

Fixes:
 - http://autobuild.buildroot.org/results/9db9f1dcc6760de4b78771bb79f109c4efd06c36
 - http://autobuild.buildroot.org/results/16422af9469de114e552124542508c3b18ea8f19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: don't force wolfssl-all]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 67cb7d8d093f57339e622e1f1f5a40d5013194f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtty/rtty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 964ec04ec4..8a40f584de 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -24,7 +24,7 @@ RTTY_CONF_OPTS += \
 	-DUSE_MBEDTLS=OFF \
 	-DUSE_OPENSSL=ON \
 	-DUSE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 RTTY_DEPENDENCIES += wolfssl
 RTTY_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
