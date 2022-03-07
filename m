Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724E1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2E660777;
	Mon,  7 Mar 2022 20:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD_dskBUipV2; Mon,  7 Mar 2022 20:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609F860B38;
	Mon,  7 Mar 2022 20:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8BA1BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C17F40364
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9x1wap9ZEng for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:07:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2325A4016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 785D982A9F; Mon,  7 Mar 2022 19:58:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 21:05:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6105ad3f72fcb98a7d9aba543c6bb7311827c1d4
X-Git-Newrev: 25fd3b0a523805db14682f7c559cc1c9c366ed55
X-Patchwork-Hint: ignore
Message-Id: <20220307195855.785D982A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/re2: fix build with gcc <= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=25fd3b0a523805db14682f7c559cc1c9c366ed55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc <= 5 raised since bump to
version 2022-02-01 in commit d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
and
https://github.com/google/re2/commit/a022cc0c55b0519629d64d775e7a5195af34a477

./re2/sparse_array.h:266:37: warning: defaulted and deleted functions only available with -std=c++11 or -std=gnu++11
 SparseArray<Value>::SparseArray() = default;
                                     ^
./re2/sparse_array.h: In copy constructor 're2::SparseArray<Value>::SparseArray(const re2::SparseArray<Value>&)':
./re2/sparse_array.h:273:3: error: 'copy_n' is not a member of 'std'
   std::copy_n(src.sparse_.data(), src.max_size(), sparse_.data());
   ^

Fixes:
 - http://autobuild.buildroot.org/results/8ebbac67f32fe24416a1f72aad0afd42b567b403

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/re2/re2.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 41392cb179..30791a68e5 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,19 +10,23 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
+RE2_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 define RE2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
 endef
 
 define RE2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
 
 define RE2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
