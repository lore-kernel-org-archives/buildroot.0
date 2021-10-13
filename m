Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BE4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7362860E53
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7362860E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B3983077;
	Wed, 13 Oct 2021 18:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nu_BrRDFF9Ak; Wed, 13 Oct 2021 18:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB8F830E6;
	Wed, 13 Oct 2021 18:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 329121BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28692405FC
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9B2mCpciy2VE for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:06:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6148740630
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:06:57 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r201so3110710pgr.4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBT1Ex9Ff1WKuWuKnsjVT/NC47rgJquk27SdC15RRVA=;
 b=I+Rx24Ds8cbhe4erHfywwLEv8o0DLQy25TooDnyKNb7HL6pfBGSfo61VVGa5yfq/Su
 fojQzUDpXOmJuohf6xnpmM5KQfTdcyqXza1RZkGVMAncSIqaxqP+3ZOqLmOuUlKmfLBU
 rUt/TYFNUcFQqZD14N66526CeeBJT5+OaVfP2cRIpKNfkzzTE6XzsaFEqoK8NusnWnGA
 hafblyyMe+cLcSQTdn20CbIIDKPXlmtZLpnnKMCi0tJ4+RDr/z/ObeYaMe6x19NCuX/Y
 XsQpwPXUs0knKcCB1RDS/+ncLWOZIzX1rzTjWRJeV9gf85cUopD3aG3kYcbW/MxGQq9M
 85mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBT1Ex9Ff1WKuWuKnsjVT/NC47rgJquk27SdC15RRVA=;
 b=YWeMGBDSkZUZvyrnFODzTPgFaUyA3s04SR1w1Zj2jekl5dTsUOAOG/9iTfppj06wt3
 VxzQowPpe/0NjFyFQEirLyFOKQypohTP4pm/rljWUPBMmn8FmyVy8bGnvceZ4rFmZ+QV
 jRPgGjbQZywIzt2DHjR+iW6wYxiP+Qabq9RpoODOBVzTi738jE4t6kMn7h0QnRfqO77f
 PTUzFaYl6ua51tKkQ8rQqxvwBtpc2nk7ws9oIVq/RhoxKLCAPsgB5AlcjActItosARoW
 CsGb95qrNYCx57XOXN5nBO1V4bTm5o3/otJ/vk2QYuItSv/lnIL3Gv/wJqeseAPNNkTk
 CAjw==
X-Gm-Message-State: AOAM5331MpEvDEpyc1aPguVwad/Aui/82Up9QJ0n4PwQfgLn3ql+ifSS
 N2dMGwZBMW1HfMvpLzpY4vVMJxLj6uw=
X-Google-Smtp-Source: ABdhPJyJv8hfdiuirJg7ub0Ppe5L6HOrJIfOTeMT0atb1w7u38OLmfh4+hDIB8hVc4xjIT8k+asQhQ==
X-Received: by 2002:a62:5209:0:b0:44c:68a7:3a61 with SMTP id
 g9-20020a625209000000b0044c68a73a61mr781932pfb.83.1634148416367; 
 Wed, 13 Oct 2021 11:06:56 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id u4sm174855pfh.147.2021.10.13.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:06:55 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 11:06:54 -0700
Message-Id: <20211013180654.2514310-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/canfestival: remove package
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Canfestival hasn't seen a patch since November of 2017, and it requires python2
to build. Remove the package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy                              |   7 +
 DEVELOPERS                                    |   1 -
 ...all-pkgconfig-module-for-canfestival.patch |  74 --------
 ...0002-allow-to-set-python-interpreter.patch | 176 ------------------
 package/canfestival/Config.in                 |  90 ---------
 package/canfestival/canfestival.hash          |   3 -
 package/canfestival/canfestival.mk            |  59 ------
 7 files changed, 7 insertions(+), 403 deletions(-)
 delete mode 100644 package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
 delete mode 100644 package/canfestival/0002-allow-to-set-python-interpreter.patch
 delete mode 100644 package/canfestival/Config.in
 delete mode 100644 package/canfestival/canfestival.hash
 delete mode 100644 package/canfestival/canfestival.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3ec48edb87..ebccd12c95 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_CANFESTIVAL
+	bool "canfestival package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is unmaintained since
+	  November 2017.
+
 config BR2_GDB_VERSION_8_3
 	bool "gdb version 8.3.x removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 643b5f1060..93091d8e7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2399,7 +2399,6 @@ F:	package/lrzip/
 
 N:	Samuel Martin <s.martin49@gmail.com>
 F:	package/armadillo/
-F:	package/canfestival/
 F:	package/cwiid/
 F:	package/flite/
 F:	package/nginx/
diff --git a/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch b/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
deleted file mode 100644
index 23f3d899f1..0000000000
--- a/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From s.martin49@gmail.com Sun Sep 28 14:59:53 2014
-Content-Type: text/plain; charset="us-ascii"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [PATCH] Install pkgconfig module for canfestival
-X-Mercurial-Node: c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-X-Mercurial-Series-Index: 1
-X-Mercurial-Series-Total: 1
-Message-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
-X-Mercurial-Series-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
-User-Agent: Mercurial-patchbomb/3.1.1
-Date: Sun, 28 Sep 2014 14:59:53 +0200
-From: Samuel Martin <s.martin49@gmail.com>
-To: canfestival-devel@lists.sourceforge.net
-Cc: Samuel Martin <s.martin49@gmail.com>
-
-# HG changeset patch
-# User "Samuel Martin" <s.martin49@gmail.com>
-# Date 1411906817 -7200
-#      Sun Sep 28 14:20:17 2014 +0200
-# Node ID c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-# Parent  7740ac6fdedc23e1ed6908d3d7db54833c88572b
-Install pkgconfig module for canfestival.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Cc: Cluadio Laurita <claudio.laurita@integrazionetotale.it>
-
-diff -r 7740ac6fdedc -r c408fdc77aa1 canfestival.pc.in
---- /dev/null	Thu Jan 01 00:00:00 1970 +0000
-+++ b/canfestival.pc.in	Sun Sep 28 14:20:17 2014 +0200
-@@ -0,0 +1,12 @@
-+PREFIX = SUB_PREFIX
-+TARGET = SUB_TARGET
-+
-+prefix=${PREFIX}
-+libdir=${prefix}/lib
-+includedir=${prefix}/include/canfestival
-+
-+Name: Canfestival
-+Description: Canfestival CANOpen library
-+Version: 1
-+Libs: -L${libdir} -lcanfestival -lcanfestival_${TARGET} -lrt -ldl -lpthread
-+Cflags: -I${includedir}
-diff -r 7740ac6fdedc -r c408fdc77aa1 configure
---- a/configure	Thu Jun 12 14:07:16 2014 +0200
-+++ b/configure	Sun Sep 28 14:20:17 2014 +0200
-@@ -813,6 +813,10 @@
-     MAKEFILES=$MAKEFILES\ drivers/$SUB_TARGET/Makefile.in
- fi
- 
-+if [ "$SUB_TARGET" = "unix" ]; then
-+    MAKEFILES=$MAKEFILES\ canfestival.pc.in
-+fi
-+
- if [ "$SUB_TARGET" = "unix" -a "$SUB_TIMERS_DRIVER" = "kernel" ]; then
- 	MAKEFILES=$MAKEFILES\
- \	examples/kerneltest/Makefile.in\
-diff -r 7740ac6fdedc -r c408fdc77aa1 src/Makefile.in
---- a/src/Makefile.in	Thu Jun 12 14:07:16 2014 +0200
-+++ b/src/Makefile.in	Sun Sep 28 14:20:17 2014 +0200
-@@ -132,9 +132,10 @@
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
- 
- install: libcanfestival.a
--	mkdir -p $(DESTDIR)$(PREFIX)/lib/
-+	mkdir -p $(DESTDIR)$(PREFIX)/lib/pkgconfig
- 	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
- 	cp libcanfestival.a $(DESTDIR)$(PREFIX)/lib/
-+	cp ../canfestival.pc $(DESTDIR)$(PREFIX)/lib/pkgconfig/
- 	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
- 
- uninstall:
-
-
diff --git a/package/canfestival/0002-allow-to-set-python-interpreter.patch b/package/canfestival/0002-allow-to-set-python-interpreter.patch
deleted file mode 100644
index bb6031658c..0000000000
--- a/package/canfestival/0002-allow-to-set-python-interpreter.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From s.martin49@gmail.com Fri Oct 10 23:43:32 2014
-Content-Type: text/plain; charset="us-ascii"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [PATCH] allow to set python interpreter
-X-Mercurial-Node: 4805f636c2317d989a5f704ba691369f41be6595
-X-Mercurial-Series-Index: 1
-X-Mercurial-Series-Total: 1
-Message-Id: <4805f636c2317d989a5f.1412977412@bobook>
-X-Mercurial-Series-Id: <4805f636c2317d989a5f.1412977412@bobook>
-User-Agent: Mercurial-patchbomb/3.1.2
-Date: Fri, 10 Oct 2014 23:43:32 +0200
-From: Samuel Martin <s.martin49@gmail.com>
-To: canfestival-devel@lists.sourceforge.net
-Cc: Samuel Martin <s.martin49@gmail.com>
-
-# HG changeset patch
-# User "Samuel Martin" <s.martin49@gmail.com>
-# Date 1412977082 -7200
-#      Fri Oct 10 23:38:02 2014 +0200
-# Node ID 4805f636c2317d989a5f704ba691369f41be6595
-# Parent  c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-allow to set python interpreter
-
-Canfestival python modules and scripts are not python3 compliant.
-
-Allow to pass the python interperter to be used to make.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -21,6 +21,9 @@
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- # 
- 
-+PYTHON ?= python
-+export PYTHON
-+
- all: objdictedit canfestival examples
- 
- examples: canfestival driver
-diff --git a/doc/manual/en/manual.tex b/doc/manual/en/manual.tex
---- a/doc/manual/en/manual.tex
-+++ b/doc/manual/en/manual.tex
-@@ -1134,6 +1134,7 @@
- 	python objdictedit.py [od files...]
- \end{verbatim}
- 
-+Note that Gnosis modules only run with python2 as interpreter.
- 
- \subsubsection{Installation and usage on Windows}
- 
-diff --git a/examples/CANOpenShell/Makefile.in b/examples/CANOpenShell/Makefile.in
---- a/examples/CANOpenShell/Makefile.in
-+++ b/examples/CANOpenShell/Makefile.in
-@@ -69,11 +69,11 @@
- 	
- CANOpenShellMasterOD.c: CANOpenShellMasterOD.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
- 
- CANOpenShellSlaveOD.c: CANOpenShellSlaveOD.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/DS401_Master/Makefile.in b/examples/DS401_Master/Makefile.in
---- a/examples/DS401_Master/Makefile.in
-+++ b/examples/DS401_Master/Makefile.in
-@@ -53,7 +53,7 @@
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/DS401_Slave_Gui/Makefile.in b/examples/DS401_Slave_Gui/Makefile.in
---- a/examples/DS401_Slave_Gui/Makefile.in
-+++ b/examples/DS401_Slave_Gui/Makefile.in
-@@ -59,7 +59,7 @@
- 
- ObjDict.c: ObjDict.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
- 
- .cpp.o:
- 	$(CXX) -c $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) `wx-config --cxxflags` $< -o $@
-diff --git a/examples/SillySlave/Makefile.in b/examples/SillySlave/Makefile.in
---- a/examples/SillySlave/Makefile.in
-+++ b/examples/SillySlave/Makefile.in
-@@ -53,7 +53,7 @@
- 	
- SillySlave.c: SillySlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterMicroMod/Makefile.in b/examples/TestMasterMicroMod/Makefile.in
---- a/examples/TestMasterMicroMod/Makefile.in
-+++ b/examples/TestMasterMicroMod/Makefile.in
-@@ -61,7 +61,7 @@
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterSlave/Makefile.in b/examples/TestMasterSlave/Makefile.in
---- a/examples/TestMasterSlave/Makefile.in
-+++ b/examples/TestMasterSlave/Makefile.in
-@@ -69,11 +69,11 @@
- 	
- TestSlave.c: TestSlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterSlaveLSS/Makefile.in b/examples/TestMasterSlaveLSS/Makefile.in
---- a/examples/TestMasterSlaveLSS/Makefile.in
-+++ b/examples/TestMasterSlaveLSS/Makefile.in
-@@ -64,15 +64,15 @@
- 	
- TestSlaveA.c: TestSlaveA.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
- 
- TestSlaveB.c: TestSlaveB.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/kerneltest/Makefile.in b/examples/kerneltest/Makefile.in
---- a/examples/kerneltest/Makefile.in
-+++ b/examples/kerneltest/Makefile.in
-@@ -79,10 +79,10 @@
- 
- TestSlave.c: TestSlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
- 
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 	
- #endif
-
-
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
deleted file mode 100644
index 8300e26582..0000000000
--- a/package/canfestival/Config.in
+++ /dev/null
@@ -1,90 +0,0 @@
-config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	bool
-	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
-
-comment "canfestival needs a glibc or uClibc toolchain w/ threads and dynamic library"
-	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
-config BR2_PACKAGE_CANFESTIVAL
-	bool "canfestival"
-	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  CanFestival is an OpenSource CANOpen framework, licensed under
-	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan
-	  and copcican_comedi).
-
-	  http://www.canfestival.org
-
-if BR2_PACKAGE_CANFESTIVAL
-
-choice
-	prompt "driver"
-	default BR2_PACKAGE_CANFESTIVAL_SOCKET
-
-# - The AnaGate CAN(duo) [1], PeakSystem CAN [2] and CO-PCICAN [3]
-#   drivers are not available (not packaged in Buildroot), so their
-#   support are disabled.
-# - The virtual_kernel driver is disabled because it uses very old
-#   kernel APIs, that have been renamed, or marked as deprecated or
-#   removed for a long while. The question has been raised on the
-#   canfestival mailing list [4].
-#
-# [1] http://www.anagate.de/en/index.html
-# [2] http://www.peak-system.com/linux/
-# [3] http://www.cosateq.com/
-# [4] http://sourceforge.net/p/canfestival/mailman/message/32519648/
-
-config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
-	bool "virtual"
-	help
-	  Unix pipe based virtual CAN driver.
-
-config BR2_PACKAGE_CANFESTIVAL_SOCKET
-	bool "socket"
-	help
-	  SocketCAN (the standard mainline CAN bus interface).
-
-	  http://developer.berlios.de/projects/socketcan/
-
-config BR2_PACKAGE_CANFESTIVAL_LINCAN
-	bool "lincan"
-	help
-	  Lincan driver.
-
-	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
-
-config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
-	bool "can4linux"
-	help
-	  Can4linux driver.
-
-	  http://www.port.de/engl/canprod/hw_can4linux.html
-
-endchoice
-
-config BR2_PACKAGE_CANFESTIVAL_DRIVER
-	string
-	default "virtual"	  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL
-	default "socket"	  if BR2_PACKAGE_CANFESTIVAL_SOCKET
-	default "lincan"	  if BR2_PACKAGE_CANFESTIVAL_LINCAN
-	default "can4linux"	  if BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
-
-config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
-	string "additional configure options"
-	help
-	  Additional options can be passed directly to the configure
-	  script (e.g.: --MAX_CAN_BUS_ID=...,
-	  --SDO_MAX_LENGTH_TRANSFER=..., --SDO_BLOCK_SIZE=...).
-
-config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
-	bool "install examples"
-	help
-	  Install binary application examples.
-
-endif
diff --git a/package/canfestival/canfestival.hash b/package/canfestival/canfestival.hash
deleted file mode 100644
index dc32bd9a2e..0000000000
--- a/package/canfestival/canfestival.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# License files, locally calculated
-sha256	b5c45f160093a6c2fb7bd0078f50c62f4b4089b6206b0e90b0f122b40a2fe110  COPYING
-sha256	d4594b82f4d50840df6a7e9d14132a8c0a3cc05d0ac46d15310a264a1f75447e  LICENCE
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
deleted file mode 100644
index 760f14aecd..0000000000
--- a/package/canfestival/canfestival.mk
+++ /dev/null
@@ -1,59 +0,0 @@
-################################################################################
-#
-# canfestival
-#
-################################################################################
-
-CANFESTIVAL_VERSION = 7740ac6fdedc23e1ed6908d3d7db54833c88572b
-CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3
-CANFESTIVAL_SITE_METHOD = hg
-CANFESTIVAL_LICENSE = LGPL-2.1+
-CANFESTIVAL_LICENSE_FILES = COPYING LICENCE
-CANFESTIVAL_INSTALL_STAGING = YES
-CANFESTIVAL_INSTALLED-y = src drivers
-CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
-
-# Canfestival provides and used some python modules and scripts only compliant
-# with python2.
-CANFESTIVAL_DEPENDENCIES = host-python
-
-# canfestival uses its own hand-written build-system. Though there is
-# a configure script, it does not use the autotools, so, we use the
-# generic-package infrastructure.
-define CANFESTIVAL_CONFIGURE_CMDS
-	cd $(@D) && \
-		$(TARGET_CONFIGURE_OPTS) ./configure \
-		--target=unix \
-		--arch=$(BR2_ARCH) \
-		--timers=unix \
-		--binutils=$(TARGET_CROSS) \
-		--cc="$(TARGET_CC)" \
-		--cxx="$(TARGET_CC)" \
-		--ld="$(TARGET_CC)" \
-		--prefix=/usr \
-		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
-		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
-endef
-
-define CANFESTIVAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
-		PYTHON=$(HOST_DIR)/bin/python2
-endef
-
-define CANFESTIVAL_INSTALL_TARGET_CMDS
-	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/bin/python2 \
-			DESTDIR=$(TARGET_DIR) || exit 1 ; \
-	done
-endef
-
-define CANFESTIVAL_INSTALL_STAGING_CMDS
-	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/bin/python2 \
-			DESTDIR=$(STAGING_DIR) || exit 1 ; \
-	done
-endef
-
-$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
