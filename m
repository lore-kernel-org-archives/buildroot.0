Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDFEE7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7759481B70;
	Thu, 21 Sep 2023 18:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7759481B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwOFPQYcX9Ag; Thu, 21 Sep 2023 18:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1AB80E66;
	Thu, 21 Sep 2023 18:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1AB80E66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9511BF3CA
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D3D6103D
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D3D6103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfiIdQ_LcjLh for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:19:24 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E2E660D4C
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2E660D4C
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c0c6d4d650so10960295ad.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695320363; x=1695925163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgjoHFM/P+TDwCell1uI0k8QS8k/+jiVF2+vqkNeOSY=;
 b=fq4oYK89hkiK4bMM2+GQEOVylfSHObS582wLI269au/EsEV/08OERf515s4yr7yCbn
 yAqZQuBQAZCm/FMSi1KLcUsIImknF1cxGzYdHSf/Ohl6DKF8rN0VbpasXpDVFKG3IOqT
 vF37wd2qvH5tkZb45/SmnDZriNtZbc1dWr622Pzt4apJqQD7cKEnjq+4lQi7w5Rv9sfY
 jrLBQLzlNvBaFz+HcWASgiecjWabkCo4fmocfguISDWEiUMgm2t6FA+s8tbSOLtIzwGa
 bascwc6zC9s2Mts8XvcXZQWaOZ4OlhguMTJl+SjjygRgPKEkCMyMH3bZkv+pFmkeDgNg
 iwXw==
X-Gm-Message-State: AOJu0Yx7ITHGc8LS+7DiPuj4lfoXv/mYa8A7RMWQMP1r4QedvOqAlczn
 la/md5RFcYv9CUxb8cf+M+osVoTzXRA=
X-Google-Smtp-Source: AGHT+IFC/Wow0LaH9lIl/RDYTXt4ocjkyVEovCEMbTnl15aO5eaH+z8WOuT4Wm+cTaa/WKE2vyYzEA==
X-Received: by 2002:a17:902:8c93:b0:1bb:9f07:5e0 with SMTP id
 t19-20020a1709028c9300b001bb9f0705e0mr5410965plo.60.1695320363565; 
 Thu, 21 Sep 2023 11:19:23 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1826745plp.3.2023.09.21.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 11:19:23 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:19:16 -0600
Message-Id: <20230921181916.546643-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921181916.546643-1-aduskett@gmail.com>
References: <20230921181916.546643-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695320363; x=1695925163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgjoHFM/P+TDwCell1uI0k8QS8k/+jiVF2+vqkNeOSY=;
 b=CFEjqRJISfxOST9a6Auo+vLFS/2BljohmyFjL7GJVxONAo5u1uVidIpCfOdCbyporJ
 v5ITpftxsXOFRpDEZ8Aut6LLqgCr6+c3iI+4mYVYyKT5hc2U7aNj0iFhxRzs4r3QD7UD
 QnNXHVqnKR9miOYKj9e0PQ52CDyLN6IbZbcOAIN6giZnWdpqJmqkh+If/Xgd9HSkWzIQ
 5r04WmFtuIpCA8YH1qK13mLsN42t6LRDmvKKCOFs8aLmTLtID4GvYl9Tn+ryLPSmHmiz
 NrU0AfcKIUWpl7EgF9sD9gcGdC+5cdQJMEkHKd3UH9TqNWqXjgaaYrbF4OsGxhLw0mga
 ukuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CFEjqRJI
Subject: [Buildroot] [PATCH 3/3] package/gobject-introspection: bump version
 to 1.78.1
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
Cc: Adam Duskett <aduskett@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/gobject-introspection.hash | 4 ++--
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 063b96275d..d6fd8a9d72 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.sha256sum
-sha256  196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf  gobject-introspection-1.76.1.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.78/gobject-introspection-1.78.1.sha256sum
+sha256  bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4  gobject-introspection-1.78.1.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f0c7fcd2ca..2c0253fae3 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.76
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.78
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
