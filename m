Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AACAC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C4240562;
	Tue, 14 May 2024 17:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYbyPyIrEu65; Tue, 14 May 2024 17:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1819405C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1819405C2;
	Tue, 14 May 2024 17:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1101BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B538606F3
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZbjMsLeAy57 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 17:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 495E9606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495E9606D9
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 495E9606D9
 for <buildroot@buildroot.org>; Tue, 14 May 2024 17:25:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so71586261fa.2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707500; x=1716312300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clML7ko/4mPld+vNVPE9uqRGz0AkDVEp+K/JqPsCcys=;
 b=ff8CwD96HFRn5tChz36g39jAApsmgGvm10/icPrw9P8szMjdsDdM6fE1zce9WWG3Bc
 DeVqfb5fvwqGmmeIrqZVqfDHzAwOqt/Y/1+HyTOTw7wpsOMHwoRYG4QYf5ahwZ8Z3SJW
 LXvikZ6WgqIKJ7MqzErOEd4Osvr2lPPNV9Ve2BatQEK4O/fAlplLy6tIj0hW2bhcnxJ3
 Ok8JcNH763g0Khs9sRFJoBE9j3jWdlscZDuRKepNWoZq7X+h3XWHd0LL6XZpyWNTMKw0
 KXKEWhN7nVKZ7S3+EjORh0UdJLwR3KEDqbMiWDgJ03liKJ2ykbjt018vBqO5NyMsMHcL
 uIIQ==
X-Gm-Message-State: AOJu0Yz9BRcfP8dqINVk584Hick66pF+gXb4O07edaM7yL2uzi39ADKl
 Lms5DgCud7l9f8CGqkHp2kGr+HPgeAxCnX9s2ZS/V66U/KlPtZO4slihKQ==
X-Google-Smtp-Source: AGHT+IGAa1w+D9+f0+HfEEwRjkH/uBlO9vLkJUUa3BRc+l0MDubSzQLTI+KQxm2lq6h+XTHoKWEy+Q==
X-Received: by 2002:a05:651c:1a21:b0:2e3:3eaa:ac92 with SMTP id
 38308e7fff4ca-2e5205e6e08mr106212021fa.53.1715707499445; 
 Tue, 14 May 2024 10:24:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42010940845sm120293595e9.35.2024.05.14.10.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:24:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 19:24:38 +0200
Message-ID: <20240514172438.68998-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707500; x=1716312300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=clML7ko/4mPld+vNVPE9uqRGz0AkDVEp+K/JqPsCcys=;
 b=X9G+DpIdPsUiX4hE2osmLpEDzushXbShnNwdnUs5iPQRKd+48BKPf+UqNxYRC2e7/G
 mcmU4On9qtYVVwHDUVWMcAOKgrR67UUsj/dDvokeaqlpN5rZz9SM+v3+FGXFR1D2BwtY
 cXyT2KyVQcsvJMHBX6IU39OPXip17XjSxAeFhHDL5t1MHaPkqPAZKumP+mEByY9l8DBb
 dbKXo27dqdEGas+A7FITvoZmzHoc5gvtMt+TDxmRgzm9w5DvGtA02fXNeK8XDGeRIXX7
 VOJ6IfMVwooblRP+ACaOKeH/c4WC0t+24Zvx3QDEZkjDyJldnetc3b1f40ZqK9KhiCD+
 0RNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X9G+DpId
Subject: [Buildroot] [PATCH 1/1] package/libedit: set LIBEDIT_CPE_ID_VALID
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libedit_project:libedit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/42ACF08B-DD62-48D3-8568-32DAFD116956

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libedit/libedit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index ea7f98fdbd..98e29a9b1a 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -10,6 +10,7 @@ LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
 LIBEDIT_LICENSE = BSD-3-Clause
 LIBEDIT_LICENSE_FILES = COPYING
+LIBEDIT_CPE_ID_VALID = YES
 
 # We're patching configure.ac
 LIBEDIT_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
