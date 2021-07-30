Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE8C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0861A60720
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0861A60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8528382D;
	Fri, 30 Jul 2021 14:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jyK5J5XcPqo; Fri, 30 Jul 2021 14:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2B4834C6;
	Fri, 30 Jul 2021 14:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC4B1BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D47383506
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QTw7IKNIzLu for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA7FC83487
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 64366844CB; Fri, 30 Jul 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:20:51 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: db7d49f4cffa74a08807735807d229e802134b66
X-Git-Newrev: 186308bc15bb8f2d0594411d20ee221870663fed
X-Patchwork-Hint: ignore
Message-Id: <20210730133428.64366844CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libmodsecurity:
 fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=186308bc15bb8f2d0594411d20ee221870663fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following static build failure with nginx raised since bump of
libmodsecurity to version 3.0.5 in commit
464d0be380c84ac7c3f1684e49153c3868280d7e:

/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libmodsecurity.a(libmodsecurity_la-transaction.o): in function `std::basic_streambuf<char, std::char_traits<char> >::sbumpc() [clone .isra.0]':
transaction.cc:(.text+0x40): undefined reference to `std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_dispose()'

Fixes:
 - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 489cbfd7df1650a8790b3bdbcd69a2357f19764b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-modsecurity.pc.in-add-lstdc.patch         | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
new file mode 100644
index 0000000000..6511e6f1e0
--- /dev/null
+++ b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
@@ -0,0 +1,32 @@
+From 1a84881b280eb08852d5495c57e44351a40d3f91 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 26 Jul 2021 00:24:57 +0200
+Subject: [PATCH] modsecurity.pc.in: add -lstdc++
+
+Add -lstdc++ to Libs.Private to avoid the following static build failure
+with nginx:
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libmodsecurity.a(libmodsecurity_la-transaction.o): in function `std::basic_streambuf<char, std::char_traits<char> >::sbumpc() [clone .isra.0]':
+transaction.cc:(.text+0x40): undefined reference to `std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_dispose()'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modsecurity.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modsecurity.pc.in b/modsecurity.pc.in
+index 96cdf5ca..7c895ddc 100644
+--- a/modsecurity.pc.in
++++ b/modsecurity.pc.in
+@@ -8,4 +8,4 @@ Description: ModSecurity API
+ Version: @MSC_VERSION_WITH_PATCHLEVEL@
+ Cflags: -I@includedir@
+ Libs: -L@libdir@ -lmodsecurity
+-Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
++Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
