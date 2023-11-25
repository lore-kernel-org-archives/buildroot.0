Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE86C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C2161506;
	Sat, 25 Nov 2023 05:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C2161506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EP0AudoIxkFK; Sat, 25 Nov 2023 05:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDE5614F3;
	Sat, 25 Nov 2023 05:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEDE5614F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A743D1BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89BD9614F3
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BD9614F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yYxEgMJrTsQ for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:34:51 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 953A560D51
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953A560D51
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35c7d62a389so2513965ab.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700890490; x=1701495290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFYSydiSTilnWs9At7aGYg2atv/k4qH3AkO8zC/o1GA=;
 b=cp6+u/JKNWrRiB3nlmo+e3hxdi+tqd05NEHeK+m2sKLF+ccnLH2KW6WsXKstcPbSVX
 vHOE3twXnIZaNqmZQQ9t3vrn12OE3k9IwTogu+Z7ZTh+X90MCOZ5H/bTTBJPf5gw04uT
 fNfyHsadsP6DcFKPB06T50g1LyXTL4A9Xb4xE2BhnByJ1lsXUfov48FcoSt48q6Muu8v
 oNdfKQY1pEfGKhnOuej8kQpDKzY2JdkBxrFNwfkuoptuGoPHAT8xM5Ev6BafvLO3djyv
 8LNX6gSF0Iw4KrHLGx1umXIt9fxXYXYgszdLo8xjuFG52xyO4kvwfwCX8HNORsstlvz2
 SPjQ==
X-Gm-Message-State: AOJu0YwEdCY1ITKP3XNdbbUsEQuxtLaev8eLCxdXlCQvIeXVbPB6nVO4
 I0cU2LqnMCiXo09jaPTh4OnZgWmd4lg=
X-Google-Smtp-Source: AGHT+IHykkDxhXdZg9RM7hIvG1JfDgZfK3vDzjcAWP2pDcV1OKA+tL/Jlu/PakY1GJxFjhUpoEqnaw==
X-Received: by 2002:a05:6e02:1aa8:b0:35a:b337:6f58 with SMTP id
 l8-20020a056e021aa800b0035ab3376f58mr568215ilv.16.1700890490338; 
 Fri, 24 Nov 2023 21:34:50 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bf8-20020a056e02308800b00359b09f0710sm279223ilb.6.2023.11.24.21.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:34:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:34:48 -0700
Message-Id: <20231125053448.305980-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700890490; x=1701495290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jFYSydiSTilnWs9At7aGYg2atv/k4qH3AkO8zC/o1GA=;
 b=nKFSwyzC4yx/bYXCo/jLXhAMxX+tMrR+bF3Ede/BbeCX7fpRDNRCfCWQJiH6ClJs/j
 mIHntAEvL6isnSRzY6/JZOUT+VJXA6SLt0BfOnzRA6wX3RoyqF5160lX7ZINmrQvIBXQ
 X0BZRjgQZr4tV1bpLZs/i0r4LncBWEdOf1PO/5g5AJk96ix8F9w9R6Hwh8vp1zTgxMOm
 o1B0Ui3eNj+33B0SHVwhYxSykB4Ef+cTlfrZxDUSoX0hQr0fI+BhpiqQpHGSUW2KumTe
 BdzfAgdoX5Vo3/K7CYvA7Bhk26bKDdqh487AbQlBs62b3IQnBC04jX/6cKGT7uFa+FrM
 +xaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nKFSwyzC
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 23.3.1
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index b41ce47d4c..9518c9d8b8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  996f58a94fe0b8b82b6795c42bd171ba  pip-22.3.1.tar.gz
-sha256  65fd48317359f3af8e593943e6ae1506b66325085ea64b706a998c6e83eeaf38  pip-22.3.1.tar.gz
+md5  f0c9fba61e9d9badcc9921062e993d84  pip-23.3.1.tar.gz
+sha256  1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174  pip-23.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 040767930e..83a1631a2f 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 22.3.1
+PYTHON_PIP_VERSION = 23.3.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/a3/50/c4d2727b99052780aad92c7297465af5fe6eec2dbae490aa9763273ffdc1
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/1f/7f/4da15e07ccd11c84c1ccc8f6e24288d5e76c99441bf80e315b33542db951
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
