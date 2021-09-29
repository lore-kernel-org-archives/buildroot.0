Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E62AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51610613A7
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51610613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19AA14072E;
	Wed, 29 Sep 2021 19:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0Q_01weGGzG; Wed, 29 Sep 2021 19:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 294C340730;
	Wed, 29 Sep 2021 19:49:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBBA51BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7B3840730
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jm-ZeU_5Ikpo for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:48:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D6B4072E
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:48:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75D798D677; Wed, 29 Sep 2021 19:46:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:47:24 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2980054d7d78c033baa9237ce21960ec27e9a906
X-Git-Newrev: 6f3f93adb7529bdf31e6cc9963ca8ac8996e852c
X-Patchwork-Hint: ignore
Message-Id: <20210929194620.75D798D677@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libyang: security
 bump to version 1.0.240
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f3f93adb7529bdf31e6cc9963ca8ac8996e852c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 800bf65adca7d68dcbe551a74c62985c34c0f81f)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
