Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E127C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 07:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C6460FF2
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 07:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C6460FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F321240439;
	Mon, 13 Sep 2021 07:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyvhBBgeq2n0; Mon, 13 Sep 2021 07:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DA440412;
	Mon, 13 Sep 2021 07:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64A1D1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 07:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53FA1400E8
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 07:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LisDfLtJPrgE for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 07:29:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6738F40025
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 07:29:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id o20so8227165ejd.7
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HlOGnwb8xL3NfWl7Kw4G6Or3NrOXNnze4ylFuf1v1pE=;
 b=YjNxsYonPa8f2+x9hCgGYYV1QZ+cZXt/Omv1w7Bnibq8TRMBH1q0sCloQJP68Mrxo/
 pRu7q1WT9b6ENVW27cXGu9FQjK0vdFEkxUd05TrE+n0e+9Npi1dbRnYMR8HkABjYnCgD
 dIM9hyGQfBsyy5Gb/GO9DZ/sb3pYM8Fe8OzS5M2mzqTw0/lFXOiLL+zVvyW5WTI/ZDk5
 30mYPAE19SoQ95EvzMiIpDGBQXpi7m8rGRQzHr+0tyEgoMm62fgQV6kHeajluiHXNMmM
 7T0uRn9EvBxFZnpXRi+zJb5tKG2DsiRyD4ZWPMAJnyazRUd9cpPtYM6h5JrLn/Zmm3Vt
 MuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HlOGnwb8xL3NfWl7Kw4G6Or3NrOXNnze4ylFuf1v1pE=;
 b=VXdf1PbNtG6C3niGYw1tebMnP6335X9qpVj5e1a9yh1j3ZM/q7cS98O7LVCmroOZV2
 5oUrNkp0ubQbM+fsov7oIbj1rc2sIJ4woOys+qlcMYDXmsS9QUMCjzT02pcpJCT1Y3jw
 gGx5J7C+b56O9/69H3rstGwZiCEU8KdeUemPswWpEXKdRhsGyi4m02Th3xZ+dfExS8LA
 5QmUyG5+fIkuu8RnRejuVs8Pi3qOSKMGV57EYryM7wiJdGWIh1Oci+jH+5m3def9KAqB
 3K/tWKOfvlCrLyVlZy7lLLlVfctUniQYO13Uzo4Q0PyBN3uTkcCcGcld5OcXkV9r0H/+
 1f4w==
X-Gm-Message-State: AOAM531rNG0Ts2+bpyXFMqgoTk8m3ZnORsxcFAMrmG/3XyqHzHeYgwZd
 ymO8LGnYo9GBbAp/DnVay8KKFhXYKKHHuRtx
X-Google-Smtp-Source: ABdhPJwoUyT/nV56e7hJowXnrr9xcaPtRDjd28iFbxqgzjqjP/ztgCLB1sLpVlrBxK+koENxyU/GGQ==
X-Received: by 2002:a17:906:3f95:: with SMTP id
 b21mr10817917ejj.368.1631518191663; 
 Mon, 13 Sep 2021 00:29:51 -0700 (PDT)
Received: from localhost (ptr-5gw9txf6g5tndjqqqz.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:1b15:18e4:57d1:eb])
 by smtp.gmail.com with ESMTPSA id gl2sm2992025ejb.110.2021.09.13.00.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:29:51 -0700 (PDT)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 09:29:42 +0200
Message-Id: <20210913072942.30109-2-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913072942.30109-1-patrickdepinguin@gmail.com>
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] toolchain/helpers.mk: gdbinit: set
 auto-load-safe-path before sysroot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The gdbinit supplied by Buildroot does two things:
A. specify the sysroot where gdb can find shared libraries
B. mark the sysroot as a 'safe path' for its auto-load feature, to make sure
  that pretty printers for libstdc++.so are added automatically (see commit
  6fb3216a80c64c08375429d89497eaeec5622150)

When debugging a core file, and the gdbinit file is specified via '-x'
rather than '-ix', then the order of these settings matters: If you first
set the sysroot, then gdb will immediately start finding the shared
libraries it needs for the core file, detect libstdc++ and its associated
libstdc++-gdb.py file, then give a big warning about safe paths:

  warning: File ".../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py"
          auto-loading has been declined by your `auto-load safe-path' set
          to "$debugdir:$datadir/auto-load".
  To enable execution of this file add
          add-auto-load-safe-path .../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py
  line to your configuration file "/home/me/.gdbinit".
  To completely disable this security protection add
          set auto-load safe-path /
  line to your configuration file "/home/me/.gdbinit".
  For more information about this security protection see the
  "Auto-loading safe path" section in the GDB manual.  E.g., run from the shell:
          info "(gdb)Auto-loading safe path"

and the pretty printing code is not loaded. This is because the second
line from the gdbinit file was not yet parsed at this point.

By changing the order (first configuring the safe path, then setting the
sysroot), this issue does not appear and everything is as expected.

Note that when '-ix' were used instead of '-x' to pass the gdbinit file to
gdb, then the order would not matter, because the entire gdbinit file would
be parsed before considering the core file.
However, even though the Buildroot manual now suggests '-ix', users may not
have noticed this change and continue to use '-x'.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1dfb52ac38..ef8e9a5f64 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -481,8 +481,8 @@ check_toolchain_ssp = \
 #
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
-	echo "add-auto-load-safe-path $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	echo "add-auto-load-safe-path $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
+	echo "set sysroot $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
 
 # Given a path, determine the relative prefix (../) needed to return to the
 # root level. Note that the last component is treated as a file component; use a
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
