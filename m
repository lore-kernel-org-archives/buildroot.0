Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B303C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA3860FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBA3860FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76CE4071D;
	Thu, 26 Aug 2021 22:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id levOjbJr-Oi5; Thu, 26 Aug 2021 22:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4EF640765;
	Thu, 26 Aug 2021 22:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE9071BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67B7282B8C
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkvAPqh994Pb for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989E782ACD
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ED9BF8DC52; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:57:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80f5a6ca924740b8daca86f9a48c4e41b6295826
X-Git-Newrev: 8e7232bbc578e34ddde4bd371131ec89a291c7ca
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.ED9BF8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/s390-tools: properly
 fix build with libcurl
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
