Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E87BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 196BE404D3;
	Sun,  5 Nov 2023 08:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 196BE404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vOJOibELDXH; Sun,  5 Nov 2023 08:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2C26404DB;
	Sun,  5 Nov 2023 08:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C26404DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7121BF588
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E884982277
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E884982277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqYhY4lAfK7J for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:13:16 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B92C58212E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92C58212E
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35932aa21a3so13583165ab.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699171995; x=1699776795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9uFQDcLqeawJMeVLmdr6hWo/8S7nu3+nq0WMhq5earg=;
 b=eN0RyPgC4SE0rXClLLDUjpBoWh2jtpijPxxueZs7OChw403HImfHqJe4FyMSefJacN
 PHe4D9Vc+v8pJfW6/DP1pyBPAtgq8WJ/rOloPuFTdgpLUk7R5X77DGxS+2xZdzNn9xHB
 L6tI+3eRuYcn7v0SuH2+txPUNUa8Qi3ulcSVCJsGfS6zriOWlbFI4Ky8YBAvFUcmPOCA
 IxFo5ynqRiBz6ApGWDjCGBdiPAvhWl7lZg4HnaMI1ScTWqghG+fst3qWdzplsyaNalns
 wpm6BLJYTdnVimtsklu3z3jIF9RGUHubCjq+vqJlyWef2PYhaWrJGDUcHXCtnBlWXdQH
 XGEA==
X-Gm-Message-State: AOJu0YwPQyuciDBVn9om0i6/1AaWTub79wGR33oTG6kFB5UMifucKZkl
 Rdv5BC8cdLEmBPMRKOc7//48iFIqW6S0gg==
X-Google-Smtp-Source: AGHT+IG4c3aavWttacI4aSxLN7sz9z3cncPh8srbv7RLbJfl0gBxky5ZsLcISAW6GtWN/WYXtUDTpA==
X-Received: by 2002:a05:6e02:1aa7:b0:359:5389:c0eb with SMTP id
 l7-20020a056e021aa700b003595389c0ebmr10955609ilv.6.1699171995350; 
 Sun, 05 Nov 2023 01:13:15 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 l14-20020a056e02066e00b00357d6dc907fsm1752133ilt.65.2023.11.05.01.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:13:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:13:13 -0700
Message-Id: <20231105081313.2908316-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699171995; x=1699776795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9uFQDcLqeawJMeVLmdr6hWo/8S7nu3+nq0WMhq5earg=;
 b=Xh9Rk0Sjaw7J3GnSka5/H2VJcnULI0oKx1SaiiMyPCtM9n0X2xu5P/s7UfZMZRiut0
 G5NH2Y1XHtZQhQBhb+xtkA0bGJYIvuj4/3sc+41EGtmd8kZwuO8z5e3yqUmYwsiTPYun
 JRsvGOG6toSrxHFzCS3UxOFqiWILr9alzoeDt4mrzkxQt/lHumlDfc9lbRZDcaUIuZgw
 DzCeWo4Tvy3Irah87kblX/TyqA9apJDix/snf2EK7vuPWtLxGKYeudicbhBlcspYgE8e
 nzplV10clwMLGZLtjqb04vJbxgDPoFK78qp0dqQub1KKOyXoZTVfCxMcTM2H3X+Iopxd
 vQbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xh9Rk0Sj
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.19.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index dee8810e89..99034d20bb 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  47e89a2b8bedcfeb1527fac37b9ba1b3  jedi-0.18.2.tar.gz
-sha256  bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612  jedi-0.18.2.tar.gz
+md5  0951191b506b660bfdb90c3dcd5b3254  jedi-0.19.1.tar.gz
+sha256  cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd  jedi-0.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 40de61f0e8..5d54642a07 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.18.2
+PYTHON_JEDI_VERSION = 0.19.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/15/02/afd43c5066de05f6b3188f3aa74136a3289e6c30e7a45f351546cab0928c
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/d6/99/99b493cec4bf43176b678de30f81ed003fd6a647a301b9c927280c600f0a
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
