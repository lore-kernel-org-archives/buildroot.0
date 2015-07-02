From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 2 Jul 2015 23:12:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix building if GCC's C
 standard is not gnu99
In-Reply-To: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150702231241.69ef0bea@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Thu,  2 Jul 2015 20:05:02 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> checking for /home/fli4l/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99... unsupported
> configure: error: Building libdrm requires C99 enabled compiler
> 
> using this defconfig
> BR2_KERNEL_HEADERS_4_0=y
> BR2_BINUTILS_VERSION_2_25=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_LIBDRM=y
> 
> Patch inspired by
> http://git.buildroot.net/buildroot/commit/?id=5cf5b390385fb6325485e37dc9d38e1e3ac1f091
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdrm/libdrm.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 4cca645..1768214 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
>  	--disable-cairo-tests \
>  	--disable-manpages
>  
> +LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> +
>  ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
>  LIBDRM_CONF_OPTS += --enable-intel
>  LIBDRM_DEPENDENCIES += libatomic_ops libpciaccess

Same problem with libv4l (with raspberrypi_defconfig):

  libv4l2rds.c:256:2: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
    for (int i = 0; i < tuning->station_cnt; i++) {
    ^
  libv4l2rds.c:256:2: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

From build/libv4l-1.6.2/config.log:

configure:4709: checking for .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to accept ISO C99
configure:4858: .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:54:9: error: unknown type name 'wchar_t'
   const wchar_t *name;


The C99 detection problem seems more related to missing wchar_t type support than the compiler option?


Adding LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=c99' gives a lot of compile errors like:

libv4lconvert.c: In function 'dev_ioctl':
processing/../libv4lsyscall-priv.h:85:10: error: 'SYS_ioctl' undeclared (first use in this function)
  syscall(SYS_ioctl, (int)(fd), (unsigned long)(cmd), (void *)(arg))
          ^
libv4lconvert.c:43:9: note: in expansion of macro 'SYS_IOCTL'
  return SYS_IOCTL(fd, cmd, arg);
         ^
processing/../libv4lsyscall-priv.h:85:10: note: each undeclared identifier is reported only once for each function it appears in
  syscall(SYS_ioctl, (int)(fd), (unsigned long)(cmd), (void *)(arg))
          ^
libv4lconvert.c:43:9: note: in expansion of macro 'SYS_IOCTL'
  return SYS_IOCTL(fd, cmd, arg);
         ^

Adding LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' solves all configure/compile errors.

Maybe it is a uclibc-ng and/or autoconf related problem (and there is a better/more general) solution
other than to overwrite ac_cv_prog_cc_c99 for a lot of packages?

Regards,
Peter
