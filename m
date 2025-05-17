Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81723C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBC740B3C;
	Sat, 17 May 2025 15:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJ76hNf8sXcn; Sat, 17 May 2025 15:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873CA40B40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873CA40B40;
	Sat, 17 May 2025 15:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B6391DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF4140B40
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iypYnDQNZYu6 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F05040B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F05040B3C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:33:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8919B86F8A; Sat, 17 May 2025 15:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:33:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0a7a468130bcae54d40a6e9f3c7c72664803324
X-Git-Newrev: a2356a9e0a1a6d24c11bb74dd8ca3136c5c1c6cb
X-Patchwork-Hint: ignore
Message-Id: <20250517153342.8919B86F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-bootstrap-stage1: fix builds on
 GCC 15
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2356a9e0a1a6d24c11bb74dd8ca3136c5c1c6cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 15 defaults to -std=gnu23, which adds the bool keyword, causing
conflicts with stage1:

https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords

As a workaround, force the build to use -std=gnu99 mode.

Signed-off-by: Felicitas Pojtinger <felicitas@pojtinger.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
