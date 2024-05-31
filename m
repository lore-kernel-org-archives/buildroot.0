Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0F9C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 20:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595174062A;
	Fri, 31 May 2024 20:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIetmjlw4muH; Fri, 31 May 2024 20:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B2D4185B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B2D4185B;
	Fri, 31 May 2024 20:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20A8A1D577D
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D6224185B
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97X82ApK0zeZ for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 20:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19AF04062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19AF04062A
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19AF04062A
 for <buildroot@buildroot.org>; Fri, 31 May 2024 20:22:22 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7e97d38584fso94512939f.2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 13:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186942; x=1717791742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCYTeHhYdRNl/Fo2XuRyKAI+pb3WScFMdPlohMeVJFc=;
 b=H5M7EC9glwx2qN8mq77whjzaoiFZzXw6gURj9iF0LK9pt2aW1djqJYYjH1Cq8NcP64
 HdX88s5wh69fvW2qv8C6cfeJnKXbXsy5tjLzSfqmwpMXsOf2D1VJ+b7donNlhIBulJLt
 jnkKgAJyxwTSVIL2KuEog2x+HMnLY7ZaJzhwJFWWW6+UJS8R+/gc9BufxpPh3RR6QF2I
 vEYE79GtCwLmnQR0NfFfRDQ+lHWfu4bOyfLyK4CR/9sp/rlenbYnSBkDSDGr85BvMJAZ
 ys+okqAIs7A3jwM4IiN2+j8LukGn0z/wxyRfmajhlkSK8BcYkv5n/eftw4PzQ1ZNH6Kd
 /v4g==
X-Gm-Message-State: AOJu0YwQQnpOYKqPt4/FyGQMvNtrlKXV6h9oYJ/9R4Z1e8FXFhy+8T94
 sZRksgWqiD7iDGgT4rLGA+1mCNoF/rqkMGEwlzL7x6ncL0KweytLthP7Iw==
X-Google-Smtp-Source: AGHT+IG3VBPZ37PV/0ANuxcKbOaJVAFeCJVJJl7Hsr6FLx7HVGzElBiG3/sA4gh6WvlzyrJNbeEIXw==
X-Received: by 2002:a05:6602:29c7:b0:7e1:79e8:d671 with SMTP id
 ca18e2360f4ac-7eafff10a72mr401466839f.14.1717186941850; 
 Fri, 31 May 2024 13:22:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eafe60399csm66373439f.46.2024.05.31.13.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:22:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 14:22:19 -0600
Message-Id: <20240531202219.2486947-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717186942; x=1717791742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rCYTeHhYdRNl/Fo2XuRyKAI+pb3WScFMdPlohMeVJFc=;
 b=kfvhkW5eGm6DUV+QmIO9AmKCBPYDQP/ET17mwZC/rCI7e+9kDp8dQVEQqg3gVn3rPU
 z865ydRfgjxDIc9vrCnYEepnSr/gpVmQvjZL4vJuBpLcrb7OtbnL2Ls7X3s1dR+U/yRk
 B2gFDQR6sefrQSkO6a6lg8t30ficcsaGy15bH0RYWn/MscEXeSyMJKu9UaHIx9TCqu3d
 4C6iChY6kqYvvZmgIJ6eWzxag3QwWDVGewDynbbOjZKzUXyP8gD5BZOK8CSihaCubABH
 Q177U2gvu5jGn2h4PtMrI3gF8xSMXZPHk7wxyWUrlGUvLLEn0OyqZpCwmjuT2f/hcN0d
 C8rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kfvhkW5e
Subject: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.17
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-gobject-introspection dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index b3716f0854..a16875ac6a 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
-sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
+sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 415d996faa..7aebd4f395 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,14 +5,18 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.56
-VALA_VERSION = $(VALA_VERSION_MAJOR).14
+VALA_VERSION = $(VALA_VERSION_MAJOR).17
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
 VALA_LICENSE_FILES = COPYING
 VALA_CPE_ID_VENDOR = gnome
 
-HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
+HOST_VALA_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-gobject-introspection \
+	host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
