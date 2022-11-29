Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB9C46467
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 11:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E92404DA;
	Tue, 29 Nov 2022 11:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E92404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jvfa0df8FOpy; Tue, 29 Nov 2022 11:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E907C404BB;
	Tue, 29 Nov 2022 11:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E907C404BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB101BF2C3
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F7D81406
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06F7D81406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWb4RNgSdAae for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 11:40:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87EF4812E7
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87EF4812E7
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 11:40:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v1so21606698wrt.11
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 03:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNeNM1ZgPhHyYr5cDYwvoY84PX/KWJ70RjDxL11srYQ=;
 b=4xR1v5KxUk2CmfuBqGFH2sFyqyB3a0DG7+QfN2p+NcGTrp4tiTkN21K+QavgTIEn2k
 V1FzAoO/ms2uu1t7yy5UmzizL3zSzXed+UWw1cuSjgfv72F9VgqVc8Wl3k3eeWzyy5yq
 IbdQo6bIIfk69+VDo5TqOIYLlBhJ2+Pkl1syXRw3OqG8hEwi8AAZzrNd7FtgKKrS/j41
 +yYLBreM1bwgHeMSlUqCEjbnYDTVCK/e2OM9qKYlMzd2xptXIAbg5jPO6csC9DADxEDI
 D+4tagfyg227xHi/k7GhEd4v1FL7HJSkpUfiupO8HHkrEX3lT6H0tOdTbqFkV1k2TRXZ
 dbOg==
X-Gm-Message-State: ANoB5plgnb8n00lkkqQnXUdaWbx+wupm71/TNPhvFzV6u3MldWjUazUQ
 ii1cPBBID9O1nlTViee/NtKAxXBRS0M=
X-Google-Smtp-Source: AA0mqf791PGNYHF5hWAfuNyUSmQvT24ZxyyC8cpFKKFRWMN3qcAnro2pX4kL3sqGiwoPktz0zucUDA==
X-Received: by 2002:adf:ea90:0:b0:242:1ae0:f2a4 with SMTP id
 s16-20020adfea90000000b002421ae0f2a4mr4969521wrm.209.1669722055584; 
 Tue, 29 Nov 2022 03:40:55 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 i28-20020a05600c4b1c00b003cfd4e6400csm1788685wmp.19.2022.11.29.03.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 03:40:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 29 Nov 2022 12:40:42 +0100
Message-Id: <20221129114042.1372248-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FNeNM1ZgPhHyYr5cDYwvoY84PX/KWJ70RjDxL11srYQ=;
 b=RoMbwi1vQQJ3/4mzcri0XQm2nF3p2NC9v9eKCBBSUvyw2zZ1cuW5O+N3ju+pvnYeme
 xAewZbGlGLjdWoIVtdhx0tmRoU43kOtomKtiAKtoh2/BWduXSkYPFGbxOnUe/Z9wyX8s
 Kcs4FM9uzHuZxg7KXDur4/wY4C2fSLXtNsc281fvdeNaju/pPBX7K6N+XMFE/1d+PwNR
 eC5jZzg4d7ZNHVQ10xPNIaIfyy8yNb3JDA/mDlsCsNxXJeVgcr1+Z+Zyb17HDzDnwAaU
 SKjh2Mw96l+tp9Lz0OZu+DW3jkjnro3v+AjQWqZWtis2K+JA3qNDrBxzAn+lfQKgpxnT
 tr7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RoMbwi1v
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.35
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/0003-disable-atk-bridge.patch      | 2 +-
 package/libgtk3/libgtk3.hash                       | 4 ++--
 package/libgtk3/libgtk3.mk                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index b12e1a4fc..7edf7db71 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1679,7 +1679,10 @@
+@@ -1690,7 +1690,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
index 09ede9661..390fc012f 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0003-disable-atk-bridge.patch
@@ -7,7 +7,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1375,11 +1375,7 @@
+@@ -1386,11 +1386,7 @@
  # Check for Accessibility Toolkit flags
  ########################################
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index c68c6e90f..1715b94e7 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
-sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec  gtk+-3.24.34.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.35.sha256sum
+sha256  ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1  gtk+-3.24.35.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 53d7f6898..f277fce2e 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
