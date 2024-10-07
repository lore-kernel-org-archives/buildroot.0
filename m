Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFF1CFB44F
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6313040263;
	Mon,  7 Oct 2024 16:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTyqScaFk9zF; Mon,  7 Oct 2024 16:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9D5402CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9D5402CD;
	Mon,  7 Oct 2024 16:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 900FD1BF414
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B3A4402CD
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 16:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giIj2sToXD60 for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 16:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12C0740263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12C0740263
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12C0740263
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 16:46:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37cd26c6dd1so4632491f8f.3
 for <buildroot@buildroot.org>; Mon, 07 Oct 2024 09:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728319583; x=1728924383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3jZdbVWgYSfdQ/d2/J1iJB5XC/PMCGFolcvDjM7k4i4=;
 b=itOS+ywVDw8Pz0PEc7DnbyR+Kl81Cr5kZIUYGwRedWTl9XUNqOYYil15Wl/Vsmuixm
 FteydbkHYjac5HrtQr6kIs4FVy39L1W3mgPenMi0/u3Cre1ds+srGwE1eP0bnapmMNOO
 3mvLjXt+7X3Z3QXo/uWfbBIrJEr2Feohviw0WnB2B7QtHz0lzEdMg7vxoYlE7YmG8D9c
 +4xAXuT77wyYqFdkQ0bGDWGwUtG/Q6XVH8uDmJG9MoBOFEb+wzCEdaHcKGv2dZGHcEqO
 GX9/dcdSpY7VusYObT5SBIJBNmjOE1mCWUTREwEi25TtUQaiyl6x9W2x7G6dbqVBznUt
 gulQ==
X-Gm-Message-State: AOJu0YyxZp94PD4TtMjotyVa3CJn1tx1sQOfd18U570FbA98KlF5kEH6
 AemGo/ky+aLqcKR8jA4ydzaIq306yuaQG/q+T3BUv+q7yPWgVEbH1zzXtIuqlxYQSBA1twlGtA+
 BwAY=
X-Google-Smtp-Source: AGHT+IGILLS8liJk7nQyCeXSgy/IDhbyHrt0djJe6JzjVG+vz3pkvcgpeVA5ZFyfTd1UIQFbT6ud5g==
X-Received: by 2002:a5d:69ca:0:b0:374:c3e4:d6b1 with SMTP id
 ffacd0b85a97d-37d0e8dafefmr10913682f8f.44.1728319583130; 
 Mon, 07 Oct 2024 09:46:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1691b505sm6088856f8f.43.2024.10.07.09.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 09:46:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 18:46:16 +0200
Message-ID: <20241007164616.373051-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728319583; x=1728924383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3jZdbVWgYSfdQ/d2/J1iJB5XC/PMCGFolcvDjM7k4i4=;
 b=XPZs6oYHXInTYj98gjKJcsRdoIsBGDH7PtgigQG/Ty3pbhBKpK0md1TDFoDcs0XmEO
 Pxd3RqCUvzALRLYoeGiXhsPWoGLTGdhwyvRuh3TuVCsv639OYtGQsqo+WZM6SaLlR4Xg
 r/hI0ByfpxzASjprNPOsV/iAUz4GMVJ+s81b0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XPZs6oYH
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.11
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Juha Rantanen <juha@codercoded.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/acsccid/news/2024/03/acsccid-1111-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 5310d78144a9..e5fe669ceb3f 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.10/
-sha1  6284a693b8edb511f2f80d9069af9b4a41fd55ae  acsccid-1.1.10.tar.bz2
-md5  4d2b7f34414aed029084c96dd05a0e7d  acsccid-1.1.10.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.11/
+sha1  75d3d17fb9d9ee7d0b291b460e2c6eb3c71654c5  acsccid-1.1.11.tar.bz2
+md5  0bbbce89a934861b7c5b003da962f1d9  acsccid-1.1.11.tar.bz2
 # Locally computed
-sha256  5ee112febdcac6656629025f3a85923f155f6ca150b2d24fd716f9043265528e  acsccid-1.1.10.tar.bz2
+sha256  2fcda6ed1f5d2f07e202b51f9a600a61c83e1a73a96f51ed0f9e4f781c9c1282  acsccid-1.1.11.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 463f0f24d6c1..93cca8e09d0a 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.10
+ACSCCID_VERSION = 1.1.11
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
