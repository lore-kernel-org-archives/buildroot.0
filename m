Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DBC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686C660DFC;
	Tue,  1 Aug 2023 21:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686C660DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSKtoxJCJz-w; Tue,  1 Aug 2023 21:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7F6607E1;
	Tue,  1 Aug 2023 21:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7F6607E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1917A1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7086C40605
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7086C40605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRxZAD_q8vba for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:19:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A145D400FF
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A145D400FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F3428406C; Tue,  1 Aug 2023 21:19:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:18:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bd0431bafc981ea6237b3abdd18ea22fb825f5f
X-Git-Newrev: ee7179497bbdd1b44c8d2dd6dbfa0ac4c234567d
X-Patchwork-Hint: ignore
Message-Id: <20230801211956.8F3428406C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to v1.20.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee7179497bbdd1b44c8d2dd6dbfa0ac4c234567d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.20.7 (released 2023-08-01) includes a security fix to the crypto/tls
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

https://go.dev/doc/devel/release#go1.20.7

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 135d1ad37b..2298534d91 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70  go1.20.6.src.tar.gz
+sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index efa47e5781..fc1d9ed681 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.6
+GO_VERSION = 1.20.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
