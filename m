Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13754C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1FAD60D75;
	Thu,  6 Jan 2022 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfYvzEX8KTuN; Thu,  6 Jan 2022 21:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3301D60E07;
	Thu,  6 Jan 2022 21:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCA2C1C1148
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB33B81250
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HF5x5pgSqpOJ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:06:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF44281329
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 46AFC81393; Thu,  6 Jan 2022 20:59:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 21:25:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8324bf87c38ddc3a746c01346ca39477021fd83
X-Git-Newrev: d341ec035067120b456f669a826e26eb594c0237
X-Patchwork-Hint: ignore
Message-Id: <20220106205958.46AFC81393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iptables: use installed
 iptables by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=d341ec035067120b456f669a826e26eb594c0237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-iptables depends on ctypes.util.find_library() which does not
work due to the absence of gcc and friends on target. The location of
the xtables library and the iptables modules can be configured through
environment variables. Within the scope of buildroot we can determine
what these should be at build time and replace the calls to os.getenv()
with the correct value.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-iptables/Config.in          | 2 +-
 package/python-iptables/python-iptables.mk | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
index a35577bad3..0e24283d06 100644
--- a/package/python-iptables/Config.in
+++ b/package/python-iptables/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_IPTABLES
 	bool "python-iptables"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_IPTABLES
 	help
 	  Python bindings for iptables.
 
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 72bf292c77..0ccf064217 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -9,5 +9,14 @@ PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/ca/6e/cba9c6f4b5a
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
+PYTHON_IPTABLES_DEPENDENCIES = iptables
+
+define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
+	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
+	sed -i "s%os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")%$$XTABLES_VERSION%" $(@D)/iptc/xtables.py
+	sed -i "s%os.getenv(\"XTABLES_LIBDIR\")%\"/usr/lib/xtables\"%" $(@D)/iptc/xtables.py
+endef
+
+PYTHON_IPTABLES_PRE_BUILD_HOOKS += PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
