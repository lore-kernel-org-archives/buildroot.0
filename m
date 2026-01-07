Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF390D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9592E40A46;
	Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz21vPlr2Gpt; Wed,  7 Jan 2026 20:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF9D40A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816039;
	bh=SvggYqB+3c17EPvHX71QvCAZWJSoLaslFNVYGZ9NlzQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=cf4ZAS0OGUoCICzO74Qcl7L8FGcCn5K0bfJ9P8MlStYwhiY4TUMuKE12iTgzOncRe
	 ReB9kio+MJSwQT2FUSzRtEM7f3EYVxLCCNqMdKE9XGL8/XZhxUi0XkgXDdryn27tc4
	 r6snP70VsvBVYBCv5bZrPN9HsCb5nFGVLRgwJN149O1FvgAgaiiRSvUK6uA+mO8jNj
	 2ctt7Lh9yCDxnQDOIpSK3jT26iR6sXHNEPnMV/c6dOt9DMfyd1dnMKyTU6MW0qNMgi
	 5myZiVLjLd4fhxfkW2/hkC+A0e9h+iUTNUXStb8iJNl98Ht59cxis7WNwPlr09Ta36
	 L8BwpQjblb3lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF9D40A65;
	Wed,  7 Jan 2026 20:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C59925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25B4782311
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNkHM8BRy9vA for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA85C82336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA85C82336
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA85C82336
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so26263685e9.2
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816029; x=1768420829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t9axmJr0Igz+aeAy3ti+PpSblQlIfeb0A9GrTouAHOE=;
 b=nx2ElQwo7iKMfsX22/dJZjokkUGylbHxHBe3yNskHVng+5fkejcJ0DrLsHXF31VyNs
 3lueviqw1LsGSyxfd5GPA2lBC+DRw+EAndOCTyeisLfBqa0TZEpJCuxSEphHx1RSXpQc
 5EIh/Lf/ISDtijBrZ0cXAbJwZiEwuJD/7snoVNJ6GyomXcOIFPVkM2uFx8Dlt35Mjkzv
 RnvGoDQhqZYEeznkly5pGYZzaxv/1E2m12jMQTV4vi3bw8+pAeM8vaJzdQ0coWMfhcW/
 I36rkg3nleMIBfAjiTL07ghPDDnIt5TIae351s6px4yizGZ7HD4/I72z82D1678wnzqE
 P86A==
X-Gm-Message-State: AOJu0YzjZzKJynHa3N89nonLpSffIr4krHEOY+6pjrXh8jLJ5iQlszNF
 mCHmnLgwaX3hriGy13qgo4xzYIUsGPXO7BJDq+cKpxrkRMIhbu2Y4VqPTq0ehaGu9B5C5y6CCxR
 uVsOkiw==
X-Gm-Gg: AY/fxX7jDVTwOEgPXnpq674hcqgeg4a04pcZsIs1BEuhGghf6Dllz95EHGO3SQ/P/dr
 3oZOTvTVYxl1ucSrvbrFk0DG8KECHL3Fv8bINmZxihpGb+X+jQEVgnOkdmdbffdExhAlTM8CF3n
 qvaG6jiRI1/nS+nDH6lpWaMZkAsecmVsJms0zO5jQ0f2moKwC684fWDrOAJKd1ZwYKHlBxryAY5
 qAo16UX+pk/4/dsCUtJBEjydfDA76QnGWXBysxcYu5PQ06AcBmfZQ/V7gSpVd10+dOm5PMqs/3U
 fJgI9+5JHdKRwk6kkBDQzVTj+L/evta47uage8Gv7F75PuRMY5OJKyvmjnSLDKJsGCy7UdoaHG/
 3dZYvLTFzsVJqUyutEu0Ucz1MK8hCItqyBtqeY+tETBgql8g6q4SJ5NFa6xKG4dyXgOnI8H+Eau
 OdQFGFz4W3IlGTFLSJ3p5mrEyWACK67l8UM5E=
X-Google-Smtp-Source: AGHT+IHX4lTcQAsPxeEGAqxXHyGpR0A1KUFcNTqPyyCnHsh7UmCk3LRjo0xBa9F4rSracywWzOqN5A==
X-Received: by 2002:a05:600c:45ca:b0:475:e09c:960e with SMTP id
 5b1f17b1804b1-47d84b38676mr45616735e9.32.1767816028327; 
 Wed, 07 Jan 2026 12:00:28 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:28 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 21:00:01 +0100
Message-ID: <20260107200004.665611-14-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816029; x=1768420829; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9axmJr0Igz+aeAy3ti+PpSblQlIfeb0A9GrTouAHOE=;
 b=n/ueHXiUPHOvdcUUnEZVLvkGBDlmvfyxlG/rB47VUfTdskq6LLns61zeXTk187HzBp
 ZTb8f1xzilO3x4aQuxt8r4W9EALjiPbNooz8r+INUod8mBd+Gplh3bI3C8VWGVHQnxZ8
 UShbWdPWLApEV0gywLnD+aflWip4R4UbummUFNeC+EwnSYKQmaJv8KGqyRBfMQxijbsK
 xOb4I1myFgN251CmtGbe6hZ7t/Bs7CaLIPvakI4aeyO4+hLFtdBnrRN7FwEbAukuhdDi
 083o8iSm2mt39vDhpd9qwwaPddPNOj9kXFEKXhQXVyPM3UJpJY5CoTab+wgpGSpx+fju
 889g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=n/ueHXiU
Subject: [Buildroot] [PATCH 14/16] package/perl-module-runtime: bump to
 version 0.018
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-perl-module-build is no longer a dependency
(Build.PL was removed, so Makefile.PL is used)

now, this module has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-runtime/perl-module-runtime.hash | 8 ++++----
 package/perl-module-runtime/perl-module-runtime.mk   | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/perl-module-runtime/perl-module-runtime.hash b/package/perl-module-runtime/perl-module-runtime.hash
index c87963bfb..e30040c7d 100644
--- a/package/perl-module-runtime/perl-module-runtime.hash
+++ b/package/perl-module-runtime/perl-module-runtime.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  d3d47222fa2e3dfcb4526f6cc8437b20  Module-Runtime-0.016.tar.gz
-sha256  68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024  Module-Runtime-0.016.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  455eedb62183b9d9e437c59c375c1054  Module-Runtime-0.018.tar.gz
+sha256  0bf77ef68e53721914ff554eada20973596310b4e2cf1401fc958601807de577  Module-Runtime-0.018.tar.gz
 
 # computed by scancpan
-sha256  ad1761020436687e8493208336ef53e84589fdba212da59b05b8111cca75ddc1  README
+sha256  03b1feed0e190459ef83b42518a970e8ed576c4f5bb5156d047a2edc4e469427  LICENSE
diff --git a/package/perl-module-runtime/perl-module-runtime.mk b/package/perl-module-runtime/perl-module-runtime.mk
index dcf045cf1..c698300b4 100644
--- a/package/perl-module-runtime/perl-module-runtime.mk
+++ b/package/perl-module-runtime/perl-module-runtime.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PERL_MODULE_RUNTIME_VERSION = 0.016
+PERL_MODULE_RUNTIME_VERSION = 0.018
 PERL_MODULE_RUNTIME_SOURCE = Module-Runtime-$(PERL_MODULE_RUNTIME_VERSION).tar.gz
-PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
-PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
+PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
-PERL_MODULE_RUNTIME_LICENSE_FILES = README
+PERL_MODULE_RUNTIME_LICENSE_FILES = LICENSE
 PERL_MODULE_RUNTIME_DISTNAME = Module-Runtime
 
 $(eval $(perl-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
