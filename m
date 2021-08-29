Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3721DC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:50:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95D960F4C
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B95D960F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87931605F0;
	Sun, 29 Aug 2021 22:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99UOTlZKMvd0; Sun, 29 Aug 2021 22:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C67060600;
	Sun, 29 Aug 2021 22:50:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9CA1BF94B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1877180E7F
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmpUr9oq2B_9 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 22:50:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD7880E78
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 22:50:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 82EA287793; Sun, 29 Aug 2021 22:49:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 23:19:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac2db5eb2e6091a05d1cd3d641213ab01ddb0aa2
X-Git-Newrev: 6be5219c4122e7844f842205f343f9006a2146ab
X-Patchwork-Hint: ignore
Message-Id: <20210829224905.82EA287793@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: security bump to version
 1.17.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6be5219c4122e7844f842205f343f9006a2146ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
