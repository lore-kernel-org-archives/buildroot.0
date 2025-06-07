Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD74C61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 15:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D2380DB9;
	Sat,  7 Jun 2025 15:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmYn0G1hHElw; Sat,  7 Jun 2025 15:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6576580DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6576580DD0;
	Sat,  7 Jun 2025 15:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B284C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F06E40AD9
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EeGAMvUrMAy for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 15:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E9440AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E9440AF3
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D31C385BE2; Sat,  7 Jun 2025 15:34:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 17:32:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be69e6fe2f7a5d511a0179ca34006980730c61dc
X-Git-Newrev: 00f0fca15a696eafae688b58c0df220ef5a2e2dc
X-Patchwork-Hint: ignore
Message-Id: <20250607153436.D31C385BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version
 1.23.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00f0fca15a696eafae688b58c0df220ef5a2e2dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.23.9 (released 2025-05-06) includes fixes to the runtime and the linker.

go1.23.10 (released 2025-06-05) includes security fixes to the net/http and
os packages, as well as bug fixes to the linker.

Fixes the following security vulnerabilities:

- CVE-2025-4673: net/http: sensitive headers not cleared on cross-origin
  redirect

  Proxy-Authorization and Proxy-Authenticate headers persisted on
  cross-origin redirects potentially leaking sensitive information

- CVE-2025-0913: os: inconsistent handling of O_CREATE|O_EXCL on Unix and
  Windows

  os.OpenFile(path, os.O_CREATE|O_EXCL) behaved differently on Unix and
  Windows systems when the target path was a dangling symlink.  On Unix
  systems, OpenFile with O_CREATE and O_EXCL flags never follows symlinks.
  On Windows, when the target path was a symlink to a nonexistent location,
  OpenFile would create a file in that location.

- CVE-2025-22874: crypto/x509: usage of ExtKeyUsageAny disables policy validation

  Calling Verify with a VerifyOptions.KeyUsages that contains ExtKeyUsageAny
  unintentionally disabled policy validation.  This only affected
  certificate chains which contain policy graphs, which are rather uncommon.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 48ba6b7fd9..62e0772e2e 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
-sha256  714b9d004063bfa27686f9ff0e5648bb190b3a5bc1e86b0aa16c134d8d8c315f  go1.23.8.linux-386.tar.gz
-sha256  45b87381172a58d62c977f27c4683c8681ef36580abecd14fd124d24ca306d3f  go1.23.8.linux-amd64.tar.gz
-sha256  9d6d938422724a954832d6f806d397cf85ccfde8c581c201673e50e634fdc992  go1.23.8.linux-arm64.tar.gz
-sha256  d14e0bea9fb25344a0460f395880d5589bbcd413ffd5555be48e46c0de084437  go1.23.8.linux-armv6l.tar.gz
-sha256  0cadab469e612b159f5f68b1a30d75aa7b7e1ed5292746005a6a3c8ff04e6f35  go1.23.8.linux-ppc64le.tar.gz
-sha256  cbe954ee534eb02aa782639716d8c25706dd171445f7c8336bd2fc0b8f6fe38e  go1.23.8.linux-s390x.tar.gz
+sha256  800a7ae1bff179a227b653a2f644517c800443b8b4abf3273af5e1cb7113de59  go1.23.10.src.tar.gz
+sha256  ded3c0a8d6d2a0ea5e7599c49678efa05cda139d31baaaf7d8d536a9e4cc19b2  go1.23.10.linux-386.tar.gz
+sha256  535f9f81802499f2a7dbfa70abb8fda3793725fcc29460f719815f6e10b5fd60  go1.23.10.linux-amd64.tar.gz
+sha256  bfb1f1df7173f44648ee070a39ab0481068632f595305a699d89cd56a33b8081  go1.23.10.linux-arm64.tar.gz
+sha256  b6e00c9a72406d394b9f167e74670e28b72ed559cca8115b21be1cb9d5316cb4  go1.23.10.linux-armv6l.tar.gz
+sha256  8fb94455cfa5e9a5e8af2bfbc7323a6fed2dabaffda1a69dae5dd41b669bbb57  go1.23.10.linux-ppc64le.tar.gz
+sha256  7d0e8651eb54fce5cfe2d4b412ddfa50144ce21907f72192a6549ffe03db4e1f  go1.23.10.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index d618a7a262..744bb0d3ba 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.8
+GO_VERSION = 1.23.10
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
