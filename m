Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA05415B5;
	Mon,  6 Jun 2022 18:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoNH0c_1n726; Mon,  6 Jun 2022 18:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE3041496;
	Mon,  6 Jun 2022 18:43:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BBB41BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A9DD60D4C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6d19QJgQqTe for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:43:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB13160803
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:43:39 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id s10so7658365qvt.8
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iqu941lzTAMX+oaALcJPphLtVNbm3omYD1fanuV+3bQ=;
 b=UodjcFvV2gT88Pd59oJsueHKUtddZZ4+1d6GaYSBAqRND/g6Tebt6flUgNZE3YQzSa
 F3A5VTAT4ipV3OC2X8abfr2sbYaazV/lj9+QiA12TMb0f8IE7a1M4ktkKHtSAOyznb/l
 4peHVkEaeYnoZ2bbEIXTAux063xy0dGiSA99yBhf3BpGlTjxqrM1n5Xfdj4l5+kXZa1E
 ff2rWfcAqrvjJI0VXo0CscO1pyNrGb/zu1sf3Ig2mF4zQgbd0Q5gkBTwB0phkPpvNCbt
 YG8J6GaNA+jiy/oDKvuxpKLDYmk0C72RwLBS6xWWa+0vi/NejRJm7aBNFPJ2vJntcMdJ
 q+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqu941lzTAMX+oaALcJPphLtVNbm3omYD1fanuV+3bQ=;
 b=DTztqv4dlOOPC3/6+3OS+Sbg0DjWeBam+q4dxN0T+1SLyBHsAi7PQ3+3Txc6688K2Q
 3KgaebV1AWNg2asKNPoAGf/IfIxOKwgRQZZFxccKMYkbL364wp28z9xE9HAsDhv+SVM9
 cXnGokhb3NCIu8m2oVmhaSgrqPsT0KBi3PLBhtihWcDiJgaMt55fg7fw+C/97/QjVL69
 q7DTz/WiYjF936DIet9x1FykM1JKj4iOUAuFEbISgk4KXySOc8qamlmrw8xvu9jabou4
 aEIcaZnNORC0RSW3Uux/V6YsJQ2tMoRscccQLT0fA2g6S+Ob5m4bqk7Bc7Pu/ppag3tA
 G/2Q==
X-Gm-Message-State: AOAM530iyCx6EI1SH1Znqjhd+DY1+Wht1AZA18FFI3ynpGtL1tbBtS6q
 dAKxiHbO7Y4gl5pAAW/BA0T5M9nFV9/QlJuZ
X-Google-Smtp-Source: ABdhPJwoShGMRMlJYjLu9vRtMwQxGGavqGckxG4fAGiXtj7kpfhe/jvkIfvxjN9skw/is88lRlD7ng==
X-Received: by 2002:ad4:49ac:0:b0:46a:effd:fbd0 with SMTP id
 u12-20020ad449ac000000b0046aeffdfbd0mr8605728qvx.13.1654541018754; 
 Mon, 06 Jun 2022 11:43:38 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a291000b006a6bb044740sm3584880qkp.66.2022.06.06.11.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 11:43:38 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon,  6 Jun 2022 20:43:19 +0200
Message-Id: <20220606184320.8210-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606184320.8210-1-petr.vorel@gmail.com>
References: <20220606184320.8210-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] kvm: Fix compilation on x86
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
Cc: Cyril Hrubis <chrubis@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Li Wang <liwang@redhat.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Martin Doucha <mdoucha@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot supports i386 pentium toolchains (br-i386-pentium-mmx-musl,
br-i386-pentium4-full) which fail to compile because as is run without --32.

Suggested-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/kvm/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
index adab56952..8d5193d8e 100644
--- a/testcases/kernel/kvm/Makefile
+++ b/testcases/kernel/kvm/Makefile
@@ -17,11 +17,14 @@ FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
 ifeq ($(HOST_CPU),x86_64)
 	ifneq (,$(findstring m32,$(CFLAGS)))
 		HOST_CPU = x86
-		GUEST_CFLAGS += -m32
-		ASFLAGS += --32
 	endif
 endif
 
+ifeq ($(HOST_CPU),x86)
+	GUEST_CFLAGS += -m32
+	ASFLAGS += --32
+endif
+
 # Some distros enable -pie by default. That breaks KVM payload linking.
 ifdef LTP_CFLAGS_NOPIE
 	GUEST_CFLAGS += -fno-pie
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
