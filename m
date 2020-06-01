From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:18:31 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mp4v2: security
 bump to version 4.1.3
Message-ID: <20200602060932.E63BB8263A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98bf47237b2655e466826c736cc4c9bcdbf10254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Switch site to an active fork
- Send patch upstream
- Update indentation in hash file (two spaces)
- Fix the following CVEs:
  - CVE-2018-14054: A double free exists in the MP4StringProperty class
    in mp4property.cpp in MP4v2 2.0.0. A dangling pointer is freed again
    in the destructor once an exception is triggered.
    Fixed by
    https://github.com/TechSmith/mp4v2/commit/f09cceeee5bd7f783fd31f10e8b3c440ccf4c743
  - CVE-2018-14325: In MP4v2 2.0.0, there is an integer underflow (with
    resultant memory corruption) when parsing MP4Atom in mp4atom.cpp.
    Fixed by
    https://github.com/TechSmith/mp4v2/commit/e475013c6ef78093055a02b0d035eda0f9f01451
  - CVE-2018-14326: In MP4v2 2.0.0, there is an integer overflow (with
    resultant memory corruption) when resizing MP4Array for the ftyp
    atom in mp4array.h.
    Fixed by
    https://github.com/TechSmith/mp4v2/commit/70d823ccd8e2d7d0ed9e62fb7e8983d21e6acbeb
  - CVE-2018-14379: MP4Atom::factory in mp4atom.cpp in MP4v2 2.0.0
    incorrectly uses the MP4ItemAtom data type in a certain case where
    MP4DataAtom is required, which allows remote attackers to cause a
    denial of service (memory corruption) or possibly have unspecified
    other impact via a crafted MP4 file, because access to the data
    structure has different expectations about layout as a result of
    this type confusion.
    Fixed by
    https://github.com/TechSmith/mp4v2/commit/73f38b4296aeb38617fa3923018bb78671c3b833
  - CVE-2018-14403: MP4NameFirstMatches in mp4util.cpp in MP4v2 2.0.0
    mishandles substrings of atom names, leading to use of an
    inappropriate data type for associated atoms. The resulting type
    confusion can cause out-of-bounds memory access.
    Fixed by
    https://github.com/TechSmith/mp4v2/commit/51cb6b36f6c8edf9f195d5858eac9ba18b334a16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a860f21e1b8004ee937c20d54d29a5e66f96651)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/0001-Fix-GCC7-build.patch | 1 +
 package/mp4v2/Config.in                 | 2 +-
 package/mp4v2/mp4v2.hash                | 3 +--
 package/mp4v2/mp4v2.mk                  | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mp4v2/0001-Fix-GCC7-build.patch b/package/mp4v2/0001-Fix-GCC7-build.patch
index 90222c10ae..4e39be4a79 100644
--- a/package/mp4v2/0001-Fix-GCC7-build.patch
+++ b/package/mp4v2/0001-Fix-GCC7-build.patch
@@ -10,6 +10,7 @@ no encoding parameters ppEncodingParams will be returned as a pointer to
 an empty string rather than as a null pointer
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Upstream status: https://github.com/TechSmith/mp4v2/pull/36]
 ---
  src/rtphint.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 490ebac9fd..172d1baabe 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MP4V2
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
 
-	  https://code.google.com/archive/p/mp4v2/
+	  https://github.com/TechSmith/mp4v2/
 
 if BR2_PACKAGE_MP4V2
 
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index d75c1994d9..85fce49384 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,4 +1,3 @@
-# From https://code.google.com/p/mp4v2/downloads/detail?name=mp4v2-2.0.0.tar.bz2
-sha1 193260cfb7201e6ec250137bcca1468d4d20e2f0 mp4v2-2.0.0.tar.bz2
 # Locally computed
+sha256  e3ad6c2dc451b0875dbe34bfe7f51f4fe278b391434c886083e6d3ecd5fa08c2  mp4v2-4.1.3.tar.gz
 sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index b6b7d9ae5e..478d10d472 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 2.0.0
-MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
-MP4V2_SITE = https://mp4v2.googlecode.com/files
+MP4V2_VERSION = 4.1.3
+MP4V2_SITE = \
+	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
 MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
