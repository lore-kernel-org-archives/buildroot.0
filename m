Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD0C25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 099E040878;
	Mon, 15 Aug 2022 19:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 099E040878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNZOGsH51uO5; Mon, 15 Aug 2022 19:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC1040873;
	Mon, 15 Aug 2022 19:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC1040873
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4020D1BF30B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B94A40162
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B94A40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Hh2hLU4rjON for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC7A4011F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAC7A4011F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:19:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so2692745wmb.4
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lgQ4GhGMM/MrSUlQMsafvBmrXaUUUfxPLJlARCb6Dt4=;
 b=Mf6oFxYaP5KGdU9SH/tWG00/uyeHt0IxWq8dhE73VMlsGyoLEIFmKmgSahG8xF0heS
 UvB8yvzBvEautNN0bPNrmSRNC4s9fouDhi84y5f/f6Jdys1h5q31GEBCwXMRnU7EVXF7
 dRuFgeRfidxi/touqohCVIMEq1pSRyFO9RdrVzz18gFN+IPha3/D4kcT1SpME0UWdLL5
 sFuMKNmii8eg6OD4ohXenPsPuUQnUJ1j/an5BW9i9pPR1WEWqMOj9iyD9VakOPBefiSG
 ed1ZuvTOK1LbzshoY32LKBXiuFVqU4n48w9EFanH+FTMH4df7ZrL3mcy5BZt3WcBxyfh
 9lug==
X-Gm-Message-State: ACgBeo1j/CsRSyBy/KnHrjE4n9N7Lg6iJ+qEDhsFGgOPvSZYD4JqoRPC
 pFF58mRyrKQNHG+R3THYxC3FER1SrjI=
X-Google-Smtp-Source: AA6agR4LqiTMRWaznrikX/C6MNmns3VvOr5pnhxt5j5f4v6LkZuk+Mp1K/67FMKOwx2hBKtRNavy5Q==
X-Received: by 2002:a05:600c:1d9b:b0:3a5:d66e:6370 with SMTP id
 p27-20020a05600c1d9b00b003a5d66e6370mr8816976wms.73.1660591158827; 
 Mon, 15 Aug 2022 12:19:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b009148a9123b8d0d0d.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:9148:a912:3b8d:d0d])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003a603f96db7sm851105wmq.36.2022.08.15.12.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:19:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:19:14 +0200
Message-Id: <20220815191914.568237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lgQ4GhGMM/MrSUlQMsafvBmrXaUUUfxPLJlARCb6Dt4=;
 b=fXrl2aE1/1v6SDntkJdQBEMGfeFpEW4rFriPUTxlfRjbyeHayJuZurYQGL/+7AX4jm
 Ne6Az3egJpth9EMKQc4lH/NxHLEisMA08gvHMM6cnJY30nxVsEhc392EKdWkF6SkRlJS
 ZbrqSt169I6qnsvfkrhpMVJU8It4TAt/P2f8XorwxAr7afwnfLUJcBYwBMORtl3Zh86H
 3FrHOnM22n/FUUrpCxJEymuQ8MajfhV0K56VfnA20BHUkZujX6+EtZTnJZRJrD5U6IGw
 w4lAKAfvN1vbGNImWCLHv5HQONDnTIuLKLzouD5X8L6An9JMO9ZCDXYtEmwxZCDEuJHw
 QJvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fXrl2aE1
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.1.0-45
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

- Fix CVE-2022-1114: A heap-use-after-free flaw was found in
  ImageMagick's RelinquishDCMInfo() function of dcm.c file. This
  vulnerability is triggered when an attacker passes a specially crafted
  DICOM image file to ImageMagick for conversion, potentially leading to
  information disclosure and a denial of service.
- Fix CVE-2022-32545: A vulnerability was found in ImageMagick, causing
  an outside the range of representable values of type 'unsigned char'
  at coders/psd.c, when crafted or untrusted input is processed. This
  leads to a negative impact to application availability or other
  problems related to undefined behavior.
- Fix CVE-2022-32546: A vulnerability was found in ImageMagick, causing
  an outside the range of representable values of type 'unsigned long'
  at coders/pcl.c, when crafted or untrusted input is processed. This
  leads to a negative impact to application availability or other
  problems related to undefined behavior.
- Fix CVE-2022-32547: In ImageMagick, there is load of misaligned
  address for type 'double', which requires 8 byte alignment and for
  type 'float', which requires 4 byte alignment at
  MagickCore/property.c. Whenever crafted or untrusted input is
  processed by ImageMagick, this causes a negative impact to application
  availability or other problems related to undefined behavior.
- Update hash of LICENSE (year updated with
  https://github.com/ImageMagick/ImageMagick/commit/80629dfb3fea55eefa2dd8bdd9ca1be341502e16)

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 278becd2ab..ff0f3e26c6 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  385ca5bd8ce9b37e685779c46868171af949265c9db40067c1c4d7442dbc723e  imagemagick-7.1.0-19.tar.gz
-sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
+sha256  3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec  imagemagick-7.1.0-45.tar.gz
+sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 64a530c6d2..893606ff01 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-19
+IMAGEMAGICK_VERSION = 7.1.0-45
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
