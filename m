Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB5AE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87EF84CD0;
	Fri,  6 Sep 2024 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WANJNf6lxw96; Fri,  6 Sep 2024 20:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C69584CD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C69584CD2;
	Fri,  6 Sep 2024 20:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10E251BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7E940BC3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d746_OLAylA for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A6C40978
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62A6C40978
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6025B86B7A; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:14:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c222c29689d3abaee00c1a0a4faefb0306a4c61
X-Git-Newrev: 6016dad5cfbaa93d4acbf4edcc709d81bb6e5148
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.6025B86B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: expose host CGO linking support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6016dad5cfbaa93d4acbf4edcc709d81bb6e5148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even when configured for cross-compilation, the go compiler is always
able to build natively as well, and this is was we use in Buildroot to
build host go packages. This implies that when the target has
limitations, those limitations thus also apply to the host builds.

This means that, when there is no CGO linking support for the target,
the compiler is built without CGO linking support, and thus CGO linking
is also not available for the host builds.

Of course, when there is no go support for the target, the CGO linking
support only depends on the host architecture.

Add a new Kconfig symbol that repesent whether CGO linking is available
for the host; host packages can then depend on that symbol, like the
target variants do on the corresponding target symbol.

The dependencies of this symbol are a bit complicated. Fortunately,
because it is a blind symbol, we can write it with a combination of
"default y" and "depends on" statements. As mentioned, CGO for the host
is available if CGO is available for the target, but also if Go is not
available for the target at all. In addition, Go must of course be
available for the host. There are also the toolchain constraints of CGO.
We exclude MIPS64 explicitly based on BR2_HOSTARCH. For the host, we
always assume that dynamic library and threads are available so we don't
have conditions for that.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Perale <thomas.perale@mind.be>
Cc: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-golang.adoc |  3 ++-
 package/go/Config.in.host               | 12 ++++++++++++
 package/go/go.mk                        |  7 ++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index 3ddbe57afe..aa25426591 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -49,7 +49,8 @@ infrastructure should depend on +BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS+
 because Buildroot will automatically add a dependency on +host-go+
 to such packages.
 If you need CGO support in your package, you must add a dependency on
-+BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+.
++BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+; for host packages,
+add a dependency on +BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS+.
 
 The main macro of the Go package infrastructure is
 +golang-package+. It is similar to the +generic-package+ macro. The
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 11ce6df369..eefca03b02 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -36,6 +36,18 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 
+# CGO linking for the host. Since we use the same compiler for target
+# and host, if the target can't do CGO linking, then the host can't.
+# But if the target is not supported by Go, then the host can do CGO
+# linking (except when it itself does not support CGO linking).
+config BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	default y if !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_HOSTARCH != "mips64"
+	depends on BR2_HOSTARCH != "mips64el"
+
 # Go packages should select BR2_PACKAGE_HOST_GO
 config BR2_PACKAGE_HOST_GO
 	bool
diff --git a/package/go/go.mk b/package/go/go.mk
index 660c7a9bad..7e0dfc5880 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -91,10 +91,11 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-# If the target arch does not support go, host-go can still be used to build
-# packages for the host, and enable cgo. No need to set all the arch stuff
-#since we will not be cross-compiling.
+ifeq ($(BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS),y)
 HOST_GO_CGO_ENABLED = 1
+else # !BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
+HOST_GO_CGO_ENABLED = 0
+endif # BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # Ensure the toolchain is available, whatever the provider
 HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
