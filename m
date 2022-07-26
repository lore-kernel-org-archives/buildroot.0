Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A02C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2639384CA6;
	Tue, 26 Jul 2022 15:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2639384CA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id su2NtVDlyw68; Tue, 26 Jul 2022 15:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A1F84754;
	Tue, 26 Jul 2022 15:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A1F84754
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1638B1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E144141BA3
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E144141BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZM_7859-i0X for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:15:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E483941B9D
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E483941B9D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E842285EF1; Tue, 26 Jul 2022 15:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 17:14:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b6bdf6bcb5f96128d52ea0f159ccaab9fc8da67
X-Git-Newrev: 283573f9b33e4450859c0ebcf8bfc456b80b5895
X-Patchwork-Hint: ignore
Message-Id: <20220726150119.E842285EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: fix build failure due
 to gcc bug 104028
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

commit: https://git.buildroot.net/buildroot/commit/?id=283573f9b33e4450859c0ebcf8bfc456b80b5895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sg3_utils package exhibits gcc bug 104028 when built for the M68K
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_104028=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sg3_utils/sg3_utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index e357fc1dde..b291bd69d9 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -24,6 +24,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SG3_UTILS_CONF_ENV += LIBS="-latomic"
 endif
 
+SG3_UTILS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+SG3_UTILS_CFLAGS += -O0
+endif
+
+SG3_UTILS_CONF_ENV += CFLAGS="$(SG3_UTILS_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
 define SG3_UTILS_REMOVE_PROGS
 	for prog in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
