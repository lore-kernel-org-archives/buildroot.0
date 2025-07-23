Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1AEC83F17
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB8060B65;
	Wed, 23 Jul 2025 15:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SioKO3V0DYO6; Wed, 23 Jul 2025 15:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0514060E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0514060E5B;
	Wed, 23 Jul 2025 15:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAC5DA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF0E4810A3
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwMw4jTMTXpN for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 15:13:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29A50810A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A50810A2
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29A50810A2
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:13:00 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4ab5953f5dcso158281cf.0
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 08:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753283580; x=1753888380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYrMbzOOlNOtvox6oAUUoiTbln3tNycOqkj/OsQ+AkE=;
 b=syyP+KuukwuZNtlZNYyt+FI6bZDTkCVqr2leQRJPfDLAstqwV7F9Q1ZyTJi9eXSkjz
 NmYIqNa2xQQ5s6HQw/Wf3kudcDrtjTk/49q8415Yx0v0dCUBRExcXDn2gF9jZOwB7Bbc
 wigHflG5UhoP6KJlvzSPbFZB4JT9gh15Z4Pvr8+WjzpY1YSA4PEnAH1eg9uU32cZZsgW
 aykw/95xUqaFnydvZwBgR6TMm8xhb+GssySBoJ+68gkg9Z6l/mo3hT10xUf9/KeuNU8c
 lGFquZkkEnHMyxlpt6DPrvnpCwRPLmd/imjAZBIkTTIa6qM22ByQZgGS/A5cLeQhAUHb
 FaoQ==
X-Gm-Message-State: AOJu0YxSAMfuXqbYztaPO1Uj6p6pVASdATv5APsRu3fUjM5f0mSTOrm+
 xUzfQfLORavQeKvN873HMxrzXSbeBnwe6eg8uIL2Qk4zhFUWBjBvyU9C7vhDsceY4H1pQa0FRpz
 QLcem
X-Gm-Gg: ASbGncvwNvVS7s3rVjm9aKG/m+bcsNdn5jDrMgta39CQAOXkzwlg6W71JAfE+BGiZRC
 AES4agpHl2kolXQo+9b63Fx0dc+scGRHf5Z0ioSr5l0MYjxStUhwYf1PaARcPd/fXwCSNSQ28Zd
 lfx7EWvnt7ZREr4JtS++E+Qs5lnWSQi0y7nEAVIcNtzsx7Kkygsgbe8BEgP1wws468ZTQCHJxs4
 S44gJfmeU3smucwzQGE/3yqkY0rx44HUp5VV3uD4h4c3g5SW09HrE7Dt12PMeo9609fXBrDwxKc
 0XV5sg2qxYW3Dno+85n9RAdjPnhXAIsu+iPBazPHG3cIsEfOUhNlMwFsqURF4Eyf+KHGEhwWYV+
 3ZScSq1f7eQe85UrCFVA3cTM5HQC+p4f5wijFViXQbdOLzetAzrtj0R0RzZ9SJ/6MUXAoQMglWF
 hqqJMGElMKd8p98WYmMgKq7w==
X-Google-Smtp-Source: AGHT+IGPf9w5wpd3hVpNzJl9W75H8w+gBvY0137hy3ruW9f3h119UMOmPVNdOW/L+FhF9S26pDVejw==
X-Received: by 2002:a05:622a:155:b0:4ab:8b84:8049 with SMTP id
 d75a77b69052e-4ae6de1d09amr47032701cf.2.1753283579522; 
 Wed, 23 Jul 2025 08:12:59 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com
 (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb499fbe9sm69284801cf.20.2025.07.23.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 08:12:59 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, Jesse Taube <jesse@rivosinc.com>
Date: Wed, 23 Jul 2025 08:12:58 -0700
Message-ID: <20250723151258.1015918-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753283580; x=1753888380;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hYrMbzOOlNOtvox6oAUUoiTbln3tNycOqkj/OsQ+AkE=;
 b=j+JitXidvaj+33QKU8qT7MLTHe0FAOfzRY8lDqUP8oBuzAk3XtH4Rs33pBO5mFPWUk
 MwTuHHsqK2RRgWjqcW4kd/2Q5f4woAyoP6J7yEJ17XHCqAIpIaCYdOrqUUx6XvQyjcOr
 HGjwjY+FSc/oOxoa1xoIGtYCf0j+nWqe8+UGni1y1dqoZR4pBG4l9SePEq25Fn8EMfa0
 rCd17OFI9O3xl110+s/92slufHwrYdHwr7nJ143GBRecpqFWgD0PQwfqzaIwHAGgDC6J
 KmY2utY7WZEbYUnudrEBrtaJkTpPoIXPM+0oD4PK5GOHxupM9LUA9BiyzdCaZyc/O7ck
 ZLOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=j+JitXid
Subject: [Buildroot] [PATCH] boot/opensbi: bump version to 1.7
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

Release notes at:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.7

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 boot/opensbi/Config.in    | 2 +-
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 37f06cd99d..3b3daa429d 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.6"
+	bool "1.7"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 84ad67b2e3..c82d2de236 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
+sha256  2cf856a4e5e2e052948ddb54ba48232b1f698b7f52e0374fc7d17d51e8c8f7ce  opensbi-1.7.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
