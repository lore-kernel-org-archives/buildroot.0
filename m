From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 2 Mar 2020 23:01:55 +0100
Subject: [Buildroot] [RFC v2 2/2] package/qt5webengine: fix chromium arm
 compile flags
In-Reply-To: <20200302143007.17aa8819@windsurf.home>
References: <20200302091926.19308-1-ps.report@gmx.net>
 <20200302091926.19308-2-ps.report@gmx.net>
 <20200302143007.17aa8819@windsurf.home>
Message-ID: <20200302230155.0b241578@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 2 Mar 2020 14:30:07 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon,  2 Mar 2020 10:19:26 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
> > chromium compiler flags and uses some hard coded ARMv7 default values
> > for the compiler command line: '... -march=armv7-a -mfloat-abi=hard
> > -mtune=generic-armv7-a -mfpu=vfpv3-d16 ...'.
> >
> > This results e.g. in an illegal instruction failure for rpi zero
> > (reported on the mailing list, see [1]).
> >
> > Custom values could be set in the file src/3rdparty/chromium/build/config/arm.gni
> > (as tested by an proof-of-concept patch [2]).
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2020-February/274587.html
> > [2] http://lists.busybox.net/pipermail/buildroot/2020-February/274586.html
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Could we instead ask this thing to not do all this sorcery, and instead
> just use the compiler as-is, without passing crazy
> architecture-specific compiler flags ?

Disabled all march/mfloat-abi/mtune/mfpu flags with the following patch:

--- a/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+++ b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
@@ -672,7 +672,7 @@ config("compiler") {
     # TODO(pcc): The contents of .ARM.attributes should be based on the
     # -march flag passed at compile time (see llvm.org/pr36291).
     if (current_cpu == "arm") {
-      ldflags += [ "-march=$arm_arch" ]
+#      ldflags += [ "-march=$arm_arch" ]
     }
   }

@@ -752,13 +752,13 @@ config("compiler_cpu_abi") {
         ldflags += [ "--target=arm-linux-gnueabihf" ]
       }
       if (!is_nacl) {
-        cflags += [
-          "-march=$arm_arch",
-          "-mfloat-abi=$arm_float_abi",
-        ]
+#        cflags += [
+#          "-march=$arm_arch",
+#          "-mfloat-abi=$arm_float_abi",
+#        ]
       }
       if (arm_tune != "") {
-        cflags += [ "-mtune=$arm_tune" ]
+#        cflags += [ "-mtune=$arm_tune" ]
       }
     } else if (current_cpu == "arm64") {
       if (is_clang && !is_android && !is_nacl && !is_fuchsia) {
@@ -1130,7 +1130,8 @@ config("clang_revision") {

 config("compiler_arm_fpu") {
   if (current_cpu == "arm" && !is_ios && !is_nacl) {
-    cflags = [ "-mfpu=$arm_fpu" ]
+#    cflags = [ "-mfpu=$arm_fpu" ]
+    cflags = [ ]
     asmflags = cflags
   }
 }

Quick (if you call can call it quick with miniumum 50 minutes compile time)
worked for a buildroot toolchain (which defaults to the right cpu) and
the rpi zero testcase..., but now no buildroot specific flags are
used for the compile (no optimize, no custom, no cpu type etc.)...,
will work with compilers with the right default values...

Not sure if other optional compiles depend on the right setting
of one of the arm_... parameters...

Regards,
Peter

>
> Thomas
