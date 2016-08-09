From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue,  9 Aug 2016 15:24:31 +0200
Subject: [Buildroot] [PATCH] gnuradio: backport patch to fix gr-fec
	compilation
Message-ID: <1470749071-20784-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Fix:
http://autobuild.buildroot.net/results/f14/f14f4f62b5f23c652fa9411d9c569c2ab3394fb5

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 .../gnuradio/0003-fix_compilation_in_gcc-6.patch   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/gnuradio/0003-fix_compilation_in_gcc-6.patch

diff --git a/package/gnuradio/0003-fix_compilation_in_gcc-6.patch b/package/gnuradio/0003-fix_compilation_in_gcc-6.patch
new file mode 100644
index 0000000..e0ef855
--- /dev/null
+++ b/package/gnuradio/0003-fix_compilation_in_gcc-6.patch
@@ -0,0 +1,36 @@
+commit a1cf11937665392bcfa223a5095ff903eb44c69b
+Author: Jaroslav #karvada <jskarvad@redhat.com>
+Date:   Fri Feb 12 18:29:13 2016 +0100
+
+Backport patch from
+http://gnuradio.org/redmine/projects/gnuradio/repository/revisions/a1cf11937665392bcfa223a5095ff903eb44c69b
+
+Fix compilation in gcc-6
+	    
+Signed-off-by: Jaroslav #karvada <jskarvad@redhat.com>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+diff --git a/gr-fec/include/gnuradio/fec/polar_decoder_common.h b/gr-fec/include/gnuradio/fec/polar_decoder_common.h
+index b0ecb85..a39ee4f 100644
+--- a/gr-fec/include/gnuradio/fec/polar_decoder_common.h
++++ b/gr-fec/include/gnuradio/fec/polar_decoder_common.h
+@@ -28,6 +28,10 @@
+ #include <gnuradio/fec/generic_decoder.h>
+ #include <gnuradio/fec/polar_common.h>
+ 
++#ifndef BOOST_CONSTEXPR_OR_CONST
++#define BOOST_CONSTEXPR_OR_CONST const
++#endif
++
+ namespace gr {
+   namespace fec {
+     namespace code {
+@@ -64,7 +68,7 @@ namespace gr {
+         bool set_frame_size(unsigned int frame_size){return false;};
+ 
+       private:
+-        static const float D_LLR_FACTOR = -2.19722458f;
++        static BOOST_CONSTEXPR_OR_CONST float D_LLR_FACTOR = -2.19722458f;
+         unsigned int d_frozen_bit_counter;
+ 
+       protected:
-- 
2.7.3
