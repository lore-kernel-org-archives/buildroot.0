Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E32C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC2E81EB8;
	Thu,  3 Nov 2022 00:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC2E81EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P01F8o1Ku269; Thu,  3 Nov 2022 00:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2557481EB1;
	Thu,  3 Nov 2022 00:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2557481EB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1D71BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E752881E8C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E752881E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QqQFwUsSmImI for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:12:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9419581E86
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9419581E86
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:12:06 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id e19so295767ili.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WG+18Ha09rKK1WwWySVbHVqF/A30Pka4UBsnPjgRxmg=;
 b=HlNcQBU7/OhMo5rfwgzHxu03Mfvu+SLQhT4KITrYvCefwvuMd9SNeUn1XpxrhzzXvD
 ZHcHuccX2UvcWnPKFkP9+eossd+Mn1OmJzECWvtdZTq73TkEP41GWdy25D0KhsuRcpyU
 XJAeisgVRohCQ/+S89iIpz1aPqnfJpBJvN7+pO+S19bJmu9QhbZAZQWwZeu5dIN5nhA7
 U3TbYq7SnKBjRpRPuVVCduwBH4M+TJqUKK7TJYQMBv0bht6Wn4WPiF+SHRicOOWkO3/E
 8XDUf+gvvyIuXo5zA9Ojg3EFdJCBvlwuVMegaTPJkBx2h6ZWvAJt9EkhPH+xiNjb4bUy
 7sZw==
X-Gm-Message-State: ACrzQf1j+iC+Cb90RmRaEYp7tfG5dM6trBiv1XvDsE/IZ2xrhWts/Paa
 kTJkLRpWQq9ed0YSajasLI4+TlLL6j2GOVlj
X-Google-Smtp-Source: AMsMyM4wSITH952ypF3i/lL5Gr8bAW5rILQ9/3rY7onf6rwliO+4Eq24xWc8X6QuQvVid78UMxHivQ==
X-Received: by 2002:a92:ce8e:0:b0:300:8bd3:879d with SMTP id
 r14-20020a92ce8e000000b003008bd3879dmr15318661ilo.285.1667434325310; 
 Wed, 02 Nov 2022 17:12:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i16-20020a925410000000b002fc323a2902sm4956990ilb.62.2022.11.02.17.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:12:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:12:00 -0600
Message-Id: <20221103001200.1576937-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103001200.1576937-1-james.hilliard1@gmail.com>
References: <20221103001200.1576937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WG+18Ha09rKK1WwWySVbHVqF/A30Pka4UBsnPjgRxmg=;
 b=jA7zhecqqT9RUp6uVzfr1LADoYz9Tm6ojlsJQebLPLrv5X+1Pyl0bEVUp39WBvDjr9
 HMsDzkLF0dZz2dcWH+PgOLxIO6JUboD9cqJFfpwpXXgpIsMHNqdN+XSfWIqhesGSGD1G
 VUu1SYRoVOY+xTa2ljkyhWXmop5JZL+cvvEWl+nPx8ZYDUeeJnYNa/j9I9o0C7OIyZit
 pDh8q2RM54K9ilY2VvnyhJjvfxN5O0AVfIvcv5VEcZetZKbgmqYUoFtuBVKra8ueBrQw
 TMwWcdBpAGssv2zuSHrDumYijbGyibuwzU735zErHqM0jI4SJO1dJeGRwbZZcuAqKbcv
 zvTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jA7zhecq
Subject: [Buildroot] [PATCH 2/2] package/python-kiwisolver: bump to version
 1.4.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Esben Haabendal <esben@haabendal.dk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-cppy build dependency.

License hash changed due to filename update:
https://github.com/nucleic/kiwi/commit/b04d5d3f6cb404d1e23c0c4f9bff76bd5a8facb6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 8 +++++---
 package/python-kiwisolver/python-kiwisolver.mk   | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index aa7d79ced7..7f2e263a5b 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
-sha256  95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
+# md5, sha256 from https://pypi.org/pypi/kiwisolver/json
+md5  34796908455c3b23c889439b541e424b  kiwisolver-1.4.4.tar.gz
+sha256  d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955  kiwisolver-1.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2b99803c0d..2c5db26dbc 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.1.0
-PYTHON_KIWISOLVER_SITE = $(call github,nucleic,kiwi,$(PYTHON_KIWISOLVER_VERSION))
+PYTHON_KIWISOLVER_VERSION = 1.4.4
+PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5f/5c/272a7dd49a1914f35cd8d6d9f386defa8b047f6fbd06badd6b77b3ba24e7
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
+PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
