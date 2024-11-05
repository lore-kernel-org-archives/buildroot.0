Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20219D36102
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50DA80C5C;
	Tue,  5 Nov 2024 18:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Co4XzSVuupF; Tue,  5 Nov 2024 18:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0D380F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0D380F34;
	Tue,  5 Nov 2024 18:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC7043B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D99BA60837
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_sd9UMT966S for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFEFE60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFEFE60612
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFEFE60612
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:58:58 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f39so3553739f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730833138; x=1731437938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oqs7jpJ5d2Aurj9gRUYmmbv3FlTbaq0UTEQJcLAWSgU=;
 b=KmOirfHE3fL2NgqBtyBDAiZM72X5a/qdVC/fFCmOfu9KftbWHKuhp+fZwDAlw25i7k
 m2oVWMn/Z7Qzz9Z64+++ssVJ7KI6lM65Q+9ajTFnWkvP4ZbrcJ1DZNFLoo3t8KCoPc76
 bvKb1jKUPqY3TkmTjyJHTEmXyOOHlAWghTYYtzQJzWT+lee2uAgwSx2+t42QUVKDewah
 0oHpwtVbx/wC/jJN8oC+EXHIgr4VydLDEhYFUY52LzdqdhK9LKlxaskV0jK9d8RzgC6V
 V4gTgo6ioJSfZNhO0gVgVUCoBFIkpccPmUV+GAEDpcZcq+3FdaEprybXRA/wJbmpVs7+
 jIgA==
X-Gm-Message-State: AOJu0YxoECHvGvPBFWjjCiQGzoFEBeOVsKaJtPgTexEqLob+mJzrNtdk
 GO3XplI11dhysxZ/PPAYeOcMLeZmgoh2opE0k669f7+km8CWjw3jgyyvQQ==
X-Google-Smtp-Source: AGHT+IEULYOhQkzyo+n/uMcCW1cSTGDiFsBwKAxVNSIY7OAFyKqDN3sQ7hlJdDdcEQKYq+qAKXpc3A==
X-Received: by 2002:a6b:e70b:0:b0:83a:943d:a280 with SMTP id
 ca18e2360f4ac-83b7123c534mr1426212439f.1.1730833137801; 
 Tue, 05 Nov 2024 10:58:57 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bfebesm2525998173.55.2024.11.05.10.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:58:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:58:56 -0700
Message-Id: <20241105185856.1549593-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730833138; x=1731437938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oqs7jpJ5d2Aurj9gRUYmmbv3FlTbaq0UTEQJcLAWSgU=;
 b=iecg2UiyMPhtZpFF5Q5/jYOInsgNTbevmevUnQqwQWu5//oGyM1/ds9MU3pOs6sE+y
 Z3td+VnFCvUgb3GnAjTbFZE+P7KRmA8f6LImMx+/nms80hg0+QXS/kvEh5qNtNW75dQU
 owk04OgcaMK5x8saPSQJuKloG/nN8J2HUPVBzcIYyd+qzep0qW3D0Iv8k7HzjnWUEP0A
 TfE0MXVdGYgzbWYSv1bEnY4wNjgkzWxd3aVsPRl6VniEe6VlzV0nYQYPAF1U0RAFPKi6
 u4WYaiAX3Mw8f9vAGxAyb2CkBKBPT1JfsvR5YPnS5Ap1z6iTSMhXmQCmnV98e2ITitAe
 buKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iecg2Uiy
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index b48eec080d..ddea73f629 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  48e12af76f92259e429af9d830bb222d1262e8cddedc07aa5208b589b314fae9  python-orjson-3.10.10-cargo2.tar.gz
+sha256  144d268da63c96d800f5aa0c0901cf09c9337a6dc5372a4539415d2cf7f45b2d  python-orjson-3.10.11-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 60e6078132..85ad6c3248 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.10
+PYTHON_ORJSON_VERSION = 3.10.11
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/80/44/d36e86b33fc84f224b5f2cdf525adf3b8f9f475753e721c402b1ddef731e
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/db/3a/10320029954badc7eaa338a15ee279043436f396e965dafc169610e4933f
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
