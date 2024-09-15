Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D6C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660FA405CC;
	Sun, 15 Sep 2024 06:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtXx5BHHuFoZ; Sun, 15 Sep 2024 06:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0CC40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0CC40640;
	Sun, 15 Sep 2024 06:31:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30241BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02B684109
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjA08rog2lL7 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:31:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA23A84107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA23A84107
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA23A84107
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:31:03 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so204973339f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726381862; x=1726986662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hhrOvqykMBvj+u+ngjvALu+tl00MmoNXGG0+DDXwSH4=;
 b=aqOvEKXgxHbMl5kUwjVKMmPN07QJZl9qmf8CPF74LaG6EOL+Vqt4vU/0s+UA1Svdt0
 3/EyMAoyGbC2SDvHWcIzDGs0crj8LESHRHGoxP9YeUoLhKNKuhs9E9/8FR5i+UhNCmp1
 8txk8dG0dkqwNWxZri0BqzeZG918glSeuGbyJuMQkl0wC/tLki51O5OLNbpQznF1mrNh
 uw2BFVQClx0yFueR6uu7XUc/n6JfeLNw6BJPIqPpkMZm/uyYYKaQ9trcYCS/tCvZObEx
 vI1O8PiSNBbgx+Csio/TgcGSVWw0G+9EDEbBFTlFpGr5rkmxjBLFuchCw70x8Gffjb90
 SP3w==
X-Gm-Message-State: AOJu0Yzu7ajfj9+T97su/6m+FjQvNKTf7bF+B/rXm8WjwjcHU2vIW0zH
 7/eUwey71LvVjaBvgUstIt0rI7RkrLu6NQI3XIakrClPXEGuQKPLrWCxzQ==
X-Google-Smtp-Source: AGHT+IHn/DYq59m8Z4IB7COYf5JfVxF7+1455LLwjf2Hk4d7RGN0E5FgmwGeJmBsDyBQR2SakuFSqQ==
X-Received: by 2002:a05:6602:6b87:b0:82c:f9f0:ff5d with SMTP id
 ca18e2360f4ac-82d1f95e1cbmr1215195139f.12.1726381862501; 
 Sat, 14 Sep 2024 23:31:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4ba4sm784723173.35.2024.09.14.23.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:31:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:31:00 -0600
Message-Id: <20240915063100.1520238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726381862; x=1726986662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hhrOvqykMBvj+u+ngjvALu+tl00MmoNXGG0+DDXwSH4=;
 b=gGcLF+TcPxGXDHisnAx3bbM4bDMkHbb1ACgVkcCeNx5//2ZIH7V8LSqCeACrT1OPDY
 T20QF3N11W6S/FqKZ7I6YMhqBJME0f9aFEfeZ9Eogy0AGQi01O+L8egu/reBPYdB6kxv
 mePxTYq1ObFr+sTLdBJW/IUVSFNM/W9yQVG2AmtB0iJC5/UAJrAB4PU1nvxSEOKI9qGl
 Rg7RhkXmvZNewGNIb678QO397kCKYk/0gskmyDb5suk7uXyOvD7ZEWbbap+3SzGq/3V+
 zxSRyDFVU78oBzHvgFal+Es0yx6v5ULe/TTWtk7d+T4LOUMoCLnTD995N4J3Mk12qNwf
 9LGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gGcLF+Tc
Subject: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.44.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index b468c48fd8..70349bebff 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  b10a7a0bdee4505dec3cc7652560bc9e  flask-smorest-0.42.3.tar.gz
-sha256  736ef072bd5522de750a5a9d9f1bfb6d750d05c66e1b3702bc7a20e4277af9bf  flask-smorest-0.42.3.tar.gz
+md5  33ffe61fd1e4661503b3ae10fbbe3a78  flask-smorest-0.44.0.tar.gz
+sha256  13f6e39d807c8847a56dc40656c2bbc0a2b2a430d8a4bb4a21836046757f7cef  flask-smorest-0.44.0.tar.gz
 # Locally computed sha256 checksums
 sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 6eb1abc6fa..bd4114880a 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.42.3
+PYTHON_FLASK_SMOREST_VERSION = 0.44.0
 PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/25/91/da55ec1288e821069ab61b6db4acfa171fa268c426523bb4f3a8a91210db
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/e7/4f/901bf249e7e19cdfd496247379f58c4ef2f1136c3df0bb542ca0d26a88bd
 PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
