Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66821CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1837D4011C;
	Sun, 22 Sep 2024 06:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEst9vUMZ6uN; Sun, 22 Sep 2024 06:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37FF402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C37FF402E4;
	Sun, 22 Sep 2024 06:04:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 981701BF4E3
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86FC1405AB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFTOMSHHKgDb for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A391404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A391404D1
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A391404D1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:04:26 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a0c874547cso10480475ab.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726985065; x=1727589865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84cNi+9FlHj6P7SXCrTzSetNsqaLUbSp7UmHL6ik9/k=;
 b=LU+SZFoQt55T+WPfGhTOTH/Eapc4BB+YDxI3RGE+HPFzQMogycHkJEQrWIjcW7dp/g
 GjGc0dE+1s/eQK4zNlaCyFsNtgj0UWMMt7oSEq3u+KOaPIXswfNN+hXUf7WwD+RB1HfU
 LdbTztyPNCyqPNmW5Wm3Fcbi/qjUNBG/rOH6monBRuQ1PlUcrGoKG9ut5+19ZvWUURZK
 jWMOfwzLObo4GXMmZ6FIuQJeXlsnIGNA5cIvMB6LmubXI7SjErh51Nc3sXxIMQ7k2KYV
 saAAm0lHtXni3of7MGJYNxZwyn8IJcFM6ndtju6ZEwL6uoXgNmBt+YOr00CIFU/qzVuQ
 vgmA==
X-Gm-Message-State: AOJu0YyR+Kwba/nB68iUvsHhkwmm3vL2RWTpyVhv8EH35RhfSQnxLUnS
 ++WgGUQiwPq76ghTujFfaL3ZU/1RFZ87XewdUccKykwEnTXAwAUycx13Ow==
X-Google-Smtp-Source: AGHT+IGN1nJ6lAkQ+IX8ct26t8HmX9113vOYgW9tBLqfduJvtp42X5diYnf+xRLJqVg0Giwf0nkQvw==
X-Received: by 2002:a05:6e02:12ee:b0:3a0:933d:d306 with SMTP id
 e9e14a558f8ab-3a0c8ca1722mr66232515ab.9.1726985064984; 
 Sat, 21 Sep 2024 23:04:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092b83b33sm52818815ab.0.2024.09.21.23.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:04:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:04:23 -0600
Message-Id: <20240922060423.956345-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726985065; x=1727589865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=84cNi+9FlHj6P7SXCrTzSetNsqaLUbSp7UmHL6ik9/k=;
 b=Pyw70PLuknH0AaXc7xUt6qv9sH1bftsrTFR95uhfKIB3ndQDi3scfco7fGCswDVtsZ
 fhdxKuREPoa1h2paXzioH1llbrwila0mbU2B2NdXDn2t0DpKsIPo7UkKwlz6c8kK4kqU
 7FJtzYAxa2VSE9RaAZ9s9yCcX1jkq4+bJAYBfLSAcRywscsGnVoLIC1Y2Q87Jdn6tju1
 Qx3cHsm75vKuxFBNusSPaux+IjGt6q8YRSEGR+Mit44f2ms/0MiH9kfyGdMxv9dVsyvA
 iWfR1C0FX723govn3DI9RpklgY23jkWUS31xGpKoiEjDF/G8oJpDVAXTwmZMJRR8Whz1
 TpnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pyw70PLu
Subject: [Buildroot] [PATCH 1/1] package/python-urwid-readline: bump to
 version 0.14
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

Add previously missing license files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urwid-readline/python-urwid-readline.hash | 7 +++++--
 package/python-urwid-readline/python-urwid-readline.mk   | 7 ++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
index 75220e937b..946739de3e 100644
--- a/package/python-urwid-readline/python-urwid-readline.hash
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -1,3 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/urwid_readline/json
-md5  6e0bd170f621f0ad3edab1875bdb5c5f  urwid_readline-0.13.tar.gz
-sha256  018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4  urwid_readline-0.13.tar.gz
+md5  a2ae94e6ff00eb63038c492c05f9c3db  urwid_readline-0.14.tar.gz
+sha256  8fabd2e501c124a30d38cfb10610b32f119a615ec0b310ae5591c583fb00bd09  urwid_readline-0.14.tar.gz
+# Locally computed sha256 checksums
+sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE.md
+sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
index 782c425b65..5091bca1c3 100644
--- a/package/python-urwid-readline/python-urwid-readline.mk
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_URWID_READLINE_VERSION = 0.13
+PYTHON_URWID_READLINE_VERSION = 0.14
 PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
-PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ab/bb/c5b3fec22268d97ad30232f5533d4a5939d4df7ed3917a8d20d447f1d0a7
-PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/2f/00/347dc37f9fb328a8386961157b6a31e71d603c17f2ed3098ca6bab513689
 PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
+PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_LICENSE_FILES = LICENSE.md LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
