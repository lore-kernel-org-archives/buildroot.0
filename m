Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A835C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B203A81D02;
	Mon, 20 Feb 2023 09:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B203A81D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq_LTE9n5ktR; Mon, 20 Feb 2023 09:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09FF781B60;
	Mon, 20 Feb 2023 09:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FF781B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25FFE1BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3BBF81B60
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BBF81B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTrULXqCMNk3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1106C81B36
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1106C81B36
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:46:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j2so260165wrh.9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7SrqYMgL+UdZyOr85o1esTGRRDrwhpa8Ob9+T2bQh20=;
 b=G0j8KjV8U7m2b0I7RxWcOtywbxneMXzQAjG2ykBIKsD/jEXSys/yWuXhKtRoR5CFTZ
 8vTO9sf/tpDAbHL7cUVGSo12ZR4kKyop+mavwYxRnIMG5goX6QOiY/W9gB0cb3NuQyXo
 KnDq+2c8vCiNYfTQealISu0DgIbdT5+Mf9Sx1OU60kg3+XZZlGZooUoiL5qOE0BNARzC
 akskraMgg/P7xx4h6kGfkt0sEOVn5bo/E2CzCTH6Bnb86MPvYup/C+C0z7EKMUOmj4K2
 hu1kylPdcgG+Qu/pZt9ukqxS9FiILZ6jU7HKJ2v0RJmYVA2x89Fvt7TEZtN332KnBWEw
 HMzg==
X-Gm-Message-State: AO0yUKWLad1zomCiKY8ewwxxiA8sFDRXAtCSckZaX9E5nUkurG3oQKfS
 uI+wYbhJi9md/gjuH6zUIXHCQOWT3Ss=
X-Google-Smtp-Source: AK7set+sCHDFDHOqEEwvdWKtGAcaKDjtggCHkXS/ZVqp6IEDl6oImp7y/Wnc/xgWvKpmYX8cYYpOCQ==
X-Received: by 2002:adf:f843:0:b0:2c6:e810:9aae with SMTP id
 d3-20020adff843000000b002c6e8109aaemr312937wrq.6.1676886415883; 
 Mon, 20 Feb 2023 01:46:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b002c55ec7f661sm11760584wru.5.2023.02.20.01.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:46:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:46:53 +0100
Message-Id: <20230220094653.105814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7SrqYMgL+UdZyOr85o1esTGRRDrwhpa8Ob9+T2bQh20=;
 b=UPuPAqs6JflnltT8EDSZhrQ+dlyuUYckF+v0gpvjWcSZoYC2p638tBRCKJ4z87/1t3
 aEWorF3ccEhmluiiq8l0Zy4tcYwwZV/rsOkSstAQG4zBo0Aha224662EYDLoxjR9d5FA
 eHZycQAYowPaxNhR5cEcirFa4PwA2zMb1+0MXfhX0ccLV9a79w1sdcpmdrP85vFB1f2c
 zgvCcu7nInBUDTiAQuYhNLf1WhkCaScy3XU4NeTiUveay+8L//17V+oLlXxVK+2o5AlS
 DdCUeqe4UWiLrpOpwDT9JDJgxEguZZGljhs92b8f6HopCMYng/TGBiYnXwDrbKNH9iCs
 p9ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UPuPAqs6
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix per-package build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following per-package build failure raised since commit
9525bc7e64e8f44c31ab9dfd3f516ecb35982429:

configure.ac:140: error: possibly undefined macro: AC_MSG_FAILURE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:328: error: possibly undefined macro: AC_CHECK_LIB

Fixes:
 - http://autobuild.buildroot.org/results/11868e9bc4916843a7fc76f7b5e4c251f89e33dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cd7c13fbed..2010b6529f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -140,6 +140,8 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
+# needed for autoreconf
+HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
