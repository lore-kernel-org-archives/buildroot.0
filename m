Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A4C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218A360BF6;
	Sun, 13 Nov 2022 21:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218A360BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEY_d6rK4emg; Sun, 13 Nov 2022 21:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A35C60BEA;
	Sun, 13 Nov 2022 21:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A35C60BEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 552D71BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CC481466
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CC481466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pytwgmhs2a6p for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3B38145D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F3B38145D
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:56:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z14so14334225wrn.7
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 13:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rt4PP8hW5shFQ2Y1oC11rI4oD3YU3s0LhHgcuxNcPLM=;
 b=i3RbKaWI14rffh+qI0SQjbYeFShN8OQzc3CzRGiZxjWpF0+zxWqG9mXJif+puAdMpz
 5uyLcjJ6ciNo+YgfmiLOmQyeZ2xHG+s9VtmuSKHMYmGPb4gcRaoI/qW9SeqeMlzc6Xw7
 FnBU0UKPHL5CprKJk+RAX2Bu1PwvgW6AbGAPq0QtvpJiyixeT3RMs/dX44CvzScBV1Qn
 rwqFovgqNU2HQuZnAe+Xw5Q/gK//01RhPkSAxyZj7Pl8XvMRkXD72uDnpooR0ViBsJ7r
 alSUB+gmALMH4rTEfbqBKTuTsdm4lBxvEKqLffQTOQEyNcGCbJULvsEmBrJbSx4bG6Kt
 ZJjg==
X-Gm-Message-State: ANoB5plT6MQtyp0Iz4VPisO1BWVco1QTjv4e0Izs02923RiME6eZRbzO
 kN6cF/SfXF3SRcrv5T90vlJXYio6PaY=
X-Google-Smtp-Source: AA0mqf7/oK27l3irsla8MaNXlnQxvf5DDuCKR6e2X+X3euZtk9zWnqfeTgmPVbdgQj5PqQ+o2wYRSw==
X-Received: by 2002:adf:f543:0:b0:236:86f2:b444 with SMTP id
 j3-20020adff543000000b0023686f2b444mr6032079wrp.58.1668376561752; 
 Sun, 13 Nov 2022 13:56:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 a11-20020a5d570b000000b0022ca921dc67sm7786862wrv.88.2022.11.13.13.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 13:56:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:55:58 +0100
Message-Id: <20221113215558.17757-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rt4PP8hW5shFQ2Y1oC11rI4oD3YU3s0LhHgcuxNcPLM=;
 b=F09LLreSg0wg8BeF3pbnAVtnVVnPTl6Qtnl2K4Kl0bjPErzf3rCPnRPdbBl9dd9qM/
 2bWMGRWtoD3m7Dyoy7+KfZWwO+pgCEwBxngcDfiEmVTf5zrfNbX6IE2qrB1DVjErsEDf
 wgRdUB1/1pL8cVRGS5AE6iweorO2MuPD6ZBhNr9ZEa5LEZJk6dDzoJ4HNtNKX21UtePN
 OxTNYXFVaIHFJZ9DVbErUAl6HC28mjJzqGkFQ9gsQTwgNw8aFgGxRfMGJojwwKH59b0v
 Sdph6n8s9jnLIlUAFmCj9e593/+NThknPCdXuzR2QrKHaTXMQFF32J0I5yDA66nka2QE
 Ml/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F09LLreS
Subject: [Buildroot] [PATCH v2, 1/1] package/libvncserver: fix CVE-2020-29260
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
Changes v1 -> v2:
 - Add LIBVNCSERVER_IGNORE_CVES

 ...ee-vncRec-memory-in-rfbClientCleanup.patch | 28 +++++++++++++++++++
 package/libvncserver/libvncserver.mk          |  3 ++
 2 files changed, 31 insertions(+)
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
