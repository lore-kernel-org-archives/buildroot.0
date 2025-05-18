Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C967C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A4E820CF;
	Sun, 18 May 2025 14:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB7RsEGpdIST; Sun, 18 May 2025 14:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E4A820D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E4A820D1;
	Sun, 18 May 2025 14:47:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC39DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90CEA60D74
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MQ1H6-MFzDz for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0199D60665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0199D60665
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2C2E87141; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:09:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fcdfc1256dba46373694919e7d8d2fba48f33936
X-Git-Newrev: 23a6786f05811109ff194d3009e2141d27e7e4cc
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.F2C2E87141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/go-bootstrap-stage1: fix builds on GCC 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23a6786f05811109ff194d3009e2141d27e7e4cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

GCC 15 defaults to -std=gnu23, which adds the bool keyword, causing
conflicts with stage1:

https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords

As a workaround, force the build to use -std=gnu99 mode.

Signed-off-by: Felicitas Pojtinger <felicitas@pojtinger.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a2356a9e0a1a6d24c11bb74dd8ca3136c5c1c6cb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
index 3e4ee57432..83cb278f68 100644
--- a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
+++ b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
@@ -17,12 +17,13 @@ HOST_GO_BOOTSTRAP_STAGE1_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE1_VERSION
 
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE. See https://github.com/golang/go/issues/11685.
+# CFLAGS and GO_CCFLAGS have no effect, so overwrite CC directly.
 HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV = \
 	GOOS=linux \
 	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_STAGE1_ROOT)" \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
-	CC=$(HOSTCC_NOCCACHE) \
+	CC="$(HOSTCC_NOCCACHE) -std=gnu99" \
 	CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
