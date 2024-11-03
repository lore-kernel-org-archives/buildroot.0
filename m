Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7ABD11195
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 22:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 049DE80DD3;
	Sun,  3 Nov 2024 22:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmXQK2PWEHQM; Sun,  3 Nov 2024 22:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BC480E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BC480E0E;
	Sun,  3 Nov 2024 22:13:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD081DD6
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B43740329
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANOVWba4FhSH for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 22:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EB0E40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB0E40102
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EB0E40102
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so31604775e9.1
 for <buildroot@buildroot.org>; Sun, 03 Nov 2024 14:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730672023; x=1731276823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZ4Q5w6oHv+S/LIHQf/whVq7Nk7O42+CJRGoW1nWdoI=;
 b=GIce8VMWamIANJzFE40CPXe5kBzNzOVwWS4cY3svVN8tn1K8GFi1mLZfgpWkLCGUrn
 R82UQejya3H0kft33H9jVXIm8JHwq8/D5L4hGVOhIPDlmSt/qIFY7DEQJd9tGp43sX01
 FwUoyGjxQcRE+Xt1r7jgD0auJFWqY6iRmLe2crl7iFjY41DT32nYoRqVhQQWjg9zSwKn
 yqa2j1DWfuHucrwgI+xT3DMuloHSbUNlXItE78E1i99RCWJnpVGuL7+yWCd+bi8jPEEW
 Jklk1Osy4wAN9uyQe1ixtqmn0TQcsJZ0dw6/w6wcKXo1MnlPAQco0Xs++lEywOSMKaDb
 we2A==
X-Gm-Message-State: AOJu0Yxbo45vd3eXA4eESqfOL6KRPG5M+hgyR77lgP5t2WHBrM36+U+W
 Y2SvdEFCe+gzbtlAKdQ1wikpCmHcFcstqRRHU8KgQ9JKPcCqYyAzkNZDPk9Dvx58zSzn8PTfmDR
 9
X-Google-Smtp-Source: AGHT+IFWpKcvL6HH+nedS7OLn2jtUYLC3HcVAm0UTnLietNUYOuGDs9yE3L7gjd3ZIhSmvwxUtNuDQ==
X-Received: by 2002:a05:600c:4ec7:b0:42e:93af:61c5 with SMTP id
 5b1f17b1804b1-4319acad2e4mr270475265e9.14.1730672023105; 
 Sun, 03 Nov 2024 14:13:43 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8549sm167647645e9.10.2024.11.03.14.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 14:13:42 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  3 Nov 2024 23:13:39 +0100
Message-ID: <20241103221340.1770246-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730672023; x=1731276823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ4Q5w6oHv+S/LIHQf/whVq7Nk7O42+CJRGoW1nWdoI=;
 b=Q4naPz+Y0lhe0CEk2h7l4cRubGDrRyjGHCUZS0Mcv7MBTNZmfy403ZNVYQIen5WOXH
 cAEI4thfkdVKca5vmvZ2JC0nQXXJzZ9LPwIkkkrAZw+ztHncVqNXCryyPUFscABQoYY/
 NLWAW+egX0JsxnkyG82v6y+oV1YE1zKI8TwYU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Q4naPz+Y
Subject: [Buildroot] [PATCH 1/2] package/opkg: bump to version 0.7.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the toolchain-external-bootlin version bump to 2024.05-1 the
TestOpkg fail due to a "spurious error check" fixed in opkg 0.7.0 [1].

With toolchain-external-bootlin 2024.02-1 (gcc-12) and opkg 0.6.2:

  opkg install example-snmpd-package_1.0_arm.ipk
  Installing example-snmpd-package (1.0) on root.
  Configuring example-snmpd-package.
  Starting SNMP daemon: OK
  echo $?
  0

With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.6.2:

  opkg install example-snmpd-package_1.0_arm.ipk
  echo $?
  255

The new gcc-13 seems to be confused while compiling opkg 0.6.2
without the "spurious error check" fix [1]

With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.7.0:

  opkg install example-snmpd-package_1.0_arm.ipk
  Installing example-snmpd-package (1.0) on root.
  Configuring example-snmpd-package.
  Starting SNMP daemon: OK
  echo $?
  0

Keep new ACL and XATTRS support introduced in opkg 0.6.3 disabled.

Update opkg to the new upstream url [2].

[1] https://git.yoctoproject.org/opkg/commit?id=b5cc53d56e381803d3f55019254ab7d608160ae1
[2] https://github.com/openembedded/openembedded-core/commit/6ff8b43e08840582ee8d88261cbaffd33c2304f9

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/opkg/Config.in | 2 +-
 package/opkg/opkg.hash | 2 +-
 package/opkg/opkg.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 1f6a39343f..ccea63cf7f 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_OPKG
 	  conforms to a subset of debian's policy manual regarding
 	  control files.
 
-	  https://code.google.com/archive/p/opkg/
+	  https://git.yoctoproject.org/opkg/
 
 if BR2_PACKAGE_OPKG
 
diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index c6ecefba21..3928a2ce01 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256  ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  opkg-0.6.2.tar.gz
+sha256  d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567  opkg-0.7.0.tar.gz
 # Locally calculated
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index a550543f3e..f86149a519 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.6.2
+OPKG_VERSION = 0.7.0
 OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --enable-sha256
+OPKG_CONF_OPTS = --enable-sha256 \
+	--without-acl \
+	--without-xattrs
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
