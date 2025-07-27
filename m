Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B8C87FCC
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 09:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3C5284112;
	Sun, 27 Jul 2025 09:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjBMKBIs01_x; Sun, 27 Jul 2025 09:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D484783C7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D484783C7B;
	Sun, 27 Jul 2025 09:55:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C0C231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BCB41072
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DppIRL109tAH for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 09:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCCE841019
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCE841019
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCCE841019
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 09:55:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4563bc166a5so20620405e9.1
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 02:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753610127; x=1754214927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/acHrMPxuChRD9SzBmqCAry7xKENS5pxIshYCJXJow=;
 b=o3SZpBbZeHWGCBLQP6dpJUZzgOaxQ9yh3KPjct5GDxWeXj9bZEs4dydyKXSo9+AlHk
 PICus6iWKOK36TZez79eDsp42aFaTOVb1S1WjZzeonc82vpmSVquXa1R+uZ2c5ZnEquv
 8StOokrNNuwNBRtAR3ye4+QHrvGfrHnnwxtRvVdrIaau/Kx2nwynx5bfrSutDcEAqh+I
 dF+99U0YvTCvHJr8nqYUXqjzDQ9RXbSPFXMkk8Ldc8dPn/IQMh1iFL7ZyTmbSO1tSb1P
 dr2dJjQkdsPYVopa6xQ7ZKVIP/gAqmZOBQvArG+0q3m/hnI8GctHbfd0Eb8gjdNYIEJd
 fmlA==
X-Gm-Message-State: AOJu0YwJfoYS6vHhTo00vyVl5mqlwgyzghCcUz2dyXHpGr3SBP36NL/X
 iphxeia6NyXiV9qEZOjBFm1t3ByRVRlxnTqD47rINuTD4qMj7o8l1PNzWB706amwghhli11hiA0
 JcnV5
X-Gm-Gg: ASbGnct7ieKQoAaf9KuEfRIdu09LEVaZfGaoUWLo5R0xJDxA4fxOvkIvf6Xr8zuWhXn
 S58ZREY4udqdcnXztXvjlQ47wnSJBm4LDGp/CFRR2AEANUMbqqN/3nFO7nCuQQvo94dmmZMnP3s
 X+Q/coriTG9idyvNf3oYshmKdtwPhzDtUpNjq/xNaaHDDEL0VBjqozkcNFhX6ThL7626f98+Fmv
 PqDD5uk/+E2hC16wUdDEwDqKgl0fGX8D/KbsrrIJLdvLY7p7PQPwXG5o0yfidyFHQRIZJfin5PV
 fEmOs0ykTjk2EvnmnQVYiuZT3EJWvGvgmOWtoqQCHSJYiV+3JX1BY7jp9DYGLIDMv1jqWUd++lC
 z9c6eOy0a+LoNkA==
X-Google-Smtp-Source: AGHT+IGAP+xRatEIttT29E16PVNKK860eOtwSwqR/dVVZnzyOcujspPSH9lidHbWEihOrCGXXmTWHg==
X-Received: by 2002:a05:600c:2e0a:b0:458:6f13:aa4a with SMTP id
 5b1f17b1804b1-4587050d95emr73232545e9.6.1753610127194; 
 Sun, 27 Jul 2025 02:55:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac65e86sm56952755e9.25.2025.07.27.02.55.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 02:55:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 27 Jul 2025 11:55:24 +0200
Message-ID: <20250727095526.1006204-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753610127; x=1754214927; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q/acHrMPxuChRD9SzBmqCAry7xKENS5pxIshYCJXJow=;
 b=gANQT278oVj76Ku8Y/LS//RSjGhJZM3wdIimzdag0660bTdJtJJldwWLG3gtdI2jlz
 Ibx9SGg9rXhjLXYQCEFekwQmPvLakktrseoppi7rJwZ70b2LPH5XchGvzBiTyaucdRXi
 /0Chrb7QcQs+1zlkQr4PWRmWzraXadEpxtNaD8+7b5K3kqq+Erzm546DSSRdWfV5RjSk
 5D6kDGNyTHa0jv5fJ2lOVg2Vrk1GCOogHudHD5fYun1X3aL34uDzdWHuSITcR41Pu9QQ
 h1hqNwYtaqb0JWOSm7qCvgLZ7osYvNawHSLthvmFYI5ZYBsZ6/L5Fjnq7cVthW25igRu
 Ag/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gANQT278
Subject: [Buildroot] [PATCH 1/3] package/orc: add CPE identifier
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cpe:2.3:a:gstreamer:orc:0.4.34:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/37DFA009-0707-4825-B28A-62451B1E2AFC

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/orc/orc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index b2d2bb461b..436dc9d629 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -9,6 +9,7 @@ ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
 ORC_LICENSE_FILES = COPYING
+ORC_CPE_ID_VENDOR = gstreamer
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
 ORC_CONF_OPTS = \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
