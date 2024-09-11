Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8CEE0214
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 07:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB0860A6F;
	Wed, 11 Sep 2024 07:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHhRClb1Co68; Wed, 11 Sep 2024 07:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F68160A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F68160A92;
	Wed, 11 Sep 2024 07:56:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 447A81BF83B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3373681099
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NM5tLFOIXsdd for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 07:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB0EC81066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0EC81066
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB0EC81066
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 07:55:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so15102865e9.0
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726041356; x=1726646156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/4GDbC5ssI+HrflerB2D+iPGsUGrBmPLNXSs5MPCSA=;
 b=dlXm4ZaqK66RJZxuuP9xEgY897/7lx6rwu+bdnEdPxXoqSGlcA/+Wq/XD6o33FKgPw
 djL+9QALaddBQeZbrE0HiPguOQShbqVHHindHJF/oAuUuAS786WbDzNE85mpHeHCiZPq
 BH4iDJwa8Jw0vXyG9to1bkllIEGeWRfB9JAtXzqbntx3vuy9Xu3YF6dhHv3knKVKU3c6
 AqN7/o1/ZIbas+2Qd90aO69O7HqCGDJAGEtZTFysQMLnXC2zkyuX7FqvabdUa8qE7pnI
 jhVxjNrEh8HZblje+uP66dhn6bfvk6FAR6Hy4rHgt+JSM5NMOpnnMw9CxcRWoccO25Vc
 dv6A==
X-Gm-Message-State: AOJu0YxOPKg8xNxWz2Ky84pZQTkWFsXWfgexdOY0V7m52Y9yPU6RZ4s4
 f4OIU0fciOPmllv1WYr7gMyIVDnkEYi9AFhPswQ/w75EX0BkmtpBPtozw0E4ZTI2kq7YflbWE18
 j7g==
X-Google-Smtp-Source: AGHT+IGDPP065O12BqR7Ub+D02EfBMS2bmitEQna1u6prGMgoieFOslnoHdPOPNSHwK3TZ431UI6pg==
X-Received: by 2002:a05:600c:b44:b0:42c:a574:6362 with SMTP id
 5b1f17b1804b1-42cce7a4888mr10487235e9.11.1726041355820; 
 Wed, 11 Sep 2024 00:55:55 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb21d2fsm137641635e9.1.2024.09.11.00.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 00:55:55 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Sep 2024 09:55:52 +0200
Message-ID: <20240911075552.3455745-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726041356; x=1726646156; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J/4GDbC5ssI+HrflerB2D+iPGsUGrBmPLNXSs5MPCSA=;
 b=nxHLZfJq55c3zzWj+UZYLi/0iG3nMBsgbyShQuK7KG9SKiCOSEKfS3VdlYkf2aXO8q
 pV6yXs07lBb0BrsuN0xRbsfr84CIsOx1G5UCO9GMtqo8OT6u5+Xn3rln/JmojkHXqaZe
 6CGMvVLUXUWf+nHv/DO+RAfyrkzX9FU8HEFIA0WdYjIn5Rn/sLdXp4+0+15t8iqcj6RT
 Sd8aZ8H1mTRHaGDocJrieq5v07S7ozU5TbqoVbVc26AWRNg6YaVUxKIU5k4y0953mxMK
 Y/K0742s6R2rCfF9/L6OvnI/+DeU+LuGiqyV6QW1/SWHrXi1prrfNYfsHDjUcMTXCjSO
 GUjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=nxHLZfJq
Subject: [Buildroot] [PATCH] package/perl-libwww-perl: bump to version 6.77
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

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/libwww-perl-6.77/diff/OALDERS/libwww-perl-6.67#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 8 ++++----
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 8b4b229b5..5951c34a5 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  ff7621d0350da3052f24db9a74692672  libwww-perl-6.67.tar.gz
-sha256  96eec40a3fd0aa1bd834117be5eb21c438f73094d861a1a7e5774f0b1226b723  libwww-perl-6.67.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  e70e2f41a97b8d97608569d10b75b931  libwww-perl-6.77.tar.gz
+sha256  94a907d6b3ea8d966ef43deffd4fa31f5500142b4c00489bfd403860a5f060e4  libwww-perl-6.77.tar.gz
 
 # computed by scancpan
-sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
+sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 6c4bd2980..38f68385a 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.67
+PERL_LIBWWW_PERL_VERSION = 6.77
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
