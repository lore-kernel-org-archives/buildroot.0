Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5B4C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 12:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E58F84832;
	Fri,  1 Dec 2023 12:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E58F84832
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjQjHPQ2DDU8; Fri,  1 Dec 2023 12:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7611C84825;
	Fri,  1 Dec 2023 12:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7611C84825
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0640F1BF2C8
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 12:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D109C4021C
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 12:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D109C4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9a3vPolnoHKP for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 12:25:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC4F1400B9
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 12:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4F1400B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7BBA876FC; Fri,  1 Dec 2023 12:25:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 13:21:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c068fc4fa08051653229455dde0034427113a577
X-Git-Newrev: 67cb7d8d093f57339e622e1f1f5a40d5013194f1
X-Patchwork-Hint: ignore
Message-Id: <20231201122507.B7BBA876FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtty: fix wolfssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=67cb7d8d093f57339e622e1f1f5a40d5013194f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
