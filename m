Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2428C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C6981FF7;
	Sun,  3 Mar 2024 16:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9-QtEDbEjKs; Sun,  3 Mar 2024 16:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 642608200D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642608200D;
	Sun,  3 Mar 2024 16:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 534A21BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9744F81FAC
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uumSmMxksXa for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3CB81FCD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3CB81FCD
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C6FC87FDA; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:33:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1140bfd950f3d211306f10b6e40deabd91d55b16
X-Git-Newrev: c2d218eb7266ddf7fe157bb7b58da58429ef4f8e
X-Patchwork-Hint: ignore
Message-Id: <20240303164812.9C6FC87FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: fix uclibc build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2d218eb7266ddf7fe157bb7b58da58429ef4f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

getentropy is enabled by default since version 3.0 and
https://github.com/randombit/botan/commit/8642f2a99deefc85cdb512ee50d9f62c5e0ae4b8
and explicit_bzero is also enabled since version 3.0 and
https://github.com/randombit/botan/commit/e6819a380fb67c1be546dc618248b62d93266423
resulting in the following build failure since bump to version 3.2.0 in
commit 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813:

src/lib/entropy/getentropy/getentropy.cpp:26:9: error: '::getentropy' has not been declared; did you mean 'Getentropy'?
   26 |    if(::getentropy(buf.data(), buf.size()) == 0) {
      |         ^~~~~~~~~~
      |         Getentropy

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/d58c4730c770467b42af426545dd917ecc5fed17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/botan/botan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7c290f04ad..88dbfa5807 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -49,7 +49,7 @@ BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-BOTAN_CONF_OPTS += --without-os-feature=getauxval
+BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
 
 ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
