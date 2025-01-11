Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83320E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA93A6114C;
	Sat, 11 Jan 2025 16:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Y5lq8jHqE0l; Sat, 11 Jan 2025 16:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810746112A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810746112A;
	Sat, 11 Jan 2025 16:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67797940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4132783065
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCXbMSzA2udq for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59A5D80E95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A5D80E95
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59A5D80E95
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:14:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844e06e5d11so84552839f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612072; x=1737216872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUe3E/AP7ykBnaQUs9UR0xcCMoVlQlKFdljy0l14Ars=;
 b=Z48qh/UkRs2pruTyWlcvh0GpcqsQfVIQfaPy0y6EQFkbQw+FQzfA0APSyBTdK3zZTg
 pZjQ+y3Qcd9I1MvwIhyKOU9BFHosbfKMHUEgIWQe/55rb9lqakqGWpO19oD4NmV2RT79
 s7IdWUPi0HfXncH90jovS6cqEYeVrubWV92yf1Ia5pf8NE0GvbfanemzwzT61VDEvAGt
 orX4zOW/GQMP541ll26lL1gRQV0f5acm69s5m4VO05S6Yr6X3eidAKmTyZFlKR8Siagh
 pz42qSJl+lm7ohmYn4CQrZMjhHDnt5H8JKfMYb/r/2LFg/RKN9uKk1g4aMmdJrg1eSQT
 af9w==
X-Gm-Message-State: AOJu0YznJ/C8buWCwtE3E5d4qd1MslKt14+NP2J9AV4Wr5Ywo9ld+igC
 6Nhf7iom7tPN6Fjbv1H99Vo0D2zlb4lSabkcF7z57W2uOTJFFJWWH8uVesR3ZH8=
X-Gm-Gg: ASbGncvROCkGGkEY9mLbd14hayszP6qCs6QhOhPLue9FEFyyNZe9TO9YQMcAAqa7AGc
 rf0SoYv1Ia072S8V3ophjdfacD4U+aCH75Vb3yk/gBw3Y3muFtmoixSvIBRorbMT/UD1JAU62g4
 ku8dWGGpEFLRhk82FUBQVgbA7sW+A2Aa+WCYLtYNGL9GaKAOXPd9H/LTS6zNPbQLkTI87fb5pF0
 CNuq87hUFwNENsnLH9hLOt9QQQDocSXUZaFyFwGGNUZMV0cWMlkh6uBU3SmC8JThTMqMu6LCjJV
 YpKy/ilDePYd8AuvYaf4ih87eKC5V38=
X-Google-Smtp-Source: AGHT+IEAgyVFv1YUc+L4i1cygGsBFGG/oHMbNiJh2GlrdD2st7q/gBbfXxaPqinb4qrDd58EjydnNw==
X-Received: by 2002:a05:6e02:16c5:b0:3ce:34b5:abf7 with SMTP id
 e9e14a558f8ab-3ce3a93fd3dmr117604745ab.8.1736612072183; 
 Sat, 11 Jan 2025 08:14:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm1574753173.102.2025.01.11.08.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:14:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:14:30 -0700
Message-Id: <20250111161430.2869610-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736612072; x=1737216872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OUe3E/AP7ykBnaQUs9UR0xcCMoVlQlKFdljy0l14Ars=;
 b=j6NLALKN5Tktp3G9vePGmCli3Kqi2A1oCGIS4EIF8E/ut6PjctJ4N3R6Mbeo6/s1Gv
 D6pT0dfPu3ynUQwts2cTxRONSQ4UlWj26tRz2BynVtbWXzUd5gGCrLQN0NAHDcm+hzHp
 8srZfD8MS4lGPs9l7sGu0Waipj4GMJytcjKIf0jRtptLx5ezkTsvorC4iKT9zBrBQ5H+
 IsN9CrUxZljHZ9K7CZT8APaocS5v6Xwz7QvCdeJxSYfUaGTMOoqHsqpR8AYQJzx5XMSv
 4/DzlURbPqQm0iPfYKxYe9VolilR34LhNcZRX35iMaY8Ic+Is1O/KRFG8p+oj1eXF4rp
 tmcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j6NLALKN
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.15
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
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 1081f44512..52d8b171d6 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  ce0165cfb056a1c71f6b4fe73044cae9  pysnmp-7.1.13.tar.gz
-sha256  535b275e6703e37d5a65328ee32ece2d28c876482f83de781785b550b1f5cfe3  pysnmp-7.1.13.tar.gz
+md5  e8b4dedcbe56d8cfe323bcbbe88adba1  pysnmp-7.1.15.tar.gz
+sha256  f624f2fab9503431f6514ad388b32aa657b36da59d2bc9b6059786db7d9f6257  pysnmp-7.1.15.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index a1d03f785c..32abd1fb15 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.13
+PYTHON_PYSNMP_VERSION = 7.1.15
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/d2/de/b766b1dc85e02c99835e05518d5efe9b2f1c875d406079584b4799d02db9
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c7/ec/beb6b7587249050f5100cadc183dabc3da7e1c321f44ca879c71b47f9306
 PYTHON_PYSNMP_SETUP_TYPE = poetry
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
