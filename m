Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD39C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676D361057
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 676D361057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D9E3400CF;
	Sun,  1 Aug 2021 20:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMK1RZ4H6Wy4; Sun,  1 Aug 2021 20:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A45A140114;
	Sun,  1 Aug 2021 20:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B23071BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DE32606A9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBOaipZCY5Mj for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B6BA6064A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:47:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h13so5507002wrp.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/pBBq2oZYhehRQzYbGysNRtsBi5eEpBTq4zqniTvLg=;
 b=IeDLBl3CQCHDiHp3Uy8yUUd4vICqXIUbf5Pw6LhWbJZbUis0BdkbzuXHh5dSqBGutF
 iGhG4KB3vuUWLJCRXTFLofnJdcYG1HBa4eBDbTrNuNxWOVFR3dtOS9rdPvi/Ov0+j6mZ
 vxhM4uWoOIs+qZOMJ5G38ZiOOXBE9olrqS/B1bPM7/XgXNTEdO7MfuFVg01Epd1HCpXk
 sFvmbrKVSoAJo+CWieyR90AZ7raR3jmy7qPpJfUAAL/8gYqNwwou4O2Z7uvdaGdnkFN3
 1pcrkcZjqTX8VVHiumffCxvK6M7XtuF/YiWuOGEHstcS39uu12QbnvZPQGCCPm/Ll5LA
 13lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/pBBq2oZYhehRQzYbGysNRtsBi5eEpBTq4zqniTvLg=;
 b=AEhA5JgkSctAY8jhW0f+m9nrIeWy+b8mdGj/WAT75K4HsHIqMXULxa8kso0+ba6V5t
 NKS8DrwEFqxXx7W+rLQ90IiF2H94tK43GP/IIFz3TfuzPoDPI4iBycHn8h94TLkekA3T
 BbAZmAdbB13zEFgxj2wltgairda1OCWwCGPzCxdWnkOES0uxK5R547eqJoxiEHsy6oSs
 uqqQb/hKxhK+IgeNv8wnbgQR8UhJL3gxH51wwp2bU7GYBOFXtXadRWRIjxMeZEZt4rdd
 wQPtT+q803PX/iOJGXv1CPSEzuWxyjMBzg51eMRxfl44YnXkjQuzVzS2cAa3waNK9kt6
 Pe3w==
X-Gm-Message-State: AOAM531appSYu2GvbGf9aMltHBi3LiY77TQ2YbhIuREGQ9VvUAaZg+CD
 Ru0Lf+DwwnKpIH5UYGqBiXY4vG4wzeaU0w==
X-Google-Smtp-Source: ABdhPJwt2itWV20ZVaLZ9WnhgseCUmY6JNrD3xdvKzSsWdCWK7OFx00sF1aQyeNrOG2HkdVBp52IBQ==
X-Received: by 2002:adf:ed51:: with SMTP id u17mr13875605wro.416.1627850819491; 
 Sun, 01 Aug 2021 13:46:59 -0700 (PDT)
Received: from kali.home (pop.92-184-106-106.mobile.abo.orange.fr.
 [92.184.106.106])
 by smtp.gmail.com with ESMTPSA id d67sm9798310wmd.9.2021.08.01.13.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:46:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:46:49 +0200
Message-Id: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/2] package/s390-tools: fix build with curl
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

Build with curl is broken since bump to version 2.17.0 in commit
eab9110afbef9c39569c4cc988aed15c48f7ce44 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e

Fixes:
 - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Split patch
 - Add CURL_CONFIG and XML2_CONFI

 ...lient-Makefile-add-CURL-XML2-_CONFIG.patch | 71 +++++++++++++++++++
 package/s390-tools/s390-tools.mk              |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch

diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
new file mode 100644
index 0000000000..2f6ea5a11c
--- /dev/null
+++ b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
@@ -0,0 +1,71 @@
+From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Aug 2021 21:50:21 +0200
+Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
+
+Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
+binaries used in check-dep-libkmipclient
+
+This will allow the user to avoid the following build failures raised
+since version 2.17.0 and
+https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
+
+/bin/sh: 1: curl-config: not found
+Error: libcurl is not built with the OpenSSL backend
+make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
+---
+ libkmipclient/Makefile | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
+index 36efecb..addd096 100644
+--- a/libkmipclient/Makefile
++++ b/libkmipclient/Makefile
+@@ -50,6 +50,9 @@ detect-openssl-version.dep:
+ 	echo "}" >> $(TMPFILE)
+ 	mv $(TMPFILE) $@
+ 
++CURL_CONFIG ?= curl-config
++XML2_CONFIG ?= xml2-config
++
+ check-dep-libkmipclient: detect-openssl-version.dep
+ 	$(call check_dep, \
+ 		"libkmipclient", \
+@@ -67,14 +70,14 @@ check-dep-libkmipclient: detect-openssl-version.dep
+ 		"libxml/tree.h", \
+ 		"libxml2-devel", \
+ 		"HAVE_LIBXML2=0", \
+-		`xml2-config --cflags` `xml2-config --libs`)
++		`$(XML2_CONFIG) --cflags` `$(XML2_CONFIG) --libs`)
+ 	$(call check_dep, \
+ 		"libkmipclient", \
+ 		"curl/curl.h", \
+ 		"libcurl-devel", \
+ 		"HAVE_LIBCURL=0" \
+-		`curl-config --cflags` `curl-config --libs`)
+-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
+ 	touch check-dep-libkmipclient
+ 
+ skip-libkmipclient-openssl:
+@@ -104,8 +107,8 @@ tls.o: check-dep-libkmipclient tls.c kmip.h utils.h $(rootdir)include/kmipclient
+ names.o: check-dep-libkmipclient names.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
+ utils.o: check-dep-libkmipclient utils.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
+ 
+-libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `xml2-config --cflags` `curl-config --cflags`
+-libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `xml2-config --libs` `curl-config --libs`
++libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `$(XML2_CONFIG) --cflags` `$(CURL_CONFIG) --cflags`
++libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(XML2_CONFIG) --libs` `$(CURL_CONFIG) --libs`
+ libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
+ 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
+ libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
+-- 
+2.30.2
+
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 7f7df0542e..71a7f2223c 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -20,6 +20,7 @@ S390_TOOLS_MAKE_OPTS = \
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
 S390_TOOLS_MAKE_OPTS += \
+	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
 	HAVE_CURL=1 \
 	HAVE_LIBCURL=1
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
