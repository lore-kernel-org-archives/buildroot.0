Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20902C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC9260F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBC9260F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B259F83026;
	Tue,  3 Aug 2021 21:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOPgC5ZW2Muc; Tue,  3 Aug 2021 21:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E349A83143;
	Tue,  3 Aug 2021 21:16:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D791BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C21F9404B4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhJoNGxI1ypf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED6E40357
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 007B387BB7; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 20:39:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d5b397202225f7ca1702f62342df3b97056c531
X-Git-Newrev: 64e7c63528906577666382a672ed8e900521595c
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.007B387BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/opentyrian: switch to
 using github
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=64e7c63528906577666382a672ed8e900521595c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

OpenTyrian was previously managed in a Mercurial repository hosted on
Bitbucket. Mid-2020, Bitbucket shut off all its Mercurial repositories:
    https://bitbucket.org/blog/sunsetting-mercurial-support-in-bitbucket

Since then, OpenTyrian's source code is inacessible, but we have had no
build failure associated as there is an old archive hosted on s.b.o, so
that all builds fallback to downloading that:
    http://sources.buildroot.net/opentyrian/opentyrian-9c9f0ec3532b.tar.gz

However, the project has been revived (kinda) on github:
    https://github.com/opentyrian/opentyrian

Git commit cf5dbeb69eebd9ef9afc4473088d9469b79589eb has been found to
be the closest, both in content and date, to the Mercuail reference
9c9f0ec3532b we were using. The only deltas are in Mercurial-specific
files:

 b/.hg_archival.txt |    5     0     5     0 -----
 b/.hgtags          |    2     1     1     0 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

While at it, add a hash file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opentyrian/opentyrian.hash | 3 +++
 package/opentyrian/opentyrian.mk   | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/opentyrian/opentyrian.hash b/package/opentyrian/opentyrian.hash
new file mode 100644
index 0000000000..0d1f4927ee
--- /dev/null
+++ b/package/opentyrian/opentyrian.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2b0db65c735cc099279ea3da6d9b76f791633897cd0f5b67528f70de0758a944  opentyrian-cf5dbeb69eebd9ef9afc4473088d9469b79589eb.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 12e41ad998..690323334e 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPENTYRIAN_VERSION = 9c9f0ec3532b
-OPENTYRIAN_SITE = https://bitbucket.org/opentyrian/opentyrian
-OPENTYRIAN_SITE_METHOD = hg
+OPENTYRIAN_VERSION = cf5dbeb69eebd9ef9afc4473088d9469b79589eb
+OPENTYRIAN_SITE = $(call github,opentyrian,opentyrian,$(OPENTYRIAN_VERSION))
 OPENTYRIAN_LICENSE = GPL-2.0+
 OPENTYRIAN_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
