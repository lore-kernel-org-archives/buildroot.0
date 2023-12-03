Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E82DC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2528640873;
	Sun,  3 Dec 2023 16:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2528640873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moG57UcL7Nku; Sun,  3 Dec 2023 16:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABF1415B5;
	Sun,  3 Dec 2023 16:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABF1415B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7351BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C75940913
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C75940913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8YMJrFe_lx2 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 135674013D
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135674013D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC73D87549; Sun,  3 Dec 2023 16:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 15:51:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 499b4d6d22a704adf65d1db0808952ad386ee1a0
X-Git-Newrev: b957a02143ce17df7f4ff6f6e33198d9c39757df
X-Patchwork-Hint: ignore
Message-Id: <20231203162609.EC73D87549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: fix selftests with
 kernel >= 6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b957a02143ce17df7f4ff6f6e33198d9c39757df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following selftests build failure raised since kernel >= 6.5 and
https://github.com/torvalds/linux/commit/9fc96c7c19dfab67bf81b25fbc4f49b7752d5060:

make[1]: Entering directory '/home/autobuild/autobuild/instance-4/output-1/build/linux-6.6.3/tools/testing/selftests'

error: missing kernel header files.
Please run this and try again:

    cd ../../..
    make headers

make[1]: *** [Makefile:186: kernel_header_files] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/7674abb454b46ca768e44b6838a0d8724c772dd6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index e29c7f59de..0bcc47af0a 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -23,7 +23,8 @@ SELFTESTS_DEPENDENCIES = \
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-	ARCH=$(SELFTESTS_ARCH)
+	ARCH=$(SELFTESTS_ARCH) \
+	KHDR_DIR=$(LINUX_DIR)/usr/include
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
