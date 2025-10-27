Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58618CCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 18:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260B740A2F;
	Mon, 27 Oct 2025 18:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dr1rt6mLte4I; Mon, 27 Oct 2025 18:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F23140A3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F23140A3A;
	Mon, 27 Oct 2025 18:27:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8312939
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA4B40A3A
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TzwJ47-eTQy for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 18:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E42840A0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E42840A0D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E42840A0D
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:27:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so1147665766b.1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761589658; x=1762194458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOmXY3HNC3bS0T5NoAr9oBVJiIz3OfJfi5N/Yjf7lpI=;
 b=K6m4AFyF4Jn7K8eNHKzzD/nPiKCaa8BAZh+T+sWZUx6M2EA1owv+VlNccOI+xbCW/m
 iZw54hl21/O0/D/oyLe+xWdlhDMa/KvMLgT2uFefMkvBLSEbQPOFe36VMQ1eAnKFLapj
 9h3IHL7T8db7CuZnNn+wI9HXLUogCmbFoqhKM96NtR5Ufzed8FeL7eJnv+eTUvVAZrda
 4IwgHlzQ8/4jh+wk2ms+WXQHeodwSSQhe2j4cS934D52+nVxI0pFj/nJ5B/vfH7Ibj4V
 Ykt7jZ1qw74oy/HqobpYhPLlUZGzgBQEwjP3v7zpnAtzLP7D52FviSEN7LqMMd7lTkfN
 PZpA==
X-Gm-Message-State: AOJu0YxfWcQrpGfqZJybcIzzoXZTOKzYRNrdU8N2Vn+qA1AJFFEi7RUK
 W3AQ/Kjm82QcbTy4ifTt3PLpvIBcvb2JVY1pSAWaq8Cm4L8Z/ijDGMRT3eAFXcNSPisI3tQi+V0
 LOq+Q
X-Gm-Gg: ASbGncuKxBHGv++wARAysl/9/9Q8Vj7DDbTH8pD5cf3OH8+OVfJlIPedWtNCmd81t6Y
 IEPngXR5IoRtbytqLJ5kRehLo/RNipBWL6a24S9g2FyJIsxS1Hz2dxu69Fo7hKkdqqTb5wJwSOH
 r/O9xvLERitLzETlE7/Pnx4xo2zsvWuNx9mKe86epojTwhlyh2W6dH5PACGsO0f3QARhrKB3e8L
 80N53QSupE32ix+5eHlG9HfxWMVs61sZKW2UEXtz+tIfTMtDCyPhs4kYxdBpIGuOpAr0Q5Q66XQ
 aybyO1lRbdAnCQ49OvDrKt8NfY+9/F1GL2OCefKRygZfpbQ3bCufqliA3+xAL2QuBbj3n85+T2Y
 tWI4ILK9Co5nunNbs0kIYdIc0dbQVooFeJFFJH9mpOFtSyQ2OB1++vaIvvji4izN9aWsn5FFw+G
 U2xrUk85i7RL1SfVQrhCK4MQGw8icdDDydrACBx9v914vKOu1zbYbAQ0zVlcYqiQql/WvCySSbR
 IbkEaSjUmJ0/pzt6kcqs/ClT7cF+hyzxxAXXbaNd+yJ
X-Google-Smtp-Source: AGHT+IGiilmnPal9zgw0CrUQUGTSuScMLoUz1tC6C0XNzUtnJ40pTnIT8NMj5bI5nW8wkGatF1BxOQ==
X-Received: by 2002:a17:907:7e82:b0:b6d:5fbf:8c63 with SMTP id
 a640c23a62f3a-b6dbbf43cc1mr51569166b.15.1761589657940; 
 Mon, 27 Oct 2025 11:27:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548ed8fsm847300866b.73.2025.10.27.11.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 11:27:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 Oct 2025 19:27:34 +0100
Message-ID: <20251027182734.2504579-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761589658; x=1762194458;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JOmXY3HNC3bS0T5NoAr9oBVJiIz3OfJfi5N/Yjf7lpI=;
 b=HLHdDKC4W2dBZ7MQ0T7ZFoXn8VsGtnHITCAJVY/E95+T2WljFGfvb6gVsnYrSTdlqo
 GbXgF80/JqodLfkK9TAUgkmNhykGMtu9eLzZAU9Mt0Rdp3+hxLKu14EFAYfU5ChrF1no
 IahhRLBEIgLKevX3HHyTDIC7yFhxPLc0hImA8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HLHdDKC4
Subject: [Buildroot] [PATCH 1/1] package/bat: bump to version 0.26.0
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

Changelog:
https://github.com/sharkdp/bat/blob/v0.26.0/CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index a860a73c606b..532ccd98a480 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  fe5d567728c240209e59a641ab41c53420b9e3a61bda43647880fd44c7fc7e75  bat-0.25.0-cargo4.tar.gz
+sha256  e62f9f1b14090044db860727a3c6bcb0d5b840f866ccaea4298518eeeb807a72  bat-0.26.0-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 7e89d361af06..8084e6c2c3c1 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.25.0
+BAT_VERSION = 0.26.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
