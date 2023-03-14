Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8183BC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C320408CA;
	Tue, 14 Mar 2023 08:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C320408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCqKFO4Xd2tp; Tue, 14 Mar 2023 08:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66444028F;
	Tue, 14 Mar 2023 08:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66444028F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2D471BF33F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA19F81020
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA19F81020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nu3-GhKisb2p for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D523B80F54
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D523B80F54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C093887159; Tue, 14 Mar 2023 08:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:06:37 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d2a00c83ae6a772e84dd238bde31bd526972412d
X-Git-Newrev: 8b430fd5256c8dffacba6a0bd72afae579e84535
X-Patchwork-Hint: ignore
Message-Id: <20230314085200.C093887159@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pistache: fix
 libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b430fd5256c8dffacba6a0bd72afae579e84535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 0b9dda434f9b0fa48c817fe29f949fea0abc53ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
