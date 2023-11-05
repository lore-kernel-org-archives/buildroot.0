Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F7CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 00:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0156660D78;
	Sun,  5 Nov 2023 00:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0156660D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ko3B4u32L-UR; Sun,  5 Nov 2023 00:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4576F60C17;
	Sun,  5 Nov 2023 00:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4576F60C17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A89B81BF5A2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 816AE41821
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816AE41821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI3uGe3pXD3S for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 00:10:24 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 713CA4181F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 00:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713CA4181F
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a694a365d9so141232739f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 17:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699143023; x=1699747823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TmYLW4pc6NV7wM3yYUfZDrcybhVnkrTITKeHkjkv7qo=;
 b=IepxBIKmEh3QF1cJw+i02aDtYuR+j9vo66Jecer5mULiya9Xp+aNqfFn6KKuzW77Zr
 6VW1NEORYpzhYoUI6t2PGltUmqPkE7wpCMQ81zQIzDKJf2Sni+/I/KZVQoglOMofOHQX
 t3Nb+PbvmRXl90IKCFwoWbUpgO1nrzSQHPBhB43mRnaReww9hhfGhdJYylQxT+rS6CME
 uJ2/4RX6tc0UTjE3VQfN8D/9FmUAsuDAxePevDxxrBU9du7l6U+Klfcbp79zt0r1paeO
 AGjKrvavOx7erCdfsmZtzsU8FKPsXczpaL+QDpgoBOkJgabGtvj7N1LSwueoGwYqCSKb
 3A6g==
X-Gm-Message-State: AOJu0Ywo1AN7LntCEQNAOh9M9WxK8L/gNqyOPjJQAkds54BFo3dYD5lr
 1B0HmoYzH+cjLQVvPUfXSSZZSnX0lEU=
X-Google-Smtp-Source: AGHT+IGJ7RQ7OrJLrT9PskHauNwbzYi1IOS8okiMjdVzz+kP6vk9hINzBDe0MimR1+zufOsg3FQaBA==
X-Received: by 2002:a05:6602:29ca:b0:7a2:a8d5:e146 with SMTP id
 z10-20020a05660229ca00b007a2a8d5e146mr35374670ioq.15.1699143022986; 
 Sat, 04 Nov 2023 17:10:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 s13-20020a02cf2d000000b004300eca209csm1259255jar.112.2023.11.04.17.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 17:10:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 18:10:09 -0600
Message-Id: <20231105001009.2704781-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699143023; x=1699747823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TmYLW4pc6NV7wM3yYUfZDrcybhVnkrTITKeHkjkv7qo=;
 b=OmOVWM+3zDvOldxZ4OY957Xxc4e3Lt8I+zM7ZhZ99EfMecN34ZYDHmTeq8yKZyM9nH
 vHURlngow25PsEAYSNnuwr4RRx8Fmss2nspxsoFmP0o9rZ/mIcXB5b4xIdfaT6wVpRNE
 k2nhAsTWcKGm9QDqnigUZQ7ftYA1IpDSF4VV8eeyc+nOldhk6U6+NRGg1czbxKekLsY2
 JJPNndlDSOPL6FKe49z3Ciad42RnIwhziAX/nAjl/gVpn8F8WXAN/wJuVbj7EGKsnUuM
 5K4ztqzCM/HoG1U8Le0tUny7VLKRd3Q6os27koRdoz6URmNDNKgcQ3ur5da53nKBjaaO
 TIgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OmOVWM+3
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to version
 23.1.0
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

Migrate to new hatchling pep517 build backend.

License hash changed due to adding contributors:
https://github.com/hynek/argon2-cffi/commit/1133f3c2bafee1501535de5e5531054570438b1d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argon2-cffi/python-argon2-cffi.hash |  6 +++---
 package/python-argon2-cffi/python-argon2-cffi.mk   | 12 ++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 09da5855a3..e11195e1e2 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
-md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
-sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
+md5  7371c126f21a895b33c4fe7e00ac6fc1  argon2_cffi-23.1.0.tar.gz
+sha256  879c3e79a2729ce768ebb7d36d4609e3a78a4ca2ec3a9f12286ca057e3d0db08  argon2_cffi-23.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
+sha256  b6944d386e87ccf49d9632da083685a4b7624733e686a7fe283dd2d428341d77  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 0fb3e50ff3..238271f5f7 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 21.3.0
-PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
-PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
+PYTHON_ARGON2_CFFI_VERSION = 23.1.0
+PYTHON_ARGON2_CFFI_SOURCE = argon2_cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/31/fa/57ec2c6d16ecd2ba0cf15f3c7d1c3c2e7b5fcb83555ff56d7ab10888ec8f
+PYTHON_ARGON2_CFFI_SETUP_TYPE = pep517
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
+PYTHON_ARGON2_CFFI_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
