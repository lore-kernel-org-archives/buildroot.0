Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7FC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FBC8206D;
	Sun,  3 Mar 2024 16:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7hdzc6g4snT; Sun,  3 Mar 2024 16:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9022182011
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9022182011;
	Sun,  3 Mar 2024 16:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1301BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD4D740815
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGXuzBoqxE5u for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B524080F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B524080F
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:24:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A41E087FB4; Sun,  3 Mar 2024 16:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:18:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02df2834155aec4c74149b1aacc4d56babcc9325
X-Git-Newrev: eaeba56aa2d21f1d264c7e361731808e3f072d9d
X-Patchwork-Hint: ignore
Message-Id: <20240303162401.A41E087FB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update ucontext
 handling
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eaeba56aa2d21f1d264c7e361731808e3f072d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas Petazzoni in [1], add a comment on
BR2_TOOLCHAIN_HAS_UCONTEXT to specify that this boolean will be set to
true only when a toolchain provides a full featured ucontext
implementation with ucontext_t and {get,make,set}context. As a result,
drop its selection from BR2_TOOLCHAIN_USES_MUSL to fix the following
musl build failure on php:

/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/m68k-buildroot-linux-musl/12.3.0/../../../../m68k-buildroot-linux-musl/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
zend_fibers.c:(.text+0x946): undefined reference to `getcontext'

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20230516193307.1543455-1-bernd.kuhls@t-online.de/

Fixes:
 - http://autobuild.buildroot.org/results/271f9fb8bfa5ba2f74feef81e6b375b54e21cece

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 407a03c42e..3dd6e83d35 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -34,7 +34,6 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_UCONTEXT
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
 
 choice
@@ -302,6 +301,8 @@ config BR2_TOOLCHAIN_HAS_SSP_STRONG
 	bool
 	default y if BR2_TOOLCHAIN_HAS_SSP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+# This boolean is true if the toolchain provides a full featured
+# ucontext implementation with ucontext_t and {get,make,set}context
 config BR2_TOOLCHAIN_HAS_UCONTEXT
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
