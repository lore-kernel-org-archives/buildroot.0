Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C20C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 16:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A40D8441F;
	Sat,  4 Jun 2022 16:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSZMh6laR9yX; Sat,  4 Jun 2022 16:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F865843EB;
	Sat,  4 Jun 2022 16:33:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 943FC1BF3E9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 828D14194F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytvOXrLG_8Vd for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 16:33:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD9F418C5
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 16:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C7A486ADC; Sat,  4 Jun 2022 16:22:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 18:33:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 555d2f0f4d81e239d0d189b92c7611095bc0af04
X-Git-Newrev: 8c585eb32d13ce8af09dbfbb273a88839c544348
X-Patchwork-Hint: ignore
Message-Id: <20220604162200.6C7A486ADC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: set goos variable to linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c585eb32d13ce8af09dbfbb273a88839c544348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes a build error when the host environment has GOOS set to
something other than "linux." For example,

cd ./buildroot
GOOS="js" make

This will cause a build failure. Override GOOS to be either empty for host
packages or set to "linux" for target packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 305a4926ee..f9445c7dd3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -73,6 +73,7 @@ endif
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
@@ -95,6 +96,7 @@ endif
 HOST_GO_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GO386),GO386=$(GO_GO386)) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
@@ -109,6 +111,7 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
+	GOOS="" \
 	GOARCH="" \
 	GOCACHE="$(HOST_GO_HOST_CACHE)" \
 	CC="$(HOSTCC_NOCCACHE)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
