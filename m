Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17998CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8741416CE;
	Mon, 11 Aug 2025 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaKzKLQep34L; Mon, 11 Aug 2025 16:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B556C416EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B556C416EF;
	Mon, 11 Aug 2025 16:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CDF6154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A76A409E0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AF1UsdydsIKt for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB7C24012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB7C24012B
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB7C24012B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af92aa183bbso50613866b.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931352; x=1755536152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ol6PLuX4eL/ydFzuh3pQmIhcQ1FBFTuNeKJt1PuZNK0=;
 b=rdAVjX3Isb/EV7U5KImJtPaVOvH0haSH2e7hHu0/rBKa6WbG5ZS/9smO93sO8S4GQH
 XtBAug6C3V17uLS3sdOdst8xaAPVwPc8kzyLoePKeIONztWYk8SWnvzHYKelsybuHPvJ
 kJ8gprlCNwYqA+agX7UWidMOydMHaJJd6IZakh4irfZldybt6TZIwGmBkB/1oj1dyOB7
 2MxCSb25CdIHC6xQnRXVEH9r8y4w77HH8okdOMUi9t82HTQ4/oPp3fq6IVWzl0DOdEhV
 aSzW3Ux3wJQD1NQx2ntT6Nwf3xvx0kFfqqSc2HIshnnGlO2NWkAgNR61Siti1PL9lLh0
 68zg==
X-Gm-Message-State: AOJu0YytAESUvz5LXDvT5SlPfy7XvNe0lV1kHdTz80Z4+6GcrAthjwZp
 JXGJ6WYDjfmtwbqLa9zK37r9vFGweseO65HIl9iZlCbKAgS8cwC41MQLtqOpnw==
X-Gm-Gg: ASbGncsxEt+H0wkndEsywefGGDnC87P6mO6/WuDdEmBIuoZrWgQEBfZFRGxljSY5lBz
 jT5oYQ2ZupbxcwqP1poXcnVxFUMRZT4COnc5saxOQ4RWUSeiHT0KiKmOlzh4TpdltVwMipLPB3Y
 TM0g+bcYqlL/qYqqO6AUEf1IHkotbH3/uO98r4DM2VRU6Y6Yp9dto5EfgoVrT9w3oVbZfffshOn
 VbaZgJAQV1P0MbX+YjlMDR/dUAQqRa1Nvv6Y4te40XEjhjytaS+rexZBqK5nZwrmaM4Dm8pqpOs
 UNlNlgTe2Z9GZF1Jwl3ga1TAmRxJENrmNO6ts5Ib+C1ESozwRzbF/HFzWcVvO16uWTQnCtvzN+3
 74nZ3pSgiOtzJ8jQiKvk=
X-Google-Smtp-Source: AGHT+IFgwOj3KlTdCHXlP7rn/v9wY4wF32RuWjKW9KkHf1TVRt2RU4MTlTjzGRJg5ZpTyzvrW6Gm4g==
X-Received: by 2002:a17:907:6d1c:b0:ae0:da2d:44bb with SMTP id
 a640c23a62f3a-afa1dfd945amr7950766b.1.1754931352209; 
 Mon, 11 Aug 2025 09:55:52 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:51 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:24 +0300
Message-ID: <20250811165531.1533913-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931352; x=1755536152; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ol6PLuX4eL/ydFzuh3pQmIhcQ1FBFTuNeKJt1PuZNK0=;
 b=Wot/+MwjH7qTd5rv6XYcWm6a8WItV/fNpNxkLUD3mZGo5YyLZxGwjFwnnMleToY3yz
 um3N4gjVybpPMt6RcrvOBebczb69Mss99KG1TKfux35HKyhxlxT0Ysc4cDeqoMMh4XtI
 AbpIjsh5WG995GRxZU2ds+oO3CHvTxBSmmgkIFRx2mgdtO86Yrm1yeXHscvMiTO6GgZd
 qxX+jLAoRn8bEeW4aEPj2BYmK9ejZ/vUzKgegQD9pCCOoa+Mjb9VCtZVo3v1AYBeOVq6
 faTw8Q0YcyxezsowynAixqOJYvvsn3iDL8y/NIhSDj1hNjv4y00NEFbsvbfNYi65Nxkb
 6yYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wot/+Mwj
Subject: [Buildroot] [PATCH v3 04/11] package/qoriq-fm-ucode: bump version
 to lf-6.12.20-2.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index dfad7affe050..fb5fdac9a63e 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18824746f144ff8f39a5f2f62f7777de7c6cb8ab1a3303a5cad5beadd8aac9fd  qoriq-fm-ucode-lf-6.12.3-1.0.0.tar.gz
+sha256  12894dd52239e98b00bdd0a4e30b57d7bf6c37becf2a5db4a2e7d0074435d072  qoriq-fm-ucode-lf-6.12.20-2.0.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 6df0839be32e..fe71c283ea90 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.3-1.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.12.20-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
