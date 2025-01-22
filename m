Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE314C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E001707F9;
	Fri, 28 Feb 2025 17:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6xi9jqt0lhU; Fri, 28 Feb 2025 17:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7557080F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7557080F;
	Fri, 28 Feb 2025 17:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E1A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5B4042E61
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvmyNe63EDp6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6640842E5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6640842E5D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FB8082581; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 21:31:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 739acecd1312025d543e0694314142004b962d6d
X-Git-Newrev: 686694792b06b11b2cef0acf28d81e25a280cb72
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.5FB8082581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic: store
 real version in legal manifest
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

commit: https://git.buildroot.net/buildroot/commit/?id=686694792b06b11b2cef0acf28d81e25a280cb72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The legal manifest currently stores the $(PKG)_VERSION variable.
However, that variable undergoes a set of changes so that it is
suitable for creating files and Makefile rules; that new value
is purely a technical, internal detail of how Buildroot handles
things.

In the legal manifest, we need access to the real value for the
version, as this is what will allow actual references to the
upstream package. If the version string is mangled, like slashes
replaced with underscores, this introduces ambiguities as to what
exactly the version is.

In Buildroot, there is no package, with a constant version, that
exhibits that issue; for those packages where it is possible to
set a custom git tree and version, like linux or uboot, such a
custom tree can have tags with a slash (not a colon or a space,
forbidden by git); packages in a br2-external can also use such
version strings as well.

The packages that do have such versions are not legion, but they
do exist. For example, Apache's ant buildsystem does use a slash
in their reelase tags, like rel/1.10.15:
    https://github.com/apache/ant/tags

Change the legal manifest to include the actual, original value
as was set in the .mk file.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fe0a7bef38..fb9d9996c8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1193,7 +1193,7 @@ else
 endif # other packages
 
 endif # redistribute
-	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
+	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_DL_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
