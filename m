Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906D3CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 13:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7B760F4E;
	Sun, 31 May 2026 13:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZMHJ5SfPn1k; Sun, 31 May 2026 13:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E22560E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780233942;
	bh=7IwBh2T7GmEInNTHKCWHcH5mK5KNvyoj9I9rJ9NOqbY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IUkHznPD9DZzzdQETMGzk2YyJvMZFeKDga74E8nSvhCGyl81umiSf72i9hDBFK8uX
	 QcWKF2M9pmzQzWjABXBuMedNVokkqNF1cyfg6rutBAASuDNY+qRitwpzHoyXxIfTMf
	 Dp47DxJQjmwdxQvXQptCbnRNSOC2lbzCoCQloXu+lG74+/MQZmkdo6aT1LxqS5rtct
	 rsv6yJSyDx7eFfFhsweq6QL3r48fS4iJmJpyFtX4v/NIMIMfq08T/qtTq9vg3S+ODC
	 Jd+KwnAIfOFt2eoYjVGklyf8nTVg9TxsLWJCoH27O6/OzQABB4gHkgmeZv1uUzwR15
	 Mg8ws60KaHO5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E22560E3B;
	Sun, 31 May 2026 13:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 672572AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C9540183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hysySdJSST0a for <buildroot@buildroot.org>;
 Sun, 31 May 2026 13:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD3E1400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD3E1400C4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD3E1400C4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:25:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490426d72f7so81320375e9.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780233937; x=1780838737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1kwLBZT/at0rSPeyOBHxyBBIi5dPix8AtY1ckDwOi4=;
 b=cYq84bkmN7mhgqNS1Jc/gDJV/aHM3qesIfG+hxITuSAlOYezuiK5u1RGVD9R6U8cIW
 F5PoNhrS/0AdLWe5ItnqolhAWFAM0iVy9K3aUgL+h9twE9jFFedwAO2sKNQgXBYl1Ak5
 pMV/Zt5ZH6pIL99D8UQ5Av/9bV4KWLs2P7Yq7bLTo4TP0o/y7vU8YBhVSqavFBhCrSuA
 8FkUr4cTrvg3lTjb9cgAOSCvQukNV8njdyoMPVnMafcTFemi+y58fucyXV0g/sD+YGk+
 lp8xQCDYuduQk19Izvj0BlQzgUvOy1nQ1ce1L1gZARSKlcrQ+0Hkr+d9pwT5pY3av3iS
 VHxg==
X-Gm-Message-State: AOJu0YwYO5IZLPWPIoaIZrN/wtqLU89LZ9O3D7flhlq3NDDqSSSjnbbJ
 cT88t4siX26DEVIv3xAmN9iWyx8lLEPfKZcK0GHiQyToJR+/AM/buoPs+6NDq7HA/HWIN5Unmgj
 zx4j4
X-Gm-Gg: Acq92OFDzx/HUe0s84DgUmJmRLO2Xo96FbQ6yASyVOjpVZGxAed9zuoFWd0GVMVvvy7
 BD22/oDfh+r6FpwI2ITJriem7rcuxBhlqqm0oYYnr3XQKonhRcTPkDW1v22/bOwU5bIC1WHq2Kt
 j4Kac3wUlLRZq5MKUzuXE/YFOrF2whXNWjyztKg4HA5PLXEhIIP7f2tJfbkdpxUWSAi1vLuEVtO
 ieYpoV4P/O++zveh1W1GS8SO4cs0/2rtHMrG6lphp+1pnkUAhhn9FWcUM29S6ojX67rNOd6zfI1
 mKpM9n9nkyX0g0PyVn4XD/2CV5MpVntc0+KLy6V3J10oRg7BiJn34wFJuthldNaG5wHXmuzgRNj
 J6nqr3vZxV+ggnv8vJhujzdSv6iO9+4wWnDgMWLGHIJEIE4NAzZHhFmiVBiV/7/bYCnW5Dcwr2b
 dXeWFO0DRFsOjdoRbbSxhBx+f52z0hnqqcxqERMRLlNFY03VHUQl2Pi3xVVDYTFJZu/y/OtoWzI
 MMYGVZc6N+AkLh8rYBW2/cSkTe2P9Yklqxk
X-Received: by 2002:a05:600d:8648:10b0:48f:e245:394e with SMTP id
 5b1f17b1804b1-490a2943943mr101969385e9.27.1780233937490; 
 Sun, 31 May 2026 06:25:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354bb62sm17101730f8f.19.2026.05.31.06.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 06:25:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 31 May 2026 15:25:33 +0200
Message-ID: <20260531132533.643062-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780233937; x=1780838737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D1kwLBZT/at0rSPeyOBHxyBBIi5dPix8AtY1ckDwOi4=;
 b=XU4mJtTlIrXN9NwQ6dATWaQ5IXwYPu/MzEPseLSb1dw18W76pfymfb93kYVLJNI5gT
 JEp0dMx4wApBEwrwbkPRssPPf7UQYETnlWpQDzFpmLzKXU5udm4+NMckYaudZso/nFmM
 UIWC1HeGDrFXOTS9fyqHnVPf/4He6XtoaqBOY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=XU4mJtTl
Subject: [Buildroot] [PATCH] support/testing: TestPppd: force the baudrate
 for pppd
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the ARM AArch64 toolchain toolchain bump [1], the TestPppd fail
at runtime since ttyppp0 and ttyppp1 interfaces were not created
properly:

    pppd[87]: pppd 2.5.2 started by root, uid 0
    pppd[87]: Baud rate for /dev/ttyppp1 is 0; need explicit baud rate

The new toolchain uses glibc 2.42 that include a rework in termios
"implement arbitrary and split speeds in termios" to support BOTHER
[2]. This rework seems to conflict with pppd workaround [3] introduced
when BOTHER was not supported in Glibc.

Fix this by setting the baudrate on pppd command line (we already set
this baudrate on socat command line).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335920 (TestPppd)

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=5cf101a85aae0d703cdd8ed7b25fe288e41fdacb
[3] https://github.com/ppp-project/ppp/commit/d65f6713c8514b016629b87d44d5154d70776f7b

Fix-suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_pppd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
index 015f10f02d..0ba1ff7ee2 100644
--- a/support/testing/tests/package/test_pppd.py
+++ b/support/testing/tests/package/test_pppd.py
@@ -81,7 +81,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start our (fake) remote pppd instance, in our netns.
         cmd = f"ip netns exec {namespace} "
-        cmd += f"pppd noauth ifname ppp1 {pty1} {remote_ip}:{local_ip}"
+        cmd += f"pppd noauth ifname ppp1 {pty1} 115200 {remote_ip}:{local_ip}"
         self.assertRunOk(cmd)
 
         # We wait a bit for the pppd to settle...
@@ -89,7 +89,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start out local pppd instance, this time in the default
         # network namespace.
-        cmd = f"pppd noauth ifname ppp0 {pty0} {local_ip}:{remote_ip}"
+        cmd = f"pppd noauth ifname ppp0 {pty0} 115200 {local_ip}:{remote_ip}"
         self.assertRunOk(cmd)
 
         # We wait again...
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
