Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E17EE0215
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 07:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E9B60A57;
	Wed, 11 Sep 2024 07:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRuwaR0lnAy2; Wed, 11 Sep 2024 07:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4909F60A65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4909F60A65;
	Wed, 11 Sep 2024 07:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7F031BF83B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D753081213
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fLlayXDngcS for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 07:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95FA681210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95FA681210
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95FA681210
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 07:55:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso77313025e9.1
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 00:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726041349; x=1726646149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5pO3vw5iutTHtxcECOcgi6Ko842s/4+IWny71AvkID4=;
 b=ig+Z4RW9/HOGnVfjp2d5ayUVNVweLXMWgHcqRrI9zAVf5mX8655zWjQnPvrJTijqDW
 QNw9faNQFyPu/tbkLD78JH4DrG8wl3KoeQl5lDwBucIQ6QUuHUSxUKVHJlft1KHM8Ndy
 asTYqy6TELhn7nrR3/AhoI9lkiaIeqbgCK4Mlgb6R12ii5CnVsuHwzoam6PBm2Om8J2N
 n+SLPcO8uQAHNJkSxX0aZOMa0n7RXpB30YuRMi7htEvLRbLrR4b3OCM2HjMhIv6A3z5Q
 nkKrnfiVZqGawPWPatg95fpb8xU2pTy+kGqG8SqvGgMTgTLnxtdogN4oypSycp7hsJcW
 C9Gg==
X-Gm-Message-State: AOJu0YyqkI7UbQQKNLu7RcgqoVBalcwPt1dChUQu0OrgpvkQWQnJPgbs
 V5baR3lJjzD/3JC5Np4Ydm9KKRdsHI5r+tDdVy6bo68EL8KtwfaSTuGKGsMAwLcMIE17ElP8L/L
 pMA==
X-Google-Smtp-Source: AGHT+IGdnSiA6C8F4Ae+Jl5czhxWB6jSLFTdq/mwsPN9lhdO3XxPp8yj3V1mZ4xF3puLn/WpM0GPGg==
X-Received: by 2002:a05:600c:4592:b0:428:d31:ef25 with SMTP id
 5b1f17b1804b1-42c9f9853bfmr147663085e9.12.1726041348589; 
 Wed, 11 Sep 2024 00:55:48 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8b7fcsm134799525e9.47.2024.09.11.00.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 00:55:48 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Sep 2024 09:55:43 +0200
Message-ID: <20240911075544.3455716-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726041349; x=1726646149; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5pO3vw5iutTHtxcECOcgi6Ko842s/4+IWny71AvkID4=;
 b=QRwqyvj7CoMkmCyDVI4/PTwf3F7rp4zmvb+Tkd2GZ55XHCOmrqEml8cVZ+4IqZJ3Q0
 e/2UtXdIKanC9P6Qm2o4mhyWZUqFtm9hZKOyAzZrrQmhpkX/EeeTOu3t+iqDSxG6ODzj
 xrh2hJs2vibXiutyT0hZZ9BtJ748RGv4wMFFcG4fnC4ykhF2Mnpc4WUBt604GssG6JEi
 IGZoopBJkwC1B25yflMZEldeFBZYR6U6ZmotXLmW3mRwzN1+/3cJBjTkX7XmdjNrip9e
 rvjqJyFOuVtSl9L1Fz6LJat+dOHjyKhLd6KRE318G6NZYRAFjtRfgW2WgGLVvP47SM8J
 4wdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=QRwqyvj7
Subject: [Buildroot] [PATCH 1/2] package/perl-mime-base32: new package
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
 package/Config.in                              |  1 +
 package/perl-mime-base32/Config.in             |  6 ++++++
 package/perl-mime-base32/perl-mime-base32.hash |  8 ++++++++
 package/perl-mime-base32/perl-mime-base32.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-mime-base32/Config.in
 create mode 100644 package/perl-mime-base32/perl-mime-base32.hash
 create mode 100644 package/perl-mime-base32/perl-mime-base32.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f..6ceb826e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -887,6 +887,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-math-int64/Config.in"
 	source "package/perl-math-prime-util/Config.in"
+	source "package/perl-mime-base32/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
 	source "package/perl-module-implementation/Config.in"
diff --git a/package/perl-mime-base32/Config.in b/package/perl-mime-base32/Config.in
new file mode 100644
index 000000000..e05b96557
--- /dev/null
+++ b/package/perl-mime-base32/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MIME_BASE32
+	bool "perl-mime-base32"
+	help
+	  Base32 encoder and decoder.
+
+	  https://metacpan.org/release/MIME-Base32
diff --git a/package/perl-mime-base32/perl-mime-base32.hash b/package/perl-mime-base32/perl-mime-base32.hash
new file mode 100644
index 000000000..a01e405be
--- /dev/null
+++ b/package/perl-mime-base32/perl-mime-base32.hash
@@ -0,0 +1,8 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0c7735fa09e74c7f2ec93d1890b8c6c0  MIME-Base32-1.303.tar.gz
+sha256  ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99  MIME-Base32-1.303.tar.gz
+
+# computed by scancpan
+sha256  08c2ed7589aff3b2076b48b792078d3479c2295559ee7bc4615e93abe0473939  ARTISTIC-1.0
+sha256  3d2fb9b42d1134f39c2e990d66b5e9b77005663fe956db526cc380eb3d9a77d8  GPL-1
+sha256  834c4ebff45be11f35f059b077fdd747dee4b8a747b95049d849fef1c0ccdc62  LICENSE
diff --git a/package/perl-mime-base32/perl-mime-base32.mk b/package/perl-mime-base32/perl-mime-base32.mk
new file mode 100644
index 000000000..5c5272fe1
--- /dev/null
+++ b/package/perl-mime-base32/perl-mime-base32.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mime-base32
+#
+################################################################################
+
+PERL_MIME_BASE32_VERSION = 1.303
+PERL_MIME_BASE32_SOURCE = MIME-Base32-$(PERL_MIME_BASE32_VERSION).tar.gz
+PERL_MIME_BASE32_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
+PERL_MIME_BASE32_LICENSE = Artistic or GPL-1.0+
+PERL_MIME_BASE32_LICENSE_FILES = ARTISTIC-1.0 GPL-1 LICENSE
+PERL_MIME_BASE32_DISTNAME = MIME-Base32
+
+$(eval $(perl-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
