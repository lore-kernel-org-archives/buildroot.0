Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C7C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 07:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF0841358;
	Thu,  2 Jul 2026 07:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj7P7VuBeD44; Thu,  2 Jul 2026 07:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB5C41300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782978613;
	bh=aJn1n1wH9JJH9vFKX97gtoHckWTBFZ+OX7fjPWOV4aA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LCt10WDYIE2jDDx++OdQms619518cF3tqmr9ibUoXQb5MogIkOCH9AADSkYCr9orb
	 mUsBZEk39Twe0b6rgnijsfyxTzhxsGZ4k83Mlup6gLUqc0QJaKE94d1kQHu25vwlls
	 BpAWXGUnAirwXNRi5EOKq0nr8aI3igWVfTJgZl22TbpWIlGj4egmg7tKIK0Ni3fr1B
	 vajjO+hntlEDr/0roaSLgdpkHqIwF9Gta5kJEwN1Hj1rfKZ+KqhyMvisDPmAqumgGw
	 EylY1MsteDRyd2CyvaJDJzH6Xlnu+p2sVhOhQUDpoH6DHr+A00MuT+BaTPBfQw/Vpj
	 jlYOr2caejc7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB5C41300;
	Thu,  2 Jul 2026 07:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB89D316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94A7E41300
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAU-ibxYMu6K for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 07:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56723412A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56723412A5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56723412A5
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:50:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47640541585so903253f8f.1
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 00:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782978609; x=1783583409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI06ILsc9fYYg66ahn6FZJXBWE/2oRcTBgAOu4rPxw8=;
 b=Gl10QvXGwc4VkhW4mykAujiGcp8LsRt/hYWz+he3D79TYb7tlgQ77qqOLeyzwYsPb3
 8HOBagAb3nCW8VrDfo6mbVDD59O4lXEbSXhZx5SzfSBJP8ujBCmbaMJRTextYHVRmjf/
 jAhwBIEUmjm5m4D0duy/6Vz1yXg/7t7QTpFEzo5tMAo2JdOo3gjiFAHZBk6rjq3tirmu
 ZXZlSuHK1T7HaWjoXbENsez/Tti4uBBHSL1tO3rZapEKylxSo+kDJFblIbmyClBEjemh
 2a1kJTbZ8FJrhsW1VlI3pvTTuUFC6/uVnZwx7XvvCVJfVfipRDidBiSjP4SmP1QWT2ky
 VaPw==
X-Gm-Message-State: AOJu0YwJYWtSs9djV+SL274HoJJjaipik97mMzsdUWAYYiw57kt1iiVo
 oQFUsaX1nFZS6T/WAOcQDRsxTGtN1qikem7tgZIlTJ7edzqN3FaDmWmj1oq/BQIC9joZMXZMKaT
 YcLqH2ik=
X-Gm-Gg: AfdE7cnwaHlHQizViZvD0jpUbwkDaaXZDG63amb1WsDKhkUqB5tWR1ncTu/EdEh0Y74
 tPxFkBlyYj9hutP/kAVGiTJRtG++ZOGlNnvMxgrxbiriDnuGAy/PFn7VLBZ3sHMYKsQ0YxoGOEH
 UxdSCeOPV/G/tNdZGDVnQzFmj3D8aGnWmeibLJwG6EO8f/Kvl3ofu8rTCWIUizbHPs8MM4na40H
 B/xoVuUD/fwKtxEUqPz55V5owcxlG9Bg5p9ffBAeidRPJKF3C7mhxlWqT8x95fxSNkTY9P4Varh
 9S2h+d4sZU2pmYYTNp26cJKbuWpkf4n7xb8hyI2+lkt4Dj4vpiVDj1XvtfgVrfNATFrlqrLnnwv
 ofq6aTgc3UeDwodKvoaY+3aTlaCbqhq/N+B9COE3HqWdDHIxRjOOvxiZgxmyE5+DluXUotWa2nQ
 sYh6SDl8qLSOJgsWFqVwwv+9gbSIHF40dZz1kh9j2VlaJEJyvHvBnkCRCmzBerk6Y1j4JD4+9Fr
 OOZs8rvyr5qOgURpr5p
X-Received: by 2002:a05:6000:604:b0:476:504f:788 with SMTP id
 ffacd0b85a97d-4775a4e3e69mr7264811f8f.61.1782978608937; 
 Thu, 02 Jul 2026 00:50:08 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19fd3sm6593144f8f.25.2026.07.02.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 00:50:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu,  2 Jul 2026 09:50:06 +0200
Message-ID: <20260702075006.302337-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782978609; x=1783583409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rI06ILsc9fYYg66ahn6FZJXBWE/2oRcTBgAOu4rPxw8=;
 b=aEUg9WzaHZrglHUcK4aP7/XVoZIF6WYC/rxUZkz5JlNqFfwwv4rUpc3Bwi0oYKLrt/
 k3yrveAQ3UkqtKX/dmLpjoFqyL9jjsUmMZfh6ci+A4CpiPbtzbnvc/35cnpDBy+BH7la
 5NBzyrSH/+xjK5f3aUz5SMgEutx/njUBEfYc8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=aEUg9Wza
Subject: [Buildroot] [PATCH] package/apr: fix build failure with autoconf
 2.73
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of autoconf to version 2.73 in commit a6e8c07a330a,
the TestApache test fails on CI runners (and in autobuilders [2]) with
our current docker image (GCC 12.2.0) :

    gcc: error: unrecognized command-line option '-std=gnu23'; did you mean '-std=gnu2x'?
    make[3]: *** [Makefile:136: tools/gen_test_char] Error 1

Autoconf 2.73 introduced checks for the C23 standard [1]. During the
configuration step, it tests the target compiler. If the target compiler
supports it (e.g., GCC 14+), autoconf reads `ac_cv_prog_cc_c23`
and appends `-std=gnu23` to the compiler flags.

Later in the process, APR uses the `AX_PROG_CC_FOR_BUILD` macro to
configure the host compiler in order to build the `gen_test_char`
utility. However, APR's `ax_prog_cc_for_build.m4` macro uses a
pushdef/popdef mechanism that only isolates older C standards.
It fails to isolate the newly introduced `ac_cv_prog_cc_c23` variable
because the ax_prog_cc_for_build.m4 file was not updated to handle it.

As a result, the host compiler evaluation reads the target's cached
variables, assumes the host compiler also supports C23 (which it may not),
and attempts to use `-std=gnu23`. If the host compiler
(e.g., GCC 12 on GitLab CI) is older, the build crashes.

To fix this without heavily patching APR's m4 macros, we explicitly
disable the C23 standard detection in APR_CONF_ENV when GCC<14. Since APR
is a mature project that does not require C23 features, preventing
its use for both the target and the host is a safe and robust
workaround.

Doing so will not disable C23 for the target build if the target compiler
is GCC 14+; it will only prevent the host compiler from using it when
building APR's tools; according to the build logs, ac_cv_prog_cc_c23
will be set to "no" for the target compiler if it does not support C23,
and will be set to "-std=gnu23" if it does.

It's important to note that this error could also occur with other
packages that use autotools-package if "AUTORECONF" is set to "yes".

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15112315884

[1] https://gcc.gnu.org/cgit/gcc/commit/?id=fad61bf73b3158157a136bf4d9373fc3d9afe319
[2] https://autobuild.buildroot.org/results/d7d/d7d2703e42034d9c11de89b2b3b6cf401f677aa3

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 package/apr/apr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 1c7553a501..e8cf0f309e 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -34,6 +34,7 @@ APR_CONF_ENV = \
 	ac_cv_mmap__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
+	ac_cv_prog_cc_c23=$(if $(BR2_HOST_GCC_AT_LEAST_14),yes,no) \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
