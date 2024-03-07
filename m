Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A1C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 081B061025;
	Thu,  7 Mar 2024 14:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEGXcrY_FAUH; Thu,  7 Mar 2024 14:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 126D56103A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 126D56103A;
	Thu,  7 Mar 2024 14:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01AC81BF2AB
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 14:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F00D182AA9
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 14:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQSJ9SSKybig for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 14:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D51D882A26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51D882A26
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D51D882A26
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 14:32:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d311081954so10286721fa.2
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 06:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709821950; x=1710426750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHwSm9Exf3bS8whxZVeGVHNnOnHOWbK4uGLPo2ogL/M=;
 b=tMRDTe7VrU2d6w8DuICS+Ub0dFHGZiQIWtsESpeUXyVEv0YifpSy133QDQOWNWgeB+
 EAT8nSXAx08XZcdwLYI73wO5wsR2LfYl4LfnzaGzVoPow7HAYN5QwU7EE5itIrurPJuD
 DPik3MYC/ON5wUoGK+LQWxuBMWB9OtmyRGT+BLR1ks8OGFSHoqIKgFkBCksYpmI6IGrN
 1HvmaidNtGHjcOavv96H2+yfAbbdiBHoI8s5CcOIrqkYtzhAAbBiJbkG8eLcA3Ooj3qP
 3SB6wdy/DRqhRsT2XkRqtSKOfKubJ0TdNw0s6+BBzGAnKcxBoYemnJk55vsXrfVq/GRS
 WJIw==
X-Gm-Message-State: AOJu0YyMNVb0lMJSZkZCf2dlPZBhms6IsOEqMIORZmO0FS7/CV7s4M/A
 efeqAAF35rS2d04RU0XrqTOPcxXD7BlEcjAPAJazetM4dml+RYJtkPtruZ55
X-Google-Smtp-Source: AGHT+IHqVRMiyHARDFnc0d0zHelbYN6w5wfVHfUdsxW1U1ohhyY/lwHGbyX9ytrJBPJoZODOlX2Yng==
X-Received: by 2002:a2e:7214:0:b0:2d3:8656:3cd4 with SMTP id
 n20-20020a2e7214000000b002d386563cd4mr1514240ljc.9.1709821949929; 
 Thu, 07 Mar 2024 06:32:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b0041315f221c7sm168730wms.16.2024.03.07.06.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 06:32:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 15:32:27 +0100
Message-ID: <20240307143227.548555-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709821950; x=1710426750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eHwSm9Exf3bS8whxZVeGVHNnOnHOWbK4uGLPo2ogL/M=;
 b=mjJ02Wn1OP63fxQ5loCJNQv2+hei/sNLGQ5MQqWjoi1YGgiWopvHBmikG6p4IftMEr
 mA1d51su76GAEcyT5ehYI0iSDRBuS+khiQmes0i583/o3vTrH9+wXJcZnNwGFxMOSy/v
 S6/lztnMgFcyWhpzHfb0G5fjejEjJnRI8Oatz8qMvFvq9nZ9gwJxQlILTrdJ55rl0yhN
 6PMNJ2EyBdZTMjVW7I0+LU2up7n66RruEWk+3RtfLcdlTQFQ/FODrUg4dutE2W702KHP
 6Kmmq08EecsGWCCQozVyW4KVzCIPQ5y1MVIHvh0bv2XyL/kDVujz3A3cDq5ODm2Gx5j8
 JoCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mjJ02Wn1
Subject: [Buildroot] [PATCH 1/1] package/rtl8189fs: bump to latest git commit
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to latest git commit to fix the following powerpc64 build failure
raised at least since commit 25956b29e4d63f599b9baf7298f69538ba2f22fa
thanks to
https://github.com/jwrdegoede/rtl8189ES_linux/commit/c7bf7590bc0d7252005fd0496898ad420a85e1ae:

In file included from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/drv_types.h:30,
                 from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./core/rtw_cmd.c:17:
/home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/wifi.h:459:32: error: conflicting types for 'get_ra'; have 'unsigned char *(unsigned char *)'
  459 | __inline static unsigned char *get_ra(unsigned char *pframe)
      |                                ^~~~~~

Fixes: 25956b29e4d63f599b9baf7298f69538ba2f22fa
 - http://autobuild.buildroot.org/results/83153ed38a583ce2712df9b142ac3fc55a8413e3
 - http://autobuild.buildroot.org/results/63186c7adb5ecc8b8a16a6ae641ecfb9c03478bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index e3d63ac4b0..2746194f43 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c92e1d800258665835922c1e927708f7a0477a1cbb281dc98ba5d33d5e3271ee  rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786.tar.gz
+sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189fs-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 86a2ac734b..174bb346ca 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 5d523593f41c0b8d723c6aa86b217ee1d0965786
+RTL8189FS_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
