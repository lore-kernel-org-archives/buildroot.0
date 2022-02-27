Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10506C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 10:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0FFE404EE;
	Sun, 27 Feb 2022 10:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbW1lfyF8yaL; Sun, 27 Feb 2022 10:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C535140165;
	Sun, 27 Feb 2022 10:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C25571BF2F9
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE00382894
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRmp2Ro9J4TK for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 10:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDFC4828A5
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 10:36:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so4193199wmg.2
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 02:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jjm5W9xrvzNW5L2Z8QYppLaLNnNy5GoF/rZ9yDZ+jvw=;
 b=V3XnqYAADQAV2Pq3YwIgJmv804h2ExAKDYWroSiftq6YCFbwBXAlB/bIFsCoKYIOY4
 Hz1rzqZnhm+9brPQjfxgzSWC4sUAjHEohTnkZxoUwr5ClbqxnqvXoc6QLdHh7DoQb8Fl
 sofrWoP5QyQjSOVag6V5JsGZcit6WCofh3OVmhq6c87J6HrGYI/Q4J6VK6G8mICpULPT
 13TGLkfHgRzvD17RUUK1JdJgKynriYeiIRys4xgK5omBzQynHMsVvJsbRJsS3eNgMQ/E
 xGddzceODdKjL/+bprte2jR4IlWHS0SiTkrPcwqUruhSBIHghdr4AquhLeN8gcI2oZnl
 ordQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jjm5W9xrvzNW5L2Z8QYppLaLNnNy5GoF/rZ9yDZ+jvw=;
 b=LuoMdahkcCv4O2XI6GqZAvygB9FvEgf8Kx3KNaF364hknKjktyDhd6h1TSxVN7GAoH
 f5cZgqhOsIxvKg14ZM50Z2GuP4X8Dnkz15ypKAssHtJyZKf1WWst6hWL8nfy/IsWABse
 6EXhs4KK+aPAoyBaIA0kmLCbdAHAp2XGxWyQt5X3/BNiy+Wfb8YMDwAo3WwvVAVN5JOC
 kBrskp/NFFlmop1k2INPwpne+AU+YMtv8SA/DRQLpvhetciFYNv4UaB8NeXYgKg5w/fl
 3jubYYCY0Y5yaIw3vOLo6KARhDJqrFalFfDERPOffYlloo2rFGeXPJVOgHrLeHjM0snI
 3GTA==
X-Gm-Message-State: AOAM53216TLFYAO9QVyq1HtzM7GVP9zeJQET3RL4TWPQlBa5Qw8qUL7z
 eX6ngNtOTfjhD5OcaNqGpTJQPJcrQZ0=
X-Google-Smtp-Source: ABdhPJwOxWY5HIbrldI4IcpTXrkhIEI6sY5fmeyyHBiTEVQhu6MbZXGFH8uaFXNmChRRqTPiQNfsxg==
X-Received: by 2002:a05:600c:3d96:b0:350:3458:aee8 with SMTP id
 bi22-20020a05600c3d9600b003503458aee8mr9244641wmb.146.1645958171776; 
 Sun, 27 Feb 2022 02:36:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adfe5c3000000b001e68a5e1c20sm7293835wrn.4.2022.02.27.02.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:36:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 11:35:28 +0100
Message-Id: <20220227103528.3888282-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227103528.3888282-1-fontaine.fabrice@gmail.com>
References: <20220227103528.3888282-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 2/2] package/valijson: bump to version 0.6
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tristanpenman/valijson/releases/tag/v0.6
https://github.com/tristanpenman/valijson/releases/tag/v0.5
https://github.com/tristanpenman/valijson/releases/tag/v0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index e184ccb7c0..0aab93dd2a 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  2ac881a36f90810b41b66511502dea1e7886137ad31bcfb4e917d929c5028c35  valijson-0.3.tar.gz
+sha256  e06bf78fc1d26d4956fabc182408ebbbc47e3a6699778cda4aa439c2a6110b09  valijson-0.6.tar.gz
 sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 71c5b05f2b..4b1f722f77 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.3
+VALIJSON_VERSION = 0.6
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
