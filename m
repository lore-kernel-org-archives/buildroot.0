Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC42C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 17:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD8660F11
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 17:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABD8660F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F47D41592;
	Thu, 16 Sep 2021 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6EyOAu-X1RR; Thu, 16 Sep 2021 17:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F4241587;
	Thu, 16 Sep 2021 17:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEC2B1BF406
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 17:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A921B83F00
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 17:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AB6RYa0U8rLa for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 17:07:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF64183EFD
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 17:07:03 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id e16so6518400pfc.6
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G73DoNvhpCf9AplqJY/Gr9sPBALSj+phpfBN31uOlEg=;
 b=CCpN2KTOKQcY7WOzaJ6ZshfMXXlZ0RLKsljDGCZpcLauG9OCLs8Spe5MbygFhuXJII
 ky26pzT4BwBHqWHvxY+ZsT6OhUcdWrx400gkZBS9JUST1m07ArzecuAtxZv+Y3KgMVQX
 7Nzgm5WAesVUDFQsmHz91Be6r6M0bClGyMY6+S7f/iImxxyhKqvB1c1stctK+TuMnb1d
 Jy0INxs6ANduj9yfh4BRSj+OPQBG9Hs5N05hxhNX8Qs+odq/+3hyVGqPswI64q8NdKhN
 BR9qY7autmSQ0nTOv/5RGgYmaOSdDHI/RCnqLhu9YigJQYiy59xP5CNVsIWwAi8KVXCE
 nQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G73DoNvhpCf9AplqJY/Gr9sPBALSj+phpfBN31uOlEg=;
 b=Gs2ymnLR6J0udn21n3QhTIGLc5MZKcklEYAfFY9EAB4Vb/STQP+8M+f4iQEh3byL+C
 Mt/YTqg5V/DeXy5vs1OA8XjgL+rBJWn7dtC+PTDMZ0wpjbNMXDCNVBtIWQaF5qUy7AD+
 22HryJSj6nBeAgtzwGKwyxNJi2rzTJs9x7ZV0FlaG8q8wN0wGLAXRBp4YZSK28VZch8S
 RqOJOv6WBWl6LEJd901uoGysbkZKCvhKIiMrxQLEsP/lLBZ6ft7m3rXbr9qiAWn4NHqU
 1MV5RLRR1aU5gT+AzHZcFfCY3/e3ISYX+4wsBBltAXCbRDLCu/J7U/+Gst+dGJHSTkSU
 oesg==
X-Gm-Message-State: AOAM533X03OqJjyKU+RLAbmw0MY8enWTDPiwTRngRdfTP8/jjDq1NxBB
 wzjZNWMTHsNrbzFrAJUTyXNeo0I4qBToIQ==
X-Google-Smtp-Source: ABdhPJxtzmswrxgTyq3MMn0FQ3y4NA7TQn++eRu3ooZFcog2PBqkRhlZPTosjTueMw8oidzkbh4JOQ==
X-Received: by 2002:a63:a804:: with SMTP id o4mr5809338pgf.309.1631812023015; 
 Thu, 16 Sep 2021 10:07:03 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id on6sm3469459pjb.19.2021.09.16.10.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 10:07:02 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 10:07:00 -0700
Message-Id: <20210916170700.1123980-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libglib2: bump version to 2.68.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Adam Duskett <aduskett@rivian.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Adam Duskett <aduskett@rivian.com>

Signed-off-by: Adam Duskett <aduskett@rivian.com>
---
 package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index 9393bd258a..c402cbafa5 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.2',
+   version : '2.68.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 15e0085f78..d421e025ff 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
-sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
+# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
+sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4f13622e36..af73aeb3bf 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
