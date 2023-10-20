Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A23CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 16:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6811705B4;
	Fri, 20 Oct 2023 16:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6811705B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LlpQyMrLrQc; Fri, 20 Oct 2023 16:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D562C705B0;
	Fri, 20 Oct 2023 16:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D562C705B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 868461BF990
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F3884BEC
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F3884BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHhrGwYQwEGX for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 16:19:11 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FFCC84BE9
 for <buildroot@busybox.net>; Fri, 20 Oct 2023 16:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFCC84BE9
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so165886266b.3
 for <buildroot@busybox.net>; Fri, 20 Oct 2023 09:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697818749; x=1698423549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPFp7BZm4wB+4bUBdJd/YAkAYekvtYSBzJf4ksoirCU=;
 b=bk9ML46Xi7Vy/qVpiLNnhcllC5CimBFldylUBxZsTOeJOVHtuOV7WDkJSki/aTz6yn
 gPSeFIQemvgsQGQ/OeO9H6BG6uTLUjO/Bv4N9au4EDugFsf+ezTd+znG5mdjdkdu2c/H
 3M5bZS0cpZYgkUAQ+DZ+3C7AYs/YjYeAdvvRK00YCxhi6ksc3fkpVt3FdIrL95NvMN7y
 2YpdQ+j03puY+7oogVOiLWRv1W2CdfrJfXGgomlPjGoXOKBi9lS0zJ/Wya1uuEcsSem9
 ttZ5fRiTckSdT8bXAC+xv6IXo8yKyzFdgfORghlxVh6kCbuduBpkl2p5DDthpUFeHKMO
 zazA==
X-Gm-Message-State: AOJu0YwyavlyusyOrttKX5XsfKETTvQcDOPqwLkFGrpHNP1hqD0ALTeZ
 LcQ0TLdqOhzALJ9wVAHHqK4liqjIZ6k=
X-Google-Smtp-Source: AGHT+IH5xs1XEbavlfsA6wgfF7dUzFiapG/1VCQmkKhXDhZin5xMkCU9pr0ze9MMfIq8qJEbiRIkBw==
X-Received: by 2002:a17:907:3d9f:b0:9b2:b152:b0f2 with SMTP id
 he31-20020a1709073d9f00b009b2b152b0f2mr1692687ejc.10.1697818748887; 
 Fri, 20 Oct 2023 09:19:08 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090607c200b009c6a4a5ac80sm1746753ejc.169.2023.10.20.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 09:19:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Oct 2023 18:19:01 +0200
Message-Id: <20231020161902.48876-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697818749; x=1698423549; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yPFp7BZm4wB+4bUBdJd/YAkAYekvtYSBzJf4ksoirCU=;
 b=C/dPrtr6PRMUZysatc9GZe+wjME3A/HWWVkTNnPi9pE7J3n41q0ng0EjJP+U87Agcr
 bDGbwh7ZjC3ddHV3Ei6HUc1A7r1HP/th5Z+Nxi/serUbBFfSzgGbJorzCFAbyvG17pLO
 azfkB3nh/vk02Nvq+5xYTlRdD7l8ZzZx7v6daYhRbsIoJDJZRqpTFFtiP1F722F7yVx1
 BiQmbIKh07rzEaBP1jaCMBp+XDF3DFjppF18ji7bBG+U+19tNiuT0P/ZMkzyAc4RGiCi
 5gK9mF53rYioV8M3cTMi2Jxu7NsajejNFLmASx3tBKlZnnKVGO6xF0Z7CxhHAG+4qKNm
 bcDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C/dPrtr6
Subject: [Buildroot] [PATCH 1/2] package/perl-net-ssh2: bump to version 0.73
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

diff README.pod:
see https://metacpan.org/release/RKITOVER/Net-SSH2-0.73/diff/SALVA/Net-SSH2-0.72#README.pod

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 8 ++++----
 package/perl-net-ssh2/perl-net-ssh2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index b2e8b2d48..91bbdc2e8 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  57aa0f6e2be4020f75888a7195ad5cba  Net-SSH2-0.72.tar.gz
-sha256  867d83070fac6436b9f0971918243002072fbf8d2724a87c254b34250dce0222  Net-SSH2-0.72.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  222625c91affcceb43e861063d52943f  Net-SSH2-0.73.tar.gz
+sha256  a51e4c3168fc3d8ab89a6b673c836323303e95b18de19813ec4528810ec23785  Net-SSH2-0.73.tar.gz
 
 # computed by scancpan
-sha256  268afaee7aa88a41959c93cd91853e8124bdbe64a74480d36ff1130e01a1c0ca  README.pod
+sha256  e517e8d3690bbebf97f78c5ced4f0ecb26106eef381687dd6fb3879aa5a3f031  README.pod
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 20e45b628..91c08458e 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.72
+PERL_NET_SSH2_VERSION = 0.73
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
-PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RK/RKITOVER
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
