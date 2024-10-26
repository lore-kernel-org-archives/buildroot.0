Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3967D10BED
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91A54402F3;
	Sat, 26 Oct 2024 22:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGIMzmPXwDaU; Sat, 26 Oct 2024 22:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A46A4032E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A46A4032E;
	Sat, 26 Oct 2024 22:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B135C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C1640175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkwuixZg2xe0 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 760E84010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760E84010F
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 760E84010F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:57:39 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83a9cd37a11so127198139f.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729983458; x=1730588258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nrzc0F2aCR69CL9pU0WCIIvMT+p2J1sRR93bzP0K13Q=;
 b=lo/jmTJN8pL0/kMjGfOigrPIP2pWRDO67jutHxIrJTEJ97odR+86GFAvaL/kqWZrGI
 JCht4pbWMXiDTy3qdzqUdvfa5r1T10EADJDV6gp9rS3ctONoY6lL66o/0eOV/XvN9HYb
 EGIZzVXDrMX4JGZUTE586I2bGrkwYGX/bi4Lenm5sNFwIhwjhLg4QEzjC1rP1c4EBU7U
 TS9rxRVUO9NGQ+bvXE9jtK+MpoFTszekiZ8UmDvy+QdOC7wxEGosQKGK/BnEh+oyiIJg
 k2PRZ7ZoQDxJmNyjyqxAcwqNJ5b7+iyPQnr6hymzSKPzVhnGcShrHv6wp0vEZL6GXvEf
 /baw==
X-Gm-Message-State: AOJu0YwnvQ9DrG7foJ9UdKX8FnRznuXhHexok+8nQcqfZGWhUB2ilQYX
 X3AUCQNrf9edrKB/llIligicHDv33YygmtDLv/tzdwfbKbicY777y0MsBw==
X-Google-Smtp-Source: AGHT+IFbpMQer7NzGwH3PQdDjwFPoKeRPwKKNJIEMJWys9PkHhPGmc48DNIaSh5PUgDYW1Ph5DMRxQ==
X-Received: by 2002:a05:6602:1603:b0:83a:f443:875 with SMTP id
 ca18e2360f4ac-83b1c5cd7bdmr215714939f.15.1729983458102; 
 Sat, 26 Oct 2024 15:57:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137de6e4sm79809639f.21.2024.10.26.15.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:57:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:57:36 -0600
Message-Id: <20241026225736.3852326-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729983458; x=1730588258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nrzc0F2aCR69CL9pU0WCIIvMT+p2J1sRR93bzP0K13Q=;
 b=ZVXOn7s09M90TIvL4RJQwAF4fsATFcsc4uMV+LePWqJyYl5dehQ+NVuYS/BIUYI+lz
 YT/DQxUpjQgI+Nox0ks8vrYx8PSgK0mhqr4jnTpU9zYPL65zpNLq2SIocxYRoeAwQvQm
 yl1Apo7Hl8Dt6AIKdMYvDEv3HgKFKTMEQ8/9m288OVpFgc66zPuKdu4ZmkKv5Aq9ssx9
 sxVLTQRhsn+x8mayxhHzco3ZmE+caaRsai0SkJXl89MO/mGiznapaxGw9Je3ni745L+1
 3n51gdvatklS6rqPIFE7BWfQw95X6+pZ6EcFl9qQetrWAQgcD+3QoSFtofKdWo5KUV/P
 R5Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZVXOn7s0
Subject: [Buildroot] [PATCH 1/1] package/python-pyftpdlib: bump to version
 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 32f662ff91..a463e98d7f 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  36d7328c7dde493816bc3677b3c71287  pyftpdlib-2.0.0.tar.gz
-sha256  1aded131fc7d41b0fa734c7879a96a6251366b141e8886782bcb1de616ffc791  pyftpdlib-2.0.0.tar.gz
+md5  16bbc0f0e06964a7da16e88de5f38e20  pyftpdlib-2.0.1.tar.gz
+sha256  ef0d172a82bfae10e2dec222e87533514609d41bf4b0fd0f07e29d4380fb96bf  pyftpdlib-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 55de21f8f6..85be95da57 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 2.0.0
+PYTHON_PYFTPDLIB_VERSION = 2.0.1
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/f1/69/a524dcb5a9be722273a74d71c509f3d875238c54fd7426fab6fd05ca8521
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/b4/0c/32bf0a7c88efe147bc3bc6586216d92269d196c59f149b05efa973834946
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
