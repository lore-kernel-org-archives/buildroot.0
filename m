Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512ED60ADC;
	Mon,  3 Jan 2022 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovSj0Eowsazz; Mon,  3 Jan 2022 21:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D6E760B3A;
	Mon,  3 Jan 2022 21:08:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2AF71BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF9B8401BA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiIpQ5ms0lL0 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:08:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 543BC401A2
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641244096;
 bh=+JSxwPKuDg1cYKKn8H7hVCmPOaWbDDJOki8gI1V8DYk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Vnit1F8s8PHxXNAJbGXALhbM2Ue1lepjEt+wNn/1Jx2rXcEWAWyOYwGux9E+cxBW0
 sd+JIjya/W+uXyDbleznflUYbVQGzDCvNDsZPPrjswmVyc8oTQc7TKkd2VmeDZ3fwS
 LJZm+G2zPzOBy5LZkBAUfhE6wnNmJ+KzlPl7il6I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mulm5-1mCwJ12Rgx-00rsL2 for <buildroot@buildroot.org>; Mon, 03 Jan 2022
 22:08:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:08:16 +0100
Message-Id: <20220103210816.26410-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:h0p7qvdLXv8mw5lh1nEdmMe58S3SMigB8mdOOFldn+jsacZYPj+
 nv+GQ3nzIvd8kBwz7LGh77dSqJVI1xWPp7wxDTnWYZrURejDITkznOTVXmiyPZ++5z4iQ8w
 alM5A8vSnpz95LW1NT/J0ooH7+ZVAhhwdi68dyVelfTLdrR+gi0I5XjT1qyiLxjRFlMmXFx
 e0yx64Fu2/2eHdzZ+NEiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6GJQw9M+5v0=:y9u2tIoIBaJ3wr0+Uj5RQF
 hjDAkjZPSfuZdXRKQU2UVkMp9bbgHng1v1bCOPFzjZ4r65U9UX+m8448HH4D9+lnw7Q5FMgTa
 iYURSqrF7S1Gdy9uPXcquiUSd1im8KsgwFeGQQlrGlICV6ZImiYubkWCSC031CT2eAMxPTy4X
 tQcJLorJj+hiTNOxfmp8IZpgPEvqdfzqQvwwjdfa0Q7U+Tex3pGV1jof0+y0mt7iygpmbRDJe
 guTtI8Mjg7+zNOBSrlQiUWCUJCWZWZNSJCQiWZfZdFzFgdbIFLpWr4MEBNIsUfU2zKZIQgVen
 jfz7M7hyoO9nBzOWqy0UKe2ksSwrovGZKUErwNp3SfMd9QDvXdWgmaX+6WtbPrCKN9MQiH5Ef
 gM1zW9VFiRHfOrrJuL1TjnfZZtdlC0v2sT9jbD3i5yD7a23EeWg/AJ/xkzeOEOFbo0n8stW8o
 ApejHCd/hbnFxxEXShcwx+bqdUKXnSoQOUHyjslLMBlRo4CR3lD9/9keof9j9dSDAktR7PmGG
 +KQOZQC+1wYcNQfbqgz9i7bfMB9KIxMXDbpgsJV61lYU+y2ZpGZEBgy+iiUHSDPnDQJQvziEc
 Ana5xat+G8+6txXge6D01Og7wnx2atSXFpcfbCAqFBC91zyhGqSCKX5qA/0EBBfLo9skO/AWZ
 LCKExraQb6RYdi2Ic9XwqJCUDzcrX7tcBfZurdDatasGOfHVy5zPzv8Cf9/gt/hC14Doy8xgJ
 qT51Pg6ud7sTaIdDPE1/mZ6OTEjglbCtdw+XAzKmBTpF15OabPpgTSUzOchU2nSrpF1LotowP
 KtP5KtJozBxuXtI6qPYDNEhVFRLVbZe5UrmRdVzbIc/FpyEhVTlktZgLLKMeFsvc2uhIxajGy
 398XPqrZTJ61Kx+la4iMqInOt1u4rOXUguFaLC7/tOGVrWwYEeo5/QcXVNdOt1o+qqXS85z0a
 cyh0n3ai6iW59JZ44hS1JyPzNbzakzT4jPreuLnZh+L2+AFNAlRj2SV7/psSpbCPFhjQLX+q8
 OUbnMy/9UZGKD1CMNZu0fHle7fltzUtR9pzIpwSyrPVE5Si/onvo7n8MzwOIMuqEH5TkgQNk4
 5HWXCvrfKq9k/o=
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.5
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

- remove 0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
  (upstream applied [1]).

For details see [2].

[1] https://github.com/assimp/assimp/commit/a099fe7cd331a839137115db5df1733c4c1c8070
[2] https://github.com/assimp/assimp/releases/tag/v5.1.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-explicit-namespace-instead-of-using.patch | 57 -------------------
 package/assimp/assimp.hash                    |  2 +-
 package/assimp/assimp.mk                      |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch

diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
deleted file mode 100644
index c83e9c50a4..0000000000
--- a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 30 Dec 2021 18:01:54 +0100
-Subject: [PATCH] BlenderScene: use explicit namespace instead of using
- namespace
-
-Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
-
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
-           const FileDatabase &db) const {
-                                   ^
- In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
-                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
-       void Convert(T &dest, const FileDatabase &db) const;
-            ^
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
-           const FileDatabase &db) const {
-                                   ^
-  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
-                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
-       void Convert(T &dest, const FileDatabase &db) const;
-            ^
-
-[backport from upstream commit a099fe7cd331]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
-index c93d913fc..9ad086fe6 100644
---- a/code/AssetLib/Blender/BlenderScene.cpp
-+++ b/code/AssetLib/Blender/BlenderScene.cpp
-@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include "BlenderDNA.h"
- #include "BlenderSceneGen.h"
- 
--using namespace Assimp;
--using namespace Assimp::Blender;
-+namespace Assimp {
-+namespace Blender {
- 
- //--------------------------------------------------------------------------------
- template <>
-@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
-     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
- }
- 
-+} // namespace Blender
-+} //namespace Assimp
-+
- #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
--- 
-2.34.1
-
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 89b8d168c2..8f6d613bb4 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd32cdc27e1f8b7ac09d914ab92dd81d799c97e9e47315c1f40dcb7c6f7938c6  assimp-5.1.4.tar.gz
+sha256  d62b58ed3b35c20f89570863a5415df97cb1b301b444d39687140fc883717ced  assimp-5.1.5.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index ead5d73bca..b5f84ef56f 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.4
+ASSIMP_VERSION = 5.1.5
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
