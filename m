Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D697C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB1461787;
	Thu,  9 Mar 2023 19:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB1461787
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qbo6PNp5Ibp; Thu,  9 Mar 2023 19:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D72960BEC;
	Thu,  9 Mar 2023 19:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D72960BEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E39F01BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEBE640510
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEBE640510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WQD8vSlg01P for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 19:40:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09A7D400BF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 19:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A7D400BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECE2986B51; Thu,  9 Mar 2023 19:40:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 20:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5256ec9ca872518beacf827443fec72146ab7a0c
X-Git-Newrev: 6a29c4f4118e42420ebb64b7e00cfb4a826216c1
X-Patchwork-Hint: ignore
Message-Id: <20230309194053.ECE2986B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: force cross compiling
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a29c4f4118e42420ebb64b7e00cfb4a826216c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default autotools enters cross-compiling mode if --build and --host
differ [0]. This should normally be the case as buildroot sets itself as
vendor in the toolchain triplet.
For libgpg-error the --host flag has to be set to a generic triplet
because this information is used to lookup the syscfg.
When compiling on aarch64 for aarch64 build and host would be the same,
therefore cross-compiling isn't activated, which results in a build failure.

Fixes:
 - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/

[0]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libgpg-error/libgpg-error.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 3f4a45a7e4..3ab8535a9c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -14,6 +14,7 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = \
+	cross_compiling=yes \
 	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
 	--enable-install-gpg-error-config \
 	--disable-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
