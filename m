Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BA561186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13BA561186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE3784060;
	Wed,  6 Oct 2021 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aY8sd_mOxCk0; Wed,  6 Oct 2021 19:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C33884027;
	Wed,  6 Oct 2021 19:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3381BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9799F4074D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9I-TIwmUXxt for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E5E408F6
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4EAA59121F; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7749e73b9acf35a11c9abaae86649c6333def88d
X-Git-Newrev: 867521fed7cc0562aee2ff29ecd6cd257f128b07
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.4EAA59121F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-gnupg: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=867521fed7cc0562aee2ff29ecd6cd257f128b07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump of
php-gnupg to version 1.5.0 in commit
20ecd9c94222ef20b7804084acefb472b8e5deaf and
https://github.com/bukka/phpc/commit/8b5b1e718fbb2ba57102d1e9d844938038df310c:

.libs/gnupg_keylistiterator.o: In function `_phpc_res_close':
gnupg_keylistiterator.c:(.text+0x2d4): multiple definition of `_phpc_res_close'

Fixes:
 - http://autobuild.buildroot.org/results/d79/d79bc1b0f98d68eb8a7fe7d86af5ddcc75e42507/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Remove-inlining-_phpc_res_close.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
new file mode 100644
index 0000000000..9b94cb7e4f
--- /dev/null
+++ b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
@@ -0,0 +1,33 @@
+From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sun, 14 Mar 2021 18:52:21 +0000
+Subject: [PATCH] Remove inlining _phpc_res_close
+
+[Retrieved from:
+https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ phpc.h | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/phpc/phpc.h b/phpc/phpc.h
+index dc5887e..9206105 100644
+--- a/phpc/phpc.h
++++ b/phpc/phpc.h
+@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
+ 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
+ #define PHPC_RES_DELETE(_pz_res) \
+ 	zend_list_delete(Z_RES_P(_pz_res))
+-#if PHP_MAJOR_VERSION < 8
+ #define PHPC_RES_CLOSE(_pz_res) \
+ 	zend_list_close(Z_RES_P(_pz_res))
+-#else
+-inline int _phpc_res_close(zval *zres) {
+-	zend_list_close(Z_RES_P(zres));
+-	return SUCCESS;
+-}
+-#define PHPC_RES_CLOSE _phpc_res_close
+-#endif
+ 
+ /* resource to zval */
+ #define PHPC_RES_PZVAL(_res, _pzv) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
