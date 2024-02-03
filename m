Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3D7C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796004021F;
	Sat,  3 Feb 2024 17:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 796004021F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxNuYT7WKqw8; Sat,  3 Feb 2024 17:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EFD41B51;
	Sat,  3 Feb 2024 17:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EFD41B51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B47B1BF990
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08E9481F05
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leE496b5eA6Q for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 11:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A554D81EA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A554D81EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A554D81EA8
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 11:28:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 842E4867B4; Sat,  3 Feb 2024 11:28:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 12:26:39 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 003d02c476b9ff88416f9cc99dbb4a3c0f78664a
X-Git-Newrev: 7207a1242ae137cabf188456f7314becca9a0401
X-Patchwork-Hint: ignore
Message-Id: <20240203112820.842E4867B4@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/depot-tools: bump
 version to 8d14454ba4a35fd9d2483842b08815a2357ec86f
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

commit: https://git.buildroot.net/buildroot/commit/?id=7207a1242ae137cabf188456f7314becca9a0401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The current depot-tools version is from Jul 13 2023, and there is a bug
where when building with PPD enabled, building a Flutter application on
my laptop running Fedora 39 or even in the Debian 11 container fails due
to permission issues when running rsync such as:

    /usr/bin/sed: couldn't open temporary file [...]/output/per-package/flutter-gallery/host/share/flutter/sdk/.vpython-root/0e1e32/lib/python3.8/sed763MrF: Permission denied
    make: *** [package/pkg-generic.mk:267: [...]/output/build/flutter-gallery-2.10.2/.stamp_configured] Error 123

After several hours of attempting to find the exact cause of the issue
by parsing git logs of the depot_tools repository and cross-referencing
bugs on https://bugs.chromium.org/p/chromium/issues I am unable to
determine the exact reason why the problem occurs or the exact commit
that fixes the issue.

However, updating depot-tools does indeed fix the issue, and looking at
the source code between 4e87f5bf and 8d14454b shows improvements to
several bash scripts, such as gclient, vpython3, and spid. All of which
could be culprits of this bug. As flutter-engine is the only package
that uses host-depot-tools, it is safe to update.

This permission bug is present on PPD and normal builds, but causes a
build to crash only on PPD because of rsyncing. On non-ppd builds, the
bug only causes some minor annoyance when trying to run `make clean`
because permission denials crop up when trying to remove the
.vpython-root directory.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - copy the cover-letter description as commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2b7b68cfe56459f24684cdc2237b35b6c240cbf8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 2109096901..70218e4658 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br1.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index e3b840f29a..634258ffbb 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
