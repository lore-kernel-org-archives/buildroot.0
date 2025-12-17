Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCFD65C7C
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314CC610C5;
	Wed, 17 Dec 2025 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHC7lTfP8udV; Wed, 17 Dec 2025 17:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C97A60BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765992004;
	bh=PGe8lL0ymLjN+tEEpV2Q2XBGyzQUmP4AlplqCsIlG54=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3wXO83cuxTA7F/M7iOwFOV79puuKXn7jNzdVEVKArCNlJvZFrAUev1JykkJSpm7I
	 HJSAA8537eyd7uHcQC1XDi3I4UGWRfbfbDpizvjFbDuckMj2XneDVwW+sFvgO5iSwE
	 J3emTf0uFpXPP2H5zK/9pCW77G1qe0DIT6umlJC6jK759++JfulfCjXYdye/BVgrSd
	 0KPg/z7UpGnNw+sRGa0f+dsnKOhu4f4uXKxwVf1FMLQlYVUwCWh6iy9AefrC6b9TBe
	 9uWQtlPhyVOAlibR3oTnx25GjBrNz/rNXOxuYtlHTPlYZMwybmYqXWhd+xAerGdP7o
	 PEFz9ZHF0zWGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C97A60BAE;
	Wed, 17 Dec 2025 17:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E94E261
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C4C5809B9
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDLmglc1W1z3 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 17:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15657809A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15657809A1
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15657809A1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:20:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7ffa421f1bso144243066b.0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 09:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765992000; x=1766596800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4Flew1FKAKu/RkfNtU9Uy7ckGef9KPm/c1rKaIZw+zI=;
 b=jRjp2HClUmXiOswVWC/k7bNUc2uyIgVE47ZpTouTBFGsY+8IGbL2t0vY8VzrYyd2+d
 kCAtC///WgguSik4NbJTQrXNAr123YWvvRTZ52888dvD+qjLNdtR+xBxHtrXjabXI+zz
 jt8RwroKoiRa8phinikZ4ncJaXE7zqHK+d0VXxn+rbPpSHCvajvzt8QaTUs/afUgCKmH
 IOYiFVipdOjXcwcAsxZQ1ZUyV94H6aTsxUGvoz1ez+4nCrq8nkwzFY+8ukUqvQC1vJy+
 LF8NMyBQDMMZq7D+7pq5CIolTc5kU4wsP7l5DGDACgEqQN3UlZ8ZFG1mgXmouxfw6v4E
 xIKQ==
X-Gm-Message-State: AOJu0Yxexu0DRR1nQKmENn60IOZ4ph5t9ME8FrkyEVYFlVrf87gxF2ig
 GTfTRf3Tec5UhMJcnelm1eGcSvGTjCPhQpWEPYDadOt0tJIYi37BjVjeBSNLEw==
X-Gm-Gg: AY/fxX49822lyvlM8/0IbHLtdRpsqy9o92vDKPnD4mGiQFnHjD6XnA0oY/QcJNih1b2
 wnJHME6R03fdwvobpNV3GTzyLHy1chZuglh97+Ticf3ccdvp8bfRecEFjrwFoxBaGueN5WRH8wR
 lbaz/WmQZlYzy2P9EUKH1ehLCyoI2QxS6tiitUnZ4XLzsLFf2jvOXfU+9AspDfXNxxqX5LkHqhE
 F79UFHUmvEcgI63E9HGow3jggnuZ2Z6gShtJHOUwVD4/0kAKdw76TC8Uqn0CKX6o0NpqIrSCAdh
 PF9gtO1WWmAZfDeqpYtG9DxCwpl9pOmzVY7AsVoHkARQF4t3e8AoB/Bw3V/4iSm9QpT7MgnE2qM
 4lzbwEQqj+Mds6cnj/T+b59hKengq8ODqmAtgLKjUZeGYcj4Hewny4zVOGBmQhwyxTYQEMU6uyc
 uj
X-Google-Smtp-Source: AGHT+IEEy+Mq6drGwJ4Vhybnts3GocLZC8IeDH9h90rZKigh31n/IgEeXS3WL799/ru16IWAC/XwYQ==
X-Received: by 2002:a17:906:aa05:b0:b73:37aa:87c0 with SMTP id
 a640c23a62f3a-b80205decbemr9019766b.23.1765991999886; 
 Wed, 17 Dec 2025 09:19:59 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::b4ea])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b802095c11esm5286566b.31.2025.12.17.09.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 09:19:59 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Wed, 17 Dec 2025 18:16:30 +0000
Message-ID: <20251217181631.724907-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217181631.724907-1-raphael.pavlidis@gmail.com>
References: <20251217181631.724907-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765992000; x=1766596800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Flew1FKAKu/RkfNtU9Uy7ckGef9KPm/c1rKaIZw+zI=;
 b=XoQSByLxz/yuY5sBMI0JiclEzRBLQHbRKKHQKvCNEWgekQzfX76Hhmud9xRFFh9tEy
 AEmrX+pDxwMguPQSdtzKRJHcrfNG+GUZcyKMd4PFVNv1DUnMFG7EVyvqI3azyQh3ENjq
 WPFT0FIOXyE4CA88Hj+kJM0BnrplYEWRSR7Nau75i58kbcmMiWuwECuFMOU5VLFUEkM6
 GcuJtnp9p0M/8TQxXRJVitk6E6YOt6m1QgDqhfg8RT7d26HWxzBlEhw3mH4LoxaaM6Ai
 Cbk4RaCWqFiPHSBQcKDgvIB79UEdP2zoh/9vSS6TMlx8+fO2vb3dL67lF2CEJ2i/Yizo
 Z0Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XoQSByLx
Subject: [Buildroot] [PATCH v1 2/2] package/linux-pam: install files into
 /usr/lib/pam.d
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

The /etc directory is reserved for host-specific, system-wide
configuration maintained by the local administrator. Buildroot packages
should avoid placing files in /etc and instead install them under /usr
whenever possible.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/linux-pam/linux-pam.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index d25cf74620..5d69fbf5b8 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -31,7 +31,7 @@ LINUX_PAM_CONF_OPTS += -Dselinux=enabled
 LINUX_PAM_DEPENDENCIES += libselinux
 define LINUX_PAM_SELINUX_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dselinux=disabled
@@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=enabled
 define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=disabled
@@ -63,10 +63,10 @@ endif
 
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
-	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
-		$(TARGET_DIR)/etc/pam.d/login
-	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
-		$(TARGET_DIR)/etc/pam.d/other
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/login.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/login
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/other.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/other
 	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
