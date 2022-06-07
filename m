Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1032C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 18:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CDE418D3;
	Tue,  7 Jun 2022 18:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu-Xj3FOIBOG; Tue,  7 Jun 2022 18:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 243D5418CA;
	Tue,  7 Jun 2022 18:45:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECE61BF42D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 18:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BD8660E31
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 18:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmiKUGSsoWyX for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 18:45:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D7EA60D66
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 18:45:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 99AC686DE7; Tue,  7 Jun 2022 18:33:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 20:43:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 893271e7dbb9c6e817164b5e078cce2271fdf6b7
X-Git-Newrev: 8ffd5274062fd1650e4cb9d64644218957e5c4c6
X-Patchwork-Hint: ignore
Message-Id: <20220607183328.99AC686DE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: set goos
 variable to linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ffd5274062fd1650e4cb9d64644218957e5c4c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This commit fixes a build error when the host environment has GOOS set to
something other than "linux." For example,

cd ./buildroot
GOOS="js" make

This will cause a build failure. Override GOOS to be either empty for host
packages or set to "linux" for target packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8c585eb32d13ce8af09dbfbb273a88839c544348)
---
 package/go/go.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 6eaef866dd..d47b8abd96 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -71,6 +71,7 @@ endif
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
@@ -93,6 +94,7 @@ endif
 HOST_GO_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GO386),GO386=$(GO_GO386)) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
@@ -107,6 +109,7 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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
