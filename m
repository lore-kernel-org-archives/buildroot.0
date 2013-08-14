From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 14 Aug 2013 17:23:36 +0100
Subject: [Buildroot] [PATCH] toolchain: improving lib{32,64} symlinks
In-Reply-To: <1376482737-27650-1-git-send-email-s.martin49@gmail.com>
References: <1376482737-27650-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAG2jQ8g_Z1FzYo+0Ad7PcgdSi1i=gYbRZQTd15T1RL9-W286Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 August 2013 13:18, Samuel Martin <s.martin49@gmail.com> wrote:
> Usually 64-bit toolchains have a couple of lib64 directory containing
> all the 64-bit stuff.
> Some of them provide 32-bit ABI, and may store this stuff in lib32
> directory, this lib32 directory may be a mandatory at runtime for the
> libc interp (e.g. mips/n32-uClibc).
>
> This patch ensures that:
> - only things corresponding to the selected ABI is copied from the
>   external toolchain into the Buildroot sysroot;
> - the lib and lib64 (respectively lib32) directories point to the
>   same location (in the sysroot and the target tree), so there is no
>   confusion at buildtime for the compiler, and at runtime for the
>   libc interp;
>
> To achieve this, a new symbol - BR2_ARCH_64_NEEDS_LIB32 - has been
> introduce. It is only available for 64-bit toolchain and should be
> selected whenever the toolchain provides a 32-bit ABI and expect a
> lib32 directory exists (and this directory is a mandatory).
>
> A couple of things have also been reworked:
> - the symlinks lib -> lib64 and lib64 -> lib are now always created if
>   BR2_ARCH_IS_64 and !BR2_ARCH_64_NEEDS_LIB32, respectively the symlinks
>   lib -> lib32 and lib32 -> lib, if BR2_ARCH_IS_64 and BR2_ARCH_64_NEEDS_LIB32
>   (only available for the Buildroot and external toolchain backends);
> - the libs directories (in the sysroot an the target tree) are no longer
>   created by the dirs targets, but are deferred the toolchain backend
>   which will populate them accordingly, and create the symlinks.
>
> Before this patch:
> <snip>
> $ cd output-x86_64
> $ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:26 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/
> drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/
> drwxr-xr-x 5 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/
> drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/lib64 -> lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/usr/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/usr/lib64 -> lib/
> $ find . -type l -xtype l # find broken symlinks
> find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/lib': Too many levels of symbolic links
> find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/lib': Too many levels of symbolic links
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_files.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nis.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_compat.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nisplus.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libutil.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libthread_db.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcidn.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcrypt.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_hesiod.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnsl.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/librt.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_db.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libanl.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libBrokenLocale.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_dns.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libresolv.so
> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libdl.so
> ./target/etc/resolv.conf
> ./target/dev/log
>
> $ cd output-mips-n32
> $ ls -ld host/usr/mips64el-buildroot-linux-uclibc/sysroot/{,usr/}lib* target/{usr/,}lib*
> drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 14 14:05 target/lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 14 14:05 target/usr/lib/
> $ find . -type l -xtype l # find broken symlinks
> ./target/etc/resolv.conf
> ./target/dev/log
> </snip>
>
> After this patch:
> <snip>
> $ cd output-x86_64
> $ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
> lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib -> lib64/
> drwxr-xr-x 2 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/
> lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib -> lib64/
> drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/
> drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/lib64 -> lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/usr/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/usr/lib64 -> lib/
> $ find . -type l -xtype l # find broken symlinks
> ./target/etc/resolv.conf
> ./target/dev/log
>
> $ cd output-mips-n32
> $ ls -ld host/usr/mips64el-buildroot-linux-uclibc/sysroot/{,usr/}lib* target/{usr/,}lib*
> drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib32 -> lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib32 -> lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 14 13:55 target/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 target/lib32 -> lib/
> drwxr-xr-x 2 samuel users 4.0K Aug 14 13:55 target/usr/lib/
> lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 target/usr/lib32 -> lib/
> $ find . -type l -xtype l # find broken symlinks
> ./target/etc/resolv.conf
> ./target/dev/log
> </snip>
>
> Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
>
> ---
> changes v1 -> v2
>
> - add BR2_ARCH_64_NEEDS_LIB32 symbol (suggested by Thomas P. and Markos C.);
> - add create_lib32_symlinks helper;
> - more mkdir cleanup;
> - mips/n32 toolchain now selects BR2_ARCH_64_NEEDS_LIB32;
> * external toolchain backend:
>   - update the lib(32|64) symlink creation;
> * buildroot toolchain backend:
>   -rework HOST_GCC_FINAL_HANDLE_LIB64 hook (suggested by Markos C.).
> ---

Hi Samuel,

I've tested this patch for MIPS, MIPS64 o32 and n32 in both BR and
Sourcery Codebench toolchains and it seems to work fine. It certainly
fixes the n32 interp issue for MIPS. You have my

Tested-by/Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

Thank you!

ps: The http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d
returns 404 for me

-- 
Regards,
Markos Chandras
