Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE60CAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA72D4183C;
	Wed, 10 Sep 2025 11:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fzozu2KnA1g; Wed, 10 Sep 2025 11:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D027541839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D027541839;
	Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 279EFE1F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E63661106
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW5GYfrjy_NR for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544D960B63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544D960B63
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44D7483D39; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:15:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfdd4ed4e3e2776199897cb0080751956dc5ec4d
X-Git-Newrev: 00230e7ae3b52b122874cac5146c1ccdbe887082
X-Patchwork-Hint: ignore
Message-Id: <20250910111949.44D7483D39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: catch use of legacy
 FOO_INSTALL_BINS
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

commit: https://git.buildroot.net/buildroot/commit/?id=00230e7ae3b52b122874cac5146c1ccdbe887082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Romain: update "Migrating to 2025.08" by "2025.11"]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/manual/migrating.adoc | 6 ++++++
 package/pkg-golang.mk      | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 4e6225a987..130d7a1012 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -222,3 +222,9 @@ from +-cargo2+ to +-cargo4+.
 In 2025.08, starting with systemd version 257, systemd-networkd requires kernel
 5.4 or later. If you are still using a kernel older than 5.4, please update
 your kernel or use an alternative network manager.
+
+[[migrating-golang-packages]]
+=== Migrating to 2025.11
+In 2025.11, the +FOO_INSTALL_BINS+ variable for golang packages is no longer
+supported; the list of binaries to install is automatically derived from
+the +FOO_BULD_TARGETS+ variable.
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ff8d28aa7e..ffd50adecc 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -40,6 +40,12 @@ GO_BIN = $(HOST_DIR)/bin/go
 
 define inner-golang-package
 
+# Legacy
+ifneq ($$($(2)_INSTALL_BINS),)
+$$(error Package $(1) sets $(2)_INSTALL_BINS, which is no longer supported; \
+see the manual: https://buildroot.org/manual.html#migrating-golang-package )
+endif
+
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-modcacherw \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
