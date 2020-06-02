From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2020 08:10:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mp4v2: fix build
 with gcc <= 5
Message-ID: <20200602062448.3E1A782AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cadbcbf5bbf5d584835a2d8daac5c6a91e6cb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: expand the patch' commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9b91147545ab24c7fd23f9b052d95f0813f22d1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-src-mp4track.cpp-replace-nullptr-by-NULL.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
new file mode 100644
index 0000000000..72bae463c9
--- /dev/null
+++ b/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
@@ -0,0 +1,50 @@
+From 78cf76b5d661e37e958163c37c0ad95940c09591 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 May 2020 11:42:19 +0200
+Subject: [PATCH] src/mp4track.cpp: replace nullptr by NULL
+
+Commit 15ec11166ba9ee7b77631d0d9234522f656cfd66 added code that uses
+nullptr. nullptr is C++11, it will break the build with gcc < 5.
+
+Semantically, NULL and nullptr are different, so should not be mixed.
+In this situaiton, m_File.FindAtom() indeed does not return nullptr,
+but NULL (on error, that is).
+
+Switch back to comparing against NULL.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ src/mp4track.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mp4track.cpp b/src/mp4track.cpp
+index 4b8fc9d..42489eb 100644
+--- a/src/mp4track.cpp
++++ b/src/mp4track.cpp
+@@ -908,16 +908,16 @@ File* MP4Track::GetSampleFile( MP4SampleId sampleId )
+        MP4FtypAtom *pFtypAtom = reinterpret_cast<MP4FtypAtom *>( m_File.FindAtom( "ftyp" ) );
+ 
+        // MOV spec does not require "ftyp" atom...
+-       if ( pFtypAtom == nullptr )
++       if ( pFtypAtom == NULL )
+        {
+-          return nullptr;
++          return NULL;
+        }
+        else
+        {
+           // ... but most often it is present with a "qt  " value
+           const char *majorBrand = pFtypAtom->majorBrand.GetValue();
+           if ( ::strcmp( pFtypAtom->majorBrand.GetValue(), "qt  " ) == 0 )
+-             return nullptr;
++             return NULL;
+        }
+        throw new Exception( "invalid stsd entry", __FILE__, __LINE__, __FUNCTION__ );
+     }
+-- 
+2.26.2
+
