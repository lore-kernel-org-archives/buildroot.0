Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDF4CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0422F4066F;
	Thu,  4 Sep 2025 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsdJQwLajEHf; Thu,  4 Sep 2025 16:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDABC4053F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDABC4053F;
	Thu,  4 Sep 2025 16:34:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24BCDAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38294400A1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PwgyGp3A3Av for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912D6400B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912D6400B1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F64287E99; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:21:43 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9007e29b8a044f480659660652018021709fa3e4
X-Git-Newrev: 89d924939df8720f399d5b7991609a32644f6f5b
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.8F64287E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/go: fix CPE id
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89d924939df8720f399d5b7991609a32644f6f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This patch fixes the CPE ID for both go-bin and go-src packages.

The go-src package did had a CPE ID because GO_SRC_CPE_ID_VENDOR is
defined but the generated CPE ID would be the following:

cpe:2.3:a:golang:go-src:*:*:*:*:*:*:*:*

The CPE product go-src doesn't match to anything and should be 'go'
instead.

For go-bin no CPE_ID variable were defined so no CPE ID would be
generated if using a pre-build toolchain.

This patch duplicate the definition of the CPE_ID variables, I didn't
put the definition in the 'package/go/go.mk' file to avoid generate a
CPE for the go virtual package.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1869b4065c6b4df909f5623719c818c0cc6394d2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/go/go-bin/go-bin.mk | 3 +++
 package/go/go-src/go-src.mk | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
index a0f1e26e8f..ac42e4cbf3 100644
--- a/package/go/go-bin/go-bin.mk
+++ b/package/go/go-bin/go-bin.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
+GO_BIN_VERSION = $(GO_VERSION)
 GO_BIN_SITE = https://go.dev/dl
 GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
 GO_BIN_DL_SUBDIR = go
 HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz
 GO_BIN_LICENSE = BSD-3-Clause
 GO_BIN_LICENSE_FILES = LICENSE
+GO_BIN_CPE_ID_VENDOR = golang
+GO_BIN_CPE_ID_PRODUCT = go
 
 HOST_GO_BIN_PROVIDES = host-go
 
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 340aada94c..c1f11a2262 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+GO_SRC_VERSION = $(GO_VERSION)
 GO_SRC_SITE = https://storage.googleapis.com/golang
 GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
 GO_SRC_DL_SUBDIR = go
@@ -11,6 +12,7 @@ GO_SRC_DL_SUBDIR = go
 GO_SRC_LICENSE = BSD-3-Clause
 GO_SRC_LICENSE_FILES = LICENSE
 GO_SRC_CPE_ID_VENDOR = golang
+GO_SRC_CPE_ID_PRODUCT = go
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
