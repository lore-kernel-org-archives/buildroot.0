Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C46C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 21:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21678138D;
	Sun,  7 Aug 2022 21:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21678138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfGWdaBQabRF; Sun,  7 Aug 2022 21:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE819813A2;
	Sun,  7 Aug 2022 21:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE819813A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FEA51BF368
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73CBA60BE5
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73CBA60BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEiMpkCFWKnS for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 21:29:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD8E60BDE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AD8E60BDE
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 21:29:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z16so8860741wrh.12
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 14:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9hCaDHrX+RMqMtIEShDWVuJV3Q6/4ig4JhFc2V3brTw=;
 b=58uxegLX11xqTcIg5W4fNxX8ZvS04+bO3aucW9WHa0PuLs4VyH+4wmPAog1jhMfpZT
 7Ixg/VUWuTWvr3Aldq4pp/7MtpZndL57phvg+bEtbxac0Jra7vQekJFCpOHZDXrkxwkn
 Qnsudr3vpoyVBzvGOTk/+wTEGgBFeSsN+a8hkyJLADdGnhW4/6X3mJi2D+ppSPCa0Yam
 0a846jw2hSfkylqqfspQapoAZ691lG2URsomlh1IFi4+Oxwdox6bvZYp2uh9rBVKpiH0
 g269kgy7Giv8YORRIHJ/xJ4nodeY8ZSocVU+OuUSzPlZlC/iCqyPaxqvFxCkK7juCKMV
 I0Bw==
X-Gm-Message-State: ACgBeo1lemXvQN1FOGMRpn0ZEiDFIkwM/OdsYM539iHostlY/tQWQeXU
 +j0kSyDl3caTmcHz7iy9id76y6oecJY=
X-Google-Smtp-Source: AA6agR7PvVBHhtJKGZn+hHOkG3kF8lHlL3OnJ1YAMFS39Wq5v42hPRqPm/NbGyn+dulUmhTx9xkoVg==
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr10075229wrz.379.1659907785918; 
 Sun, 07 Aug 2022 14:29:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm6419114wmk.4.2022.08.07.14.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 14:29:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 23:29:43 +0200
Message-Id: <20220807212943.181412-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9hCaDHrX+RMqMtIEShDWVuJV3Q6/4ig4JhFc2V3brTw=;
 b=b+5w2/daKPDD7CCQBkiug3+EnOcYJDA8wShdPFuM9MAKihuMolOgP/cPYAEZwQtBM/
 1aw3WjOEso+zTCQbl8Toohq9IWGewOzrNTM7YIhXCTKRvJGzKZNvxwoMAhak2BI81lfE
 j0fkxMXlS4jqycTTg7CVdhzg4+U2PzdhEASzvuMGasQBjHkVD/JMBh+IwSqJH87z2ZMH
 HoNlTui28PZC6cm00pmV4gK1wv1ixI1Sm1I5mhNt3A6qShdcrTZGmx6r1FKOg4xaC6aA
 VrYZriO2q5kwZVhLGqKz1WYKXEROLmYy23fS047tcnLRNrsbrg6Cp3l2e/r3Pev+oJNY
 Ae3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b+5w2/da
Subject: [Buildroot] [PATCH 1/1] package/libgudev: bump to version 237
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
Cc: Nathaniel Roach <nroach44@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/libgudev/-/blob/237/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgudev/libgudev.hash | 4 ++--
 package/libgudev/libgudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index 1040ffb0c0..3933e55de4 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/236/libgudev-236.sha256sum
-sha256  e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524  libgudev-236.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/237/libgudev-237.sha256sum
+sha256  0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa  libgudev-237.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index eabd446d7b..27244c3072 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 236
+LIBGUDEV_VERSION = 237
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
