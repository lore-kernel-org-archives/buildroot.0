Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A5BC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F05F40B65;
	Sun, 19 Feb 2023 16:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F05F40B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oWQfLiE7ydb; Sun, 19 Feb 2023 16:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA1641193;
	Sun, 19 Feb 2023 16:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA1641193
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B33F1BF868
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7059481E17
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7059481E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AugRHVaoQ_c2 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5ED481E19
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5ED481E19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95F5286034; Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:55:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03bab7117d232c9dcd784a74eefc0e48ea51ee53
X-Git-Newrev: 364511933811d76d4b866fe3aa04adff449cf94b
X-Patchwork-Hint: ignore
Message-Id: <20230219165607.95F5286034@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix build with
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=364511933811d76d4b866fe3aa04adff449cf94b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libexecinfo raised since commit
d649bcd3805a26cedb30120ebbdcf12f8fbf449f:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld: ../lib/monkey/library/libmonkey.a(mk_utils.c.o): in function `mk_utils_stacktrace':
mk_utils.c:(.text+0x1578): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index d618fdf1e2..8ba16399bb 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -56,6 +56,11 @@ FLUENT_BIT_CXXFLAGS += -fcommon
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
 FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+FLUENT_BIT_DEPENDENCIES += libexecinfo
+FLUENT_BIT_LDFLAGS += -lexecinfo
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 FLUENT_BIT_DEPENDENCIES += musl-fts
 FLUENT_BIT_LDFLAGS += -lfts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
