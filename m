Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F3C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 13:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E2C6068F;
	Sun,  5 Feb 2023 13:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E2C6068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TjFFVUhYOxR; Sun,  5 Feb 2023 13:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4D5605B3;
	Sun,  5 Feb 2023 13:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D4D5605B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21D161BF334
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF85D605B3
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF85D605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrUpgY9Bl350 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 13:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8317600B4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8317600B4
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 13:06:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id o36so6918936wms.1
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 05:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kVtCG6GGwIp4kw0TA2LLGf9d8VqAFclQwjtyxljlsbc=;
 b=V99USeWcm/XAYldDUeDHCqF62k8Hl7+0sjkoi1s0ERdyeMwXCyRZbqkQ1ehxCxMNIp
 /EU4J/qRUVo4mAYPkvk/aB608vYWGnKf529Rzmwyma1ZBgIHQ95DuPmFAW5gHOcsVN8J
 xM2ZFoN9dHlkIadIrfSsRMOG+LgW/o5TYksFaEN4RRCfcaiX7wgT6H4OBpi01j9GjFF6
 o81en174o1wHKym9vLN3oMO3JPQZeTT04egvOCkCYbzzzn9kVD93W9jsmDqPZvMtiCW9
 +OISeBqDRAA9eS1ZIOjkrvqqWIUtB9v9QQF/yEXaitfmsVxu3iZET1b5IP44bRUDjZyp
 SrgQ==
X-Gm-Message-State: AO0yUKVFcRjuc92X6D+J2IQWEKcvyaVXLMmVuG4q9M9PJLC/sdTb75+8
 XPA9ExbSCbKEZIa3ieYWzt1iDTcy4Sw=
X-Google-Smtp-Source: AK7set9kFnD9lxT8hMiQK4hCM6JjD6yxlpAFGnSOquUPrRTl8X6vV4iLxkRKcgYlMDCvf3isJNINZA==
X-Received: by 2002:a05:600c:34d0:b0:3df:f2a5:49e0 with SMTP id
 d16-20020a05600c34d000b003dff2a549e0mr6059625wmq.40.1675602364561; 
 Sun, 05 Feb 2023 05:06:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003de8a1b06c0sm13401110wmi.7.2023.02.05.05.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 05:06:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 14:06:00 +0100
Message-Id: <20230205130600.18051-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kVtCG6GGwIp4kw0TA2LLGf9d8VqAFclQwjtyxljlsbc=;
 b=JUS+6jr6BS6RSOFjNt9lqG703uNKke7fDvZUurHH4H/MOkpBt3osIqIFpyWAGzzpie
 +82aH5zDLXqafYoxTqNc4xomENR5nqN0KndnZYbJDsNdoEYgu8a+v59dfUYeiX/axqOv
 JJk/s4Yt5JdwHTbpLwXb7OCQEgyOsLCDD/E80hUtUmsEI5haX23eb0rxqSfpb3yEFMuq
 EudKAWJ+iGW1/fxMVNYq89J+kk4mc5zspBnyKSmWXtV3pZm2QcoL6lqXm9bpq/G9HSy/
 EFPNfS8HYnGr0GR3UUdCQIyhUtFVjPSMrCKvxdd3Bjn73eyK8ZRzHvKCkDo9QNofPZx7
 IshA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JUS+6jr6
Subject: [Buildroot] [PATCH 1/1] package/opusfile: fix CVE-2022-47021
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A null pointer dereference issue was discovered in functions op_get_data
and op_open1 in opusfile.c in xiph opusfile 0.9 thru 0.12 allows
attackers to cause denial of service or other unspecified impacts.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ocation-failure-from-ogg_sync_buffer.patch | 44 +++++++++++++++++++
 package/opusfile/opusfile.mk                  |  3 ++
 2 files changed, 47 insertions(+)
 create mode 100644 package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
new file mode 100644
index 0000000000..2ef08502ab
--- /dev/null
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -0,0 +1,44 @@
+From 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Tue, 6 Sep 2022 19:04:31 -0700
+Subject: [PATCH] Propagate allocation failure from ogg_sync_buffer.
+
+Instead of segfault, report OP_EFAULT if ogg_sync_buffer returns
+a null pointer. This allows more graceful recovery by the caller
+in the unlikely event of a fallible ogg_malloc call.
+
+We do check the return value elsewhere in the code, so the new
+checks make the code more consistent.
+
+Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
+
+Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
+Signed-off-by: Mark Harris <mark.hsj@gmail.com>
+
+[Retrieved from:
+https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/opusfile.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opusfile.c b/src/opusfile.c
+index ca219b2..3c3c81e 100644
+--- a/src/opusfile.c
++++ b/src/opusfile.c
+@@ -148,6 +148,7 @@ static int op_get_data(OggOpusFile *_of,int _nbytes){
+   int            nbytes;
+   OP_ASSERT(_nbytes>0);
+   buffer=(unsigned char *)ogg_sync_buffer(&_of->oy,_nbytes);
++  if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+   nbytes=(int)(*_of->callbacks.read)(_of->stream,buffer,_nbytes);
+   OP_ASSERT(nbytes<=_nbytes);
+   if(OP_LIKELY(nbytes>0))ogg_sync_wrote(&_of->oy,nbytes);
+@@ -1527,6 +1528,7 @@ static int op_open1(OggOpusFile *_of,
+   if(_initial_bytes>0){
+     char *buffer;
+     buffer=ogg_sync_buffer(&_of->oy,(long)_initial_bytes);
++    if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+     memcpy(buffer,_initial_data,_initial_bytes*sizeof(*buffer));
+     ogg_sync_wrote(&_of->oy,(long)_initial_bytes);
+   }
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 72ae82e801..63553a81e7 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -11,6 +11,9 @@ OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
+# 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+OPUSFILE_IGNORE_CVES += CVE-2022-47021
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPUSFILE_DEPENDENCIES += openssl
 else
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
