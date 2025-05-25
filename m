Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C234C54F30
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 21:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B774980D81;
	Sun, 25 May 2025 21:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIC_yGLW-R7x; Sun, 25 May 2025 21:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96EE80D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96EE80D7B;
	Sun, 25 May 2025 21:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07BD668
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7C980D6C
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72eIu1A1ENLE for <buildroot@buildroot.org>;
 Sun, 25 May 2025 21:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E843580D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E843580D72
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E843580D72
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:52:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id JJH5uip180WuxJJH5uN7aw; Sun, 25 May 2025 23:52:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 25 May 2025 23:52:54 +0200
Message-Id: <20250525215254.449877-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOtwhRKsWj9mD2StapV0vCCj7VlYNTIjNbSYdVv8bPkKV5cDYEtOT7wYKxmPv16X9fkQIA8U2guosGw0ffLXBAWOZBbuWD9bXEEK3MHZmMYkoMGAFE0R
 UxefaOd90lwIMJdSNlV6yygXc9oeplC4B4wiEOQ3hNyZyP+UgitXKXo//lOEV888qAaxY3eAiyVrlAXBJM66dSfV5D0v2X1pGa0coTD8gjYG1HeQgk2GSdES
 /7aPHuSZLNVmQK59axv8r7Nb5rkcEouF2CAe96D47IJ/JyFAfJY4TofVLbmfbrsc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1748209975; bh=/VFVDYqDOfI03VPJlXHpn++RncbmJdvoTcGRYcCRdQI=;
 h=From:To:Subject:Date:MIME-Version;
 b=hVxF3dtWX0cWvxY8kDpEJbLj7syZhuEbR2drrJquSoVoCuHwPXOvL1dE3cFtUSQX+
 9prVf3Vkd+64XNnEWobzHyMtkmaqlz08nPqjDq3xIkTSeZxccbNUz6QAIYWfeQv5lZ
 55Z4HKntcTaWZFsp4fAwRl55Un6xPsbvH7Uwa6ZRpS53JIE6yGFzhQV648cbKsKFwm
 CzawdqpzA/jsyHSHTjvzlUHdXlJDw5fRiZPIOLub1tXF6RdwGrnjn615PGyqVP68or
 zo0io+f8kYyCh7Q4v13nQNRwz0tYa5CA4Kkg4Us5wJZZuronhJKe96/bmSjaIEeUFd
 5+DKJPY/EtGlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hVxF3dtW
Subject: [Buildroot] [PATCH v2] package/esp-hosted: bump to version 1.0.4.0.0
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

Esp-hosted project released a new tarball after almost 3 years where they
only committed patches to git repository. They also defined a template for
releases[1]

Release notes:
https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-v1.0.4.0.0

[1]: https://github.com/espressif/esp-hosted/commit/ced8383c2b8d44b0d15e04dbb424d5a51e7f468c#diff-2e8cb17d6e84161bc5a232fbdf4c0b8893c4330f185c66c564e33ced6ffc864f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed wrong URL as suggested by Julien Olivain
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8de3c00190..8b0b3e5f90 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
+sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 4c249eec46..0d9dacbd6a 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 1.0.4.0.0
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))
+ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
 ESP_HOSTED_LICENSE_FILE = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
