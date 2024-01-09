Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D699BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F13C4194F;
	Tue,  9 Jan 2024 07:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F13C4194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUMMrAcnrhNU; Tue,  9 Jan 2024 07:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82204193F;
	Tue,  9 Jan 2024 07:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82204193F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 750E21BF363
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BBBA40446
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BBBA40446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytnYXzbSP5Tb for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:01:39 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 189DE404DB
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 189DE404DB
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3606f507efeso13748625ab.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704783697; x=1705388497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ZaBH+6YHqbnnn6dq0B+CQezbUORJh0UXiB2OUXbFRM=;
 b=VN9sXRUp0S4+hey1AXcznXC6kbEjKQl8z2RD24yabRyk5+7l8YTSrq3IljrYcfpx0N
 NJYHDOGbijvJGwGVx5vfkBCEMGW0JKfxs3yIwhFxtLXOoUaYcXpygzBeytroh7TBZUUY
 AbPmqb5cdFJnFZxK7NHcwv58TXPqhShxDuuKxAqwjyIBsPqnQcEskg2CT/J2giUtv19t
 GJ4KQkrQkqHPKKxwzXeLJpGM6vXN5T+yafUjE24dBCX8vq9WNDk5dBYqQHcAHwFufvsT
 /yxhJ4zZF2Qwu79mkBe4GoSHtgGegnjzEhkdqcdN61bJls6KBq5FRPqY6CLtO3r39tc5
 Kbew==
X-Gm-Message-State: AOJu0YxyvQw3JHzGZR3XaXJDkaK//CQCxYU4y7Kgv70lUlwO5wzCEVId
 RkPJwYiQwfq0rZ+SQiw1yn/Uf1kVq96c5A==
X-Google-Smtp-Source: AGHT+IG9bPdt1PB+tpHjaECWHth2HFAjpWqhNgsI+l8DbBV8xiZGv68qVhwZI2k/2afDmREoNs9gvQ==
X-Received: by 2002:a05:6e02:1c21:b0:35f:df71:423b with SMTP id
 m1-20020a056e021c2100b0035fdf71423bmr8756230ilh.30.1704783697661; 
 Mon, 08 Jan 2024 23:01:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056e02052100b0035fd0a61f5fsm430986ils.49.2024.01.08.23.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:01:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:01:35 -0700
Message-Id: <20240109070135.4001715-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704783697; x=1705388497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZaBH+6YHqbnnn6dq0B+CQezbUORJh0UXiB2OUXbFRM=;
 b=VkIpgCuUh2JTjbHtzPGFUQ095sQcsd8RW1bwAsXcxs/mfQ0vTCK/eIh/7uLCah5Qyj
 zt/q7V1RLDXcOOe6nDOYCSmD17c4XPHs5P98W/cItmaI3J7JASKLRsMszYfVG3BSZ6nv
 U614xZcHB0ov1lpNeMxQxCKDQZEtsA8NMinJXqzUJML7MikL2Ecp7QZ9OySUwwPj3Qmg
 V8HzmnpwQ/NjufeQn084MYAQCJ1C2NKRoQJlIfPwpgbgJPf0I07CXeqKVEJee0lWr/eC
 23NfyrlgD8evTC1QmCXgGn0s/2LekKREni0Va/z4K17DUOLz9zfGTmfzODlWBvFUZz67
 sV5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VkIpgCuU
Subject: [Buildroot] [PATCH 1/1] package/python-distro: bump to version 1.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distro/python-distro.hash | 8 ++++----
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index 3d3e4258de..7f8277896d 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/pypi/distro/json
-md5  a1e81972bbcfc0dc77dd0cde590c22a6  distro-1.8.0.tar.gz
-sha256  02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8  distro-1.8.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/distro/json
+md5  c4eee99e1d05691230f223c37b895027  distro-1.9.0.tar.gz
+sha256  2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed  distro-1.9.0.tar.gz
+# Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index e079d8e265..05faab3888 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.8.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398
+PYTHON_DISTRO_VERSION = 1.9.0
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
 PYTHON_DISTRO_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
