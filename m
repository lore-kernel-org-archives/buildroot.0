Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812ADC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DFE41B75;
	Mon,  4 Dec 2023 20:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DFE41B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPAXF7ABKDLh; Mon,  4 Dec 2023 20:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7864241B72;
	Mon,  4 Dec 2023 20:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7864241B72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 214381BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8709C416F8
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8709C416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ie81dauz0qJ9 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E0C84173A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0C84173A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B76F879B6; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b28b95d1e4087e7569522565a8327f45f39e11de
X-Git-Newrev: 906a9fb98972683c8db3820c073ddaa0a0218212
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.2B76F879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: instantiate
 _INSTALL_CMDS
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

commit: https://git.buildroot.net/buildroot/commit/?id=906a9fb98972683c8db3820c073ddaa0a0218212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-flit-core is the only package that overrides
_BASE_INSTALL_CMD. Since we're going to remove that variable in a
follow-up patch, we no longer will be able to do that.

Since host-python-flit-core is really a special case, it makes sense to
define HOST_PYTHON_FLIT_CORE_INSTALL_CMDS in its entirety.

While we're at it, also instantiate
HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS directly there. This
variable is not used anywhere else, and it's a bit confusing to have it
in pkg-python.mk - it looks like a mistake.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk                        | 3 ---
 package/python-flit-core/python-flit-core.mk | 9 +++++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5f8ef14262..be9756acc4 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -177,9 +177,6 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--scripts=$(HOST_DIR)/bin \
 	--data=$(HOST_DIR)
 
-HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
-	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-
 # Target flit packages
 PKG_PYTHON_FLIT_ENV = \
 	$(PKG_PYTHON_PEP517_ENV)
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index ea887a0258..34e58d03ca 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -13,7 +13,12 @@ PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 # Use flit built in bootstrap_install for installing host-python-flit-core.
 # This is due to host-python-installer depending on host-python-flit-core.
-#
-HOST_PYTHON_FLIT_CORE_BASE_INSTALL_CMD = -m bootstrap_install dist/* $(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)
+define HOST_PYTHON_FLIT_CORE_INSTALL_CMDS
+	cd $($(PKG)_BUILDDIR)/; \
+		$(HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV) \
+		$(HOST_DIR)/bin/python3 \
+		-m bootstrap_install dist/* \
+		--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+endef
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
