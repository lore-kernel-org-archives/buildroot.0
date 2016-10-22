From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:22:10 +0200
Subject: [Buildroot] [git commit] package/opencv3: fix CMAKE_CXX_FLAGS
Message-ID: <20161022144115.ACE61819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb26296666d81c4f85355a94c16dc190d3f2015d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 4904c4c "package/opencv3: use BR2_TOOLCHAIN_HAS_LIBATOMIC"
overrides CMAKE_CXX_FLAGS with the single -latomic, losing all ABI
CFLAGS that are passed there by default. This breaks build on xtensa
where ABI CFLAGS contain important code generation options.

Append $(TARGET_CXXFLAGS) to CMAKE_CXX_FLAGS along with -latomic.

Fixes:
  http://autobuild.buildroot.net/results/7f1c96abd8fbb5b358a07100ab623316e9bb9dcd
  http://autobuild.buildroot.net/results/e0c93d0f6d1da0d62d4dbba211a275bfe75e9645
  http://autobuild.buildroot.net/results/53e7e4b4b6a7b48b8012799d7507f7594dbf01b2

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv3/opencv3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 2529de9..10660a9 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -12,7 +12,7 @@ OPENCV3_LICENSE_FILES = LICENSE
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
+OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
 # OpenCV component options
