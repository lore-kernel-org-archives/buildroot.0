Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E12C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C5E8112F;
	Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDfqQ3wpSexh; Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2076D81176
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595953;
	b=RKFaheCV5QPqaUf6OORNhrvfo0YI8MJTjSxBEH4INdLWvrXp0whVbakyU6GGHh10HVIQ
	 kpb7M2p89B5iquXME4DFyZhbhGYnLdr2xGGM3S1TTEX7BlaHG8rfMr7CuYXn59hLDN90m
	 bdgopMku4FWE4cM1tiSC/QM+Btq6cwVInqFDtOPMrVzMSOz3dThOSi7ysSpvufCrPr3LS
	 2TLUgyXp817+u9F+R1x9JZ9ZfPfT7Fr85QYcQEKSOWEU+vvYfTm9Uv6QaMBvBQBvO5i40
	 TMRbABcIB9sQ7ixT/6mPHfq7F/An6AeGFQGUpo9pV0J9aFzjfAjfZURRW2a6f14jTgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=W32WQhp/TnI/cmQjTqvcxOJun4noFGpO9M9wxVjAQoQ=;
	b=cgHFrSKv8uo988PLMxu8iHwegBW1+DFiwHe/TrrypRm2nughIj+s4t0Sm+2Q04WAgXif
	 z12QBp9EtXkDB57uwsmR9I41dzQXBe0G0ZQLPTiff/Ik39rytM2u10p3SMx/urdhWzsMO
	 yz2qdk4rKck0zaUlJ4fJ1aF8SEBkNCS5OIhubBp7p9PnOeZevOe1kEcd/ekwjWPBHhMai
	 lIzJuxlqBsO5W3f3WuSOHRH46M2iywVGRkDYfNAhEJlEv+01+vJ8nBGX04Uihl6WG8Wly
	 a8LdEdNcemGUabdg1S6sDqw9EoTSqUvmfq9DQC+Hxe1Bx7MkpFIZReENrFUxep941kQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SJ0gvGwH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595953;
	bh=W32WQhp/TnI/cmQjTqvcxOJun4noFGpO9M9wxVjAQoQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9P/Bnq4/V7sgMlu0pgxUDI+CUwK1BzjrSLmi9T7P6YMpgTRSjV0Ap6zopthVeeOn
	 a8BHXCK0ZjZR2efqhWn+FxAR8A1beXiruxJWYfnRBAuMP451EWTb+MrJGOatlT24LQ
	 wlJbRZ0p5jICdgskQio9IX0TBck6qfIceXArmx2jBmubLhkX8qoUKvRc9D1IycaBiS
	 5XBdam6oNLymT4zfXCwEq6IEzMRjoT4dCIPRb8lLbz4tzLBgBEIeIBl7l8hiC5DeV7
	 ENozfaB7hz2hV0Eek0QCXWcK5jBwkqp6Ivu3a2LE4AYUQ23Qp3DS2QHHL3sOERxevz
	 OsVJtgquUSjoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2076D81176;
	Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3952970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2BE28112F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U1TtTtAewhN for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BE55A81176
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595949;
 b=brsjPBMLBfb53ozWr7/j6gL/GCa7tAcALpFw6xOnX6GqPQGnPTyfy/Wkmzrk3sd/XhS6
 4qGplupnzZZH5yW8NQTNb684mBb3RsaTvxDblBjoeWqtgAqQP8o0S/aWqRB6W41g/cWrJ
 LVZD/tvjnH9EPwI230AiEv62cCIheADCPm4vbGTxhaZ4mzBQ8Tg8Z5lhFuzpVNmKO8iGw
 Mbv8Saix8Fy8+lVNLNkOMY4hKvsv+JkA+L9bhO8ccYAAoSeT915fEEwA2E/T4DHSwFYdn
 zOtib5wkTYoxmNORZkKcAaO+7shPvbP9XtY/qlY+GxojYcOAQcdbFiqSNYFKYdnTz8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595949;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Fp5QAuNbiR402qPwS03pOUUd80UGapXULIwZJdOcyp8=;
 b=qvSiw2bdldu8/ycqlSmUYLn7zwoDB6s2pRpbXj9A5Y0wb3r/ju/6eWnLIRRQ7EZHu73R
 Py7uiu5dC+SimtZlfdjExRAgFkj+CJ7yJqLjohDyWxqDskYeBVdvqmbVYrtIHdR9Nl8AU
 S/bgsFdMj8qkDjegICLSZldjv8R3rj0zG21KP7l1uKuec82VPObbmQG2KcUSXEk1Yj4UI
 LHtw+Qu89OwKm5vWyVwPALIcho8IMMbknUsI9zPEunBggAOqb4qpUj2GnZAhoqv51Ts4q
 9QLEjj5Cm4EsEJvyHItmqR0W6WJnX06PtUGwmn0VbDko0r0+blNII4ql5/lfpbzHBOw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SJ0gvGwH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SJ0gvGwH
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE55A81176
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso15829535e9.3
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595946; x=1789200746; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Fp5QAuNbiR402qPwS03pOUUd80UGapXULIwZJdOcyp8=;
 b=SJ0gvGwHPfcwHq3S7j5ec7t+XYpuWvKyEIaFkGROltn5LUJ+JSLPTUZswxigErUhpH
 NCKZNRz4zcLojR2h8WPVPMDBviqQnCF2hwPaDSx50f9UG8dh1oPoMzXeeWjEty/0haT5
 8TgFQ55xZYXbQRNq6He7ulHyZIAXx7L7cv1mU+GQnGtOtbAPP11ef+I0aX5xjOqVUb98
 04jOUR14FzI5cvxUOSpktmGj9WfEkx/O2pJK1KEzNKCjaZbno664jW27zyWCR+Cyyl9f
 jUTjZUG5w0wGdKis5OxFWST6ObrzEWsQmTibPhdUGxqwpTek7yWzrRkb/ADzcjOPan9+
 NeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595946; x=1789200746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fp5QAuNbiR402qPwS03pOUUd80UGapXULIwZJdOcyp8=;
 b=KVuFSvBpl71bCOkSot7UJvf5TUew4gKmAvunfvjUEWMVKrYepXDcygURmejxOuv17m
 kQaCcPQxgzOF2zhMzXBcgH2UqTymdHBNI7ifq4PRRZkzYu2AKDLZGP/zf1C3i/CFQcxQ
 difF0fKlJwG7A/FRYhov1ObqgYv+6Rn9jL+b6e04ZdhpNI5bHFnODQyO+y0z8UEriQ+F
 aW9mOCsc9AsTPpMQjSSvs9YEpdQf7hBQkhbM0tkdza846GefWh248XDbpPOXaWswJPEN
 c3bxhzhgVsPmzLPS0+QuX6E+z+3c5/x7q17FRUljWto1qNxSCG2owVXMVI3fmr4nRnuL
 TIpA==
X-Gm-Message-State: AFuF++lOdsxNM0rASitGw3/9BIOuZRw5sBLVpW+vkIww3sHqlQFxR4a4
 ajwdyLgae64NdjALtzr4/t+DPn5JQubW+UOKiDWBHtNca8tmZpSToG074nVb9g==
X-Gm-Gg: AYBFou2MYF0ozuBCGdi6+KTSeSSDEQLvRY8OTtYSKBBwfCEc7p5h6+P/cHDp62Um9fB
 JH7m6Yjr+xDDSMdO/Ubbq6o8VLglzfoAj01O0drPSPrJUC5Xh5eT/lw8r8xiqv2v+4bWql4oah3
 0rFOQnpYOFVaOuNO4M0JAVBpgl9ntUtWH+yQcAnlxG3F/gmPNGDlHxTMV8fBJcLpqKu2HkGqGg+
 yn/tO+9WdZ0laHNAcG4IRQhSt0dajE77Homh7kA5FYxdEErhNn3J2OW5bP7HzIn9H+vMlopglKV
 NkjBvhe0nW20rVe7Kh2XseLdXURHpjQ4BooOLY0ohiu3plXYOiKv7mXfnkSLq/W9pIDJovAJQH2
 Ao5DD1vj198IGyxyic6azhOa4nP5AYKNYWOYrNvJEV5M3v02aE/jkm1KtXdXZTzX+Mm3vfAcfEN
 vPtjVGe3TFk5uLkEZDdJIhVLDTXso08lAV/lJwBk5ncAm/0FiBCqvR83yM2nlbt3j2o8mhauOqw
 KpCVfvs6uzApjtHoqE=
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id
 5b1f17b1804b1-49cffa00196mr44108995e9.6.1788595946032; 
 Sat, 05 Sep 2026 01:12:26 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:25 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:11 +0200
Message-ID: <20260904185921.587878-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/12] package/lua-datafile: bump to version 0.11
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 2e993bc88..cff5284d0 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  13cb4816f459e71c525f256dbf197a516deb0f6b9ad98a9a0dc0aafe0d415194  datafile-0.10-1.src.rock
+sha256  0556de934ce7352611f90f6d90a1a71abd3de2e42aa0323047c7ccb44751e5c6  datafile-0.11-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 943ed9b8b..a5e59c2a0 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.10-1
+LUA_DATAFILE_VERSION = 0.11-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
