Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825DEC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26ACC404F7;
	Sun, 14 Jan 2024 11:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26ACC404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAQBZDIpvXHP; Sun, 14 Jan 2024 11:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2D9404E8;
	Sun, 14 Jan 2024 11:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2D9404E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 846F71BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D23A404DB
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D23A404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqYvcntsPyKd for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:28:53 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C9674046D
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C9674046D
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3374e332124so6045672f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 03:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705231731; x=1705836531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wk/ldFgxw7A2jvN+fYpZVgO5vuA+4PQZXXCMYfUZgXI=;
 b=suMRINhUWGhF8bIZt5T3d8dITvP9DIxbZ3Jk+ztvt4rPtBUBxUIjtLYqIw5wPX/Fp0
 mGMq6ucGy0pOQ90CV2iO46Hi3p4vA9H1YietQNu4AapI4tcYYL09UjSyJLOmhfPzMDFt
 sBkTQWlpJKFRlWNJiMVy66JNAL3FertBbtNjs5CUET+ciIE2BFFG8MU7u/t8vjln11+U
 Wzy954W3Yw1PnhXEMRH8VpoEvUySidhHsKDNc104kKhjAazIe8lOzMGi9VIEW2F6cQ/H
 muGzgR72eBwdjbGLVZNG3UZ/4Blf83DVemuJ0ZjjtFOavPs2dO9CgHHbDRRaVaTvfMLE
 HIRw==
X-Gm-Message-State: AOJu0YxilAIlejtz+oVQt6SAilT7j4BOgiKD2yh8scWNQnFHsOSmJ7Pt
 aBcVGMvRJgfi8fEZyDtPo4LpqsJqZBU=
X-Google-Smtp-Source: AGHT+IH8OIqguNUm1C9Rj3smFHeAtNUcRJm9/aNJnD44GvEMeLKUl+x0uv86drYZqt9wg49UPvn69A==
X-Received: by 2002:adf:f282:0:b0:333:130d:4314 with SMTP id
 k2-20020adff282000000b00333130d4314mr1982746wro.65.1705231730521; 
 Sun, 14 Jan 2024 03:28:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d6603000000b00333404e9935sm8839216wru.54.2024.01.14.03.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 03:28:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 12:28:39 +0100
Message-ID: <20240114112840.432251-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705231731; x=1705836531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wk/ldFgxw7A2jvN+fYpZVgO5vuA+4PQZXXCMYfUZgXI=;
 b=D5HcZMIX4jDHOTVTUg94x0XvKnGXLDLJQwwjnirXYD7gqo12bbjwIFnXT34lmoNW3h
 AgyJ5ZjEOdpOtEjd0JS5yUVAy/ms2SfCMyXDf3k+YkDRIZitnrHwXrXAw/+PmwX9Pg3i
 hZV+sS7N3uKdsvvCzweP2WAcU2UQNMbXtwHsjtsKHWqAzlHA6v5VndmjpM1Ey2v3oQSu
 7y/DebmQilcx+L9KA+u4KEPvBvuDxwNh/eoYO1/B7juaCrl6xKJHy7G4PDxpD6Fusg3w
 I7iZwLXUceUuD3FNlCUJh2/atuRB1Z2Kwe7xxszE45gWaDP+PDJC8DsOghsbhsO++RzS
 mY+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D5HcZMIX
Subject: [Buildroot] [PATCH 1/1] package/criu: add C++ comment
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3e4b479f39c15ffdf307ec8395d856680c727204 forgot to add C++
comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/criu/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index fc0da823b3..4c295acf4f 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -43,9 +43,9 @@ config BR2_PACKAGE_CRIU
 
 	  https://criu.org/Main_Page
 
-comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
+comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
 	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
-		|| BR2_TOOLCHAIN_USES_UCLIBC \
+		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
