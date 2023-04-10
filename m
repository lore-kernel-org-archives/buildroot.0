Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE4EC77B6F
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B588160E61;
	Mon, 10 Apr 2023 19:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B588160E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gy8Fi4RKXfUJ; Mon, 10 Apr 2023 19:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 026BE613C8;
	Mon, 10 Apr 2023 19:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026BE613C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4791BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2730440BEA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2730440BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGYpvSfSkicl for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7C340376
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E7C340376
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2845D83D29; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:57:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6b675eaf216b332217caf2430fe6c3f6ef6298e4
X-Git-Newrev: eba42c4bddee0d4a53391c1d2da99e66ef6a9cec
X-Patchwork-Hint: ignore
Message-Id: <20230410193614.2845D83D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/snmppp: fix build
 with libressl >= 3.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eba42c4bddee0d4a53391c1d2da99e66ef6a9cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
   MD5HashStateType md5_hash_state;
                    ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fe6dc835e0581f82c570460903054d5b7d379cd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-build-with-libressl-3-5-0.patch       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
new file mode 100644
index 0000000000..f60f84f9a2
--- /dev/null
+++ b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
@@ -0,0 +1,39 @@
+fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
+auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
+   MD5HashStateType md5_hash_state;
+                    ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: merged (emailed to katz.agentpp.com@magenta.de)]
+
+diff -Naurp snmp++-3.4.9.orig/src/auth_priv.cpp snmp++-3.4.9/src/auth_priv.cpp
+--- snmp++-3.4.9.orig/src/auth_priv.cpp	2022-05-13 11:39:14.083038544 +0200
++++ snmp++-3.4.9/src/auth_priv.cpp	2022-05-13 15:00:42.576102348 +0200
+@@ -79,8 +79,9 @@ static const char *loggerModuleName = "s
+ 
+ /* -- START: Defines for OpenSSL -- */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+-// OpenSSL versions up to 1.0.x and LibreSSL
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
++// OpenSSL versions up to 1.0.x and LibreSSL versions up to 3.4.x
+ typedef EVP_MD_CTX            EVPHashStateType;
+ 
+ int evpAllocAndInit(EVP_MD_CTX *ctx, const EVP_MD *md)
+@@ -138,7 +139,7 @@ typedef EVP_MD_CTX*           MD5HashSta
+ #define MD5_PROCESS(s, p, l)  EVP_DigestUpdate(*(s), p, l)
+ #define MD5_DONE(s, k)        evpDigestFinalAndFree(s, k)
+ 
+-#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ 
+ typedef DES_key_schedule      DESCBCType;
+ #define DES_CBC_START_ENCRYPT(c, iv, k, kl, r, s) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
