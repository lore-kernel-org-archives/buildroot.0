From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:47:22 +0200
Subject: [Buildroot] [git commit] package/gnuradio: revert patch 003 removal
Message-ID: <20200415203312.7BA6D8ED74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe916adaed8162278c9faff553099baa6f11ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 14476b7fcaf102dcc39b5d4919a4f08660f821de ("package/gnuradio:
bump to 3.8.1.0"), all gnuradio patches were dropped. However, it
turns out that the path
0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch was
applied in gnuradio master branch but has not been backported to
maint-3.8.  So this patch can't be supressed as we are using gnuradio
3.8.1.0.

Fix:
  http://autobuild.buildroot.net/results/79a7dabc20016bcf11afe22e6a5691edbba2455b/
  http://autobuild.buildroot.net/results/7342833ebcc8f399d98ba05e63fce6b60403371e/
  http://autobuild.buildroot.net/results/1807c1b054623148f0a2e55dd998b0b428f48b47/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
new file mode 100644
index 0000000000..532bebcf2e
--- /dev/null
+++ b/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
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
