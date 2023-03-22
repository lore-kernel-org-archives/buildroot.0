Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5746BC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC7540465;
	Wed, 22 Mar 2023 00:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC7540465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-v1GSz2cvXM; Wed, 22 Mar 2023 00:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F75A40154;
	Wed, 22 Mar 2023 00:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F75A40154
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA0111BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1801410B8
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1801410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lw7wh4PM-YyV for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6767410B7
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6767410B7
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:25:17 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id l15so7543521ilv.4
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679444716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=45i3JK8Tnx2kL5lPuMFoe3GkfF4NZsJn/8h3bTO63hs=;
 b=2PK6MhZpEjatZ5fzvdkdqxlXB7fSeOuYYCleIKOfFHWJW6fUH0mEyUoxN+az44Aoej
 42zv9HHL7AJ0rL1gVy6h4Na3VtidVFVJzvN9Ee6SpUfE963L2/Jexw60CtLmpxE2vjB/
 fnN4v/+7TUY7D7RWCdJmSpv6V1Y8dv12nCOtaqjfnVl4Uk+KMvYtMeHhNcR8B/khz/2j
 6JbQkDNxPr6bbK9XtCsQagtpLvjd+muRK/NPKmI6Kl1HgXy7GCw+DtduPtDLQ/rFIU7k
 qE1QwCD5ZC3WOtZ80vDVPMkTwYJmYbwCGGg0XP6AghJ14j8kbjjC5L747/Yb8QdgqLuF
 PIDg==
X-Gm-Message-State: AO0yUKWFhY4/ssUWRtHY/cEn2rKGjIRYjCH9JZ7mQPMei/C8IKRK65SJ
 ZkzktFKtPHmds4uzbCBIXKdQANm70Pj23Q==
X-Google-Smtp-Source: AK7set+6U8pHZzMZpsrx3rd6+atpc0VgwKPWR1r7gOfMhkqk1ssDaomBbQHUYaNG1AglFy9LRlpFJw==
X-Received: by 2002:a92:d0c1:0:b0:313:e73b:d3dd with SMTP id
 y1-20020a92d0c1000000b00313e73bd3ddmr247833ila.13.1679444716558; 
 Tue, 21 Mar 2023 17:25:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 b12-20020a92a04c000000b003179d2677f4sm3860692ilm.48.2023.03.21.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:25:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:25:06 -0600
Message-Id: <20230322002506.4089528-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679444716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=45i3JK8Tnx2kL5lPuMFoe3GkfF4NZsJn/8h3bTO63hs=;
 b=i2Ry6ZQ49mFvfaq6WbgCTFSxt6rRnWQxGqF9Zm/SixV/Nuyapx9m2PXRsv/67Cj4r/
 a/GFBcb9pOUIyq8ELFk9Q4PEcutb1P+0GzbO5bLnCJPhFQUN4al7zQ6zkS9Qy2i3lcBc
 poBTKi7p0otM3LWQ/zXU0uu+TzKDQN4L+2NfadBI9v1BMPTFe3Kabm9QLqegTUFOsYCE
 x0AmxkakxChvrst3gkNgos3KF4D540+t0kESZU5B7vQl+UB3oCQKUrbW9cRYEEDBhkal
 a5nyzWs4pjzlksPk9945g508LsrYjTV0AM7/6fuAxvUTgHDkzNa/+iOsTpWFxwI08jjF
 F5Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i2Ry6ZQ4
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.10.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/sqlalchemy/alembic/commit/e3055cd5baad328641366026af66639f333c520c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index f94f5ab10a..c84c46c84c 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  999392ffc900da18afbf10d2ac31bdc6  alembic-1.9.1.tar.gz
-sha256  f9f76e41061f5ebe27d4fe92600df9dd612521a7683f904dab328ba02cffa5a2  alembic-1.9.1.tar.gz
+md5  de9d9f92a49a5e3ae5a978018927f474  alembic-1.10.2.tar.gz
+sha256  457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d  alembic-1.10.2.tar.gz
 # Locally computed sha256 checksums
-sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
+sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 64ce85bead..4f605b8f60 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.9.1
+PYTHON_ALEMBIC_VERSION = 1.10.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/81/87/5c531d2923c61e7ae68b23c8660df289ae4241a0d38f3fbcbd8dba64ca6b
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/d6/02/66ed327f944f3f85423096c438d7d290da5af21a7aecf9e5b9f09d9e34b2
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
