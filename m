Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FD3C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC5854170A;
	Thu, 26 Oct 2023 09:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC5854170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xP0Hx4PCXehk; Thu, 26 Oct 2023 09:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B00F94177B;
	Thu, 26 Oct 2023 09:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00F94177B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 387B01BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3F841773
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3F841773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUbd1Z__HgQE for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:20 +0000 (UTC)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4096541712
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4096541712
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso100098266b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312438; x=1698917238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U++S3A4Rm9lYDJFzILAj0vyV/b7YiLv1/c2cBNZRPcQ=;
 b=jxSb18o2FSPbbgczLEMH2AFINJPZoX1wbKuAs7prQ3Qz5X4sPkFL0J46U+Wc3dVgyp
 gWsZugf6upudIX7Nu9y+YSdS/y9esFM1bYR30d2Gh6ic8dsjBHU6eCl65LnGx88S3Xoq
 73/lQTv0o2lAIgd92gE4J3Vt7kEnG1Omwi33mAZICQYXFIWUmBnnyzjuUm+lSGOHzr4D
 6hVr+4lmRtUqCkP8V74bjblzNbs8TQlqg1Kchr40DVsJmYifCiSqSLn1mGvZ26/OLM+0
 dXf8CoryXQA3IBY9snCBsEr6p4mfb0B1rIiGFlQDZmcSJfbENb09TqU9IK7tOz0Yet6G
 DfiQ==
X-Gm-Message-State: AOJu0YyD/0X3pAz22sfM1vl2MBsmwfmqajKLbExbvtCcjQWlbnfjX7zu
 Ik5aukV2nPX7FjN1Z8hiY1wngkHwpQc7rKPPSESmXUFIXC7WchYY
X-Google-Smtp-Source: AGHT+IGTSdLmtBofAVcZrbsTa65W++ZVbXxLjj7vTNiqLmuassOWzSocA36/xeXivVYvwoKcgrgDxA==
X-Received: by 2002:a17:906:4fca:b0:9bf:9f04:e63b with SMTP id
 i10-20020a1709064fca00b009bf9f04e63bmr15603767ejw.23.1698312437955; 
 Thu, 26 Oct 2023 02:27:17 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:45 +0200
Message-ID: <20231026092701.12345-15-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312438; x=1698917238;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U++S3A4Rm9lYDJFzILAj0vyV/b7YiLv1/c2cBNZRPcQ=;
 b=camfpwaOufeGMwXIu3V96qIMYytihKJnRFpoLK4faLfMNVmd73lbRSdO330Gqr83ZR
 78Az/t7/Fd+ZHF6VqgqkeSGSheR6w/2GfzMnOuJcgI3yjk3YE6P+T1Hnr88wLLL3pugZ
 Z940JtiegrU4nlwimIKroxFdyVO3r/2TbcJWk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=camfpwaO
Subject: [Buildroot] [PATCH 14/30] package/python3: Remove infrastructure to
 disable the build of certain extensions
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

All modules are now excluded using features of the upstream build system,
partly by backported patches from Python 3.12 branch.

Renumber remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |   1 -
 ...re-to-disable-the-build-of-certain-e.patch | 108 ------------------
 ...-header-paths-for-cross-compilation.patch} |   0
 ...ok-in-usr-lib-termcap-for-libraries.patch} |   0
 ...h => 0005-Don-t-add-multiarch-paths.patch} |   0
 ...> 0006-Abort-on-failed-module-build.patch} |   0
 ...tch => 0007-Serial-ioctl-workaround.patch} |   0
 ...-shebang-of-Python-scripts-for-cros.patch} |   0
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 ...0010-Add-an-option-to-disable-pydoc.patch} |   0
 ...11-Add-an-option-to-disable-lib2to3.patch} |   0
 ... 0012-Add-an-option-to-disable-IDLE.patch} |   0
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...fix-building-on-older-distributions.patch} |   0
 ...p-CC-print-multiarch-output-for-mus.patch} |   0
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 16 files changed, 109 deletions(-)
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (100%)
 rename package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch => 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (100%)
 rename package/python3/{0006-Don-t-add-multiarch-paths.patch => 0005-Don-t-add-multiarch-paths.patch} (100%)
 rename package/python3/{0007-Abort-on-failed-module-build.patch => 0006-Abort-on-failed-module-build.patch} (100%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0007-Serial-ioctl-workaround.patch} (100%)
 rename package/python3/{0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch => 0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (100%)
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0010-Add-an-option-to-disable-pydoc.patch} (100%)
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0011-Add-an-option-to-disable-lib2to3.patch} (100%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0012-Add-an-option-to-disable-IDLE.patch} (100%)
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0013-python-config.sh-don-t-reassign-prefix.patch} (100%)
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0015-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4c35220d42..c986a242e1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1153,7 +1153,6 @@ package/python-web2py/S51web2py Shellcheck Variables
 package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch Upstream
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch Upstream
-package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch Upstream
 package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch Upstream
 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch Upstream
 package/python3/0006-Don-t-add-multiarch-paths.patch Upstream
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
deleted file mode 100644
index 5b3911374e..0000000000
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 16:33:22 -0800
-Subject: [PATCH] Add infrastructure to disable the build of certain extensions
-
-Some of the extensions part of the Python core have dependencies on
-external libraries (sqlite, tk, etc.) or are relatively big and not
-necessarly always useful (CJK codecs for example). By extensions, we
-mean part of Python modules that are written in C and therefore
-compiled to binary code.
-
-Therefore, we introduce a small infrastructure that allows to disable
-some of those extensions. This can be done inside the configure.ac by
-adding values to the DISABLED_EXTENSIONS variable (which is a
-word-separated list of extensions).
-
-The implementation works as follow :
-
- * configure.ac defines a DISABLED_EXTENSIONS variable, which is
-   substituted (so that when Makefile.pre is generated from
-   Makefile.pre.in, the value of the variable is substituted). For
-   now, this DISABLED_EXTENSIONS variable is empty, later patches will
-   use it.
-
- * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
-   variables passed in the environment when calling the setup.py
-   script that actually builds and installs those extensions.
-
- * setup.py is modified so that the existing "disabled_module_list" is
-   filled with those pre-disabled extensions listed in
-   DISABLED_EXTENSIONS.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-then extended by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2957c8e5a1..c1cfb96767 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -239,6 +239,8 @@ FILEMODE=	644
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -739,6 +741,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
- 	    *) quiet="";; \
- 	esac; \
- 	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
-+		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2228,7 +2231,8 @@ libainstall: all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: all
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
-+	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
-+		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 830885fcb3..5a6a1fe608 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
- ],
- [AC_MSG_RESULT(no)])
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-diff --git a/setup.py b/setup.py
-index 15d0d4576a..e496ee34c2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -56,7 +56,10 @@
- 
- 
- # This global variable is used to hold the list of modules to be disabled.
--DISABLED_MODULE_LIST = []
-+try:
-+    DISABLED_MODULE_LIST = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    DISABLED_MODULE_LIST = list()
- 
- # --list-module-names option used by Tools/scripts/generate_module_names.py
- LIST_MODULE_NAMES = False
--- 
-2.34.1
-
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 100%
rename from package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
rename to package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 100%
rename from package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
rename to package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0005-Don-t-add-multiarch-paths.patch
similarity index 100%
rename from package/python3/0006-Don-t-add-multiarch-paths.patch
rename to package/python3/0005-Don-t-add-multiarch-paths.patch
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0006-Abort-on-failed-module-build.patch
similarity index 100%
rename from package/python3/0007-Abort-on-failed-module-build.patch
rename to package/python3/0006-Abort-on-failed-module-build.patch
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0007-Serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/0008-Serial-ioctl-workaround.patch
rename to package/python3/0007-Serial-ioctl-workaround.patch
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
similarity index 100%
rename from package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
rename to package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 100%
rename from package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0010-Add-an-option-to-disable-pydoc.patch
similarity index 100%
rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0010-Add-an-option-to-disable-pydoc.patch
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0011-Add-an-option-to-disable-lib2to3.patch
similarity index 100%
rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0011-Add-an-option-to-disable-lib2to3.patch
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0012-Add-an-option-to-disable-IDLE.patch
similarity index 100%
rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0012-Add-an-option-to-disable-IDLE.patch
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0013-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0013-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0015-fix-building-on-older-distributions.patch
similarity index 100%
rename from package/python3/0028-fix-building-on-older-distributions.patch
rename to package/python3/0015-fix-building-on-older-distributions.patch
diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 100%
rename from package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
