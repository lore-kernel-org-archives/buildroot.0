Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B6C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3936381A27;
	Wed, 27 Jul 2022 08:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3936381A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNLRr8U38vGu; Wed, 27 Jul 2022 08:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635AE81A0D;
	Wed, 27 Jul 2022 08:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635AE81A0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF301BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1631681A0D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1631681A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6LPIkVJltq2 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A725819C8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A725819C8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:20:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id b6so10064636wmq.5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kpUfbJseqCDfIlGQ8V6p6kZVKSbt0GAosfUPoLVvxCM=;
 b=hp+L0zlOhaprnY2MBMPzMPIyVXk3Gg6S0U7x1NVpaJ1pQu1MbzYBG25fzIq2kZ5E3z
 dstrvAT5f2RXeOuUClHTRM2hrMS5m62GcHv+MJnCuYtqPpOMGpT/UxEIzHkA6r/VyCaG
 VnZb9J11qvzokBteeUfpOjjXFGANejEnc42McPbuVJ6XRLxnijwoYzS7UCJbzXIyXKn7
 57AsuwVlDxX1rX+YpL6R0i8Vh9s6d6UDLxzPQuux2n1DzVaDzuQs1QuTZNJjofnmo4iZ
 IgWoqIQsZtmYJic3QKQm0fKzV0eGwTfP9UOFmnRduNE5goaddfsyhyHve28PEvxR0odV
 n6xg==
X-Gm-Message-State: AJIora99YEkvHv2stIHmr0sm8tqih/sfGVfWdolc52hScxcxdlL4p+zO
 gxTHl3ft4dkNkTR+uoLYsm9pc17DkQw=
X-Google-Smtp-Source: AGRyM1tWEVMhwTMkhESm3hpR+ZAfgl9qWWaONNClhqqiVRmEDjawoOn2jvHK7o172WkbLtOEpqXepg==
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr2034680wmf.188.1658910036978; 
 Wed, 27 Jul 2022 01:20:36 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 d27-20020adf9b9b000000b0021ec76a0c36sm1378080wrc.106.2022.07.27.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:20:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:20:27 +0200
Message-Id: <20220727082027.731020-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kpUfbJseqCDfIlGQ8V6p6kZVKSbt0GAosfUPoLVvxCM=;
 b=XfVcGcoHlrbxQuf0MH1Msa9SV6uu6tIJGy0Mw+cArvr8tUHhvGlsliLyzjVSFXpBq8
 KDf6kTrpQKj2kv/OIjCf53xgaDxKYRhGSy7SJkPP2rbGqN8o4+jCdzxUDk/m4unEtsAc
 xLQUfSYbyp+c8HEOTBz7erQ/s5+reGBuRE0wzAWa4qdyFaKpBrphd8xSjZBrbbUuymwB
 aUoEu11D4fMvAN9Ys9TNuX5ptGgwIgJjRdnk17+cQwxlKd3nk/IAdONwYPd77hwjeRpc
 lnLZKUSJ+f96T6i+uf1/lkwnncsD11UmhMo8RyXYC1b35X+XADFh6504tyKt+i2dmyXN
 clFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XfVcGcoH
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix NLS build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with NLS raised since bump to version
16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/11.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: src/libpulsecommon-16.1.so.p/pulsecore_lock-autospawn.c.o: in function `.L0 ':
lock-autospawn.c:(.text+0x1f8): undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/58ce701da2896125507048b29ded75cf9bcd6e35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0958107f8c..747c09ad4a 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -29,6 +29,8 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 PULSEAUDIO_CONF_OPTS += -Dsamplerate=enabled
 PULSEAUDIO_DEPENDENCIES += libsamplerate
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
