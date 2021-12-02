Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850E7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B75540A53;
	Thu,  2 Dec 2021 17:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1e9sMxAuYo6; Thu,  2 Dec 2021 17:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 264DE40162;
	Thu,  2 Dec 2021 17:40:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46D7A1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3492341DF0
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQI7hQUo830w for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:40:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8013E41DC7
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:40:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5320C922BB; Thu,  2 Dec 2021 17:35:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:33:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd89074e8338b2114832469e2a188ff7824a7e25
X-Git-Newrev: 30107f026e0d4a44344a51199a24a01979bf556b
X-Patchwork-Hint: ignore
Message-Id: <20211202173531.5320C922BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/heimdal: install compile_et
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

commit: https://git.buildroot.net/buildroot/commit/?id=30107f026e0d4a44344a51199a24a01979bf556b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

compile_et is not installed anymore by heimdal since version 7.0.1 and
https://github.com/heimdal/heimdal/commit/e40ef47b57f3c62f94c4056f02ced3af2ed083ca

So remove the broken symlink and install it manually as it is needed for
samba4 because compile_et provided by e2fsprogs raises a build failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
