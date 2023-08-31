Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB5FC83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 12:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1189E80D3D;
	Thu, 31 Aug 2023 12:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1189E80D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSNF8ToeGSor; Thu, 31 Aug 2023 12:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E1D580BAD;
	Thu, 31 Aug 2023 12:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E1D580BAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F091F1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7236612CE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7236612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Lo3pTVi-gyB for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 12:28:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B026560BE9
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B026560BE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 905CE86741; Thu, 31 Aug 2023 12:28:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 13:02:35 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7ed51e5c2f30102bde6cdef8a6bd3d60e152da28
X-Git-Newrev: a938b2e5cbf0b5ebe87445ef14cdebd89f6f3f7a
X-Patchwork-Hint: ignore
Message-Id: <20230831122818.905CE86741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to v1.19.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a938b2e5cbf0b5ebe87445ef14cdebd89f6f3f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

go1.19.12 (released 2023-08-01) includes a security fix to the crypto/tls
package, as well as bug fixes to the assembler and the compiler.

Fixes CVE-2023-29409: restrict RSA keys in certificates to <= 8192 bits

Extremely large RSA keys in certificate chains can cause a client/server to
expend significant CPU time verifying signatures. Limit this by restricting the
size of RSA keys transmitted during handshakes to <= 8192 bits.

Based on a survey of publicly trusted RSA keys, there are currently only three
certificates in circulation with keys larger than this, and all three appear to
be test certificates that are not actively deployed. It is possible there are
larger keys in use in private PKIs, but we target the web PKI, so causing
breakage here in the interests of increasing the default safety of users of
crypto/tls seems reasonable.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6d4c718a40..ac8499e7dc 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
+sha256  ee5d50e0a7fd74ba1b137cb879609aaaef9880bf72b5d1742100e38ae72bb557  go1.19.12.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 22b8161e05..9189032ba8 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.11
+GO_VERSION = 1.19.12
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
