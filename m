From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Mar 2016 17:47:14 +0000
Subject: [Buildroot] [git commit] package/gdb: add optional support for
	xz
In-Reply-To: <20160216221411.4849680439@busybox.osuosl.org>
References: <20160216221411.4849680439@busybox.osuosl.org>
Message-ID: <56DDBEA2.1010901@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Bernd, all,

for some reason gdb fails to build with xz and expat support at the same
time when using an external toolchain.

This is how the problem is shown:

checking for liblzma... no
configure: error: missing liblzma for --with-lzma

Try this defconfig if you want to reproduce the problem:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

Using the above defconfig, the error in the gdb/config.log will look
like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/i686-pc-linux-gnu-gcc -o
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os
-I/br/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/lib64/liblzma.so.5: undefined reference to `clock_gettime at GLIBC_2.17'
collect2: error: ld returned 1 exit status

You can also use this defconfig to reproduce the problem for MIPS:

BR2_mips=y
BR2_mips_32r2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

In that case the error will look like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/mips-linux-gnu-gcc -o conftest
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
 -I/br/output/host/usr/mips-buildroot-linux-gnu/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.2.0/../../../../mips-linux-gnu/bin/ld:
skipping incompatible /lib64/liblzma.so.5 when searching for
/lib64/liblzma.so.5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.2.0/../../../../mips-linux-gnu/bin/ld:
cannot find /lib64/liblzma.so.5
collect2: error: ld returned 1 exit status

You can also use this defconfig to reproduce the problem for ARM:

BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

In that case the error will look like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/arm-linux-gnueabihf-gcc -o
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os
-I/br/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/lib64/liblzma.so.5: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

Regards,

Vincent.

On 16/02/16 22:14, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=18ce7f11ff3481308d911c362f0c2ef44b9492bc
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> When xz was compiled before, gdb will use it as optional dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.1]
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gdb/gdb.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 3b0f501..32d52eb 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -118,6 +118,13 @@ else
>  GDB_CONF_OPTS += --without-expat
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +GDB_CONF_OPTS += --with-lzma
> +GDB_DEPENDENCIES += xz
> +else
> +GDB_CONF_OPTS += --without-lzma
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GDB_CONF_OPTS += --with-zlib
>  GDB_DEPENDENCIES += zlib
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
