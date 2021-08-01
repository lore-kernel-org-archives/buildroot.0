Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34584C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BA260F70
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6BA260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6F740328;
	Sun,  1 Aug 2021 22:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzGYcaDg6thP; Sun,  1 Aug 2021 22:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1324F4030F;
	Sun,  1 Aug 2021 22:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67C491BF20B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5593040156
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YO80JwsEOhRx for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DAD440146
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:59:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n19so18340028ioz.0
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyecG9zy0kJz9R1aOwmc8kI0B3dDzfWHRSKwiTUNkJE=;
 b=rdiAUrxNhkWP+69BiacGD5sSUp/qtabdYXNkxWi2y9xZ1NOvoFmd5ByB8eE77l6Iv6
 I5FWyndvb9mqf0iRsjpEO+a5tpeRFx8VJUz3CXzQ3F0Y4ESX9euxHJAJ1wGg7UMFXZMA
 2IHqqP/sRsl1DUqnuRtajZbInkum53fJGZoPuHf7xDdb2lan3c9cgYReukSxoceRdCoh
 wy8jTOCIvlUlsszpG5Jzz8/qd18372N4tRIJ9KhruHFn5KlF8P7auvRWJuxzOqKhDu8V
 MBTRdlwrQ75zXTUMqD1O1rtbRzNVnC2z40DaShVef/USARmHzTQyO2bDMjjacYd3zQYG
 Dc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyecG9zy0kJz9R1aOwmc8kI0B3dDzfWHRSKwiTUNkJE=;
 b=RTmVhddpWEP4ebrCUgODn7Mgp7I9jgQ6ZQ2B2zQD4oGLbo6ehfCJihEVJIAOyb2uW0
 W4vcyJXt7hsj3PE8eLd+cyTpVSqFZP1Rx3Yz+Oqy39YISLTfItp8dXgaQSIsdMMOK2eX
 h6H3Vc0VKjf+4BXtjLlqC0sVyXxnCJkVJDCgrJ8+pfn0iRGGCrl0nzGL/sLIQT9syQWq
 YlIJberUot6pzqLPjVAXBLJBVeO9VArsJyqPq7DMprEUqDru4fSKK5vrDecPDv4ZDmX/
 Q1juETCIYn4R71Mk6rmL8PBLDDaHtHO3oDfep1yRzrB1k6wdub68oR0NaN/6GqZAXiiL
 nE1w==
X-Gm-Message-State: AOAM533m4fWPJ4XxxuuZV7Bxia7Ze17cTWgRcIgreYVNuGBNezlhrfJL
 WCQSdNrDopkiYNdSrf1+aO+9S0W1PfU=
X-Google-Smtp-Source: ABdhPJysTH55LxCrSjslv7HReA/E/SZGF1Sps2LOCQjZbeWUDQ2EYpMajGjfbRiqEBAECfg7KKHKuQ==
X-Received: by 2002:a05:6638:2656:: with SMTP id
 n22mr11854938jat.64.1627858773169; 
 Sun, 01 Aug 2021 15:59:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id g22sm5834147ion.10.2021.08.01.15.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:59:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 16:59:28 -0600
Message-Id: <20210801225928.2486201-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801225928.2486201-1-james.hilliard1@gmail.com>
References: <20210801225928.2486201-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ripgrep: add workaround for cargo
 bug #3349
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

To fix this bug we have to use an undocumented test variable to enable
the nightly target-applies-to-host feature so that the target linker
doesn't get used for host binaries like the build-script.

Fixes:
error: failed to run custom build command for `ripgrep v0.8.1 (/home/buildroot/buildroot/output/build/ripgrep-0.8.1)`

Caused by:
  process didn't exit successfully: `/home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build` (exit status: 1)
  --- stderr
  /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build)

Details:
https://github.com/rust-lang/cargo/issues/3349
https://github.com/rust-lang/cargo/pull/9322

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ripgrep/ripgrep.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 2cc578383d..450bb020e3 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -11,11 +11,14 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
 RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
+	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_TARGET_APPLIES_TO_HOST="false"
 
 RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
 
 RIPGREP_CARGO_OPTS = \
+	-Z target-applies-to-host \
 	--target=$(RUSTC_TARGET_NAME) \
 	--manifest-path=$(@D)/Cargo.toml
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
