Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E4C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 09:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6EE140F84;
	Thu,  3 Jul 2025 09:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPBrbwc743Cj; Thu,  3 Jul 2025 09:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD20B40F81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD20B40F81;
	Thu,  3 Jul 2025 09:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B0475
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 09:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AC6080C5F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 09:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7F0IW90ejGg for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 09:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8AA2839DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AA2839DD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8AA2839DD
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 09:11:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so3245466f8f.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 02:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751533903; x=1752138703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1EoAOZKiCtwHlc/Y3KjSTiVOhHFnK2+U0fSnIGkO164=;
 b=IaqMZ8V+xRH9cvJZ/CB/Zrg0/ccNyl4/RDmt7+hok/P0mIy3Nrl7/ukvsqeNYs73Q/
 64RlbJTaUWpdV0Paq29DCJupwG/IzXhEHeVvU7lqnEbsjlDbhyMmCc3HJnjkwuG4J5wx
 iMLGkroVdN2/BNNAreajXdwmmntyX8LQa0u7CRvkJetjtfRIOtd6biAoNtL4JkT1g9We
 Tu+3fCZFGtanT/9F4yg5AW4XSYneexu28lA3Kdnoeaks7tpmEUJayo9vNYsdEYI83mmY
 Ldh5kksXIwFnvS8lt5QEhAkIZ7m644zFJPDtzf43ww47xp552y/15FPFNqUsMwCsXEPN
 ly1Q==
X-Gm-Message-State: AOJu0YxehZ4+K/Rs9ab3YPUNbWK2Z/CV51f3P1KTFvL4z/hHAcOZu6fQ
 u1RQ1fuOH701iuOm43cMYQDtqYTNPWAByRmZR9KB0NPNCfiO74YlBXc5dG8SJGa6Tv1GpEj1PI+
 btfR2
X-Gm-Gg: ASbGncu3JfxrVtyjX1Qm5VLaTSKf8DobWHyUCQj+Wr9UVGgGFehOavssbBYXbS5SbPm
 jM/9UVYScF0dQD/Ma3+1SSav6XgZ4a1BQLCqu9JJbT+POZlfJSl4X+llhNvCiHzIfGj3GV8uqQg
 +0Or92sCU3/t9c7Q50dHeXUr3RRw5BNu4sHDvqVXqUgYJWO5pslsd+F+5lLZgYJm1H1XSrX/d++
 4TESMQwkym7UZrSTM2nL9qWGNymiEl1tclKTBSLQ6G/H0cM6Udk+pcoXQ6/2100WLW9qI9lvusp
 ckz2rbvskir7cxrgARodMJGzCz5yFI3Mi26QiLa9cHvOKZA5K4RkS4yP/izQSB3wLI3k/6ZwntN
 uarYa+lYX/yeRhZuySA==
X-Google-Smtp-Source: AGHT+IEu6lOZdCbEiTjbDElgf0i5r6LvlIizuKVGTI/z+oawE4hw04b6N0EDr6KLwxCbaBFJtbdw5g==
X-Received: by 2002:adf:9d89:0:b0:3a4:c9d4:2fb2 with SMTP id
 ffacd0b85a97d-3b32e337208mr1757006f8f.46.1751533903037; 
 Thu, 03 Jul 2025 02:11:43 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e61fa4sm18182023f8f.97.2025.07.03.02.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 02:11:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Thu,  3 Jul 2025 11:11:34 +0200
Message-ID: <20250703091134.1716980-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751533903; x=1752138703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1EoAOZKiCtwHlc/Y3KjSTiVOhHFnK2+U0fSnIGkO164=;
 b=f31tvzOTHoLOtL7YQuBrYVZhz+pkY6yqMujdceAkipI4xpLzmjh5toqK5eXb0HkFNE
 vxoGsq1qoMNI2XDRBOltLseBhQKGSuBq2Z6S31f2JreP+nuiIOzQOELWCC4GhG8R/Qu8
 Lzve8IC5wyWIsBsfyaEdXYFuBFMxHFH2BkTQ6zuYUsXFivFz2hHuMgZL5G9jANR11JoU
 6o234h4Kl9Kx1c+N+JJl34C7Oa+zmlwGQtdEJY6T4S8SeWkehTl8RIDdq7nD58ypwoGR
 IbkL1k7WXB9lYBL3AMRNcNy7iKYn970lTnIepCRUpr/yc8FNiOHHgLVQVGdznv/ofB4Z
 OAXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f31tvzOT
Subject: [Buildroot] [PATCH] package/php: ignore CVE-2024-3566 that only
 affects Windows
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 01166bae64..a049d90fde 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -15,6 +15,9 @@ PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
 
+# Only affects the Windows operating system
+PHP_IGNORE_CVES += CVE-2024-3566
+
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
