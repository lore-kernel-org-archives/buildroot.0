Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E022E6F085
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5BE6060E;
	Fri,  1 Nov 2024 19:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH9OghdmYT-S; Fri,  1 Nov 2024 19:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDF16067E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDF16067E;
	Fri,  1 Nov 2024 19:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21195979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FF286067E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gu2Avv9NGwm for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26A806060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A806060E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26A806060E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:42:48 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83b2a41b81cso95525039f.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730490167; x=1731094967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QbZwjVg6PI78E/Qn5xceWR4klL7NwFhc3bk2ObqaFKQ=;
 b=jhFsQSMk7n6HczzU3Oj7b5l5zp7swvAaZj60FPn8EMCKs+7tMB3ZkE9jkKeaGq6puj
 z0iXqwqc9as9kpe9vnEg3rGjHUU2zXeRuHLNUffNtwbrhmrYkjl/nT4pXTYuxK3qC2fK
 zPPa3s6nXUubaVMYgbxPC6hG6ffb8IhMFWMkK/1mTFV3bihO3nwRxCBzQqgwYlA0pHkP
 JjHeXcGeCY92gSy1BdF9k7M7Ooj1sJ+tihw9Ys6PmG7rZmR6F+r5tktU2cxF4xbn/9eJ
 /Xywt5S1haoY68jHvLzdb/o/bSeOGK2sZeabUMEch6tcVlDLvoBGluZTYBT/KjlQ37rm
 6r5w==
X-Gm-Message-State: AOJu0Yy2771RPdFNISiGsmpMTn0fyiIiRMerJkjIHmcv5U0yzN/dAKdZ
 j6d0A3CfV9uIAug6rljxOCcfO2eBEAurn2y7CZj7oCBN4MAxqlTZbNJPSA==
X-Google-Smtp-Source: AGHT+IE+ylTRleJ8wGeCqk830XjgZZP8YkkzIYg39GwFS8lXpx//YbAGkxLBijQjsenzrDyj3zoQWA==
X-Received: by 2002:a05:6602:3f84:b0:83a:aa8e:5f72 with SMTP id
 ca18e2360f4ac-83b71946bb3mr531651739f.4.1730490166828; 
 Fri, 01 Nov 2024 12:42:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67b2a511sm95647139f.14.2024.11.01.12.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:42:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:42:43 -0600
Message-Id: <20241101194243.1077737-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730490167; x=1731094967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QbZwjVg6PI78E/Qn5xceWR4klL7NwFhc3bk2ObqaFKQ=;
 b=fD6jR8wvXOjD0HXeMrBOlSvxYTSguwBRH/Ruo0Ze8UAcgPrAVpcHsujku7rOeS1bQq
 He2O/8zvPd7ViRVGOwqZJUTUSO71KLQMPyWp8WuABvo8ObVOCg2GRHTzwH0V7JOxLa2w
 LcJ4JG5OhR0diLrpkDAL4oSzetAjK8FhHeGNzLus7uU40NNEjJRt/wXLZBxosqdNjhr/
 WrB8weGDRMbaS+0kQ9oKq1wJzrEONGDhDO5VIQJACFJxYylwDcwe6hnUxuXAgQ0m+I0K
 A0qn+PbpfTh5VmYa3PqAytgntxq/g5J7NnoFNUvcTIjzq5VYxf7JvxQNorip8NTtWZvf
 X/Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fD6jR8wv
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.20.1
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
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 99fcbc04db..4c7db5789a 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  49fe05f6d243cf4c4c25848340eda678b985debaebca30ba1573aa34b9cfbbef  python-rpds-py-0.20.0-cargo2.tar.gz
+sha256  ff923a84c29f2ef21c26acbda476612393efb4854e13520b73a5dd0f7dc36fb2  python-rpds-py-0.20.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index fc23eaec35..c2f484a66e 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.20.0
+PYTHON_RPDS_PY_VERSION = 0.20.1
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/55/64/b693f262791b818880d17268f3f8181ef799b0d187f6f731b1772e05a29a
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/25/cb/8e919951f55d109d658f81c9b49d0cc3b48637c50792c5d2e77032b8c5da
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
