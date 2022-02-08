Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 18:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E61824DD;
	Tue,  8 Feb 2022 18:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnoGyf88Rv3u; Tue,  8 Feb 2022 18:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458F0823C0;
	Tue,  8 Feb 2022 18:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD6CA1BF2AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8DCE813E9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOUyRR9g1KFa for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 18:05:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60EF7818AC
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 18:05:39 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr20.francetelecom.fr (ESMTP service) with ESMTPS id 4JtWC52srYz1xx4; 
 Tue,  8 Feb 2022 19:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644343537;
 bh=YV992jS1cfw27nlCMHLRv0tXA8AUBvnSdWnZ12NEFpY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=JqAfJXDhy76JPPTzVSc+KAAJU03w4pMRDZ+jv3QdSqiRwNutIwIRKlyd3hK7qU62X
 x/9ecauhTTQwSgxChcU3FebAUo+qCxNLSuMBCRkNxcfPm6GYvnOrhkLAyChXMcVguJ
 eZts39KruhC9FQOxYwGwzSrTxIyGERTL0IxKxhJDZH1yQSk2aw+ENsW5wcwMG9CMC4
 3bAsq2AbKq2Qk3BSmo1raM+21hUUgvA+VBFFCo2BvdnI8D32oK+P/SmbqnE20uxsWZ
 2bUmGgaRKb2TXzXaqeJ7wnIUaD9WJMeGQ5TyYQtxKYvN/PEl6j3R+fPLZCpHLUv+fY
 dYv1SWeZAPYGA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 19:05:34 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Feb 2022 19:05:30 +0100
Message-ID: <3095_1644343537_6202B0F1_3095_214_1_61674c9d53c678f60a82c5c347147c31b9a29ba6.1644343524.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644343524.git.yann.morin@orange.com>
References: <cover.1644343524.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 3/3] package/pkg-cargo: allow building in a
 sub-directory
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Some packages have their rust sources as a sub-directory, rather
than at the root of the source tree.

Do like we do for autotools-package, and use the package's _SRCDIR
rather than the top-level directory $(@D).

Additionally, in such a situation, it is more than probable that
the Cargo.toml is also present in that sub-directory, so use that
when vendoring the package, unless the package took extra precautions
to specify an alternate location.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 66bea513e0..68e15e066c 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -71,6 +71,14 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
+# If building in a sub directory, use that to find the Cargo.toml, unless
+# the package already provided its location.
+ifneq ($$($(2)_SUBDIR),)
+ifneq ($$(filter BR_CARGO_MANIFEST_PATH=%,$$($(2)_DL_ENV)))
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+endif
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
@@ -97,7 +105,7 @@ $(2)_LICENSE += , vendored dependencies licenses probably not listed
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -111,7 +119,7 @@ define $(2)_BUILD_CMDS
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
@@ -133,7 +141,7 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -152,7 +160,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
