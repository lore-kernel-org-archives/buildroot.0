Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5E0C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 18:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39A0883E9C;
	Tue, 31 Oct 2023 18:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A0883E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4Lv5Y6ZHI7j; Tue, 31 Oct 2023 18:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C705F83E97;
	Tue, 31 Oct 2023 18:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C705F83E97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1E581BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4BD6141D
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4BD6141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc32ftq_DD5J for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 18:03:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F8361455
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F8361455
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB50186139; Tue, 31 Oct 2023 18:03:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 19:02:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 957e2d2ffd94aa51f043c75ff0adf8453127b1ab
X-Git-Newrev: c4658ede712305455eaf72a67a74509d4434a46a
X-Patchwork-Hint: ignore
Message-Id: <20231031180340.CB50186139@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4658ede712305455eaf72a67a74509d4434a46a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Medium] A fix was added, but still under review for completeness, for a
Bleichenbacher style attack, leading to being able to decrypt a saved
TLS connection and potentially forge a signature after probing with a
large number of trial connections. This issue is around RSA decryption
and affects static RSA cipher suites on the server side, which are not
recommended to be used and are off by default. Static RSA cipher suites
were also removed from the TLS 1.3 protocol and only present in TLS 1.2
and lower. All padding versions of RSA decrypt are affected since the
code under review is outside of the padding processing. Information
about the private keys is NOT compromised in affected code. It's
recommended to disable static RSA cipher suites and update the version
of wolfSSL used if using RSA private decryption alone outside of TLS.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.4-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 3407586edd..fb5a570de8 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a  wolfssl-5.6.3.tar.gz
+sha256  031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4  wolfssl-5.6.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 9b35a6a84a..17452fdcaf 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.3
+WOLFSSL_VERSION = 5.6.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
