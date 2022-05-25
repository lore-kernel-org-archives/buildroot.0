Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB72EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 07:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDE984105;
	Wed, 25 May 2022 07:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJuoVMlDT0WF; Wed, 25 May 2022 07:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1C3840F2;
	Wed, 25 May 2022 07:05:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C120A1BF418
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE4C241BA4
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fWO36RlTxhL for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 07:05:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A883041B9C
 for <buildroot@buildroot.org>; Wed, 25 May 2022 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8040E864AD; Wed, 25 May 2022 06:54:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 May 2022 09:04:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5452b5887005298a87650ff4003ecfaecfd9aca0
X-Git-Newrev: de77516a2b3f8435df066cfc611b0eacfb61b02e
X-Patchwork-Hint: ignore
Message-Id: <20220525065410.8040E864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: openssl dependency
 for x86_64 selftests
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

commit: https://git.buildroot.net/buildroot/commit/?id=de77516a2b3f8435df066cfc611b0eacfb61b02e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On x86_64, libssl is a dependency for kselftests. selftests/sgx depends on
it.  Thus, select it in "Config.in", and add it as a build dependency in
"linux-tool-selftests.mk.in".

Link: https://lore.kernel.org/buildroot/20220517224809.21f77949@gmx.net/
Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
[yann.morin.1998@free.fr:
  - in .mk: change condition to be on package being selected
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/Config.in                  | 1 +
 package/linux-tools/linux-tool-selftests.mk.in | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 791f2c085c..6217fcfb7a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -98,6 +98,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
+	select BR2_PACKAGE_OPENSSL if BR2_x86_64
 	help
 	  Build and install (to /usr/lib/kselftests) kernel selftests.
 
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index b824c11bd6..e29c7f59de 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -16,7 +16,10 @@ SELFTESTS_ARCH=$(NORMALIZED_ARCH)
 endif
 endif
 
-SELFTESTS_DEPENDENCIES = libcap-ng popt
+SELFTESTS_DEPENDENCIES = \
+	libcap-ng \
+	popt \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
