Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A142C83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C487081447;
	Sun,  3 Sep 2023 16:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C487081447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcOYqPCrTpqq; Sun,  3 Sep 2023 16:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF96881A15;
	Sun,  3 Sep 2023 16:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF96881A15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDD761BF381
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A233D4090F
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A233D4090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHZ97p4W2PCT for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:36:40 +0000 (UTC)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86C8B40900
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C8B40900
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1ccc0d2e697so585787fac.0
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693758999; x=1694363799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFHAWaNnssXSsy4qGgtInPo/uoPO/12PgMPCJMHkjrQ=;
 b=gHlYbIVuELqvXIa6iUfH8vm1PIpTCGyro3Roq2lzDcOwdWj4mDyCPdTBrNAqFLJbRg
 BW+5oZUcHSzfPpvDoPxQq1KVBpz54oAlMouIcghdIB21Yo8oMgO9oieDbtIa9E4ChcW6
 nHHuVc3o++m9JEt2xx8RzGdKSP0DhJ1bNRe/bnr9R8nsjzy32FRcXocth/jdS+bmK21o
 63gqADofJuLIx9KJRBL+u0SiXcJY3gT0Bwh1Ud7sDOTnzHNb9E69L31MW41UQZwaa456
 iQ02cw2HXSBvVh4Dcx6HLox8Mqb+poO4UJ/ZbZm+HlS0JuXB+KiGwGdZbt2qrS1IR87N
 T3MA==
X-Gm-Message-State: AOJu0Yxc+8IEAWh5Ru6vC/OMUVtODUbfMcOSwbA137n3bjBJhS0/Q3Ze
 19Jrr2kCWFGmuVYA6ug9oeENbWVGW7o=
X-Google-Smtp-Source: AGHT+IF+AQOYTK1QYwM7m+PVmLv+4hA+r1ZceuqEgnBzMJwQ5B0kAhnDBKy3mjbg4AXb/rUohpbJKg==
X-Received: by 2002:a05:6870:e38b:b0:1bb:83ae:1512 with SMTP id
 x11-20020a056870e38b00b001bb83ae1512mr11118754oad.24.1693758999569; 
 Sun, 03 Sep 2023 09:36:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a9d7348000000b006b753685cc5sm3789487otk.79.2023.09.03.09.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 09:36:38 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 13:35:09 -0300
Message-Id: <20230903163509.614740-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693758999; x=1694363799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFHAWaNnssXSsy4qGgtInPo/uoPO/12PgMPCJMHkjrQ=;
 b=XJhcq0JrnMdNj6I3XH85h5vgjyQU4pNgtNzqwffxbdspDzwMIQDZ6Ler+2DQ6XSslV
 Tj33uf/QbGsHWCfvh8vq2EjLWexfMXicRGc99vOMcXy7V+zDUWA0+6XGU5P5serE/q/Y
 fdpONAV7At/nUsS/WAEA4k11XhX0d/S9Ey2H1Bmgy0RGIT1TkYhVJkWsftKtwTuF0lDq
 cx0VOvwF2i3Pnn+fHdDA5GBYUhmEo1exPesCg/imlSBYnVeOq1aSDuTCcy9W1dAzCEZu
 rZRbOufZESGv/7grNNv397KTZLFVUstgeE9aM5PBn6xcZ4PgNrIZDfoJ3z0Dkf+2IrEW
 /8dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XJhcq0Jr
Subject: [Buildroot] [next v3 3/3] utils/check-package: remove hard-coded
 list from lib_config:Indent
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
Cc: James Knight <james.d.knight@live.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Knight <james.d.knight@live.com>

Apply a special comment enabling the flag
Indent_ignore-menu-indent-below to all configuration files intree that
allow indentation, allowing these special files to removed from an
internal list hard-coded inside `checkpackagelib/lib_config.py`.

A great side effect of this new type of special comment is that it can
also be used in source files from br2-external trees.

Signed-off-by: James Knight <james.d.knight@live.com>
[Ricardo: update commit message after rebase]
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v3:
  - rebase patch 4/4, update commit message
  - rename the flag

https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/990316889
---
 package/Config.in                   | 2 ++
 package/Config.in.host              | 2 ++
 package/kodi/Config.in              | 2 ++
 package/x11r7/Config.in             | 2 ++
 utils/checkpackagelib/lib_config.py | 8 +++-----
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b21a2f8c65..231e8101c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menu "Target packages"
 
 	source "package/busybox/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 22e0dc64d4..2a96456db6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b68e6d504..f6d5dbe4d8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b91f97bb34..9cb3596b24 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f26ca0d898..e2f7302485 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -187,6 +187,7 @@ class HelpText(_CheckFunction):
 
 
 class Indent(_CheckFunction):
+    flags = ["ignore-menu-indent-below"]
     ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
     entries_that_should_be_indented = [
         "bool", "default", "depends", "help", "prompt", "select", "string"]
@@ -224,11 +225,8 @@ class Indent(_CheckFunction):
                         text]
         elif entry in entries_that_should_not_be_indented:
             if not text.startswith(entry):
-                # four Config.in files have a special but legitimate indentation rule
-                if self.filename in ["package/Config.in",
-                                     "package/Config.in.host",
-                                     "package/kodi/Config.in",
-                                     "package/x11r7/Config.in"]:
+                # some Config.in files have a special but legitimate indentation rule
+                if self.enabled_flags["ignore-menu-indent-below"]:
                     return
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
