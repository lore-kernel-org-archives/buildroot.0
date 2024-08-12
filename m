Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC2CC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B456681366;
	Mon, 12 Aug 2024 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id te2k9fqutB7k; Mon, 12 Aug 2024 20:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A510481367
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A510481367;
	Mon, 12 Aug 2024 20:23:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC1CB1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5FB481368
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUOxmsuFqn58 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02F4281365
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02F4281365
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF49485463; Mon, 12 Aug 2024 20:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:22:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b62d671a1b5a12ae95b4bef7a1f30f85af6cd2ed
X-Git-Newrev: d6142f28b79748767af3f72bdc01ddf413926eb1
X-Patchwork-Hint: ignore
Message-Id: <20240812202305.EF49485463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chicken: pass TARGET_CFLAGS to the
 build system
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6142f28b79748767af3f72bdc01ddf413926eb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

chicken build system expects non-standard environment variables with
compiler names and compiler options. Pass buildroot TARGET_CFLAGS in
chicken C_COMPILER_OPTIMIZATION_OPTIONS.

Fixes: http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chicken/chicken.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 2667f7823d..0000fc635e 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -16,6 +16,7 @@ CHICKEN_MAKE_OPTS = \
 	ARCH=unused \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
+	C_COMPILER_OPTIMIZATION_OPTIONS="$(TARGET_CFLAGS)" \
 	PREFIX=/usr \
 	PLATFORM=linux \
 	LIBRARIAN="$(TARGET_AR)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
