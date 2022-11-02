Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775CAC43217
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFEB40338;
	Wed,  2 Nov 2022 19:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFEB40338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4EX2A28l1MO; Wed,  2 Nov 2022 19:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C74340194;
	Wed,  2 Nov 2022 19:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C74340194
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 580D01BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40D3A60ADB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D3A60ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKKssSW5l4Ao for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5897460AB5
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5897460AB5
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:48:06 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h18so10002604ilq.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYTOOseH7XtD7xIZG5aVUHhKjtyhCkQd/RONByFLbYU=;
 b=z6Tx4rxL3wDNXl3cnoBDb/EqnwGdV5M4P0PhMWSbYq8nLmizLPC+XAYSfC+7GIrkJA
 MyWzYDVwgV+bVBjS8RuARfPPBz4YidkKURzQY/3evLaPatUjCQP6++2TLjeGCGCFoGJ1
 AzflznvBzLbTE+GJwH9MFa6OAyi8Wbj7Deob8jj7GQvGoeKPR8Khq0DMM4vT9p9DjeLB
 n7qmg66dEJKwU9TigbWFtQSyOSWbImfFApu8tZC7eBpxFsjjbtA5Z9MYNhepVByWf9A/
 PXMWkptO5f/HUwDlXqIUxBJ+u9bAnGfWh/CDxIt7Dn5roAsuh8cIUGHcLiOIjQ+RB7id
 5eoQ==
X-Gm-Message-State: ACrzQf1nQQjUhwBJG4C1u6dFkxY7E5aP/a/JJES9EI022Al45gPKt3BD
 U2Ent/rlNTHEQTIZUO//DpaG6O6bfXScHQ==
X-Google-Smtp-Source: AMsMyM6bhy7nVMYLRc8YENoYl+UgoeCoFQWhEIeRCdNplwsM1RYt+JDodKksxuwZbHLiF1Lu+5pUjA==
X-Received: by 2002:a92:c003:0:b0:300:c414:4a7c with SMTP id
 q3-20020a92c003000000b00300c4144a7cmr6732245ild.75.1667418485041; 
 Wed, 02 Nov 2022 12:48:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s12-20020a02b14c000000b00370decbbff3sm5070320jah.148.2022.11.02.12.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:48:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:48:03 -0600
Message-Id: <20221102194803.660881-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CYTOOseH7XtD7xIZG5aVUHhKjtyhCkQd/RONByFLbYU=;
 b=n53PjdLnIoctW+McR5VCk+jtRq1ZvAXBf06F0Gx0ec2wNNZshJyQdhHs4qfJGGlvi3
 BUfb6+NzWzr95NVEDhY3AEuYBBuXrzN+pY+P7C3f5U/CuggINW8/8qJ4/DV85SRmVtdD
 M0kLrZt9RhPXCxb224jOE7Kjoh/HgTf+EONCK4UkK5YgHYJz2O5kEZ8Q6FFbvlwTQ3sz
 x8LhRCVaoLQJLfL/Ez1FOPJrBC/EHflhW1az1lfBowK9uO92KQwwAwrxKGLpatAYO7Sl
 9pW2tn6YtOvFgoONclHAC0zGzQp4UIbiQMINo8h+W6t8B8cbKkU8ZfmIAJaT1hC9IHDs
 UekQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n53PjdLn
Subject: [Buildroot] [PATCH 1/1] package/python-decorator: bump to version
 5.1.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-decorator/python-decorator.hash | 4 ++--
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 46ff7206d7..e12d34e7ed 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5  d01585c3ea5b36a209747fcc978a98c8  decorator-5.1.0.tar.gz
-sha256  e59913af105b9860aa2c8d3272d9de5a56a4e608db9a2f167a8480b323d529a7  decorator-5.1.0.tar.gz
+md5  a6b34700dcac8a4bb04efd55e99626c1  decorator-5.1.1.tar.gz
+sha256  637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330  decorator-5.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index a61f045e2a..5dba8cc915 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 5.1.0
+PYTHON_DECORATOR_VERSION = 5.1.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/92/3c/34f8448b61809968052882b830f7d8d9a8e1c07048f70deb039ae599f73c
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/66/0c/8d907af351aa16b42caae42f9d6aa37b900c67308052d10fdce809f8d952
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
