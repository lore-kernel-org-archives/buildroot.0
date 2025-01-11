Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC8EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4404D4075A;
	Sat, 11 Jan 2025 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seDJ4d9pG_KL; Sat, 11 Jan 2025 14:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175CC40749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175CC40749;
	Sat, 11 Jan 2025 14:42:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EB7F940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F312240740
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU-UjA0gs0Tp for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:42:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3AE64073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AE64073F
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3AE64073F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:42:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-84cdb6fba9bso220446339f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736606546; x=1737211346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GiMvUTAYTnvCdKrUiduQGVSF4GeW1ljJ5GJ+or4MhRQ=;
 b=DqM/qC5hh6A/DLbYuf0NPhAAhrd65pZwtJzK2cRwCtoyIH4KdPSBV3KIRVaN3ai8LO
 T3sIUolcChAvxdzjT3nNzZT1VatbIQbDwdi7WGnwl7I3T16xqt5JTQ9LalfSlQUYwRFd
 vxEwKL1FQhySh1OF0YJzG9b/59TtRjHhkXNgKfCl/wgOlkEL0xzZ4TqaMaud8GwGsuFa
 KkIFixarglX25bWEuFisxLyBOlK9Pu5QQTOtspN2AfiFEnvppHQN7nnL0I69C45ichs2
 OJURHhYbcdxd042Da/C3f69jbOTze2D0V464FyoUdhfBRvGwvlZYE3Or1s1bNc05Yi5s
 7hIQ==
X-Gm-Message-State: AOJu0YzQqOXvICoU4oWx+caGYy/3Cw5xEA3cN6o42lxYK98mTBMmnSgH
 40MjOto4iOI81ca5ErAUF/tYkOoXho7g7mK8WQcC59bwRjiqQL0G0J/41HsKEmc=
X-Gm-Gg: ASbGncvFTBctbKOx9Ock2NJDOp47s8LRB9ziJJxOcUM5ImaXZupHIPXAoZInhdVsx6u
 QPqX00HORFSdbZnZ2KCzZkkAZrlsUPjtdL3OrWPJW8uNT9AqXh2jNAznOE+thSf0wlNa/uXy0Pp
 xd4tTs7hnU3CWrnhqfhCZY9oI2Dlv6TZaHGO/IQaLrbFHosaSDy5KYk8L56lghJyEVspHrA08cT
 NbysOJuIQIkjfXpz8QYb7W0JElNehq42RUr3eoWjmQ7z5HZdPC3OdJLPxjOfDURLyRYvR5Gmi+J
 WlEzGboooQE+BhZIOnjqCjl5Z9UykAM=
X-Google-Smtp-Source: AGHT+IG1g74EeM3on2tkOLAvN23u4kXcpuSw9F/ZXXx9a32oFfwRnO6OPH+3qx3x9QWOME1pwZBmGQ==
X-Received: by 2002:a05:6602:3e8f:b0:849:c82e:c03a with SMTP id
 ca18e2360f4ac-84ce0163894mr1157136939f.10.1736606546552; 
 Sat, 11 Jan 2025 06:42:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fc8946sm155369639f.47.2025.01.11.06.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:42:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:42:24 -0700
Message-Id: <20250111144224.2755176-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736606546; x=1737211346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GiMvUTAYTnvCdKrUiduQGVSF4GeW1ljJ5GJ+or4MhRQ=;
 b=g46xiwLxrd95hJghi347zU9F8Ux28fueBSJUth7Uc6Qx+DT+xM4wvpVVMtqH3k2cr5
 jyeZ1vClEuGSe4y1qstQ4Z6QLkNZ7F2HZaU0RyAgdp8y6dVne2copCz7iezM9ohpmdWC
 Kvzlkv6pVmWfFaW1GO+eUCmQbZOw/NzUoU+Htd9m7YiS3QWTawa7ELedNJK/DgKa1Liz
 ofvd5+uZeZjBb1M8VWsHREbz61GC838R0VYHYqjZGnQocgfNJHQ1n6DszXtAh6o6FsMC
 JqOarW0+E9xUdRtQuNyAc9r1CqVMrbRpgP9TaTsfZHJOmOKFpGBsddxHl92r4aAEJGiq
 PFIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g46xiwLx
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.14
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
 Graeme Smecher <gsmecher@threespeedlogic.com>
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
index ddea73f629..df657aacb9 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  144d268da63c96d800f5aa0c0901cf09c9337a6dc5372a4539415d2cf7f45b2d  python-orjson-3.10.11-cargo2.tar.gz
+sha256  2d093fc336be04a32f4edf27b2aca8e6e7c796521cfaf9552079b39d2ea93e06  python-orjson-3.10.14-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 85ad6c3248..9b44ebcd67 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.11
+PYTHON_ORJSON_VERSION = 3.10.14
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/db/3a/10320029954badc7eaa338a15ee279043436f396e965dafc169610e4933f
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/92/f7/3219b56f47b4f5e864fb11cdf4ac0aaa3de608730ad2dc4c6e16382f35ec
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
