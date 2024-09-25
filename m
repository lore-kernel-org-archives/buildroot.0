Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D7FCF58ED
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A25E42662;
	Wed, 25 Sep 2024 13:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMLIxSiCayo5; Wed, 25 Sep 2024 13:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E5D42663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E5D42663;
	Wed, 25 Sep 2024 13:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E92201BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E638B84759
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcH5G1xIiPEl for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7E0184757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E0184757
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7E0184757
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:37:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso66914145e9.2
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271430; x=1727876230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0x7Unaa/gb/OaeGDovDIUV8q8ha3bUvNieS8KRyvuI=;
 b=SphZlwe84woCqH5bgUC42FNiaUDIod7q4pYPvEXsdhkBQIMu18lbq5uZ7Ylxb9Pfqr
 0egKWm1FDSSKF880Bj7fxuP4bQW1O5bppjQpR07n0YPbvPVcaGrb+dHfJ8B/2ibW93Qk
 oXZ/k7ijQPgIxwzT9MUnQMtFQeZuuOVlHZlk4wwcHFpCVqSs1SF0f29jC+8glG3o961k
 bopwUhVDbRLOWeZ2LE/RNLo0HLyNqtDrcw0EcTfsV/HyC2fdHFDuQ+sxHAmICiq8Uoq7
 XKF6ElcBRV+5P5KZJ0H5/AM3DkSrUyIq6eHZOOhil/bfc/c+MYKbjp1H/2qGlFviBhnA
 hI8g==
X-Gm-Message-State: AOJu0YxJXt76j7+H7MxbJVdm9htokbqcGdQrj0oRxx+jIhp+qBD3GzeJ
 iIDHWXtuKDYRxfqWbDarWKLbu1PVI+FzGmlXmA9tsWN4cL0bMllJO34GuEwYtPp1FAK7KoNrMzH
 Nkg==
X-Google-Smtp-Source: AGHT+IFlZki1sGaNCff6pRuuGDIaG0X05BfZRc14bZqiklzVmMJ+DbLcX+vHnwCli1c73M+o1Av3VQ==
X-Received: by 2002:a05:600c:350a:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-42e9624457fmr20514855e9.33.1727271429527; 
 Wed, 25 Sep 2024 06:37:09 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ddb1fsm19086855e9.3.2024.09.25.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:37:09 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:37:04 +0200
Message-ID: <20240925133704.3899803-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271430; x=1727876230; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K0x7Unaa/gb/OaeGDovDIUV8q8ha3bUvNieS8KRyvuI=;
 b=N9yzgUfMSpV5zps7wbai3OOOBdy092lb6LgmBbiAwUj9ZDVYGaNcFJLhF9f6hXtyZ8
 di85lHyP7+n173G1FlFdyIXEOep4IQtxXKpz7KnI64dew61uSq55PutaN0Qqd6Q4XEi3
 J7pzgvIfiAlq5iOcFK/nm4r74DyR6SevYxA/2LYFwfqYk3oe9I/p1bvimPqpaRwf+Bse
 V+Y5Add/sprpOafwxHRYJcBpjoLFaSrifY0/nRZiZQsi/9qe7Oc+YbrSJiVwk+ftcdzi
 qt9F9WEu/cTvnmIClRWC4C9UO4sxHCj0aRYbO4EV3fQhlMUTGjW+2UgluKns18eCofdo
 M89w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=N9yzgUfM
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index c3953e15a..be653bfd4 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
-sha256  ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b  gdk-pixbuf-2.42.10.tar.xz
+# From https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.12.sha256sum
+sha256  b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7  gdk-pixbuf-2.42.12.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e041d2cbd..aebaee52c 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).12
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = https://download.gnome.org/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
