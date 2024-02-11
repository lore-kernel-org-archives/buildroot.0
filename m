Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE14C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 694E540635;
	Sun, 11 Feb 2024 17:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xalA98Gx8zgb; Sun, 11 Feb 2024 17:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A13D4405CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13D4405CE;
	Sun, 11 Feb 2024 17:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7BF31BF5A9
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FB68215D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huiUjtq_0nT1 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9BF8215B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB9BF8215B
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 942CA8771B; Sun, 11 Feb 2024 17:04:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:01:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 614e05f91524ae0f4c7d0bb8c7844645a85497fb
X-Git-Newrev: c10349bf67c113444c9f9081b18cf15457f78d04
X-Patchwork-Hint: ignore
Message-Id: <20240211170407.942CA8771B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package:libselinux: replace
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

commit: https://git.buildroot.net/buildroot/commit/?id=c10349bf67c113444c9f9081b18cf15457f78d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as
libselinux uses setuptools instead of distutils since version 3.5 and
https://github.com/SELinuxProject/selinux/commit/2b5d5585754eb731a68158b613c7676fc3195ed9

This will avoid the following build failure raised since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b:

In file included from /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/Python.h:38,
                 from selinuxswig_python_wrap.c:168:
/home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
Fixes: http://autobuild.buildroot.org/results/3fbbb741de33310c8cacab753a32e79c5e531036

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/libselinux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b8de21edaa..4a8d71050d 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -38,7 +38,7 @@ LIBSELINUX_DEPENDENCIES += \
 	host-swig
 
 LIBSELINUX_MAKE_OPTS += \
-	$(PKG_PYTHON_DISTUTILS_ENV) \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
@@ -93,7 +93,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
-	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR) \
 	USE_PCRE2=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
