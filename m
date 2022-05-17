Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2679AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB99041A5B;
	Tue, 17 May 2022 20:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRaq98ro8c5A; Tue, 17 May 2022 20:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A059A4196C;
	Tue, 17 May 2022 20:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC3C1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ABAD400D6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3poMVw2TcOS for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 536D0400D0
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:15:53 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z139so8933iof.8
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lphi9CRXVzRXdB4qRQb0dIxFHhPgQfoPd75yGdVugkY=;
 b=B5ieUIcF20c1yBKX0tTX3Khati6bdY9XU+MBQ0NCukqKBQrIvpFgMXKsLZNPF22A8L
 bpgV1vZff9NriJUhmYpyLi5gCXVC1D+yPOSLV6Xa21EhuqI6NBleVxdKITZbYxEW4CvA
 CESBi0RSomIL2MuOXO085Elr0lDe/GEaqdYbbppEDzHZqawrW8LnzdqOzgo5T8r6e0Ld
 PF0pjhTm/bAChe0HSIstlRhTbzpJeKY2fs2+xthAl74KhALC/jUS4NH6fFcLsWXL3qNC
 il8+XkzG7mQE0dII0Hi3es6H5+5tuSf2/6t29H6sealKQ1nWHQPO7i6qqobzsQG8xD5x
 EtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lphi9CRXVzRXdB4qRQb0dIxFHhPgQfoPd75yGdVugkY=;
 b=YPt4oR2JuzuxswHU1hhirvn34gD4VVKB3tWcOgYxsTyygESMbbayqvZsxUakfpNGsI
 FN2QkEbD4K0ekMkaIW1pbQBeWy6rD+UI4Yc9iDW3aTapQrwN+wnXDbg9LDpQV9pT6e/c
 Fmynm4m92kN4ooc2ixsoD0jIB9PHMlcxPZsB3m0O13AIjbm1YutjPGXt2/sBNMPig6eA
 nHVjcXNjKjLlnfv7DcgtFvTd8Ky8DyN8XVjDirG/r0gYYCqZUguRX8UsnXidSnawxm+U
 RPKCnTyKbNujCCjL34pqTBGWEkrfsFVe2o4AhLOWe8/1KjMYC37pD4OdNQkWchtolg3g
 FiRA==
X-Gm-Message-State: AOAM532LHOZ6pjock/Yg91+vVufbvgXnlJ4DWob6G6LuTPcHgbynrXm6
 mLlqcm+IW5J13bOXOiztACcDkq/KreY=
X-Google-Smtp-Source: ABdhPJzzf4aTnnjJdSF3vyGrf4EY+zxE9R0qm4Q0RgT+hWsaCvILk4WKdZaTzcnUPqxwoFCE/rQJAA==
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr10952872iom.209.1652818552276; 
 Tue, 17 May 2022 13:15:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 70-20020a020a49000000b0032e1a07228asm21312jaw.26.2022.05.17.13.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:15:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:15:50 -0600
Message-Id: <20220517201550.1519884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to
 version 2.1.2
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
 package/python-itsdangerous/python-itsdangerous.hash | 4 ++--
 package/python-itsdangerous/python-itsdangerous.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index dad4ec0800..071544e5bd 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
-md5  996b9763d1b4bd0edd6eb86f0a490629  itsdangerous-2.0.1.tar.gz
-sha256  9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0  itsdangerous-2.0.1.tar.gz
+md5  c1bc730ddf53b8374eaa823f24eb6438  itsdangerous-2.1.2.tar.gz
+sha256  5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a  itsdangerous-2.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index c53bc6b9ba..d7a1344e0a 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 2.0.1
+PYTHON_ITSDANGEROUS_VERSION = 2.1.2
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/58/66/d6c5859dcac92b442626427a8c7a42322068c5cd5d4a463ce78b93f730b7
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/7f/a1/d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
 PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
