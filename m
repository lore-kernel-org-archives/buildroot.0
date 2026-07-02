Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD100C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 08:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DC5610EF;
	Thu,  2 Jul 2026 08:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5gc6z8CR7JU; Thu,  2 Jul 2026 08:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C105F60E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782979573;
	bh=HVTx9R5bb7nZ6BEgru/1wdNvV0kOZsdPwgpLr+pI8/c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bBPEdoHpbzIy/FBaxcejhhcwUmH9O3XDmlrcaSZhrhYlzx7ncZAeN45fOWibACZe9
	 SAs8TqQIRirPNd4LqJr/2n3LySbFja8bWC6JH0Ce/dJSrwcdX0tcqxeDaG/hagg0p8
	 SDDe9sDtjOu0imkLqXuEy9i8r8hBV8PLA3sIdhUKr942PVyjwlK8P4jxn1HLnO2uQa
	 YSfys9CZyj4nDIidxgFQ5gwYS9hYZ8xPXUNbAwXU6UvWbB+pfQwZRBe3UUkdMQxslN
	 68800cfS9U11bENb2cYefrdQNXYHM/YuV+KWxpxN4RHX9CbY1ATRpFBvsywrP/ZFzJ
	 lNA2eQc7NQNmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C105F60E89;
	Thu,  2 Jul 2026 08:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16BC5CC4
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4DAE40EE8
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDARpr8TMRWy for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 08:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD52440EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD52440EB2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD52440EB2
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:06:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so985047f8f.0
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 01:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782979568; x=1783584368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hijNkLDEUwzXR37g61kTam0bgwFBHr3FaS+sFznC2ug=;
 b=ShTDY6pvH/HTz7ceYxqPA8DnAlXRMmlMi3PIXMbrKmbRSKpWHoUhfW5VGMkk6plwBD
 kI6NxfFWDQiu16/832JO+qrDDc/1dSbx8t0SFnRywZev3msoierAQoraet3NrtcR5OkL
 FhyfuE9RSZxh9IfnBn5vslw1LLXSLQL707ZvfaTJK00+Wx2dX2G9WGP48sB7+nwXntZv
 hxE/WP4bNYIJ6uLwirZlnbLUrH3zYT4hxJoi9GupcRgHgUMvypZYYNpmoxBGrgvJgzh9
 eD+ItmSbxgXfc6ubi5OaRCH2DdPHIzxXm8gerL6r+SONGh3yfDqtrzAO78w0KhxXKtL0
 5Phg==
X-Gm-Message-State: AOJu0Yy0h6W5ZIdLgVzKOr5zmj9ItVceZ6aa+QYKX2vdQ2BnUwKwBnzu
 GxdZThN1LjNKqGVJF5/RZK1rWdQhQu7KRFkfS3SvqHxpe8XvPyIFtz0AGV1tyfX5TtKaQdM79q9
 BZ9W8GBM=
X-Gm-Gg: AfdE7cng+Bn5TE0OU39pOIkc0LFhEw1wIAQm5iWBMHgRbDn9Lcmr7x0fWwrMJq/xI5E
 FKs8yFzjPlouJ6JenEpNzdhATT/rwlslMAQrFNFJZ+/WUt240CKaF50uB9lJVyeX8OqMwSTtlYE
 nJ9TVt5oozT/nt2jcLazXotcAxt3q3QTmykPSBNkvfYMeh9RRIAwBeCxseWuGxb6rxyp3VaOcUZ
 BTWkNsIS0w2I610OTLiUF2SRggWG86tx56vlUhHIA0fZD7L0kZPB20jMIQ6uRphBIw9u/GBbKmR
 r17DuKzn4ImhDUT6jCGdtEtXULtsOMvwRd0b3V6IRPYFs58CNspsc90j+CsDSt6p9LjwGd7jHcO
 TN5my/s9N6UKitwBqyIbkb2R1DyHFwRQSdezMo+uAEy7Xwjn+bHbim1rZ8cEeFxdADg+DGjZ5tY
 WegJijLjX1Aca3LxC+UvDvsj2qabOWW5PzOhHXHB5zREaKZTjw1ZYRqdL2md2edlqdswn4jRnSR
 8O89qd6PZXIOUTbtMgP
X-Received: by 2002:a05:6000:2884:b0:472:ec66:275f with SMTP id
 ffacd0b85a97d-477597548eamr7277088f8f.40.1782979568192; 
 Thu, 02 Jul 2026 01:06:08 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3db964sm6500599f8f.8.2026.07.02.01.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 01:06:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu,  2 Jul 2026 10:05:58 +0200
Message-ID: <20260702080558.303727-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782979568; x=1783584368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hijNkLDEUwzXR37g61kTam0bgwFBHr3FaS+sFznC2ug=;
 b=w8C/HQB8WFsSNXLwiacfeP+fwfrGZAUMNfTJsqiQGLu/5RCWq+YkO0cw8P4Ai1eXse
 hfIvAgh56F0E3foai81r5wEW8yblX8hJ0yLrjr5F9S8ipuhxVPOAil9vSqcUFnbdlC2K
 rTl+4JtWu+Muk67UAMgTKW+Q6sPRt8ZGCNBo0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=w8C/HQB8
Subject: [Buildroot] [PATCH v2] package/apr: fix build failure with autoconf
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
supports it (e.g., GCC 14+), autoconf caches `ac_cv_prog_cc_c23=yes`
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
disable the C23 standard detection for the host compiler in APR_CONF_ENV 
when GCC<14. Since APR is a mature project that does not require C23 
features, preventing its use here is a safe and robust workaround.

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
