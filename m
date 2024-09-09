Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE34ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3367880FBA;
	Mon,  9 Sep 2024 16:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwfTxar5kTkM; Mon,  9 Sep 2024 16:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0ADE81013
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0ADE81013;
	Mon,  9 Sep 2024 16:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153611BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCDD280CEE
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbpQhKR8EVdg for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B29EB80CA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29EB80CA9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B29EB80CA9
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so6809175e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899275; x=1726504075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYvoTq8m3g2S0kWifmPWq5BUsfYGP5QparT0D4nTvZE=;
 b=MJY72h1uyBL/WX+Yduc+5PhuBuD5xB2gITc7QJxcwcsHY+K2PTeqrgU4FN9SMjYPCq
 Eon88LZusW/iLppLZovZvDmYy2LjFl6ysDqD3eFtlYSMuWeIxjtqDYKQRA6Glz8C6E+Z
 tOKiXMuat7zxKkUD1CdzEIVaj6LwES9QDYdoGrQPzdzkUSfG1dKUqkqiiIoW2Sc2NnZq
 q6toRQCmhJFtI3EQZ272IZvfhoVWmF3PH+AByHlm50iuCdYkHqkZavHnC3iiqCLV1PEl
 SZo8jxGEiiBRZl4bB4NkgGyUTNU7bs/lnZLWQ0fafYJ2bjFyJeMgMyxcrt8brrqACifh
 MPHQ==
X-Gm-Message-State: AOJu0Yxg/ZxHlCID+59sDWWImhdqPkBSxP1c9UsXjouUUze2uKkvSuVj
 gGAtjdkbgD2pBlRsk92hasCN8qNMIW8X5pwAR1PWgl3Nwme5NaFMGTGTjpJ5gtpkY1Js8L9AEZ4
 S6A==
X-Google-Smtp-Source: AGHT+IFT1Hkob4cCcsb/Z9mgYAJ8VpQjLKH0qHGYQqG+CwIaaY/Pmxe+CY5lfHidDwdtPk/S57sFPw==
X-Received: by 2002:a05:600c:34ce:b0:42c:aeaa:6aff with SMTP id
 5b1f17b1804b1-42caeaa6c74mr64992445e9.10.1725899274572; 
 Mon, 09 Sep 2024 09:27:54 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:54 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:48 +0200
Message-ID: <20240909162703.3439481-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899275; x=1726504075; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYvoTq8m3g2S0kWifmPWq5BUsfYGP5QparT0D4nTvZE=;
 b=PDdA+nQBLkjXs6sR5qp374Q7Xqjb9INumq5KPqiniHdsV/Mwwv6QNx9EjUaiA7REzQ
 OKrji82U7t8mrFPlmL1akjv7w2zah2pTMMF8L8n2D9iMG4MmML3FU9cK2ks4QNaE/wpI
 hWKbx4T9SofyyPlHcwxkHcV3QrbjULLSK8WZqCH52WnrquTxk/0o63GQ1g6hXgxXWVIb
 x5etSbVNB52+I/T9rCBf8GTkfPKi/1eaRKvBbKR5WCubZq36Dh6v036uD6NBZuhFT5iE
 hndtaLRylf8pDgNETN+5xwqiVshdclvNAL+uiR84YB1eXg17ohk3tEj7C3joUSFhWIpf
 wbew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=PDdA+nQB
Subject: [Buildroot] [PATCH 06/20] package/perl-lwp-protocol-https: bump to
 version 6.14
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
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash | 4 ++--
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index aac0abe3a..658eb6234 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  62650d02150a157f486375ca588b6c9d  LWP-Protocol-https-6.12.tar.gz
-sha256  7dd36d3a4eacfa143a47a2bbbc56ea9413887e2d7376c1d35bbbb2be912b616c  LWP-Protocol-https-6.12.tar.gz
+md5  65401e3e34be653c9e3b31f798ed5454  LWP-Protocol-https-6.14.tar.gz
+sha256  59cdeabf26950d4f1bef70f096b0d77c5b1c5a7b5ad1b66d71b681ba279cbb2a  LWP-Protocol-https-6.14.tar.gz
 
 # computed by scancpan
 sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index a2048e25a..1b4482e16 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.12
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.14
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
