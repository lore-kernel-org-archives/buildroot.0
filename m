Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D21260651;
	Tue, 23 Jul 2024 16:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b-x9TWomNQG; Tue, 23 Jul 2024 16:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B7760669
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B7760669;
	Tue, 23 Jul 2024 16:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C79A1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9494240065
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_jMZl2nXyd8 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2335040026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2335040026
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2335040026
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:25:39 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-427db004e36so27898215e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721751937; x=1722356737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Clat2COclGSsPAmV8DWcCPiK/Emd3ay2qDvViuY4x/A=;
 b=Fgk0FLSdNki9ptsmC1n0DSx1CG2BWOsJh6JAOR9aA/VZpsAjp9eRasxXhpKHnMOxGg
 GSgah0xeoxl50KeQLQIssl+wxve8mVORZdr/0lYPrOD1K7HQYI6rNMIq5vM6u4rntRUS
 zFNsp2teDGMvFltRD+wWg4ImYGRo8nCz05zyowDj70F/SwMev9doIL5A3Dm9h+cjUWF+
 ZiYkeNRV0MFgzltCXavArBvo0ZUaVjH3EmVZE9z1CjxrXh25sjR/zflHPRXVkmmzH4DJ
 1SKGkO3HcTWhRD9IcJHP9y/977jmTgLjhY/rrSwRiVPNJju/iF10VWz5h7A/yczZvPbA
 CfHg==
X-Gm-Message-State: AOJu0YxBpU+pfZoXmsIxnX01bM7zWMUUePahg8xWm1rTpG3Rv2/eHN81
 0JZFbX/ID1IIuMCmKiieKlyjWep6/VaPinrxYbjcODyBo624FRwtmYjfpg==
X-Google-Smtp-Source: AGHT+IE0dYY5zE5X4f85PO/XUoxQeol56Bz//nbbBAIw9RlJvhC42K+GX3+cclRRYjXMJPTNjD8bnQ==
X-Received: by 2002:a05:600c:3ba3:b0:427:9dad:17df with SMTP id
 5b1f17b1804b1-427f7ab5942mr194925e9.12.1721751936884; 
 Tue, 23 Jul 2024 09:25:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa9b1sm182191175e9.8.2024.07.23.09.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 09:25:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 18:25:33 +0200
Message-ID: <20240723162533.549929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721751937; x=1722356737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Clat2COclGSsPAmV8DWcCPiK/Emd3ay2qDvViuY4x/A=;
 b=AXkk9RBztkUJiCtTZszDBEbdhKwHz/kSDPPy3D7wmT2MPdjXTBxov3qCNRnnTxOUZV
 ZC2ax+Clzt4bp4k1iQbYH5sdDYKtrFuqLn09EMqdEXHQJxvMbhgrhvJVzsjX6IpShaEK
 VH0Xh5KmUqk/lvCD2WoySx4ZIqdlx9PsH7rVaCTkCOX8TYoYj01NRcKZAPdRL/7QH9aW
 zQArcK0j8il5Ol4yVCoAXZFe3xDeKaPqL169x7noby7yQAasFYaiVJouf8fjUQMz2QfL
 XWUpP/BYnnVrikT7HpdjweK3dUPgoZgSJdqX/5hLcPKmKLd/CLLsanknfOyaax85/F/j
 eHkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AXkk9RBz
Subject: [Buildroot] [PATCH 1/1] package/dvb-apps: fix build with gcc >= 14
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

Workaround for glibc 2.31 added by commit
bbe170dbcf4ddb63e76299214e2c18b16e5cf016 back in 2020 is incorrect as it
writes new_time (a pointer on time_t) into timespec.tv_sec (i.e. time_t).
This mistake raises the following build failure with gcc >= 14:

dvbdate.c: In function 'set_time':
dvbdate.c:313:18: error: assignment to '__time_t' {aka 'long int'} from 'time_t *' {aka 'long int *'} makes integer from pointer without a cast [-Wint-conversion]
  313 |         s.tv_sec = new_time;
      |                  ^

It shall be noted that gentoo also spotted this mistake:
https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files?id=81e99f1c753d1cb564be29b22dcd8927830c4b9a

Fixes: bbe170dbcf4ddb63e76299214e2c18b16e5cf016
 - http://autobuild.buildroot.org/results/e99b9ebf602d307fbc32f2a367e95177f53a68f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dvb-apps/0006-fix-glibc-2.31.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
index 079a24f149..51c03d3e2e 100644
--- a/package/dvb-apps/0006-fix-glibc-2.31.patch
+++ b/package/dvb-apps/0006-fix-glibc-2.31.patch
@@ -4,6 +4,8 @@ as stime func doesn't exists anymore in newer versions of glibc >= 2.31 due
 to obseletion, a replacment with clock_settime is inorder to fix the issue.
 
 Signed-off-by: Dagg Stompler <daggs@gmx.com>
+[Fabrice: fix for gcc >= 14]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 --- a/util/dvbdate/dvbdate.c
 +++ b/util/dvbdate/dvbdate.c
@@ -13,7 +15,7 @@ Signed-off-by: Dagg Stompler <daggs@gmx.com>
  {
 -	if (stime(new_time)) {
 +	struct timespec s = {0};
-+	s.tv_sec = new_time;
++	s.tv_sec = *new_time;
 +
 +	if (clock_settime(CLOCK_REALTIME, &s)) {
  		perror("Unable to set time");
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
