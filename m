Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD22C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A85820DD;
	Wed, 22 May 2024 07:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUqGfgGkY-Hj; Wed, 22 May 2024 07:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8065981F5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8065981F5D;
	Wed, 22 May 2024 07:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED28A1C5859
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97904079D
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAsNT6qcgAaf for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A86E740798
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86E740798
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A86E740798
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572f6ee87c1so9298750a12.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361374; x=1716966174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+/BJu4YjNdX7N+GBm37KsrjGTmH9lAcpWT3enHZbIo=;
 b=DAB7hbRuoHyzpYkLqdFSZZaWxcFEumeoOj6WB7NrUTqn57HCUbGYJ0PjiFCAZ+GOht
 KAMSfgs/CFEAneY2+6KKmwYasBex4JMkKrVntZ/2BU0d0kznb99XNmn3EDadgxeAmFwk
 pxmMi7NjhklYEh32dnr+HChrQmrQ5r4EZgDdt+o16qP3mLxGqYLnMUl6QpLca7Y+oK61
 pI35jv8tykbixs7+Bsa9sgKoWQG9r50czb/lFvlru5DzUHTR/ZtqeP2yTDiox6ZnspFb
 5MEeAC+OwcTiyYiCGcf2PaHOu61/iAMxWV/7VL3GKkK4DbPTCS7l1sYfZlTRQxLNCO1Z
 NB8Q==
X-Gm-Message-State: AOJu0YyS4OM0TlovuHyBwLcKyDmcAprFcPPKRH+DZhMXs87Vkt7ZgHUL
 BZiJ4KxtFgaK5g9ofGZISlgXWqY8PWyX5HPicW5HH5sTg9aCF6r9CYp6JqPU7XBQhk777vJ7EFS
 qcY8=
X-Google-Smtp-Source: AGHT+IF/cbbZS6vvuaZRL54FAiT/78+1/2Ve+bDmXdfNbASyHShPsZAODzxm6PJto+r2y4jdBgNsJA==
X-Received: by 2002:a05:6402:5158:b0:578:3358:aa02 with SMTP id
 4fb4d7f45d1cf-5783358bcc6mr486064a12.2.1716361373670; 
 Wed, 22 May 2024 00:02:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:25 +0200
Message-ID: <20240522070238.3282121-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361374; x=1716966174;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+/BJu4YjNdX7N+GBm37KsrjGTmH9lAcpWT3enHZbIo=;
 b=fjch2oMmKTc8ZWWpT3sQPJP/U4ECr89P4tObG9B+IxBKVsQF3DhQOvaAGu4QTIiVT3
 vv9MdIzjnaK5UITKbtB5K3DQSe1odckcqBHt66WYBEv9n95L8nuZrMNPYQoagNGaQcJc
 T4kwCXxSPSWxhdWZI9yyhGASSNiwnlKw6sqEU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fjch2oMm
Subject: [Buildroot] [PATCH v2 06/18] package/elfutils: update the patches
 to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...lly-make-Werror-conditional-to-BUILD_WERROR.patch | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index 565a3c1bbb04..f35c2d48aad1 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -1,4 +1,4 @@
-From 2688a0238eaf825d6659c16c012db0c16f07e197 Mon Sep 17 00:00:00 2001
+From 064b74d5e19847794072781405eafe8dfbfca331 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Mon, 29 May 2017 23:24:42 +0300
 Subject: [PATCH] Really make -Werror conditional to BUILD_WERROR
@@ -13,26 +13,28 @@ cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
 [Bernd: rebased patch for 0.177 & 0.189]
+[Dario: make the patch to be applied with fuzz factor 0]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  config/eu.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index c2cc349ce876..99b368e09060 100644
+index e6c241f9d88a..cad1baa27a5f 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
  	    $(USE_AFTER_FREE3_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
 -- 
-2.17.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
