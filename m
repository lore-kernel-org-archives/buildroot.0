Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A11C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2E160273
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E2E160273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD9F5401D8;
	Sat, 30 Oct 2021 21:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cQE2vE74fUy; Sat, 30 Oct 2021 21:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8694018A;
	Sat, 30 Oct 2021 21:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 479211BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36CC860719
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tscKmE48-dE for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6334760708
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:49:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 133so1522523wme.0
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbnhoxTHSddXelFDQHQPs2Pni7dcsdaQ2bpbDTyBCxA=;
 b=cvtwfgLQVTGmC07JmSK6X2NbNl4y5LQQp4wUO4rWZm9VP4oGm3zu9KoCrTR808IvGB
 BGWqQCS/uXOtFNKWLxNBIXXjpaXz3TsT+qP+zbM8odc42e9yr/TtgCrMfKIwL/RhAv17
 9KqSEbiK3xUo6bJ2vW5BCV28P5vIO4v0Crr6kznAPMUtr9vDImikbuAKBwKTxSE1+8oG
 rLgb4lHDZzJoaGG3XhLuy2b9Q/VwjS13CLK/vBzo6N5XuiNiz4oQIfwNMc/t4YC55XoK
 x+WTVG6ULuu5XmPnL/cnZ/g1T0XuxVqus6/Ro/cx2mHlFagzrBgJqpMxaS2WNvpi9lkn
 LkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbnhoxTHSddXelFDQHQPs2Pni7dcsdaQ2bpbDTyBCxA=;
 b=CyCxLNIiUO2mumsKm5nS2hcaiLQpAIaYMfrLJNhkyYNfVR9fF1rh8brlFrfhzH2rOp
 TIZJcRVZK93crIjl94BwtBOWwNV0Dod9zxXfQIo9qJ07acfqYfxRD0UxDj4f/JREarLk
 PycZYYhpn3W40rNITlu5DvurD1B1aM34q0XhBSoxV6YAlXZLbxZNYzEUE1a7XuNL9tQg
 3hL5MLMKaSaW1hVgzY/n0GjpFcC/OCFmYInZKM+uQ5EiPpa5fekzXiAsA6fePOjwfYWG
 CvT6JXXgvUPJ/L4XrofGQhwIQ8gAdFs1ijulEqDwyBJTvAm0c02A5Roah8ZYEeu3KJ+0
 92Gw==
X-Gm-Message-State: AOAM531Rbn8peJ7OCxz8MvfWTwYpRAkYCuKgtvH4tYSuS5iJLdTDcKYW
 th1AiGhUPNnQpVJo4H+0eQyhFqfShBg=
X-Google-Smtp-Source: ABdhPJwhgXX15CWtr1QFKKXnczUG6s4h5f9EvPNFFuys3X9WxQ7Qbw1IMQKXV135aoGk0qwFH8e/Vg==
X-Received: by 2002:a1c:d1:: with SMTP id 200mr29120776wma.86.1635630551293;
 Sat, 30 Oct 2021 14:49:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o9sm6449336wrs.4.2021.10.30.14.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:49:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:47:34 +0200
Message-Id: <20211030214734.2154583-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oprofile: needs zlib
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

oprofile needs zlib to avoid the following build failure which is, for
an unknown reason, only raised since August 2021:

checking for bfd_openr in -lbfd... no
checking for compress in -lz... no
configure: error: libz library not found; required by libbfd

Fixes:
 - http://autobuild.buildroot.org/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oprofile/Config.in   | 1 +
 package/oprofile/oprofile.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index cce2cfdab8..1e222a88f2 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
+	select BR2_PACKAGE_ZLIB
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 85bc4efa9b..fc88cfc038 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -36,7 +36,7 @@ ifeq ($(OPROFILE_ARCH),)
 OPROFILE_ARCH = $(BR2_ARCH)
 endif
 
-OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
+OPROFILE_DEPENDENCIES = popt binutils host-pkgconf zlib
 
 ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
