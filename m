Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78010E7D26B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295B61416;
	Tue, 26 Sep 2023 09:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2295B61416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gkpx_ClscpRd; Tue, 26 Sep 2023 09:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7228360DDF;
	Tue, 26 Sep 2023 09:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7228360DDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B42B21BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C4DD41E4B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4DD41E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSrjyB103j2T for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE3F41E48
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE3F41E48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CD23806AE; Tue, 26 Sep 2023 09:01:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 10:50:22 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7efe2b30fe58b021dd09672ca4b7f1ea4e1666a9
X-Git-Newrev: 9c4ef96fe8f213e713afee84dc6e642b1987e9fe
X-Patchwork-Hint: ignore
Message-Id: <20230926090112.7CD23806AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nodejs: fix
 parallel build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c4ef96fe8f213e713afee84dc6e642b1987e9fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Unless told otherwise, ninja will spawn as many jobs as there are CPU
(plus 2). Nodejs is built with ninja, but it is a generic package, so
there is no variable (like with cmake-package) that passes the proper
number of parallel jobs as configured by the user.

As a consequence, the nodejs build will use as many CPU as are
available, possibly overcommitting the rsources the user expected to be
used.

Set the JOBS variableto limit that number.

Signed-off-by: Jens Maus <mail@jens-maus.de>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 84c24ab1b5a7d38b481b37a759480ff2273b499d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fe629ada21..4e70bd71a3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
 	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
 	LDFLAGS.host="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH)
+	PATH=$(@D)/bin:$(BR_PATH) \
+	JOBS=$(BR2_JLEVEL)
 
 NODEJS_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
-	LD="$(TARGET_CXX)"
+	LD="$(TARGET_CXX)" \
+	JOBS=$(BR2_JLEVEL)
 
 # nodejs's build system uses python which can be a symlink to an unsupported
 # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
