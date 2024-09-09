Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A91ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C0580EA8;
	Mon,  9 Sep 2024 16:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjoeRrDDMjwx; Mon,  9 Sep 2024 16:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862CF80D8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862CF80D8D;
	Mon,  9 Sep 2024 16:28:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C401BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796A380F8A
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4p1uym0WHEN for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C71880CA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C71880CA9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C71880CA9
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso19890245e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899281; x=1726504081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOUSOTRzAejsrD+SV3jG1ADwytu2lQHRlDE80r4XXV8=;
 b=fHR95GzMVqy42XS2xX4NIQ0H/OBu6uSBRxDf15DZPlWfyqhZlwWnZKntd3Vbxs8esh
 Y+B9F7lok8V2vh9zMEzCKrdZMx3tSbH1XloZcymbPFDUXccxrl3+XhP6NcB/fU+Zsrjk
 O2ItEMcjDCg0JKkAO8pfGebkTDgNGsmV1k1TuXwyzD5QOgsNjRys6pCPAxPfXs6B95bx
 WjMsywsiRg1vxzGO2QcQh3fMCAWLNcO/IS2A83YtEV/7SycA/iiGnXxPLwAKoU+WQ+PX
 iNwU2JkpEfKFJLi5Rwkvtvn+kONg4iUXOdPcrJhDpOS+Ru2AqIkQluw8Q1hWrkADkXEX
 Y6IQ==
X-Gm-Message-State: AOJu0YwX6BIyO6TCZu48Yj6zeL4KXzE37q/QMGV0QIwo6SpuC9fYs444
 orMQP7RxOXlgo5SQdujx4VxSfxClnj2k89hW2u8TdfyN+WR416746f9tXQ9IqotVGcXfCQKEC7C
 1KQ==
X-Google-Smtp-Source: AGHT+IE4mkIesnYyQKt/gQ6hgLIvEj1VN82QbataCaYmxhr8GRIYati7CA4+nq95D0ViltwD6lUPbQ==
X-Received: by 2002:a5d:66c6:0:b0:374:c05f:231d with SMTP id
 ffacd0b85a97d-378895502a8mr8307387f8f.0.1725899281059; 
 Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:00 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:58 +0200
Message-ID: <20240909162703.3439481-16-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899281; x=1726504081; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOUSOTRzAejsrD+SV3jG1ADwytu2lQHRlDE80r4XXV8=;
 b=YJhPvNYTUusjYvMLdrfqAbiI++Sm8gmVHofHXvY2fvbUCjd9dM+sAhKHBUrwTngHHZ
 oJ/V/vT+b8tlxCAuT0XWV+/tfZEV1FFqHadkr8V/ssyfJjZTPAwnpjOlBVesCtN16BrA
 1polbkpM9R/etKvYwV1RQKTvOLgLF/SxeKlTRiLCaP2MldwbMplcTkh2mDO3itAMcKae
 j6bvq/hPCuQFZV/oYWo759xtgAdboZ/FU+wzqQKumUfJgOC8wmL3VYAEOsKj8s/YenNj
 +S2CdbVypZBpk2k56v3GIPzdcDWcNHS+ZIHnY1Sqy35cfusXPVAokYGKzaSRvxZFeu0G
 pD0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=YJhPvNYT
Subject: [Buildroot] [PATCH 16/20] package/perl-extutils-installpaths: bump
 to version 0.013
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
    see https://metacpan.org/release/LEONT/ExtUtils-InstallPaths-0.013/diff/LEONT/ExtUtils-InstallPaths-0.012#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-extutils-installpaths.hash                       | 8 ++++----
 .../perl-extutils-installpaths.mk                         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 199706044..4ad0a8e7d 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9a8d66aab1ffec98ea260faf03ac612b  ExtUtils-InstallPaths-0.012.tar.gz
-sha256  84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed  ExtUtils-InstallPaths-0.012.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  84d9af4ab9c2d5211681122bcc6e67a3  ExtUtils-InstallPaths-0.013.tar.gz
+sha256  65969d3ad8a3a2ea8ef5b4213ed5c2c83961bb5bd12f7ad35128f6bd5b684aa0  ExtUtils-InstallPaths-0.013.tar.gz
 
 # computed by scancpan
-sha256  b95d38ac031587625625d92fbd2ee1d5df0d02606057d680e7dcf3598fe629f9  LICENSE
+sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index e90e130c3..face0ed14 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.012
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.013
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
