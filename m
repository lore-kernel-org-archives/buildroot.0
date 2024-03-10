Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E12CC54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3B881926;
	Sun, 10 Mar 2024 22:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZfIldP9AqXP; Sun, 10 Mar 2024 22:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 877D9818C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877D9818C2;
	Sun, 10 Mar 2024 22:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10A0E1BF28B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F13CF405D2
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Juiqzaf_LYrC for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00175405CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00175405CB
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E167E8822A; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:51:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1b5403d7c1371499eb25e28a0b58010f71391d1f
X-Git-Newrev: 8cab81872d34d479b45e43e3671341878d9e30fd
X-Patchwork-Hint: ignore
Message-Id: <20240310221827.E167E8822A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libdnet: replace
 PKG_PYTHON_DISTUTILS_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cab81872d34d479b45e43e3671341878d9e30fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as libdnet
uses setuptools instead of distutils since version 1.16.2 and
https://github.com/ofalk/libdnet/commit/4e4fc687953105b66bcc847a68869126ac3ec918

This will avoid the following build failure raised since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b:

In file included from /home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/Python.h:38,
                 from ./dnet.c:40:
/home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
(No autobuilder failure (yet))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9dfaa179dbc6efba3f2033e35ef9c3b2653061b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/libdnet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index fc2995979d..e678565bdf 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -19,7 +19,7 @@ LIBDNET_DEPENDENCIES = host-pkgconf
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
 LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
 LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
-LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
