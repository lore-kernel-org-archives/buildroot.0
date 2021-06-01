From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 21:59:35 +0200
Subject: [Buildroot] [git commit] package/libcutl: fix build with gcc 11
Message-ID: <20210601193423.1A04D8142B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d6ca0a8acac3509f1008799f3a72d3490572e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -std=c++11 to fix the following build failure with gcc 11:

In file included from shared-ptr/base.cxx:5:
../cutl/shared-ptr/base.hxx:34:41: error: ISO C++17 does not allow dynamic exception specifications
   34 | operator new (std::size_t, cutl::share) throw (std::bad_alloc);
      |                                         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/60a39d402a0d051c92aa11421b7a14f7729a0380

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcutl/libcutl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcutl/libcutl.mk b/package/libcutl/libcutl.mk
index 49c05e6019..2b704ad3b8 100644
--- a/package/libcutl/libcutl.mk
+++ b/package/libcutl/libcutl.mk
@@ -11,5 +11,6 @@ LIBCUTL_SITE = https://www.codesynthesis.com/download/libcutl/$(LIBCUTL_VERSION_
 LIBCUTL_INSTALL_STAGING = YES
 LIBCUTL_LICENSE = MIT
 LIBCUTL_LICENSE_FILES = LICENSE
+HOST_LIBCUTL_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(host-autotools-package))
