Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8F7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 20:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0BD84CB6;
	Fri, 17 Dec 2021 20:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2qgvs5h1A5r; Fri, 17 Dec 2021 20:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F9F84C4C;
	Fri, 17 Dec 2021 20:22:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55B531BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB4B40579
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG9Ao2xv-W_W for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 20:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 284B44032E
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 20:22:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t18so6139761wrg.11
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 12:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ExAQMNjrWHgfs1Jpaj4yJeEQbBG689P+3N+htnJ4Bn0=;
 b=Ok5g4rrq7v+KcbkdDKdDg3arUlR66u5Y3mCl9mpGyUhoyFHe6Lb6XGXYy5aD9Bdzze
 3ywhr79BgyXnaVkOvodUuIFOu+tdNTmzFIDJGnKf+oKae9AZmWhztK5D5OgW1+KYL2DS
 niNtrUJpu3TDDCHl7h1/B+BP00PTuRaxWj/RPszH5YSe8PLspGOCModOkxhu1g+lj5/k
 TQic07OiP/M+mERZfDhUjZ0E1f8aC5SErVX7RgX0W5LSdArRDUIaKEdMehBVJx57mlPf
 XKOu6whnr8WjTAT013/VkQt+KinQ69vjhNMtIXA12ARtWq0H6r9dXbMZ6JhG6ovpsb0j
 KaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ExAQMNjrWHgfs1Jpaj4yJeEQbBG689P+3N+htnJ4Bn0=;
 b=NILwMVO/Gwtgt0WzSagEF/jlcvtWs1Ux7gA7OCB1f0iSF5a3ktFnY+Yvl93ojZrKJF
 R9A4Gjf15lSYfRiixi9aH+tV3bCrL3wBkanPLLx+Wy9b8mNGVQG09gfM53Pxi7Kvy9yp
 eCaK5AToywr4HeUsHbKp4yx0+3CITkrkIZ1HfLehMkP+umMa9v7pdywHD7L/0l3TnVXP
 rqt4RTLbzb4oPzzAXCgO83AeZrJIdCq+jkoagOCmim6z9cGmPwzOWpcdRWIh7kvdwUQe
 ewvl/sqKox4zRsCYkhQzd9Ra3jLTAjtgPm+WnaNcPYtfVTqNaK5rnljIEpNUAzNUK2GR
 Z5og==
X-Gm-Message-State: AOAM531aYgvlS3JFH04xSA/iEH5T8/hiWB1a6a6kXaNAjzEJjhBs2jxx
 zcacKpVPFVrjLcUT/AlvXKA3pw7UtAtUHw==
X-Google-Smtp-Source: ABdhPJyk6DcdjFBDL3urO+oncQgg/wHyrfz/RtbARmkf1240TH8xB0O9BzBDKY7+TuSFVgt719dC9g==
X-Received: by 2002:a05:6000:1c7:: with SMTP id
 t7mr3944261wrx.656.1639772544080; 
 Fri, 17 Dec 2021 12:22:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m1sm7641798wme.39.2021.12.17.12.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 12:22:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 21:21:57 +0100
Message-Id: <20211217202157.36875-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.17
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

https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 3169923c3d..90d467d1f3 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2020-02/msg00002.html
-sha256  cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c  ed-1.16.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html
+sha256  71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54  ed-1.17.tar.lz
 # Locally calculated
 sha256  f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 1b299781d0..975cf3be10 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.16
+ED_VERSION = 1.17
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
