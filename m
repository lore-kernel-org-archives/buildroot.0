Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F9281CA7;
	Tue, 15 Nov 2022 13:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02F9281CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ra5K7f77iNEt; Tue, 15 Nov 2022 13:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353A481CDB;
	Tue, 15 Nov 2022 13:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 353A481CDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91BAE1BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C5D340872
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C5D340872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpdfqFqcNYrv for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7339E404EB
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7339E404EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61D0C83CB8; Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:26:42 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 1d74a06d627d181e254344b1f553576557f3f21e
X-Git-Newrev: f3bc8807428924d78eb1df695a7016ad361b89e4
X-Patchwork-Hint: ignore
Message-Id: <20221115132927.61D0C83CB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libvncserver: fix
 CVE-2020-29260
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3bc8807428924d78eb1df695a7016ad361b89e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

libvncclient v0.9.13 was discovered to contain a memory leak via the
function rfbClientCleanup().

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b3ab978703e0597b4bdf17d3e32cf0357db8315c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
