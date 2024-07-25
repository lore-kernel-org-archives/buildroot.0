Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAA2C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 13:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AA860607;
	Thu, 25 Jul 2024 13:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP7PJqGiXosD; Thu, 25 Jul 2024 13:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEDD660633
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDD660633;
	Thu, 25 Jul 2024 13:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 571EA1BF409
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4588960633
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JavQJxPIbXTd for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 13:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F49860607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F49860607
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F49860607
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 13:27:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so7077605e9.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 06:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721914031; x=1722518831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yK7F1ZxffQ7huc4kh+fJw4DU/QRC6ILuSiw66IPqUWk=;
 b=RvWOwnBtza96cyIxyQyw5wHcDSAEeDjF3gCZ10buw4wPtjJmtCeD3TvhfUsEnVgnWk
 YQWeFt2KrL6vv+ywaC8zbe7cqVHjGabsZ9LKiZgJD6H8fIOiLD4v61lfCU+W9AStPgym
 13GYXPVqjgYdepvsHR9wqW2P/56kdj14H1vTHSa0xuYznv8UXjyRaYPvwpe8CPUuP7TE
 6wng0EKRUVmN9Lk/rn4df3gzHbPDPf56FNMeym4y5W6xQIPJY5PSaj515y0XYGYtkeHu
 82mNmHL+TGkCSGrIxRvQKZIXtvBcx9RHogsdtL/r6wjnTuDHWbEIC6SLWgXWzZJ2b8YW
 +F/A==
X-Gm-Message-State: AOJu0YwvQWkz1yiQDbxaYAZx5P6xCCAOrAn7nP3ZNri8nKlB/LEqVbq6
 850e9TZzKBDRg7Wv5ZfWyYQeH7F8UV+OCd1Y44toRdabkhf+MewF79mZlqrs2OkTiTMeGa0ouLY
 NXSo=
X-Google-Smtp-Source: AGHT+IE5GK7+mAldqufyr56fhhTu5VWJ6JUkaBjEPZtbWwIJHlHBbQDHEyHcn8afNBtbQ444sGHkbA==
X-Received: by 2002:a05:600c:474d:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-42806be7778mr16868375e9.32.1721914030695; 
 Thu, 25 Jul 2024 06:27:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.5.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280573edbfsm36972185e9.15.2024.07.25.06.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 06:27:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 15:26:41 +0200
Message-ID: <20240725132641.333219-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721914031; x=1722518831;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yK7F1ZxffQ7huc4kh+fJw4DU/QRC6ILuSiw66IPqUWk=;
 b=E7JHBCgihU+CAVpXZsUTg5m6XLhAN7CxQT4J4MSFwVmDda7pLxTOqjZ6MVOIUwTL/G
 yumk1qpcjHgMcsTPPZocG9VkN4FMt9O0nN9tIN7cvNhz5ThqpMu72GL3+MUx4sN27O3+
 etUNt5DGRPyWww53kRpAAHMJQFv87i4v5qFSE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=E7JHBCgi
Subject: [Buildroot] [PATCH 1/1] package/s6-dns: fix uclibc build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

src/libs6dns/s6dns_hosts_init.c: In function 's6dns_hosts_init':
src/libs6dns/s6dns_hosts_init.c:34:27: error: 'struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
   34 |     if (timespec_cmp(&stc.st_mtim, &str.st_mtim) > 0) goto useit ;
      |                           ^~~~~~~
      |                           st_mtime
src/libs6dns/s6dns_hosts_init.c:34:41: error: 'struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
   34 |     if (timespec_cmp(&stc.st_mtim, &str.st_mtim) > 0) goto useit ;
      |                                         ^~~~~~~
      |                                         st_mtime

Fixes:
 - http://autobuild.buildroot.org/results/f97634e33c4ed94d6ab382a7c266288d814cfa0b

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/s6-dns/s6-dns.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 8e175431a4b9..ecd7764add35 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -12,6 +12,7 @@ S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
 S6_DNS_CONF_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
