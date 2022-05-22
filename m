Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B50160F27;
	Sun, 22 May 2022 20:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NaZXOIWRTbl; Sun, 22 May 2022 20:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2F160F1A;
	Sun, 22 May 2022 20:13:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34ED41BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C8B827AA
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8FUdAaU-Liz for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:12:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D80827A1
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:12:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D83C686326; Sun, 22 May 2022 20:01:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 22:12:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 00f402d3662ce26173438a59fe701c35fed5136d
X-Git-Newrev: c495d12ea3a74ea5308b10a1e9b087fc473ed601
X-Patchwork-Hint: ignore
Message-Id: <20220522200131.D83C686326@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libkrb5: doesn't
 build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=c495d12ea3a74ea5308b10a1e9b087fc473ed601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libkrb5 does not build with libressl since commit
b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
in fixing this issue as a PR is opened for more than 4 years
(https://github.com/krb5/krb5/pull/607):

pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
pkinit_crypto_openssl.c:1700:22: error: implicit declaration of function 'OBJ_get0_data'; did you mean 'BIO_get_data'? [-Werror=implicit-function-declaration]
 1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
      |                      ^~~~~~~~~~~~~
      |                      BIO_get_data

Fixes:
 - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e77c6e9291ff235309489a3733219c5c32b9187c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index f406cd9e49..bd751d9c77 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -49,7 +49,7 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBKRB5_CONF_OPTS += \
 	--enable-pkinit \
 	--with-crypto-impl=openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
