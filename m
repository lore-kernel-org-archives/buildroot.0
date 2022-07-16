Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6212BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F378960D53;
	Sat, 16 Jul 2022 22:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F378960D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cC7o49PhGu5d; Sat, 16 Jul 2022 22:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB8DB60B4D;
	Sat, 16 Jul 2022 22:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8DB60B4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB861BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 784E6847B6
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784E6847B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voRnYZqWSYeG for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:06:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A761D84794
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A761D84794
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DC16A8396B; Sat, 16 Jul 2022 21:53:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 00:05:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33599d5f35bce2b45205bc85cf1eff093f4fadc6
X-Git-Newrev: e23b230a203ea974479fdc9fbc703eaa23b4d35b
X-Patchwork-Hint: ignore
Message-Id: <20220716215312.DC16A8396B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: fix build with musl 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e23b230a203ea974479fdc9fbc703eaa23b4d35b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl 1.2.3:

ola/AutoStart.cpp: In function 'ola::network::TCPSocket* ola::client::ConnectToServer(short unsigned int)':
ola/AutoStart.cpp:116:12: error: invalid cast from type 'std::nullptr_t' to type 'char*'
  116 |            reinterpret_cast<char*>(NULL));
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/88be323e64f66433cabc962e719307b5fb6a6177

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
