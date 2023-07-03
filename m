Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86109C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E91F60A7E;
	Mon,  3 Jul 2023 18:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E91F60A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkFwzh4JvSIQ; Mon,  3 Jul 2023 18:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A26A60D78;
	Mon,  3 Jul 2023 18:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A26A60D78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A72291BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DAE98133F
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DAE98133F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckvGiUchq24f for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:29:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E408133C
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E408133C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B08CA863E5; Mon,  3 Jul 2023 18:29:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c15e60c106bc852a4cd1f987357580e70e6c28ef
X-Git-Newrev: 3b2913552ee4e304d4d86e577b237652a8f0a99f
X-Patchwork-Hint: ignore
Message-Id: <20230703182930.B08CA863E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b2913552ee4e304d4d86e577b237652a8f0a99f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While migrating to pep517 build backend the host-python-wheel
dependency has been added to host-python-setuptools but
not to python-setuptools. Note that host-python-wheel is not really
needed during the build of (target) setuptools, but the setup.py script
checks if the dependency is present in the host directory.

To make everything consistent, add host-python-wheel as a build
dependency, and BR2_PACKAGE_PYTHON_WHEEL as a runtime dependency.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4537951715

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
[Arnout: also add runtime dependency on the target package.]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-setuptools/Config.in            | 3 ++-
 package/python-setuptools/python-setuptools.mk | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 28228534f8..73368c1a49 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	select BR2_PACKAGE_PYTHON_WHEEL # runtime
 	help
 	  Download, build, install, upgrade, and uninstall Python
 	  packages.
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d957930455..39ead10f55 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -12,6 +12,7 @@ PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
+PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
