Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E0C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F366FBF1;
	Tue, 21 Feb 2023 01:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F366FBF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgynojCftXT4; Tue, 21 Feb 2023 01:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1CE700A3;
	Tue, 21 Feb 2023 01:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1CE700A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86F381BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A21A6FE61
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A21A6FE61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwbAwDVZqGhC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 976856FE5C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976856FE5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B31E81979; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:05:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29fd8481e22fd7e8ac00e0bc47614ff06be33706
X-Git-Newrev: 485b47e025541a58358d8852c600b8e7644b4ec6
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.8B31E81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: bump
 version to v23.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=485b47e025541a58358d8852c600b8e7644b4ec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This update requires a few workaround for the non-standard vendor/
structure in the docker-engine repository.

First, as the vendor/ directory exists, our go-post-process script does
not do the vendoring, and exits early, which is exactly what we need.

Second, docker-engine does not use the "new" go.mod mechanism, so it
does not ship any go.mod file, so our go-post-proces, exiting early,
does not check that the go.mod file exists, and thus does not fail,
which is again exactly what we need.

Third, docker-engine has an invalid vendor/modules.txt file that we need
to remove or go would fail to build. Since our go-post-process exits
early, there is no vendoring, and thus it does not break at download,
which once more is exactly what we need.

However, the missing go.mod and the problematic vendor/modules.txt cause
go to fail at build time, which this time is not really, even really not,
what we want...

So, we fix it up in two ways.

First, the easy part: we just remove the problematic vendor/modules.txt
file.

Second, we create a go.mod to tell the Go compiler the root import path
prefix for the module and the language version. Note that the language
version in go.mod is not required to be equal the version of the Go
compiler.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

Note that as of v23.0.0 docker-engine expects containerd to be started
by systemd if --containerd= flag is set in dockerd.service, whereas in
previous versions containerd was started by the docker daemon as a
sub-process.

There is no sysv unit for containerd, but this is OK: in the Docker sysv
init file S60dockerd, we do not set the --containerd flag. The docker
daemon will start containerd as a sub-process automatically due to the
absence of this flag.

Signed-off-by: Christian Stewart <christian@paral.in>
[yann.morin.1998@free.fr:
  - run fixups in post-extract hook
  - rework commit log for (hopefully) better explanations
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d15b1359cb..670cbd414b 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
+sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2a9b72ca78..c50f08245d 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.22
+DOCKER_ENGINE_VERSION = 23.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -62,6 +62,15 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_ENGINE_FIX_VENDORING
+	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
+
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
