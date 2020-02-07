From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri,  7 Feb 2020 16:39:27 +0100
Subject: [Buildroot] [PATCH] package/gnuradio: backport patch: drop
 boost/cstdint.hpp and use cstdint
Message-ID: <1581089967-28375-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-digital/glfsr.h include boost/cstdint.hpp to have uintxx_t.
These types are in boost namespace but nor using namespace xxx, nor boost:: are used.
The result is :
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
---
 ....h-drop-boost-cstdint.hpp-and-use-cs.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch

diff --git a/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
new file mode 100644
index 0000000000..335d59b63e
--- /dev/null
+++ b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
@@ -0,0 +1,38 @@
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
-- 
2.24.1
