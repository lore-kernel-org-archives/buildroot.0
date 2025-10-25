Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322CACCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6358409E6;
	Sat, 25 Oct 2025 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QILdn5tdrTz6; Sat, 25 Oct 2025 14:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC1D40977
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC1D40977;
	Sat, 25 Oct 2025 14:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4309D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85453811A8
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQdC95tjRe66 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 14:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.50;
 helo=mail-ed1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78E4E811C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E4E811C6
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E4E811C6
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:36:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso5066390a12.1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761402990; x=1762007790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=685E1m8Rc73PksLsY2/6NF5zalezZnTS4jAF8+0cNOk=;
 b=mzLHehwVLrkTbSdafngZvNHL2YtNe89sdIGdWFeQvlGdJ7oQz3+BwcAiT8nskATBhO
 BT+UJShfNP1ZmwU/6U+aqfEOc5Cfyv74cU92mb3kWPGq654mjEe0y9VLyP025x0Rp3aH
 PyOUk8LYlzew7aLWDpjuYw0ms72D1ZfPlFYkITjglMV/bqv/HqElAMmE60PpQtjVAkNo
 2kApOq76RBVavl4fM9giPh2cWLdvAmK34cQXia5tDGQ5oOzIsAMeVXN0gaw701iVW+wo
 RyecU/tuJff6nyVbIEaocEb85y6+cP7Ox84A+6VtfBXgjPDcfmopYhstGtQuozGCZMxZ
 pIUg==
X-Gm-Message-State: AOJu0YwG5h6UrgjRE1Cvv//mepV1Ma2jNPdobTfbfs/7OstJ9ussR7BW
 +TRjXVjchEQ0Hh7J4px90L/IXuDEtVv7H37K5cPhQr9P+02LCSI25MQ2rkOrjg==
X-Gm-Gg: ASbGncvByUQgEFBs/jIuyc0PT+Q+i4nBaqo0ww6+apMjJLUY/0rG0PVy4WwFmVg2Mfs
 VWnT5dPLfvXsTlXtJrPwGZrCeS9nle4M3UUPx/7kgf4q03hT7j70fU11qyzX0OkrKev/EM4n9xQ
 1OEsoZPE7ZzOSaACAquEHj+q30Yk2DUGbs06zVrmRvI2vA1Mc3ZZMg/0r4yuQqydoux2jmucP/v
 uxh3CoufJucr4tPHB8rn5gM00FLN2ea+YNvc3BX+0H58BkUezhtqnYKR5WEa70zs0fQfUwM7PTc
 ZhwtUV3iwvuXoL/V7RzP8S4SgtZTiBVWaBOuwTVEsefqynK6151q2GnH/wWCcQwymhBCfkLVSYI
 3ekppyxUZPaPD93jnPB5NJVvAAeTtmFk5CzYPMCkEdUPQRR1/UlXqm6p7MPvZwvB/972eXXkeN7
 nz2EFLRvBi0o7UHHPzRMalTOXimU8JqmupUViXD1FMlTijFkhfrm6mi8Z3MvaNSY8Acxc9KGvPB
 xeFkK41tnOT6ByP
X-Google-Smtp-Source: AGHT+IFC+qu8nRFnbIbgdAi/jKLceu7C0wWAqgH3bJe2RGbtFMrM27EF5sx6uMXWsYLW7t/5q/VvAw==
X-Received: by 2002:a05:6402:35d4:b0:639:db35:62df with SMTP id
 4fb4d7f45d1cf-63e5eafc21fmr5778778a12.3.1761402989891; 
 Sat, 25 Oct 2025 07:36:29 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:7ce7:55f1:adbb:3618])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd116asm1982826a12.33.2025.10.25.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 07:36:29 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 16:36:22 +0200
Message-ID: <20251025143622.79553-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/python-certifi: add host selection
 option
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Adding this for private usage.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in.host                | 1 +
 package/python-certifi/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python-certifi/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13..1065c31d26 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -87,6 +87,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-certifi/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
diff --git a/package/python-certifi/Config.in.host b/package/python-certifi/Config.in.host
new file mode 100644
index 0000000000..512274eb6f
--- /dev/null
+++ b/package/python-certifi/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_CERTIFI
+	bool "host python-certifi"
+	help
+	  Python package for providing Mozilla's CA Bundle.
+
+	  https://certifi.io/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
