Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3527FFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB3640636;
	Fri,  2 Jan 2026 14:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F8vNBzRXoRK; Fri,  2 Jan 2026 14:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1A140638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767362946;
	bh=EkqaJ0eTqXUB2IJbaT6nNiTXZFKg81ksOwP3SV1MgDA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zy4s2g8QR5RIufeGtu9cIlVJaDPapHiF1tjUJ0cb8HzgqEHDMQu/4tSE3eu3i46Zz
	 /V8CLq34otIUYOyVkUqZUR6wHVJJQ76iDtZXuxiumdIGiUO6a+TRphyzpgk/lynI34
	 9qclotE+J0/fV2vmjl1k3Mom2TRHZGgm5nZ1aoD2cS97pj6Aos4HfabH0x9sjNiRuM
	 G9mjG+dvaMqMAV72gulOuo0eTYJAXQIpN2ocJN01cRi2hJrqWZGEXCdVqTBykciXwG
	 ddIvM0FHekoaQfzlcjrydWMYW45vYvkoV0T1Gx4Al5d6GUZ8+F8EL53ViUOIxBb3yY
	 PKdRi3R04SrTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1A140638;
	Fri,  2 Jan 2026 14:09:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D84351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA87640638
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlA7-ZYYBHJy for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05F9340636
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05F9340636
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05F9340636
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36FF9A4C2A6E;
 Fri,  2 Jan 2026 15:08:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfp2-000000006rb-3LVr;
 Fri, 02 Jan 2026 14:08:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:08:04 +0100
Message-ID: <20260102140805.166641-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102140805.166641-1-bernd@kuhls.net>
References: <20260102140805.166641-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767362894;
 bh=WAiXQOOShtgeJ+ljZkVucF8j3wPG6LmBxDU4z5vgj3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TYmHl5as9jM/FskL+phLC+Oycz7oB90F+YYyJLimwH1LaUBgDik8NljXchcT8wDo3
 5jT2yXpWiVvIha7/+WvBXfEYnXT+UNxMWZJH8wxV3uPox+wl0t9MP+TVcWDFnkd7xf
 sqycGcg6iKZUcN3+nw2FonxBAuWslMhN/uy+puhpne9fvgHK0V06r92SQdZ2TNqVbU
 NMNdSo3iJtqLeTY1QjDDWpEc5YZVbovVWI73xVjiY/+ncv9c1IaaXAcujCFtg+Sy6J
 0wn81iwsEQXU4nKr2+F60m+r7fN2ePf6ZszwmkEhj/is/iu2gXXOwGfvGkFWWD+lc7
 8aBwF9rr2VhTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TYmHl5as
Subject: [Buildroot] [PATCH v2 6/6] package/python3: bump version to 3.14.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased all patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...e-the-build-of-pyc-files-conditional.patch | 14 ++++++----
 .../0002-Add-an-option-to-disable-pydoc.patch | 18 ++++++------
 .../0003-Add-an-option-to-disable-IDLE.patch  | 18 ++++++------
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch | 12 ++++----
 ...option-to-disable-the-sqlite3-module.patch | 16 ++++++-----
 ...d-an-option-to-disable-the-tk-module.patch | 28 +++++++++----------
 ...-option-to-disable-the-curses-module.patch | 16 ++++++-----
 .../0008-Add-an-option-to-disable-expat.patch | 14 ++++++----
 package/python3/python3.hash                  |  8 +++---
 package/python3/python3.mk                    |  4 +--
 10 files changed, 81 insertions(+), 67 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 30ad4146c5..dbc3c60d87 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -15,16 +15,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 7 +++++++
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a7dc9709d62..a1d460b36f4 100644
+index 08ad5f4921d..486a35ed99b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2570,6 +2570,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2812,6 +2812,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -32,7 +34,7 @@ index a7dc9709d62..a1d460b36f4 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2579,6 +2580,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2821,6 +2822,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -41,10 +43,10 @@ index a7dc9709d62..a1d460b36f4 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 597a44b331a..edac73ec5d3 100644
+index bd4446e9488..ad0781f9ee6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1513,6 +1513,13 @@ fi
+@@ -1533,6 +1533,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
@@ -59,5 +61,5 @@ index 597a44b331a..edac73ec5d3 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 6692561971..294520f815 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -18,16 +18,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a1d460b36f4..81f3fd54ee4 100644
+index 486a35ed99b..c3732bedb30 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2281,7 +2281,9 @@ bininstall: commoninstall altbininstall
+@@ -2513,7 +2513,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -37,7 +39,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2331,7 +2333,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2564,7 +2566,6 @@ LIBSUBDIRS=	asyncio \
  		logging \
  		multiprocessing multiprocessing/dummy \
  		pathlib \
@@ -45,7 +47,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2490,6 +2491,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2731,6 +2732,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -56,7 +58,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2717,7 +2722,9 @@ libainstall: all scripts
+@@ -2959,7 +2964,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -67,10 +69,10 @@ index a1d460b36f4..81f3fd54ee4 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index edac73ec5d3..7ed4fa578f3 100644
+index ad0781f9ee6..00d2b54ead5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4749,6 +4749,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4789,6 +4789,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -84,5 +86,5 @@ index edac73ec5d3..7ed4fa578f3 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index afef612d30..3a386b7a29 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -17,16 +17,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 81f3fd54ee4..2d067730633 100644
+index c3732bedb30..2197bb18434 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2279,7 +2279,9 @@ bininstall: commoninstall altbininstall
+@@ -2511,7 +2511,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -36,7 +38,7 @@ index 81f3fd54ee4..2d067730633 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2327,7 +2329,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2560,7 +2562,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -44,7 +46,7 @@ index 81f3fd54ee4..2d067730633 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2495,6 +2496,10 @@ ifeq (@PYDOC@,yes)
+@@ -2736,6 +2737,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -55,7 +57,7 @@ index 81f3fd54ee4..2d067730633 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2721,7 +2726,9 @@ libainstall: all scripts
+@@ -2963,7 +2968,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -66,10 +68,10 @@ index 81f3fd54ee4..2d067730633 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 7ed4fa578f3..d5dac4bf8bc 100644
+index 00d2b54ead5..5395e82384b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7927,6 +7927,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -8189,6 +8189,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -83,5 +85,5 @@ index 7ed4fa578f3..d5dac4bf8bc 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index c52ff62831..faf990430c 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -11,12 +11,14 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 13 ++++++-------
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d5dac4bf8bc..6635aaa134d 100644
+index 5395e82384b..ec9a24c5311 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
@@ -32,9 +34,9 @@ index d5dac4bf8bc..6635aaa134d 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7595,13 +7601,6 @@ AS_VAR_IF([ac_cv_libatomic_needed], [yes],
-            LIBATOMIC=${LIBATOMIC-"-latomic"}])
- _RESTORE_VAR([CPPFLAGS])
+@@ -7701,13 +7707,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
+ fi
+ AC_SUBST([_PYTHREAD_NAME_MAXLEN])
  
 -
 -# stdlib
@@ -47,5 +49,5 @@ index d5dac4bf8bc..6635aaa134d 100644
  dnl Modules that are not available on some platforms
  AS_CASE([$ac_sys_system],
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index df79837145..77c2f22bc5 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -14,24 +14,26 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2d067730633..a45a76cce45 100644
+index 2197bb18434..c8f7ab1e6a9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2336,7 +2336,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2569,7 +2569,6 @@ LIBSUBDIRS=	asyncio \
  		pathlib \
  		re \
  		site-packages \
 -		sqlite3 \
+ 		string \
  		sysconfig \
  		tkinter \
- 		tomllib \
-@@ -2500,6 +2499,10 @@ ifeq (@IDLE@,yes)
+@@ -2741,6 +2740,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -43,10 +45,10 @@ index 2d067730633..a45a76cce45 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 6635aaa134d..8153b738b2f 100644
+index ec9a24c5311..e8e201206bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4755,6 +4755,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4795,6 +4795,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -61,5 +63,5 @@ index 6635aaa134d..8153b738b2f 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index e67f06f78c..b928cd9435 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -11,8 +11,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
@@ -25,34 +25,34 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a45a76cce45..76d67ce7185 100644
+index c8f7ab1e6a9..2c91d0dda71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2337,7 +2337,6 @@ LIBSUBDIRS=	asyncio \
- 		re \
+@@ -2571,7 +2571,6 @@ LIBSUBDIRS=	asyncio \
  		site-packages \
+ 		string \
  		sysconfig \
 -		tkinter \
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2445,7 +2444,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_pydoc \
+@@ -2681,7 +2680,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pyrepl \
+ 		test/test_string \
  		test/test_sqlite3 \
 -		test/test_tkinter \
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2467,7 +2465,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2703,7 +2701,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
 -		test/test_ttk \
  		test/test_unittest \
- 		test/test_unittest/testmock \
- 		test/test_warnings \
-@@ -2489,6 +2486,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_unittest/namespace_test_pkg \
+ 		test/test_unittest/namespace_test_pkg/bar \
+@@ -2730,6 +2727,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index a45a76cce45..76d67ce7185 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 8153b738b2f..0cf06a50c71 100644
+index e8e201206bc..840976ec1bd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4768,6 +4768,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4808,6 +4808,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -83,5 +83,5 @@ index 8153b738b2f..0cf06a50c71 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 05bb126ba7..729cb5d624 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -13,24 +13,26 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 76d67ce7185..bfb6cb65354 100644
+index 2c91d0dda71..fb11e416731 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2322,7 +2322,6 @@ LIBSUBDIRS=	asyncio \
- 		concurrent concurrent/futures \
+@@ -2555,7 +2555,6 @@ LIBSUBDIRS=	asyncio \
+ 		concurrent concurrent/futures concurrent/interpreters \
  		csv \
  		ctypes ctypes/macholib \
 -		curses \
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2491,6 +2490,10 @@ LIBSUBDIRS += tkinter
+@@ -2732,6 +2731,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -42,10 +44,10 @@ index 76d67ce7185..bfb6cb65354 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 0cf06a50c71..0895dc57808 100644
+index 840976ec1bd..1d7ba91ccc9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4762,6 +4762,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4802,6 +4802,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
@@ -60,5 +62,5 @@ index 0cf06a50c71..0895dc57808 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 8f3143d61b..4093d6fa76 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -19,16 +19,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in |  5 ++++-
  configure.ac    | 24 +++++++++++++-----------
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index bfb6cb65354..7a662ea4b32 100644
+index fb11e416731..c261b3f9cd7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2342,7 +2342,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2576,7 +2576,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -36,7 +38,7 @@ index bfb6cb65354..7a662ea4b32 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2508,6 +2507,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2749,6 +2748,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -48,10 +50,10 @@ index bfb6cb65354..7a662ea4b32 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 0895dc57808..34e4d5dd244 100644
+index 1d7ba91ccc9..3980548b253 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4058,17 +4058,19 @@ LIBS="$withval $LIBS"
+@@ -4065,17 +4065,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
@@ -83,5 +85,5 @@ index 0895dc57808..34e4d5dd244 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fddfcc1a4d..b71f6e7deb 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31311/
-md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
+# From https://www.python.org/downloads/release/python-3142/
+md5  19a31b2838db3b53f9f2db8782bf8773  Python-3.14.2.tar.xz
 # Locally computed
-sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
-sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
+sha256  ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9  Python-3.14.2.tar.xz
+sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0690678c04..48a76bea37 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
+PYTHON3_VERSION_MAJOR = 3.14
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
