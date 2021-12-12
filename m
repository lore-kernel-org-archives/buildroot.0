Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB64C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BA542A19;
	Sun, 12 Dec 2021 14:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtqqkVBPa8Ey; Sun, 12 Dec 2021 14:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFC0429F8;
	Sun, 12 Dec 2021 14:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9B21BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3957C61CBE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ta706pNJb2n for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A66960E80
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A0F3183237; Sun, 12 Dec 2021 14:29:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 11:49:42 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 92309ec38c7b70115bb8b9db1e67cd8415a9325a
X-Git-Newrev: 5e628e4ea1a9656a07fc440bef0dd15d2a3e00d7
X-Patchwork-Hint: ignore
Message-Id: <20211212142951.A0F3183237@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/heimdal: install
 compile_et
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e628e4ea1a9656a07fc440bef0dd15d2a3e00d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

compile_et is not installed anymore by heimdal since version 7.0.1 and
https://github.com/heimdal/heimdal/commit/e40ef47b57f3c62f94c4056f02ced3af2ed083ca

So remove the broken symlink and install it manually as it is needed for
samba4 because compile_et provided by e2fsprogs raises a build failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 30107f026e0d4a44344a51199a24a01979bf556b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 9a1a68f046..ce509c7afa 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -28,19 +28,26 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--disable-ndbm-db \
 	--disable-heimdal-documentation
 
-HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+# Don't use compile_et from e2fsprogs as it raises a build failure with samba4
+HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
 HEIMDAL_CPE_ID_VENDOR = heimdal_project
 
+# We need compile_et for samba4
+define HOST_HEIMDAL_INSTALL_COMPILE_ET
+	$(INSTALL) -m 0755 $(@D)/lib/com_err/compile_et \
+		$(HOST_DIR)/bin/compile_et
+endef
+
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
 	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
 		$(HOST_DIR)/bin/asn1_compile
-	ln -sf $(HOST_DIR)/bin/compile_et \
-		$(HOST_DIR)/libexec/heimdal/compile_et
 endef
 
-HOST_HEIMDAL_POST_INSTALL_HOOKS += HOST_HEIMDAL_MAKE_SYMLINK
+HOST_HEIMDAL_POST_INSTALL_HOOKS += \
+	HOST_HEIMDAL_INSTALL_COMPILE_ET \
+	HOST_HEIMDAL_MAKE_SYMLINK
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
