Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4E1E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 17:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB68D80B09;
	Sun, 21 Dec 2025 17:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_hXQFeFYqRX; Sun, 21 Dec 2025 17:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CA6809CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766337358;
	bh=reFkrp8bt00ZyST5uu//MZ/Zz3HBRcDwPk7rdMYK92g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=S8+YAAhU2NdgyO/fBlbj0NQ1hiTsNBlAbs2QIrm/ZIGq7VN1ELImuTRMpWA71Ddxu
	 /4YCQKcaRhLp+Xc0f02BHvDYqTfPfy6/tLHRLNSrt6weA8/gWheawW8cqp4djTaWTw
	 2UsMD1RgjV7T+QwQRmOLUjJ8KxtMslGjqUtPtnCcSfLHK8A9LGxKEt2XIAaMsy9qo+
	 PnZdtHkaS7KZdKQNE/qzTnj1P+YDKSLwOZ9W61Zc+AbKMzhxwda2kOUuV79y6mBCoD
	 gUoNrGJwogZy6sxFOdoMjlBP/TRSiCn4l6K0V2eCkC+9qtDkYQxFU8tLGdrhbxWjgl
	 3lwvgLsiBYLNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CA6809CE;
	Sun, 21 Dec 2025 17:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D778119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 17:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5412E4035B
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 17:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0-Y9TitdrzA for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 17:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CDD140350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CDD140350
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CDD140350
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 17:15:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E455A4C46DA;
 Sun, 21 Dec 2025 18:15:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47092)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXN27-000000006az-3s1f;
 Sun, 21 Dec 2025 17:15:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 18:15:50 +0100
Message-ID: <20251221171550.2356174-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766337352;
 bh=qaix3B0vIlwcdOzI0AQbvdjgKoBquNoe4QazJyqrsJA=;
 h=From:To:Cc:Subject:Date:From;
 b=NbaHFPa2tPSkHkftmWJQi9XGmUrag9gpJN/TYW8nqrh2Q4R6tsBMa8tvn9R8BF0hY
 XoiahXgjmGPDOAc2nOxN7R3bFIXqksgr43Uqwy/H8umu++NeB9i//b/i7K1/hcv/Ba
 02aqgZJhVQxJ9QvFQJ16RIPc1OJpTYXG/sAvXQPIes/SUSSgsTSpS/f08emWqNCtCa
 hChuWY4M/q3BpPQ0zP3J9Sk/kWLiWJRZDY/qbQqgT9hj4xYC2URXGVsS9ZB+xwdJKR
 61mv+TMIri7C/2B2JivHQdASvhAX7D33y7qSTWNXg7B5ovllJMQ+ejKsJGODOnM+gD
 1m1wFgTW390Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NbaHFPa2
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix Python build errors
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
Cc: Julien Olivain <ju.o@free.fr>, Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.org/results/953/953b8c6d7da0f150ec56760c4a3191e630c01381/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-Authored-By: Julien Olivain <ju.o@free.fr>
---
 ...uild-python-module-without-isolation.patch | 41 +++++++++++++++++++
 package/libselinux/libselinux.mk              |  4 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/libselinux/0003-Build-python-module-without-isolation.patch

diff --git a/package/libselinux/0003-Build-python-module-without-isolation.patch b/package/libselinux/0003-Build-python-module-without-isolation.patch
new file mode 100644
index 0000000000..9614efa6c8
--- /dev/null
+++ b/package/libselinux/0003-Build-python-module-without-isolation.patch
@@ -0,0 +1,41 @@
+From: =?utf-8?q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Mon, 27 Oct 2025 22:40:59 +0100
+Subject: Build python module without isolation (Closes: #1119155)
+
+Let pip find the system installed setuptools.
+
+Downloaded from
+https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch
+
+Used by Debian to fix a build error:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1119155
+
+Building the Buildroot package breaks with a different error:
+
+      ModuleNotFoundError: No module named '_sysconfigdata__linux_aarch64-linux-gnu'
+
+which is also fixed by this patch, most likely both are caused by
+incorrect usage of python-pip by libselinux:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121#29
+
+Upstream: buildroot-specific
+
+[Bernd: rebased after patch 0002 was applied]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 261c22d..29057a8 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -198,7 +198,7 @@ ifneq ($(DISABLE_SHARED),y)
+ endif
+ 
+ install-pywrap: pywrap
+-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps --no-build-isolation` $(PYTHON_SETUP_ARGS) .
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+ 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
+ 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 405c4a9f21..a77ee7659a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -35,8 +35,12 @@ LIBSELINUX_DEPENDENCIES += \
 	python3 \
 	python-setuptools \
 	host-python-pip \
+	host-python-setuptools \
 	host-swig
 
+LIBSELINUX_MAKE_ENV += \
+	$(PKG_PYTHON_SETUPTOOLS_ENV)
+
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
