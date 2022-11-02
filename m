Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CA1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B928177C;
	Wed,  2 Nov 2022 20:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B928177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IVjoi89mGmv; Wed,  2 Nov 2022 20:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C31817AA;
	Wed,  2 Nov 2022 20:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C31817AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0B21BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F7160ABF
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F7160ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RTot7BVJiAu for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:34:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFB1860A9E
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFB1860A9E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:34:05 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id 7so35040ilg.11
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRhOIQpWKnW0oCNixpeiq7n7hmka2FcCEkxfdegmMlY=;
 b=ByKVAK/ZrgyGO2nhUv73csMm4+XeuoC0Mnryjucd3DuwujC7J5KhrKX+KchfYhG3f6
 U67ICgqpSm0kIaKpuaS4Vvigh/tCzC7lOMKyDFWk+k0vEUGsokR190plkdOd/ZZrDx3t
 XIdZumCHb4J5PtogV5vckJryeSEjZp7gSDz7MJf1yOQgqLh1X6Kv+wlBhtKCWx/tNprS
 1s4JFTFIURa7xHyabk0NcPfQKpZHw0xP8IqUL6baokwJbwo63tyT2MufDQ5HAmzEDzqh
 f2BqruoySxnfNzssXb52EUtb2eqfP4Q72TOb5KeCYC8itqM3S14qliITSYkxTQ7L05oV
 Ljzw==
X-Gm-Message-State: ACrzQf2HiExJvn6eaKhKjlOKYs8V2nXkCShYJvSisq/yeVO7V7QdZee5
 tWqFvjFo3zRkFBxkp2hANAm9vqBrBP32jg==
X-Google-Smtp-Source: AMsMyM5j07WE1MgdAf7DC7aFHMBLWkAANMXDe4DCVRAo69MW1p3P4lziHhHUEQjzEecBlUyKZUfhLw==
X-Received: by 2002:a05:6e02:178d:b0:2ff:cbc4:ea46 with SMTP id
 y13-20020a056e02178d00b002ffcbc4ea46mr14752257ilu.157.1667421244718; 
 Wed, 02 Nov 2022 13:34:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05663810d000b00363d6918540sm5112986jad.171.2022.11.02.13.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:34:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:34:02 -0600
Message-Id: <20221102203402.3609657-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PRhOIQpWKnW0oCNixpeiq7n7hmka2FcCEkxfdegmMlY=;
 b=UQlrsMrFllC6OwFhQ2kv3BKipfHFR8OwH7atT7lBfFohT8Lq//QFecWF+jK9u0mp+f
 i+MOKskxmbLqDgjFTWxMrF/UGkAPrcEK1QTIZbCtptHeeyOBOyg4PZPAnhGLG/NXWqWl
 JRpkQvObUrf1zjwpIID7nyHvsUksrjWLx2DeTfcjjo5b5OwEdwx70XfhjM7k/Wvsbpn7
 oxYA9r2Dg6zh97Eh83lCuSXjDxxBEAlV3z6Ga1eitquFaDMXoDBIwfMNIZNVXZ7kdtdJ
 x1b+03RMSwC1OsZJAH3dxV9kbWuzrMKDXKF2VJrgCZgewy7PyHcnxho/OvIK+n13B4gg
 JKbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UQlrsMrF
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version 2.2.2
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 5f19a450a1..9b6391750a 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
-sha256  315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477  Flask-2.1.2.tar.gz
+md5  c0d2276cb7d59a06d62c915da9c77ba6  Flask-2.2.2.tar.gz
+sha256  642c450d19c4ad482f96729bd2a8f6d32554aa1e231f4f6b4e7e5264b16cca2b  Flask-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
 sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index b684aff480..1b1ffdf034 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 2.1.2
+PYTHON_FLASK_VERSION = 2.2.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/69/b6/53cfa30eed5aa7343daff36622843688ba8c6fe9829bb2b92e193ab1163f
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
