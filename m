Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034FBCEE339
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BAC812F6;
	Wed,  9 Oct 2024 18:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwV8D2ok91HT; Wed,  9 Oct 2024 18:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EED812FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8EED812FB;
	Wed,  9 Oct 2024 18:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA2B1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE528403EB
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIqZLpyQQdJH for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4326403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4326403E4
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4326403E4
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:18:33 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3a0482266so780955ab.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728497912; x=1729102712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJtof7PyDlKP5EUqgHa3PBFwZcEZl1B2oH64BKclZJM=;
 b=tuCawdE0h6Q+I7BOhhgAeziz4mkXimCCM35PyGvMUYiYZS7XXWuWNdto5Jl0rXo0RF
 Fz/82FgKRG0LQknpQl3qTPWgXU9xtwHpC6zDeGtw/xROp+GuBo4n1jvU09uCy7+SsmWt
 IChQahbqZsKST/TH1Y5bkF3Fx8vz4PgspPh779b7C4thkhMQPhWiN5WwIrTd+k+Bhov+
 vlmMjkNYTdD2WvJw67ADc3PUWluAbgpx+pjI82JojcD/A5KrdxYyfP9Snb7IBS9QfJ3L
 JO1QrHkPnpmCSZJZs4rx8+0tGnKFGKL1TfWIRgNeOxkr27dMCfAkteXPnElj3ZMd3A2+
 iwHg==
X-Gm-Message-State: AOJu0YyXom3wQjCemZA3IJB+BTmr6wbQJVg6wVjlN+BaIf7ObNwaHQvg
 D4z78JJlGLToZ7sXYI2etlwGTMo3ZfCo8lw07trJzAFxSVWlLpJYozp3e220
X-Google-Smtp-Source: AGHT+IF/QvyfgRQabKhaeb1c+vPrdnjBaK/0Mi/Fk3uLQA0GrVitzBrRx/NkBhGibeuv1vPBumMxFQ==
X-Received: by 2002:a05:6e02:1b02:b0:3a0:4e2b:9ab9 with SMTP id
 e9e14a558f8ab-3a397cda1f9mr26939585ab.5.1728497912419; 
 Wed, 09 Oct 2024 11:18:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a808ceesm24614585ab.50.2024.10.09.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:18:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:18:30 -0600
Message-Id: <20241009181830.3878089-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728497912; x=1729102712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zJtof7PyDlKP5EUqgHa3PBFwZcEZl1B2oH64BKclZJM=;
 b=XxVbQLoK9Mw7Bvi/53tNzLOIgHyo+SvMHS67BmKvJBU1fVHYRZ3Q4njyk9Zvw0o4ZO
 9wyPS7N935PHG2+X8MfpN3xv6Jh6vS9JvRCQRAiJ75UD3U35KGUThxVvl9r82wnbJ+9O
 3pkaOBVVW0X/5mvTNf2dsCnws4uOANaCQJJHxAF4btccUnjnef5tA8jCkHz68o/hKH49
 saW6mHc1M5jt9gsRlsxxBjfrh9ErXRR4bj4XYuxEAtEXCrx3CU70153ULdTo+j4HhHIs
 EjDwzsN+dryofRr3J64YYi9vFeRfuWBuQFzurV743FC2hAFu7C3/I4kcyHPK+CCUKaOw
 pbBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XxVbQLoK
Subject: [Buildroot] [PATCH 1/1] package/python-urwid-readline: bump to
 version 0.15.1
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
 package/python-urwid-readline/python-urwid-readline.hash | 4 ++--
 package/python-urwid-readline/python-urwid-readline.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
index 946739de3e..0afc4a9f85 100644
--- a/package/python-urwid-readline/python-urwid-readline.hash
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/urwid_readline/json
-md5  a2ae94e6ff00eb63038c492c05f9c3db  urwid_readline-0.14.tar.gz
-sha256  8fabd2e501c124a30d38cfb10610b32f119a615ec0b310ae5591c583fb00bd09  urwid_readline-0.14.tar.gz
+md5  6bf957af6a09aa1f2bd76e0dab298562  urwid_readline-0.15.1.tar.gz
+sha256  9301444b86d58f7d26388506b704f142cefd193888488b4070d3a0fdfcfc0f84  urwid_readline-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE.md
 sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
index 5091bca1c3..edd49b82e0 100644
--- a/package/python-urwid-readline/python-urwid-readline.mk
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_READLINE_VERSION = 0.14
+PYTHON_URWID_READLINE_VERSION = 0.15.1
 PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
-PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/2f/00/347dc37f9fb328a8386961157b6a31e71d603c17f2ed3098ca6bab513689
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ad/70/be318554495555eba7d8ff6e489f6f74ddb225b24086ba4af62a82e723fd
 PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
 PYTHON_URWID_READLINE_LICENSE = MIT
 PYTHON_URWID_READLINE_LICENSE_FILES = LICENSE.md LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
