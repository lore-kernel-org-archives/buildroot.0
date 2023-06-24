Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D049EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 22:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D085740B42;
	Sat, 24 Jun 2023 22:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D085740B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8MesZPIak8R; Sat, 24 Jun 2023 22:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F271D40AB0;
	Sat, 24 Jun 2023 22:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F271D40AB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C45C1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA36040AB0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA36040AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCQwpaDxw6F9 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 22:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35152405ED
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35152405ED
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:00:38 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3427426f2ddso7953655ab.3
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687644037; x=1690236037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5jFK0qIFzd1jm8F3g/BuhQD5CfM8Z5KwhWeFqbmOBg=;
 b=K+CP7pHBH/tADzloyCBpkzNrLFX7dGPc8DqbKUfInUAyP+zlsaMMky/xjJDacShy8B
 BvaCoALchTI0NgbYNRbOuEbMqnSj0ixBDGwHv9PZa9fjGDzUpml9A6Z94IPBFL2AD6ku
 J899BIURDcC9+N/uQUCuhYUCQFobFzncrzs+IDh7VaOxuCc4JGuKb8aLYIiKGtOlWaAt
 R0q2RXlVME71eiY5MEZ45f5vnjIvr4SYtnkkgc0X0MLLNpPPQPoLrG260PCTLItRbuip
 4M28oXuE3E/nR1HtSuTFVlyQizgyFowZB6uzc9MQ57tTVJcpnCwBan5VF0VhwonWE5ui
 rkzQ==
X-Gm-Message-State: AC+VfDxLITOl5olN9X7YfmxLxy+n02xIhnI3PIb5HymLQW8SWA0qV1ZT
 gvernot9ct/xrr0DlqJcyoKNTne1xSU=
X-Google-Smtp-Source: ACHHUZ4IYEFPmJ6zsqiaqgexFqCAnT3lr/aQ9fMfn1eFPZPq1GwpA2jsAbU7vRgV58J/GphhZwXA7A==
X-Received: by 2002:a05:6e02:142:b0:340:8557:4a3d with SMTP id
 j2-20020a056e02014200b0034085574a3dmr19900857ilr.22.1687644036974; 
 Sat, 24 Jun 2023 15:00:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 v10-20020a92d24a000000b0034202d05fadsm805384ilg.72.2023.06.24.15.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jun 2023 15:00:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:00:30 -0600
Message-Id: <20230624220030.492587-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687644037; x=1690236037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y5jFK0qIFzd1jm8F3g/BuhQD5CfM8Z5KwhWeFqbmOBg=;
 b=kRJ6BD0ueXkriocFZ7HhHcNpz9OQi7TEZ/LTQpgnNGgi/X7IWjaP+cuw0v6XomdNMu
 jimlltyv9oJivghOxjhtL/3WVls2lQgiHMT3wYM9cgVqm5fqb52YMDmdOj4dnk8ZNvKS
 6bCg6V/8M/cdpJO6jgJJrAdGFKtqcKwnQ2B44X9R4IHpn4eWmL96rsLxUBCo2OW649yI
 CdUyAuJ8aOG8k1SoebZVPcBnH55f/k60kkOsGPjEekQQB0q/DT0g01R+Nie5vBxHLWRi
 vfg9tJP1cKgbMfLJcP3Dr3wKpGnx34I1Xk+sMhQr+IO+fW4MaeZAWhHLE1BQVtsoDzz3
 +vOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kRJ6BD0u
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: switch back to local
 setuptools distutils
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We overrode the default in 4386bbdf0895dbb35e02c25f42603bae9af64451 to
work around target shebang bug, as this issue no longer appears to be
present lets revert back to the local version as this is what will be
use in the future when distutils is removed from the python stdlib.

Tested with:
$ support/testing/run-tests -d dl -o output_folder -k tests.package.test_ipython.TestIPythonPy3
15:43:26 TestIPythonPy3                           Starting
15:43:27 TestIPythonPy3                           Building
15:49:35 TestIPythonPy3                           Building done
Downloading to /home/buildroot/buildroot/dl/tmp_iyk_fn6
Renaming from /home/buildroot/buildroot/dl/tmp_iyk_fn6 to /home/buildroot/buildroot/dl/kernel-versatile-5.10.7
Downloading to /home/buildroot/buildroot/dl/tmpokk23l2z
Renaming from /home/buildroot/buildroot/dl/tmpokk23l2z to /home/buildroot/buildroot/dl/versatile-pb-5.10.7.dtb
15:50:04 TestIPythonPy3                           Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 398.709s

OK

$ head -n 1 output_folder/TestIPythonPy3/target/usr/bin/ipython
#!/usr/bin/python

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c15a168f60..fcb8fa0a99 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -55,8 +55,7 @@ HOST_PKG_PYTHON_ENV = \
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
 	$(PKG_PYTHON_ENV) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
+	LDSHARED="$(TARGET_CROSS)gcc -shared"
 
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
@@ -75,16 +74,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	$(HOST_PKG_PYTHON_ENV) \
-	SETUPTOOLS_USE_DISTUTILS=stdlib
+	$(HOST_PKG_PYTHON_ENV)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(PKG_PYTHON_ENV) \
-	SETUPTOOLS_USE_DISTUTILS=stdlib
+	$(PKG_PYTHON_ENV)
 
 PKG_PYTHON_SETUPTOOLS_CMD = \
 	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
@@ -105,8 +102,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(HOST_PKG_PYTHON_ENV) \
-	SETUPTOOLS_USE_DISTUTILS=stdlib
+	$(HOST_PKG_PYTHON_ENV)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
