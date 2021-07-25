Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CE2C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C83E60F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C83E60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BE3826EA;
	Sun, 25 Jul 2021 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHnlptJv9VDI; Sun, 25 Jul 2021 21:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C6E82486;
	Sun, 25 Jul 2021 21:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16021BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D120840295
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovi6NDfBalPp for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:29:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082804026F
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:29:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25E4288FC5; Sun, 25 Jul 2021 20:55:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:29:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ba7a0fd52dd0633b50a11686ebe486c9a6f33f8
X-Git-Newrev: fe68d894715e0cfd214444efb586f434802ae2c2
X-Patchwork-Hint: ignore
Message-Id: <20210725205506.25E4288FC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5declarative: fix gcc-11 compile
 failure
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
Content-Type: multipart/mixed; boundary="===============2969621300637061430=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2969621300637061430==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe68d894715e0cfd214444efb586f434802ae2c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add patch for qv4regexp_p to include c++ limits include (instead of plain
  c limit.h)

Fixes:

  In file included from jsruntime/qv4regexp_p.h:62,
                   from jsruntime/qv4regexp.cpp:40:
  ../3rdparty/masm/yarr/Yarr.h:46:44: error: ‘numeric_limits’ is not a member of ‘std’
     46 | static const unsigned offsetNoMatch = std::numeric_limits<unsigned>::max();
        |                                            ^~~~~~~~~~~~~~
  ../3rdparty/masm/yarr/Yarr.h:46:59: error: expected primary-expression before ‘unsigned’
     46 | static const unsigned offsetNoMatch = std::numeric_limits<unsigned>::max();
        |                                                           ^~~~~~~~

- add patch for qqmlprofilerevent_p to include c++ limits include

Fixes:

  In file included from qqmlprofilertypedevent_p.h:43,
                   from qqmlprofilertypedevent.cpp:40:
  qqmlprofilerevent_p.h: In member function ‘void QQmlProfilerEvent::assignNumbers(const Container&)’:
  qqmlprofilerevent_p.h:314:65: error: ‘numeric_limits’ is not a member of ‘std’
    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
        |                                                                 ^~~~~~~~~~~~~~
  qqmlprofilerevent_p.h:314:87: error: expected primary-expression before ‘>’ token
    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
        |                                                                                       ^
  qqmlprofilerevent_p.h:314:90: error: ‘::max’ has not been declared; did you mean ‘std::max’?
    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
        |                                                                                          ^~~
        |                                                                                          std::max

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-needs-c-limits-include-instead-of-plain-.patch | 41 ++++++++++++++++++++
 ...revent_p-needs-c-limits-inlcude-fixes-gcc.patch | 45 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/package/qt5/qt5declarative/0002-qv4regexp_p-needs-c-limits-include-instead-of-plain-.patch b/package/qt5/qt5declarative/0002-qv4regexp_p-needs-c-limits-include-instead-of-plain-.patch
new file mode 100644
index 0000000000..d3344c646b
--- /dev/null
+++ b/package/qt5/qt5declarative/0002-qv4regexp_p-needs-c-limits-include-instead-of-plain-.patch
@@ -0,0 +1,41 @@
+From bfd3d907f48aba870be00cd251f0b63d34985be2 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 22 Jul 2021 23:02:29 +0200
+Subject: [PATCH] qv4regexp_p: needs c++ limits include (instead of plain c
+ limit.h)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes gcc-11 compile:
+
+  In file included from jsruntime/qv4regexp_p.h:62,
+                   from jsruntime/qv4regexp.cpp:40:
+  ../3rdparty/masm/yarr/Yarr.h:46:44: error: ‘numeric_limits’ is not a member of ‘std’
+     46 | static const unsigned offsetNoMatch = std::numeric_limits<unsigned>::max();
+        |                                            ^~~~~~~~~~~~~~
+  ../3rdparty/masm/yarr/Yarr.h:46:59: error: expected primary-expression before ‘unsigned’
+     46 | static const unsigned offsetNoMatch = std::numeric_limits<unsigned>::max();
+        |                                                           ^~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/qml/jsruntime/qv4regexp_p.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/jsruntime/qv4regexp_p.h b/src/qml/jsruntime/qv4regexp_p.h
+index 6afb10ea95..c64f3d3c38 100644
+--- a/src/qml/jsruntime/qv4regexp_p.h
++++ b/src/qml/jsruntime/qv4regexp_p.h
+@@ -57,7 +57,7 @@
+ #include <wtf/FastAllocBase.h>
+ #include <wtf/BumpPointerAllocator.h>
+ 
+-#include <limits.h>
++#include <limits>
+ 
+ #include <yarr/Yarr.h>
+ #include <yarr/YarrInterpreter.h>
+-- 
+2.32.0
+
diff --git a/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch b/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch
new file mode 100644
index 0000000000..0e6da652f9
--- /dev/null
+++ b/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch
@@ -0,0 +1,45 @@
+From cc8d62f556c065d28a52e4b784b5d22f2cca3001 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 22 Jul 2021 23:13:43 +0200
+Subject: [PATCH] qqmlprofilerevent_p: needs c++ limits inlcude (fixes gcc-11
+ compile)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  In file included from qqmlprofilertypedevent_p.h:43,
+                   from qqmlprofilertypedevent.cpp:40:
+  qqmlprofilerevent_p.h: In member function ‘void QQmlProfilerEvent::assignNumbers(const Container&)’:
+  qqmlprofilerevent_p.h:314:65: error: ‘numeric_limits’ is not a member of ‘std’
+    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
+        |                                                                 ^~~~~~~~~~~~~~
+  qqmlprofilerevent_p.h:314:87: error: expected primary-expression before ‘>’ token
+    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
+        |                                                                                       ^
+  qqmlprofilerevent_p.h:314:90: error: ‘::max’ has not been declared; did you mean ‘std::max’?
+    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
+        |                                                                                          ^~~
+        |                                                                                          std::max
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/qmldebug/qqmlprofilerevent_p.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/qmldebug/qqmlprofilerevent_p.h b/src/qmldebug/qqmlprofilerevent_p.h
+index a7e37d1964..01b2f58f16 100644
+--- a/src/qmldebug/qqmlprofilerevent_p.h
++++ b/src/qmldebug/qqmlprofilerevent_p.h
+@@ -48,6 +48,7 @@
+ #include <QtCore/qmetatype.h>
+ 
+ #include <initializer_list>
++#include <limits>
+ #include <type_traits>
+ 
+ //
+-- 
+2.32.0
+

--===============2969621300637061430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2969621300637061430==--
