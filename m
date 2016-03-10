From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 23:18:31 +0100
Subject: [Buildroot] [git commit] gcc: fix dynamic linker path for mips
	soft-float
Message-ID: <20160310222039.CEFC7802F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=348d5edd91abec1fc4cc27965220d54e58217dc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the gcc musl patches for gcc 4.7, 4.8 and 4.9 so
that the path to the dynamic linker encoded as "program interpreter"
in the generated binaries actually matches the symbolic link installed
by musl when building for mips soft-float.

Indeed, musl installs a symlink called ld-musl-mipsel-sf.so.1, but gcc
currently generates binaries that use /lib/ld-musl-mips.so as program
interpreter.

The fix is simply the one from
https://bitbucket.org/GregorR/musl-cross/commits/825219202365, i.e
adjust MUSL_DYNAMIC_LINKER in our musl gcc patches.

Thanks to these patches:

$ ./host/usr/bin/mipsel-linux-readelf -a ./target/bin/busybox
[...]
      [Requesting program interpreter: /lib/ld-musl-mipsel-sf.so.1]
[...]

gcc 5.x doesn't need any fix because the musl patches already use the
right value.

Fixes bug #7562.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.7.4/900-musl-support.patch | 2 +-
 package/gcc/4.8.5/900-musl-support.patch | 2 +-
 package/gcc/4.9.3/900-musl-support.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/4.7.4/900-musl-support.patch b/package/gcc/4.7.4/900-musl-support.patch
index 67b8c30..bf8fbc0 100644
--- a/package/gcc/4.7.4/900-musl-support.patch
+++ b/package/gcc/4.7.4/900-musl-support.patch
@@ -478,7 +478,7 @@ Index: b/gcc/config/mips/linux.h
 +#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
 +#endif
 +#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
 Index: b/gcc/config/rs6000/linux64.h
 ===================================================================
 --- a/gcc/config/rs6000/linux64.h
diff --git a/package/gcc/4.8.5/900-musl-support.patch b/package/gcc/4.8.5/900-musl-support.patch
index 6743a88..6840fcc 100644
--- a/package/gcc/4.8.5/900-musl-support.patch
+++ b/package/gcc/4.8.5/900-musl-support.patch
@@ -332,7 +332,7 @@ Index: b/gcc/config/mips/linux.h
 +#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
 +#endif
 +#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
 Index: b/gcc/config/rs6000/linux64.h
 ===================================================================
 --- a/gcc/config/rs6000/linux64.h
diff --git a/package/gcc/4.9.3/900-musl-support.patch b/package/gcc/4.9.3/900-musl-support.patch
index a711b06..90f64de 100644
--- a/package/gcc/4.9.3/900-musl-support.patch
+++ b/package/gcc/4.9.3/900-musl-support.patch
@@ -637,4 +637,4 @@ Index: b/gcc/config/mips/linux.h
 +#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
 +#endif
 +#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
