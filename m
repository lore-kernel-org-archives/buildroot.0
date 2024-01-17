Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31106C47422
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8CE683E01;
	Wed, 17 Jan 2024 18:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8CE683E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7DVUa_nJpcr; Wed, 17 Jan 2024 18:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B7483E2C;
	Wed, 17 Jan 2024 18:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B7483E2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C463D1BF3BA
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C0C4370C
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C0C4370C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKnDHSUkywAA for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 18:01:05 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 628FE40169
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 18:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 628FE40169
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337c4f0f9daso619026f8f.2
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 10:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705514463; x=1706119263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lF758j8X2qT9TutGmnXz94PqwfCaP4B1AP7P3bfngd8=;
 b=ICdKLXvK9XOpe3vVKaIC0Tq+QujaVrSVclWws2Lh6MGDgQjIyHi25m12YhetRJ6jlU
 zbiv0kyRGlWFXOqQgH3A9seRSVQ4ZfUJqsLDu8RsUEh1NOsuj8lsb7WDKUn9G0ezTyyn
 neoDlBWLhtXap5qSgQxQgr+X2w8pkjjuw/0sxIji2v9DM1jZYHq3rdnKyDv3kAakdoKG
 2qonJYj9zylJdTkoZABCJKzkDX/L0+Fhgidmzoy4F0hTuYL7vOJPulQ/yqQgIQcEe7IP
 iaf+wBUODDcedFiY2GI8JQm7Gc6rvs0/DOMbrZDKdq+ButaxDRvssRZ2lc4r+pyPlX4b
 9w5A==
X-Gm-Message-State: AOJu0YxDWTLtC4CHdwn1L283d/kLJabRBlnumv+UNaseL2iRHfFFIRot
 43DBDtol8zj+QHk7NXd9z75tEeketZ4fjpt/
X-Google-Smtp-Source: AGHT+IFLpcwyisLU0f9JlJxkq4kA5AJVfJi4y1BehnvyHbq6MEhxhBpvZVo0KWepAXpfRi5l1r6+/w==
X-Received: by 2002:a5d:4484:0:b0:336:8b69:79ba with SMTP id
 j4-20020a5d4484000000b003368b6979bamr4936642wrq.10.1705514462815; 
 Wed, 17 Jan 2024 10:01:02 -0800 (PST)
Received: from aleksandr-System-Product-Name.lan ([146.70.124.140])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b0033761b2de64sm2176729wrv.76.2024.01.17.10.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 10:01:02 -0800 (PST)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 20:00:59 +0200
Message-Id: <20240117180059.40265-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705514463; x=1706119263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lF758j8X2qT9TutGmnXz94PqwfCaP4B1AP7P3bfngd8=;
 b=GaS4Mm9ELFkXPL8XDhZIpFSZCPaPtf0UmquemGj/8phVn6G65JjmKa1i0/KVSkm/pY
 zsIDUwhroEcJNF0APmAK/wPz5vY201kj30RUjFXiXZ/Evt4IGtKLYxw47n0J69GxwRSG
 pFeZI6sYGdS64X1+ZS90uld/LcPvxJon8olFq72gtZ7CpHfcCBANRuebWr3z0mj/tmrc
 Z9y+DzfJtfcZ/BFtvisH0mEVj/rlhABf14fT9ZisARMfubABGviCpb6EIG2+ypWEKJjU
 WhuKo/LCvtj3t009JEvWr/T4wfUbPHoatCg5SvNnT5gICYnr0tFGEXqWkd3kferfV9AW
 K2hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GaS4Mm9E
Subject: [Buildroot] [PATCH] package/haproxy: fix runtime 'FATAL ERROR:
 invalid code detected -- cannot go further'
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forcing HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
which were internally set by the haproxy Makefile.

In such a way, a bunch of flags that were deduced by the Makefile script
in *_CFLAGS variables, specifically in SPEC_CFLAGS, are omitted. Compiling and
running haproxy without SPEC_CFLAGS taken into account results in runtime error:

$ haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
The source code was miscompiled by the compiler, which usually indicates that
some of the CFLAGS needed to work around overzealous compiler optimizations
were overwritten at build time. Please do not force CFLAGS, and read Makefile
and INSTALL files to decide on the best way to pass your local build options.
...

This error is produced by haproxy.c [1] source which effectively ensures that INT_MAX+1
expression wraps around using twos-complement representation. It is only true when -fwrapv
gcc option is set in SPEC_CFLAGS.

To address this issue, include HAPROXY_CFLAGS in the DEFINE variable in haproxy.mk. This way,
the resulting CFLAGS in the haproxy Makefile will have the appended HAPROXY_CFLAGS instead of
being overridden.

[1] https://git.haproxy.org/?p=haproxy.git;a=blob;f=src/haproxy.c;h=e1863255422459e806f7e50828e81976bb41c14c;hb=HEAD#l3304
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 63a92090f3..61a9ebebe4 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -82,7 +82,7 @@ endif
 
 define HAPROXY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" -C $(@D)
+		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
