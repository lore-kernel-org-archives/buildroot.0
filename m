Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ABAC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E8F81F31;
	Tue, 21 Feb 2023 21:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E8F81F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrtUgbP7dmyq; Tue, 21 Feb 2023 21:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27BE981F28;
	Tue, 21 Feb 2023 21:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27BE981F28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9ECC1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D039D81F28
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D039D81F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaBUTsvepppp for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:22:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0711081F26
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0711081F26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DB886692; Tue, 21 Feb 2023 21:22:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:16:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec7258f3f4ea4442cd1f8c78a066a062a4d0cbd0
X-Git-Newrev: f6c05b47f71a6e140a0743dda276267f653f94f3
X-Patchwork-Hint: ignore
Message-Id: <20230221212251.E2DB886692@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cmake: disable ccache
 for host-cmake
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
