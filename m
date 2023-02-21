Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2489C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F77C4175B;
	Sun, 12 Mar 2023 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F77C4175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9Erp1WV5nLX; Sun, 12 Mar 2023 21:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECE441795;
	Sun, 12 Mar 2023 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECE441795
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6591BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD864061D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD864061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmYGP7R4Fpc4 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0C7D40614
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C7D40614
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE09B87007; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec7258f3f4ea4442cd1f8c78a066a062a4d0cbd0
X-Git-Newrev: f6c05b47f71a6e140a0743dda276267f653f94f3
X-Patchwork-Hint: ignore
Message-Id: <20230312214622.CE09B87007@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: disable ccache for
 host-cmake
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6c05b47f71a6e140a0743dda276267f653f94f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upcoming ccache update will depend on host-cmake, so we must
ensure host-cmake doesn't use ccache when being built.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 053658fad6..dc92c8bb4e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -40,9 +40,16 @@ CMAKE_CONF_OPTS = \
 HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 
+# We may be a ccache dependency, so we can't use ccache
+HOST_CMAKE_CONFIGURE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CC="$(HOSTCC_NOCCACHE)" \
+	GCC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_CMAKE_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR) \
 			--parallel=$(PARALLEL_JOBS) -- \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
