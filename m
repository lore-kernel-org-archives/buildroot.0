Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECDBC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D1070FB7;
	Mon, 19 May 2025 11:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULHnvyPTAcTy; Mon, 19 May 2025 11:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1074B70FB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1074B70FB4;
	Mon, 19 May 2025 11:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFC6193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 009CF41DAD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiYfrd8XGcEd for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2431C411D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2431C411D8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2149F81E90; Mon, 19 May 2025 10:40:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:54:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 973a952750c5f5f01e9a12745e5e57c988fcaba0
X-Git-Newrev: ccf3536fcbfb2f3744ef7ccf1ed1b75d6d1f22ac
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.2149F81E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nodejs: make target
 nodejs package virtual
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ccf3536fcbfb2f3744ef7ccf1ed1b75d6d1f22ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit [1], the host-nodejs package was turned into a virtual
package. However, the target nodejs package was intentionally not
turned into a virtual package and became an empty package.
The reason for this is:

  - No alternatives providers were introduced for the target nodejs
    package.
  - The Config.in remained unchaged for the target package.

As a result, running `make show-info` with a config that includes the
target nodejs package, outputs an entry for the empty package:

```
"nodejs": {
    "type": "target",
    "name": "nodejs",
    "virtual": false,
    "version": "",
    ...
    "cpe-id": "cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*"
},
```

This can be an issue because the CPE ID of the empty nodejs package
is the following `cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*`.
Reporting such a CPE ID can be an issue for certain software that consume
the SBOM and could be interpreted as CPE that matches with every versions
of the package.

This patch converts the target nodejs package into a virtual package to
prevents the empty package from being included in the SBOM.

[1] 4cbc2af604 package/nodejs: rename to nodejs-src and convert to virtual package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Tested-by: johan.derycke@barco.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in                | 4 ++++
 package/nodejs/nodejs-src/nodejs-src.mk | 1 +
 package/nodejs/nodejs.mk                | 3 +--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 50d1360715..2a0074b5a4 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -87,4 +87,8 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 
 endif
 
+config BR2_PACKAGE_PROVIDES_NODEJS
+	string
+	default "nodejs-src"
+
 source "package/nodejs/nodejs-src/Config.in"
diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 8f934202b0..30e72743a1 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -14,6 +14,7 @@ NODEJS_SRC_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
 NODEJS_SRC_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
 NODEJS_SRC_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
 
+NODEJS_SRC_PROVIDES = nodejs
 HOST_NODEJS_SRC_PROVIDES = host-nodejs
 
 NODEJS_SRC_DEPENDENCIES = \
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6dc0e501b4..752971c4a6 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -32,8 +32,7 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
 YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
 endif
 
-NODEJS_DEPENDENCIES = nodejs-src
-$(eval $(generic-package))
+$(eval $(virtual-package))
 $(eval $(host-virtual-package))
 
 include $(sort $(wildcard package/nodejs/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
