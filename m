Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0ACC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 791F3409DE;
	Sun, 16 Oct 2022 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 791F3409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Syf5YGz6JNS8; Sun, 16 Oct 2022 21:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE7EB409D9;
	Sun, 16 Oct 2022 21:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE7EB409D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67C811BF25F
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FDE7815CD
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDE7815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8TfRa1s7rLW for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 21:27:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26FA6813F5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26FA6813F5
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 21:27:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bp11so15658582wrb.9
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5B0xG0zqvD0jaaDDydWv6mC89Byfjio67rBzxeRIRW8=;
 b=yHeCM7uilMcxoBxOYU9XTYiHiGiB9xOdYg64PK7m6yLD2PQrQvC5pA1uJPtbzVYdS+
 dN85UG4e5Vzex9WUL0+OlwYE/bwwJDcFYr4usgZfkwRxc5f7nj8E2t9bQCpepr/+lIAr
 W4dX1pcFX/Gd3KmClx0ByxOMn9sY2DGa4ySpLQIgXeKag/DbeEff3/n1E/vXL1qOSRCR
 Lh/Ww7WrX2UojrA8H5uupwPgMZZCOG1yDY3sYNRXYTzlhDzKp9TuADKmvDu7iOFxkBds
 wCY46Gs7SFLh999G3+BySnaqYxuxVnmItRdF8bTstLksL8A4FpIqcSA/BOEBRkP8pnd+
 ATew==
X-Gm-Message-State: ACrzQf3mcXENm8p8Lx5BU8dn4Lv9CcRhNJ3mjtAOStJrMvuirs4VwMf1
 fIxrYHptXElXbgGpI/edhcLO2okzy8s=
X-Google-Smtp-Source: AMsMyM4DGLC+5ysAM/wnkwxF2r9CjhlR6QVv7S4glw5WL1CmgHSGUWSzIr0CrUrDuSsJdSEbyv2K3A==
X-Received: by 2002:a5d:410c:0:b0:22e:632a:9bc0 with SMTP id
 l12-20020a5d410c000000b0022e632a9bc0mr4593547wrp.696.1665955667865; 
 Sun, 16 Oct 2022 14:27:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 y3-20020a7bcd83000000b003b492753826sm8127234wmj.43.2022.10.16.14.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 14:27:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 23:27:44 +0200
Message-Id: <20221016212744.315519-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5B0xG0zqvD0jaaDDydWv6mC89Byfjio67rBzxeRIRW8=;
 b=IWTkO8RulXhvulfPTWfCN8mWF+9QETHwnQZTttZJ9a7Nbe9nmB0shEexgnPvlcz8iE
 r+szkp+WvWJUfGBzgii82JIOdtAFfDWfaB4b+kiDKVs8Naaxrq/GEaAhh8A6Tbg1U5Uu
 Y09hyX9Y11QxkW8ulG8ZzdsOBrmo6ASOs4hRkuLsLx06kfUNS8+Bs5LKSG3RrT4YISUn
 29u1NCA4ikWR7VtsmShsYpJEVEQTyB6IzBrmoUFk7G11IBKD1PNZi/HMS3x4eQBNCtDH
 5w9I96z9XMJDEDrt9oXTS2o0iucavIOZBOvY4fvtidTzNoGU5H/z9aKbLy1/KcbBbbEk
 9ORQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IWTkO8Ru
Subject: [Buildroot] [PATCH 1/1] package/libgee: bump to version 0.20.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgee/libgee.hash | 4 ++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 54a46f954c..ea723481e4 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.5.sha256sum
-sha256  31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518  libgee-0.20.5.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.6.sha256sum
+sha256  1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d  libgee-0.20.6.tar.xz
 
 # Hash for license file:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 7d8d3d4863..5ce56a2b3b 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).5
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).6
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
