Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6196BFF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 11:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B1284FA4;
	Mon, 27 Apr 2026 11:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYialc89L7-X; Mon, 27 Apr 2026 11:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC8284F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777287643;
	bh=KbHHBDu5TE0oXEea9h5qhelhE/Df06azM/8IisEpaj8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lrfFc89HUDVN9D4TIV5BxmRDTshDILFqOVdyTp3I27ukSfVS3sbRGFsNY0LlzgPmR
	 OGida9yPfI0+qPNtjKvpP3bO9lV3kaKaz/akSq8OCcwbp2nwSv3LkXxHdQ6rYhQ0Jn
	 bUGVu9yvwO82TWFeApjNsGZU74LqEr+d7fLCtlUQNHLENcdowb473uKzHq3h5fYMm6
	 aR4IeciZ4mm0zpDtn6QnKDRWfs1DyKNSJ4gvpRAz0lWD9JSM7Md4tMERFlhw/Z3PRJ
	 Tt3nNtqA2Plzv5rBkHybEfQw7a/8SI8hQWuYahD8Bdg/9+XdZs/1IkCzJ8KJwVfNLx
	 F0G6T82XSfG+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC8284F72;
	Mon, 27 Apr 2026 11:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 558AD1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5376F84F53
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFzeKzK4rUKg for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 11:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A47084F72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A47084F72
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A47084F72
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 11:00:40 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6720c7968e4so8031296a12.0
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 04:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777287638; x=1777892438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7vp3Cef/wnpK0blT1SPQ6m1LUjHo+AkEa50k3LEqQU=;
 b=O+pMBWcxoBjMyIdc9FacfFk+mRz3iTqHiO6m6bkjuZYwQ/Q9ZuuQWPtGmOkbr45vGU
 W9FBM8oTF9T8xGPBA63HIQr+pMObEDX93luemL9bXqam/EhTVW88NVJJaMb9nftlldjg
 3Sb+ePzMs25WkUFBSvDok/ttICOrs5x2FEBrCXrChiV10iTHvxxkrGy+pu7sRgn5jj0q
 hsF1UypzJy5mu69A5ju6poVtyiSS6JFUjbMt4PNcHHUL9+2dAmfqCZ8ktDrdxtHIA4Xi
 QOI94f3TYeIJExwq7PffGI9w3P2fqv9bBo4PiMcY49ifBV8XCU8nm4gveoCv8M2QPaox
 wzaA==
X-Gm-Message-State: AOJu0YzxURtVqUt7DBOnFecnyiAVNXPkHWMZwerFpn/oRLqmmAzVUR1j
 0zBey6J9fIYscD0Vmvu7jWPHZO6i7mRLJ6N02imGCqULFPjtrXAMwL9Diptgj+HdG2BpF8u1W3E
 sHimRzDGBWlg=
X-Gm-Gg: AeBDievqRxwM99Pnx4FvGF+08Gmo5Sr5W/Ao/ORxPswMbTvDrg+UPKdNt9NF9fTKpqE
 fb+ni4+8zBofwabGfCUgg0+eBdpNvD6WZcfvGeayvmW22rLaa0I3lflRqPlwteiw5eDXRT0qVMD
 cfOvVHQTvRvJpjR0p3/wZ+I1NRmzaQpiWTN8V7BtS/LIaLRtCJC+KoojrxO08driCpzomZdE9dO
 Ic6foZOyb+MpUWlSA6Dw/eCcdUNUCwlEdprOFXzfmxr5XQZ2ZebMe7g16O1AxudhykEHc+DSrjq
 r9rT1P1FORiqEfYDpZmjgQ/1b/eX10THnkJSMFvTblNhDKksg3gmULNcSByV8UjKqqPVER302Se
 DJyHlK98zlInxNvnzIwNdSc/nNeXptvkvSdGK6v4Tr8QA8o5i03z5kkVNjpc4dQY2Hbxl1ctBL4
 7HRUR5flL8WeCAg3gvX4N1kh/6uPjIRuyFjzNjay7II11MCTq+mhAB/49h+MpChgWST1LWUgY=
X-Received: by 2002:a05:6402:5384:b0:678:8f3e:2bb3 with SMTP id
 4fb4d7f45d1cf-6788f3e2f29mr6086128a12.12.1777287633898; 
 Mon, 27 Apr 2026 04:00:33 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-678974e23adsm3016276a12.13.2026.04.27.04.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 04:00:33 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 27 Apr 2026 13:00:29 +0200
Message-ID: <20260427110029.71280-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777287638; x=1777892438; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M7vp3Cef/wnpK0blT1SPQ6m1LUjHo+AkEa50k3LEqQU=;
 b=BTONySEFxkHQbuw3rhK1KHiAbj3WNx4sDoJ48BB/3lDJebYBJHG4q7IaZw0m/t1v3p
 ZY3iqqT0Ao6181cpCU9rmllBjrRJUKBNKYAFnwvgN6nhnVgRD4iO8AeY2omlvlpbxqz/
 5l3xjVnFm63xJPXSSkiBs91Yn+tC9Rz4psk/4iZocRReXYsl7GbDW6FJsUDERQ/K9pAM
 ykXXo6DngbG+eMe8RtNgZap8g2p/k2eeBw32G3ERtg7DSkPknAAKHQHStOZUxIqzBlwc
 O2uXr5JSFQ3/9L090d6FM1rtvEJOFeHlXZINmjep9aqosVqkTXQYm0D0wTMB3aF/hNZl
 mqAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=BTONySEF
Subject: [Buildroot] [PATCH] package/nano: bump to version 9.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.nano-editor.org/dist/v9/ChangeLog
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 5d369a514..62692d81c 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.7.1.tar.xz.asc
+# https://www.nano-editor.org/dist/v9/nano-9.0.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf  nano-8.7.1.tar.xz
+sha256  9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde  nano-9.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0e2b0af57..a3e019d5e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).7.1
+NANO_VERSION_MAJOR = 9
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
