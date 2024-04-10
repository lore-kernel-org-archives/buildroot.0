Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78292CD1296
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F07F40399;
	Wed, 10 Apr 2024 19:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htsamYqsxCz2; Wed, 10 Apr 2024 19:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C424841775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C424841775;
	Wed, 10 Apr 2024 19:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24C2D1BF980
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C613682106
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7xf58p2YMeR for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F171C82108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F171C82108
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E966185E9A; Wed, 10 Apr 2024 19:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 21:35:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b7f8f8d226c8f5b08edb5a7a8ad746ba04c34c5
X-Git-Newrev: 05f5e5b6f8e8363043b6136e9d622023ccf9eb52
X-Patchwork-Hint: ignore
Message-Id: <20240410194546.E966185E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: add zlib optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=05f5e5b6f8e8363043b6136e9d622023ccf9eb52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is an optional dependency dependency (enabled by default) since the
addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/opensc/opensc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index f4dc2206ea..008de9d4c2 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -20,4 +20,11 @@ else
 OPENSC_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OPENSC_DEPENDENCIES += zlib
+OPENSC_CONF_OPTS += --enable-zlib
+else
+OPENSC_CONF_OPTS += --disable-zlib
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
