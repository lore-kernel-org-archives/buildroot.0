Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50F2ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2741280C96;
	Mon,  9 Sep 2024 16:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpPnQZVQf0nm; Mon,  9 Sep 2024 16:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B62280EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B62280EC8;
	Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26BFB1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2049580C9C
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNiCiIMmH0FJ for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFDEF80CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDEF80CA8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFDEF80CA8
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42cba0dc922so6799135e9.3
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899273; x=1726504073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUF1uREid+whfw1VCithXvbIWARFiKmgyI6EoJvMUSg=;
 b=sW6Jeq3AyPaIAS/paf/mMrD3XQAR/cyTPyVVNh4CkFWH6QfpnwyrdO3VoNRgUWALyD
 CE3r2UpajkWZzuC3ptr+W/xYzFU4VW6MmEEiMYpfYbi6x0X5OdEKxvihcZ+ooIRhE2vQ
 7nffa3p6LYTSOfQ8FPKm0n0lesFSacN3HEh5hsIgvonIulENm6B+OGhJACWPBHtKMjqN
 Z9My4gUaYl/2QJnKbwMfcfatWiaGA3WHSq1IsZaPkhcxw/FZyEKtYtHc2J9p4M+VwMxB
 CinDsmHCWAKzB0FMGtHl7XIV46jD3aQepNcZvreeb0DLNsOCfqLfnWyaIDzLSWsqV8iL
 UbZA==
X-Gm-Message-State: AOJu0YxisyVlnp96C8D7sJ6S1bB5qTwmE6MvTI8YWWKBG7u09z+8g2Qj
 TTrjSnJvmEXYgMpZb0+dg1RbDck/vhW7autk0rHDAfPeRWE/Iryl6/plBvz3uT64an/av+AQWVH
 MSw==
X-Google-Smtp-Source: AGHT+IGQfzEN8T3KeFmypVrk0890mkz5yA6ZK6gEeba4YR5Auo9glX/gTZ7og7olc91GI/hr0ouENg==
X-Received: by 2002:a05:600c:5104:b0:426:66e9:b844 with SMTP id
 5b1f17b1804b1-42cad746459mr57414375e9.8.1725899272495; 
 Mon, 09 Sep 2024 09:27:52 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:52 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:45 +0200
Message-ID: <20240909162703.3439481-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899273; x=1726504073; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUF1uREid+whfw1VCithXvbIWARFiKmgyI6EoJvMUSg=;
 b=px8CEEGcx9SkDGT7Nn3DfYqeZGcpmWvJj2c9Q3uIo5qvhvGh7yFNQz7Nzyk/6/ygCm
 Yhw/ITOOXfRsoafw266UrMOFZeJn58rT1gF6j6XEuRBpypEju55eA4AjxKExbkqtExlV
 lSXumY+1hr92cC8gzmGq82GdUeaabi9Pna6XcjHv3ZrqowR4DBTURwYeeX0TyggV4Y5R
 jOC3UT5vc4pynhHRjETV5bzgrwJ3M5KTmNzs5h/4MCpSRvElYSbcxZLcfr6ga+GHJNcQ
 w9tU5gYxnPeI7o5H8lNK8HfuunqogICrQp1NgEh04JHxxi3Pvi8XYhh9W5eOLFSiCK1h
 v8Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=px8CEEGc
Subject: [Buildroot] [PATCH 03/20] package/perl-date-manip: bump to version
 6.95
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
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index d055cb33c..53f7f6191 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  74f127ff4c71fa1aff54dc55818b0c2e  Date-Manip-6.94.tar.gz
-sha256  0278eb62113618c8977d3d537433d85340c487cbdfd95dd3452e4d7217f48848  Date-Manip-6.94.tar.gz
+md5  1dc65dbb042ecab09149a22fbbe9abb4  Date-Manip-6.95.tar.gz
+sha256  92383832311f22083f55d03c8dae8f4bcc387cd902624e5ef9ac680f144cbd4c  Date-Manip-6.95.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 55d9cff6e..dc55bcff2 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.94
+PERL_DATE_MANIP_VERSION = 6.95
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
