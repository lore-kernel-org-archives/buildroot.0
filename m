Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F77AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B41405A6;
	Sun, 13 Nov 2022 21:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B41405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGrgt0dTewW6; Sun, 13 Nov 2022 21:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E41DD405A2;
	Sun, 13 Nov 2022 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41DD405A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D741BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A30B4032F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A30B4032F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zk7JeDc69aFV for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634DA4032A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 634DA4032A
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:44:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k8so14334918wrh.1
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 13:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/GDYGG+zmfckH8F6xV1wlVytXIKniX0RPzKY2lbZ3Y=;
 b=bNTAT826ycHZENgQ+Ovp+40AzLWdhSWo9xCQeALZw+PuZ6zs93GQAiypXKwm8fQIXu
 7+enWq2g/DXDjEOfa5W9wWUHQT1Mqn8nQ0ZTP75PaTKOmCcvmu5UR7xF6K/hCE/5JooX
 IsfqExHWokTc6YguAJc887j0Ga89BLhZjxf+Fng1JeTyfNnF4IUUHrFq7qhlJ9RddMVb
 MheEfI1UcRHgoeSrF3sWCbHAZVfe+0Vqrw3E/0dneCOp8Op20BJhxF/UQ8Vwf9E6STsG
 VCpVV73vBv12vjmZmdmTGvd/b8vj5WvWhpgK5JvX3NMC12E+qb8rVWdW7ZSStMhrSrpW
 Yx0w==
X-Gm-Message-State: ANoB5plH6jsepEmkI6/AULiLNfapJPyDX3U6FAso0CAGlJ5/HGZFnHJd
 NkDncfY4H6++wJ9gncXjxqVItChrGO0=
X-Google-Smtp-Source: AA0mqf6VazbbedgzeB5p8T60G+nvxpvTXHnmlKUGffkDED2XUnGqbhGpDcOGDUmvHJJH1PBCJ9m6tA==
X-Received: by 2002:a5d:4dc1:0:b0:236:f365:b778 with SMTP id
 f1-20020a5d4dc1000000b00236f365b778mr6149479wru.515.1668375885047; 
 Sun, 13 Nov 2022 13:44:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003a2f2bb72d5sm20544596wmo.45.2022.11.13.13.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 13:44:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:44:41 +0100
Message-Id: <20221113214441.13829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/GDYGG+zmfckH8F6xV1wlVytXIKniX0RPzKY2lbZ3Y=;
 b=DSGpdzn5jq7BBqN+OZNXcTaGdZuLAjAL+zuS9NDQoo2a54FXE75QWzH4y/CW9MozEa
 Tbt1j6tMuZ9ALuJjkRXp7RvafxqVZ9CwL7iQUfGgbs9P45f638NlZlh/jQal+sNesze3
 SMJfhAAZjC/PAj3XxT7omLqwjBtrVJoYX1Xnx5q63oNBr6KTob09U0zuR9jB7SkYGjNU
 dv6reLADJcNphO4FFMiXecp0KYfa3EcNYoIT2WAlAeSbU/+CixX4QbXqBX7AHZI4n5/c
 42fkniXHvsOWF8TLgeTQ2pnmxHg8k/ENPl25o7ppbDD6+voqIazMabTzcy/rB31IkpOO
 +avg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DSGpdzn5
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: fix CVE-2020-29260
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libvncclient v0.9.13 was discovered to contain a memory leak via the
function rfbClientCleanup().

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ee-vncRec-memory-in-rfbClientCleanup.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
