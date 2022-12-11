Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D18CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E10A410CF;
	Mon, 20 Feb 2023 22:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E10A410CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWHSkD8YLyUs; Mon, 20 Feb 2023 22:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F764EF87;
	Mon, 20 Feb 2023 22:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F764EF87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85EF51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9988161156
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9988161156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB_8tjuEc3mr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 971EE6115B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 971EE6115B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9203C8648F; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 045e99044223cfc707f5969791d7db2be8c5aa9b
X-Git-Newrev: d7b796406e93b405ad9c276ac96fef7c4007cb15
X-Patchwork-Hint: ignore
Message-Id: <20230220205201.9203C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dnspython: bump
 to version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7b796406e93b405ad9c276ac96fef7c4007cb15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport patch removing wheel dependency.

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...01-Remove-spurious-wheel-build-dependency.patch | 29 ++++++++++++++++++++++
 package/python-dnspython/python-dnspython.hash     |  4 +--
 package/python-dnspython/python-dnspython.mk       | 20 ++++-----------
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
new file mode 100644
index 0000000000..b43217edad
--- /dev/null
+++ b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
@@ -0,0 +1,29 @@
+From 53b989e4ce32c941d748ad33502600497595914a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 2 Nov 2022 14:01:58 -0600
+Subject: [PATCH] Remove spurious wheel build dependency
+
+Wheel isn't a build dependency so it shouldn't be in setup_requires.
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+53b989e4ce32c941d748ad33502600497595914a]
+---
+ setup.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 0abd270..2cb3e06 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -46,7 +46,7 @@ packages =
+     dns.rdtypes.CH
+ python_requires = >=3.7
+ test_suite = tests
+-setup_requires = setuptools>=44; wheel; setuptools_scm[toml]>=3.4.3
++setup_requires = setuptools>=44; setuptools_scm[toml]>=3.4.3
+ 
+ [options.extras_require]
+ DOH = httpx>=0.21.1; h2>=4.1.0; requests; requests-toolbelt
+-- 
+2.34.1
+
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index c9c74c8d75..29441b41ea 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  8a362d7b2358be3117683e2dbf9654fc  dnspython-2.1.0.zip
-sha256  e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4  dnspython-2.1.0.zip
+md5  c7172f4115cd7b60fd5037cfcd8f9408  dnspython-2.2.1.tar.gz
+sha256  0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e  dnspython-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 77e6082807..43030ae476 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,24 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.1.0
-PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).zip
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/13/27/5277de856f605f3429d752a39af3588e29d10181a3aa2e2ee471d817485a
+PYTHON_DNSPYTHON_VERSION = 2.2.1
+PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/99/fb/e7cd35bba24295ad41abfdff30f6b4c271fd6ac70d20132fa503c3e768e0
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-
-define PYTHON_DNSPYTHON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_DNSPYTHON_DL_DIR)/$(PYTHON_DNSPYTHON_SOURCE)
-	mv $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)/* $(@D)
-	$(RM) -r $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)
-endef
-
-define HOST_PYTHON_DNSPYTHON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON_DNSPYTHON_DL_DIR)/$(HOST_PYTHON_DNSPYTHON_SOURCE)
-	mv $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)/* $(@D)
-	$(RM) -r $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)
-endef
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
