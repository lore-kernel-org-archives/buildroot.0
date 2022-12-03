Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE1CC352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DAA40356;
	Sat,  3 Dec 2022 15:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DAA40356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly8Xz6vkTJMr; Sat,  3 Dec 2022 15:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB964035A;
	Sat,  3 Dec 2022 15:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB964035A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46DC91BF59B
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 15:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21FC9818A2
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 15:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FC9818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctQ2Hq0f0C_4 for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 15:56:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCBEE81A12
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCBEE81A12
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 15:56:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h12so12281105wrv.10
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 07:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5mQYed5ex9jDEO9ZUgxkIlEmeEeFGs9V+iJhy7ngDc=;
 b=lw1ZcN3cR3CKVlhzBBwR/2CwNIRvBaf4EplyrMSzO2Zx8ltu+gNOl162PUcoNsJyhe
 LnIKc0bH8fVcFMuYj7YgiFSJjlrpZRpDCbQBPHje9wuBjYjlIkyhGQeMBw2KOu5kjKIa
 gSbwJC+7gbj+6/PW7KIwrJ52TzRTo1iwpc9ubnxjAtlgD8B7oIqDm0LSCZJ8csPQToCL
 0isLhztnMtElXPznoi3panYimL6EjYDj3hLtW2HAT6r2lNSQWL6orHwN/ndDi6toSQU2
 6yhwBu7ZAp/LTlBTE+2JjZMO+vsfB/t7WwBkyGopnS7+nZ88boLDiZcbtZHM7yAmvgMV
 ULUA==
X-Gm-Message-State: ANoB5pmMHo/lX5bo80HoTPDy8qZ1buMRHvoBIMX1Zpc6Q0bIF4/U6TDO
 6pCr085YqaWtfo640dol3EZYqebHx8k=
X-Google-Smtp-Source: AA0mqf7cUKq0rNndlfhZZhMz6c0WM/W7sTPrSmoUEFMSy+PVnwm5316GqwgLqnbap9wVh3pbX6qyMA==
X-Received: by 2002:a5d:5a0c:0:b0:242:1c5f:ee55 with SMTP id
 bq12-20020a5d5a0c000000b002421c5fee55mr16815374wrb.712.1670082958577; 
 Sat, 03 Dec 2022 07:55:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003cfa80443a0sm11949475wme.35.2022.12.03.07.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 07:55:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 16:55:45 +0100
Message-Id: <20221203155545.48559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H5mQYed5ex9jDEO9ZUgxkIlEmeEeFGs9V+iJhy7ngDc=;
 b=UCMXhE3VQz1UzsUXMKktio8zQkf7GEeP+v/qFzfxRFPDOXAchf+6jp50+/ma6xOFJn
 tmmMGyznU2gtImcs8xNG0PtRs+4t7y+/IazZa0fVzslTVhDXJdu+gNGGjIJ3d9IBikxQ
 mzCGOGtMMxtqxd+hkKhnPabWI/uOkdkumTXvC79wmzoBwh7Dw9cqmlJ/g7FTR3v9N0eb
 bnTfI2SpaXJSZXRiKioRqqYS3o6gPMgJo2BqCSKQiCP8SG7FSTR2UwNm1DNHSEiO7x3X
 hmlNZUOZz1HyilXptyxr2GKoEwSpILqPjEsAqFY1vuUV2+DpCIlRTKDdf6YzG41bpudi
 UgEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UCMXhE3V
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix static with shared
 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_SHARED_STATIC_LIBS is enabled, both --enable-static and
--enable-shared are passed to configure. memcached configure.ac only
looks for --enable-static to make the build static. But when linking
against openssl pkg-config only returns dynamic linking dependencies,
resulting in the following build failure:

/home/thomas/autobuild/instance-1/output-1/host/bin/aarch64_be-buildroot-linux-gnu-gcc -std=gnu99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2 -pthread  -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls  -static  -o timedrun timedrun.o  -levent  -L/home/thomas/autobuild/instance-1/output-1/host/bin/../aarch64_be-buildroot-linux-gnu/sysroot/usr/lib -lssl -lcrypto  -ldl
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/11.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld: memcached-memcached.o: in function `conn_new':
memcached.c:(.text+0x1668): undefined reference to `SSL_set_info_callback'

BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
static only build.

Fixes:
 - http://autobuild.buildroot.org/results/363c84eaa69350e02bec0b35b88d4bdf4dad804c
 - http://autobuild.buildroot.org/results/0bde41bb700100d8df5ebdb1b64dfdc76c7af475

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index c7d89054bd..7b4069e820 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -29,4 +29,8 @@ else
 MEMCACHED_CONF_OPTS += --disable-tls
 endif
 
+ifeq ($(BR2_STATIC_LIBS),)
+MEMCACHED_CONF_OPTS += --disable-static
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
