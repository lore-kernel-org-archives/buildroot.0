Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A1FC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E6681444;
	Sun, 23 Jun 2024 21:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Br4prkjNY4F; Sun, 23 Jun 2024 21:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A2781276
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A2781276;
	Sun, 23 Jun 2024 21:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF7A41BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9BB3812B1
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgPND3DPLARx for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 21:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B4480F71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B4480F71
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 21:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF33B828DE; Sun, 23 Jun 2024 21:00:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 23:00:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 623d3bbe43e9193aa8e3395367d01af59071b859
X-Git-Newrev: 60fc945734ddc5b1caafea8f148cd89649a36f31
X-Patchwork-Hint: ignore
Message-Id: <20240623210017.CF33B828DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: ensure the toolchain is
 available
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

commit: https://git.buildroot.net/buildroot/commit/?id=60fc945734ddc5b1caafea8f148cd89649a36f31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain is needed to build the final-stage go compiler, when it
should have CGO support.

However, in commit 0290c543dec8 (package/go: new subdirectory for go
variants), the HOST_GO_DEPENDENCIES assignment was only partially split
off to the new location; part of it was left in the ole go.mk to act as
common variables. With that commit, the go package had not been renamed,
which meant that the dependencies were still correct.

But in commit fa2536ec9401 (package/go: make host package a virtual
package), the 'go' package was renamed to 'go-src', and replaced by a
'go' virtual package.

The variables in the go-src package were properly renamed, and the
variables in the go virtual package were properly _not_ renamed. As a
consequence, the go-src package lost its dependency on the toolchain
when needed, while the go virtual package still had it.

However, that was not correct when CGO is enabled (i.e. when the target
has threads): go-src then fails to build:

    Building Go cmd/dist using [...]/host/lib/go-1.21.8. (go1.21.8 linux/amd64)
    go tool dist: cannot invoke C compiler ["[...]/host/bin/aarch64-linux-gcc"]:
    fork/exec [...]/host/bin/aarch64-linux-gcc: no such file or directory

    Go needs a system C compiler for use with cgo.
    To set a C compiler, set CC=the-compiler.
    To disable cgo, set CGO_ENABLED=0.

After some retro-thinking, the reasoning behind this was that the
toolchain would _also_ be needed when using the prebuilt go-bin, which
is indeed correct, so by having it as a dependency of the virtual
package, it would ensure the toolchain be present in both cases, when
building from scratch or when using a prebuilt go.

The oversight being that the toolchain is _also_ needed to actually
build go when CGO is enabled.

We fix this by handling the toolchain dependency for CGO by exposing it
in a variable, that can be used as a dependency in go-src, like is done
to actually enable or disable CGO support.

We still ensure that host-go still depends on it, for a future go-bin
provider.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go-src/go-src.mk | 4 +++-
 package/go/go.mk            | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 1e061e20bc..0d1a9b3187 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -12,7 +12,9 @@ GO_SRC_LICENSE_FILES = LICENSE
 GO_SRC_CPE_ID_VENDOR = golang
 
 HOST_GO_SRC_PROVIDES = host-go
-HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
+HOST_GO_SRC_DEPENDENCIES = \
+	host-go-bootstrap-stage3 \
+	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
diff --git a/package/go/go.mk b/package/go/go.mk
index 6f92893204..91a8fb828f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -83,7 +83,7 @@ HOST_GO_TARGET_ENV = \
 # any target package needing cgo support must include
 # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HOST_GO_DEPENDENCIES += toolchain
+HOST_GO_DEPENDENCIES_CGO += toolchain
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
@@ -95,6 +95,9 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
+# Ensure the toolchain is available, whatever the provider
+HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
+
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
