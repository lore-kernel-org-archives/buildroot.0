Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A34C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C184429AF;
	Sat,  1 Mar 2025 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeU5JWGu2UHT; Sat,  1 Mar 2025 15:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E5842948
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E5842948;
	Sat,  1 Mar 2025 15:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6A31CB
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 861B284C44
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp8OdnDj_ROj for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBBAD84C3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBAD84C3A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBBAD84C3A
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-439a4dec9d5so32544555e9.0
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841546; x=1741446346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S/cJbkODMJCtASV4i4oN8l77hPCgLTyIb4rh/upZpZc=;
 b=Va5ig6VH+acBP2huQcWtIM3a/s2Wq5HH0qfKrit1JgDYJix2AM+rH8WHiQGt1HuuuM
 LwWgaTGLvm3FmdnT4moDmcnnKmz2S05gRxhQEniEln7byqSBv7XeWu3L4m9Q/JU8A2bY
 LrlAjCSIIcb8RfH++T5WighAbFVB2CfOxj4NDc1ZoSB6/QiWf0mdcCOpvvNLPwftvARZ
 R+UvkwL+k+CyUYrxWU4JYNutGOHMl8JAekbuDXRXPK+Uvr3GUIMd9JfwWuAvn4R5wq+L
 cGEedhDYDogQUOFE3c70Z4MPD9QJKzLUkr4WO131p4V8zWY0aaHjvXLL32sYBNm2aQjh
 QS6g==
X-Gm-Message-State: AOJu0YyKddUKUf31lSVIgwWW+yc+3KHm7ygEPStrgHGka1YX9idFQaKJ
 vzCR09YJ7xhqwlr/xa72QipqjgGFZJtwlsZM5l06+OPLvZ8Kg1MSofeUQw==
X-Gm-Gg: ASbGncvJYULlGy5aAZz+DS6BZQYWYf0wFNu0LG2IaGt1jnaTtlzoQLHeJoyq1+c7Sc9
 pkj0afly2lfygUdqUWvw0ARfk0/XpZFTLwp3NKaLO4Z0zivIaeJHWn53ex9+Zae0POwrf+VEXey
 jbMo/m6kGgo90Lr70duYSBic1h+bOPP4PIf63HxLiy9/7O4nTpt5SFMMeWTlC0L5SGQ7DRanniL
 V+gbBpK5iO3lp+E/KQW2aYSpFiaQ133mwn8lItlHFgAlQYQ7P5aU/0F/1hgLITdCpIniF3KRIo7
 4u7FsZ+y8oT8JgpfFdvKpGh5/GYZjlGLoAEtVJDlmoAaVhmySmDjx+w=
X-Google-Smtp-Source: AGHT+IFy4qzhq/EzW8fVYtmciYsxa9YFg/vM457j6j0coFd0wuI0DRdhEM1RTUmnJ9w/JZMV8jm9zQ==
X-Received: by 2002:a05:600c:4e92:b0:439:94f8:fc79 with SMTP id
 5b1f17b1804b1-43ba665be43mr87711215e9.0.1740841545732; 
 Sat, 01 Mar 2025 07:05:45 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:45 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Sat,  1 Mar 2025 16:05:38 +0100
Message-ID: <a70b9102b4b00d9969fa6fddf9fe1d281e939a16.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841546; x=1741446346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/cJbkODMJCtASV4i4oN8l77hPCgLTyIb4rh/upZpZc=;
 b=ADGLWMFJx3gq2wglKbkL75tYRQCDxOJvuNuOwu8zjsVYtAInCOUIw9PKjUViJLcRI4
 k92qBMo3qm98+/yeQyaVenMx+KWTFN+rjW2u+kIYV9x8Qt0IbjO/MpSdwQGHMZoO8hnt
 qiSfstR7gjm61JAe3gqqLpB2YJ3PFxB2BYPZw0VJNr6fU6hR1nBS3UT7G/s0iS8vOd/k
 4taBQ14DyUnR6owjWTHsREme4XnCBzoLefFQrU0xAS54XScpYA5VWDwD47AWfNktOQce
 G+37wJhB3DXgTibH5wa7679KizbbYlbfB2qPDiBh4xff0WAsN9KVTT+fP9nOGgI6N9Ip
 gJmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ADGLWMFJ
Subject: [Buildroot] [PATCH 3/9 v3] package/conmon: depends on systemd when
 enabled
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

When it detects it runs under systemd, conmon will want to log to the
journal. However, it needs to be linked with libsystemd to do so and if
not, will error out:

    Feb 22 11:10:03 buildroot conmon[199]: conmon 3b462ce6f2cc64f75c42 <error>: Include journald in compilation path to log to systemd journal

This prevents starting any container.

Add a dependency to systemd when it is enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/conmon/conmon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 1e57786686..ed1a2554fa 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -18,6 +18,10 @@ else
 CONMON_DISABLE_SECCOMP = 1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CONMON_DEPENDENCIES += systemd
+endif
+
 define CONMON_CONFIGURE_CMDS
 	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
 		$(@D)/hack/seccomp-notify.sh
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
