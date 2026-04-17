Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E21F8E4B6
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3883E40A5C;
	Fri, 17 Apr 2026 07:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh0wEUVA8Hnp; Fri, 17 Apr 2026 07:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6491640A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776411443;
	bh=IpC/hgxFm3tA86FBFzvpo63AzwqDvtSxFCrsZSkKGGQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aGXEL+I9vGUn8pyn8k2wQYn/hLa+s45u77Zatz1Dv7NXfZeTPWeZc0DB1zF2wHgZ4
	 VZkRLeL9A7N1RdL3zm0n64leYxcY5YwI1w/+i8kxswBUb3YOZHGzGyZQ0fTXoNYxf/
	 I2/yjyKKSEcMEUWV6Ht1OfYJwrXqF5elxPgVXXga9tEbQhvdaqgD031tYMQhZqn8xy
	 8sSZyZ+V4bZS0mi9nTQqAhPWwDRYZOcSoMoGBXFxgR7ui0zG5UN3s/o7W8Uzmk5VCf
	 c7wZTabjTvkpm3wlycAgNmHc1s/AT10u8JS6q1NuAvDbiZ3KPcTijtduAM9sUb7SeG
	 GO8D+xGU0PDqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6491640A68;
	Fri, 17 Apr 2026 07:37:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3054E396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22BF040A68
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDQQqkh5psn0 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 07:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5399140A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5399140A5C
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5399140A5C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:37:21 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso2399385ad.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 00:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776411440; x=1777016240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jlzt0V+NrQyk+lovwTJbgUuHoVkF0AJPFs8fgLYZ+do=;
 b=JKJltivLAIVn5luzAXPqGVXRkRfQcVNfxA+P5sxmUDofcuuJeRjtMtZ/WRKWtRS9ke
 iCK0qPZ3BuLloBY47wuc6aeggjYkO+ypx+69TSSXHb7cWsI92BgMVXryWAZPC/S8wNcB
 a5KMZfWcYZGQU7/yXoznAgE20FML40xXDMlUt0Q7wvZ3QTTlpqK3MEVH50J6UxQPKGr2
 FZU38NMPSUvkJ1D7z+l5RJvDLv9AaI6MPGR9S8naq11ifaG7xG8MJl1v6JbfMW38tkCa
 IawkIJwfShUFT+Lx/K7oD1cX7S2LgtzdAg116tB1Pbt0sEGI4Vu/CwsTeeEAB9z60bHr
 qt0Q==
X-Gm-Message-State: AOJu0YyObeN8kjR1tFrV0QMLlBr+TX9cXLIutCd4DGy8iIGBr4B2aQ9P
 Ju7fzwWTAZatGySOVJN9S9/MGvh1erKnvW43NHd6BisP3Mku+lZGX2o7ACoRfg==
X-Gm-Gg: AeBDiesXgvfBWyEcHt6kcof+SJncpUXd91ZYyoXARL0Jmux1ekxK07ZkxMvPYoS3JRR
 QUDAGcCLVEwdR+1mS/y8nz6Hilrqix53xVRgYlrlWNUYIL1XnwhN6j5YGkY4fhdQ0Vixv3Ds1gZ
 1dg4Sn/VQBjRR4QRwcCQ1rgpNKTWqXUZK0G7EygZskXjWiLxlHWIKEio6ZjkE0iqk+5ry7+JOl2
 chpSXE11hi2wmwbMHEMQKibkfBlxY4/hby1Dydd4O2TlLXOSfkWrVgNYWCoc5USaQZ/JvjMUYlK
 YmgLiw5iQnd2N/oZnZ3w+P7f/SkxTqkOZqH2lrw69sShTE0QN4w96YcNhWfDb1Liiv+G8OlnaN6
 Vrkhyh4hp69gNjdima6d4y0LcNO9NguYMzHlx3QFA7b8im5bOdkXDu6+uh3KMJVijKoQ7UBBjxa
 +31LkAxcAEg4upddkJ9xaldokMnDjxgBZYZ2RvuE3ArtRqiQ==
X-Received: by 2002:a17:902:da87:b0:2b2:a267:784a with SMTP id
 d9443c01a7336-2b5f9f51ab1mr19695385ad.24.1776411440012; 
 Fri, 17 Apr 2026 00:37:20 -0700 (PDT)
Received: from fedora ([152.58.163.125]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa30047sm10551725ad.28.2026.04.17.00.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 00:37:19 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 17 Apr 2026 13:07:01 +0530
Message-ID: <20260417073702.53790-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776411440; x=1777016240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jlzt0V+NrQyk+lovwTJbgUuHoVkF0AJPFs8fgLYZ+do=;
 b=KSD6pXwLOKfHeAnDdLUkVp48EcAZbsO6ZPg0zghN3soXUgKe6XqCSgqVUXRG2VGtEP
 N2GpEPMPtQapFsTjuficErMajUTydMJhh7Bsaw/enlya5ypsI5FNP6/jDWYOH7ZfXTKx
 IvlfoEXA26VxO/zn4SyP7Y9aZmw3+nmlAh4wj5YvULnpEHxkFEU5NaFB5DtmKUeA9miq
 jOeys2KBgDe8WTd5judR7kUqgUHFdaJl1KmUU04V0WIxZlXYAcFOaWA/S4Bl5dYunqgg
 SHCYceNX2BheEBG3HaBoFCbuTGNTLuDCv+jPuo/ejlSf6XtXZrITikY6A51AG/7tuXLA
 XkkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KSD6pXwL
Subject: [Buildroot] [PATCH] package/autoconf: bump to version 2.73
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Bump version to 2.73
- Update 0001-dont-add-dirty-to-version.patch for 2.73:
  - Adjust line numbers for git-version-gen
  - Handle the new '-modified' suffix (previously '-dirty')
- Add Upstream: Pending tag to patch

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../0001-dont-add-dirty-to-version.patch      | 25 +++++++++++--------
 package/autoconf/autoconf.hash                |  2 +-
 package/autoconf/autoconf.mk                  |  2 +-
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index a1a50d2838..2060cabdc7 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -1,28 +1,31 @@
-autoconf: don't append -dirty to version
+autoconf: don't append -modified to version
 
-Don't append -dirty to autoconf version number if the buildroot git tree
+Don't append -modified to autoconf version number if the buildroot git tree
 has uncommitted changes.
 
 This script is meant for the autoconf developers, but it also activates
 if you build autoconf in a subdirectory of a git tree (E.G. like how it's
 commonly done in buildroot).
 
-The affect is that autoconf gets built as being version 2.65-dirty, which
-breaks programs (like Python) which explicitly checks for autoconf-2.65.
+The effect is that autoconf gets built as being version 2.73-modified, which
+breaks programs (like Python) which explicitly checks for autoconf-2.73.
 
 [Gustavo: update for autoconf 2.69]
+[Shubham: update for autoconf 2.73]
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Upstream: Pending
 
-diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
---- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
-+++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
-@@ -210,7 +210,7 @@
+diff -Nura autoconf-2.73.orig/build-aux/git-version-gen autoconf-2.73/build-aux/git-version-gen
+--- autoconf-2.73.orig/build-aux/git-version-gen
++++ autoconf-2.73/build-aux/git-version-gen
+@@ -234,7 +234,7 @@
        *) # Append the suffix only if there isn't one already.
            case $v in
-             *-dirty) ;;
--            *) v="$v-dirty" ;;
-+            #*) v="$v-dirty" ;;
+             *-dirty | *-modified) ;;
+-            *) v="$v-modified" ;;
++            #*) v="$v-modified" ;;
            esac ;;
    esac
  fi
diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index f94b2d9de5..41d40ec7b8 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a  autoconf-2.72.tar.xz
+sha256  9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e  autoconf-2.73.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 48bfc80e7f..6f29bba146 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.72
+AUTOCONF_VERSION = 2.73
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
