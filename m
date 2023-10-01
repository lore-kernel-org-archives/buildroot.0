Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF70E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238AA82064;
	Sun,  1 Oct 2023 09:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 238AA82064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEaO-Fo48XXE; Sun,  1 Oct 2023 09:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208AF81F75;
	Sun,  1 Oct 2023 09:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 208AF81F75
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C82771BF5A6
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A145461232
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A145461232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hG7rfdPJsFx for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:21:15 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6272D61170
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6272D61170
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-79fce245bf6so361763839f.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 02:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696152074; x=1696756874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7b8COIfIGEnO+LTn133FgCHH3phndaJ0Gn0AfAXEYow=;
 b=JMnUGSKBdW8g2tDbyTGe3aqjWWu1Al7+f/3Xo41rnGu0QCntJLavJBzXqC77YwhDRP
 DqXzdEnz06C1/lJXbH6Rlp/TYcKI4OKvlu+WCRwK+xEIZ8oQSsLBAt1KE+ihdqJ3+g+u
 fPKgxj1u8URUQx+jRwoJydbCwehL/dC5L3SC4nXQ8q+H9jhsyoY4kqMaQa0G89abedIw
 L2LFBcCMsG1ucA840z0vB623ohr3sPc3lMD3Fbhgbak1C4VcFCRUx4HkdQ7QP3x2LJay
 AKauXfc5zZ7hZ/x0A9nJxxOyC1eT7WVTst0oeby4Pb5HNlzXyOyxSQWIuNaTTv1uNAE2
 Fepw==
X-Gm-Message-State: AOJu0YxjiySugZHxWzb70t/08iHOeKVPXOErN9e2Zybj8EZH9/p5IjHe
 Rwj6q0CPMGd+cpzfJ590kDONtvy03m5D2w==
X-Google-Smtp-Source: AGHT+IEbEfiyWk5qqok8cqlpfRaRM3qOk3nrik3AXzdOnvRwE+nZB8IbG6PBv7k+heL9f49VWH4V6A==
X-Received: by 2002:a6b:6b18:0:b0:794:eddf:daae with SMTP id
 g24-20020a6b6b18000000b00794eddfdaaemr9827743ioc.12.1696152073755; 
 Sun, 01 Oct 2023 02:21:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 d23-20020a6b4f17000000b007951e14b951sm1589409iob.25.2023.10.01.02.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 02:21:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 03:21:09 -0600
Message-Id: <20231001092109.1772658-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696152074; x=1696756874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7b8COIfIGEnO+LTn133FgCHH3phndaJ0Gn0AfAXEYow=;
 b=MgvzGEkW/iVoSZ1N4mOjxsat1yxENqDvHOwWFAhzeS70NBSlqh6LEpdry3hlaaHyYp
 vPwyG8r2K7O8K5524Pg1B0J063B2QJM93ir2MSaSIsucyHsHHPIJZ39TVBUtruozfeIJ
 hlnFsA/8JpMGZdDYz8zp/MW4HdvHe9/Y3CFBws94RADHFyAaz7kTQnBuY8ze8fB8RSop
 jGTE03pUtXXnndQH7dgQIhOZZWKeQgc1TrkxdASlFH/BNPdQ//DFO4q1z+ggQF8AKNHv
 abKXykIJR6sevlTUTVzNW1/3Nzhtrv5EcaC0FLqZbLxE2e2AMx3PP2uqEr2EFzY/kN1P
 PPvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MgvzGEkW
Subject: [Buildroot] [PATCH 1/1] package/python-systemd: switch from
 distutils to setuptools
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-systemd/python-systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 3ccfd57ce5..7e45b35e38 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -7,7 +7,7 @@
 PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
 PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
-PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
 PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
