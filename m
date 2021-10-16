Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0374DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6901B611AF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6901B611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F8C400A4;
	Sat, 16 Oct 2021 13:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oY5mzADi-dyS; Sat, 16 Oct 2021 13:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CB23402AF;
	Sat, 16 Oct 2021 13:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6AA1BF2A1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30293403F6
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sf4um1T12v9G for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 13:56:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1651C403D9
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 13:56:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r10so31445923wra.12
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJq9zVpM1ydL8cDcvO69xXfVuWaBDXHAGb2x/awlsX0=;
 b=AghRdBFvvXvdevi+fCb1I7UhIAZBSHzbXc772ycgz+Ubhyh+X5bSrhJGtFauiwzMnI
 2rwfQIHq8iymIq9aAgpJU3PvyhSP0Eboh0LCJM9Gc2CR/3lBxR5UQJST/IoGaWtz1/0U
 MgZzltem6LDtB6VS1XmQDFt573CMdJOpNHuJvOe9EVCC2zo0geTmwYjvr71JKGQikRw/
 wJda9mVCwYJxgrvKakUg3tTNXq52O1AAb5tFAxgyCmRKRUuzXisMJLp09YUIp2LUWn6C
 Ft8PGCvafu88T7MkH6L0FNubBa66wavBrloAuUpA43vS6aevQTAZ8hFa556Rjd75NiTu
 dbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJq9zVpM1ydL8cDcvO69xXfVuWaBDXHAGb2x/awlsX0=;
 b=RmqlaLajg/aFmT46+Lg6JNLCIgSvwcTJJjL7r36+i2BKdgIY1pL8VIeod4JKwEOJ7M
 HWeCglKlZFAJCxs3S11DW8NC89YDSvTM1/c/qR4l87Fznhzd9Rex1t3YW2Y5oqPysOyN
 A3Uha6IhD2zBIJcoV+15r9sV4GUMsiRs+HoiZpbAFa+iI9Wi6dPx6pM5VoVBwWvI2z9c
 2hpROy9y1UjnKaXsyBCwf21AI/vzBUfat0f+v2WG+zzkgS219daKQLcZRDF70ZeRha1E
 29iKZiUxAporofz0KpVjiM1zLJg5YLlMHAlml0/sVxgpT3OuvAn9pYVxdz1tEdDBpZGd
 bEug==
X-Gm-Message-State: AOAM5327BTziSmGbKlNhL3dCLuYHd3th6nptRWWFHRux5IDMo9+imuTq
 LjItld3/xfCp8y4rR+1n3mtX0y1+gzs=
X-Google-Smtp-Source: ABdhPJziDs8rLo9ZhEQlY64O/Qq1dTCpDUDdffKJC82xvZgqU9x6PFQzicdftT8I9+V1XGcKMwTMkg==
X-Received: by 2002:a5d:4c8e:: with SMTP id z14mr22015582wrs.157.1634392614072; 
 Sat, 16 Oct 2021 06:56:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a16sm7537978wrp.14.2021.10.16.06.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 06:56:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 15:55:39 +0200
Message-Id: <20211016135539.3140678-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbredir: fix build without C++
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since bump to version
0.11.0 in commit c3a907a770b88529ea5a93c77cf001096799c556:

../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
The following exception(s) were encountered:
Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-meson.build-make-C-optional.patch    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/usbredir/0003-meson.build-make-C-optional.patch

diff --git a/package/usbredir/0003-meson.build-make-C-optional.patch b/package/usbredir/0003-meson.build-make-C-optional.patch
new file mode 100644
index 0000000000..fe1ed3f698
--- /dev/null
+++ b/package/usbredir/0003-meson.build-make-C-optional.patch
@@ -0,0 +1,39 @@
+From 55fc307d23d657b52433d1c8508467d0589754d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Oct 2021 15:45:57 +0200
+Subject: [PATCH] meson.build: make C++ optional
+
+Remove cpp from meson project statement to make C++ optional and avoid
+the following build failure when the toolchain does not provide a C++
+compiler:
+
+../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
+The following exception(s) were encountered:
+Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
+
+Indeed C++ is only required for fuzzing which is already handled by
+meson through add_languages('cpp', required: true)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/55]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 49dbce4..ca19f22 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('usbredir', 'c', 'cpp',
++project('usbredir', 'c',
+     version: '0.11.0',
+     license: 'LGPLv2.1+',
+     meson_version : '>= 0.53',
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
