Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF48C19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6174610C6;
	Thu,  4 Aug 2022 15:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6174610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UoUVtSN-0dKy; Thu,  4 Aug 2022 15:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC45C60ACD;
	Thu,  4 Aug 2022 15:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC45C60ACD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D23C31BF83E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA6960ACD
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA6960ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H95mWFKh6Bko for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E64A1605E9
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E64A1605E9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 531B486E3F; Thu,  4 Aug 2022 14:49:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Aug 2022 17:01:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c5d717492d117ebd6b8b8546d7a26fc0712b08b4
X-Git-Newrev: d23382db1f6d8f8dd1644a8927f44f8c55b6f48d
X-Patchwork-Hint: ignore
Message-Id: <20220804144956.531B486E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ola: fix build
 with musl 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d23382db1f6d8f8dd1644a8927f44f8c55b6f48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with musl 1.2.3:

ola/AutoStart.cpp: In function 'ola::network::TCPSocket* ola::client::ConnectToServer(short unsigned int)':
ola/AutoStart.cpp:116:12: error: invalid cast from type 'std::nullptr_t' to type 'char*'
  116 |            reinterpret_cast<char*>(NULL));
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/88be323e64f66433cabc962e719307b5fb6a6177

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e23b230a203ea974479fdc9fbc703eaa23b4d35b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ola-fix-compilation-with-musl-1-2-3.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
new file mode 100644
index 0000000000..f236ef0957
--- /dev/null
+++ b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
@@ -0,0 +1,35 @@
+From eb31017284f9a1c95602a9c06d606df6b558a691 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Thu, 14 Apr 2022 17:39:32 -0700
+Subject: [PATCH] ola: fix compilation with musl 1.2.3
+
+musl 1.2.3 defines NULL as nullptr. cannot use reinterpret_cast with
+nullptr.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+[Retrieved from:
+https://github.com/OpenLightingProject/ola/pull/1773/commits/eb31017284f9a1c95602a9c06d606df6b558a691]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ola/AutoStart.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ola/AutoStart.cpp b/ola/AutoStart.cpp
+index 89fa51f115..4dbe20d317 100644
+--- a/ola/AutoStart.cpp
++++ b/ola/AutoStart.cpp
+@@ -110,11 +110,11 @@ TCPSocket *ConnectToServer(unsigned short port) {
+     // Try to start the server, we pass --daemon (fork into background) and
+     // --syslog (log to syslog).
+     execlp("olad", "olad", "--daemon", "--syslog",
+-#ifdef __FreeBSD__
+-           reinterpret_cast<char*>(0));
++#if __cplusplus >= 201103L
++           nullptr);
+ #else
+            reinterpret_cast<char*>(NULL));
+-#endif  // __FreeBSD__
++#endif  // __cplusplus >= 201103L
+     OLA_WARN << "Failed to exec: " << strerror(errno);
+     _exit(1);
+   }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
