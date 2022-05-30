Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACD5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 014B140C93;
	Mon, 30 May 2022 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCYI5Flw2V9Z; Mon, 30 May 2022 21:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F309140949;
	Mon, 30 May 2022 21:09:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3AE61BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBC4383FA0
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gogfe4wI01hk for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E821B83F99
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F149586817; Mon, 30 May 2022 20:58:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:09:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07cc32898b6ed0699db8d993b7334c3b1170e5de
X-Git-Newrev: 9e48c2d5f1996e827e6db3f01797f5087ba527d4
X-Patchwork-Hint: ignore
Message-Id: <20220530205817.F149586817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e48c2d5f1996e827e6db3f01797f5087ba527d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libboinc.a(libboinc_la-diagnostics.o): in function `boinc_catch_signal':
diagnostics.cpp:(.text+0x8a): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/4504379b464eb144a4c257001eb4d316bb1f5e44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boinc/boinc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 0d992f136c..695495f777 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -39,7 +39,12 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 BOINC_DEPENDENCIES += freetype
 endif
 
-BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+BOINC_DEPENDENCIES += libexecinfo
+BOINC_MAKE_OPTS += LIBS="-lexecinfo"
+endif
+
+BOINC_MAKE_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 # Remove boinc-client because it is incompatible with buildroot
 define BOINC_REMOVE_UNNEEDED_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
