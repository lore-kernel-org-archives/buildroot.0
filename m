Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA23ECA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD6F80F5F;
	Tue, 29 Sep 2026 18:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqpMA8maCNId; Tue, 29 Sep 2026 18:38:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE29D80F4F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707085;
	b=GdnaJwLgEDbllLrCGGVl8dvv4Hgy0cSQr07nK6LcqH9KP99YB4LHW8/LNjWvFS5A4ldA
	 cG30NfvYSBy9T8NMS6e4y/GECWVk5DJTP/SOjpw5KeBo7IctZfYi3JbMEP3x+Y8ttLN4h
	 01x/x1dnzopJQMXo767jJXZ8wZu1hw7eMlRYR64f8qsA/PYsVcx628+ghaPTVfwjC3nK3
	 UwPnqMjuS6SSLezbp209QUL2tUbgIuwshc+67etYRn7uRNyDqiACFw3THTGHKzGF5ixOP
	 ZzsBKED8l1mGkt2Rpj7JyHKwHHf8XEBFHqPDL8AV5yFGTH0qCAE8X+fZx4/dIlPQX0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+A4WejXrcRIBAvmfN+UKO6u72HX/ILyzfE/nRH5svKg=;
	b=GYoKbep0OvfdU2urTfKYiS0JlZfF7XUXuYEtmVLDeaGpsgtG74nlujdnt1yaj9LiMwYh
	 O85sap+Wgf+2hSzUZTZGu5uT5xezScOUvKwGK6ySPDGw8WooUQcLVwlR2lx/o5XBu0iFb
	 yaiSwiUNEEWc7AyDOg8Ql5OG293GhdP/GF52DN2emiQAbGiOzViB4Jx2r4/bZpBGfgHIE
	 bLXeNaNJkjwNP3MHHBiP3spu8LYxd+OFants5AoCBvAlmUGr1C9xw7zdLiGFi0sq8QBIG
	 DPAxbe8YUqWf9kmknERE7NTGIw9xkN6sBfsvfosEJKNTuB0HC4SShU244m4LQPnuwRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707085;
	bh=+A4WejXrcRIBAvmfN+UKO6u72HX/ILyzfE/nRH5svKg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KbWKhfeutA61GSX9UKQU1OofBp+9Q1NRXcEcTHkBSNoEfiVWepBLgC/O4WkJEEzip
	 ILX6lmc1lG0rJDXj/YYQscQ7GWbKAj6sFOL50vzqEOnjuM3cp4BnuEYXUd3iCKll85
	 krnlIK888pJXaKS3cx9v1XPeqoyV+QLKWgP4bYzWEWYxak4VaNCD3SkTUDuRN/OuhE
	 8yaIc7Ef8SQL6VUVwV1asFyxXm7cPBy0nbFVVB6LjuezZG6v7iGQlYiG4fffc4Ggs4
	 tDQl1ROyUpilK3WDHK8BMXluqhvTLs/eRNpbmGrX9svI9+X3BqLo/MV1rPTY7QHDs4
	 q12p3mu8Ha6Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE29D80F4F;
	Tue, 29 Sep 2026 18:38:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D42714C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F37B400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur7o9LSJJ6-t for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:38:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E58CA40333
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707082;
 b=nIoHskcpb5WHHNv4L6QX8RM5tHx2Zp+kApoKHOTFQso8JDRs9Lj2Cm+QUz+r9SBpRoKH
 9h43tRcXhgcvvSwH+9EpJra1qIx7NxBYT/q4lGadEnB10GRyADIWk5WgZBN198VTd95FG
 ZeELkYu0cYvjmDybTNRDQiqk70xen0sLJ+hppeFWw/j0efRPNRYedCZjBuQjxrVuB2htd
 S/P9KhvDTI/9ho9LiOy5LxZlc09t3AweNCryaliEScpckfb8LrNSW6B+apJ1Fvg1kci0R
 w6lk5td+JmswPkZof1m/Ni/tkIyp7rf8t0+DkrhnDJm2Fz0XcC7ePR9Y9WP61xo/PiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707082;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5QM1HyqvkUF/rD2hL5hAgPRSEbNX1j5t8ALSi8f/EN4=;
 b=mDfi1FJPZ2kGE7fqIgKS2Jb1a087h2OinOR3ZxZazmCbzmI/0XZKwkG0NPID7zVOWeez
 n2Fi1QUoJZjPhrgCj3/zYrpRGAtCHsMHIlunrJXeQLqVX0WdfKxAqFOEMT/Ye5WeFtr+j
 7UYtLkWQqmbJ0Rlblb3wQsygOcEeJrHpPNcy/SX34txdfZ55oIKRs+2EzhlLvm8lW6BY+
 pGhqeaUccG+0g74YP/keSwYvjxn1ddDRrgJg50SpjU6SUCn/JlsKGBVsqDGdESJuuIPpR
 C/KtVswYQp3IyYDA/TU6rizTNemMT3yvQzSaztYkLeFimEhs/pjR1V8JoTnSjtk/HUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="MiR/Lb4t"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MiR/Lb4t
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E58CA40333
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707021;
 bh=5QM1HyqvkUF/rD2hL5hAgPRSEbNX1j5t8ALSi8f/EN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MiR/Lb4tILqgCnft2TmvKwC7Nkyh/jgaQx2OO8OePKFE4Q2K0lDkbtmGrCQfdV+ZZ
 70wXAJX+oofF7wPP3pXd4Fh3QZ6Y96pFpMqdPqS9MdUbxxm2SFb437X7FUzHgnGX0J
 hOXm810/1GoPMCZgF9YkpNsnaTwmQHsWZx0vxJgvOjl7y62nUpBWYxJl0t3KkLAbjm
 yGONtfxSnd6d7pfxWd2FUEWngs65bJZG9Nx4HrTuSi5ihGkfIhMyccy2z0MDuq8WB+
 CVkNJF2l0sXMJ3GBCowNhalxtOLp3czU7+aBrF9KIbdMkwFeXtVE/n3XpQ0AQqdEBa
 8qWw2F4zjoL8g==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 C0FZ7mf55KsnjbSgv7IEG5jcy3wX6S5EP4uI0WeRKubkedgxjw8AZTyI1Enqc+jXHg8AnNrnSRx
 rZd7N5fwqmm9+mds1Msp4WKh71EdnPVEcSH1Pwg3kkLd3lgz6azA7sbNN9T+xZn/B4v+LSr6tDe
 60X5DFU2V7SWOWpAQRhFhIS+iN98zlEUD2VaM5f4f3EnurTSTysh0oI2CVH11uE4WXkUnU/NhMH
 XO0+5wDS+7UqJHUhOMC48VS62WW+0JEYnoRgMu5oOg4MeC7oYx7LhJzUW0RCjgyb3FvmzuAxqOg
 f94KriRdO8OwO3xH7fExExas4gBcswxdVNluZAHNzNQJMm3+BAfLlp1MrNGGVY6imXUJipHZvQp
 wqXD5KTDJF2pWklQ04c1DkPD/FudhdfT0sjdLdx5FtR7+MImx178TFbz/EKSMp0sha17rAj2FYd
 584baX3JNRprqQj0C5v5AmQ77zKrC5yChmYbQ28PoSn2nh78/k5ZIHu5rJtPG83XBAJwePt110n
 PH2W5+W/1qe82yCR8A7Cl+0Jyay2D6y/EPC19kw1owpsunk6eIkWVDEmyWrmxhj5Pr1BmOTeDCY
 zTA8Kaqo+zVJbT4hTpkTOj/aHr74uxupehgeAPv9WMAQcw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C619A4C515E;
 Tue, 29 Sep 2026 20:37:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgm-000000006Jn-0G69;
 Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Tue, 29 Sep 2026 20:35:53 +0200
Message-ID: <20260929183607.1849293-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v7 54/66] package/sofia-sip: Fix build with
 OpenSSL 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gregory Dymarek <gregd72002@gmail.com>
---
 ...001-Fix-build-error-with-OpenSSL-4.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
