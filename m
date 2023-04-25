Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BEC6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB8A61476;
	Tue, 25 Apr 2023 17:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB8A61476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9fDFgzSUnwI; Tue, 25 Apr 2023 17:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7E061121;
	Tue, 25 Apr 2023 17:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7E061121
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63B361BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 484CB61458
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 484CB61458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOJmQr5EjCJE for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940A961121
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 940A961121
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:00 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b620188aeso7302408b3a.0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442899; x=1685034899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDT0cP1Y5XTzPOLSzWaWuOQpbEpwgxsLULUI0gO0S3w=;
 b=N5F4kjg5Ulq7FwfIqREJhOadg7tM4HXikZglE7BO8eaVXjsBmMt++E9+ISZ5/8URw+
 fz7USx2t/FJ+AP8Q758k3ii2/igymxYteMRd83LYF5siDS1uB4DL0yhpYNSFM5FoC9JK
 XhFkb5sLhdgcnULAxDTVK+BcdwlLtyWB+tJ5uGDDrD65QbmR4i/Uf9WuDgtdJHjq5K/l
 IL8qSFd1eIT9pX7ud57ufhnSv8m2wE7kOKqZw/0rZXJ+DjZ5hl+6R0/72mZQyHKzifw5
 vJSrkVfgcHx1vuqwoOaSURVp8In7fHXpY77FcNDU8zFB+/YD0FWPz2yVQ6WMuGkjA7jw
 u9DA==
X-Gm-Message-State: AAQBX9ck6Fmg2H0hy5/aMm3WLdnPcbjDav5EFHEe12JJoowksHic68hR
 nWCclup3Gyx3U11Jtgb8Pc2IaF7kxcIZSg==
X-Google-Smtp-Source: AKy350Zs3SO5cGdGZm26gTeZhXZWOtDyvap/XRjAbf/wZlqbf+RFGQxQ5ocdogkFLh9ufND2oZ5/cw==
X-Received: by 2002:aa7:88d1:0:b0:63b:89a9:529f with SMTP id
 k17-20020aa788d1000000b0063b89a9529fmr23764692pff.14.1682442899444; 
 Tue, 25 Apr 2023 10:14:59 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:14:58 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:42 -0700
Message-Id: <20230425171454.48802-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442899; x=1685034899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDT0cP1Y5XTzPOLSzWaWuOQpbEpwgxsLULUI0gO0S3w=;
 b=SJ3vj/4MceYPDw3kiveDwrhwJcwosm3mjVgqm0Tr1JluM3dFfUnBe4aStbZBTA9/il
 FBHdQOa0V56G1196w14yBnPxTvg97zjn7NBt4Ox0IMKmLmQGE3H0nzemLEkw5py95UdG
 vZr9mQ/kjq1tGJZ3dPLMmMSQMWQ2bvW3ZoSNstHhpIJL74CiRs9j1CqcEjFC36F40dgq
 LE8fCvOy3Wwrs2k7dhKv5IEqQNJ2DEqv8Ph5SXKSIw4UQFoZTAfyruEGMdO0+LqTD1aP
 DxIBMjPEc/kwh15xEDVZVcYSGF7yH/0ayR+mDBb/wqVLxbjq/uIPghHkfEY54Ok9oKjE
 mBAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SJ3vj/4M
Subject: [Buildroot] [PATCH v2 01/13]
 package/libglib2/0003-disable-building-docs.patch: new patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If rst2html5 is installed on a host system, meson will attempt to build
html5 documentation from the docs directory, resulting in the following
error:

/usr/local/bin/rst2html5.py
Traceback (most recent call last):
  File "/usr/local/bin/rst2html5.py", line 27, in <module>
    from docutils.core import publish_cmdline, default_description
ModuleNotFoundError: No module named 'docutils'

Since we don't need, nor want to build the documentation, remove the docs
subdirectory from being built entirely.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../libglib2/0003-disable-building-docs.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libglib2/0003-disable-building-docs.patch

diff --git a/package/libglib2/0003-disable-building-docs.patch b/package/libglib2/0003-disable-building-docs.patch
new file mode 100644
index 0000000000..27a540bf61
--- /dev/null
+++ b/package/libglib2/0003-disable-building-docs.patch
@@ -0,0 +1,38 @@
+From f3b8515471aaa452f06d84da68372fcead8637d2 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 24 Apr 2023 11:52:24 -0700
+Subject: [PATCH 1/1] disable building docs
+
+If rst2html5 is installed on a host system, meson will attempt to build
+html5 documentation from the docs directory, resulting in the following
+error:
+
+/usr/local/bin/rst2html5.py
+Traceback (most recent call last):
+  File "/usr/local/bin/rst2html5.py", line 27, in <module>
+    from docutils.core import publish_cmdline, default_description
+ModuleNotFoundError: No module named 'docutils'
+
+Since we don't need, nor want to build the documentation, remove the docs
+subdirectory from being built entirely.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 0cbc968..28e1147 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2442,7 +2442,6 @@ if get_option('man')
+ endif
+ 
+ gnome = import('gnome')
+-subdir('docs/reference')
+ 
+ summary({
+   'host cpu' : host_machine.cpu_family(),
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
