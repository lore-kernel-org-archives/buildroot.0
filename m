Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E98C5AD49
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 02:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AC2360A93;
	Sat,  7 Jun 2025 02:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkhqGYLaJXGD; Sat,  7 Jun 2025 02:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E07460D6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E07460D6B;
	Sat,  7 Jun 2025 02:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAEF8C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D2E40459
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyyR4a_xf5im for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 02:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5CE040578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5CE040578
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5CE040578
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:18:53 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-747abb3cd0bso2816648b3a.1
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 19:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749262733; x=1749867533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rh1V6/bgR3gtdIuUe5p5Ud4nXFD/spX0wiWRKwRm7BM=;
 b=bvls44N44/HaMJfSBEq0zOW4qS6rdj6o+a83Zc1qSK1FfcKl5p1lVjuItMWGHjDVCw
 aBS1FchgLxiKA7CpiREAKMIUzJuC3x24z13KYyFRLDtqrnLDLxvRcihwPstcXLNCX7PR
 cE8X7muOBVtsw0w/yjv2jWDJ9fbFN18N2kuKkTDKF/5Kw7lV0zK66PgKdSU5h9JcwClA
 166ulI8Tmf8gkcgfDV+zto82iVv79RqWN8yg4sY7+w+g79ESFF26CdOuOUcFXwFkIp+M
 Kvlou6KRxWHcPHxBmz9SOt/YDgwf30zZ9jappvyT5TDfSfyqAlHSZSqhy/D6yw2scz8U
 t6Rg==
X-Gm-Message-State: AOJu0YyxLmImFkjZ/penr+FfIdBhY4U4AeBbLOGgW7YuAXK3Ar2/Voai
 7zCtv//bDzxPFs6dNhUEyHxuNkugstT0RXBtIfc0U8ImMY50YJ+Rb6VI48dI4q38
X-Gm-Gg: ASbGncvl7me2kNcyMh6+jpYhMOmmWy/naydaCw1kXKQ887KNxJ4xvnvJ6sempKgQAZ3
 qfwgkMn/eww39tx1s70cxWecub4gk1yKJ5poQong/in+Y1W0ctdpq+xHK9a84/4fxcdmzf4kHFw
 vjZqzwNfp9x1d/VHbDcSKrHEyxaCFuHL6DwsPrrvuVzRLcRB5ea221XtjiOPkuE5itd5B4MnEeB
 yqIMmH7CJAwBzbXV7f98XF3ZDa4+QTOmbcHRgdKKAaORr+lNgPZujosuIyLDj2AHUjdm8FteqVi
 47so2qzmi2QRKw1G2fjNhvmUChdwpGb44VY6XA6qkmciftxgsi1MHSpfKbfqcraVzedyrH8E1gY
 z1xIkVBWPFa3OVq+r5ZRlxVWzRTr4NSYfwpqqG6ZvbfkIt6H+sypHRXwbjvo=
X-Google-Smtp-Source: AGHT+IEvIxuoOa7qnyVkuDhpLHAfd6Yh09ocqB9XVv3R96qvqXAFEIcz0D2K4IXG3sxrnWd7U8S6FA==
X-Received: by 2002:a05:6a20:a12c:b0:215:dacf:5746 with SMTP id
 adf61e73a8af0-21ee685e23amr7730829637.19.1749262732590; 
 Fri, 06 Jun 2025 19:18:52 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9c3csm1926271b3a.153.2025.06.06.19.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 19:18:52 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri,  6 Jun 2025 19:18:49 -0700
Message-Id: <20250607021849.37636-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749262733; x=1749867533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rh1V6/bgR3gtdIuUe5p5Ud4nXFD/spX0wiWRKwRm7BM=;
 b=jbKhvcHhuD0D4634A/w06ChfbxrSFzgm9KEo6aLNgYK/OXTFK+86gCJUnt4A/OPw5I
 uh8KjfEwSl6FSLbqXOI4ni9WNd/VvcU8MTr+UaBOCKqwdn9NTIJ3YInJTmxfwznPwbo6
 C27756iCa131JxRYVssirE2BbNkCN/aaNp77Qavvs3PcMMnV+ZdZzCG6cRfU+IKCE+gz
 AGmTceGoo9jt0iPmrk/6ugnWimVK5wncnWPv6CC0yuNxYmLdRGv3aCxcRrJ2i1VL/YUs
 MSNb6a5Iibp46Na4zvRtISrlizDe+MDIM1RYV2u98Af6WdKbK91Z358S2sEarzRzSdPH
 4VmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jbKhvcHh
Subject: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.29
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

Release notes:
https://github.com/libusb/libusb/releases/tag/v1.0.29

Changelog:
https://github.com/libusb/libusb/blob/v1.0.29/ChangeLog#L4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 3d51244b2c..4c76609930 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
+sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 3d809bfb6e..95ce8b17df 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
