Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC15C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466A040890;
	Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAXsVCyt9nnH; Sat, 29 Jan 2022 22:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C9D40611;
	Sat, 29 Jan 2022 22:47:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25BD31BF357
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 143E860AE0
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAT2YbbYc9ct for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 22:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D9C60A78
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 22:46:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w11so17943646wra.4
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBtw4vAFkkZUfSig90+RSioktveRGKYsLLFApy0b0c8=;
 b=SnKOJs0AEwPDfIRklZl+LLqugOXeR4KHnPJnL8BCadq1B0wK0kX+/OjlSzig/dDR1f
 D3Jsyhb3ZD/iiXgPvPyN0ga1L6U3Q7DJbT26jnYRFroqJuIXbpjmCI+zTVmc8xfR/6pp
 etoUrHmoAqUPhO6xf8fQl1mSqPs/MXrmsTPjQrT0gvHZdbfn2K3Q32N6Cb5qwO+mWUYy
 5rD36z41zGPFzZztzgEjS2cOLsgRpXaBmCoYz4Ht+K46xVbtPgCFz9Sd5hw0VEE69wuz
 vxZ9mj2ip/44qcG/5q1+pCxr/Vs1GMzR/Q3r4001Qxr7VPKsiDoN9s8XqiA4YxTcrCWm
 Bmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBtw4vAFkkZUfSig90+RSioktveRGKYsLLFApy0b0c8=;
 b=ZxC8BuRL4hSN78SknxCFTsuxVR6SHXTQDCJHLL4DFc+VapFViAG8V9PzFumLt12Cuq
 5Qyx40JhaNTngYvhZUKp3djnMhK0Yqc/EcW2NSgTBs85YXmxACF5bTqA7XiGVUWn/zo9
 tBgR1nZfynmN+SeI/jdTl08JW6oiEskbTcFZVFZCcCesVJMC7mZdpYZct/Zn3xjlO9Ro
 GfibFxZyhhNxtkKgbK7PR5VLKls3LYljWkSbLPrkT1UkPzLyjcNHaWva/K1XdgElR2QU
 D6jmR6D62Hf8z+5hAD9m1/AjmSzqtQ1CLsxM2BXdF3Lnucxv9r+KR/u0aGDFB0V5NDz/
 Zz5Q==
X-Gm-Message-State: AOAM5318dqyr4wxdOBpDB/QWcqu0qdcEFhuy9Fl+nOQEgH2ZjFWmG8IN
 XERYSs/DzD5OJLa3GypvMwsA9QgzaQA=
X-Google-Smtp-Source: ABdhPJxbxkiQHjhNTk/WZoKzJ7y3Ay+MAFobjc4gQ7lUzTmnfFk1W0DOyRcc9j67enbKi2UeEqbWgw==
X-Received: by 2002:a05:6000:385:: with SMTP id
 u5mr11850921wrf.62.1643496416174; 
 Sat, 29 Jan 2022 14:46:56 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l24sm5101278wme.17.2022.01.29.14.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:46:55 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 23:46:47 +0100
Message-Id: <20220129224651.1282263-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/efl: bump to version 1.26.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug-fix release.

See: https://www.enlightenment.org/news/2022-01-03-efl-1.26.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 6364d276c0..8d50400eb7 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://www.enlightenment.org/news/2021-12-26-efl-1.26.0
-sha256  a4a9bce45fd27f8541874e44a130f64550bee1f2f72feaa6c8a758d92eaf204c  efl-1.26.0.tar.xz
+# From https://www.enlightenment.org/news/2022-01-03-efl-1.26.1
+sha256  86a9677e3d48dd0c13a399ebb417bd417bd8d150d6b06cc491bc92275c88a642  efl-1.26.1.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ed0a8acc1d..43a2dc4fcb 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.26.0
+EFL_VERSION = 1.26.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
