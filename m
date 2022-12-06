Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A7C3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 07:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3BB60C00;
	Tue,  6 Dec 2022 07:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3BB60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYUpxJXHgaBP; Tue,  6 Dec 2022 07:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1485D606EB;
	Tue,  6 Dec 2022 07:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1485D606EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFF01BF2F8
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 07:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C1940382
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 07:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75C1940382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBbPTUQT4LvA for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 07:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 640C5402A8
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 07:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640C5402A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C2B685C8E; Tue,  6 Dec 2022 07:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Dec 2022 08:50:48 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3c7c6cd5982b8e7310c763f5f042c7a8f1ba1546
X-Git-Newrev: 33f30c4ce71b3f3a71f174f756c269635434d486
X-Patchwork-Hint: ignore
Message-Id: <20221206075442.4C2B685C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package.libopenssl: fix
 enabling/disabling mdc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=33f30c4ce71b3f3a71f174f756c269635434d486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit 3dbc86f09897 (openssl: bump version, enable mdc2+camellia+tlsext)
form 2010-06-03, forced the build of mdc2. Commit a83d41867c8d
(package/libopenssl: add option to enable some features) added an option
to explicitly disable mdc2, but forgot to amend the existing enabling
option.

It appears that, like most (all?) openssl config options, mdc2 ends up
enabled unless explicitly disabled.

Additionally, mdc2 depends on DES, so without DES, mdc2 gets disabled.

So, drop the explicit enabling option, and make mdc2 select DES.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 45bb69c2bdee44346d6be5b58e46b2278e40a04a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/Config.in     | 1 +
 package/libopenssl/libopenssl.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 00339238fb..7a3f56a512 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
 	bool "enable MDC2"
 	default y
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
 	bool "enable BLAKE2"
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 3542b89727..fc22c20467 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -79,7 +79,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_HAS_CRYPTODEV),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
-			enable-mdc2 \
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
