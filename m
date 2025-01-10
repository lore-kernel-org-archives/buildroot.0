Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87BAE7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CF140B67;
	Fri, 10 Jan 2025 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXVbAhBqWgoz; Fri, 10 Jan 2025 19:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A263F40CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A263F40CF7;
	Fri, 10 Jan 2025 19:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7776776C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5751960E80
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhO_ehUX5BXx for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A50060D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A50060D9C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A50060D9C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso24121735e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538850; x=1737143650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYj9uLWmTRAqNGFOYNVW+HkkKeXOYPCJ5dl+x3TpTH4=;
 b=Y4I0Rt0Z7sa+WwTlOGivE0fLqrII/qKzynKbYS5h19bx8L607BfUlMsjIqxdTwph4m
 xFRe4m/Wjm03f87QWr0QklK2W+PdJ0hLldlmOI9oIAcEMVGBNOXUQ8IDOaL9Jn3/YECs
 tJ4QVNxuEJGk5Kji1Y5huaVd1AwagvY9GeL8Yb4hxO8onOh4FsS/qApW/Zzhk45Sq91K
 gNcfmSRb1rr/j/tssr2cJmqurjfqTHyzb7xpUZeCQY6ZYGZR/b9q9OWvqGUajBZD6tTL
 2YH9aj16mo9BqPpAuWF1GmPi+aSoeQW0Ct1LMPhvEqBbfSsg3U8hw3wHsE1Emvh8DLQ1
 hzlQ==
X-Gm-Message-State: AOJu0YzBNirAnMEg5lYYfuRQKAAl3rzuFxoRKChyrCkJPnE/AG5n6rGd
 sd+tkB+UF17DJWfg0PSwxujZ/Ww5Y8H4lLH6a0xseG/5uzUteYUv5P0VfyLWTK0SMMcoLvYf8fW
 8
X-Gm-Gg: ASbGncssU63fh+VsZSbCFh31Gd6O/EWaumRxHIF3tIztaYdeuLrVy52cDQbd/IiVExB
 OCpGpni4QJGIsfjfRQn5XKCjQz5jYUtSj8VPDZ3tYYOBMkH9y5H4dd0tdsbAUYZDuPtnJnZ3ame
 OcTmwhUHqLYi56jeU0miTtQ3A/jLHEt4GzADXAk+0XhMiNqq2Pb8N7ua6e33LXtA4GH53TSEArk
 0RwKsh775ckLbOFjn3jQeW45s4UvGyv6CkAUSf/etqtLxXonrOOpDNCcouWLuhiquMy7vAnad3d
 4ZQtXpF1QW7NSGff2LJrp1SI78x7tvLoNQsQYLDWK6KleSi3WejiBQ==
X-Google-Smtp-Source: AGHT+IETfRNmffeUcrc/e4sDBbEIb/PmgIQ3KDo4pii3rqw636EprHKxaaZaikONaK8kvP80q2RAqA==
X-Received: by 2002:a05:600c:4ed4:b0:435:330d:de86 with SMTP id
 5b1f17b1804b1-436e25620e7mr120677725e9.0.1736538850200; 
 Fri, 10 Jan 2025 11:54:10 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:52 +0100
Message-ID: <20250110195359.3358022-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538850; x=1737143650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYj9uLWmTRAqNGFOYNVW+HkkKeXOYPCJ5dl+x3TpTH4=;
 b=FC+LbrxJY5CFyaMApfNMu278TGv9bYuWiwTit8+Lw0MMy6Gi2oPSF3G/3Iw39mhmFB
 QGuB5UdjfzOTl4p0RzMK7GYCpnAivb1d7qC1juPQYlM599TeTvnLAz5+vWAlCT1Tm7sJ
 YtiIZXbmz4Tng+60PFW3yy+Qax1s62RJtYjHo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=FC+LbrxJ
Subject: [Buildroot] [PATCH v2 05/12] package/gcc: remove nios2 handling
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot internal toolchain backend for nios2 was removed, so
remove nios2 handling for gcc package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b39ca8566d..658f5a6b4f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -293,11 +293,6 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
-# allow to build gcc 14.x
-ifeq ($(BR2_nios2),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-obsolete
-endif
-
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
