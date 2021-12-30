Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC019C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E41409C0;
	Thu, 30 Dec 2021 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W51bBrOpLNH2; Thu, 30 Dec 2021 17:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99324409D4;
	Thu, 30 Dec 2021 17:25:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 669871BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62886827E0
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75vPti5FnTDS for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:25:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F184827C6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640885108;
 bh=kDK00QqSH9WM/dLJX/Gtp39xVzm8zEu269DYI+Lx2qA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=a/IaqV6Y5DzoHwJUO9mSE7QEOBJnFEpXfcMPkJBWH4ctiAB+N66ywZg9OIEWWZL0z
 H9mcnqDyw1Nfk2TfORP1SIJU1J3aMqyxXrf713pRwSmDdOYPFuQnHDld4VOAbQZ8pN
 BPkiHLq2KewIjO3KoZRHp97iv78BRv3XoTEn6NPc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.96]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1mO4Lw2MmC-015HCt
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 18:25:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:25:07 +0100
Message-Id: <20211230172507.30212-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:RnaBl+Wgg5YtzjKCuYCQ48SvEaFP40u48yg0b44RazR90bXsXm+
 XC9ME3zF/i7VbIM0heU3ec5OJAxtmFTJGrQ442K2WTrIxod9JtWo2GBL7PaJ8unGg/3t/CP
 AEnKGLxgbPXyOVbETz3FOScSCqTgn0szXfS6RWIv/pF9VpVOjS1mOix6PVQLXmKvn77v+hG
 K0ypWBw3wfEZ/kXCajNmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Og4QDOYIMSY=:DZJeS1uzlbXupV5LTTQFUw
 782LN8Q83JgWBbxOeGEqnXj1X/sSgrQ8mjI1lHc06XpAmg7wZyeA9CRJF7wn/qswGBel74TIB
 oD/uLedUtxkL5D0ZaHeLKqhQ4XvHRmpJ/ZN7jM3ogjjFtLaOOHkZZkNhxpGBFbW/8KorbuujH
 AD90EOZDOVUdzYRvbfMtpoLo17bxMnoDy/sXDlBJtCYcwyBo7p4q9QpkbuGr63ZVcZLvDyuCV
 yiC0LVxrs+avgo6M+BKJ0H5aCLlyScOWnhYERTCa/qJvmBGql+KXDhrDA+PIe3PHZKtV18GmI
 y+ehsBfkXwmt4p7dgmmz9RCGQBj1Rc84OIC/KUxKbyDNJJYfi5yEYyDrFXhOKVQ83Yc9IeC0/
 wKIsIk4Iketw6ASosBrwLr7CayHJZ1NBcG+yow4Ey+if6PzR21LY3NrQq7bnSEj3IZ8GE3+l3
 6MygO4ZH6QzRWrfEBF35EPSlKqaIbPf+SkT/GKAjbBu5P2xosVbChsf8Z4JtzxY//69FdxfJ5
 rnLuO8UKVe8OGrLuh765wkZFxhjNsuUIB4By9isZ8eJvqLjJrq1n9KTFuCWcO7LQ8T25Ahcyd
 peiZ7Ad5lgzFm/RTjKLUseeQuPPgnDkJeleCqnz43cjZxMEHnLZ+pBjbYcQ5dOkhENMPxbjjn
 cxOWFxqbfGCBPkTryls91TVge0gvR2I2XTXGVi6yBcULV30ZCTOKR9rmI7sU5P11/eHhbg22h
 UXCUm7EiiMHcWsC9xc63LkHmWO094foMPOaG/man4jhAdzbeTRSkNRK8iFb9zt8DjmNaaA0Wm
 8w/f8kfj/O4eHdlnqIoqKVoZd4creD9+vBhPfkRAgmPVsxGO+ntZsX4WVZaimO4IzKXezmFnD
 w5TEqUdD5pHFgvP2E/8WOd00qQlofzqsdImFjh4/Ajc14MejpJ7vQSCfFJWlKDKUc1LBwR7ih
 7YD3R+prGErMoDj7Erqi0jbp1I2bLY/c4v34pKRChoNHg0kwbGnuAQwlZ5gnrC8x+KSiv68yT
 p3KprRfUUX2eQbZuMztUVNNe/lG50sEdatSUpbfkbWAE+8jUfBe5FWDicvdTK5WpRzWef/I58
 AjGQfl5aoUWCF4=
Subject: [Buildroot] [RFC v1] package/assimp: fix namespace related compile
 failure
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

Fixes:

  - http://autobuild.buildroot.net/results/0861c66ec02a55e984577094e28b65c78b95a330

  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
           const FileDatabase &db) const {
                                   ^
 In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
       void Convert(T &dest, const FileDatabase &db) const;
            ^
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
           const FileDatabase &db) const {
                                   ^
  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
       void Convert(T &dest, const FileDatabase &db) const;
            ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - patch fixes the compile failure but did not find the root cause
    and/or a good explanation why the template spezialisation failes
    for Structure::Convert<CollectionObject> and
    Structure::Convert<CollectionChild> (but not the other ones) and
    why it is fixed by the patch...
---
 ...-explicit-namespace-instead-of-using.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch

diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
new file mode 100644
index 0000000000..b498c3be3f
--- /dev/null
+++ b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
@@ -0,0 +1,56 @@
+From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 30 Dec 2021 18:01:54 +0100
+Subject: [PATCH] BlenderScene: use explicit namespace instead of using
+ namespace
+
+Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
+
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
+           const FileDatabase &db) const {
+                                   ^
+ In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
+                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
+       void Convert(T &dest, const FileDatabase &db) const;
+            ^
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
+           const FileDatabase &db) const {
+                                   ^
+  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
+                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
+       void Convert(T &dest, const FileDatabase &db) const;
+            ^
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
+index c93d913fc..9ad086fe6 100644
+--- a/code/AssetLib/Blender/BlenderScene.cpp
++++ b/code/AssetLib/Blender/BlenderScene.cpp
+@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include "BlenderDNA.h"
+ #include "BlenderSceneGen.h"
+ 
+-using namespace Assimp;
+-using namespace Assimp::Blender;
++namespace Assimp {
++namespace Blender {
+ 
+ //--------------------------------------------------------------------------------
+ template <>
+@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
+     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
+ }
+ 
++} // namespace Blender
++} //namespace Assimp
++
+ #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
