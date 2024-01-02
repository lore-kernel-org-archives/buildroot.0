Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E12C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 17:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F4F040453;
	Tue,  2 Jan 2024 17:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F4F040453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MXb6ncLrMnA; Tue,  2 Jan 2024 17:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C79409DD;
	Tue,  2 Jan 2024 17:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C79409DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1A2A1BF34F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8C7E40453
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C7E40453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql5TNznVNf7t for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 17:08:07 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 895A4409DD
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 17:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895A4409DD
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so48044485e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 09:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704215284; x=1704820084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+vabvqO2XbXH7c7baezk9wSmAKOoI8D4mYUbMiMvyc=;
 b=S+VYqHQE/7fvqxmONRvykeZpxUVphHEPleej8WFK/lRaicy7lvZ29xCQsta3GbZIfl
 Ku4I5LBvmOW0I2PdUlB7GbTUvoKDCz5977Ph7Ym49BMGK/SNouF5ytRsPKDUdFtYyWbC
 2ntxTr65EuJsloCzPQbRPLs8D4JKo4/2nzIdNrKekOsd88W6QVZ6HR5NW7R8x/85EXY1
 cgRrqNeF5Tqe54hskCZPzrl3h8VghowHhkcAEbNUzNAfKchGcTb5DJxXVsAmyqxjPsR0
 d6KH0t1C0iiwy+VPuIPcJYTTrpG4hUrKJp/qQP800G+OPLudrIdqeHkV/f1rY3scPvCk
 dFbA==
X-Gm-Message-State: AOJu0Yx4K0HJ2dWOtkGglN+lzlOdyTpOf3B5Jyilf+KhfOXoKtf5MaD7
 2FXlD1ttLDz3AGpdFY8fAa3nblMHRwE=
X-Google-Smtp-Source: AGHT+IHU7LJR0pWgX4LkRk3/6i4wbHT97e7NM/+Ggc1VmuKn/pzxYuahmlY1PVWGJoSI+CXxpFdVXA==
X-Received: by 2002:a05:600c:1c02:b0:40d:891e:a0a0 with SMTP id
 j2-20020a05600c1c0200b0040d891ea0a0mr1276339wms.162.1704215284168; 
 Tue, 02 Jan 2024 09:08:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b0040d724896cbsm17382788wmo.18.2024.01.02.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:08:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:08:01 +0100
Message-ID: <20240102170802.656262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704215284; x=1704820084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J+vabvqO2XbXH7c7baezk9wSmAKOoI8D4mYUbMiMvyc=;
 b=NBaIkLw6P/fGO3yprY+pT7o5q5RVJm+NHtUlxIcRLfg0QFckjArrEzoBjsvfUGy86T
 Qh8EDWoMhZQf/U4jarkQDM7S9IPDGaeee7LuAYTf+lCoWedrGMJt3f6n1y3vzUnlHrb7
 ukvtDxAsjdv9KsirkT0/iThUzej1jw+KdcxYPTCUTaNq9xL9DnHPcE5PpC7GzS3hiekg
 Rlo25ohbBVATnjwz5N6Nzd9TrRuVRgoYjYhgjbYa8Lv+zkbu2+ZD3wde+OarfTIRwwFK
 Q8nRbfn85occLFKEqyOoAw1bFNfIN6LVCI0KHvQj25PrPNBhJQ/nzdrfNlYdPMLMMCdd
 CkRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NBaIkLw6
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix build without MMU
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

Commit 973b1eba5a4ee72f040bd471b147267e36be73ad removed third patch
because of
https://github.com/openssl/openssl/commit/78634e8ac253a8edf338d329965724dfa8e033ab
however OPENSSL_NO_MADVISE wasn't updated to reflect the new
HAVE_MADVISE logic resulting in the following build failure without MMU:

/home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: libcrypto.a(libcrypto-lib-mem_sec.o): in function `sh_init':
/home/buildroot/autobuild/instance-2/output-1/build/libopenssl-3.2.0/crypto/mem_sec.c:557: undefined reference to `madvise'

Fixes:
 - http://autobuild.buildroot.org/results/4328c025f6f2bcd2ebc5a4368c78e00da0aea1ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 22cf0ff97d..42432d079a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -26,7 +26,7 @@ LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
 endif
 
 ifeq ($(BR2_USE_MMU),)
-LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DOPENSSL_NO_MADVISE
+LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DHAVE_MADVISE=0
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
