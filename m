Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8596C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE3841788;
	Wed, 26 Jan 2022 21:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tld6L0qFygaU; Wed, 26 Jan 2022 21:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A509C416F5;
	Wed, 26 Jan 2022 21:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8232E1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA5A825B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diCALIdyN9vy for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:28:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B006A82538
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:28:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 456B781D55; Wed, 26 Jan 2022 21:21:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:24:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37097d6d60d8edb08e226e64401fe055521de676
X-Git-Newrev: 6e7b8f9412ac12225e441acbd5228e97c2e38ca7
X-Patchwork-Hint: ignore
Message-Id: <20220126212131.456B781D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/delve: support building as host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e7b8f9412ac12225e441acbd5228e97c2e38ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Users may want to debug Go programs using dlv on the host machine.

Adds package host-delve and BR2_PACKAGE_HOST_DELVE.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host       | 1 +
 package/delve/Config.in.host | 7 +++++++
 package/delve/delve.mk       | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 20034f6ee0..341e24926b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
+	source "package/delve/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
new file mode 100644
index 0000000000..dab5ca8914
--- /dev/null
+++ b/package/delve/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_DELVE
+	bool "host delve"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  Delve is a debugger for the Go programming language.
+
+	  https://github.com/go-delve/delve
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 984d90a03c..4ca1786ffc 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -14,4 +14,9 @@ DELVE_TAGS = cgo
 DELVE_BUILD_TARGETS = cmd/dlv
 DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
 
+HOST_DELVE_TAGS = cgo
+HOST_DELVE_BUILD_TARGETS = cmd/dlv
+HOST_DELVE_INSTALL_BINS = $(notdir $(HOST_DELVE_BUILD_TARGETS))
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
