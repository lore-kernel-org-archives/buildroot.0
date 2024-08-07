Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6496DC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9833405E6;
	Wed,  7 Aug 2024 09:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8Y-Dv5i5Yyf; Wed,  7 Aug 2024 09:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664B840640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664B840640;
	Wed,  7 Aug 2024 09:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8611BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490B7404D7
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0Wc5RhELgzs for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41A85401F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41A85401F9
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F32884455; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 10:50:25 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 8d5845211fdff45b3fae25a260754fdf69f02db2
X-Git-Newrev: fffc83c54af30b102b9393f6d7f73eb603449920
X-Patchwork-Hint: ignore
Message-Id: <20240807092530.2F32884455@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/ntpsec: fix
 compile issue for some toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=fffc83c54af30b102b9393f6d7f73eb603449920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Ntpsec unconditionally uses PIE to compile code.
This breaks compilation for at least microblaze-uclibc and
m68k-uclibc toolchains.

Also in Buildroot context, PIE should anyway be governed by BR2_PIC_PIE.

It would be better to add a configure option to allow to disable pie
support, but this is something for a waf expert.

Fixes:
 - http://autobuild.buildroot.net/results/77f/77f4e4065874d022a2ae98d82508242f551e224c
 - http://autobuild.buildroot.net/results/e45/e45b65f2aa323df075d54ff43b0401b5ac7c6eb5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a5327724686a1ba719d37caff5986f241993b500)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntpsec/0003-disable-PIE-support.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0003-disable-PIE-support.patch
new file mode 100644
index 0000000000..64eb559de0
--- /dev/null
+++ b/package/ntpsec/0003-disable-PIE-support.patch
@@ -0,0 +1,26 @@
+From 712675fbd2a736df817fecd7bfb39055946ef85b Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 13 Aug 2023 13:48:03 +0200
+Subject: [PATCH] disable PIE support
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A Not upstreamable
+---
+ wscript | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 292e3a45b..105c7eac2 100644
+--- a/wscript
++++ b/wscript
+@@ -299,7 +299,6 @@ def configure(ctx):
+ 
+     cc_test_flags = [
+         ('PIC', '-fPIC'),
+-        ('PIE', '-pie -fPIE'),
+         # this quiets most of macOS warnings on -fpie
+         ('unused', '-Qunused-arguments'),
+         # This is a useless warning on any architecture with a barrel
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
