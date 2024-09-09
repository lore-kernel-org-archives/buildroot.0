Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120BECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FFE80EB6;
	Mon,  9 Sep 2024 16:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXS-8Xek1hk9; Mon,  9 Sep 2024 16:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A7E9810A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7E9810A3;
	Mon,  9 Sep 2024 16:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168A81BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E11A80EAA
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB1NhU7EapTp for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A29CA80CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A29CA80CA8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A29CA80CA8
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso13370135e9.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899275; x=1726504075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0nbwmkdXPXP9yc9gVZ9c5yJ9mL8YaSA3PZ3x6kjrKk=;
 b=v2JvP9uykWO9cRKWCp9RUvkabGiGOE7QQ9FfwAdUHwTHTt5sYRAm5GIT8OeQl+xcH1
 66g49tivW5UoZHUc+GPIX3TH1anE0qpenoudTqTcr2lEAWmS+/a4jGOARqaKD1/CKRU/
 A9p7cxrOV6kwl6jeJxTok8B/UK4arLD406Q/OYYnRJTVW1yfYXQWWK4EmVrRYS/JnVtn
 iGhtFmZT8mSszu26CpXVCcfddH4r9FjC+h+7vmVykCsh2h14mA86hr8qDZ58rR8kuhKz
 xZfCiPJjBnuS8JkgzfjbVd5FS3L2XxJOHplgwOjAXWVmLpIGGER5QTiTlXE7U/Q0YJG+
 QeEg==
X-Gm-Message-State: AOJu0Yzu/LAYrH2K6jMK7kuHojA/ckV8mKGt6x0xc4HvnjUODsYXqajY
 rpEhptsnXHL0HCzEzLhkYdWSv14rI7wJtBeyZJLxJ1Cj8zlhFKp0luHOLzKBuAwAlgYfkmVjBEC
 +9Q==
X-Google-Smtp-Source: AGHT+IEqulreFQw8B3boXpcza9f8XR+EhBSLWk9XyaYv6pHg0OsOIPWFvD09e2aj41dmznwcroWF1w==
X-Received: by 2002:a05:600c:1e07:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-42cb1a4c4famr46672245e9.33.1725899275513; 
 Mon, 09 Sep 2024 09:27:55 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:55 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:49 +0200
Message-ID: <20240909162703.3439481-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899275; x=1726504075; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0nbwmkdXPXP9yc9gVZ9c5yJ9mL8YaSA3PZ3x6kjrKk=;
 b=OrOowajaJpU4ea/0vczaAbml5UB27mSRiyCJcliQqfjHvccfcYy0ERaJOlTmoRyi1p
 S+N/MwBuZD078VIg4RapNyUFwjtKjsm1dNaQmY7aYoEz0Ps38m+UpFwAi0xO5o/Zku0x
 vhhgEKae2HrHl5mW8bNCdlflPYXECULJoPalwc3FxB+hsYuyernTWsutO/OQcGwbtIcI
 guwxYxkfFWHdxwOezISAkHrzVvU01LCDeaWNKxCdVSfsrP2lb39TrHZh/OFrvFFnvAk0
 bnEl3WhUFX3IeL2ssEMPxI/F2ML/1Cod5y9R1HGDSVr2MK5nNNmt6zjbreoesYvXNRCw
 iaag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=OrOowaja
Subject: [Buildroot] [PATCH 07/20] package/perl-mime-tools: bump to version
 5.515
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mime-tools/perl-mime-tools.hash | 6 +++---
 package/perl-mime-tools/perl-mime-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
index f67fe6154..0b3ce379f 100644
--- a/package/perl-mime-tools/perl-mime-tools.hash
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  a2f0e07da2ff4b0478908544cc4b40fa  MIME-tools-5.509.tar.gz
-sha256  64579f0c923d81d9a2194586e47c3475519e2646e4b5c102a8920759facf6973  MIME-tools-5.509.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  dbc3c9f982498c35d8a103af17c5b5c9  MIME-tools-5.515.tar.gz
+sha256  c1ba1dd9f0b2cd82a0e75caedec51e48233f9f01dc29a0971bdff1cb53be9013  MIME-tools-5.515.tar.gz
 
 # computed by scancpan
 sha256  151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93  COPYING
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 10279d730..1b526be91 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MIME_TOOLS_VERSION = 5.509
+PERL_MIME_TOOLS_VERSION = 5.515
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
