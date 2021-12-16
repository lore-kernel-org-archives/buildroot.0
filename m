Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3397C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B2D940B64;
	Thu, 16 Dec 2021 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqDsHLYfqMVn; Thu, 16 Dec 2021 20:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C31D40B60;
	Thu, 16 Dec 2021 20:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3E481C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EF0F41594
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-c5AH5uEdTQ for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022CF4032D
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 60CB88218A; Thu, 16 Dec 2021 20:11:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:06:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b55cb018dbcc10d15b62e049d48b691fa8e4c9c
X-Git-Newrev: 60d416fb6cace17627eb2f1009c9ffe6f0f033ad
X-Patchwork-Hint: ignore
Message-Id: <20211216201118.60CB88218A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: add optional support
 for pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=60d416fb6cace17627eb2f1009c9ffe6f0f033ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pcre2 takes precedence of pcre:
https://github.com/tvheadend/tvheadend/blob/master/configure#L473

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tvheadend/tvheadend.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 27443307da..4e84e496bf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -121,11 +121,14 @@ TVHEADEND_DEPENDENCIES += liburiparser
 TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+TVHEADEND_DEPENDENCIES += pcre2
+TVHEADEND_CONF_OPTS += --disable-pcre --enable-pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 TVHEADEND_DEPENDENCIES += pcre
-TVHEADEND_CONF_OPTS += --enable-pcre
+TVHEADEND_CONF_OPTS += --enable-pcre --disable-pcre2
 else
-TVHEADEND_CONF_OPTS += --disable-pcre
+TVHEADEND_CONF_OPTS += --disable-pcre --disable-pcre2
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
