Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1BAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B4714097F;
	Tue, 19 Apr 2022 20:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhM-PlL9Rjyc; Tue, 19 Apr 2022 20:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF28F40A0E;
	Tue, 19 Apr 2022 20:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E65CE1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0E8C403EC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9Gppll-FCdz for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:37:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94434030C
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:37:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2C1B183DF3; Tue, 19 Apr 2022 20:27:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:35:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f868f7ba9308aeb0e4586d63557d9da253d0da0b
X-Git-Newrev: e77c6e9291ff235309489a3733219c5c32b9187c
X-Patchwork-Hint: ignore
Message-Id: <20220419202742.2C1B183DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: doesn't build with
 libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e77c6e9291ff235309489a3733219c5c32b9187c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
