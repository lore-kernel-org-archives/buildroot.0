Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C31C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D0140452;
	Sun, 12 Feb 2023 13:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D0140452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFWxw5P4_I0H; Sun, 12 Feb 2023 13:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF9A40453;
	Sun, 12 Feb 2023 13:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF9A40453
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5521BF593
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4152140919
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 13:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4152140919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28R0xCivofhG for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 13:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1E6040361
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1E6040361
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 13:03:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so7156914wms.1
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 05:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/dc/9esBcSQ+EjntFJ737Vr43iSMOEAs8GnlXiNHCk=;
 b=jRDglLecM8kjWVpQOdnN1XgI84hHf0xESom4tGeiiYxb4oGhwJHcfeTWyUcLfavOH8
 tdDjnpcvMT61kdJ7r41oXA0nDRt5FjjwHMSK+qQeSrX1A1J/vrm66UqIxZdOCBXeuJ/v
 vT6CCqh2P96IW828t0OYw0CGNmJNVN6M924Yw1SrFqKwBN7HPWFuKvxMdKTPFAyh9peN
 mPek7GvhrfpaNNd9MTdMFZ7aZCsugLvEYko8SZ5afDPAb8+k+tRdFHfmr/YftpxrpuYw
 nYjXYMtZh29j6w8KshRofEUks54j1aJnDk5eI0Y1HlhXFwuE1kOp+8RIgPXbA+QhxF8E
 gHBw==
X-Gm-Message-State: AO0yUKUp0pOl9YLlM1XUqzcmpciVsK7TzTMTQqPVDBFKWw0VDwcE3LO7
 YVwYtpxMgROPitxCc5wX0Uvnf5u3p8Q=
X-Google-Smtp-Source: AK7set9JD4aedr7dO4huRli72S3xYIpkqSJp5H2Sgp+NIlU8LNbN84fhqWMDqi7tudyiTPJWqmw0pg==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id
 bg28-20020a05600c3c9c00b003dc0d5b5f6amr17001273wmb.30.1676207019706; 
 Sun, 12 Feb 2023 05:03:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d6843000000b002c54ca185c3sm4896682wrw.22.2023.02.12.05.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 05:03:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 14:03:36 +0100
Message-Id: <20230212130336.373391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V/dc/9esBcSQ+EjntFJ737Vr43iSMOEAs8GnlXiNHCk=;
 b=TXIeeDWcqL3JQDm9mrQYya3hccQUCfTBmm5uDY5sj8vWNmoZIB19DQAGqxYJKGg31A
 GvApz3rq8wcgVTXBv7N91lZqk9+foRoL7ll5mBm3wEypMcwyEFD0egeykzvICZvwR8bS
 mI6xiP+GGJSIUB4WmIDiFtjf9G4z6qB5ZxVGONOsQMU+PgmpxerdgyL0hrh9T/mWekJe
 nFEM1hxz2S7MItPMK7/eWvLObSgrDF282Z7sLkPO6CGhLU2PMJ/6kumvFdhE38N6msxs
 b7KVO//F3FUz9zmexyXzj7INmB93M8GzHjydbPH21RHirmDDZNU9xVEl4QGukeoeHXIT
 vn1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TXIeeDWc
Subject: [Buildroot] [PATCH 1/1] package/olsr: fix build with gpsd >= 3.25
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

Fix the following build failure with gpsd >= 3.25 raised since commit
3c7fece853f3def9a425eccc384b9dacb1010051:

In file included from src/configuration.h:50,
                 from src/configuration.c:46:
src/gpsdclient.h:64:8: error: redefinition of 'struct fixsource_t'
   64 | struct fixsource_t {
      |        ^~~~~~~~~~~
In file included from src/gpsdclient.h:49,
                 from src/configuration.h:50,
                 from src/configuration.c:46:
/tmp/instance-17/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/gps.h:2714:8: note: originally defined here
 2714 | struct fixsource_t
      |        ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/47a619686bb47debd525c92aa7e14bee5c40ca9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../olsr/0006-build-patch-for-gpsd-3-25.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/olsr/0006-build-patch-for-gpsd-3-25.patch

diff --git a/package/olsr/0006-build-patch-for-gpsd-3-25.patch b/package/olsr/0006-build-patch-for-gpsd-3-25.patch
new file mode 100644
index 0000000000..c82bc1bb28
--- /dev/null
+++ b/package/olsr/0006-build-patch-for-gpsd-3-25.patch
@@ -0,0 +1,31 @@
+From 17d583258969c1d182361e0e168b3cad79ef64e6 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 16 Jan 2023 18:35:32 -0500
+Subject: [PATCH] build: patch for gpsd 3.25
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+[Retrieved from: https://github.com/OLSR/olsrd/pull/119]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/pud/src/gpsdclient.h | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/lib/pud/src/gpsdclient.h b/lib/pud/src/gpsdclient.h
+index 061056b12..a51dd2211 100644
+--- a/lib/pud/src/gpsdclient.h
++++ b/lib/pud/src/gpsdclient.h
+@@ -60,14 +60,6 @@ struct GpsdConnectionState {
+     struct devconfig_t dev[MAXUSERDEVS];
+ };
+ 
+-/* describe a data source */
+-struct fixsource_t {
+-    char spec[PATH_MAX]; /* working space, will be modified */
+-    char *server; /* pointer into spec field */
+-    char *port; /* pointer into spec field */
+-    char *device; /* pointer into spec field */
+-};
+-
+ /**
+  * The gpsd daemon spec
+  */
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
