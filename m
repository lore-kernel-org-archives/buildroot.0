Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB3ECE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 880D94023D;
	Sat, 23 Sep 2023 07:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 880D94023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXGnoHr93s5n; Sat, 23 Sep 2023 07:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B409C41AA0;
	Sat, 23 Sep 2023 07:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B409C41AA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 087171BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7991282145
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7991282145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJOx5tb0WkuT for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:56 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75DF5820F1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DF5820F1
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32008b5e2d2so2392839f8f.0
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453714; x=1696058514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqnCEj0/W9pZrmdNh4ffI8ppHy2+WizhAMEa82oljk0=;
 b=D4pDqMY9ehHOzrnHqALEvt3c8ZnOyzSCRacbZWzbXqRObc4mmt7cEaVuDLRyr2apZL
 HjZkbTQc4HTgC1Unz2S5JjpQ/yTiaQvqaeMZrhQxxjTAMuR9bOFJl+DQWnVUz2odwF/w
 oR9ZxgW0b4kFSHB6FmgD0aC5XjhoEvH1niX1xiTWrQGiPq4joH/N/YVHd9W2se1UGYAU
 /1D64yg3GxakFKlq7Aih+Kfr/yebXb9S4SMOVYVCqa16l95tHrylQeFfdusdN64zd22C
 hPN2nrrUQd/aasadlDx2RGytNDIYCUwCPexecP637wvbYoaEhlrAJs70fXnPh+V8es+3
 UfIA==
X-Gm-Message-State: AOJu0YzQe5vRHceW+YuZW7zx+PlLEtQ37ZYkZJeWY1SxYy9A2YF5iSLp
 pmCqijvHZ6xPEVinhuJRzV4efLDdqNs=
X-Google-Smtp-Source: AGHT+IHUG6io6L7s9k+PTmWb2Z1SbscM5S5TceIM2JtB9UyT6917RiH6aH5uCdAOsAU3ZLr7gSwPHQ==
X-Received: by 2002:adf:fe4d:0:b0:319:789f:fcda with SMTP id
 m13-20020adffe4d000000b00319789ffcdamr3768419wrs.9.1695453714540; 
 Sat, 23 Sep 2023 00:21:54 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:30 +0200
Message-Id: <20230923072133.3122644-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453714; x=1696058514; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqnCEj0/W9pZrmdNh4ffI8ppHy2+WizhAMEa82oljk0=;
 b=G2cjRxLFJ3rd27HE7rw3lkKin3fFisNt1zQRefp5ssuomMeOr+/zzXgScu6zgA6JqI
 LB4tBy1WfyJwQmn/QCrrGcjIc3WfctnjZP2nniLGiMZURwI6qQcveuaKbxKA3B+SGcVW
 QEwv8PpPgKbSISgP6zIiger1F4Q55R7df21dj/E50lkjMPL7qDU88K1rqLR8M4isybDK
 UYOFpJHh+eTe9FJgoIzFBYkg89RzzgU4wj4pdLoWxAvVSyGjlkPOIEevM/ovUSv2yviJ
 1CaWdnHJI0OYs7asmhjP71fadrAiLr88oCuh+S04MGIjjTlspdhQ4KpXaw7ZcrN6K5MK
 rOeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G2cjRxLF
Subject: [Buildroot] [PATCH v2 09/12] package/perl-plack: bump to version
 1.0050
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/MIYAGAWA/Plack-1.0050/diff/MIYAGAWA/Plack-1.0048#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-plack/perl-plack.hash | 8 ++++----
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index c763d2c17..84d65ec52 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  36282b473b4521219c44a9db437b650f  Plack-1.0048.tar.gz
-sha256  30f5f25e19b437859156a2526f61ca9ab708d50d5730c279189403aabfe542a6  Plack-1.0048.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0856a900a981769e3d79f0a10ccc3e65  Plack-1.0050.tar.gz
+sha256  d2651ade82ebbff7abe0a3a189fc932dadc4779186ce89468e56d0189eaa6ed4  Plack-1.0050.tar.gz
 
 # computed by scancpan
-sha256  fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d  LICENSE
+sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index b95f204d2..c39c3d8fd 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0048
+PERL_PLACK_VERSION = 1.0050
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
