From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:04:42 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/opencv3: link
 with libatomic if needed
Message-ID: <20201029153517.0FF2A86437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee8023f8d8ca23eca67a01b15fc6d380706317d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Restore the atomic workaround that was wrongly removed when bumping to
version 3.4.9 in commit f6fb2cae0691d25b034b12a16261ee26096db7d1 as it
seems that opencv3 still needs help to detect atomic library

Fixes:
 - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dd69967123870383496b5c8eb7b574e8b156b36d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 1ab5cf1efd..70b0a4039f 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -13,6 +13,11 @@ OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
 
 OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENCV3_CXXFLAGS += -latomic
+endif
+
 # Fix c++11 build with missing std::exception_ptr
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
