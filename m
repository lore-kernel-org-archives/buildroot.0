Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A75CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A64F580A47;
	Tue, 13 Oct 2026 14:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQdsUxSm-TTb; Tue, 13 Oct 2026 14:04:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53702809BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791900273;
	b=dH/4MZYDajJ0enr4RePT91KkywOrsZfIdsGq/81tSmyAliHV6wWLyOsHkFuXzl9Et4Qn
	 5Za+grPnT+LYa2m+PEGlC3SjR3GzYwJfuKhZi6FRaGA9Lyuwd5LT+4HRHBpReWkU3FQkC
	 MIthHKAyHf2M079CyjN/5sHrHcclvJMreLiw27l12ybuX35fpCo8tFHq87t09PqN/MBpd
	 PnAokn+k0lNW4H0rtZnOz9ulz09P25/CAQ1bLlgCMhBu7ryCxnPxBkZaCoa46oBP4G0wk
	 mCR4ameaM7EoxHMmUKlYxu/x/IYh5iSEmz9i1jkugobsDss4XgBpu5vq91NzcIpsqWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791900273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SUSUHe/AFGRwrR8WXCDyFc96NZKvYYGrbfRnlKX7VYo=;
	b=diT+2AZsuj9TmDApAZJ1SvJIJUzUHHkzLW5dpXiPpNNoIedbYXvOUBKVSSPBXFIrMoAc
	 TA8b4cq3AuY827y8+PqsYaOlvdMAFyRwSFGYGWneVMs88Ume6QDRxu75UlrdRm63FxoxH
	 HlsfC1+EGuTlp2GIunI7y42//qxgpHmFbgIz/PVpVqCIkwfYSh9E5uevpp54f/ivvemXn
	 q9VjagkVsds/FO5Ak67O5x+zlgf02q5FkjNul1MnpMBx9x+NVtfpslUGCsAy0uvYQpHCr
	 Cnrh/bCxDOPM2QRPv3H4iOQes6Yj4kEglup2j0Wn0HwLfgWpw9p0qkS09B7mx9tTwQQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791900273;
	bh=SUSUHe/AFGRwrR8WXCDyFc96NZKvYYGrbfRnlKX7VYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JijXeM1DFIjz104+lWMNPK6GBMC3RSbaP9O6kzZDdIFxYPfStPz2372zJ8LF8ANCM
	 18K6Ier9fBHmYKx7gnP/eSRw3XtNWz2cpa8hz3dbpyIx6V3UXCGkHqeXJ8E5+8bKZW
	 jGfvKkQfaU5zkTF1Fs51MzuioxEXuHu2xE2Ekvl7XfGhvW2/ZydWNpT/q1PCVCjoab
	 zwL/0gnJPAp1YHtDiwUtYVGP/+Hpjm34QkHyzLcGfNR9gaAxhLC9t7nXfm1NG5DucD
	 s8WCFN/rZ92TgZN4B97SbX9wbL2iPqJQjO52hnGwhRrsqyu3TkkOYTiwWWormQMrns
	 yGnXn8R0n+Fcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53702809BD;
	Tue, 13 Oct 2026 14:04:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 742772E0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A0AE809BD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LedYKCeZPlGw for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 655B380962
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791900270;
 b=ioBzJusTLDf7ZuDRAdFjlnZa/O9Jlv8WQgGEWWjCnl2HxJJE0hdXMUNPGoCOE93wwCj0
 xn2Sws/t/ge+uKUKiL55V1H548j+qBqAgmcpvIko+atul0ZdwimexrgN8izp3cju5q6xo
 JiUIVZgNWPk3mqGTR3Gda9xDAv3jP3YbMBIxpK8Z2DIbJNLGpW23J7u2gtKFDKtGqLvUP
 NIcMNVCFRTCPjkMWKXEPlRs0/ne1vb2iOhtOp16Y1SHMso37w8Y6l6ZsI3RJ7YKtjfEpC
 aQI8YTmSMoo1sNoegjRPW4K5yMvT4hxYmZY06bEsj76y54CrrLmPrtxO4lPD55zHqmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791900270;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bNdDkKy6BiUfB9bQxVqKyHoCqIStlB+SKTc/fDBfEI4=;
 b=f3zL4SbEhi0zWNo7qDsIriZhEBRFFTzXUFI0dZLrJu6ppQzU7dKXhVFZnE3uQ9weC7r4
 DANlBoEHif1kv/3HJrQzy1ppByW+cbBgEb08j1pE9yMkUc62Sefn7Lq8U+Gqbs3isM+/h
 8kU50TgIDsv9kwYX5wfWZDJQL2vB5aMpCKaRdzWA5jx6toZc0QmmvyzXdreL/UL+U4ZlC
 D6DPWbiaHAKNEd1Vj68d/iUyMxIHv5/7qpjKkTMpMGWxBJX4FdSuMTMQkUTHpWifuLaPh
 aU5Kb9KFLm/J8NUdFQ6IfuARugdOLulFWkfFKefca9EQwgmMTLdwir+iOZkXmdgAgdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=VFBbndpy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 655B380962
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so4085597a12.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791900268; x=1792505068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bNdDkKy6BiUfB9bQxVqKyHoCqIStlB+SKTc/fDBfEI4=;
 b=KfpeqinKhWiyi1//bFpQ89G2yKOyDnkd2dzypgGxymwQJccM0cR/6t8k+eh33RBcFW
 CO4saly/Q6rhhMDh8IF4MpHbobQwLoYG7fDSyZeYSYyKQIS2Eept3YmR4JJitpnEDFLU
 kpxAPK1kiuqhRASB1RbjJlY/zJleymn6xsxwCp70mmR2WZCdxeAtreIPBafDAJDFvLTL
 /mui6XbevZuRV7ORwJXmF4NCqwqqrrc7REfF5KMePdwE1jddgN1V828+dG/jVKkmLXAH
 yH0XATnoVw/18pC74r49w5EMuvS6Dd4VnTPDqs+5IxP9jNZlUlH1xmBk/yd8c3OirP9V
 i6xQ==
X-Gm-Message-State: AFq9FYKE2ZRPHXtdt5BKLpxtwA3bfSs1WajApWDxU1dyA7d3ctXF2vs8
 M0YlVzehYW4xIFF+mfl6Ql5yZ6Am/hEFDigpDM8p7qc3sSMQWqpBW1L3vb45TA==
X-Gm-Gg: AYBFou04QdiD0YlVSqvslU4LOmO9ZhgeQaw/ddkx6HUcqN9I8mKmbHeI2sVIw4HlTNx
 cNkyRaWATV+a7L22yQKehXTE12oXblprC/XfQBUQ//Ezqv9wRkymJYPW2G+uj1Vcs4atwgUNqvE
 UxDVq5KLxkqNzLgvgHlhr1zLHOpThdBCVaXpXq7iPRe/CBtbLN+B99RV5uT0Cd/ZO62lsiRZYME
 7iLH67NyPY9RkhpTKbbfhemg2BVYcqDo4q8svNHt0w8eH0D86lXZliMVeI5OpTAApdKUOh7TjeF
 z2LYKkH520pnStRY4pc4XUHLSZZakTwXY3mBFq+UO6SCGLvYroHuezpRBTeDTWUBMU6oYvKyHe9
 ZBkEMh5cdcNO0Bp02l1PvL4o+FrqWkJND1GCaKabTPxD3AGF0WL+H1fj+bvfZsQ2E+75F2Cz9E/
 M/JRznF2jHy2cNGQjiBoJZYioHllFahHbSezywdC9EPSF4bid/hkll2qvzsEnLKwuVDz9vPmiOu
 0mg45zOx1dCQX1b9hm/JYS4w3TEKSmzhgJSVgLByKg1Bmk9IghpCQ==
X-Received: by 2002:a05:6402:461a:b0:6b1:e37c:135f with SMTP id
 4fb4d7f45d1cf-6b1e37c1669mr2667949a12.3.1791900267530; 
 Tue, 13 Oct 2026 07:04:27 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b179dd5979sm6646461a12.16.2026.10.13.07.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 07:04:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 16:04:22 +0200
Message-Id: <20261013140423.1941069-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-zlmdb: select python3 zlib
 support
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zlmdb/_pmap.py unconditionally imports the zlib module, so importing
zlmdb fails without it:

  ModuleNotFoundError: No module named 'zlib'

Select BR2_PACKAGE_PYTHON3_ZLIB.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/python-zlmdb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 884cfff182..1edf993ecd 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
