From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 18 May 2017 23:35:57 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build on machines with
 libgpg-error installed
In-Reply-To: <1495058001-29457-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1495058001-29457-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <a75f7181-47dd-94fa-5e39-4d7e4f92d9e2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/05/2017 ? 23:53, Thomas Petazzoni a ?crit :
> In configuration where target architecture == host architecture, and
> libgpg-error is installed system-wide with development files, the build
> of cppcms fails with:
> 
> /home/test/buildroot/output/host/usr/bin/x86_64-amd-linux-gnu-g++  --sysroot=/home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wall -Wextra  -DNDEBUG   CMakeFiles/base64_test.dir/tests/base64_test.cpp.o  -o base64_test  -L/home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath,/home/test/buildroot/output/build/cppcms-1.0.5:/home/test/buildroot/output/build/cppcms-1.0.5/booster:/usr/lib -rdynamic libcppcms.so.1.0.5 booster/libbooster.so.0.0.3 -lpthread /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libpcre.so /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libdl.so /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_init at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_destroy at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_err_code_from_syserror at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_err_code_from_errno at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_unlock at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_strerror at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_strsource at GPG_ERROR_1.0'
> /home/test/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_lock at GPG_ERROR_1.0'
> 
> The problem comes from the
> "-Wl,-rpath,/home/test/buildroot/output/build/cppcms-1.0.5:/home/test/buildroot/output/build/cppcms-1.0.5/booster:/usr/lib"
> option, which tells the linker to search for libraries in /usr/lib.
> 
> This commit fixes that by asking CMake to not add any rpath when
> building cppcms.

I'm unable to reproduce this issue since I don't have /usr/lib at the end of
"-Wl,-rpath" line.

Even trying to execute the command line manually it build fine here. (I checked
that libgpg-error is installed).

Weird...

Otherwise ok for me.
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/a7eb1ede552ae14f409cfd7bd877bcf25ca69a74/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cppcms/cppcms.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
> index 1f6c09d..9d05e81 100644
> --- a/package/cppcms/cppcms.mk
> +++ b/package/cppcms/cppcms.mk
> @@ -11,6 +11,10 @@ CPPCMS_LICENSE_FILES = COPYING.TXT
>  CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
>  CPPCMS_INSTALL_STAGING = YES
>  
> +# disable rpath to avoid getting /usr/lib added to the link search
> +# path
> +CPPCMS_CONF_OPTS = -DCMAKE_SKIP_RPATH=ON
> +
>  CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
>  
>  ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
> 
