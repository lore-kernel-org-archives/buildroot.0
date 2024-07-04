Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD4C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C979419FA;
	Thu,  4 Jul 2024 06:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8-M-Uoyr_RN; Thu,  4 Jul 2024 06:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F93405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F93405DD;
	Thu,  4 Jul 2024 06:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B79D01BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3B5F8448B
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgrdmKnDNp4f for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF8CC84467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8CC84467
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF8CC84467
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:43:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58d24201934so545071a12.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075418; x=1720680218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcuS6PQiiJgQlJcBIKccj8o9HWt9vCy4h4o718A3UQs=;
 b=ot2iCOMP8TvHJwXn2nRQP/pCJyOPJ7NNQfk9aVEgHWekRJJdmShNEKVRF7klMHFYiy
 lMNNQErhYst/9NgWykWqFbjY0jG7FVfVb+hxSXsGnQDOChYly7vSLTG5pSuV0qfc1rhS
 nnVPBHQqBtFjrbMlgjFJ4/AeJLyrcG/4VN7nzzpQzrk79ZlXa1fI4yOjIV+kplXdF/Jq
 IJTfL5w4+Z9Q9upImGhD9MXy7r4Bt4FKTeME9WjWZu7rJQnutO2lRhwBwSzQo4gIVN0O
 0F6OppheUJnPRaejgfduxUyNfGI7MpSSb6lzJanzpQhhFsoFmOrxG+SswHzP35klS801
 rENg==
X-Gm-Message-State: AOJu0YxqUMgwGB37OBn5S7w14RmE2yRMfdI0cwrFlSEo0dh/BaoxwYeS
 Jlj0MXWaiSsYFm4o0sK/Py6VAGmOkhkZKQYLFmKFjaQaPkXsGuwiLKlquw==
X-Google-Smtp-Source: AGHT+IFRGphcU4QPtIswr2yzeddd0oUTww5vIJm8r3H6wK//U6r1ppPBj3VhOfSqTCmskVv6AOqlOA==
X-Received: by 2002:a05:6402:518e:b0:57d:d59:461b with SMTP id
 4fb4d7f45d1cf-58e7c29be71mr425785a12.13.1720075418139; 
 Wed, 03 Jul 2024 23:43:38 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324dfaasm8252620a12.32.2024.07.03.23.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 23:43:37 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 08:43:22 +0200
Message-Id: <20240704064322.3242095-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704064322.3242095-1-heiko.thiery@gmail.com>
References: <20240704064322.3242095-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720075418; x=1720680218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcuS6PQiiJgQlJcBIKccj8o9HWt9vCy4h4o718A3UQs=;
 b=I8mkn1k5+Obs6vrb75HbXSMboGWrlrnCaDxpd+Tk7prVDUgeOcFE5XdJG6eQvyy6Ur
 eOZkW0hhbk1wjEfWH4z927uaKXzBIE3ZkB5pBwzZw/vHMZbACh3L3b2J9FptE7qHO5Vi
 qhoL1JAECQOvi8V5ulqLH7FBY4hhZzEKmp9J1y/q19Mj9QaqJgdFza9ZX6QJfEn/LuNk
 beYK5AuWklEa1EiHEyOQEzzFo3J+qtyPZira6TsLthcaiIWLchGsBlaCmjUMk80/mkpf
 dwHIurnaC7acVfkLZgn83W7FGyzKOeAmIe4iBRWNhCUM9LS5Ky6tWNA4IVfdD7ElNmPZ
 tSOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I8mkn1k5
Subject: [Buildroot] [PATCH v2 1/3] package/blake3: add new host package
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

This package is used and required for ccache update.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/blake3/blake3.hash |  5 +++++
 package/blake3/blake3.mk   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d9fcd97df..0a6a4b9de6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1359,6 +1359,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
+F:	package/blake3/
 F:	package/ipmitool/
 F:	package/libnetconf2/
 F:	package/libyang/
diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
new file mode 100644
index 0000000000..a3ec44a804
--- /dev/null
+++ b/package/blake3/blake3.hash
@@ -0,0 +1,5 @@
+# sha256 computed locally
+sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
+sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE_A2
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  LICENSE_A2LLVM
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
new file mode 100644
index 0000000000..e94397a0a7
--- /dev/null
+++ b/package/blake3/blake3.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# blake3
+#
+################################################################################
+
+BLAKE3_VERSION = 1.5.1
+BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
+BLAKE3_SUBDIR = c
+BLAKE3_LICENSE = Apache-2.0, CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
+
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_BLAKE3_CONF_OPTS += \
+	-DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
+$(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
