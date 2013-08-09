From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Aug 2013 09:05:16 +0200
Subject: [Buildroot] [PATCH v2] libffi: Add -mno-compact-eh when
	compiling for Mips
In-Reply-To: <1376031037-24302-1-git-send-email-jezz@sysmic.org>
References: <CAAXf6LWPNPFD21XxZ5gMWROzUjt99KKTUPPtNmG6XmFXSwC1Kg@mail.gmail.com>
 <1376031037-24302-1-git-send-email-jezz@sysmic.org>
Message-ID: <CAAXf6LVam6V0kSNye-K6kgpNSz+YQbrQ_9LVyB54H00pdsT+7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Aug 9, 2013 at 8:50 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Fix compilation on Mips. Resolve issues detected here:
>     http://autobuild.buildroot.net/results/f0c9db496233f53c26e92294d7305aa4511ec7b3/
>     http://autobuild.buildroot.net/results/8968690c248df86b040218867f92b573721e872c/
>     http://autobuild.buildroot.net/results/a35db8e6a49d022133b486b12f6a8e40b3c95b6e/
>
> Also remove previous special case handling defined in libffi.mk.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  It looks like I sent wrong version of the patch. Sorry for disturbance.
>
>  ...-002-Fix-use-of-compact-eh-frames-on-MIPS.patch |   25 ++++++++++++++++++++
>  package/libffi/libffi.mk                           |    6 -----
>  2 files changed, 25 insertions(+), 6 deletions(-)
>  create mode 100644 package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch
>
> diff --git a/package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch b/package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch
> new file mode 100644
> index 0000000..552f735
> --- /dev/null
> +++ b/package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch
> @@ -0,0 +1,25 @@
> +Newer MIPS toolchains use a different (compact) eh_frame format.
> +libffi don't like them, so we have to switch to the older format.
> +
> +This patch add -mno-compact-eh to CFLAGS when compiling for
> +Mips and compiler support it.
> +
> +--- a/configure.ac     2013-08-08 14:53:11.884267155 +0200
> ++++ b/configure.ac     2013-08-08 14:54:14.437493244 +0200
> +@@ -430,6 +430,16 @@
> + AM_CONDITIONAL(FFI_EXEC_TRAMPOLINE_TABLE, test x$FFI_EXEC_TRAMPOLINE_TABLE = x1)
> + AC_SUBST(FFI_EXEC_TRAMPOLINE_TABLE)
> +
> ++if test x$TARGET = xMIPS; then
> ++    save_CFLAGS="$CFLAGS"
> ++    CFLAGS=-mno-compact-eh
> ++    AC_MSG_CHECKING([whether CC need -mno-compact-eh])

Not that it is critical, but I would reformulate this message to
better match the standard autoconf strings, something like:
"whether the C compiler needs -mno-compact-eh"

> ++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
> ++                      [AC_MSG_RESULT([yes])]; [save_CFLAGS="$save_CFLAGS -mno-compact-eh"],
> ++                      [AC_MSG_RESULT([no])])
> ++    CFLAGS="$save_CFLAGS"
> ++fi
> ++
> + if test x$TARGET = xX86_64; then
> +     AC_CACHE_CHECK([assembler supports unwind section type],
> +       libffi_cv_as_x86_64_unwind_section_type, [
> diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
> index 51cbbce..0ad5c84 100644
> --- a/package/libffi/libffi.mk
> +++ b/package/libffi/libffi.mk
> @@ -11,12 +11,6 @@ LIBFFI_LICENSE_FILES = LICENSE
>  LIBFFI_INSTALL_STAGING = YES
>  LIBFFI_AUTORECONF = YES
>
> -# Newer CS MIPS toolchains use a different (compact) eh_frame format
> -# libffi don't like them, just switch to the older format
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
> -LIBFFI_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
> -endif
> -
>  # Move the headers to the usual location, and adjust the .pc file
>  # accordingly.
>  define LIBFFI_MOVE_STAGING_HEADERS

Other than that:

Reviewed-and-tested-by: Thomas De Schampheleire
<thomas.de.schampheleire@gmail.com>
[tested on the last autobuild link mentioned]
