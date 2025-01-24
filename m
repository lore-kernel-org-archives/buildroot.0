Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF61C0218C
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F4D605F0;
	Fri, 24 Jan 2025 21:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d233XJdNALRP; Fri, 24 Jan 2025 21:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9917360895
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9917360895;
	Fri, 24 Jan 2025 21:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8B2941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 300D882062
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIR-XZEcfDd2 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B7BA82060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B7BA82060
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B7BA82060
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:01:46 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844cd85f5ebso172080039f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752506; x=1738357306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GC+YRui0Y0ZDId9aD5oGziC0daXxzWx+TBeHt0Gh83g=;
 b=V36ckAgAVCSClIvYhEqru5xWpHBS7ztMTYjE7+YJd+djuNed5rRgjJj0zVh8lpzF06
 h6ekj1yn0iwjld08ncY8O/OgMTOr3/w6sn8SIB0jbprWeyNfJKC5BWtW/SXIEPsIu+hq
 RD1qtHULQKb7C8ngaQhszDu3MsK352oiBVnJw8ZmLAKbUknYaBFkC6utT0l+0bGNm5Gi
 MLwG3mIXp9bK+mcEnD19MIXG8BKgjabdmiEhgzYhkv2fIi7HRTemUvkhCAL9B+Il/h0o
 xaqFPdPB7W6HqrRXVXaknbVFP1OaP05ColUjhlGYgm7QDamt1+sMN7hG1earse/1cSNj
 wD+w==
X-Gm-Message-State: AOJu0YyZXWRofb21msLLj6BNm+mh0Iys/b8CzRuT2o+vihXAcledWVl/
 xJuBLChmgPzZ8LcTk5Tssb8bJYbsS5YmIt5rGNIBQtjuwz+1S1eXQNVFPmE9
X-Gm-Gg: ASbGncsfJ3bb6YhntG2TxPVO26K3XYhr3e12nmmo1PSHD052PozmZbYcOAglwNoN4pZ
 siVx3MRISQQWLmCanGZ9o4Xj/uhIDrKD6oYAa+sdcTFdBU+Y8pAodMxYb6vCRXlhoi5C7alU7OQ
 LDJKYCPuAj3E3Yxt9ifsu48xWsLRmic4I4WHYtTVlW0/N960FYaytFMnoQkWX4XOabyPx/ZkvPN
 oHt2fxzUOMKlvVi3mr5YkO2w7woRwgRAWOlSNeCm9PjI7AruiiFtVjS5r5wCx1RDdw0RB1Ke9iW
 bb2Qh2QQo/4tacdnxoNuZtZdUf/6H1hQ5r/cveledVi3xwCGZZID6ZU=
X-Google-Smtp-Source: AGHT+IEF3uVebB6w2fc0i1+yh+mRBLX//jyqzCRjan4+oSdQIN8R7eAD0O71+IO9ukjWyqFt1vzNSQ==
X-Received: by 2002:a05:6602:3426:b0:841:950b:386d with SMTP id
 ca18e2360f4ac-851b61a0167mr3196893539f.3.1737752505865; 
 Fri, 24 Jan 2025 13:01:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db6c410sm846674173.84.2025.01.24.13.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:01:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:01:43 -0700
Message-Id: <20250124210143.3863843-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737752506; x=1738357306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GC+YRui0Y0ZDId9aD5oGziC0daXxzWx+TBeHt0Gh83g=;
 b=hQbOXJwxTI2lHDt975DniDP9zJOEU8jYTjZhDWtiZCKks0uILO/3aCarrRpjIWf/jl
 vactrVS3KR8QsPPqqSWDM3vA9LVEyRO6iLJSP0Tkr5vWg3EmsnoDqWi3mKAdxcASVyIt
 wSI5oKizsAhoNSaqnFbdjYF3k52P75JIQ0QsFq/JtQ6+kOF/A+KT6SYttMUQEHm3VilP
 DKFmyOtiL3CisB3j6bpv7DmQLiaCyd4lZCzNeJITc0BrL3k3LRTcOtHvGgxXytVhkaCZ
 GBj84UJGZ2G/I5s4MoVdLhdxo3+rsEc6sXbDbXWzvycA9vor2v1/MwumrCzhB4YIi/Rj
 NOFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hQbOXJwx
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.24.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 649e268cb5..93a4fab7d9 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  455b03a55fd090b65ebaa497c770be09  tortoise_orm-0.23.0.tar.gz
-sha256  f25d431ef4fb521a84edad582f4b9c53dccc5abf6cfbc6f228cbece5a13952fa  tortoise_orm-0.23.0.tar.gz
+md5  1f35e292f86c5f0bcc717d5c6ef41f49  tortoise_orm-0.24.0.tar.gz
+sha256  ae0704a93ea27931724fc899e57268c8081afce3b32b110b00037ec206553e7d  tortoise_orm-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index e5970bdb41..ae51fd4947 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.23.0
+PYTHON_TORTOISE_ORM_VERSION = 0.24.0
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1b/6e/c23d788524750d84c75864eac0176f57c07a5316b36cc467d2914a109bef
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/64/81/973b629f8a70fc928343f4f8be6121023b6c6f0ee0ae45695955db82af47
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
