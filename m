Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3567C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DEEB401F6;
	Sat,  1 Jan 2022 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v67J9KLhXHEo; Sat,  1 Jan 2022 10:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D729B40201;
	Sat,  1 Jan 2022 10:07:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192B41BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080BA400F4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izL0gmuTZ64s for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:07:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 676E6400B6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4995E817EA; Sat,  1 Jan 2022 10:01:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:06:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57edd417c58e58dc10e60d84b6b1920e72560262
X-Git-Newrev: ae54331db305f30c6c958ca64d9e6c63b7ae9e50
X-Patchwork-Hint: ignore
Message-Id: <20220101100109.4995E817EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: requires blake2 support
 in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae54331db305f30c6c958ca64d9e6c63b7ae9e50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.10.1 in
commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

/home/buildroot/autobuild/instance-3/output-1/build/python3-3.10.1/Modules/_hashopenssl.c:244:22: error: implicit declaration of function 'EVP_blake2s256'; did you mean 'LN_blake2s256'? [-Werror=implicit-function-declaration]
  244 |             digest = EVP_blake2s256();
      |                      ^~~~~~~~~~~~~~
      |                      LN_blake2s256

Fixes:
 - http://autobuild.buildroot.org/results/9112571b75aebb0ba5032ef1b16226d9848f5184

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index efc4dbb3d4..7714518edc 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -90,6 +90,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
