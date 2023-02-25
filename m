Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB02FC7EE23
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8625C40BA1;
	Sat, 25 Feb 2023 21:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8625C40BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fu9eOp6-1pBr; Sat, 25 Feb 2023 21:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81D2C40156;
	Sat, 25 Feb 2023 21:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D2C40156
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21211BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5C8E4156E
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C8E4156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nb369GXnDTeD for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA394157B
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA394157B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 783F286B0D; Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:58:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e1a50e4e67b6a650f9d13729ee955e8332de951
X-Git-Newrev: 0b9dda434f9b0fa48c817fe29f949fea0abc53ac
X-Patchwork-Hint: ignore
Message-Id: <20230225210124.783F286B0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: fix libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b9dda434f9b0fa48c817fe29f949fea0abc53ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libressl build failure which is probably raised since
the addition of the package in commit
65d891efc2fb069f9cf707f47302776f7076b80c:

../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
  582 |                            (SSL_verify_cb)cb
      |                             ^~~~~~~~~~~~~
      |                             RSA_verify

Fixes:
 - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...src-server-listener.cc-fix-libressl-build.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
new file mode 100644
index 0000000000..f2fe2183ae
--- /dev/null
+++ b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
@@ -0,0 +1,38 @@
+From 656bff21c1d20b25058da9dbc27d28ad2ac7ae6e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Feb 2023 18:09:39 +0100
+Subject: [PATCH] src/server/listener.cc: fix libressl build
+
+Fix the following libressl build failure:
+
+../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
+../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
+  582 |                            (SSL_verify_cb)cb
+      |                             ^~~~~~~~~~~~~
+      |                             RSA_verify
+
+Fixes:
+ - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/pistacheio/pistache/pull/1124]
+---
+ src/server/listener.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/server/listener.cc b/src/server/listener.cc
+index 38d2661..c09cb36 100644
+--- a/src/server/listener.cc
++++ b/src/server/listener.cc
+@@ -609,7 +609,7 @@ namespace Pistache::Tcp
+         SSL_CTX_set_verify(GetSSLContext(ssl_ctx_),
+                            SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT | SSL_VERIFY_CLIENT_ONCE,
+ /* Callback type did change in 1.0.1 */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+                            (int (*)(int, X509_STORE_CTX*))cb
+ #else
+                            (SSL_verify_cb)cb
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
