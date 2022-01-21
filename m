Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AACFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 19:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB7D60F0B;
	Fri, 21 Jan 2022 19:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crD5PC_24ghK; Fri, 21 Jan 2022 19:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B4B60F07;
	Fri, 21 Jan 2022 19:00:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 347AD1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2833A80DB4
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsG6BIHJ5hwA for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F498132C
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i2so1356615wrb.12
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOmyOjrd9+MPXNzGgIwwiqP7XbpurUn2CMa2q/Ix3cQ=;
 b=byp7NXGWi6hUnvsJskRC3cl55Pl0zjjEV3rc7U39OkorrUQLkDJZFPBlfJAj+O9D3Y
 VYuY+T760yo6WABSbXsOnW1WAginTEdUYLZkxjIeGxZurmNamlPxlpM1EH3o5vH015M6
 OCTMgAqLEThfO5aoqVE6tjkY98yUhkDmJkheWeChZL2WQcD5fLSuJ9bUwMJs/os4GUGI
 09yIg6V2+Prt9bCnyEjUsnCThgDPpbasio1DJVfGdlnH9nItMr+6J16BKcNqXIAn/EPZ
 iAiYrysDS4+MSxd8YsUubG6rjCyXP+eEDcht1ogXtLCwIgINjvVnecrvGOOVV+PeJKG/
 NTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOmyOjrd9+MPXNzGgIwwiqP7XbpurUn2CMa2q/Ix3cQ=;
 b=zu8KXmtFyWCOkmijFwmp6Rzha7HKJRiYYocJYcdp/DroExILFvYsMsdOFJn6CFoYG8
 KX6taLFshITk3eEMjP8UP5WkNzZS6pLRfZUG4WpqpZxy04pFj3mr/p717Mr76O4WqDF8
 qIFge8QgK/40yvULNyHCQYi/J+qofM7io6hDDHimx8J59SZTZkZnzYrOx7xGDb9aEWHO
 1zNpYCFcQsd5EirhjTRLgXlBgZpNopDtW/kbitKtvIneBtQqFNN596hzJWIsklR8ApvB
 NHJgauHDSx0q07egbLryhbDcykUq+Wk+nKD6ZEZP7WAdUeACaB0d4YmcuBhTDUBvG2CH
 qhaA==
X-Gm-Message-State: AOAM533LnNucVj8vcgn/ftKxqec3BBAj+XTLSf/9BxXU3bHe8upTQpFy
 MWKRseBWqTfajqHVHtbQyZs5VJxsAAA=
X-Google-Smtp-Source: ABdhPJxst9wYgPptbVAY6u/qcXBdehuq29wAJecHs9L8oC/WB1amdIj0OJ2gA6xafElckKXmwX1hvw==
X-Received: by 2002:a5d:6b85:: with SMTP id n5mr98813wrx.689.1642791534715;
 Fri, 21 Jan 2022 10:58:54 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:54 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:58 +0100
Message-Id: <20220121123859.754653-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/8] package/perl-try-tiny: bump to version 0.31
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
 package/perl-try-tiny/perl-try-tiny.hash | 6 +++---
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index ed4d8ac74..7aa88724f 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    eb362c3cb32c42f9f28de9ddb7f2ead6 Try-Tiny-0.30.tar.gz
-sha256 da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b Try-Tiny-0.30.tar.gz
+md5  993a29ee8a03c9bd9c2f7c53d1082a03  Try-Tiny-0.31.tar.gz
+sha256  3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be  Try-Tiny-0.31.tar.gz
 
 # computed by scancpan
-sha256 f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b LICENCE
+sha256  f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b  LICENCE
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index f13e2ee59..cd2421a3c 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.30
+PERL_TRY_TINY_VERSION = 0.31
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
