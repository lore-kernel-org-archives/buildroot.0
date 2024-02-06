Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD6BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 001B440189;
	Tue,  6 Feb 2024 15:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 001B440189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjVTVxaojYWh; Tue,  6 Feb 2024 15:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF9D5408BC;
	Tue,  6 Feb 2024 15:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF9D5408BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 262821BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F343C60BA9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F343C60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbCV8wSK8XAD for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:51:48 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3911860B1D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3911860B1D
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so3758512f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 07:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707234706; x=1707839506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+DtqU0vplwVD+WgY3H42SZ0qgkBsWupy5i8BxIWResA=;
 b=AGFkMarxbv9Ng0xJFyxVn/1vf+ditfCEpf03EqJImGzWimR1xvkAwJgQ1ReXVgpvry
 v99Qh8a+lRtIeY1ee7/7FJ4zxugcytGZhllq1xPlNDMOmGdqRz7irAJkbkMaPjYsDjeR
 fcef8iHEgjSoVyhffmPx9keFED4T5MyVXBTEu3FLrECfIpqu6gjALybI8BrllPAcEOXT
 1IX+D0MZrIHBSk76viybnWUpk+KqIGhV8rwtdKTYadHGmz/6T3hODvwMn5aM7fNXgVeM
 FRQ/XNQjSO3a34sfKBV4U+keS+VX54Lnqn/gh1C3j2mpe6GYCzLxUQ42ekBfvK8EcH2P
 CJmQ==
X-Gm-Message-State: AOJu0YwZi7djiGQwfFRtbFB+Tc2OfAYLAfNYYKwZGCMaO20/OGlKZyHU
 XlzIKiuukY36PbWxsGukF8kB322FnQSic9o8oC9b75VlJ83VDneOa/qrj1PArrwapj2nvMLg0Dp
 443M=
X-Google-Smtp-Source: AGHT+IENLjvrrkFxxnNFY8YcVXR65xx0kbi48aHzaqjI1OMJV/4ZFXpuC7Lpp/MKu57ir/VxliVXhw==
X-Received: by 2002:adf:f342:0:b0:33b:14e8:c97d with SMTP id
 e2-20020adff342000000b0033b14e8c97dmr1614092wrp.48.1707234705967; 
 Tue, 06 Feb 2024 07:51:45 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 q29-20020adfab1d000000b0033b46111d7csm2048627wrc.6.2024.02.06.07.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 07:51:45 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 16:51:39 +0100
Message-ID: <20240206155140.2351424-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707234706; x=1707839506;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+DtqU0vplwVD+WgY3H42SZ0qgkBsWupy5i8BxIWResA=;
 b=xtdXHiViB9Q1JAz2DVE+BsHye5KfpyEV65jmALs/r3ClKW0bxh9OMczmaKjh8hk+rf
 yWtoCbai4dJMB12L+ofb2VUg4pQD0LH+7SZjQPQyGHNEM0j5zi619F5e+mP6X80q3Q0e
 XgPaPuDv9qXZ5Bltt/fJGEGJALyzHorW1GNV+eJJAVljbBixCwMLDqlwOtwlax7s+rKS
 79LfwiL8XAJq93zG4IGKkERR0/SEGwkATWhNO3QYt06pK4dZXLtQu6HgsKLskI580mII
 ni+JZ0KjHflJitNJ73HXn0oLfragRiiUr6j5HN7QSJykpjLZ0+apYqzwbY6Ny22n7n+K
 YEqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xtdXHiVi
Subject: [Buildroot] [PATCH 1/2] package/python-bitarray: new package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is needed at runtime by python-bitstring since
4.1.1 already.

Note: the License is under Python-2.0 but Python Software Foundation ("PSF")
has been remplaced by the author of bitarray Ilan Schnell.

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Triple checked the license type with other distribution:
https://salsa.debian.org/python-team/packages/python-bitarray/-/blob/master/debian/copyright?ref_type=heads
https://src.fedoraproject.org/rpms/python-bitarray/blob/rawhide/f/python-bitarray.spec
https://aur.archlinux.org/packages/python-bitarray
---
 package/Config.in                            |  1 +
 package/python-bitarray/Config.in            |  6 ++++++
 package/python-bitarray/python-bitarray.hash |  5 +++++
 package/python-bitarray/python-bitarray.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-bitarray/Config.in
 create mode 100644 package/python-bitarray/python-bitarray.hash
 create mode 100644 package/python-bitarray/python-bitarray.mk

diff --git a/package/Config.in b/package/Config.in
index 728bd03b80..708dc376b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1007,6 +1007,7 @@ menu "External python modules"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bidict/Config.in"
+	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-blinker/Config.in"
diff --git a/package/python-bitarray/Config.in b/package/python-bitarray/Config.in
new file mode 100644
index 0000000000..38d685f4fd
--- /dev/null
+++ b/package/python-bitarray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BITARRAY
+	bool "python-bitarray"
+	help
+	  efficient arrays of booleans -- C extension.
+
+	  https://github.com/ilanschnell/bitarray
diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
new file mode 100644
index 0000000000..d91a28af20
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bitarray/json
+md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
+sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
new file mode 100644
index 0000000000..f86320c112
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bitarray
+#
+################################################################################
+
+PYTHON_BITARRAY_VERSION = 2.9.2
+PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
+PYTHON_BITARRAY_SETUP_TYPE = setuptools
+PYTHON_BITARRAY_LICENSE = Python-2.0
+PYTHON_BITARRAY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
