Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DBC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 09:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5BE84321;
	Tue,  7 Jun 2022 09:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDdbVgHHNN4S; Tue,  7 Jun 2022 09:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5FDD84303;
	Tue,  7 Jun 2022 09:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 740DF1BF2A9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 705B5842E9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDBYM63R6t3X for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 09:30:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8DF984303
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 09:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D12C84B62; Tue,  7 Jun 2022 09:18:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 11:28:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4c4230c32cb9a266be76eb430dc26f7241af8c44
X-Git-Newrev: 5785591a4c6c7275c83affd90bdddbf04e7f9c51
X-Patchwork-Hint: ignore
Message-Id: <20220607091852.8D12C84B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/boinc: fix build
 with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=5785591a4c6c7275c83affd90bdddbf04e7f9c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libboinc.a(libboinc_la-diagnostics.o): in function `boinc_catch_signal':
diagnostics.cpp:(.text+0x8a): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/4504379b464eb144a4c257001eb4d316bb1f5e44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e48c2d5f1996e827e6db3f01797f5087ba527d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
