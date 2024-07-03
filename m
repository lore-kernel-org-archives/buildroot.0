Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015C0C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF77417E8;
	Wed,  3 Jul 2024 14:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQXiea6Vs590; Wed,  3 Jul 2024 14:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D20041878
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D20041878;
	Wed,  3 Jul 2024 14:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DFC41BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4824D417E9
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpSZTiFoPBkp for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A92AD41813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92AD41813
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A92AD41813
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso413069466b.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015271; x=1720620071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=lGXbyvHJdTRaePsokhFJN8LoEO3i28SM7qN4yZQsYFj/j2Exd2ERdtANIT9zA5AcnH
 fUZnvUs5XCM6faCtKKyQPrGF6IUTfzMu34H440ie+wmEZFyfGcto2g0NzvnUTN/eoBJH
 wpPhfM0X0GCPPGCoFvtuaZ09xrxuKih+Z1JlRFnfp3qt/Ur7at8gDI58Izc0FZ+V8MJE
 Ld4b15vUrpORddgyAZ6k8Navyn0vstQknQPjrYdPpU1ZmA/y05lSujXCoh6XQJw1tuYO
 WK6YIYv/tL/7wT6r27IguCKkrWEyHQ3pIHOhnsIUZ18641kvrSM2UgT4vt9KgnDZ/Zwr
 tM4Q==
X-Gm-Message-State: AOJu0Yw+Rxm2gdmyT6Iy621mFH3LKliJvvB5yubh92qQEdVirwflOwjV
 wTEUPoj7jpeu3ze5SZmms4T6aQyhR4Sa58lx7J/ufZo/PdhnQK6zhlOjAw==
X-Google-Smtp-Source: AGHT+IFoffZnIH80jtYVYtkrfkdpQxBEryMzv5ZdNB3K/wIcADLog0YY1aeL4FSoVShqYxPB0pg5Rw==
X-Received: by 2002:a17:907:6088:b0:a72:9d25:8ad7 with SMTP id
 a640c23a62f3a-a7514468621mr1009077066b.1.1720015270517; 
 Wed, 03 Jul 2024 07:01:10 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a752008272esm314671766b.175.2024.07.03.07.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:01:10 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Wed,  3 Jul 2024 16:00:54 +0200
Message-Id: <20240703140054.3224869-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703140054.3224869-1-heiko.thiery@gmail.com>
References: <20240703140054.3224869-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720015271; x=1720620071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=ALnUQNd0RXOjz9xW77zmFf2JvYAWLJVx943HAS4+KjGnW1Nu8gKUWjw31pwaDqt+ls
 Lfn3KqpT4LiWYgwVLfiyTsnT5s+UtCnwY/tHLk+i5FDk62M11SUY/ynz8utC5jSuvTDA
 ELmHNtOo4yY/CCW6Ty+quFUmq616plvfJV9OqbuJwWV/mKTbrQVBRMZ267dDzzS/SI7W
 cS9JGXy1kwgLix6vIpaU8cBg0poKk01Ji4aFN+acAzd0eQ3C5ccsQVJVw9GDRYlcHcd8
 yWH9dsaSks0aLo2qKCbVD5yr0hAWeNQCCAqNeIjsmo01q0W8BPs5jqQNEPH+MnKO041J
 OI1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ALnUQNd0
Subject: [Buildroot] [PATCH 2/3] package/xxhash: add host support
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
