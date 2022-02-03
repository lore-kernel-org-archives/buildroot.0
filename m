Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C6C40A89;
	Thu,  3 Feb 2022 20:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_oN0YIfK6U2; Thu,  3 Feb 2022 20:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0987D40A83;
	Thu,  3 Feb 2022 20:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 254611BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C066076A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQlVDdXa3QTW for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAD5960A6F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8CB0882B5D; Thu,  3 Feb 2022 20:38:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 21:44:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7b360b5f8ed86001bb349d937100e9e46584b0
X-Git-Newrev: de1a3737879eef4a9dd283269a896e50a1badabf
X-Patchwork-Hint: ignore
Message-Id: <20220203203800.8CB0882B5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: fix build failure due to
 gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=de1a3737879eef4a9dd283269a896e50a1badabf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bullet package exhibits gcc bug 68485 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/96e77ddba5042ba4dacb16b328fc298a4f00f49a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poppler/poppler.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 9e9bfc9cba..18c044a9f6 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -131,4 +131,12 @@ else
 POPPLER_CONF_OPTS += -DUSE_FLOAT=ON
 endif
 
+POPPLER_CXXFLAGS = $(TARGET_CXXCFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+POPPLER_CXXFLAGS += -O0
+endif
+
+POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POPPLER_CXXFLAGS)"
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
