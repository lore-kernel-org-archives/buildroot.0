Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585C9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 21:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F40A81499;
	Tue, 22 Feb 2022 21:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGi5pTc1vjnd; Tue, 22 Feb 2022 21:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420FB813F5;
	Tue, 22 Feb 2022 21:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6561BF39A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B1A40207
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J10xgZOX8FTF for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 21:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA9DF40168
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 21:43:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f17so11108942wrh.7
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMb/gJFW0zzhVILH22rJx9H4F+7O1hnvnYcqoS0zN7w=;
 b=hE6lQkrt25KeQBiLYKPl6CbaLKpR7O7XjvMg5Uc+UhYW/vmKNyTw7rFRHdg0qZQaVn
 InvT9GApUshCy+7rbvbKrVdyqIhnNRdlBdl+hE41nEe1F9asaJAouKq0Je3jQ80a2KMw
 uOV+fB8OLntZgRVxK26BGkiRWS/VAaNW12JCyRR2UwoBzBKMXF3DLtrJYnFd0gaAR+SC
 GV+ejqc+tN/JsLl7hky10Ht0I5vdy0pR7hAbQ6BprwstvEsrekdkfZN+N0iG++DuSmwv
 oyLqNAWQIKu6T64+Gig+omcpEsXL19X+rGdGBLtu+C5uPo7fOoO33pimIiZaLmbIKQxj
 a4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMb/gJFW0zzhVILH22rJx9H4F+7O1hnvnYcqoS0zN7w=;
 b=MVQFzPKY+pcn2Z2AvONeSLcVXluB/EundUOujMvvERFjmGIyk1DwCPpeH5XGGgvIde
 FcTnr9hdW4MMr6VWevJ6HnjHZmr8iuMgBB7RkKXj8TtxN6+N/YZ35xjK1vIYFFv8f9fU
 cRVRKHH1x1vFUmLGXfjvnHM3hSVShwO0kXLn1X17ZFOMPwQkyAc33/D+jaNM0gcTPmhE
 EJmZcxyc+MY2GTHRJQDPTFZgLBXoRzuV/wntqLBZcsvYas8i7FOCCWE7o2SLu6rRf/x+
 8UKh/088hLIbE3wnE4T8nEaRGqfU8uLvuSvq50Fk78kO8O+CEwSBwCMja7A3u5226nM6
 4nXw==
X-Gm-Message-State: AOAM533fddEnrk7MXmiI/fPYetNLioz1jMNI07QP8oQy5c0FrsF1HcPC
 R1L32kZ/JPJSgH0xQ+2gSTdxOM7GmYw=
X-Google-Smtp-Source: ABdhPJxZlLDkY29Rjeaavg0kffAmLfNFCaR74z/qA6ZhlWRG3LfJqSMVfdPvNwLZ7GL1oHc7d7AN8Q==
X-Received: by 2002:a5d:4c41:0:b0:1e5:1a70:fb86 with SMTP id
 n1-20020a5d4c41000000b001e51a70fb86mr20625696wrt.452.1645566201924; 
 Tue, 22 Feb 2022 13:43:21 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c4sm35692286wri.22.2022.02.22.13.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:43:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 22:42:47 +0100
Message-Id: <20220222214247.3163690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/duktape: bump to version 2.7.0
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

Update hash of license file (update in year:
https://github.com/svaarala/duktape/commit/03d4d728f8365021de6955c649e6dcd05dcca99f)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/duktape/duktape.hash | 4 ++--
 package/duktape/duktape.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index 4c55e39888..ef6f55aa9d 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  96f4a05a6c84590e53b18c59bb776aaba80a205afbbd92b82be609ba7fe75fa7  duktape-2.6.0.tar.xz
-sha256  5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8  LICENSE.txt
+sha256  90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890  duktape-2.7.0.tar.xz
+sha256  c6b6659630ca6cb837afe982ecc79511bfca878b56296d628b02eb6f18789c29  LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 89a6e451f5..674c5e9323 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = 2.6.0
+DUKTAPE_VERSION = 2.7.0
 DUKTAPE_SOURCE = duktape-$(DUKTAPE_VERSION).tar.xz
 DUKTAPE_SITE = \
 	https://github.com/svaarala/duktape/releases/download/v$(DUKTAPE_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
