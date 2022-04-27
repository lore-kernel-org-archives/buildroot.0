Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3132C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3ABC8142D;
	Wed, 27 Apr 2022 19:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbaRsb0D5Xn9; Wed, 27 Apr 2022 19:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B757280FF8;
	Wed, 27 Apr 2022 19:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4591BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC4B4046A
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClWF6RvoSr7q for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AB9409EF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4C94184606; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbf93570426c64499ec9221c5dca1d1cc29db4fc
X-Git-Newrev: fbf78c2a738b1a0413c835201064abfa9a3a03f1
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.4C94184606@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: fix unsafe openssl header
 path
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbf78c2a738b1a0413c835201064abfa9a3a03f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitely set the openssl path so that python3 doesn't search host
header paths for target openssl headers.

Fixes:
 - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cffb34e264..6d03e2c6b1 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -103,6 +103,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
+PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
 PYTHON3_CONF_OPTS += --disable-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
