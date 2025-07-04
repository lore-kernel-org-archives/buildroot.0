Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF331C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 09:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFABA82179;
	Fri,  4 Jul 2025 09:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeEKOBW6G-Pm; Fri,  4 Jul 2025 09:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D686E8217A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D686E8217A;
	Fri,  4 Jul 2025 09:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A39715F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 09:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4090A40C65
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 09:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5vIZ59_3vHZ for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 09:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F1E940C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1E940C56
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F1E940C56
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 09:24:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso645840f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 02:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751621073; x=1752225873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwXckXKimVw8H1tUi4Z6+YmlGqy4EEL8jxVSODVDykg=;
 b=lkOF9WReGJkBNGZ8F++npzDv/89MSTH1lEiMkk4VwIoYb7XpSBqnMZ3XmgDMageENH
 CqDqTlNeJ1X6o0prbTQfW5MWWE3+BezF9/SGLE8bA9qxFgykpMTPJwNOqQOuddqXiJnI
 lAzN5uUO15PWp0aKH773b863/Cq4t2fREq0Wa8I+MSUjRyuTGYb/RGE3gW3hVEJ7G+Ee
 7MMNaSN4wr+oJ5xsKyMpDstynNoX7pB/AYOVSHiuJkFoBdwiCfq/aTDSo4sg0AmZ7xfW
 6Yhh6F6F3j5xrzQNFWrXGXvkpqmaRurVi5mn9eF7dVH6VgcSSMZLRq811zfCGvgpcNWD
 2cLQ==
X-Gm-Message-State: AOJu0YyqRTlwXff7i30LRqTIIFN7yGqhPC61tP8p0Y/vC0V/bOXp7Dk6
 gyGfax1/vIQth61UJNnGXAkyAJIaLPZp5WlMF1HJKatvDB2DGaTuoyVYjH1t59xPYaXpTzlXxs7
 CFxK9
X-Gm-Gg: ASbGncvfq2uz6BeNWmutj7nTxFsOTRKE7XLieq7fehaIvqSe/rBg+gjSWFeMWmu1Tmi
 XHJS6Q/MJ9oU2fgOQcH1ixWDIgmvUVZ5M/nQCbukIg+t23NYhIjyE2h0PMc8d51MlrTZ/C5GAOw
 vl3hZZuikQjDjKWNIPO5UxdEQjf+BXSUPJmDUzSNPOL/9Uhpx7HJ9D8jhH9bs6RqUdq35ADUSae
 tzAvJ0vd4MMUDy0tWQkC4FuQKUvjJSs5RaLzx5PK8IdWtREz8lsYcBGCxgzx76ui/w1/VsgwOYk
 i4QCCFob5ePpAu52H9x/Pj4Rb7dZdpynZ1BXaBNnQnoDwEpKEO0+fpptCK6dtJE+KmkUEwA/mvO
 KiPb+KHYd0LM388/GFw==
X-Google-Smtp-Source: AGHT+IHsmCCokLpsOPycaUiC5aSIEqyUgrBTqWXrIuPZ7QaQbiV7LdG8g1KS6gQbWIalYKqAUqUzJQ==
X-Received: by 2002:a05:6000:4022:b0:3a5:27ba:47c7 with SMTP id
 ffacd0b85a97d-3b49702ea79mr1397582f8f.48.1751621072690; 
 Fri, 04 Jul 2025 02:24:32 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225afd4sm1949851f8f.83.2025.07.04.02.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 02:24:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Jul 2025 11:24:21 +0200
Message-ID: <20250704092421.1886266-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751621073; x=1752225873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwXckXKimVw8H1tUi4Z6+YmlGqy4EEL8jxVSODVDykg=;
 b=PXOdDil6g1ooToJzI0XiIYoPDhYxayzchWa77NoNKMb11/Gd0lUzzYhdzN4C0PKH52
 2qBRlC3dt8eAeZJ1BLH6ldrwIzw44wyJEYDoAHvZB0PK+/WZnlFBKwVwaxHLDOorFlp2
 rKytCqQNQ8wrTyq61zriAR5lZaEn9sxrFAdKFufyrhyps3YktZxL7Es7BYXI+5urLvob
 fEmfst7Sfg3ipbagjVki/jqIg3BYVE8QIeuG0kWEUNMHZGR2m0ml8ZQF6KTTm24UFBw5
 bPDrjrDm9o83smLIGQ9Rnk611TE7XTEeX7i9eyjjWFFntTPFpixdJop+UJWYq3XQJ1gI
 yXFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PXOdDil6
Subject: [Buildroot] [PATCH] package/libsoup: fix missing upstream tag in
 patch 0001
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the patch message so that it includes the "Upstream:" tag expected by
check-package, and remove this file from the check-package ignore list.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                       | 1 -
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dbe0963ca2..f5b158c450 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -694,7 +694,6 @@ package/libsigrok/0001-Support-glibmm-2.68.patch lib_patch.Upstream
 package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch lib_patch.Upstream
 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch lib_patch.Upstream
 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch lib_patch.Upstream
-package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch lib_patch.Upstream
 package/libsoxr/0001-Add-Libs.private-for-static-linking.patch lib_patch.Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch lib_patch.Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch.Upstream
diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index a999f5964e..3fc0e833d2 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -15,9 +15,9 @@ In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/
 Fixes:
  - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
 
+Upstream: https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241]
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
