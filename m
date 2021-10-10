Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E59FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBD561039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DBD561039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B2340190;
	Sun, 10 Oct 2021 09:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0fC6kFIFpm0; Sun, 10 Oct 2021 09:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60732400FD;
	Sun, 10 Oct 2021 09:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775FD1BF976
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66D616078C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afkZtIJX6GZf for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9185060784
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:41:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t2so45133290wrb.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sXSnriMdl1uN4L9fMhmYk2Fj43Gv0C0FFfNQl28AmfQ=;
 b=jxyLWnwQrr7ZnZ0FmK9+LT8fjMtbDn2F863+OjCwymEw40Q92k4akPLnwlSEmCrY/I
 iQFR0o02+tTpG0N7V4bA2KyEtaYXcPjFp9gfmQLyv9dUDZmXI+HyBMEH+XC4vayiDs3w
 nLHCN75viJl/BKn9A6p7L9+XgdVNE2EM2eWqhV6WKgj/uXkmD7+FXTnpwU050MdpRS54
 Se/ihjoVdQTCAziwBCsGPDGEjTqZGpVI7gtABOhyGHs9zdC3u/4qwS/z7TE3UuM7wcxB
 YwCZdQ3XrUEwnKPDPHqECgMMT3cedR3sQFpTVvfDUWpWqgHrsFlwTeomXumJssgBdAxf
 Deww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sXSnriMdl1uN4L9fMhmYk2Fj43Gv0C0FFfNQl28AmfQ=;
 b=nO1AY/HTi8bYtDcEjjN5rR8sEgobwtVIvH3EDqvtEwJQlMlP7CqGvdno69vw5QEJLz
 WuiDktQS4/+Kmy0x5CIDDJRN+PtrK8tTqhGzIdOMRtcWcBvjkhFowsyEbj5zvJGTFqr2
 YF3SfWQKK9deaB4yQ6Pv65NoSagUAuflyoS45uU49n2ZImb58bYiN7XBlrFZhBZymqNz
 +/TLkLBuCUCD24FJTfO+w7eDALxjjgAv6euBOW5t3KYZBFkDY5GHdpR4gyLi+pACYtbw
 1fqu6ORDVRht9z08JtdEm3S10XINu3or6wiCewdVc1ERhIJkV0Yl+ibYHn73sHnuHC2K
 fXqg==
X-Gm-Message-State: AOAM531sGwYM913VdDIeNhWxJiHqjVpOcaet+91N9A28l9XvQhgB9HoH
 fzodHpoDHkoZwZuBIQoEy957TEhNz/k=
X-Google-Smtp-Source: ABdhPJwc2IJ8ebULnnEXLNoDh3L1MXD6Jx4ir2UrbUjRDC3rX458A9qNFJ9OXQXi3jlqYxGbB08X/w==
X-Received: by 2002:a1c:1d8d:: with SMTP id
 d135mr14611411wmd.191.1633858896542; 
 Sun, 10 Oct 2021 02:41:36 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id s3sm9301385wmc.3.2021.10.10.02.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 02:41:36 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 11:41:29 +0200
Message-Id: <20211010094129.109078-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libolm: bump to version 3.2.6
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libolm/libolm.hash | 2 +-
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index c080c7eaf3..80210a2e5f 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d947d9570345e68696668cb855f1a6a7141b7b89cbcc15a08b1fae18535c4c45  olm-3.2.1.tar.gz
+sha256  9b61bd9182bb0ae0c5a800a8b0496b69600a0a22e3a21fce0aad119d2b1c99ae  olm-3.2.6.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 034b3449d9..0049fb6001 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.2.1
+LIBOLM_VERSION = 3.2.6
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
