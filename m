Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97818CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F2480F15;
	Sun, 22 Sep 2024 07:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5V1AsPb3hQ7N; Sun, 22 Sep 2024 07:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAFF80F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAFF80F51;
	Sun, 22 Sep 2024 07:30:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6501BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B1D740288
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUjSALJjB-O4 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3868840159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3868840159
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3868840159
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:30:26 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a08dbc6019so15242145ab.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726990225; x=1727595025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NV97DKzeGGQYRrbfyB5qwfIBAdeqwcQ9g05+yTl4QtI=;
 b=K1xnK+garZyK4XETPQj6O/5Y/TDR8GlihpSzsbYQXkcBE7Ulg6a5EQcU+McJX2uWm1
 tnGe28fOorF/mXx7tjzc0am39FNBVFOceYrWr4kxBgX1o0Lkswodt+5djQDyJRAGsmVh
 Kb3hA9o/UAS1VpmZXFh+dHuKnLWqziTOfwoSsOVv9IQi1cpd6nk0T1UuuSvKAddi6qQ/
 h33vekMHc6K9waTQm+eykpHhTer5pU5RZWrv+7+TFYZ1L39OqoKAkWJUJ892hennri8y
 PhHKCsRVBDa4EwxrFOsaJ6Gy9bgCsdSVwoDR3bTC/AawjuZlWc1qYdHE2NSSfv47MZZ4
 Daig==
X-Gm-Message-State: AOJu0Yxm/QKYpSOppnKhRZ2qbuCDG0AD2j7BFaPCbwozxkDnDWnrjZnI
 y6gnSV8CATQ4jLWK/fOYgYQZji0NnTz6ZRvOeVveABapIHAP8PdACyvzxw==
X-Google-Smtp-Source: AGHT+IFjJZm/rK4u/BkZ7k3g9biHVdJXLRu0uedt/97UYL9flixBx+qXaizce7w6ssVUX7FFkpdx1g==
X-Received: by 2002:a05:6e02:180f:b0:3a0:8f20:36f2 with SMTP id
 e9e14a558f8ab-3a0c9d6f1bdmr69076165ab.20.1726990224818; 
 Sun, 22 Sep 2024 00:30:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0c90e4198sm18158795ab.76.2024.09.22.00.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:30:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:30:23 -0600
Message-Id: <20240922073023.999173-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726990225; x=1727595025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NV97DKzeGGQYRrbfyB5qwfIBAdeqwcQ9g05+yTl4QtI=;
 b=GSsQrtwooJqHVy5b28UFy/cFOEJtsndTTQxqDmIaz4CL+aTFiQn4VIU0jBY5ZsEvsx
 Lj3BL01eyJbF9Y7XOgBYcN2ITg2Rdbw9Fc5FzSM+Owx+9WtH+v8ksh4cxDkwLFJCuAth
 5rg2crm9i97e5iyYesuQkCHiqdLS2eYAt+FXmsaHYNDM35b0/M9SKNWAFrGaCjRGhNev
 /3hSVaUGscB+QNFT6SaPOb8mRoGbxx7dtxJgZsBRpv3Puq5G2UNTD5QJj8Vn1xHLoXwj
 E1VUVXv6Ya2nCdlgxIaNJrLRSOfEv9yvxLQUQV2CzQcp9xAiJ87T7pTyJ3Q5O4THNg5S
 etmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GSsQrtwo
Subject: [Buildroot] [PATCH 1/1] package/python-zlmdb: bump to version 23.1.1
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
 package/python-zlmdb/python-zlmdb.hash | 4 ++--
 package/python-zlmdb/python-zlmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index 1ae5d72efa..ed1b6db8c2 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  1e217f3228cb4c2303f06461b79e593e  zlmdb-22.6.1.tar.gz
-sha256  aff353121c2eed3c18e53c82358c41932a21bf882995ee3a79c6eb1ae4c95397  zlmdb-22.6.1.tar.gz
+md5  4d96b46d1724b9d4cb6961874e5b4a9a  zlmdb-23.1.1.tar.gz
+sha256  ddcf680bf49352cabe35bfb5bfe3acbd5d6b8d481cafa508c423e0b18d654d05  zlmdb-23.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index d20ac9e016..70538ce63c 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 22.6.1
+PYTHON_ZLMDB_VERSION = 23.1.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/97/15/992e61a18cb64b573814c9d92676b22d522f2cc2ea79ff78b834bd392b80
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/56/b2/abaeb5419435a6224a0beb2b5edad621ec975fe4802297963ecf1728b883
 PYTHON_ZLMDB_SETUP_TYPE = setuptools
 PYTHON_ZLMDB_LICENSE = MIT
 PYTHON_ZLMDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
