From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 17:45:26 +0100
Subject: [Buildroot] [git commit] gpsd: Fix building with gcc 6.x
Message-ID: <20161125164544.6F99581663@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4c050e9afed7a8dc302e6e1014cc4ffb508590d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building C++ parts of gpsd (for example Qt bindings) with gcc 6.x following
failure happens, see [1]:
------------------------------>8-------------------------------
<command-line>:0:0: warning: "_LARGEFILE_SOURCE" redefined
<command-line>:0:0: note: this is the location of the previous definition
In file included from clock_gettime.c:10:0:
compiler.h: In function 'void memory_barrier()':
compiler.h:93:25: error: 'memory_order_seq_cst' was not declared in this scope
     atomic_thread_fence(memory_order_seq_cst);
                         ^~~~~~~~~~~~~~~~~~~~
compiler.h:93:25: note: suggested alternative:
In file included from .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/atomic:41:0,
                 from compiler.h:75,
                 from clock_gettime.c:10:
.../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/atomic_base.h:62:7: note:   'memory_order_seq_cst'
       memory_order_seq_cst
       ^~~~~~~~~~~~~~~~~~~~
In file included from clock_gettime.c:10:0:
compiler.h:93:45: error: 'atomic_thread_fence' was not declared in this scope
     atomic_thread_fence(memory_order_seq_cst);
                                             ^
compiler.h:93:45: note: suggested alternative:
In file included from .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/atomic:41:0,
                 from compiler.h:75,
                 from clock_gettime.c:10:
.../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/atomic_base.h:101:3: note:   'std::atomic_thread_fence'
   atomic_thread_fence(memory_order __m) noexcept
   ^~~~~~~~~~~~~~~~~~~
scons: *** [qt-clock_gettime.os] Error 1
scons: building terminated because of errors.
------------------------------>8-------------------------------

As discussed on gpsd mailng list here [2] the only work-around as of today is to
add "-std=gnu++98" to both CFLAGS and CXXFLAGS which we implement here.

Fixes:
http://autobuild.buildroot.net/results/e8593a8ebf2f05cc93235a8129a2ba8b839d6d90
http://autobuild.buildroot.net/results/ff766f4f514c9cb4891873167f4e9b7870051883
http://autobuild.buildroot.net/results/1a4/1a4dbd9ee5e0c7255843228731beab030ca005ca
http://autobuild.buildroot.net/results/1a4/1a4dbd9ee5e0c7255843228731beab030ca005ca
and many others, see http://autobuild.buildroot.net/?reason=gpsd-3.16

[1] http://autobuild.buildroot.net/results/e85/e8593a8ebf2f05cc93235a8129a2ba8b839d6d90/build-end.log
[2] http://lists.nongnu.org/archive/html/gpsd-dev/2016-09/msg00082.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4fe5d18..73067d3 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -33,6 +33,8 @@ endif
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GPSD_LDFLAGS += -lstdc++
+GPSD_CFLAGS += -std=gnu++98
+GPSD_CXXFLAGS += -std=gnu++98
 GPSD_SCONS_OPTS += libgpsmm=yes
 else
 GPSD_SCONS_OPTS += libgpsmm=no
