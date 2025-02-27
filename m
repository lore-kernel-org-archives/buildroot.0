Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F12C19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 15:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B9540BE5;
	Thu, 27 Feb 2025 15:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pv2h1ePXBmnH; Thu, 27 Feb 2025 15:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3BA40C54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3BA40C54;
	Thu, 27 Feb 2025 15:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A121B68
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B5B940C54
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dvcobd9z4kdG for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 15:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 448C140BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448C140BE5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 448C140BE5
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:36:40 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abb7f539c35so198717566b.1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 07:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740670598; x=1741275398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPmeh7x2K9K21nI8wrOAcuoZI+gt38aCN5nTJWgw8lU=;
 b=XFgjUbnkndsVtXHJmghJof/G0FkyjtTWbnPzVOX0Hw14M2Kd/BXTAqADnR9iD76nR8
 XIEUHf6otillrUI9mnnDtynZrCFl+4nC+j+hoayKoP/xDnmtCyQle5ae5W+86N7Xx2Lt
 NJAzidi+9doF2gMy77GrjabmqMs+XEEL1yik2SiabffxA5uU5JL4d4ao65lF5SAfEGVK
 PxAqDGHxvvHSvaRgyls+Rqb+JsO3cByXqfc7YDCTuPyHJzamxVp1GZe2rH2IFFh73EmR
 Wa90ByAWNAN+uzMwcukmCLZnwIzm8CEJ0vA3Vgqp9R7TtnxzfNc7tU8kMB6WqfbWlnU8
 uxOw==
X-Gm-Message-State: AOJu0Yz7yUPaYGdZbDzhHAP9cc3hVItqPqf6Vbtr/tX5A53J4Ue6skAW
 NdgPF7ztQA/MqJR2j4H8BLPj5Q4qwV724cc1RG7Fs6sk30vfPulj/QRvWg==
X-Gm-Gg: ASbGnct8Z5ubHXcTKLFzv7l3VIxL+TrSLu+YTjk+n1GuCqKKCKmnDkte5eTArZMb9y8
 Igk9yW2e1MvaovC58A8CK7iSolJcrmBuOlIFAxhbTF8HKnFk/+DfV35/fvh3mGDCugPcmGd1h+r
 cOEaauPWXvtEPUSpYWtJ0dDsUB+hTuz8sub2tZTDAkrTVEB+VTj008F3QF+y//A9DUhPK+ed9ni
 YoSret9t8L3UseX6h8aK4mBSXeKjXF6Vus8ekhvQvF01XyDF0gGUIN7GofcYqlWbdyjUBaV/DoJ
 TIeQhgiZmD89VukIR48ajzpQMbvQkI6u
X-Google-Smtp-Source: AGHT+IEMLs91wg/FwfeZEcNJrtsz1PCOWQ/ZgVzTAFBdbIkUVDQ8NEerw/q+8cVv6mnHJjbyCm/4tQ==
X-Received: by 2002:a17:906:31c6:b0:aa6:9461:a186 with SMTP id
 a640c23a62f3a-abed1016d48mr1274021666b.46.1740670597909; 
 Thu, 27 Feb 2025 07:36:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c74fb00sm139199866b.130.2025.02.27.07.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 07:36:37 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 27 Feb 2025 16:36:20 +0000
Message-ID: <20250227163620.462308-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740670598; x=1741275398; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YPmeh7x2K9K21nI8wrOAcuoZI+gt38aCN5nTJWgw8lU=;
 b=c4ZqgLfrzDHsYeTmsvgbuLgKcKowyfih8KURDG4mUV84DIbgXpvIU8oFjyBDgV4fjf
 TfkEGumJiRmehVLrsLVhd7+kI5CPzDVUOM07IlFlCq/++kZD1ByfHMj6EM01Zw271YU0
 5E2ehVipwesB+PF6QInhPh720g29HjP7WGUuOYM7UzNlpRI3ZOdwuY1MmF4qEAYcZKUn
 yryrFlPI0V8wtrpqtCpKBqay7eVc7gZLE8rbHWQI9uTjJsVaS7LkfuhoZnO2drfXb5u/
 s4F3LfqySorZJNw87kb10DbF6plJvK7SLhUYWMzXfR6csKUZbJg+CbfmJgb7a3x3qMUF
 58cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c4ZqgLfr
Subject: [Buildroot] [PATCH 1/1] package/shadow: bump to version 4.17.3
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

Changelog: [1] [2] [3] [4].

[1]: https://github.com/shadow-maint/shadow/releases/tag/4.17.3
[2]: https://github.com/shadow-maint/shadow/releases/tag/4.17.2
[3]: https://github.com/shadow-maint/shadow/releases/tag/4.17.1
[4]: https://github.com/shadow-maint/shadow/releases/tag/4.17.0

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 7155baff07..6e7fdb4603 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.3/shadow-4.17.3.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b  shadow-4.16.0.tar.xz
+sha256  09e896c7b01c97ba4be2d6be332c55a3e478b4893cd3c3466d8224e622bd4943  shadow-4.17.3.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index f0a2b57b4d..cea984012d 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.16.0
+SHADOW_VERSION = 4.17.3
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
