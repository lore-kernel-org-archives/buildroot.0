Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E008CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409BB84EA6;
	Fri, 28 Feb 2025 17:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99UsUJD8YyPJ; Fri, 28 Feb 2025 17:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D9085734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D9085734;
	Fri, 28 Feb 2025 17:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 106A71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A72431C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSoWgQ9OQaxZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A49F446CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A49F446CF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 663A38749E; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 21:38:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: edb4d9724b024717ce0c03932c4c2ae6f4b633f3
X-Git-Newrev: 5f5e35104322e72a2d683248e86b157c9d0f2819
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.663A38749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: disable GCC 14.x
 on Microblaze
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f5e35104322e72a2d683248e86b157c9d0f2819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GCC 14.x is badly broken on Microblaze, with important functions
missing from libatomic, causing build failures in a huge number of
packages. The issue has been reported upstream at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280 but still isn't
fixed. For the time being, let's disable GCC 14.x on Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/6fea0ecaa90b24da4e5575565b88018ea95e72c0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 911bc2f4de..10fe4bf609 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -44,6 +44,9 @@ config BR2_GCC_VERSION_14_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
+	# Severely broken on Microblaze
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
