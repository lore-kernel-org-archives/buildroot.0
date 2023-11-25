Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EE6C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 04:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4768F61520;
	Sat, 25 Nov 2023 04:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4768F61520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbIdg9gKu3iV; Sat, 25 Nov 2023 04:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D7061506;
	Sat, 25 Nov 2023 04:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D7061506
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0951BF288
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B7C61506
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B7C61506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GupRd6tHDoaO for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 04:51:49 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E6D960AD4
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 04:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6D960AD4
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7b34ee2a243so88713239f.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 20:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700887908; x=1701492708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PxQAzAhBLpbbiq2IP3rgIMVkfxRm9dF2QMzwTr+sl1c=;
 b=iUklWNFLUeBedUnLnu50NGjYuSAOieaXRnpFyqlCEOC1nHJ8hDKIxwRoFlC0r5NQxj
 MHS/8nIN4TPEtH9V9hJOzq1bj6KId/NdocRz4gRLae1QWrH7UsYOt/YZme4FZau6mIHY
 VnFGKx3sN4VnusagEFq+pGnddwPqwGGAhuqYAmekLbKmeQ3XUXvg3YwmL5YO+pK0lYK2
 wC0Y04rWWmpB/uNIiTIcb50G7MM2iM717CBzyrmHG+PDXO4FTklYISf9weLXLhxqpVSE
 ihJ1jrPrw/1DrYVGab0uulU7HjAEPVbBkv9h+5KzRKfDnb+fL8Jhlmf6NM8dkZzpP+ub
 +TxA==
X-Gm-Message-State: AOJu0Yx1nZ7LpGXbwxrr4yDfWvZDrvPa5P+QxjjSxlDqZesPu0atWVLK
 54QJmI5Je7IO8LVU8PhWU+Izsjxn/Xg=
X-Google-Smtp-Source: AGHT+IGKbP3rbjkGgAPFENgkxiI/rUw0ErGBwuygwbEUQo/TAjECcHjHde8WLoQNEMBQg20Pbopd+A==
X-Received: by 2002:a05:6e02:1be6:b0:357:704a:8699 with SMTP id
 y6-20020a056e021be600b00357704a8699mr7171812ilv.8.1700887907746; 
 Fri, 24 Nov 2023 20:51:47 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 h12-20020a02c72c000000b00463fb5dd52dsm1185211jao.57.2023.11.24.20.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 20:51:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 21:51:45 -0700
Message-Id: <20231125045145.254004-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700887908; x=1701492708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PxQAzAhBLpbbiq2IP3rgIMVkfxRm9dF2QMzwTr+sl1c=;
 b=EozII9UEi7ivcAZJvsjQw2SWe115eZHSU/F+jI7gc7UTKrgVyhjmEzgpnD4/QLv1BV
 0GabTj7ToLqjVLvFR1KUum2lTnmd3Lfjq40nQcHn9wJ1YBGSjkrNeUju+AvBqi5HuLJL
 PMf2V3d706ygTNlv/Oo7e0HxDGlPmtcbAapIKYjvW77Gc/6utOZb15+YZsKD3gFT+g+o
 73DtX2VX5yfCBpzN7elZ7qsfsowjdsr/QF8WnR0ir6NbJ2+sb80q6cwMreXWH5NbXBD0
 P7MkN4XkLu7ecz0IPYnO4HuwHXnM0GpZR4iz8dqULJjeG97VWz4jynL1+yRZIJk48IWh
 SNZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EozII9UE
Subject: [Buildroot] [PATCH 1/1] package/python-outcome: bump to version
 1.3.0.post0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-outcome/python-outcome.hash | 4 ++--
 package/python-outcome/python-outcome.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-outcome/python-outcome.hash b/package/python-outcome/python-outcome.hash
index 43796e89ac..476da60766 100644
--- a/package/python-outcome/python-outcome.hash
+++ b/package/python-outcome/python-outcome.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/outcome/json
-md5  58612ee4407901985f85ad3869dd83b8  outcome-1.2.0.tar.gz
-sha256  6f82bd3de45da303cf1f771ecafa1633750a358436a8bb60e06a1ceb745d2672  outcome-1.2.0.tar.gz
+md5  3a626832ac864c95f6054958d0da3011  outcome-1.3.0.post0.tar.gz
+sha256  9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8  outcome-1.3.0.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
index 27d7fdede3..aa8a6cbf38 100644
--- a/package/python-outcome/python-outcome.mk
+++ b/package/python-outcome/python-outcome.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OUTCOME_VERSION = 1.2.0
+PYTHON_OUTCOME_VERSION = 1.3.0.post0
 PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
-PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/dd/91/741e1626e89fdc3664169e16300c59eefa4b23540cc6d6c70450f885098f
+PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/98/df/77698abfac98571e65ffeb0c1fba8ffd692ab8458d617a0eed7d9a8d38f2
 PYTHON_OUTCOME_SETUP_TYPE = setuptools
 PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
 PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
