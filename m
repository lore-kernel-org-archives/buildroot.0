Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70547C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1618E416B5;
	Sat,  4 Mar 2023 19:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1618E416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9Yzcr7roILc; Sat,  4 Mar 2023 19:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0D0416A9;
	Sat,  4 Mar 2023 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0D0416A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06B001BF855
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D610F408A7
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D610F408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26aLHRBdiNbL for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D98A240386
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98A240386
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6DC286161; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:35:27 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 7a6a4c8f17af92d76de9f3070598ea6953ef8055
X-Git-Newrev: aac7940dd920514e19a81be53f455a0889b99cee
X-Patchwork-Hint: ignore
Message-Id: <20230304195132.C6DC286161@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/ipmiutil: fix
 uclibc build without wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=aac7940dd920514e19a81be53f455a0889b99cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 7b4937a1709a88f90abbeac48e2e2db33b83d44b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
