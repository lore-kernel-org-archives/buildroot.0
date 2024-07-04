Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DABC3065C
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A98340485;
	Thu,  4 Jul 2024 06:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7Zc7POm1ZQv; Thu,  4 Jul 2024 06:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390184074E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390184074E;
	Thu,  4 Jul 2024 06:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 966C11BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84671607F6
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-nHIbOgZHTO for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB768606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB768606CE
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB768606CE
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:43:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58b447c511eso310137a12.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075422; x=1720680222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=G7uuWQuOXNLaGj/6H1mgWKpfO25TMOMg73UKoas+wpmU6gz+oF8FvqMDaydkiGtpVW
 gBDDYafMG788hbi+bRSFG5MYccnR+hyYr0/+So0JPZbFJWWxoinmxM9sgFjBItZaa5jI
 98gISyC0V6xVVumhwX0jcgDxg4kw9522VTG45GZ5qaw9vpulTQovk3cg7cVSOoGIahrs
 S1c6Gk6I1t+6V8nuWhPjnFD8wplwkvjRSLFDlP7ZU7htkfrqVLZMFAVtZL6nVaoqBe30
 E1AFHU84lABPGCIw5GNK0CQ4pvZha0Tv2ua+rasbWIn33vuc/azP/0MtOR4Eh6oiWeus
 11lw==
X-Gm-Message-State: AOJu0YwZhbrAEdngq/EliX04syPf7VEYUJvSXVBgOQi0vJTckAUz7vc3
 6IBJCs+JlW0edJEJhHW4M5CPV5vmPPz19ZjIttehMB+Dm183SSxuZbRGVg==
X-Google-Smtp-Source: AGHT+IEUCXriMcciTrsSdl7U8UZhKA6YBosBJ0LUAcCaYKbgNpuK3WjWwAzDHtPPmwHy9Xm6p6xrUA==
X-Received: by 2002:a05:6402:1ed0:b0:57d:4fd8:db59 with SMTP id
 4fb4d7f45d1cf-58e57a0285bmr626179a12.0.1720075421551; 
 Wed, 03 Jul 2024 23:43:41 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324dfaasm8252620a12.32.2024.07.03.23.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 23:43:41 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 08:43:23 +0200
Message-Id: <20240704064322.3242095-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704064322.3242095-1-heiko.thiery@gmail.com>
References: <20240704064322.3242095-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720075422; x=1720680222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=CGB7arpi9sYnFbir410RrWyxMaS8Jfv0WKkZdeEIs8C7L2btxE2SqXbsXTPdf4x16E
 CdlNGSbCDQ1TRJQPS6fuBzmVFvjvA5zoGjFS2mqQKOCSCY9zgKeNsn3hsJpSQ0qTcJ6M
 vxo5S3tlFZo7YEz1/DbmKpSiLEH+YvWKodU3wn8WbiwxdQT8cXHg0YnVTH2LZ3EN5vIV
 sxGDfC1a5e/Irqg3T4Z3NbRwpCig2/lu13H60DBf1kWa9nqCHadA7jHMSuJ8Ut6VdjMf
 RWPhHk/RDCLeCMwO7tO6C7ZmMuDGSnLgo5+aDJSBzacweqMYuPOl2SYAf4dnuvdNmpZL
 ZgWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CGB7arpi
Subject: [Buildroot] [PATCH v2 2/3] package/xxhash: add host support
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host support is required for ccmake

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/xxhash/xxhash.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 7708ba1e19..97bb2ca722 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -15,6 +15,10 @@ XXHASH_INSTALL_TARGETS = \
 	install_libxxhash.includes \
 	install_libxxhash.pc \
 	install_xxhsum
+HOST_XXHASH_INSTALL_TARGETS = \
+	install_libxxhash \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 XXHASH_TARGETS += libxxhash.a
@@ -41,4 +45,18 @@ define XXHASH_INSTALL_TARGET_CMDS
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
+# we are a ccache dependency, so we can't use ccache
+HOST_XXHASH_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
+HOST_XXHASH_OPTS += DESTDIR=$(HOST_DIR) PREFIX=/usr
+
+define HOST_XXHASH_BUILD_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D)
+endef
+
+define HOST_XXHASH_INSTALL_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D) \
+		$(HOST_XXHASH_INSTALL_TARGETS)
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
