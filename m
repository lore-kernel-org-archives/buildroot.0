Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E74AC678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78C6416C7;
	Sat,  4 Mar 2023 19:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E78C6416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi9yUYiwzopz; Sat,  4 Mar 2023 19:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B90BD41702;
	Sat,  4 Mar 2023 19:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B90BD41702
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2AFB1BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC4560B11
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC4560B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqBpzYGRgUjV for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 743A56077D
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743A56077D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6426586191; Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:35:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b4ec1573e11448e88667665b22692f351f135b9f
X-Git-Newrev: 755cdb0fe48ba1fb3a5f222f68732d43bbe72117
X-Patchwork-Hint: ignore
Message-Id: <20230304195240.6426586191@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ipmiutil: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=755cdb0fe48ba1fb3a5f222f68732d43bbe72117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 97a644e314..0a342dcee3 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -10,6 +10,7 @@ IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
+IPMIUTIL_CONF_ENV = ac_cv_type_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # aclocal.m4 is newer than config.h.in. Touch the latter to avoid autoreconf
 define IPMIUTIL_TOUCH_CONFIG_H_IN
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
