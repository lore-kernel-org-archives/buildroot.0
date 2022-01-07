Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845ABC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10CC942A01;
	Fri,  7 Jan 2022 22:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN5JJ-g_Br44; Fri,  7 Jan 2022 22:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51554429BA;
	Fri,  7 Jan 2022 22:10:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4AA11BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3839429BA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw_jTPFA1bDe for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3FD8429A5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EEAF8834B0; Fri,  7 Jan 2022 22:04:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:41:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87f2b7004e6d40454d4b07bbe9b0058342c7767f
X-Git-Newrev: 2426002d6fc81d0b023e3f3b3ee4e94ab29438cb
X-Patchwork-Hint: ignore
Message-Id: <20220107220414.EEAF8834B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: fixup npymath.ini
 for numpy extensions
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

commit: https://git.buildroot.net/buildroot/commit/?id=2426002d6fc81d0b023e3f3b3ee4e94ab29438cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to build the numpy distutils extension packages like
python-scipy, python-numba, it requires an explicit pkg-config
path fixup for npymath.ini.

This pkg-config path fixup would update the prefix path of
npymath.ini with actual target staging area where numpy core
was built, so that numpy distutils extension packages would
explicitly link this config path for their package environment.

Without this extension packages cannot find -lnpymath since
it uses host libraries (like libnpymath.a).

So, attach the post install staging hook with pkg-config
path fixup for npymath.ini.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-numpy/python-numpy.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index ae72b87db0..f367b556ef 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -34,6 +34,21 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
 endef
 
+# Fixup the npymath.ini prefix path with actual target staging area where
+# numpy core was built. Without this, target builds using numpy distutils
+# extensions like python-scipy, python-numba cannot find -lnpymath since
+# it uses host libraries (like libnpymath.a).
+# So, the numpy distutils extension packages would explicitly link this
+# config path for their package environment.
+PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
+PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
+define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
+	sed -e '/^pkgdir=/d' \
+	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
+	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
+endef
+PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
+
 # Some package may include few headers from NumPy, so let's install it
 # in the staging area.
 PYTHON_NUMPY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
