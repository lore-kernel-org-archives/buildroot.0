Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B5AC4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 17:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C39983A3C;
	Thu, 14 Dec 2023 17:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C39983A3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWT-8kkH05EX; Thu, 14 Dec 2023 17:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E1D83A15;
	Thu, 14 Dec 2023 17:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E1D83A15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9401F1BF2B1
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 17:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E1483A08
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 17:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E1483A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufijlznOsccO for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 17:53:14 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A08383A05
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 17:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A08383A05
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b72d574399so390751539f.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702576393; x=1703181193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRgKWdMIl8/atr5H9R5laRNfN3LTvf3F+JqVSWKAfgQ=;
 b=jlssVeg3PNnWio9r6vaE8OzPRBaBhmanORTqCdBGkxAIur+6SCDsuwV609lTx4SZ8j
 ho4zEmWh9GrKKkz8Dje2B287yFfqu9R/Pky7S94PmkKqMd48WdUItvfaf54H+4D6XNlh
 MJnXPvp7ugsQpsqfqDEcrnj1GpJnypmbUiwqH87SpQebZRZdkmVUFXzER1oPG6/vRFu7
 GYBvromOWIE/TfmDWXCBAFLFdaCkPapnhCgSia4O6xU9otf6C6HLRF3uMNEJAGRo+fOb
 CqGvmtF0KF2aiyO/FH/gs9tfWH9wnGAnElxjzOKwJxs+dYZHIaWOPW6Et2lg1YsQbjd4
 O8Qw==
X-Gm-Message-State: AOJu0YxpinmZGVJCUykz+Av1oPK8stAbKnhYdqa2TMqX9SjRMwtjcFSM
 Zima+d99+j1SmjoKIH0Nwj6nwY1I37JniA==
X-Google-Smtp-Source: AGHT+IEAjf1ksS52tdLRlsD1H4mVE3VnaJvuQe34Kk5UjQZbOp76dRDqNyns5iqyqX5B1WoiZAPTCg==
X-Received: by 2002:a05:6e02:1848:b0:35d:5995:798f with SMTP id
 b8-20020a056e02184800b0035d5995798fmr15150756ilv.41.1702576392997; 
 Thu, 14 Dec 2023 09:53:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 b12-20020a92340c000000b0035f5311509dsm2488580ila.44.2023.12.14.09.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 09:53:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 10:53:10 -0700
Message-Id: <20231214175310.207294-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702576393; x=1703181193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRgKWdMIl8/atr5H9R5laRNfN3LTvf3F+JqVSWKAfgQ=;
 b=Cy5HXPeAWYf1eFbxrMOERx6Ms0rS6ohwuOr9QWcpX86XRj0TRqGSxuHIQVuyssIVlm
 zz+4UCLBaiseAv8fnSxc5yGwosDHjY96eS64ntkvEJxwWpooT5u7dq87bVj+XqVgXmi/
 Iy5hI7MwskACCEJUfQr8aVxFh+c29av3wipUup/Mrf9h4o8omrIGnXqHNqCpc5xr5zNC
 jHiAIDgSAqhv07agmVzY/W9RR+Q3RxTNyT4IRtYwCHsDuYMqs1Pz5NrXEv+EUZI+XJ3q
 hXh9o7YwjowqpT31arMpGjxLxXxhTkHnjcNpdo0vJQhRjsvhH72AQQ5ytIvaNC0xtzVQ
 KoLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cy5HXPeA
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-asyncssh/Config.in            |  9 +++++++++
 package/python-asyncssh/python-asyncssh.hash |  5 +++++
 package/python-asyncssh/python-asyncssh.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-asyncssh/Config.in
 create mode 100644 package/python-asyncssh/python-asyncssh.hash
 create mode 100644 package/python-asyncssh/python-asyncssh.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..b8eaa83256 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -985,6 +985,7 @@ menu "External python modules"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
 	source "package/python-asttokens/Config.in"
+	source "package/python-asyncssh/Config.in"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
diff --git a/package/python-asyncssh/Config.in b/package/python-asyncssh/Config.in
new file mode 100644
index 0000000000..eef4478f3c
--- /dev/null
+++ b/package/python-asyncssh/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ASYNCSSH
+	bool "python-asyncssh"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  AsyncSSH: Asynchronous SSHv2 client and server library.
+
+	  http://asyncssh.timeheart.net
diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
new file mode 100644
index 0000000000..0d2a8b70c6
--- /dev/null
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asyncssh/json
+md5  4194feb9e0d17a0750f107f3445ff9f7  asyncssh-2.14.1.tar.gz
+sha256  1ac31c333a0d83c88831523245500caa814503423741b0e465339ef6da5b5e29  asyncssh-2.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
new file mode 100644
index 0000000000..d3bf092221
--- /dev/null
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-asyncssh
+#
+################################################################################
+
+PYTHON_ASYNCSSH_VERSION = 2.14.1
+PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49ddcc10567e52a8e0e1553fc936584e241d516b5682d55ea17
+PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
+PYTHON_ASYNCSSH_LICENSE = EPL-2.0
+PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
