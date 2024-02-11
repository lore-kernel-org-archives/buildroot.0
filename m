Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8932DC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F392404F8;
	Sun, 11 Feb 2024 17:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g01-9bg5tKHJ; Sun, 11 Feb 2024 17:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70CC40518
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C70CC40518;
	Sun, 11 Feb 2024 17:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9A8E1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABFD882162
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvtonlOB6bEX for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F5C8215D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F5C8215D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FB368770D; Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:02:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c10349bf67c113444c9f9081b18cf15457f78d04
X-Git-Newrev: 9dfaa179dbc6efba3f2033e35ef9c3b2653061b8
X-Patchwork-Hint: ignore
Message-Id: <20240211170407.9FB368770D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdnet: replace
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dfaa179dbc6efba3f2033e35ef9c3b2653061b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
