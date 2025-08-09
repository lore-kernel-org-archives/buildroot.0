Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78576C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 03:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F9460BB1;
	Sat,  9 Aug 2025 03:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdNB2XUfFKF4; Sat,  9 Aug 2025 03:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5720260B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5720260B9E;
	Sat,  9 Aug 2025 03:38:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF6331
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21DFD407BB
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lc2D7_Bny1xU for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87183407EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87183407EA
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87183407EA
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-b170c99aa49so1810971a12.1
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 20:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754710711; x=1755315511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMQJDCLTHDtmWsrHS587ecsDDveCEIvaCIWN/1LEcyQ=;
 b=TKSM1PkCclYQ4JXl37EVu/J5WQkixfmdIWOvgT5jlZJQDQ83wp/olvtQFo/zeL/qKs
 XCzNDu+1eOtzKEwwtanNW+BAEpWIcem7fZOevQDROBaey2Bzenq14P4GRhRnvI3fI1i3
 7hO20cazCkZ6HtQp6PE3GxKnnPii8nKtyBoxLiRlYceihvJjiZ9qy1NbWEVNUGGu16Nl
 T1PblRluHC77xE8up2XnBL8jIxgor40BFMcjdJ2fT335VaJJsgqVsy6kgtHs21MsHlw4
 IiPw36xU56ts0ZpqwTXcBvFVkObD9iTJhipSWD3+DL1SCBW8hbfoxmg1sGuX6WMk8AXT
 Znsw==
X-Gm-Message-State: AOJu0Ywg7dpJWsPhtv3bcUjbeqLc0kZWWCuyg6G10F77iKw62w51ZJMu
 4F7Gd/eJQHScodZqUwtg5V1wGSUSPrugw68prpnrrZs3+IH2sQ4Fe3P+aVlK3IXqhsqqTFO7n+A
 b8X7buN6slZW81DoCc4lJQAj4CqWhld6k0nSN7/25qXt9
X-Gm-Gg: ASbGnctowWG/tcpoCmTqWqaK3Xx4P8WVnDVXg/LMEt5gl+VZLIkC6tNCqOk8oV1k6EF
 y4irr8+tWvEFSm8EthLZUqnxQ8uqtuxsBnfiPAj7oh+gpbHQ2iRdlZV6jxbHyHUgC2B0o0Lbev6
 QTOsF2DNz4GIxCwFgSG/IQEwSKEHxX0xPXMcc8gqIqEYq7QOB917CMhy8fshq/IHMX4RkE5I6U/
 8G+z26oMv4hcJb49haUNV5bt7RyvdWKOEYwb59K0qdTx7rJ42Z5hTWN60vbrrMhnm+Dy8sI7gUS
 4F6TvTdTJpTg6idgEcp2GCx6KjEKj7X4w7o8VdwF/dt9En7mbXg5Z0TXqDiwx2iKeurTk16z9VK
 erzin6oO2LU4xtogvtqNl160FP9yb3loxTev5cevaIjMvZvLg
X-Google-Smtp-Source: AGHT+IGxjB466I+DQZUTAlpT274nQpX3fQPMpe8gCsDgq4+yN44eA0E42/Coob9SCNfg8a0pTgPFyNfc53fD
X-Received: by 2002:a17:902:d486:b0:240:a21c:89a6 with SMTP id
 d9443c01a7336-242c2003830mr86583835ad.12.1754710710689; 
 Fri, 08 Aug 2025 20:38:30 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-49-184-144-89-37.dsl.bell.ca. [184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-241e8976de2sm14581565ad.47.2025.08.08.20.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 20:38:30 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Date: Fri,  8 Aug 2025 23:37:57 -0400
Message-ID: <20250809033757.1197-3-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250809033757.1197-1-git@jdknight.me>
References: <20250809033757.1197-1-git@jdknight.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1754710711; x=1755315511;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMQJDCLTHDtmWsrHS587ecsDDveCEIvaCIWN/1LEcyQ=;
 b=Lk865YeOxEnPCwmlQNiB5ZDdDCgYReI+yPuncTWvvWTQpUFQRvcNjwtSegBsCKK/kT
 1KBPwrzJ3IyE3Ph03Sg5x9TM0bpz5mu5MtJjVQG3+jleRiulHS6g0QfjktVeqXVhwFW0
 ZeUd7X8UyUxrb43wzmPLRFPQa1/QjluwvyUpMNB9UzjIq+2GJsJ68Op7Sl3AzMBTBkGM
 Dv+kE+UvNDF+0oDQdhYMTfsr2HX7eup53lbf080h72OmhBGHwyGWB/sC005LoI0vPOYI
 pIEICYnIiAMUpz97bJILZNKzs2Wrb2xN5UCyMSR1f/e85xXgMlommhJDuQiw57DmEjNN
 YQgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Lk865YeO
Subject: [Buildroot] [PATCH 3/3] package/gvfs: remove schema compile and
 cleanup hook
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
Cc: James Knight <git@jdknight.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

In addition, libglib2 already removes schemas from the target during
target finalization so the gvfs-specific cleanup can be dropped.

Signed-off-by: James Knight <git@jdknight.me>
---
 package/gvfs/gvfs.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b46b438dc6..6eff3bd859 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -157,16 +157,4 @@ GVFS_CONF_OPTS += \
 	-Dtmpfilesdir=no
 endif
 
-define GVFS_REMOVE_TARGET_SCHEMAS
-	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
-endef
-
-define GVFS_COMPILE_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
-endef
-
-GVFS_POST_INSTALL_TARGET_HOOKS += \
-	GVFS_REMOVE_TARGET_SCHEMAS \
-	GVFS_COMPILE_SCHEMAS
-
 $(eval $(meson-package))
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
