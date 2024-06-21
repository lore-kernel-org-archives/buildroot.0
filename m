Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7032C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CFA45A57;
	Fri, 21 Jun 2024 16:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZu3U1Q6WGoS; Fri, 21 Jun 2024 16:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5935C45BE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5935C45BE9;
	Fri, 21 Jun 2024 16:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 422C41BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 279888486D
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfQuZHi7c-F1 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0324984326
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0324984326
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0324984326
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-362bc731810so1984391f8f.1
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986262; x=1719591062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4zwgpZCPj7Dee+tJiG+ItzrV6SyfSs41zr7fma1DVA=;
 b=oez5y5izTI5b4YZMTvoJ4Dpa0vSsL9qhWREEbzFob+h5Z/VhTWBo5usVPs9lrmG3bR
 vz1Acb/qSYkQT/1xkitwp0v35P2miA5FdScpYAkS1SjlFeEjKwVMGEmW4R8GN4M4IRjA
 Lr/ia7z/C8O35+AhfL9w9NCYanJBZdGB4OkfPlP7hSsPMjXGLTXvRmW+Jy6lySfQKflM
 TImGuIPdOXiemDn4jC7DEytfDhZqp16V7QnmT1oRP7iylIuetlROEAVLT2Pi4Ve860sv
 zdgjhRbCSEmovjiaPxtbwamuE3HMzRluWjRxCUXAm9EHk6b1IAHBegRdtJX0ZrETXlTQ
 OR0A==
X-Gm-Message-State: AOJu0Yy4V1v9tdwTR82vxu0OgXD+AKWvBkAnMq5OunGq2CVzUSELlEPF
 23lWlDi+Kda4VqIvnRPuz7qawXge0KIu7qRuAJJIHNtOtjJpFBxTOFBrvnVGvsY29jjB0JHUjE3
 r
X-Google-Smtp-Source: AGHT+IGMzFoVbgqetJDn456+1B9dQifazPvrg+fe4hY0+2BNfxE2tecJrSZDZTmdFnHBIqprw6nNRw==
X-Received: by 2002:a5d:6148:0:b0:362:f396:42b with SMTP id
 ffacd0b85a97d-363192d088cmr8336656f8f.51.1718986262433; 
 Fri, 21 Jun 2024 09:11:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:11:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:48 +0200
Message-ID: <20240621161049.4085310-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986262; x=1719591062;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4zwgpZCPj7Dee+tJiG+ItzrV6SyfSs41zr7fma1DVA=;
 b=EF1a0D6KQ056KdtPyFa9ee7DMlaqmXBR9LT0MdRpncsi1Q3OIDFKp6NF8D9VTF549i
 s6dhefKoZfMPR8cvDjmKHlQ7gdfhjY9fQIv9jnOaWH94YZY8JNyznEWt6bnMUxkmPWYe
 bgxZGeu9q4xYP0C3yNBzmKHnLrkI8T8nN4oHg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EF1a0D6K
Subject: [Buildroot] [PATCH 5/6] package/libopenssl: no-engine
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though the "no-engine" option effectively disables the compilation
of the engine, it still creates the installation directory, which ends up
being empty. For this reason, the patch does not remove the hook for
removing the directory if the BR2_PACKAGE_LIBOPENSSL_ENGINES option is
not enabled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/libopenssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index fe472e2c7a19..89a9189bb851 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -85,6 +85,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-afl \
 			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENGINES),,no-engine) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
