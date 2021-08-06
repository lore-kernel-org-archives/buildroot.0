Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C16C432BE
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:44:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EACA611CE
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EACA611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001FF607D4;
	Fri,  6 Aug 2021 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvUsOjDQDVhu; Fri,  6 Aug 2021 14:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3625F606F3;
	Fri,  6 Aug 2021 14:44:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5F81BF321
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5B2606F3
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tG6Pxp6CZJi for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 14:44:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0045C60666
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 14:44:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k4so11444476wrc.0
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzzMGf22pX0qCsVdw5d6tSjhcqlEPJ+gYPP2ADWhRWg=;
 b=XGurxzDXAyDHlhc1PIvPWNaBXW3V3vL0gBLhdBOr4fGbg/PaJz4rscdOZ7aCuhX8Tp
 JoFD5ccepJwJOrAZr9qJ8CXN9nw0i6VCkXB06E2jbJOca9rrUjOstoXvIP4Dxnq0Vavi
 Dkg8+RLnvDB7dTd2uDjOVmwFV7/yq1X8gB7OGVwcxaoufhN+l20KS/K5Dsn8B56eGx8V
 nHpZKgEE3EJy8ZqXLXYK6g2hwYvoUKorS+vrLujL1DNI6KOts3XhqwnpJSmMXH0RVUGL
 09ZrHCj7decPxufAgnzJPfOp6wU3duZGOZubMxzKqJJqLKb0B8kZh66pdAVJl15CeWG1
 tK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzzMGf22pX0qCsVdw5d6tSjhcqlEPJ+gYPP2ADWhRWg=;
 b=Q2vhC3KNpeu86W5PyCS65Hclj/c6vePo6DT/pBzyYovkH1h1tI0t56BDLbHcMUCyLJ
 Gz3jxaTxGxNdhZg8zkCZMxTXYsddLvKfQZ5wstmciJcqgX6goEfr0K9FDt1GBWcAzeHT
 H1ZdNSYiS04gMzUglC7nHc2n97GmXDCPdPAU2wyIwWuM2/rV0AJpxFX3yBXWbtXgVQB6
 96+o8pocEXe7PFGNBdL68gyNG7/YfCwaB8034SRwfPi08U8O0u2SLCG1cdxZiZpVGMkg
 RX/mP3gWZUXNLBU1xnRXvru6Zij5IOvXQjDZUMzCoHT0AxXQhhRCEyhw6vuAwm6UQwHP
 7cmg==
X-Gm-Message-State: AOAM532ae3H6/IVAbvy7gRMKpqt883JJqsUtgsvPor8CCz1+n+N8H6jE
 OZLOR4Ocv2mfD6pAeKrC2scZDTv/jKtgZw==
X-Google-Smtp-Source: ABdhPJxf1OB54ig12PSl+Yg8t2ivX3/1M9n73+bspXkN5I2TlBW2CDtg0oseHniqOOVyHk6/eXfi0Q==
X-Received: by 2002:a5d:6442:: with SMTP id d2mr11331269wrw.425.1628261068944; 
 Fri, 06 Aug 2021 07:44:28 -0700 (PDT)
Received: from kali.home (pop.92-184-97-49.mobile.abo.orange.fr.
 [92.184.97.49])
 by smtp.gmail.com with ESMTPSA id u11sm9590964wrp.26.2021.08.06.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:44:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 16:44:18 +0200
Message-Id: <20210806144418.3450660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: update third patch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update third patch to fix the following build failure:

/bin/sh: 1: curl-config: not found
make[2]: Leaving directory '/tmp/instance-2/output-1/build/s390-tools-2.17.0/libvmdump'
Error: libcurl is not built with the OpenSSL backend
make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/b4ebe39e54f80b26bc81b249bfa643140c41d0bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-Makefile-add-CURL-XML2-_CONFIG.patch} | 47 ++++++++++++++++---
 1 file changed, 40 insertions(+), 7 deletions(-)
 rename package/s390-tools/{0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch => 0003-Makefile-add-CURL-XML2-_CONFIG.patch} (59%)

diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
similarity index 59%
rename from package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
rename to package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
index 2f6ea5a11c..4ac0b8b029 100644
--- a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
+++ b/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
@@ -1,7 +1,7 @@
-From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
+From c2c310e93a5af148d37323f8d873e5656dea8b64 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 1 Aug 2021 21:50:21 +0200
-Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
+Subject: [PATCH] Makefile: add {CURL,XML2}_CONFIG
 
 Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
 binaries used in check-dep-libkmipclient
@@ -20,11 +20,47 @@ Fixes:
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
 ---
+ libekmfweb/Makefile    | 10 ++++++----
  libkmipclient/Makefile | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
+ 2 files changed, 14 insertions(+), 9 deletions(-)
 
+diff --git a/libekmfweb/Makefile b/libekmfweb/Makefile
+index 8e12fb56..1c776996 100644
+--- a/libekmfweb/Makefile
++++ b/libekmfweb/Makefile
+@@ -47,6 +47,8 @@ detect-openssl-version.dep:
+ 	echo "}" >> $(TMPFILE)
+ 	mv $(TMPFILE) $@
+ 
++CURL_CONFIG ?= curl-config
++
+ check-dep-libekmfweb: detect-openssl-version.dep
+ 	$(call check_dep, \
+ 		"libekmfweb", \
+@@ -64,8 +66,8 @@ check-dep-libekmfweb: detect-openssl-version.dep
+ 		"curl/curl.h", \
+ 		"libcurl-devel", \
+ 		"HAVE_LIBCURL=0" \
+-		`curl-config --cflags` `curl-config --libs`)
+-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
+ 	touch check-dep-libekmfweb
+ 
+ skip-libekmfweb-openssl:
+@@ -83,8 +85,8 @@ ekmfweb.o: check-dep-libekmfweb ekmfweb.c utilities.h cca.h $(rootdir)include/ek
+ utilities.o: check-dep-libekmfweb utilities.c utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
+ cca.o: check-dep-libekmfweb cca.c cca.h utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
+ 
+-libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `curl-config --cflags`
+-libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `curl-config --libs` -ldl
++libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `$(CURL_CONFIG) --cflags`
++libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(CURL_CONFIG) --libs` -ldl
+ libekmfweb.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libekmfweb.map \
+ 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libekmfweb.so.$(VERM)
+ libekmfweb.so.$(VERSION): ekmfweb.o utilities.o cca.o $(libs)
 diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
-index 36efecb..addd096 100644
+index 36efecb4..addd0965 100644
 --- a/libkmipclient/Makefile
 +++ b/libkmipclient/Makefile
 @@ -50,6 +50,9 @@ detect-openssl-version.dep:
@@ -66,6 +102,3 @@ index 36efecb..addd096 100644
  libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
  	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
  libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
--- 
-2.30.2
-
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
