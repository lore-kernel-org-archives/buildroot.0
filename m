Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30250C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA7C961104
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA7C961104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF62960B15;
	Fri,  6 Aug 2021 21:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDSZ535VkN5D; Fri,  6 Aug 2021 21:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F4860ACD;
	Fri,  6 Aug 2021 21:05:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EBE01BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D819F6FB99
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_aegIVoqWM0 for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A228260AA2
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E781E8B8D5; Fri,  6 Aug 2021 21:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:57:50 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f74dba08d8bbe68b81293246b0631cac1336c794
X-Git-Newrev: 9f2ea984eeb3d8c98fab184e9b2900c962112b85
X-Patchwork-Hint: ignore
Message-Id: <20210806210246.E781E8B8D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.15.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2474953962257839088=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2474953962257839088==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9f2ea984eeb3d8c98fab184e9b2900c962112b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2021-34558: crypto/tls clients can panic when provided a certificate
  of the wrong type for the negotiated parameters.  net/http clients
  performing HTTPS requests are also affected.  The panic can be triggered
  by an attacker in a privileged network position without access to the
  server certificate's private key, as long as a trusted ECDSA or Ed25519
  certificate for the server exists (or can be issued), or the client is
  configured with Config.InsecureSkipVerify.  Clients that disable all
  TLS_RSA cipher suites (that is, TLS 1.0–1.2 cipher suites without ECDHE),
  as well as TLS 1.3-only clients, are unaffected.

- CVE-2021-36221: A net/http/httputil ReverseProxy can panic due to a race
  condition if its Handler aborts with ErrAbortHandler, for example due to
  an error in copying the response body.  An attacker might be able to force
  the conditions leading to the race condition.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index e077d55441..d89c01911a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  99069e7223479cce4553f84f874b9345f6f4045f27cf5089489b546da619a244  go1.15.13.src.tar.gz
+sha256  0662ae3813330280d5f1a97a2ee23bbdbe3a5a7cfa6001b24a9873a19a0dc7ec  go1.15.15.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3d1dcf02d7..913ee68482 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.13
+GO_VERSION = 1.15.15
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 

--===============2474953962257839088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2474953962257839088==--
