Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9783CEE339
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A50080DA0;
	Wed,  9 Oct 2024 18:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KirRm1EuSao; Wed,  9 Oct 2024 18:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D18812F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D18812F4;
	Wed,  9 Oct 2024 18:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F06CA1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDB780DA0
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrShrJymnkXE for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:16:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6862F812EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6862F812EC
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6862F812EC
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:16:16 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so3348239f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728497775; x=1729102575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FAeatrxiHFk0EeaeR3MbE1EqbO+R8zx6bQrnGGfeuAY=;
 b=e1xP7EVULwtok0QvKV9ehsUisCrsYWoYtaSGTDYbzoKJelTL65bbRFBNakItMLP6ff
 1OkxHSJl/pSzK/98fa2L6vpaDBb4qmKa6L+XFJ2g1PO969Bu3h2at4B2iFXXUFyJSOWK
 BMpm4qSPbdUDWevfaqvgWiHTKPJcjAMEYEeqFO1t2V8t/kuTz1IS5xxPoTaM1BDBtdvr
 mCkbq0lN8YKjqVcMYR9ZNWo8Wg9LkqbTrgFtEHR28yyk6mVyNJ0JaeoM6k2VZ/LFtCuL
 BFh7bMR8Ht3s4npD/37mUEJd/oKfugmqHyp84oCEMZNTH0iNWqYU1nN3vK0hfyWOPrv6
 ENjg==
X-Gm-Message-State: AOJu0YybnxN6QHCJSetfFU1ZnqyoAx5ZHs83jt3AaOdP73RW2TzeecMm
 pLDeOoYERixhcQqY4jQz9QedEmQIhj10aXzL47ug5nuI0E8cn0ougjiX+KGx
X-Google-Smtp-Source: AGHT+IFd0TAY3ECexORcXpnoiYxaWPgDwJE1WnuFxJ2FwTxaNCJK7Yq9wZhjzzNq+idVkIeW7HdQ/w==
X-Received: by 2002:a05:6602:6010:b0:82a:4419:6156 with SMTP id
 ca18e2360f4ac-8353d538905mr437409239f.14.1728497774905; 
 Wed, 09 Oct 2024 11:16:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83538528144sm60082739f.46.2024.10.09.11.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:16:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:16:12 -0600
Message-Id: <20241009181612.3877587-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728497775; x=1729102575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FAeatrxiHFk0EeaeR3MbE1EqbO+R8zx6bQrnGGfeuAY=;
 b=R8UqDDp0054P3Vgb3yX/w1Xl8nfqBaAe2kb9EWuHMI0ckHEujggNH8+WvpohJGcbGt
 HovLUDWeGG1hEUlmv23GcIKPgHGUPp3p5ClAmgFKSamhyefBmyzRQyiTvSIeTVzo6XTy
 u7Q27UIIGC5jVAeuLKGm5ndowGe+G6oU6t3HkO/ZD4OlOCf9s1TmeCPugMmK8rHV/U36
 CZl2YyhtlyD2XF0eszO6g+/ds1P0WD7oOHramUJ39GKQyQNrrwAL4RiyTHVmP95B5/cv
 u1gkYiOswTy+Kl+gisYZ/rs4/ISRNRKbu6gnXidVky+Xi0ELHabcLdsoM2DdNvcl5gw8
 xyKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R8UqDDp0
Subject: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil: bump
 to version 2.9.0.20241003
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
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 4a2dcec502..6143f7bb2d 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  0d91422e92000e77d633a8adff3039e7  types-python-dateutil-2.9.0.20240906.tar.gz
-sha256  9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e  types-python-dateutil-2.9.0.20240906.tar.gz
+md5  986aa3f3706c4b38dfcd141572a4f515  types-python-dateutil-2.9.0.20241003.tar.gz
+sha256  58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446  types-python-dateutil-2.9.0.20241003.tar.gz
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index c210d71b0c..53d16de74c 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20240906
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20241003
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3e/d9/9c9ec2d870af7aa9b722ce4fd5890bb55b1d18898df7f1d069cab194bb2a
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/31/f8/f6ee4c803a7beccffee21bb29a71573b39f7037c224843eff53e5308c16e
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
