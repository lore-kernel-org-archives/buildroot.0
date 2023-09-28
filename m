Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977D6E732FE
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 17:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D4240313;
	Thu, 28 Sep 2023 17:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D4240313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LwFOFHVyBOF; Thu, 28 Sep 2023 17:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B2E40318;
	Thu, 28 Sep 2023 17:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B2E40318
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 782A01BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6066D4060C
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6066D4060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGR64QQIkTdg for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 17:10:13 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72137405AB
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 17:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72137405AB
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso69050415e9.0
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 10:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695921011; x=1696525811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBnDYuQMahfB2PsPJDnai0q7okDV5bIEtV5LPNVgdpA=;
 b=ajOcw8wU1yZhKZoV65Vy3MOS/kQJY5PVFt+h+Pi25QpW4Z6SHf7hVdJsWTlXDNM43Z
 FL0Z8a8yMVXDJC7eE9BAlHo0Y2qF4heouyH42dJyUbBU4vTmUhNU7wWq2ATHzSJ4KbcN
 4DxMY54tavvHvfxiQZMAeaAHJxccKnZlFvutJo2JkK3qMbOiuaqDJELWAF0I21yZX2ky
 FID1QqoK3Nk3VXV0B1zjNsxXcBIjT3nPh8Wd9VRr22eSUHLDxsWD+4JKLEpS6OfkuHN/
 /kHsJGagLgo0kIInh/fpNxX3J6TSq+rix0Ax/g8vEeE+WSppbVh0a81+Kg5Ues7tY8a3
 ELXg==
X-Gm-Message-State: AOJu0YwK1B71awbDAkSIu2vTTNz2RDyf+hG9g+35dWTTIZ68pkV0kfIU
 RaF75ooX5BkXlrcPezn4mgzJMazGbHU=
X-Google-Smtp-Source: AGHT+IFPPgcfjRvd6AeuxUu7jqXq0LCYbLRARaUV1QV9Y+HA5HdrSlpGF6qyPbtVUzifpiGRIsl9RA==
X-Received: by 2002:a05:600c:3b2a:b0:406:45c1:4dd with SMTP id
 m42-20020a05600c3b2a00b0040645c104ddmr1928913wms.14.1695921010561; 
 Thu, 28 Sep 2023 10:10:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003fe23b10fdfsm23329640wmi.36.2023.09.28.10.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 10:10:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 19:09:55 +0200
Message-Id: <20230928170955.347663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695921011; x=1696525811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBnDYuQMahfB2PsPJDnai0q7okDV5bIEtV5LPNVgdpA=;
 b=EC5Jfp6twjqMQzWITir+HppJNDKWvM8PMnSaQG7RY5cCg60eJ65iXhIQupdIDjpoBb
 GsALpm9wDH9wUuPhJ2cmG/Ui4Rj0yV9LXo2klNv4bbq6dM9KYFpKW3E8QVvT4mXGcxWK
 W063EV9+seUPiBOdy5UfJSxMvDmIhIvbiVgr+5Nb/JKpc8WvrVdvdhumliM0zcFHMJZP
 LC1eTy3Yta5EL2FgYjwwTPDYDcFZYn4LX9bhC1MrY+R5vXnHBx8DTRUraGrgmA5QN+A5
 htLKd5Ux0j5rNnkw7ByF8Ft7dA58NYVCH1NSgEApJi7f/ZHu9ixhyWaLCDI1hHnZjAas
 oFTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EC5Jfp6t
Subject: [Buildroot] [PATCH 1/1] package/librsvg: security bump to version
 2.50.9
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

Fix CVE-2023-38633: A directory traversal problem in the URL decoder of
librsvg before 2.56.3 could be used by local or remote attackers to
disclose files (on the local filesystem outside of the expected area),
as demonstrated by href=".?../../../../../../../../../../etc/passwd" in
an xi:include element.

https://gitlab.gnome.org/GNOME/librsvg/-/blob/2.50.9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index c8da3354f5..4eab8cdfba 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
-sha256  fffb61b08cd5282aaae147a02b305166a7426fad22a8b9427708f0f2fc426ebc  librsvg-2.50.7.tar.xz
+# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.9.sha256sum
+sha256  518905fffa879b6c7f3db1aae961cf31333e0eadc7b4cdd4f531707868c54b53  librsvg-2.50.9.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index df6559a858..81a6667817 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).7
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
 LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
