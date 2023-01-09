Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7670C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FB840983;
	Mon,  9 Jan 2023 05:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FB840983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmEG6CS6gppB; Mon,  9 Jan 2023 05:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 410574094D;
	Mon,  9 Jan 2023 05:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 410574094D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08CF81BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6FD24094D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6FD24094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2stdVMKdHdn8 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:40:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE32F40929
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE32F40929
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:40:55 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id u8so4454969ilg.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lL1wfxxxt7vuvZ4mpZJ25Cr4SXMOp32h2xuaozDZY9M=;
 b=xuXo132sNYGBg6VPg1Ev50etbu8CB+gZrj1TKXIdKyxTIYnA2UAfizJX7igGJZewcz
 a8HYjZApAzB7XMamMVovtDhM0o7NHM1nXLUPY4DAhis+YlZ7i5fj6hNjJtzgSY+n4NJD
 TIm1TqXFpFMbeBxGDzMyLVvxDgFyiZQz35zInqQxMTXHgsqyg6YsXy8JrJNhlwFLTrxF
 9xBBejGrkTW5W/YjyT+9M56ESD2eZt5z88prt+ugcARpR2PahAfI85i7mi3YnxjY3rg8
 0A/ESRYf0MdMdfFMVELB7lOSB5Fi8lAJh1wYMngGnpmP+BUe5ASw2iF88UUpetjCXkLM
 Sfbg==
X-Gm-Message-State: AFqh2kooogrz6j8sRaqf5q+PLFaFtQyr1UhgI6H88HwXZUNDICBFAU2c
 xp+eR9Jc4w7f6gopihpWghP4tCGqX3cTzEaD
X-Google-Smtp-Source: AMrXdXsxCksN6cQaYTJq+s14gf0UZYDV/BxGtlAtSIAY9kuz/rtgs8v8QzXvq6CYDYewiml4BdkPKQ==
X-Received: by 2002:a92:db47:0:b0:303:30a9:326a with SMTP id
 w7-20020a92db47000000b0030330a9326amr41925072ilq.7.1673242854572; 
 Sun, 08 Jan 2023 21:40:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a12-20020a92d10c000000b002eb3b43cd63sm2470464ilb.18.2023.01.08.21.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:40:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:40:53 -0700
Message-Id: <20230109054053.2704727-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lL1wfxxxt7vuvZ4mpZJ25Cr4SXMOp32h2xuaozDZY9M=;
 b=cz+QpvVqbKWcH5ZIQzBcZD8QN8Y6H+w57qQGNOquhj73Tv3Jm/GZKIdUWiYcixd7BM
 x8GyBKajvy7UqXyyXcs/Tf2rAzZdWKKEuLXEJtF1oIxaKJk+ubCeqbQyhprtRayypGVR
 JP1FmQWHn62/9VllXyK9YftXXEaClq2qqJ7l6U7u/PuF+au3A7lcodoLJcPU72deFfk5
 3i2jP456YgAxWDVtsjQdn0MtIJBrp9w+aoWTfLaYRLV0Qze4NTd8BQejdwpp39hnX3fU
 BpHx5LyT8PcuXQUUnMFTLdLxaH6xR6/rd64rThZnxu3eZipCxtjNrID1Pm1eNEE6x2dy
 hcHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cz+QpvVq
Subject: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.20.3
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index b683c60553..051670aa51 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  894109d45a7b6f46718bbe4611aa7817  pytest-asyncio-0.20.1.tar.gz
-sha256  626699de2a747611f3eeb64168b3575f70439b06c3d0206e6ceaeeb956e65519  pytest-asyncio-0.20.1.tar.gz
+md5  dce438c7b0081d7f580b5a79d7105570  pytest-asyncio-0.20.3.tar.gz
+sha256  83cbf01169ce3e8eb71c6c278ccb0574d1a7a3bb8eaaf5e50e0ad342afb33b36  pytest-asyncio-0.20.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index b70e0ad0f4..c94c9ea876 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.20.1
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.20.3
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/9e/8f/5a918ac4e2366b61156e16fa9bfb3be52401d81f5309efb1f4e04d99ac39
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/6e/06/38b0ca5d53582bb49697626975b5540435ea064762d852b5c66646c729e9
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
