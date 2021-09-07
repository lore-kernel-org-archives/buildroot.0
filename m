Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6E6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:59:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A87B604AC
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A87B604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6932740406;
	Tue,  7 Sep 2021 13:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SI6Kmug2MyXT; Tue,  7 Sep 2021 13:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E69E403E5;
	Tue,  7 Sep 2021 13:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28E6D1BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24D8B605D7
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZ4gQ69PPdpe for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:59:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B6416058C
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:59:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3BEF18883B; Tue,  7 Sep 2021 13:58:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 15:53:47 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: b6997e09172f604a3b7a46a3e7f83685f7509c59
X-Git-Newrev: 0c5e090dd37d38ce4bdfaeb4159ce65834fdce26
X-Patchwork-Hint: ignore
Message-Id: <20210907135806.3BEF18883B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/c-ares: security
 bump to version 1.17.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c5e090dd37d38ce4bdfaeb4159ce65834fdce26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- NodeJS passes NULL for addr and 0 for addrlen to
  ares_parse_ptr_reply() on systems where malloc(0) returns NULL. This
  would cause a crash.
- If ares_getaddrinfo() was terminated by an ares_destroy(), it would
  cause a crash
- Crash in sortaddrinfo() if the list size equals 0 due to an unexpected
  DNS response
- Expand number of escaped characters in DNS replies as per RFC1035 5.1
  to prevent spoofing follow-up
- Perform validation on hostnames to prevent possible XSS due to
  applications not performing valiation themselves

https://c-ares.haxx.se/changelog.html#1_17_2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6be5219c4122e7844f842205f343f9006a2146ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 235b7dbc66..28657645df 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40  c-ares-1.17.1.tar.gz
+sha256  4803c844ce20ce510ef0eb83f8ea41fa24ecaae9d280c468c582d2bb25b3913d  c-ares-1.17.2.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 8f200237cf..3a7c6e0298 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.17.1
+C_ARES_VERSION = 1.17.2
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
