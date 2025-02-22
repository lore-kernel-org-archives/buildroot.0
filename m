Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A3C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C576A70E74;
	Fri, 28 Feb 2025 17:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Snp9xWV8OxJ6; Fri, 28 Feb 2025 17:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B643670E6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B643670E6D;
	Fri, 28 Feb 2025 17:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BDF568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 273724866D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68ZdphNLLyTy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E628D47A73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E628D47A73
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D754487C6F; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 22:20:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dcb5d1d91849bf3e22639b38657bdae6e50767d1
X-Git-Newrev: 838a269b8701f59695d200826a65909e09045a9b
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.D754487C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-golang: use ld.bfd
 instead of ld.gold on aarch64
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=838a269b8701f59695d200826a65909e09045a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Go forces use of the Gold linker on aarch64 due to a bug in BFD that
is fixed in Binutils >= 2.41 (that includes all versions provided by
Buildroot). Forcing Gold will break with toolchains that don't provide
it (like the Buildroot toolchains), so override the flag and use BFD.

This override should be removed if Go stops forcing Gold, and may have
to be adapted if the set of available linkers changes (e.g. with a
future Binutils update).

See: https://github.com/golang/go/issues/22040

Fixes:
http://autobuild.buildroot.org/results/a59/a59bc999e9620ff6b9d97138a2de898aadc07529

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
[Romain: add autobuild reference]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pkg-golang.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a3421af288..bdf8de4d66 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -118,6 +118,16 @@ $(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifeq ($(BR2_aarch64),y)
+# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
+# is fixed in Binutils >= 2.41 (that includes all versions provided by
+# Buildroot). Forcing Gold will break with toolchains that don't
+# provide it (like the Buildroot toolchains), so override the flag and
+# use BFD.
+# See: https://github.com/golang/go/issues/22040
+$(2)_EXTLDFLAGS += -fuse-ld=bfd
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
