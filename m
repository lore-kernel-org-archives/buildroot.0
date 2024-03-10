Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FDFC54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE2B81799;
	Sun, 10 Mar 2024 22:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dh55dR6jrBDv; Sun, 10 Mar 2024 22:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8BE817AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8BE817AA;
	Sun, 10 Mar 2024 22:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B69F01BF85D
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A353940106
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRy-_w028Tmv for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C9340105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C9340105
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE928822B; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:41:10 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 6d77f9954c17a66791b092ed7264b97e783eeb94
X-Git-Newrev: 1b5403d7c1371499eb25e28a0b58010f71391d1f
X-Patchwork-Hint: ignore
Message-Id: <20240310221827.CEE928822B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libselinux:
 replace PKG_PYTHON_DISTUTILS_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b5403d7c1371499eb25e28a0b58010f71391d1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit c10349bf67c113444c9f9081b18cf15457f78d04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
