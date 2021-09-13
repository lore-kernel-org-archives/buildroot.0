Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:10:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018D1610FB
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 018D1610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEC1607A6;
	Tue, 14 Sep 2021 06:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fo8LpOgOHXQ; Tue, 14 Sep 2021 06:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C8B607C9;
	Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB1C1BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 383AE40215
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XYOmInjzQvr for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D9240183
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D5F08AC05; Tue, 14 Sep 2021 06:08:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:54:48 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 128adb7a54cdadab503386f684444c96863e67f6
X-Git-Newrev: 035fda19d322bd552f00c9f1754d991229920a4c
X-Patchwork-Hint: ignore
Message-Id: <20210914060813.8D5F08AC05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 version to 1.16.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7668182007062293909=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============7668182007062293909==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=035fda19d322bd552f00c9f1754d991229920a4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 806b26950d51de22ffbbed0c975e7317982eeb30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

--===============7668182007062293909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7668182007062293909==--
