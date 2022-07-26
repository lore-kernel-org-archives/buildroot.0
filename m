Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8839EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052B6610FD;
	Tue, 26 Jul 2022 16:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 052B6610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83Be1FxBefrt; Tue, 26 Jul 2022 16:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF7D60EB4;
	Tue, 26 Jul 2022 16:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF7D60EB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3FF11BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC64940612
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC64940612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QqnsZ4q3Jrc for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D40884014B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D40884014B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B473785EF7; Tue, 26 Jul 2022 16:29:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:42:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 283573f9b33e4450859c0ebcf8bfc456b80b5895
X-Git-Newrev: b78ecb7ef80a558f508bd9ca6b2b6439040b442b
X-Patchwork-Hint: ignore
Message-Id: <20220726162921.B473785EF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: fix build with libressl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b78ecb7ef80a558f508bd9ca6b2b6439040b442b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl:

eap-tls.c: In function 'ssl_msg_callback':
eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
 1284 |     case SSL3_RT_HEADER:
      |          ^~~~~~~~~~~~~~
      |          SSL3_RT_ALERT

Fixes:
 - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...02-pppd-eap-tls.c-fix-build-with-libressl.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..aefdc5b7a4
--- /dev/null
+++ b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
@@ -0,0 +1,36 @@
+From b0a011bc4abac8cb3de8dfff42b754ed236ecf0f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Jul 2022 10:07:03 +0200
+Subject: [PATCH] pppd/eap-tls.c: fix build with libressl (#338)
+
+Fix the following build failure with libressl:
+
+eap-tls.c: In function 'ssl_msg_callback':
+eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
+ 1284 |     case SSL3_RT_HEADER:
+      |          ^~~~~~~~~~~~~~
+      |          SSL3_RT_ALERT
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/ppp-project/ppp/commit/b0a011bc4abac8cb3de8dfff42b754ed236ecf0f]
+---
+ pppd/eap-tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/eap-tls.c b/pppd/eap-tls.c
+index b9bab842..40796d58 100644
+--- a/pppd/eap-tls.c
++++ b/pppd/eap-tls.c
+@@ -61,7 +61,7 @@
+ #include "mppe.h"
+ #include "pathnames.h"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ #define TLS_method SSLv23_method
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
