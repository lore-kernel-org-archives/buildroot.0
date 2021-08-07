Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B334C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D778E610CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D778E610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38A5404C3;
	Sat,  7 Aug 2021 08:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDSHHrhc3dIX; Sat,  7 Aug 2021 08:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E59404BF;
	Sat,  7 Aug 2021 08:58:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 463271BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35F4D606AE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Av19XrrLUbwX for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:58:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6844D605B0
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C2B18C978; Sat,  7 Aug 2021 08:58:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:57:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80f5a6ca924740b8daca86f9a48c4e41b6295826
X-Git-Newrev: 8e7232bbc578e34ddde4bd371131ec89a291c7ca
X-Patchwork-Hint: ignore
Message-Id: <20210807085818.7C2B18C978@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: properly fix build
 with libcurl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8e7232bbc578e34ddde4bd371131ec89a291c7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update third patch to fix the following build failure:

/bin/sh: 1: curl-config: not found
make[2]: Leaving directory '/tmp/instance-2/output-1/build/s390-tools-2.17.0/libvmdump'
Error: libcurl is not built with the OpenSSL backend
make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/b4ebe39e54f80b26bc81b249bfa643140c41d0bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...h => 0003-Makefile-add-CURL-XML2-_CONFIG.patch} | 47 ++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
