Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B243C61D97
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BE28404B0;
	Sat, 25 Nov 2023 01:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE28404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnVCz3q7ofxr; Sat, 25 Nov 2023 01:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E34D4031F;
	Sat, 25 Nov 2023 01:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E34D4031F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB041BF3B5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4448A6150E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4448A6150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMIiE23sbgaA for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:38:16 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41E4761506
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E4761506
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35b048479b2so8023535ab.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700876295; x=1701481095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0J4X4/Ke1Dq601cizTUUpvoWZvk2bihBoJFWbxoDMI=;
 b=ddSNGjU+lR/k3FyfIIHHcU9WHd8IDoymeinTJEXm3VHh2rqJ2YIbszHVZL68stqpzP
 JioQHRwj0uRKZCpDLY1Qm2Pk23jd9ygNr2uPZBK0pjmHtG1y3rVrSN+DRgAG/PQfAsTa
 /tadYKgQ553Fhb9UR8nF79OejznXNFwgRzaj1p+ej94sM1e3xasE+uswhdHlx+i9/LVy
 3fgqgBLpOB49QNH9EmkbGKHefGLS7v+rQwhLi3/t4bkqRwGUV68OULltaGmsXlqN6lQU
 wyT41+Ek3yp5FVsa+F6PcJ8hUHwhZkNzRU41pxNcQsHUHVIistzSWUK5PIxde6LmEH9E
 v9Wg==
X-Gm-Message-State: AOJu0Yy8YtK+qEAGzXDJ2m6CuqogmdJnpRxfy5/nw1RHQFMlqtarxra6
 LfWKygAksbjJlBDLxlAE6y12zg+wPMc=
X-Google-Smtp-Source: AGHT+IF23kFsqqY4fuS9PUByZ41C5A9mn07K41dX5/tCrDSAq9J9gRe7vK024aKJzAGwpMPk+zmv/Q==
X-Received: by 2002:a05:6602:3684:b0:7a9:96aa:e019 with SMTP id
 bf4-20020a056602368400b007a996aae019mr36277iob.13.1700876294674; 
 Fri, 24 Nov 2023 17:38:14 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 g1-20020a028501000000b004645642818esm1139552jai.35.2023.11.24.17.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:38:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:38:07 -0700
Message-Id: <20231125013807.213822-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125013807.213822-1-james.hilliard1@gmail.com>
References: <20231125013807.213822-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700876295; x=1701481095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0J4X4/Ke1Dq601cizTUUpvoWZvk2bihBoJFWbxoDMI=;
 b=aYa+Y9QxiIG9PZb2nF1OE1L0z+/cw806WC6xMjMb+dhf1xMnA3UMKe9iR7CAesRtc8
 Gm5IHqiBrwPRQ+vevnTR1yhInDuLjkkrq7oGguEikudSiQxrtR8oKBnJR0RCKON5nnYg
 l7paRAMljDvRWfxVwj1u1YQXvFn1nYbaSaYeg7KyuDWxGKYzCbaoSIYc2ni8aPAvPt1C
 jWPvI5WxNaEVc5zBS2qPzaEmg8OKUbSijBxj4HMQZJ5WJ9jMnO6bJ7Hr2N3Mry1VAcGX
 FQaVMD617sBGXuCQrNQDbdomv52A3yArq9U4x84wsfOm4GK28WdVJGmlSFdONhUvT6Rh
 XWhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aYa+Y9Qx
Subject: [Buildroot] [PATCH 4/4] package/python-matplotlib: bump to version
 3.8.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-contourpy runtime dependency.

Add new python-pybind dependency.

Add new host-python-setuptools-scm build dependency.

Update setup.cfg to new mplsetup.cfg install location.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-matplotlib/Config.in              | 2 ++
 package/python-matplotlib/python-matplotlib.hash | 5 +++--
 package/python-matplotlib/python-matplotlib.mk   | 8 +++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 8a9281b8e7..81efda7b44 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -6,7 +6,9 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_CONTOURPY # runtime
 	select BR2_PACKAGE_PYTHON_CYCLER
+	select BR2_PACKAGE_PYTHON_PYBIND
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index 0d7117811c..c2fb907e2c 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/matplotlib/#files
-sha256  fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/matplotlib/json
+md5  72896b8c240903ebddc47be6451d813b  matplotlib-3.8.2.tar.gz
+sha256  01a978b871b881ee76017152f1f1a0cbf6bd5f7b8ff8c96df0df1bd57d8755a1  matplotlib-3.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 650aac9bd9..4fd2b5f432 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.4.3
+PYTHON_MATPLOTLIB_VERSION = 3.8.2
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/21/37/197e68df384ff694f78d687a49ad39f96c67b8d75718bc61503e1676b617
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/fb/ab/38a0e94cb01dacb50f06957c2bed1c83b8f9dac6618988a37b2487862944
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
@@ -14,8 +14,10 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-certifi \
 	host-python-numpy \
+	host-python-setuptools-scm \
 	libpng \
 	python-cycler \
+	python-pybind \
 	qhull
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
 
@@ -24,7 +26,7 @@ PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
 endif
 
 define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/setup.cfg
+	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/mplsetup.cfg
 endef
 PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
