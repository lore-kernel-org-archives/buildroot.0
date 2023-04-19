Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D1FC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADA638142C;
	Wed, 19 Apr 2023 08:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADA638142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoteOo-nxa0d; Wed, 19 Apr 2023 08:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA6D381766;
	Wed, 19 Apr 2023 08:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA6D381766
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF5E1C432C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E6041F02
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E6041F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMd03XH1mYoY for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92DB41F0D
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B92DB41F0D
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-32951864ad9so8623525ab.0
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893114; x=1684485114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJxVvZjmBqweun7Keaky3PEMP2XZsU7lpBN4VnOqwbE=;
 b=N59tnZNFX5k5jSuNF0CiLlIwCzBGTAGYJBoyt4QSK8h/6l0Rn7fzyl+b6yDkgq/D4T
 sdBnjBRtaYJKVtLN50beFdoDPfgvdwVijyYoMrOjDd1gYu2qqQQSx3Gd/AMFv5OlBRji
 g6IbvzpSxoGctEXpC1SA0lSqsR9YutqknX8hPwExO6zqvP9naDzYDV/rhXFigb0xQTan
 jp4FBxs3/8nfzQF5hXJyjDxNI1IEi6eCUuHbYOtR2Op54AYlfQGBOzgyo1SmrV26MaeQ
 zY0bLhVDqy8ziO7vnztEAWiuiKmaUw5LgJgWmdCIq+VUd7h+yg8v1uwiOeWezxEO4y9Q
 6hlg==
X-Gm-Message-State: AAQBX9d5TMwHXe8uWxyzlC3ObQ6CztGsJp9eN2+jiYIT8W01wybnECJi
 9EC3oP2Wf9QWnldc8XhzMbECWBS1afo=
X-Google-Smtp-Source: AKy350Z/w0syrdGgZ52tQtKurzBo6AZTTJCzujPUlrVi5XJk8bWReAndvn1yCo/cuKA1gINJg8anIQ==
X-Received: by 2002:a05:6e02:143:b0:32b:2884:667d with SMTP id
 j3-20020a056e02014300b0032b2884667dmr6000837ilr.7.1681893114530; 
 Wed, 19 Apr 2023 01:31:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:42 -0600
Message-Id: <20230419083144.212921-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893114; x=1684485114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJxVvZjmBqweun7Keaky3PEMP2XZsU7lpBN4VnOqwbE=;
 b=AtBK+snrqrxNrHflF/4hBIOhojhH4JE/NFGvuxLwXxRYCa6bgtIMebKaxUJYdHMNwU
 p0XD4482sXbFNrXUq8llVtj/3eyQUadg9KIAlZLO5k9jWOxFadiNE5fsDBfi+40yiW1h
 cQVzEzD+x+x/3dvnDGOf6rS0GzSSvuwoTJoEHngJLO21YQKpKw2WoL2L9AzNDk0r5PIs
 B6stGRkiigeNWU17/20VutLyrMuudf5njcqHxqW2aa1EVZDZgIFIT2wtJiyg4WB3/jLt
 oZEj04aQ1/slYEjDkI4EpHxNFNQ1DaEsB+LPVImj4/EzR8F2qA2h0A3PuIIVMd19Cd0P
 TDSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AtBK+snr
Subject: [Buildroot] [PATCH 10/12] package/gstreamer1-editing-services: bump
 version to 1.22.2
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

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...treamer-validate-1.0-dependency-name.patch | 35 -------------------
 .../gstreamer1-editing-services.hash          |  4 +--
 .../gstreamer1-editing-services.mk            |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
deleted file mode 100644
index 6c190d3727..0000000000
--- a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c3edd999195445319ea619b6d719d7743f5b560d Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 31 Jan 2023 21:38:09 -0700
-Subject: [PATCH] Fix gstreamer-validate-1.0 dependency name
-
-The gst-devtools project generates gstreamer-validate-1.0.pc, this
-must match the dependency in gst-editing-services for detection
-to work properly.
-
-Fixes:
-Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3859]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index bdc47f5d8b..b949f55317 100644
---- a/meson.build
-+++ b/meson.build
-@@ -110,7 +110,7 @@ if host_machine.system() != 'windows'
- endif
- gstcontroller_dep = dependency('gstreamer-controller-1.0', version : gst_req,
-   fallback : ['gstreamer', 'gst_controller_dep'])
--gstvalidate_dep = dependency('gst-validate-1.0', version : gst_req, required : get_option('validate'),
-+gstvalidate_dep = dependency('gstreamer-validate-1.0', version : gst_req, required : get_option('validate'),
-   fallback : ['gst-devtools', 'validate_dep'])
- 
- gio_dep = dependency('gio-2.0', version: glib_req)
--- 
-2.34.1
-
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index bd5dcfdbaf..0cdb18ea5d 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.0.tar.xz.sha256sum
-sha256  2a23856379af03586b66c193910fa8bb963024580bc2337c7405578dc077aa79  gst-editing-services-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.2.tar.xz.sha256sum
+sha256  453b1464fc3857de269a7cb0ebd966afe02171d97bef672a0b8a0a6d43e0cebf  gst-editing-services-1.22.2.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 0ae9205c3b..9fdc877db0 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.0
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.2
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
