Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A6BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E45C82AF8;
	Sat, 22 Jan 2022 22:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qxLqZIlT1AW; Sat, 22 Jan 2022 22:36:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B104583E1A;
	Sat, 22 Jan 2022 22:36:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3080F1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4D040871
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkrL8rIBiBuy for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:36:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F226840529
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:36:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso21811754wmf.1
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdVVXBsOJsGmU7VRi/zi6fmubLHOmXyrCVx3fbaMjFY=;
 b=iNxVkwAlX2TY9qk0lNylXmGsxYHGthid/g/G/feQNpi2Vb2fIcsIsgVzQtS4zh0VeW
 qFHmmh5CWYYtLhSQySmFdHEyc8eYfxbOA7phUTlzek8G2khmgUd5FDcHNs+HYf5qdRS8
 hHCCCKYlp+e8KWEHIOjcvbYqniwX6FJj1gq0U2R4u4+2vSwsd0xa4eyhVjI3cbj9Pis4
 vlS5MXFpcMgMApR+XLuCW9szzBkq+QvwxQUngqUR///6LAyEb0Re+oM4fr65E7Cipgn2
 OjKg7vD/XVozronvNDOdaIxgVoceSeUym279V2VfhFQTQViImqZLpX+NyJF/nYFiFkk1
 M1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdVVXBsOJsGmU7VRi/zi6fmubLHOmXyrCVx3fbaMjFY=;
 b=4vm6yzTcU6b7NjPK5CgbW3cw3bdTNQn6M/8n6C0AeNv+V67LHBKNIECriyx0pidCCX
 8vLBk3L4WWxYUphYQokoT7Xe+jUh07XhYvDGmKtgGOGa4x3f8RUP6Zx7pg/s4BHz6s5M
 5qmHONwtLPUO8kGCuGDnsIW6v54d/kga7y5i4AMY7g9sia6Q9w7B7/ke/0pvHhAZ3Ygr
 E3GLXAFW8xZzvXOg1kuiWFeoFyWjbNMBk4SF8VX6GyKDK1xx8mDbBMevNH9vR0v2+ODn
 xW+myCsFP83Yn8dMQk4s4ReTO0NI6GHBxzrGSmqN6QRbhSMjXWPRSiceOH78Z0AkqWLj
 ybwQ==
X-Gm-Message-State: AOAM5311nWRJ56uJxnwymitpo3iUUX0I4MGzBSnwZExj47atVKXKSOnm
 /tg3+5MvhV4WGwxNc+e75+KpU4/PyB8=
X-Google-Smtp-Source: ABdhPJxYl3F02PvA2g8w904Paolg9PcebiXcIsBJTTSi7fG2Ap8kZ5UAoXlwTqGoeLyzNNUIijzPDw==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr6001876wmc.104.1642891012068; 
 Sat, 22 Jan 2022 14:36:52 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id w9sm16313140wmc.36.2022.01.22.14.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:36:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:35:16 +0100
Message-Id: <20220122223516.306713-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cereal: bump to version 1.3.1
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of LICENSE file (license updated to match BSD template:
  https://github.com/USCiLab/cereal/commit/8291f44e05d3e3ee3c4fc9e088231789b701e17e)
- Update indentation in hash file (two spaces)

https://github.com/USCiLab/cereal/releases/tag/v1.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...alized-shared_ptr-within-the-archive.patch | 67 -------------------
 package/cereal/cereal.hash                    | 10 +--
 package/cereal/cereal.mk                      |  5 +-
 3 files changed, 6 insertions(+), 76 deletions(-)
 delete mode 100644 package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch

diff --git a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch b/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
deleted file mode 100644
index 3458ec1b59..0000000000
--- a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f27c12d491955c94583512603bf32c4568f20929 Mon Sep 17 00:00:00 2001
-From: Michael Walz <code@serpedon.de>
-Date: Tue, 2 Feb 2021 00:50:29 +0100
-Subject: [PATCH] Store a copy of each serialized shared_ptr within the archive
- to prevent the shared_ptr to be freed to early. (#667)
-
-The archives use the memory address pointed by the shared_ptr as a
-unique id which must not be reused during lifetime of the archive.
-Therefore, the archives stores a copy of it.
-This problem was also reported as CVE-2020-11105.
-
-[Retrieved from:
-https://github.com/USCiLab/cereal/commit/f27c12d491955c94583512603bf32c4568f20929]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/cereal/cereal.hpp       | 13 +++++++++++--
- include/cereal/types/memory.hpp |  2 +-
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/include/cereal/cereal.hpp b/include/cereal/cereal.hpp
-index 99bed9d6..f0d15e8b 100644
---- a/include/cereal/cereal.hpp
-+++ b/include/cereal/cereal.hpp
-@@ -369,12 +369,17 @@ namespace cereal
-           point to the same data.
- 
-           @internal
--          @param addr The address (see shared_ptr get()) pointed to by the shared pointer
-+          @param sharedPointer The shared pointer itself (the adress is taked via get()).
-+                               The archive takes a copy to prevent the memory location to be freed
-+                               as long as the address is used as id. This is needed to prevent CVE-2020-11105.
-           @return A key that uniquely identifies the pointer */
--      inline std::uint32_t registerSharedPointer( void const * addr )
-+      inline std::uint32_t registerSharedPointer(const std::shared_ptr<const void>& sharedPointer)
-       {
-+        void const * addr = sharedPointer.get();
-+
-         // Handle null pointers by just returning 0
-         if(addr == 0) return 0;
-+        itsSharedPointerStorage.push_back(sharedPointer);
- 
-         auto id = itsSharedPointerMap.find( addr );
-         if( id == itsSharedPointerMap.end() )
-@@ -645,6 +650,10 @@ namespace cereal
-       //! Maps from addresses to pointer ids
-       std::unordered_map<void const *, std::uint32_t> itsSharedPointerMap;
- 
-+      //! Copy of shared pointers used in #itsSharedPointerMap to make sure they are kept alive
-+      //  during lifetime of itsSharedPointerMap to prevent CVE-2020-11105.
-+      std::vector<std::shared_ptr<const void>> itsSharedPointerStorage;
-+
-       //! The id to be given to the next pointer
-       std::uint32_t itsCurrentPointerId;
- 
-diff --git a/include/cereal/types/memory.hpp b/include/cereal/types/memory.hpp
-index 59e9da9b..cac1f334 100644
---- a/include/cereal/types/memory.hpp
-+++ b/include/cereal/types/memory.hpp
-@@ -263,7 +263,7 @@ namespace cereal
-   {
-     auto & ptr = wrapper.ptr;
- 
--    uint32_t id = ar.registerSharedPointer( ptr.get() );
-+    uint32_t id = ar.registerSharedPointer( ptr );
-     ar( CEREAL_NVP_("id", id) );
- 
-     if( id & detail::msb_32bit )
diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
index ddaf54e7b4..18889b4d42 100644
--- a/package/cereal/cereal.hash
+++ b/package/cereal/cereal.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256 329ea3e3130b026c03a4acc50e168e7daff4e6e661bc6a7dfec0d77b570851d5  cereal-1.3.0.tar.gz
-sha256 18fd7618c44c9fe28b5f54cd19747df3c0472ed33e8507fea571e2acf6e72f34  LICENSE
-sha256 d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
-sha256 7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
-sha256 794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
+sha256  65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976  cereal-1.3.1.tar.gz
+sha256  58604a126af6a671ea390ee3d5b3e42228aa59b2858fb7af1d5b20b31739ccbb  LICENSE
+sha256  d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
+sha256  7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
+sha256  794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index 19faa2ac4e..a44f09c743 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CEREAL_VERSION = 1.3.0
+CEREAL_VERSION = 1.3.1
 CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
 # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
 CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
@@ -16,7 +16,4 @@ CEREAL_CONF_OPTS = \
 	-DTHREAD_SAFE=ON \
 	-DJUST_INSTALL_CEREAL=ON
 
-# 0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
-CEREAL_IGNORE_CVES += CVE-2020-11105
-
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
