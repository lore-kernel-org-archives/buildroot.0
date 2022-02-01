Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A72783336;
	Tue,  1 Feb 2022 22:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1hn-5PjrwiF; Tue,  1 Feb 2022 22:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7146F832EB;
	Tue,  1 Feb 2022 22:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D47651BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C36CA83365
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbwClbejirr0 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C739282F40
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC2CC82858; Tue,  1 Feb 2022 21:58:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:23:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65f4f119f2db06230bd1c83d2907a08fb23685db
X-Git-Newrev: 67126ef063a9a502bddb016be89e40bcaefc74c2
X-Patchwork-Hint: ignore
Message-Id: <20220201215821.DC2CC82858@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-apcu: fix build without
 __sync_*_4 intrinsics
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

commit: https://git.buildroot.net/buildroot/commit/?id=67126ef063a9a502bddb016be89e40bcaefc74c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 8ddeeffa186d8bce875ac713c1e71483c618842a:

configure: error: Compiler does not support atomics

--enable-apcu-rwlocks can't be used until
https://github.com/krakjoe/apcu/pull/430 is merged (and autoreconf does
not work either)

Fixes:
 - http://autobuild.buildroot.org/results/efa/efa3b4406f87a1e9521b66f392a6fa19ac01f0cd/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php-apcu/php-apcu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index ce59611d8f..3ac062e772 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -22,4 +22,8 @@ define PHP_APCU_PHPIZE
 endef
 PHP_APCU_PRE_CONFIGURE_HOOKS += PHP_APCU_PHPIZE
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
+PHP_APCU_CONF_OPTS += --disable-apcu-rwlocks
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
