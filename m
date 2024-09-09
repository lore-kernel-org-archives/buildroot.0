Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3338ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92EF3810E1;
	Mon,  9 Sep 2024 16:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDwf3zMXFi4O; Mon,  9 Sep 2024 16:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ADF5810F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADF5810F4;
	Mon,  9 Sep 2024 16:28:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14C331BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF2E980EAC
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2k9dV0TPC7z for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C331680EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C331680EC2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C331680EC2
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cae4eb026so22016735e9.0
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899281; x=1726504081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BKQFUi21v6AQf9s4PEnEsRs+STanLkqPrb51Dr5Tyos=;
 b=Mxn7yLzxuwKgMrborLKwOu4F4u1R//bPV0TAGwhcqNWm3PuidjJoxr87KnvR0OlU5u
 TnSQAw6QVgIlLEuZlWYI4zFNhk4hf5EJtoIudwinEi+XgAsuuLT8SCOV8FYoivYUT8al
 MbDtlmZs11SDf8iGtWGgqlvLlUgqHShOpWFcHkDqtf1KtnjO+m5HeVXCIPc7gcZxmnAM
 1Qmb3hf0t3BsPBFL+nOmg4AFR9a6757SxQmxVtz2ZYw3FHEV6JhAVGygotMqk4JeETAq
 +ek1xnH6F3XGWEJaLHsD6AHhTUoIFkKEEVMc6Jr7W+fOvaYTaMUNifMp8ObIc5ZNFMdt
 fBxA==
X-Gm-Message-State: AOJu0Yy3yTK9fVR0/N3xV0pp3x7P6bQE9LMr2L9dnec41Vy/IipZRPq5
 IlhS28GxsQzrW/mx6ID44Ce+B8n4H/mOh6X5IeEzDtDdFqIX+VH+tmN7STR9zw1p222MTWepxjZ
 O5w==
X-Google-Smtp-Source: AGHT+IH85OcP4habDtEASyhTQxXP8+dAw9J3e666btWYW0eLvo9Oxq3xDuGlIMHLPwXJAKGL1BxhiQ==
X-Received: by 2002:a05:600c:5102:b0:42c:bbd5:af60 with SMTP id
 5b1f17b1804b1-42cbbd5b298mr12452745e9.24.1725899280495; 
 Mon, 09 Sep 2024 09:28:00 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:00 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:57 +0200
Message-ID: <20240909162703.3439481-15-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899281; x=1726504081; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BKQFUi21v6AQf9s4PEnEsRs+STanLkqPrb51Dr5Tyos=;
 b=WDG3hnL7+Wg/blnlCEGHQ2TU2xyJo6IzoIKVORmK2X6fmuzB72NoSN6kZegUQCK4VE
 QBDk6JVVbVNFNvLOTO8fRmOSW/TdEQi7dFjKLkrQf8PZflqBDWuaPlyBICrUH4DG1NcL
 Wg74xJ6vx9/AthFKu7y7mHghDEqpC0PhP0Y34h6LVtMz3gnD+MATD5UcHuWnxaWTyzzU
 QjMEg32uExV+inbwVRuyLqYi1kTd07zIAhwM3dFKPaWydiNuoH8erPZpzG2Sz7BYkzJY
 z7bfbCul93xeRxGTijG8KGvzWGDA0+DiDxNK9gAiRof10+Zw/nk0faHsC5TaACfJV1/O
 EIdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=WDG3hnL7
Subject: [Buildroot] [PATCH 15/20] package/perl-extutils-helpers: bump to
 version 0.028
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
    see https://metacpan.org/release/LEONT/ExtUtils-Helpers-0.028/diff/LEONT/ExtUtils-Helpers-0.026#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-extutils-helpers/perl-extutils-helpers.hash | 8 ++++----
 package/perl-extutils-helpers/perl-extutils-helpers.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.hash b/package/perl-extutils-helpers/perl-extutils-helpers.hash
index 3f80a96e6..15c81df01 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.hash
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  83b00c1e401321c425ae5db6b2b2fd12  ExtUtils-Helpers-0.026.tar.gz
-sha256  de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416  ExtUtils-Helpers-0.026.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0687f20ac896a7d01219646908ccdf89  ExtUtils-Helpers-0.028.tar.gz
+sha256  c8574875cce073e7dc5345a7b06d502e52044d68894f9160203fcaab379514fe  ExtUtils-Helpers-0.028.tar.gz
 
 # computed by scancpan
-sha256  e5530d0ebc8662df3a970644d867faf12760b1a95ca6e2bf1c5f9af410a418e0  LICENSE
+sha256  7de2a12de1b294281e50d260e6532d656473ad3e1be6bd4ef76ef7b4c21a898a  LICENSE
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.mk b/package/perl-extutils-helpers/perl-extutils-helpers.mk
index d3b14d88c..2ac9ceec0 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.mk
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_HELPERS_VERSION = 0.026
+PERL_EXTUTILS_HELPERS_VERSION = 0.028
 PERL_EXTUTILS_HELPERS_SOURCE = ExtUtils-Helpers-$(PERL_EXTUTILS_HELPERS_VERSION).tar.gz
 PERL_EXTUTILS_HELPERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_HELPERS_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
