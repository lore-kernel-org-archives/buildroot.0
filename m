Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A18C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BB560EDF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79BB560EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C6680DED;
	Mon, 25 Oct 2021 09:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zul5D3KlYvsr; Mon, 25 Oct 2021 09:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D0CA80DE6;
	Mon, 25 Oct 2021 09:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC57D1BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8747440287
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcXBNPTsspLZ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:32:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1236F4028C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:32:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 726F1886E6; Mon, 25 Oct 2021 09:28:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 10:58:30 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 68a2171ffcbfa2ede44b784ccf1815484fd86c15
X-Git-Newrev: bff688055394117502784cf60b4499a8fdab8373
X-Patchwork-Hint: ignore
Message-Id: <20211025092854.726F1886E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/hiredis: security
 bump to version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bff688055394117502784cf60b4499a8fdab8373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix CVE-2021-32765: Hiredis is a minimalistic C client library for the
Redis database. In affected versions Hiredis is vulnurable to integer
overflow if provided maliciously crafted or corrupted `RESP` `mult-bulk`
protocol data. When parsing `multi-bulk` (array-like) replies, hiredis
fails to check if `count * sizeof(redisReply*)` can be represented in
`SIZE_MAX`. If it can not, and the `calloc()` call doesn't itself make
this check, it would result in a short allocation and subsequent buffer
overflow.

https://github.com/redis/hiredis/blob/v1.0.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e092ba253414479c48a283517a2bd66abb6a8bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiredis/hiredis.hash | 2 +-
 package/hiredis/hiredis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index fc01d1f60d..a45cf68f99 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f  hiredis-1.0.0.tar.gz
+sha256  e0ab696e2f07deb4252dda45b703d09854e53b9703c7d52182ce5a22616c3819  hiredis-1.0.2.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f340fb8a4d..a571951fa3 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HIREDIS_VERSION_MAJOR = 1.0
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).2
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
