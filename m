Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B334C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7FD9405AC;
	Sun, 13 Nov 2022 21:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7FD9405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1s5hXrLeFC8l; Sun, 13 Nov 2022 21:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E743A405B3;
	Sun, 13 Nov 2022 21:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E743A405B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454AB1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E0B860BF6
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0B860BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBeCKLmV47XS for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:56:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C93C60BEA
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C93C60BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C8F483863; Sun, 13 Nov 2022 21:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:56:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 191fa1718f7f61ad9846a37c6f0c86a3b713e81c
X-Git-Newrev: b3ab978703e0597b4bdf17d3e32cf0357db8315c
X-Patchwork-Hint: ignore
Message-Id: <20221113215647.3C8F483863@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: fix CVE-2020-29260
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3ab978703e0597b4bdf17d3e32cf0357db8315c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libvncclient v0.9.13 was discovered to contain a memory leak via the
function rfbClientCleanup().

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nt-free-vncRec-memory-in-rfbClientCleanup.patch | 28 ++++++++++++++++++++++
 package/libvncserver/libvncserver.mk               |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch b/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
new file mode 100644
index 0000000000..7658c112f3
--- /dev/null
+++ b/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
@@ -0,0 +1,28 @@
+From bef41f6ec4097a8ee094f90a1b34a708fbd757ec Mon Sep 17 00:00:00 2001
+From: Christian Beier <info@christianbeier.net>
+Date: Sat, 21 Nov 2020 12:52:31 +0100
+Subject: [PATCH] libvncclient: free vncRec memory in rfbClientCleanup()
+
+Otherwise we leak memory. Spotted by Ramin Farajpour Cami
+<ramin.blackhat@gmail.com>, thanks!
+
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/bef41f6ec4097a8ee094f90a1b34a708fbd757ec]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libvncclient/vncviewer.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libvncclient/vncviewer.c b/libvncclient/vncviewer.c
+index d6b91f02b..0a1bdcf6a 100644
+--- a/libvncclient/vncviewer.c
++++ b/libvncclient/vncviewer.c
+@@ -534,6 +534,8 @@ void rfbClientCleanup(rfbClient* client) {
+     client->clientData = next;
+   }
+ 
++  free(client->vncRec);
++
+   if (client->sock != RFB_INVALID_SOCKET)
+     rfbCloseSocket(client->sock);
+   if (client->listenSock != RFB_INVALID_SOCKET)
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index ead809d19c..8f24e2d098 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -14,6 +14,9 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
+# 0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2020-29260
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
