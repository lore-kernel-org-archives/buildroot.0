Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4242FC54F30
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11DD60BF0;
	Tue, 27 May 2025 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7z0rTGIKKX6; Tue, 27 May 2025 19:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F6160BEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0F6160BEA;
	Tue, 27 May 2025 19:49:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4850CB66
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B36140621
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmanh0LZY7oA for <buildroot@buildroot.org>;
 Tue, 27 May 2025 19:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A1F405F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A1F405F4
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:49:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6033E8754F; Tue, 27 May 2025 19:49:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 21:48:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d92c7e3ff80f8c9a2d05a141b34dfb164e7e81f
X-Git-Newrev: bd9a6c2b36d92dd38fb3b537ac9645344bec76ac
X-Patchwork-Hint: ignore
Message-Id: <20250527194949.6033E8754F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix legal-info
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd9a6c2b36d92dd38fb3b537ac9645344bec76ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The esp-hosted package was introduced in [1] defining the variable
ESP_HOSTED_LICENSE_FILE (singular). The name should be
ESP_HOSTED_LICENSE_FILES (plural). This typo makes the license file
being ignored during a "make legal-info" which shows a warning at
the end:

    WARNING: esp-hosted-9a2312b0b: cannot save license (ESP_HOSTED_LICENSE_FILES not defined)

Fixing the variable name also reveals the license file path was
incorrect. The "esp_hosted_ng/host/" directory prefix is missing.
Finally, setting the correct path shows the hash was wrong (it was
the hash of the Apache-2.0 [2] file, which corresponds to another
unused code portion). So the license file hash is also changed to
correspond to the correct GPL-2.0 license file.

This commit fixes all the needed esp-hosted legal-info.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7b2e5e6550aed4f79461919c6a59e00741eb4b11
[2] https://github.com/espressif/esp-hosted/blob/release/ng-v1.0.4.0.0/LICENSES/Apache-2.0

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8de3c00190..fee82b00e0 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
-sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 4c249eec46..475d32da43 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -8,7 +8,7 @@ ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-ESP_HOSTED_LICENSE_FILE = LICENSE
+ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
 ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
 
 define ESP_HOSTED_LINUX_CONFIG_FIXUPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
