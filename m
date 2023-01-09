Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA21FC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E5A6402E4;
	Mon,  9 Jan 2023 04:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5A6402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGGyM6NS3Q0p; Mon,  9 Jan 2023 04:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D003B40142;
	Mon,  9 Jan 2023 04:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D003B40142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C98B1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 082C060A9D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082C060A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xo2GJfnpHom for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:35:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CCF60773
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26CCF60773
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:35:30 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h26so4373734ila.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3jHEfwY1q1Ygg5UD7vpjk24wgenEyPtvN7Dw6paAyk=;
 b=ZZv/iAYAy/2TQv+gq4Nk+Z64InVYsD1kQZlnbpFuBCMyFMxfTbMhjhoo75i6M+SOjS
 5faRvuXAY2wua/6XakrlUcewUJ2Lq+Qzhm7eiaCBdq7Q076M+MIZa2TNb6Gxml/j34sm
 h8gmTrVE2L4y4G/ga1UDYCcC5lrsxlNC+8yhHIJ5gnaFp+qB1i4oKzJTQ4wnjbI7wN9t
 8sdCSYUKqUSBZwgR6IY55IvHyOx9oq/tstVa0XD9GhvDNBI8xlK6AhY77DKFwOoq8lsd
 mW3w54lVr56dTz+nfa1VoS2YwBjJ2A/XqE1JOjl1KWPwRZNl2VsqWfXNhFsaY8t8BOI7
 Tt+w==
X-Gm-Message-State: AFqh2krMI/TLNrk+kMGBiwrJLufbquAuzfiYpjvc3aSoVDEV6btp4vjI
 ct6AOGZgQ4s+tSqS2xEJ8SHEKjJoL5UV/FPL
X-Google-Smtp-Source: AMrXdXt3kgLj8vXUxkCL7POtt6AO9J/p9G4ZAP9rnJYlekD8PpCefAqGYygepJhx7Fq0kePfEFkehg==
X-Received: by 2002:a05:6e02:c2e:b0:302:9921:2ee2 with SMTP id
 q14-20020a056e020c2e00b0030299212ee2mr53098290ilg.25.1673238929050; 
 Sun, 08 Jan 2023 20:35:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 n25-20020a056638111900b00389c2fe0f9dsm2497540jal.85.2023.01.08.20.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:35:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:35:26 -0700
Message-Id: <20230109043526.2386032-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h3jHEfwY1q1Ygg5UD7vpjk24wgenEyPtvN7Dw6paAyk=;
 b=OyctQ7H/30xoUYKWjCcJ1nstA1V/uV4QsfrhKlvNq2duJFbBYK0hoifplm94zEhLOF
 W02VnDmN1xyU4S74ClxaLFyRMBVMqULlfVBpvpfGuhrA8YzUnNdwp/fHogXXsbDv9LJV
 25ChCHx8ATBtzeELd28jhyNYDyJdRRiwcW9UvvNgO/l1SaIScRm9SOHzAYbNU6nJJJsi
 aRwRVvSRZMPF3EyiRBUO5nKLp0ZLDtyNLzhfUpp7tQMnXwgyuDqoAKcyWSKJBDEDezCa
 DSCXtzp01+Q09afg+ekhdm124OI0Vjs4QiRRzpVBMfIiOCCBjJwKOmImSD1IYcWbwwd1
 5bmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OyctQ7H/
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.14.8
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 9d68751c03..4fec13e1b7 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  383f60977a330ec8699a51c37ea9c5175ee7e95fc36b06d9415e0eec1f3acaf0  maturin-0.14.5.tar.gz
+sha256  79a3700178a91857195a38dfe8c3349f2c967255cb74bc4cbe98422138024960  maturin-0.14.8.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 4570ad4535..8ebcbd6072 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.5
+PYTHON_MATURIN_VERSION = 0.14.8
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/36/83/2bdec738921e253d774ab8b9e99f4540a406ad0d8a1442c84575e5506686
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/6a/be/afb9de5441a0f0c18f2b5e7087240d48e1f0f342b4a266fb125c46942f10
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
