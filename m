Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF05C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 18:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B93610A6
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 18:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7B93610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F7A60631;
	Sat, 18 Sep 2021 18:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7bBQMaP1ctX2; Sat, 18 Sep 2021 18:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B02260604;
	Sat, 18 Sep 2021 18:58:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 973BE1BF847
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 18:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C74D84015
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 18:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-aIhR8af0M6 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 18:58:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 588DA84013
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 18:58:26 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0A6AA20002;
 Sat, 18 Sep 2021 18:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mRfXa-0003tZ-6t; Sat, 18 Sep 2021 20:58:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 20:58:14 +0200
Message-Id: <20210918185816.14928-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libyang: security bump to version
 1.0.240
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
Cc: Jan Kundrat <jan.kundrat@cesnet.cz>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fixes the following security issues:

- CVE-2021-28902: In function read_yin_container() in libyang <= v1.0.225,
  it doesn't check whether the value of retval->ext[r] is NULL.  In some
  cases, it can be NULL, which leads to the operation of
  retval->ext[r]->flags that results in a crash.

- CVE-2021-28903: A stack overflow in libyang <= v1.0.225 can cause a denial
  of service through function lyxml_parse_mem().  lyxml_parse_elem()
  function will be called recursively, which will consume stack space and
  lead to crash.

- CVE-2021-28904: In function ext_get_plugin() in libyang <= v1.0.225, it
  doesn't check whether the value of revision is NULL.  If revision is NULL,
  the operation of strcmp(revision, ext_plugins[u].revision) will lead to a
  crash.

- CVE-2021-28905: In function lys_node_free() in libyang <= v1.0.225, it
  asserts that the value of node->module can't be NULL.  But in some cases,
  node->module can be null, which triggers a reachable assertion (CWE-617).

- CVE-2021-28906: In function read_yin_leaf() in libyang <= v1.0.225, it
  doesn't check whether the value of retval->ext[r] is NULL.  In some cases,
  it can be NULL, which leads to the operation of retval->ext[r]->flags that
  results in a crash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 94685cb4de..755ecf390a 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1b736443d2c69b5d7a71ac412655e6edab0647b18f35f7bf504b0a24e06cb046  libyang-1.0.225.tar.gz
+sha256  8576cad398b451b1c622b0652a2030fcf83ee1d9a39e6cd93d17b0a5a43118d6  libyang-1.0.240.tar.gz
 sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index ed61ec97d2..f784367ea3 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.225
+LIBYANG_VERSION = 1.0.240
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
