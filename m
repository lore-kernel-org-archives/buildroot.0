Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B407C5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C942380C51;
	Mon, 26 May 2025 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxcQUx23e3mp; Mon, 26 May 2025 20:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E993F80C43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E993F80C43;
	Mon, 26 May 2025 20:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A0E19D
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2B7260905
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLJZgvd9q9Ek for <buildroot@buildroot.org>;
 Mon, 26 May 2025 20:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A67FD608EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67FD608EE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A67FD608EE
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:35:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 261A1B00571;
 Mon, 26 May 2025 22:35:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 26 May 2025 22:35:01 +0200
Message-ID: <20250526203501.126937-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748291712;
 bh=TkBVrF1lYXZB2Difjwr0v2dl+UZvs6aOWTGRTvxrhsg=;
 h=From:To:Cc:Subject:Date:From;
 b=a+AJSxU4FCU//ciYdk0izggdNIUwjEjxQvlLGMA5llOghBduGILp5V/xKcrHUl4Cw
 tQo1XKOtafd/QCtBh9Um7bh/ucvJ5Lnhnnr0kgj76wdGyez4QVY2zBYRLY723VuVtM
 hVllP0INACvnqRmoiu+WVsjmdkvF+zipK2KaCpqPBJd/d3ROzl7DCxl6IqTZG6sZYw
 kU+ymAOt36Rc/NtqUUUP/lqigPpJ1ThVn265iHsjf7LsrkWgMI+u45Ip5+232Vgqg3
 Xv/uNpEnBqhvzKgR8/JwZxza1HqiHyxVkJg5Wj6sbARXL7uokGuEYmtubtQ2IT/1do
 v00ny5Kq71Clg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a+AJSxU4
Subject: [Buildroot] [PATCH 1/1] package/esp-hosted: fix legal-info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
