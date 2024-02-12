Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDB3C4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6631584111;
	Mon, 12 Feb 2024 00:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IC9wWAF0wOYB; Mon, 12 Feb 2024 00:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C28284146
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C28284146;
	Mon, 12 Feb 2024 00:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8111BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874C740189
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZexS003JD_XI for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B8D940106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B8D940106
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B8D940106
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:41:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7c029beb8efso55502239f.0
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707698470; x=1708303270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=auvX4MQ7mXnEAIkgteH4vJXK5d5qDmN9mejVaU08Kpc=;
 b=oov2sdRoWW0E/Q/N+976F8wNoaM7MPtp4IRsORrMaB1F6a8aAg/A5WDfHiBPC927Ee
 RvyNWlpnUs42Gl/aBFuoEz0qn4qlzRxrPpVT1nr9Uuu3X1UNbi+Y2P2Shu0iaQopKOrG
 Qqssmo5kGPSgfqLTh2hSP17EPUkXLjTqAXzmuC70vStFcYjdWqYnG70jAFuS4rZ5/+46
 RufvuTISiv0qTHnfCnEYwrExuFcT2v5/96ydJLB9TTY1N6JC5Cr6Er8QS1SEq/gaWzO4
 LlxM8u3GYV/2l69sPayX+78+ucT0yOtcNTdmUwzu8v3FRXdhiQVXr7zXaMCeTDSxrHVn
 iGpA==
X-Gm-Message-State: AOJu0YygGOx2YIkycI9iejqUbaCxyD2mksk31ZXj/Zii+9Wh7opSLrSg
 9nczDwVUi0G5Bc0C2Gl3XeyjzuAwyyyYz1vjV+lM2TNTRfwcPh5MCdiKCBYenlE=
X-Google-Smtp-Source: AGHT+IG50KE1MoiwC2HgWw44Yua0MBVLfwJPNibXhs7sMRZODQ0VzXt3P5hVdNeSTmTfXV0K4mtbPw==
X-Received: by 2002:a05:6602:2f05:b0:7c0:218b:b832 with SMTP id
 q5-20020a0566022f0500b007c0218bb832mr5990468iow.5.1707698469918; 
 Sun, 11 Feb 2024 16:41:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTS9McJT74DOnBt9U3ZN+1aMdIM61qB7YC0xnYPF52c6pvv6s+gBKKcxJaof79uhBkFbKhvHnIO+av3JdBsES4lc6rIaP+RmnjvRvnKaP+FbmbiNif4LcvorPKYGAK9IOWbitA4XMJ0CR7jW+vpZ5EtH1m1foQleuk9xfsRkiM7jTbrhdC7gKCLzeYEY7XAFZaD3yinXOZZn6BFdle95k9kANmukcNwc+6KjZpZp6wxyP2RQbkSq+TxiY8XFN8yHKO2yzrhy/03lSImRgHimKBqmWb8l/Vw1kMlyZYS6lXeKLAxlcAgsklNxtTY1l6QTO3Pgclj459tId5OG70xA/qJKs=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cs23-20020a056638471700b004715747ede4sm1141084jab.55.2024.02.11.16.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 16:41:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:41:01 -0700
Message-Id: <20240212004101.614670-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212004101.614670-1-james.hilliard1@gmail.com>
References: <20240212004101.614670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707698470; x=1708303270; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=auvX4MQ7mXnEAIkgteH4vJXK5d5qDmN9mejVaU08Kpc=;
 b=HNkmYoMBc9NqJc8qPl0tYn2OjAOAUg8Yq0NobIpx5ZD1jqIUqmtX8poHD/OzVKUm2z
 pRmjt+31YONr06NgbiyD+RAo/SvLMudujo70RIUqMtYq/Acm+kxMDoVesfUbmhIhhVK0
 N9txXQFRDx7GGPZtDz22anihHLWxIw29m+Iu2SNMoFctJujY77S2+q+6xpfKcwzCf6EW
 i78iUL6++A9bPVWfY6B5ntYLgk8u8N5iThqlJSqCR3E+15pkKHbdgNwu3df9cWi2F9x5
 uX2POfuIlBy7x8T/bFvYfJr46utF9HZ2KtA+IBU59jiLyhY5AeXO5xKFq9Yr+9e+wtL7
 x3FQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HNkmYoMB
Subject: [Buildroot] [PATCH v3 5/5] package/python-cython: bump to version
 3.0.8
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested by ensuring all packages with a host-python-cython dependency
build succesfully.

Note that due to namespace conflicts supporting both cython 0.29 and
cython 3.0 variants at the same time would be difficult as both can
not be installed at the same time.

License hash changed due to changing links from http to https:
https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add more details to commit message
---
 package/python-cython/python-cython.hash | 6 +++---
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08ad8f6d84..55e4a6f203 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
-sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
+md5  9f7baaa983e1bd06eaeb4fa0adfc77e5  Cython-3.0.8.tar.gz
+sha256  8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6  Cython-3.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
+sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 47e105c065..d76bfb766d 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.36
+PYTHON_CYTHON_VERSION = 3.0.8
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/68/09/ffb61f29b8e3d207c444032b21328327d753e274ea081bc74e009827cc81
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
