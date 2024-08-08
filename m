Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16688C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F2380B4E;
	Thu,  8 Aug 2024 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8p5NubJ9XqT; Thu,  8 Aug 2024 09:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6B080B3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB6B080B3A;
	Thu,  8 Aug 2024 09:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4CE51BF21A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D058B6090A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-H-Ejncph0A for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 09:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C856069F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C856069F
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 09:59:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CFD984717; Thu,  8 Aug 2024 09:59:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 11:57:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1ce3e6679e226d0fcaff4b174d08bf19826f278d
X-Git-Newrev: 5746500439868712a5035c9a5145ee75d2b5efc5
X-Patchwork-Hint: ignore
Message-Id: <20240808095944.3CFD984717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/go: security bump
 to version 1.21.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=5746500439868712a5035c9a5145ee75d2b5efc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issue:

net/http: denial of service due to improper 100-continue handling

The net/http HTTP/1.1 client mishandled the case where a server responds to
a request with an "Expect: 100-continue" header with a non-informational
(200 or higher) status.  This mishandling could leave a client connection in
an invalid state, where the next request sent on the connection will fail.

An attacker sending a request to a net/http/httputil.ReverseProxy proxy can
exploit this mishandling to cause a denial of service by sending "Expect:
100-continue" requests which elicit a non-informational response from the
backend.  Each such request leaves the proxy with an invalid connection, and
causes one subsequent request using that connection to fail.

Thanks to Geoff Franks for reporting this issue.

This is CVE-2024-24791

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1f491a3284..e6a71e5753 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  42aee9bf2b6956c75a7ad6aa3f0a51b5821ffeac57f5a2e733a2d6eae1e6d9d2  go1.21.11.src.tar.gz
+sha256  71fb31606a1de48d129d591e8717a63e0c5565ffba09a24ea9f899a13214c34d  go1.21.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index e6970f9970..1bb4a2ea0b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.11
+GO_VERSION = 1.21.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
