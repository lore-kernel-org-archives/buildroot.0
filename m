Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF285E69E90
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17365483A9;
	Mon,  2 Dec 2024 20:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkoHGgVkt9au; Mon,  2 Dec 2024 20:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 326EB42DC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326EB42DC0;
	Mon,  2 Dec 2024 20:12:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9244C60
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 20:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E89642CFC
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 20:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAuGIeRa3VOn for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 20:11:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94B7F40D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B7F40D57
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94B7F40D57
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 20:11:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso40211015e9.2
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 12:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733170281; x=1733775081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMrmrgM7nZxcKmh8qhhQEmWzwRNrxDwpz83WDJNdALg=;
 b=X8yPpd71rek0jKQXF+jB1VhbnvrI6ZkWe+SusGg2FLRp9TJZW0C56MgZza7/qIpq6b
 WavebmiDZcx/7vVnWibXRf1f/IEjPGJpvpbrUcHQhJHI0kLbjbLHk+Rg2mp2ZdDld+3W
 kArQLc/FJ8/sTiweu2aC515JpR3/pMYqrUKTOIykgFHb/AuxUw2Qb/UG6xd0Caeh4LjG
 akvwo/5VJWgiumRS9MEOm+DlQR3Eh2aMUE9rfYiGodGeOeC98zZWKEFC+hnurAZ68Ey4
 70c3/MiTcrE5FkFtnf7MGW/Q9gRqDB6/evPSbm6vb6UtemrI23dO8dx4Zhfngp71oZ0o
 qy+Q==
X-Gm-Message-State: AOJu0YwiA08F59CtFmDuQbNOy6eq2Suj1G2VgTBGCNYpSDWeJmbzN3bJ
 W6XIIHN8zGx9NuzXxHYt2J/ZxFJnn8ZX+BmdKm9NmlNKQ+mX8JRMszDpUw==
X-Gm-Gg: ASbGncui+Ww/5mFuCSJzjhMhiypgWDxwdFJsD3rvARWvj3GdJYt9RuJExvSh6xoiW1K
 A0EIN9NFx3zK705LSyz5O9cXyDnpzOO4PGW2xRx3pL4GZNpKhSWvv7YLH/q3UGgpcG/lL9u/jTJ
 PhXHaVbkc5w0vcPkaAJMnwTX8P1dD+S7MvxlACg66P7yHCZvZN5kpJ9rphlBFYFcw1TiCmfSjdd
 Q9rxZdQ++qT5Cx5k4etdnN3aOIwEAtQyWqMJFG1VPwTvfI60ExsRm+2uB+T
X-Google-Smtp-Source: AGHT+IFj5yUSlo7+lPuXJZaZ42LE2A5A+g1vrybtY0De7vC0F3REfXD0LaAY2tySJHfmhKQLPr/Uxw==
X-Received: by 2002:a5d:584a:0:b0:385:f349:fffb with SMTP id
 ffacd0b85a97d-385f34a0350mr3786018f8f.45.1733170281288; 
 Mon, 02 Dec 2024 12:11:21 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:83a9:e0fd:29e0:1917])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dea1e4ebsm11132796f8f.1.2024.12.02.12.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 12:11:20 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2024 21:11:20 +0100
Message-ID: <20241202201120.3298217-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733170281; x=1733775081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iMrmrgM7nZxcKmh8qhhQEmWzwRNrxDwpz83WDJNdALg=;
 b=EOgkAFIw5ZTSndIkNR/S0eSpLQPX4OvZ5FBVz1mKfIyB2o+aLUlaGHnnjOY2T6rOKC
 TwCTjCuE43eVMULycJ5YCCEEiXT/X40JZWCZhbKf7wSyFKvIWjpt5SqejxMPufjIhVqt
 iW3G4V+9sk/qoIbK5qAPVq4kfi+dvOIskHHa86Ye95rGAhb0r93KyfYH7enC/49b97D+
 dObmOmlrh+wWldmUTMDoiwgMDQQMBnkZm8uR1wHyI69EvvFnD6C7RIFIds5/eFWTWNfe
 XIRjGwKMbsCaFDIIj5ku/RdNkHaHrDIvRsRoMAXVi6mfEdNjj3h8+J+NdDjjQ1l4wSxU
 QwLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EOgkAFIw
Subject: [Buildroot] [PATCH] DEVELOPPERS: drop Yann's entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As it happens, I am unable to keep maintaining those entries, and it is
misleading to others about whether they should Cc me on their changes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: this obviously only refers to those entries I maintained in my own
spare time, and has no impact on those my @work alter-ego maintains.
---
 DEVELOPERS | 48 ------------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d75df5cc55..a369756f3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3370,54 +3370,6 @@ F:	package/casync/
 F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
-N:	Yann E. MORIN <yann.morin.1998@free.fr>
-F:	fs/squashfs/
-F:	package/asterisk/
-F:	package/cegui/
-F:	package/dahdi-linux/
-F:	package/dahdi-tools/
-F:	package/dbus-broker/
-F:	package/dtc/
-F:	package/dtv-scan-tables/
-F:	package/freerdp/
-F:	package/keyutils/
-F:	package/libbsd/
-F:	package/libedit/
-F:	package/libgsm/
-F:	package/libiberty/
-F:	package/libinput/
-F:	package/libiscsi/
-F:	package/libpri/
-F:	package/libseccomp/
-F:	package/libss7/
-F:	package/linux-firmware/
-F:	package/linux-tools/
-F:	package/matchbox*
-F:	package/mesa3d-headers/
-F:	package/nbd/
-F:	package/nut/
-F:	package/nvidia-driver/
-F:	package/python-pyparsing/
-F:	package/pkg-download.mk
-F:	package/pkg-waf.mk
-F:	package/slirp/
-F:	package/snappy/
-F:	package/spice/
-F:	package/spice-protocol/
-F:	package/systemd/
-F:	package/systemd-bootchart/
-F:	package/tmux/
-F:	package/tvheadend/
-F:	package/usbredir/
-F:	package/vde2/
-F:	package/w_scan/
-F:	package/wayland/
-F:	package/weston/
-F:	package/wtfutil/
-F:	package/zisofs-tools/
-F:	support/download/
-F:	support/testing/tests/graphics_base.py
-
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
