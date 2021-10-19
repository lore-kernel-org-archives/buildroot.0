Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB6BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:30:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C76561354
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C76561354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FD260A65;
	Tue, 19 Oct 2021 17:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp1mf0UcbveA; Tue, 19 Oct 2021 17:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0B160A44;
	Tue, 19 Oct 2021 17:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C770C1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F2483C4C
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7vm3PjfyvIH for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:30:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDE683C49
 for <buildroot@busybox.net>; Tue, 19 Oct 2021 17:30:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so4233706wmq.2
 for <buildroot@busybox.net>; Tue, 19 Oct 2021 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GhX8zVGpfOBEhFVmAjqtn/XCqtUf0tTU+DSgQfxtq6g=;
 b=hMSD9Tsh6VyI2WZNDsZUjX9le965NwPZrpWLvhScQTmGI/HsldC1FOcaVOWARIsF7F
 ki0oDuMBJJECM6PhfkJely7T+qkvqi93DBBVwVU2/BFDHk89KRt3cOBe1h5w9l1bJWQH
 cavYN9tL8BcZULreLA9k6n8S9IjIGmbI1i7aP5zcq+Yu2AsOKU8jqnHMi3cnIrDntTwZ
 C+L5kGrLcyNLe800dIh0ZD8OobJP+Bu+BqNEtsfiF0g9mOTgxZK+WSaH94GmrxJVpoIj
 UJCytsVtBtqefx2tZ1U+2po2itlePrc3pyX7EnH5407g1gE/2VNK0/G0ktOG7CoWHtK1
 4eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GhX8zVGpfOBEhFVmAjqtn/XCqtUf0tTU+DSgQfxtq6g=;
 b=ub0A8GaOstUW1bwKRX/pQoVZkd73/lVtUsj2o7wwPyJ6IfZG31zm9/dqsDEidKpn0o
 x93ZSHKjKWuH84wYPMQKgk/D54OyHZW4oLyEV9Ss52TxhI07RCTxHTRyH6SyDDla8OqP
 ydBkFqhpEku2kr6VDYH7eCIUmE8Gvch41SARKex20Wd6bTj5S3MFl9h/PHPhmimIyect
 2d2krdP5cVFnqAgUZ1yhY/mPa9cemtKJu6Ps8EgwgYBWWinkWMweOLc83edV+wBqcKwn
 AXsuiwc7SJTsopJkA3XHJfv/pXBxi/Ia+ZJukEbeAjOj9VUNgJeWWESoKmy6b6f/grPk
 FzWA==
X-Gm-Message-State: AOAM533aHoY+YX4TVz+gxyot5H2g26Ljv/I2xzU/rOVB2ic9vwvvOHZl
 6O71DMUlQ7KUyFt3qV6kBFS+YcBWRhQ=
X-Google-Smtp-Source: ABdhPJzv1MzsgvfKRIxyfA3ceYcvYfRBP4h1pRT1do/yVYhx43+AaIDK2l+qi1UeEqdZKTvFYB9USA==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr7670506wmj.8.1634664608764; 
 Tue, 19 Oct 2021 10:30:08 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a63sm2775527wmd.34.2021.10.19.10.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:30:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 19 Oct 2021 19:29:59 +0200
Message-Id: <20211019172959.801093-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.48.10
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
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 94568a68e..820815561 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.4.sha256sum
-sha256  28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc  pango-1.48.7.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.10.sha256sum
+sha256  21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98  pango-1.48.10.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 2a4a9f49d..104551a1f 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.48
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).10
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
