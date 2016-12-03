From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 3 Dec 2016 23:32:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-12-02
In-Reply-To: <20161203073024.3586721D20@mail.free-electrons.com>
References: <20161203073024.3586721D20@mail.free-electrons.com>
Message-ID: <20161203233249.08ff4c7b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Dec 2016 08:30:24 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> Build statistics for 2016-12-02
> ================================

> microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/c1cd60d3f44f2938e5f42453d034ea070898f837
>       xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/c3a6662f0acfda179a58cdad9165f36826229826

  CC       libgstreamer_1.0_la-gstbus.lo
In file included from gst_private.h:42:0,
                 from gstbufferpool.c:66:
../gst/gstconfig.h:112:4: error: #error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
 #  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."


This error message was introduces between gstreamer-1.8 and 1.10 with
commit 'gstconfig.h: Detect unaligned access support at compile-time' ([1]):

diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
index 8654627..0ec1509 100644
--- a/gst/gstconfig.h.in
+++ b/gst/gstconfig.h.in
@@ -95,8 +95,22 @@
 /* Configures the use of external plugins */
 @GST_DISABLE_PLUGIN_DEFINE@
 
-/* whether or not the CPU supports unaligned access */
- at GST_HAVE_UNALIGNED_ACCESS_DEFINE@
+/* Whether or not the CPU supports unaligned access
+ * The macros used are defined consistently by GCC, Clang, MSVC, Sun, and ICC
+ *
+ * References:
+ * https://sourceforge.net/p/predef/wiki/Architectures/
+ * https://msdn.microsoft.com/en-us/library/b0084kay.aspx
+ * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
+ * https://software.intel.com/en-us/node/583402
+ */
+#if defined(__alpha__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__mips__) || defined(__sh__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64)
+#  define GST_HAVE_UNALIGNED_ACCESS 0
+#elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64)
+#  define GST_HAVE_UNALIGNED_ACCESS 1
+#else
+#  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
+#endif


Time to add defines for microblazeel and xtensa, any hint which defines and at
unaligned acess yes/no?

Regards,
Peter

[1] https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?h=1.10&id=6ef601367e0f5adb7a8b02cec94dec04fccf701a
