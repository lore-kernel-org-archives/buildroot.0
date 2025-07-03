Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A353EC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 10:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E9E60661;
	Thu,  3 Jul 2025 10:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yfg4BglI9F5X; Thu,  3 Jul 2025 10:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9481B6069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9481B6069B;
	Thu,  3 Jul 2025 10:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0733375
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1DAD6069B
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfXyx7B3WE5j for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 10:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAB5260661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB5260661
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAB5260661
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso55331085e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 03:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538869; x=1752143669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z1l4usc+wsG6enrafa0plT2X8EEQDwhCsdwJm9yHEA4=;
 b=QMpYgoYkvl6AE+YfeOmjyy0zBNMkDgMzqjxUIy+YL7FWxgsteboM0iV9mkXCOx+Nr/
 S1s842ynfM89w2yKrQLlSHWfDjmb+wZLpiwr22i306xMOkKPMtYvZDU4Y6zD2g0nPdjF
 oehxPwZ/DCu8LfgdgIztX3iwxxpuVVArRn3GeuFgSH5kp8q5O98G0yQu4XNuh4jdHW4l
 n75JM1bLab0RcUKRsXdfeWN0HbWXYRo3Ue1w1jc1KkS6eIo3m/LLVOYmnsIKA5yLhtXB
 oH001uXb2jbxiRy5snJW/UmL6E6RKzsbzhrx322ZlGf+K5i5HVWnG1wTVnk0SIYAi+l7
 +JDQ==
X-Gm-Message-State: AOJu0YzaJdMPzkn4og2jXl/41FHpbFM7humJrpozcU+yAwoHCEiouH0H
 YgpSLU5KlOjMml8le23fD8Uj30Cx56fH/UCvfrmbQNTQFJTl7GC2vDbA32bFbb94o11KWau+2KS
 tNaAv
X-Gm-Gg: ASbGnctx+HBynNSM+wToSY1+iMO1KtgV0RvADpgshre0AFTfwtmI3RX3kLGva6SJE6i
 AypW/QQwYWRvganX+1i9Gif0CYZ0Hioe9dDn0uty5Rmg5OfWZqFDfgidKLSekWDRobxH/BZAUZZ
 DrE/kdcwmfj7fifA395W0+4tFvqN76jDtHqJsIx4w8cmnNBI/FnLa2nF9rUCaPQvpxdZE9Wj4xr
 LuRqBBiTcRuqCyY30udMvq9FYuTbiSwugN8l+eWV/BBRNR7a3QxvuO4HTRr/Hhgz81YkVqkO+m0
 NWDlpsi5myzpYwrxZN+rCBgqp4lUB7R8UtLj3veEo5fHH91ZiIYzUIdmRUL+w+jcxA8N9FJGT1i
 XLbKJw8rvPfcKWPeCRg==
X-Google-Smtp-Source: AGHT+IGXL9e3bS47cQpCactRjHyvVxx6pCdozR0Neq5ipx3kDaO7oUaCJpW4OvUKZ4MUF4qdBFgC8g==
X-Received: by 2002:a05:600c:c10f:b0:454:aedd:96fb with SMTP id
 5b1f17b1804b1-454aedd9aa3mr9281515e9.29.1751538869331; 
 Thu, 03 Jul 2025 03:34:29 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7ec6aesm18248637f8f.5.2025.07.03.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 03:34:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
	thomas.perale@mind.be
Date: Thu,  3 Jul 2025 12:33:16 +0200
Message-ID: <20250703103316.1727024-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751538869; x=1752143669; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1l4usc+wsG6enrafa0plT2X8EEQDwhCsdwJm9yHEA4=;
 b=EchLd+TCyUuM/ERwwNjytsHx1T4cLn+pbW0QiV/9OCsdsp9rjmoUt42i1tksUJgAu4
 JAe0DG2AzqA2YyNrJ3AEkh3FFByLkn3zt6NKMhV8ntiCtFnOacIzfYxr2Sl4r9+KH7K/
 sEFOPS1cK/cYwkdtZ42s1Svkgnp5qFJeHsxUHq/LyR2mk0BekC+ddfMUXTzAWlImcE1A
 lJckbOPG71BFvTyFWMU8GrA5iAPPl+LRa2MCCOOA3K+CwgFl3tmPORzH+ch8SHdsPJa8
 HSkxQJMo/6soFjTijJNARXrLI/GQbVa0uAVDEgdXgouWtWl+KQNEZ2ELNV5vzcfn/6uR
 DCqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EchLd+TC
Subject: [Buildroot] [PATCH] package/libolm: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has explicitely stated that libolm is now deprecated.
Since no other package depend on libolm, we can easily remove it from
Buildroot. If any user is interested in this feature, we can add its
successor: vodozemac.

More information here:
https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy           |  7 +++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/libolm/Config.in   | 12 ------------
 package/libolm/libolm.hash |  3 ---
 package/libolm/libolm.mk   | 18 ------------------
 6 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 package/libolm/Config.in
 delete mode 100644 package/libolm/libolm.hash
 delete mode 100644 package/libolm/libolm.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 23d7da13b4..4bc917ce00 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LIBOLM
+	bool "libolm has been removed"
+	select BR2_LEGACY
+	help
+	  libolm is deprecated and has been removed from Buildroot.
+	  https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated
+
 config BR2_PACKAGE_LIBWEBSOCK
 	bool "libwebsock has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e6285ab35d..d2a3e9385b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1267,7 +1267,6 @@ F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
 F:	package/libeXosip2/
-F:	package/libolm/
 F:	package/libosip2/
 F:	package/ocrad/
 F:	package/opencl-clhpp/
diff --git a/package/Config.in b/package/Config.in
index 5109ebed78..39d9d6cf3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1630,7 +1630,6 @@ menu "Crypto"
 	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
-	source "package/libolm/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libolm/Config.in b/package/libolm/Config.in
deleted file mode 100644
index a863216d5c..0000000000
--- a/package/libolm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBOLM
-	bool "libolm"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	help
-	  libolm is an implementation of the Double Ratchet
-	  cryptographic ratchet in C++
-
-	  https://gitlab.matrix.org/matrix-org/olm
-
-comment "libolm needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
deleted file mode 100644
index a95115d2fe..0000000000
--- a/package/libolm/libolm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  1e90f9891009965fd064be747616da46b232086fe270b77605ec9bda34272a68  olm-3.2.16.tar.gz
-sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
deleted file mode 100644
index 5c8bcd1f59..0000000000
--- a/package/libolm/libolm.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libolm
-#
-################################################################################
-
-LIBOLM_VERSION = 3.2.16
-LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
-LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
-LIBOLM_LICENSE = Apache-2.0
-LIBOLM_LICENSE_FILES = LICENSE
-LIBOLM_CPE_ID_VENDOR = matrix
-LIBOLM_CPE_ID_PRODUCT = olm
-LIBOLM_INSTALL_STAGING = YES
-
-LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
-
-$(eval $(cmake-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
