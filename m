Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11949C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7189B40D67;
	Thu,  4 Jul 2024 12:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvjIap2gt9c5; Thu,  4 Jul 2024 12:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F5F410B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F5F410B2;
	Thu,  4 Jul 2024 12:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0ADD71BF321
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED3A084718
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-oHZO4Et4eg for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2183A84717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2183A84717
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2183A84717
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:35:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so863740a12.1
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 05:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720096526; x=1720701326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=bbhN7iFBZH6dRxodrUbUdbb90wE+fn5H1Gk2jEPpzWmnzYoK28V7iZxTuehF/OD+28
 +sGerrzQ30hFdSyRKui+j/JR2cHnB7yDV8+m4tklhPzWgE1SD08aspWfgF7pSs4bOVZK
 x7rwdpEZD7apGqipAeVbJB0Z9H0TFtGIzzOh4Y9keHxZIhhX2IVxeHI/J+L+54bwfqnj
 VUA2nBDNxOyBWNGmEZJDIUgAno6FfrUlAeHxSOghCUyKnyOnJStSatqOfLOPvkcNINYV
 hMcMiJDuuGGPIL1PGyZxxdCuwaXEWYUJsJHqigLQzHHCFHsdAoeQetE6Jpy+4iuvzQOj
 LeFA==
X-Gm-Message-State: AOJu0YzFUocLDvxK0oa7HhtnDqPmS76OvAbQfew5OE293pFWZZM8Z+Ie
 l+LlKWeEZxEcgR0SFF5xiVI/u6RYiDf71cVBvvjoyD8d8Cp1IuPfu6ORGg==
X-Google-Smtp-Source: AGHT+IFL2qd3Z2fpGl6s59GrN1kduaaPr9g/b1AfDcz5hvsl3n58+A/k523MMyPZOHACH4AQ1EcBvg==
X-Received: by 2002:a17:906:175b:b0:a77:a630:cf89 with SMTP id
 a640c23a62f3a-a77b9dee79dmr95755366b.0.1720096525542; 
 Thu, 04 Jul 2024 05:35:25 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77bd30d04asm40845366b.143.2024.07.04.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:35:25 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 14:34:54 +0200
Message-Id: <20240704123452.3535612-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704123452.3535612-1-heiko.thiery@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720096526; x=1720701326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6MN2esA9NbdqU4frW8o3SWLRtQmaGvggPALWNWEW7I=;
 b=ccGdXXjDO7VQpFsEhCEei7bXt0ED/RpLsONan0aXDs3xNJf9ds04NHZMub9MD/4YWy
 Qs/Mbz+nBrPUxkQmkGbGybgMqMNiI260h0XVLvY3oXwZwM8Y3Dl3cuClo5kIPVuA6YrJ
 UEltODApHhvaKqxHZCyy3+aFqlHufnM/XvUYAj0gw9WWQG3QQU4NyTk3wSOeNzXQlWow
 QCNuocpIj/KblIGCG2mdMGcYR3WQKrMd5LfK8PejXeAojYv8ZsfaBZGKssG64iKenQXu
 TD4grhbybQnBpNS8Vcz3lXj7gH79KQnPFheAB3z0LyOZZ8JBLmC1zXkwjXOxGMqhEqRo
 FqEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ccGdXXjD
Subject: [Buildroot] [PATCH v3 2/3] package/xxhash: add host support
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
