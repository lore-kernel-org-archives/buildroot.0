Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5CDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F3160F38
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63F3160F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D28542519;
	Wed,  4 Aug 2021 00:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9vX-p-B37An; Wed,  4 Aug 2021 00:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CB284250E;
	Wed,  4 Aug 2021 00:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3379C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D3740FB2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykz7NbytDaQ5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B05E40F12
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7F37987C2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:36:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 46fde0f29363edd8233c4b20b97a702838aa541e
X-Git-Newrev: 806b26950d51de22ffbbed0c975e7317982eeb30
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.7F37987C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: security bump
 version to 1.16.6
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
Content-Type: multipart/mixed; boundary="===============0523151326489481788=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0523151326489481788==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=806b26950d51de22ffbbed0c975e7317982eeb30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These minor releases include a security fix according to the new security policy (#44918).

crypto/tls clients can panic when provided a certificate of the wrong type for the negotiated parameters.
net/http clients performing HTTPS requests are also affected. The panic can be triggered by an attacker
in a privileged network position without access to the server certificate's private key, as long as a trusted
ECDSA or Ed25519 certificate for the server exists (or can be issued), or the client is configured with
Config.InsecureSkipVerify. Clients that disable all TLS_RSA cipher suites (that is, TLS 1.0–1.2 cipher
suites without ECDHE), as well as TLS 1.3-only clients, are unaffected.

This is CVE-2021-34558.

View the release notes for more information:

https://golang.org/doc/devel/release.html#go1.16.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bc6147bb52..cd7f2b3813 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80  go1.16.5.src.tar.gz
+sha256  a3a5d4bc401b51db065e4f93b523347a4d343ae0c0b08a65c3423b05a138037d  go1.16.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 4252691343..7d6355df92 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.5
+GO_VERSION = 1.16.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 

--===============0523151326489481788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0523151326489481788==--
