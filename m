Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D7C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFAC81380;
	Tue,  7 Feb 2023 11:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFAC81380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDO4oZPWFO07; Tue,  7 Feb 2023 11:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4475C81386;
	Tue,  7 Feb 2023 11:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4475C81386
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6061BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526BE81380
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526BE81380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdvORc-QEi7Z for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0FB1812EE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0FB1812EE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 868A984051; Tue,  7 Feb 2023 11:11:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0781f44c0a9b46d9119557708918948a769e6881
X-Git-Newrev: 1a1081dcbf8d706b08df53fe2ff2d652caf889ae
X-Patchwork-Hint: ignore
Message-Id: <20230207111108.868A984051@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/balena-engine: bump to version
 20.10.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a1081dcbf8d706b08df53fe2ff2d652caf889ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like docker-engine and docker-cli, balena-engine uses a non-standard
vendor/ directory structure, so we use the same fixes as we introduced
for docker-engine ((see commit: package/docker-engine: bump version to
v23.0.0):

  - remove the problematic vendor/modules.txt
  - create a go.mod

Also remove the vendor/archive/ sub-tree (fixes a build error) because
Go no longer allows having duplicate packages in GOPATH and GOROOT.

vendor/archive/tar cannot be in vendor/ because it exists in the
standard library.  Since we remove the full vendor/archive/, that is
also fixed.

https://github.com/balena-os/balena-engine/releases/tag/v20.10.26

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/balena-engine/balena-engine.hash |  2 +-
 package/balena-engine/balena-engine.mk   | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 4adb8ce561..6a92a40cc8 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
+sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index ecfb62bfbf..49d526a465 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.21
+BALENA_ENGINE_VERSION = 20.10.26
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
@@ -34,6 +34,17 @@ BALENA_ENGINE_TAGS = \
 
 BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# remove the conflicting vendor/archive (not allowed in go1.20)
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define BALENA_ENGINE_FIX_VENDORING
+	printf "module $(BALENA_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+	rm -rf $(@D)/vendor/archive
+endef
+BALENA_ENGINE_POST_EXTRACT_HOOKS += BALENA_ENGINE_FIX_VENDORING
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 BALENA_ENGINE_DEPENDENCIES += systemd
 BALENA_ENGINE_TAGS += journald
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
