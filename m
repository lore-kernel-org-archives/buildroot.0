Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63702C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33BD66FBCC;
	Fri, 28 Feb 2025 16:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNo8FBFnAyow; Fri, 28 Feb 2025 16:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 392416FC46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392416FC46;
	Fri, 28 Feb 2025 16:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 151C0711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD9F424C7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqmHCIf9iNYQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910D442DF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910D442DF5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84CAF83ACF; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 23:31:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2528672d3978c00559bf9c2b6ab64c5e53d78359
X-Git-Newrev: b171b7bd78eacd277dafb82a8524cc224f97ba6b
X-Patchwork-Hint: ignore
Message-Id: <20250228163010.84CAF83ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dracut: use
 host-cross-ldd instead of host-prelink-cross
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

commit: https://git.buildroot.net/buildroot/commit/?id=b171b7bd78eacd277dafb82a8524cc224f97ba6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit reworks the dracut package to use the cross-ldd installed
by host-cross-ldd instead of prelink-rtld installed by
host-prelink-cross.

Indeed, prelink-cross is not maintained upstream, and its dependency
on host-libiberty causes problems in Buildroot with other packages.

The only change needed is that the dracut_wrapper script needs to be
generated, as we now need to know the prefix of the cross-compilation
tool (TARGET_CROSS).

Tested by running the dracut tests of the test suite.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/dracut/dracut.mk                             | 8 +++++---
 package/dracut/{dracut_wrapper => dracut_wrapper.in} | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 8573e64055..cb6044415e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -10,12 +10,14 @@ DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
-HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
+HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 
 define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
-	install -D -m 0755 $(HOST_DRACUT_PKGDIR)/dracut_wrapper \
-		$(HOST_DIR)/bin/dracut
+	sed -e "s%@@TARGET_CROSS@@%$(TARGET_CROSS)%" \
+		$(HOST_DRACUT_PKGDIR)/dracut_wrapper.in > \
+		$(@D)/dracut_wrapper
+	install -D -m 0755 $(@D)/dracut_wrapper $(HOST_DIR)/bin/dracut
 endef
 HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 
diff --git a/package/dracut/dracut_wrapper b/package/dracut/dracut_wrapper.in
similarity index 94%
rename from package/dracut/dracut_wrapper
rename to package/dracut/dracut_wrapper.in
index 968d65cbeb..33012853d5 100644
--- a/package/dracut/dracut_wrapper
+++ b/package/dracut/dracut_wrapper.in
@@ -34,7 +34,7 @@ topdir="$(dirname "$(realpath "$(dirname "${0}")")")"
 DRACUT_LDD="$(mktemp /tmp/dracut-ldd.XXXXXX)"
 cat >"${DRACUT_LDD}" <<EOL
 #!/bin/bash
-${topdir}/sbin/prelink-rtld --root='${sysroot}' \${1}
+@@TARGET_CROSS@@xldd --root='${sysroot}' \${1}
 EOL
 chmod +x "${DRACUT_LDD}"
 export DRACUT_LDD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
