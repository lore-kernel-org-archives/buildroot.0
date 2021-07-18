Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E818C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BC26103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62BC26103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36268405FB;
	Tue,  3 Aug 2021 23:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhlocFdqiKgM; Tue,  3 Aug 2021 23:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32BB9405B1;
	Tue,  3 Aug 2021 23:37:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 206DD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0606840E8E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4XGkhV0xbrb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FC7540E97
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6449D83FEF; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 09:32:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 74adec4f3ab01336f24e8d1430c7a648bc8f5505
X-Git-Newrev: 6202ba67b74e9de7099df8b98e3db8d33490996a
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.6449D83FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5base: fix another
 gcc-11 compile failure
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
Content-Type: multipart/mixed; boundary="===============8754324540402104304=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8754324540402104304==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6202ba67b74e9de7099df8b98e3db8d33490996a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- add upstream patch fixing gcc-11 compile failure (missing
  limits include)

Fixes:

  In file included from ../../../include/QtCore/5.15.2/QtCore/private/qoffsetstringarray_p.h:1,
                   from ../../dbus/qdbuserror.cpp:44:
  ../../../src/corelib/tools/qoffsetstringarray_p.h:70:22: error: ‘numeric_limits’ is not a member of ‘std’
     70 |         Last <= std::numeric_limits<quint8>::max(),
        |                      ^~~~~~~~~~~~~~
  ../../../src/corelib/tools/qoffsetstringarray_p.h:70:43: error: wrong number of template arguments (1, should be 3)
     70 |         Last <= std::numeric_limits<quint8>::max(),
        |                                           ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../qt5base/0008-Add-missing-limits-include.patch  | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/qt5/qt5base/0008-Add-missing-limits-include.patch b/package/qt5/qt5base/0008-Add-missing-limits-include.patch
new file mode 100644
index 0000000000..e489f2e551
--- /dev/null
+++ b/package/qt5/qt5base/0008-Add-missing-limits-include.patch
@@ -0,0 +1,32 @@
+From 87a869a8404047240cccaa9f101351aeb9417a26 Mon Sep 17 00:00:00 2001
+From: Nicolas Fella <nicolas.fella@kdab.com>
+Date: Sun, 20 Jun 2021 17:36:41 +0200
+Subject: [PATCH] Add missing limits include
+
+The code uses std::numeric_limits but is lacking the appropriate include
+
+Pick-to: 5.15 6.1 6.2
+Change-Id: I41fa5ac4d8c4e06f35b5b1551ef2ad8417df80bd
+Reviewed-by: Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
+
+[Upstream: https://code.qt.io/cgit/qt/qtbase.git/patch/?id=2b2b3155d9f6ba1e4f859741468fbc47db09292b]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/tools/qoffsetstringarray_p.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/corelib/tools/qoffsetstringarray_p.h b/src/corelib/tools/qoffsetstringarray_p.h
+index 4dd9e960..e26a57ff 100644
+--- a/src/corelib/tools/qoffsetstringarray_p.h
++++ b/src/corelib/tools/qoffsetstringarray_p.h
+@@ -55,6 +55,7 @@
+ 
+ #include <tuple>
+ #include <array>
++#include <limits>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-- 
+2.32.0
+

--===============8754324540402104304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8754324540402104304==--
