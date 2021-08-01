Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F69C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E4C60F59
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49E4C60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A8BB402F1;
	Sun,  1 Aug 2021 08:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCwN4jYdTuPo; Sun,  1 Aug 2021 08:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AA6E402F2;
	Sun,  1 Aug 2021 08:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBCFF1BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87D183777
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xA27HcudprZ5 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:30:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99B7A836F6
 for <buildroot@busybox.net>; Sun,  1 Aug 2021 08:30:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso2109547wmq.3
 for <buildroot@busybox.net>; Sun, 01 Aug 2021 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBVF4AjJhKGq4GQ+6ky1WkzkoqPk5qAltApspF8FZrg=;
 b=oQ5crrv9BchZ9pVjQZD2ALzSY+0Enk7AuB6kSf4gTIfgFSeBQa3Is3mWYdnAdYiv/2
 csC1aiyAAeTyP4WYlOfXq49UK+sHy9bD1icPNP/42Sz0AKfRHJZfM2zxQj2XWQOyU6QY
 qj3HQFO7D7w9EOxu4cA1L45UuYpr/Ip638wy3uaG7nlGAFvUB2gx3pehjvNEf10gf79A
 UhXPu5B4+0IJsCrSXxEQSgg3cFWnYT9ypPKAMm6GqgbNRqbMH6bZqXWUAxgAHS7VFdTP
 lqKfw6AxMZPu43NeCbwIuak+6GkkFIZZQPPXPJgxhOWxe0Vb/qwmU5eGgvr4U2skCwVu
 fw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBVF4AjJhKGq4GQ+6ky1WkzkoqPk5qAltApspF8FZrg=;
 b=gsVqRVW6JnRfRLy+Xrd3yBdg6IICVLV62PwIDaVJuY4HBGGYYfzCItjMDyIyCMznQ6
 M6uXDwtHGGzA+2Sk1AO3QHgip6T608gkuE94e4Rkgy2XYbZWC0nL480iwNwrdNFOP8AV
 uu1Bakr/3sZs9QzAq2+QezsjK3all3bZCAU6XWD077Y6+bSFY0Ub33TQGqZz9ZtKLiKI
 CS/iYQbt9aYPfp5aAdjSnWjgfWKLaNOoIoIStisVp4JvgqKuFQHExL27Bxg/N10MhWsk
 NKLTy1JB75Sk2Oi/0/WAiaD4HZiecz32OLCASIgARP0f25ZGqu0oFVoe3+72MTpOAcR9
 OEIw==
X-Gm-Message-State: AOAM530OWpOUsW1A2qrzzAilAZVi8HMGdlsAd28sOY1fxGbnQy7zf0aA
 UTS2xS+i10aTvQFOQp+uKbYcbVXVAdk=
X-Google-Smtp-Source: ABdhPJyWj31OYjKtuYkmNblfEwPYISw6QKjSec4odZN9DK0k9b4KNk1FmHVKPBHLprEZk6j4d8UFdg==
X-Received: by 2002:a05:600c:259:: with SMTP id
 25mr8129565wmj.57.1627806612847; 
 Sun, 01 Aug 2021 01:30:12 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id v5sm7544587wrd.74.2021.08.01.01.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:30:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  1 Aug 2021 10:29:56 +0200
Message-Id: <20210801082956.3113190-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/libgtk3.hash                       | 4 ++--
 package/libgtk3/libgtk3.mk                         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index 90f5facbb..450505c91 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1685,7 +1685,10 @@
+@@ -1650,7 +1650,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index d5638780d..149399868 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.29.sha256sum
-sha256  f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa  gtk+-3.24.29.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.30.sha256sum
+sha256  ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9  gtk+-3.24.30.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 0c40bff80..80a2affd8 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).29
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).30
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
