Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72190C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235D960AF5;
	Sat,  8 Jan 2022 15:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7npV3WI-55Lq; Sat,  8 Jan 2022 15:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D63160AA9;
	Sat,  8 Jan 2022 15:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8D071BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1ABE40117
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pz_aKiPkQrKj for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C33F340103
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4CA9482DF1; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1cc6061fd368b987d8b03e63cd06a1f792492e3
X-Git-Newrev: 3093444e9cf0c5343677799c9130d3aeb342dc3d
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.4CA9482DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: simplify
 PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
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

commit: https://git.buildroot.net/buildroot/commit/?id=3093444e9cf0c5343677799c9130d3aeb342dc3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES macro was introduced in
commit
2426002d6fc81d0b023e3f3b3ee4e94ab29438cb ("package/python-numpy: fixup
npymath.ini for numpy extensions").

However, it turns out that by using $(PYTHON3_PATH), we can simplify
the intermediate variables, to the point where they are no longer
needed. Not having the intermediate variables makes the logic a bit
easier to understand.

Also, the logic is changed to use a single sed expression, which we
pass to $(SED).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-numpy/python-numpy.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index f367b556ef..9e8b032b78 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -40,12 +40,9 @@ endef
 # it uses host libraries (like libnpymath.a).
 # So, the numpy distutils extension packages would explicitly link this
 # config path for their package environment.
-PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
-PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
 define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
-	sed -e '/^pkgdir=/d' \
-	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
-	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
+	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
+		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
 endef
 PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
