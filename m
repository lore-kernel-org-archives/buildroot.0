Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8818CD8CAC
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A71A61427;
	Tue, 10 Oct 2023 17:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A71A61427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qc2R_ZHMlKy5; Tue, 10 Oct 2023 17:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F76607C0;
	Tue, 10 Oct 2023 17:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F76607C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD631BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC0B061424
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0B061424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4n392GGzzqTy for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:53 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0874E61421
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0874E61421
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b64b98656bso1002914266b.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957311; x=1697562111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54B/7Oesf5RDKRgVd6QY0mArUh0a5dKoQzKr6+cpqxM=;
 b=M+cORPmDiGUseH0vpWPtWIjEF0fXll6H7kNq8642U6zz0O6oJeEAXAb7W8755xz+Vp
 m1LF4cdtNJvgQz9M/7NkEFJJrtjSaIVln9I07w36JA7nA9OmJyDTsBGzB9EdvU1fCOGH
 xwcb5++RIGgOyNmeEeUawkfY2i9pcrovxMRNHhDEGTl4MCu4Q5BsMhmtBVnSwNwXAsnn
 5UQUO8Er+5VFdPJrdTzVvgLMzJ4wC6LEViqZxHgeokp1gHxmfWtVF1cvxiWLgEpjSqy+
 PB5lxPwL15zmb//ezJUOzgfD0WAHlpihFJzbBVpGLEfkREyPslwjejFiQsI3AFs5KV3z
 9apA==
X-Gm-Message-State: AOJu0YxYWXsiDfF1wGRaPDtQ4t15oW109vK8eQJK6FGEf3L5g4wvIScW
 b/+lCgbiR9RbtYdkJ+qb8X09Ugv1QOdXk+aM2f0N3w==
X-Google-Smtp-Source: AGHT+IFU6Qmz+eLoJoilMdKsCfK/TL9VPkKLOXRvdtftJM0bdUwi9FMkk7b+E1s2r0YcUI0LdbOv0w==
X-Received: by 2002:a17:906:220f:b0:9ba:fb9:d334 with SMTP id
 s15-20020a170906220f00b009ba0fb9d334mr8435996ejs.13.1696957310879; 
 Tue, 10 Oct 2023 10:01:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:30 +0200
Message-ID: <20231010170133.2981698-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957311; x=1697562111;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54B/7Oesf5RDKRgVd6QY0mArUh0a5dKoQzKr6+cpqxM=;
 b=fUsinCI0z1IzdmQ8tzp4UIxPZ2PC0i23VVb+QEgLoinSf53qReSFX+ksHYBpJ85IXD
 UQQMYcAvrx/P8TEQY0YW1c1sZ6Qwp6suxPfOK/Zlb9aZcnjGVNscFQCui/Cx+gaD484+
 H7R1mfrFWP3m+aDIGeh0TkF5GtkWeXLh1P+S4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fUsinCI0
Subject: [Buildroot] [PATCH 6/9] package/watchdog: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/watchdog/watchdog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdog/watchdog.mk b/package/watchdog/watchdog.mk
index 2699fb474f..c5066ad5b1 100644
--- a/package/watchdog/watchdog.mk
+++ b/package/watchdog/watchdog.mk
@@ -6,6 +6,7 @@
 
 WATCHDOG_VERSION = 5.16
 WATCHDOG_SITE = http://downloads.sourceforge.net/sourceforge/watchdog
+WATCHDOG_SELINUX_MODULES = watchdog
 WATCHDOG_LICENSE = GPL-2.0+
 WATCHDOG_LICENSE_FILES = COPYING
 # By default installs binaries in /usr/sbin/, but we want them in
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
