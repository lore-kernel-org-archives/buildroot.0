From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 11:35:31 +0100
Subject: [Buildroot] [git commit] package/gnuradio: backport build fixes
 with less use of Boost
Message-ID: <20200209111420.AAD908D7AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e84ea995d7de321aeb8fdcf2835e411a6f06727a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport patch from upstream to fix build failures such as:

    In file included from /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/glfsr.cc:23:
    /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/../include/gnuradio/digital/glfsr.h:42:5: error: 'uint32_t' does not name a type; did you mean 'u_int32_t'?
        uint32_t d_shift_register;
        ^~~~~~~~
        u_int32_t

Since Gnuradio policy is Less boost == better and C++11 is used, use cstdint
instead of boost/cstdint.hpp.

Applied in gnuradio master (475e4a156b516c089175afb998acdc80b740b437)

fix:
 - http://autobuild.buildroot.net/results/14015f499e58fee530877ac052878bbe2f799942/
 - http://autobuild.buildroot.net/results/53239f98dd5e03d4dc1bb4eb91ed765f77dbf0ec/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998 at free.fr:
  - add upstream reference in the patch itself
  - minor eye-candy in commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
new file mode 100644
index 0000000000..532bebcf2e
--- /dev/null
+++ b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
@@ -0,0 +1,39 @@
+From f643bc12100c67288adda3699a9e61d6a66fb529 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Fri, 7 Feb 2020 16:49:30 +0100
+Subject: [PATCH] gr-digital:glfsr.h: drop boost/cstdint.hpp and use cstdint
+
+gr-digital/glfsr.h include boost/cstdint.hpp to have uintxx_t.
+These types are in boost namespace but nor using namespace xxx, nor boost:: are used.
+The result is :
+In file included from /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/glfsr.cc:23:
+/home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/../include/gnuradio/digital/glfsr.h:42:5: error: 'uint32_t' does not name a type; did you mean 'u_int32_t'?
+uint32_t d_shift_register;
+^~~~~~~~
+u_int32_t
+
+Since Gnuradio policy is Less boost == better and C++11 is used, use cstdint
+instead of boost/cstdint.hpp.
+
+[backported from 475e4a156b516c089175afb998acdc80b740b437]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ gr-digital/include/gnuradio/digital/glfsr.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gr-digital/include/gnuradio/digital/glfsr.h b/gr-digital/include/gnuradio/digital/glfsr.h
+index 0b5141f1f..1003bcd01 100644
+--- a/gr-digital/include/gnuradio/digital/glfsr.h
++++ b/gr-digital/include/gnuradio/digital/glfsr.h
+@@ -24,7 +24,7 @@
+ #define INCLUDED_DIGITAL_GLFSR_H
+ 
+ #include <gnuradio/digital/api.h>
+-#include <boost/cstdint.hpp>
++#include <cstdint>
+ 
+ namespace gr {
+ namespace digital {
+-- 
+2.24.1
+
