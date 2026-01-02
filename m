Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62987FA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCC482152;
	Fri,  2 Jan 2026 22:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OJyQOmmEv9h; Fri,  2 Jan 2026 22:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F7E8211B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767394107;
	bh=Cgoz5iDqX6XDdZUf46vaFU7sGk8AnlS4fcvi2HT+IYU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NQBaq8XE71IHoAu/yltYiR3MM0KUs33kbpgrXKBXzWig8cBpZ4mZTbOS+DiEE83v1
	 7rCS/nQQMiJgkBIXAK7j+mmphRPT9gIAin83md2Gy2qCGh5SUewgAlSMkzK8Qxk3u9
	 0459+FmGWBLZ+5gaPEv5i4lt2yDIYiIDzBV58I/Yi62z1ZxC/IQmAZGRdaawAerD4/
	 x6aNFGS8dkz+49McehsuHj06KC9cMAwT63ikFsTiKwpUYQu7e1TmaGkCR+ASh654LG
	 LaQdNrUUSbtLBm1j75eDkVfXkSlw+hUrMVxqeLyp1fRQxz3tJ3C5JH+xRT0BWqpF5P
	 YFF3fyIBr1cUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F7E8211B;
	Fri,  2 Jan 2026 22:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F268249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA78C401F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG2-ntS4lPJi for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 125C640072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 125C640072
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 125C640072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:48:24 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3f584ab62c6so5241252fac.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767394104; x=1767998904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uSENq/0bk39xUFa4I9JltAin8eu+Kd1g6gysQDsKu94=;
 b=aloO67CZ94D2uFfydlMAmS55q1VT5u67IxoOd1wu29nQ7Ik6n6p1Og45hh+pZGozze
 ji12TOysk71IN8wgPjONxBJ37OTDBm1AdW2o/Ec7qUdY0x/yOHwKT/xi51Z25qDN2Ewf
 wYqXxDp9FRSkj6VtTlkCn2DTkukeqMeYMV6j0IltaCE3+4YDN8NIVyO1rnAzbV3M1gTk
 D8bOFYhSqjfKC9iGoFWEpsjCwKDzXHrd8yiO+kEVGknbxs/DRxr4KkeRREvU2k53NYEd
 qHf3pt18asJtyZimUJEBXdUK1/g3Ni99SLkM4IW8Hprubs+58aNhcvgg1k3cpqHsCBjQ
 pFXQ==
X-Gm-Message-State: AOJu0Yw6aX6giFyXh+ir45R0iDWO/xAXNd/CZfmI6vqNJJf15exX1ll2
 VtPFcs6d7oZpujUJaTMeKpwh54K9q6YFd1b27ZEawWOOdYI3K4TG6qKbZZANUhZcBxs=
X-Gm-Gg: AY/fxX51DoruLUOsSAd9bJwtnQA2AAAieW+n2XbBCTuZ4IfoUF5PTiZersmTQ8KqZ8o
 Lce5tWGmCqY+qL/MZv5axcQgVykNIKVZARaCuIVlf/NLs+yvBOHmUWmz/O5vRLCi9gTSdBUVPZg
 hape49HNpCgc3y0amaV2kqyXWs4Qj8IzLQA/Y3zfb0T8eQpuSQ8NbBHRkbro1jZLfa8mUhh9E8d
 z1oX9u4UhajLWLd0SMmBfzKfW+L5cdQPe90YLhvv7Ws/RgE+Z+91MUz2emjXt8kquUlW4K4szyw
 qZUtWH5DT/UhIGdzKdSDIzGRQYPMJhgazn43vg4sNLBaNh3649HZjEjIX9mI27oGbGzLlrtCVuO
 Rv/4moZmMlWOeNcrdN2QPuidCCgXUCxav79q2ULdpl1JnEG+mfVpumF3srBQftqm8g0NaBSfEAY
 +7U1mTFPkGhdiJhwAjm6pttEB42/RlofJGql7MxY5PXMb4MhM/zlPg5EBtleNew7rQTvaQF5ooL
 oeilKOffD1gXfAzv+rHGnXFvgrMintT3emCL5lW4/iydYULPy1nup7vwQKS2oya4g==
X-Google-Smtp-Source: AGHT+IH26qqIpCrHqb1HTwP3xpwipN1dEoGAaFRlh7CfZ7b/iKUmt6+q389xhj10vHNFdcwjHtioSQ==
X-Received: by 2002:a05:6871:2e8b:b0:3e8:3382:aaed with SMTP id
 586e51a60fabf-3fda55f8a9bmr19275619fac.12.1767394103674; 
 Fri, 02 Jan 2026 14:48:23 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa93138csm24739503fac.7.2026.01.02.14.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:48:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:48:20 -0700
Message-ID: <20260102224820.504515-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767394104; x=1767998904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSENq/0bk39xUFa4I9JltAin8eu+Kd1g6gysQDsKu94=;
 b=Xpn2kDaNjWeVAU7QktXca50p8saLvlfjIxYdbPzanCypOQzm4Gz1PtdUimMsdq2iIk
 VctADgQxPR8rxF8QMo0ClWYt8AmuIlqUr0xZAQhFaTn1DDmhi6MS9qpCAv7TGwPUoqOs
 vt95Xknc9uxIMmx3Uwa0MChWHeXvQeHcBq+5m30RCsXhDLS7wwDPDyPpEnRKCADkB+ob
 uuiAQjEBhfHK7+krh38bYvXQ0P4cxY9tRKcB7mq2jYsqESPgVFlTILKOLBVix/KKhS79
 HmYFEYuq0XqzMbZBQ3dQZNhNrhUNxZwPz7pbOEQxyFhqpaFafFZB/6oV1auscjDBLInc
 OP1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xpn2kDaN
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-collections: bump to
 version 5.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.collections/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.collections/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jaraco-collections.hash                        | 6 +++---
 .../python-jaraco-collections.mk                          | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
index d3d6742f0b..2ee4ba439f 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.hash
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
-md5  33a136eb3dd4c36090270ea2d4d43e7c  jaraco_collections-5.1.0.tar.gz
-sha256  0e4829409d39ad18a40aa6754fee2767f4d9730c4ba66dc9df89f1d2756994c2  jaraco_collections-5.1.0.tar.gz
+md5  57529f8464fb77efaf0398c4395dfca9  jaraco_collections-5.2.1.tar.gz
+sha256  dab81970bad6f0ab53b20745f1b01da37926e4c0fcd425046aa45e0d8efa18ed  jaraco_collections-5.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
index 3414799f44..fe6dcea074 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.mk
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_COLLECTIONS_VERSION = 5.1.0
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.2.1
 PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco_collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
-PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/8c/ed/3f0ef2bcf765b5a3d58ecad8d825874a3af1e792fa89f89ad79f090a4ccc
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/fa/d2/751000cf702676dbb78f97728f4d52b029e817e2b3c94088dfe5c70ff46d
 PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
 PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
 PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
-PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
