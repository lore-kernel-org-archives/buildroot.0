Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB6BC021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC3A40B5A;
	Wed, 19 Feb 2025 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKUrc9fTc9_m; Wed, 19 Feb 2025 20:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C3A40B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C3A40B5E;
	Wed, 19 Feb 2025 20:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AF5ECF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39AE6409FC
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzGTSh3EF58H for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 20:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E3B340B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3B340B5A
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E3B340B5A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:55:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id kr69tqYwsS934kr69tjoIp; Wed, 19 Feb 2025 21:55:13 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 19 Feb 2025 21:49:35 +0100
Message-Id: <20250219204935.25502-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCif7xY1z4HqEvIoEoGruEtOnJpQYVSw2Jqb1wbSiU8JVkEGT2ORG+yEQ6hoFel2NN1dJk2EP0ezwbqnZPfr1z9qFH79D32m4fxfpJNHS9vzCxFuMtFw
 gaSpAb3+RoNjNrlu5/G3GTYrG54BfBlEzjgZ5d4ssygxHlXBRDntgMmy4oN9TUM4wKzAli7xhxf1aS5XuewjhROLTa6dBpoDScl5q9Ag80+pljIaHHn5XHqZ
 pM49zroY0IZH/P8qi+fxoq4Brh7SoBJ8vDiVxPgbV9C4GQDxmAXtjow4kZXsSWdXfC3OjcL4B83NYvKddosqIA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1739998513; bh=GHBrYj0w9RNkq/9w7WouIELXMqMBmxEiOWIR/PTak7s=;
 h=From:To:Subject:Date:MIME-Version;
 b=W7WMZb/aSWN7EeQ5BBrEKgD7RADE9xyr+hiPFKtv3jeav/9d6ejlWjTc6mz9jgmgT
 9Q4vmi7IVFLZTlJkgV/Rsez/CG6JMz/HlpWFwqLKSOjP3lZqLTSjvlZY7Qu4hSQIkd
 HlLraGYBijFiSwIo+GAutt0U4Ssx4VH7j7mT1MqsKYApC7YXvQtHjBEkE+Ei4yPvg3
 wIhFaqMh/Dr/a6MpLYK0KLcnFUhGT58HeBeUD0KuTCc73maQ8uDgEewJNH8UeSrt5W
 8S7FkwIogeFvzKWpHAmXJMZiJqdLYLcYIecDpUv5dI01O7h1LOaRrDIHU+8w0qZAsQ
 lCdbcT/M9YNhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=W7WMZb/a
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.108
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

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_108.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index fe29029633..0f73002243 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_107_RTM/src/SHA256SUMS
-sha256  7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729  nss-3.107.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_108_RTM/src/SHA256SUMS
+sha256  a0f6fcb5dbadc1635b43827517a979e3a6d005d0788527802a6b31e2c5f66eec  nss-3.108.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8f2da4a5c4..9a5afeaf4f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.107
+LIBNSS_VERSION = 3.108
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
