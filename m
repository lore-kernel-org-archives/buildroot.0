Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D8BC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC0B60F5E;
	Sun, 19 Feb 2023 22:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC0B60F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04xT05q2hXXM; Sun, 19 Feb 2023 22:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E28BC60F75;
	Sun, 19 Feb 2023 22:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28BC60F75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E20911BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB72481DFD
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB72481DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YER125eUL3o for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 22:05:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF1C88174D
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 22:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1C88174D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3CC86317; Sun, 19 Feb 2023 22:05:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 23:04:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ecaf26b5e3693cf0145a2d1fcc2e0953884baf4
X-Git-Newrev: 7b4937a1709a88f90abbeac48e2e2db33b83d44b
X-Patchwork-Hint: ignore
Message-Id: <20230219220525.DA3CC86317@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmiutil: fix uclibc build without
 wchar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b4937a1709a88f90abbeac48e2e2db33b83d44b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, wchar_t is incorrectly detected with uclibc
resulting in the following build failure:

In file included from igetevent.c:136:
imb_api.h:150:5: error: unknown type name 'wchar_t'
  150 |     wchar_t *Buffer;
      |     ^~~~~~~

The build failure can be reproduced even when reverting bump to version
3.1.8.

Fixes:
 - http://autobuild.buildroot.org/results/e9ff3bd08e106dc834968bf5e4296ce8299027f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipmiutil/ipmiutil.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index ad9fbfc24c..b48eaa7cb2 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -10,6 +10,7 @@ IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
+IPMIUTIL_CONF_ENV = ac_cv_type_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
