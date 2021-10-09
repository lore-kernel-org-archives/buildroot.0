Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2942C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DB860F9D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89DB860F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A6F40307;
	Sat,  9 Oct 2021 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouYvv89I0HN2; Sat,  9 Oct 2021 20:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAAE4068C;
	Sat,  9 Oct 2021 20:56:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1FE71BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4F44058D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6H37D4kV3JmO for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1A2440627
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id 21so2286149plo.13
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8BdQJLI7PdnDlC0PY58TbfQ7qxtHTD6JK7hpzenULg=;
 b=joCdWkm4pW3S8oBxEk09IDVTo30DO7Fx8caTGOMMzuP6nM7YPiH2Hkh+u3zDEQ3pz0
 83Iinl3s4gopnvpcW+mCLiF73jxm4J6RvnlQWowNdxGs3RnquHNU5mp7EeN59yqDhTa4
 vlvTDt4qZcXK9GRW6WgWaI61wBWnkq5SLUz5urvxH4qH2hDWg4PhE679srFl6Z6B84vq
 k50H2AMZQaivSDNfurtd7cnsZw3dioplz4n7+iUYqth+a/xSLYAAqT13QQUvWK+t9OWs
 IJUjwzbXB19sZK9sCnBDwIMy978XcFkNRKDBlxbpXL4sEBUIRS/cApVwN7flEEHEgFnN
 udWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8BdQJLI7PdnDlC0PY58TbfQ7qxtHTD6JK7hpzenULg=;
 b=M2m6SJdH5/LFPuBgYvMZf3b97L5LRFjyDp1igpT5JtC9oiWc9ItF8jnUp9RRSFGIZB
 bM87ccsfeC/dvBBAWP7XnI4bHaIv+w8xFt1KB1N3PoYMmjN+tptJAgwkR/ApFNWIOEct
 vMVvRdZoFve7WGvC1td3DuCE0C4KeE0/jfWvRh6bNksqhRkwgjPEMecK2sw7IKpUEGb0
 jvVv6L4PB8t/SHH+j8oPiv3M8Qd1hwfoXjl6cjXIJg9aUJsOWfwG61+c7wsvuf3t12/m
 vnt52MrKuUoPpchXHONc5Q9+PwQ/bZMoilRAhw7h7eoAP1tXuIsgrbRUlfB11OFaDZow
 Exqw==
X-Gm-Message-State: AOAM532OhaPtNN1ZeU1H1Unf0OwfVrWROzt+szHoHx8SwnHCndSzJYhm
 NX1rHQU0CLI438guizzK7A2r32ADugrC6Q==
X-Google-Smtp-Source: ABdhPJyS2WAZT1lYezA/6//pe3eftd+4cJiJRPgoHO1soxLu/EQomKuUz4ZQ0RYXT1HvulKrkbB/rA==
X-Received: by 2002:a17:90a:a88a:: with SMTP id
 h10mr20119422pjq.226.1633812932080; 
 Sat, 09 Oct 2021 13:55:32 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:31 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:08 -0700
Message-Id: <20211009205523.3137859-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/20] package/python-gobject: bump to version
 3.42.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also change -Dpycairo=false to -Dpycairo=disabled as the option type has
changed to a feature.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index fd2235f201..100a05c74e 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.36/pygobject-3.36.1.sha256sum
-sha256  d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f  pygobject-3.36.1.tar.xz
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.0.sha256sum
+sha256  9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b  pygobject-3.42.0.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 0cada82fb7..b0a132d040 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.36
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
+PYTHON_GOBJECT_VERSION_MAJOR = 3.42
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
@@ -18,7 +18,7 @@ PYTHON_GOBJECT_DEPENDENCIES = \
 	python3
 
 PYTHON_GOBJECT_CONF_OPTS += \
-	-Dpycairo=false \
+	-Dpycairo=disabled \
 	-Dtests=false
 
 # A sysconfigdata_name must be manually specified or the resulting .so
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
