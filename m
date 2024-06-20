Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267DFC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE953405F8;
	Thu, 20 Jun 2024 18:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZA-mg7CRS9ka; Thu, 20 Jun 2024 18:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FAC405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FAC405FA;
	Thu, 20 Jun 2024 18:34:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0131BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1920442DF8
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAyHMmBRXiBy for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3D442DEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D3D442DEC
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:34:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04C258808F; Thu, 20 Jun 2024 18:34:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 20:33:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7338e103890c669c48797b0c96d1a5a66ce2d811
X-Git-Newrev: 99a5d51c6e9fbc24b86e1c144253cdfe5eb770c8
X-Patchwork-Hint: ignore
Message-Id: <20240620183425.04C258808F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: ensure there is a host-go
 provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=99a5d51c6e9fbc24b86e1c144253cdfe5eb770c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fa2536ec9401 (package/go: make host package a virtual package)
introduced host-go as a host-only virtual package, which had a single
provider, the choice of which is only exposed when a (target or host)
package has selected BR2_PACKAGE_HOST_GO to indicate it needs host-go.

However, this forgot to account for prompt-less, host-only packages,
which have no way of selecting that symbol.

Having prompt-less, host-only packages is a totally unexceptional,
supported case; for example a host package can be depended upon by
another (target or host) package, or by a filesystem, and we do not
require Kconfig symbols to be exposed for those packages.

As a consequence, when not package is enabled, that can select that
symbol, we can't run 'make source' or 'make host-foo-source':

    make[1]: *** No rule to make target 'host-', needed by
    '[...]/build/host-go-1.22.4/.stamp_configured'. Stop.

Fix that by moving the provider symbol out of the if-block, so that
there is always a provider defined.

Now, we only have host-go-src as a provider, but the symbol is still
part of the choice that is conditional (and that _has_ to be
conditional), so the BR2_PACKAGE_HOST_GO_SRC can never be set unless
there is a package that explicitly select BR2_PACKAGE_HOST_GO.

So, drop the conditional on the default, so that there is always a
provider available.

This mirrors other similar situations, like the rust case.

Fixes: fa2536ec940105acc71630144bd1187c931462ac

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
LGTM: Arnout Vandecappelle (Essensium/Mind) (on IRC) <arnout@mind.be>
---
 package/go/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 483393f8e4..92c1f4cdc3 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -54,12 +54,12 @@ config BR2_PACKAGE_HOST_GO_SRC
 
 endchoice
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src
-	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
-
-endif
+	# Default to host-go-src, as the only provider for now
+	default "host-go-src"
 
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
