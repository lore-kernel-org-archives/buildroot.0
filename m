Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F008EC5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 09:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689AC80F85;
	Fri, 21 Aug 2026 09:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWNnjq-fW2Jm; Fri, 21 Aug 2026 09:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787304912;
	bh=EJyOdtHL+37GFIagnZMObHyWUybghEQ7KK8TlbF+BZk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tDUAbqKCaTls7tJQwcC6SyATnWdYHRQcNWAlQo3mSYLxSuunqiLPhcU12h8ROTKUq
	 iZ02nTqs+iAQwHh+HfX9mwjF2z0sxIDL10Cht6rAe0ID54/4KSvY9hbIZ0l3SZQoeD
	 jcgznbYSrPjv+K2C0psRsVEAxJ9gJy1eKR7tD7M/76pv01g2t7/l9yTpXiu0JVb3CA
	 p+lxCjxYfH49QPzDVJpTRxhPrlEsue5AYURsZ/2MfQZhR0ScOBwNTtOv3Q66neKkTA
	 dPgASRXjYpsuDuXmmyFtIhIBwqPo4rZzwfypAvIgJkkoPsht8l/OuxkDNIwhp0cPCd
	 XwaSK1QE1SYkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0A580FB3;
	Fri, 21 Aug 2026 09:35:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD0AEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04AA380F85
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id il76UQVNEx_A for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 09:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=O8LEOYuv
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A421480F1B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:35:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a3819e8be8so1669056a12.0
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787304904; x=1787909704;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uoMrk1Mu6ItjUpiPNqq56pAzgYtk0UzomDf/PkG9Niw=;
 b=O8LEOYuvRfWwwfee9VpHfwQLBsDdFExziqEMr7kjkl0WVObC/dMBHfWikEXnjiFYra
 txksga5Tun6X0bb3Fz7V0HHDQqqalRFOsgnts34KtD29Gw2LrUMdoQB7nnQK/bcyZZkG
 PRdkGCJurMlqUHGkOsXIMKZK6bWv1jny0+o2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787304904; x=1787909704;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uoMrk1Mu6ItjUpiPNqq56pAzgYtk0UzomDf/PkG9Niw=;
 b=sHUUiyu3p75hlGWjDnJNJlFde9zBaloozVZ8WhmoiwC57qf4InlDFglsOEWwXMEChT
 xhKgrioP4SSbLibc5qSQ5z755IIEyiRyddRfjRbkinzdfylA+VOhK6j3+A7E+NsCk1Sm
 mCZqmeQ3tWauyqTamSdEHZTSSfRJvzYBY0WpPJwazxLNekqaQqgDmQu50ykV75tV0TeJ
 OCWJ4n/k1owgM5YzZWKEgNERd+nxK60JNJX5MeMx+VyAFkPZ4IceXbHTk+/t6d1pfbg9
 M6jmjd93UyEdv8iyd6WvHPWAZDp7DCgf1RggTT7Vr42LixXQsYuFtbP4mROMG8KSBL5u
 n9WA==
X-Gm-Message-State: AFuF++mQXczb+RZAgXQl6Lu6EqaoKqudLS49G4X+N3XC/1+Hfh9lcymf
 Q4soXs3YCxAetk6MgQ6hdB72rZp8peRYBZYhWGCc/bNKzbFeaL+9AT2AgXdWPq7Sq3vY4pJjJ2X
 +5Vb7p+I=
X-Gm-Gg: AR+sD13yiIQAa8FwWovLib0+B8ts1xZ2J+afNIl5EHmcZJ3qvhaonyTSY4vfrvtVEJb
 gqQjDulN4hbg2O//eXfdV6yc9j7C/de4uFsQbA1Tr91Y/pvAHU9gW6I9E4f9rxIfNrhZn+Um9GW
 WXyNhJ0uoGGhgdlbrF80R27pCVihb1mzguaLzr1K2oBUcPYt7Iy77RYdmtsgh49CcSK09w7B7+o
 +karQ9CbgoOvl5aLbLAB9wc5wg3b9RziFOS7uJJGkbl0LbvkK8oMEQBB7kc8ptcrnF0xC/QAS5L
 1Wn180qcxqck4NwYqFGeHOmlW5DUOLRABTA8HnetRSF3ivMweX3Rkw5N4tVhdN8Z0s9k0KhCOip
 PrP89xaZK7FRvFPHP6chApKumI9y84UAt0hLwZqIt3yoFfda6DkO6ycZo6/JNaXKEePhKVbjjZx
 vRN29joRkdT+3SRL6is/jnEtOqVxhdYsIH92IRrbQBfcWhB+6XdDJZzU26+3zQxz4fdAY61Cv7I
 1YKUMvRLgVKdExNJgFO22G+gKPfAz2oluxAjEiZWAvg06VTtUrKbw1lwS9hsQ==
X-Received: by 2002:a05:6402:2187:b0:6a0:a46b:ad3c with SMTP id
 4fb4d7f45d1cf-6a430b6cfeamr4114727a12.1.1787304904233; 
 Fri, 21 Aug 2026 02:35:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([62.18.158.133])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff177b1esm5719137a12.29.2026.08.21.02.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 02:35:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 21 Aug 2026 11:34:57 +0200
Message-ID: <20260821093457.1384807-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drogon: fix build with examples
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

Some examples embed CSP views, whose C++ sources are generated at build
time by drogon_ctl. When cross-compiling, CMake looks the tool up in
PATH, so the build fails with:

  [ 77%] Generating HelloView.h, HelloView.cc
  /bin/sh: 1: drogon_ctl: not found
  make[3]: *** [examples/CMakeFiles/helloworld.dir/build.make:74: examples/HelloView.h] Error 127

Add host-drogon to the dependencies, as it installs drogon_ctl in
$(HOST_DIR)/bin.

Fixes:
- https://autobuild.buildroot.org/results/b8f38b0645932cb5506515d6d313b64d824c8ce0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/drogon/drogon.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 89b1b2720c7d..73388ea92c34 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -41,6 +41,11 @@ DROGON_CONF_OPTS += -DBUILD_CTL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_DROGON_EXAMPLES),y)
+# Some examples embed CSP views, whose C++ sources are generated at
+# build time by drogon_ctl. When cross-compiling, CMake does not
+# substitute the drogon_ctl target executable in the custom command, so
+# the tool is looked up in PATH and must be provided by host-drogon.
+DROGON_DEPENDENCIES += host-drogon
 DROGON_CONF_OPTS += -DBUILD_EXAMPLES=ON
 else
 DROGON_CONF_OPTS += -DBUILD_EXAMPLES=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
