Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51198C76196
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 11:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E84B82094;
	Tue, 28 Mar 2023 11:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E84B82094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXlUAZEr60Zg; Tue, 28 Mar 2023 11:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C491381FC0;
	Tue, 28 Mar 2023 11:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C491381FC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 963C61BF616
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 11:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F58B81FC0
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 11:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F58B81FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AY4EUlsKIHZZ for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 11:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 995B381FBD
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 995B381FBD
 for <buildroot@busybox.net>; Tue, 28 Mar 2023 11:14:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so7163195wmq.3
 for <buildroot@busybox.net>; Tue, 28 Mar 2023 04:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680002084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbczK72HBxKKTMbZ0Pz/Ll7G+EY2VDDTqudMZkex+7I=;
 b=1WI+ZsBVwRr0151Tw/FPV/C6DGt7Sx3jlDHRS5PBWxmA+aZ7xxJKru7dysbvRAl70F
 3nU+OTj2i4lpRZRZabeDBWTmK1nzeZGS9LKDb+76BsWbLD8nbv2/Jz28LoGo5cvwSuFL
 5OqJnczxcU3Fa+Y7bVCbxL3/uvZdBiE9lfftF+BBG4/g89t6yx9LYS/51yyARaJL3zL/
 1Jrn5efFROCQpWEZn2CN2i1mW81OwdUfzeutxZbltzOppqQV183LTiOXr/tTGXmWHLdy
 OUVFcADMayd+ifnwtV+7z/D6q+hiW6Q6aKYtGJSpjCtTV6yxBVb4eljD6BzdgK4Wfk+2
 jTwg==
X-Gm-Message-State: AO0yUKUtSxfAEF3UiPkevEC9vONfHjEsBPprAm1d2ASEnFWmLc7ctFir
 RZU9hZ3g99/5M/sfBo7od4KH/e7jNvU=
X-Google-Smtp-Source: AK7set9kEl4a5reEIN9++wPT8oLChTtCEr9GCNdNxYPhyAw/SrxOWbrSMMwPSIAzMKQdWWBX7hnHxQ==
X-Received: by 2002:a05:600c:2114:b0:3dc:1687:9ba2 with SMTP id
 u20-20020a05600c211400b003dc16879ba2mr11168163wml.35.1680002084403; 
 Tue, 28 Mar 2023 04:14:44 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003ef7058ea02sm5705575wmg.29.2023.03.28.04.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:14:43 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 28 Mar 2023 13:14:40 +0200
Message-Id: <20230328111440.1496294-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680002084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AbczK72HBxKKTMbZ0Pz/Ll7G+EY2VDDTqudMZkex+7I=;
 b=FV2YZcmWzJdcpmmdGJ78Gr5lSu4LXvYhwE+Kf44F6sF5gmGZDEkjrQ2F1oO3hP9Huv
 yQAwjtDGMQLHjM929LH4KLlMGceBmswljSn0GrcSt7kg6iFsffgJ/7Sqv5WRNbaGzCFY
 2pVFCq+H7RDmX+uVs5JDwH/yH39F4wvicAjDE4TqosUH0W30pYQ/QD7zsejHBUaTSS/O
 t3pQsymb0ABw9Hag/l+g7vAyKhVtj4t3lOjW+uv8tLblSrmeJItp06VezwP5K2sx+byd
 h3llCKuQF7Iyw97yl6EQvVeIaLg1XVAfsF/MWyyrZILXofxA9L2XZJRbC27WWvKAJbOK
 7dqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FV2YZcmW
Subject: [Buildroot] [PATCH] package/xz: bump to version 5.4.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPING:
+        Note: The JavaScript files (under the MIT license) have
+        been removed from the Doxygen-generated HTML version of the
+        liblzma API documentation. Doxygen itself is under the GNU GPL
+        but the remaining files generated by Doxygen are not affected
+        by the licenses used in Doxygen because Doxygen licensing has
+        the following exception:
+
+            "Documents produced by doxygen are derivative works
+            derived from the input used in their production;
+            they are not affected by this license."

diff COPYING.GPLv3: http --> https
- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-<http://www.gnu.org/licenses/>.
+<https://www.gnu.org/licenses/>.
-<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+<https://www.gnu.org/licenses/why-not-lgpl.html>.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xz/0001-Detect-symver-attribute-support.patch | 2 +-
 package/xz/xz.hash                                    | 8 ++++----
 package/xz/xz.mk                                      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/xz/0001-Detect-symver-attribute-support.patch b/package/xz/0001-Detect-symver-attribute-support.patch
index 462fa9d86..348b2d4c6 100644
--- a/package/xz/0001-Detect-symver-attribute-support.patch
+++ b/package/xz/0001-Detect-symver-attribute-support.patch
@@ -43,7 +43,7 @@ diff --git a/configure b/configure
 index ff0eed5..e685b30 100755
 --- a/configure
 +++ b/configure
-@@ -16687,6 +16687,21 @@ printf "%s\n" "" >&6; }
+@@ -16832,6 +16832,21 @@ printf "%s\n" "" >&6; }
  
  printf "%s\n" "#define HAVE_SYMBOL_VERSIONS_LINUX $have_symbol_versions_linux" >>confdefs.h
  
diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 1153e02b4..55a22b84a 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.2.10.tar.bz2.sig
-sha256  01b71df61521d9da698ce3c33148bff06a131628ff037398c09482f3a26e5408  xz-5.2.10.tar.bz2
+# https://tukaani.org/xz/xz-5.4.2.tar.bz2.sig
+sha256  aa49909cbd9028c4666a35fa4975f9a6203ed98154fbb8223ee43ef9ceee97c3  xz-5.4.2.tar.bz2
 
 # Hash for license files
-sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
+sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 0120d23b8..961059e6b 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.10
+XZ_VERSION = 5.4.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
