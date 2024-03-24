Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA88C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3646F81B7B;
	Sun, 24 Mar 2024 20:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SngMgLaeeeN; Sun, 24 Mar 2024 20:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A21A81B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A21A81B9D;
	Sun, 24 Mar 2024 20:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A34F1BF2C2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834DD40136
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9C5nb5SeL6C for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 20:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE6E1400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE6E1400D7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE6E1400D7
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 20:53:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41488d6752eso2329445e9.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711313608; x=1711918408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qu4eoZ3z+zViIpweh27QFUKlXK5puPTSx3zmWHz0MAY=;
 b=UtMfQ3jvlW+aTL2y5FLGOvbDFlaugVvIOTO+17FqDbEh50Q/tpPj5E0jZ6/V9p0OXC
 YUhvlNfm6bDvl5IyWFlYFC5rb8U0ZN3zM3RGQklS9wmUEEK+rX/gvICh8lQmM4FBSwGS
 QnBSSdwjIVhmgja5e1Y8FqWcmaZWeDc7YzGAqSFn7JJh4HnTqYU3lNH8Jf0AOHW5NcU4
 vXnWuqF1IVpzb8+duIp7BkXYaOxXMK69h+NiW7asrCnHPIuUyKt0Ldg4HjescCiYVbog
 yYTlpEL4sSihA3zKFFiXUncUH8GpJ561jNq38blICR4E4F8ESAlIYYomfCSeuBQ7RK3h
 sa0g==
X-Gm-Message-State: AOJu0YxWKJaod55fBoxiKVfe/0t8FTMBCm1AYdMteFokdx7kH9K3XL/D
 y0eYn6P1yFxxMsZnJ0XYuQ1TKF7NornDdmOHtyfZFkK7TwtJpNtoKEvtf7O/
X-Google-Smtp-Source: AGHT+IFcSh8liZQX28rH1UFLZnDXdoCEaoe84OWywtXQNONlDHa8SMkPdGrQ4BvYV+65W40Y4sLaKA==
X-Received: by 2002:a5d:4a4c:0:b0:33d:746b:f360 with SMTP id
 v12-20020a5d4a4c000000b0033d746bf360mr3739998wrs.51.1711313607750; 
 Sun, 24 Mar 2024 13:53:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b00341c162a6d4sm4463966wrt.107.2024.03.24.13.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 13:53:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 21:53:24 +0100
Message-ID: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711313608; x=1711918408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qu4eoZ3z+zViIpweh27QFUKlXK5puPTSx3zmWHz0MAY=;
 b=bSXy0B71TMrKDGrSLAP6nh08n1jMGUEdS6kllfGOKid9x7hrsZTM5lsOyZiliGHAAu
 lmP+cH1YF7usjoCLXPdGyQ0C17nzQCFQNVdU6GmNWSy9d+BLdv/6fcdILJB7g8uNElT4
 zVicdpwQ2ZFJztlNrQNHFdzvVgBE9ezi8BMm8H0RQIPpRQIGWhYlWGd9JdZH08WdtD/f
 WQ0RVZTDAZh9IJTOHaAAIwCrxo2XYcTX88NdDybmBoEPgq8c4eLkD51GmUHSupLfYIAQ
 FgOIfMeEhUEcZbfkj65tE1FbctQIcFWvbhlKjQcVo3Q8C7jcyekRsAiAUy91t8mQ8Z3K
 y4tA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bSXy0B71
Subject: [Buildroot] [PATCH 1/1] package/thermald: bump to version 2.5.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/intel/thermal_daemon/blob/v2.5.6/README.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 9693813ca9..fff5ae6284 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5  thermald-2.5.1.tar.gz
+sha256  e5a452624f133d71f4aff0bd0c8f8258399a5ae1a7d5aea177fa6a6e33dad1fd  thermald-2.5.6.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index fd0246745f..9faa47683b 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.5.1
+THERMALD_VERSION = 2.5.6
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
