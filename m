Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D12BC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017766079D;
	Mon, 13 Jan 2025 18:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dm8p86vVF1CK; Mon, 13 Jan 2025 18:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FC1607B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FC1607B7;
	Mon, 13 Jan 2025 18:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0131A942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CC840573
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lrR2Yk8e9pr for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9428440526
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9428440526
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9428440526
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:35:05 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844ee166150so153995139f.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736793304; x=1737398104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1kZNV4IG0frfJWJkuIKPjj8YRwnVQw00dBGWKE5GSI=;
 b=dHGiOr8z38dRvoQXL0j6Y2ujEfqdwpsYS59Gey2UP7War0WDjJ+7Kx2hGj/JvBvbe1
 Uhs+OFzyuWh9D5hy6w2QngdRDU8djc8nQb8Hvqrn4OYjuKuCNKJYjIL45jkgOO1Vjjtw
 YBsJ3S/cTaG+fKIqcrgVQFYMAn/vGy6DXjk2ZDcQjFj1gfZ22ZgCICJE0chnbKWxTU0L
 iAWtaKMb1JY7p8sP/ovy/Bno8YB/xCgYKbEp9QyBxofBjqTWmAVollA1VpUJTSMieWku
 XdkAhYUlO/oyNk54EwHDxIjsESSGsFjBMnW0iqeNOEuMMHNtQTgwAaWecucDeYl9w/mj
 MvWw==
X-Gm-Message-State: AOJu0YzuaJ0kaiq7Dd0CeEwCQ6jyrHzxVN0QZsqGa6/K4DG5gPLfAwuv
 DKIH7ksrdRBId9qmGBrKni4MKQzDVgP0+q0BTRwj4umki5xaf8TAYQVz1Q/DC3A=
X-Gm-Gg: ASbGnctnbAzQzqEnUy97nzJcNjINrfbhzQKpKZi/BVn1CVE6ME4k6ibXEYJnI/sCDGb
 p2qgqWcW6i/ZtsG55r7TI59jxuaJONi0CMjGmouPmhJ5wgheum85+T8AJ8ek/Bh2sKE8vkWHHzf
 ncK128GvekTLELGQqSo6mLy3nzoOlRaL9XiLx90LAK3f9+bXiu5U3LIB2xET1cdFFGMbLb9X2wA
 rgfdkvlZHJdUZyO8yzctOmGd9eKJ57WmEU2PanuqLFyWvwMC06kLiQwZ71jmXy3zrkelmiaowD4
 fK/Jo1Tm2jtM4OkbygVjX0jywScPiO0=
X-Google-Smtp-Source: AGHT+IHCOXmAPHdR2wjLqvu9pep9lqjmCtbdqhaInNpbhhaDXRzuZ+udq+oX7WgELp4mQnay3FQsKQ==
X-Received: by 2002:a05:6602:358d:b0:841:9d3d:ea14 with SMTP id
 ca18e2360f4ac-84ce00f6744mr2132577139f.6.1736793303936; 
 Mon, 13 Jan 2025 10:35:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fa302sm2903137173.17.2025.01.13.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:35:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:35:02 -0700
Message-Id: <20250113183502.3012040-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736793304; x=1737398104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A1kZNV4IG0frfJWJkuIKPjj8YRwnVQw00dBGWKE5GSI=;
 b=Mqp+MDdVTgPUts4SaB+ZYR+tRElUwsdztm+e5qJd+erSGFUjX5CuoJ090uD11xYht9
 I3CVLcI/8h5NlyC5mBLmHuoUJiWDKSR7gsMxZgdDgc0jPP+x3QDZYG0NZmEG52dgPwTp
 C5uyLdQVCg2zjbaRS1oRTkg/uHBf/OOtK1c9ULqByboOyVtkWfLuiB52o0i6Yzn/r5Pe
 GRV5q5gRt4jhL7GVqVQ0L7PA8VPolYT65SQcxlysmecQ3AN3DTjLb8Q7X1rH2jIUGl+V
 6q8JmWCTjrhemsM7pdPTkSAe2Kpei1wMnzRkZEjMOubuoxnNRAFxbf/RwlkJwVUJdiHa
 PO7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mqp+MDdV
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 40574723ec..94c876d918 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  4e538b8fd6f05bd3be0a29c90d9cfb0b  poetry_core-2.0.0.tar.gz
-sha256  3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f  poetry_core-2.0.0.tar.gz
+md5  799f582e2644e6c2c7865498f3b37394  poetry_core-2.0.1.tar.gz
+sha256  10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157  poetry_core-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index c9e80bc155..ebbb9b73c2 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.0.0
+PYTHON_POETRY_CORE_VERSION = 2.0.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/db/ec/dbd9cedc8b68309f1f4c0160355890b4f65f51901b31b1831dbf8c93d6c0
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/c4/f5/89d11008714e0a49cab9cba7cce89c66ea5a94f37cc6d283798cc1725fac
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
