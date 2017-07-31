From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Jul 2017 22:22:44 +0200
Subject: [Buildroot] [PATCH] gdb: force to use ncurses and not termcap
 for host-gdb
In-Reply-To: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
References: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
Message-ID: <abeca2cb-f76b-2f0d-bf8c-4285fd9a28af@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 29/07/2017 ? 22:06, Thomas Petazzoni a ?crit :
> Both our target and host gdb depend on ncurses (host-ncurses for
> host-gdb, of course). However, while for the target we passs
> --with-curses, we are not doing this for the host variant. Due to
> this, host-gdb default to using the termcap library: if such a library
> is available on the build system, it will be used instead of the
> host-ncurses we have built. This causes the host gdb binary to depend
> on a library that we do not provide in $(HOST_DIR), breaking the
> principle of a standalone SDK (which should only depend on the C
> library).
> 
> To solve this, we simply pass --with-curses in HOST_GDB_CONF_OPTS,
> which forces host-gdb to use the host-ncurses library.

I did a test and indeed libtinfo.so.6 from the host is used without this patch.

ldd test/random/host/usr/bin/arm-linux-gdb
	linux-vdso.so.1 (0x00007ffc767f2000)
	libz.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libz.so.1
(0x00007f590258c000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f5902388000)
	*libtinfo.so.6 => /lib64/libtinfo.so.6 (0x00007f590215c000)*
	libm.so.6 => /lib64/libm.so.6 (0x00007f5901e53000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f5901c35000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f5901a32000)
	libpython2.7.so.1.0 =>
/home/naourr/buildroot-test/test/random/host/lib/libpython2.7.so.1.0
(0x00007f5901618000)
	libexpat.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libexpat.so.1
(0x00007f59013ed000)
	liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f59011c7000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f5900e01000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f59027a3000)


ldd test/random/host/usr/bin/arm-linux-gdb
	linux-vdso.so.1 (0x00007ffd69108000)
	libz.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libz.so.1
(0x00007f10674e0000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f10672dc000)
	*libncurses.so.6 =>
/home/naourr/buildroot-test/test/random/host/lib/libncurses.so.6
(0x00007f1067082000)*
	libm.so.6 => /lib64/libm.so.6 (0x00007f1066d79000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f1066b5b000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f1066958000)
	libpython2.7.so.1.0 =>
/home/naourr/buildroot-test/test/random/host/lib/libpython2.7.so.1.0
(0x00007f106653e000)
	libexpat.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libexpat.so.1
(0x00007f1066313000)
	*liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f10660ed000)*
	libc.so.6 => /lib64/libc.so.6 (0x00007f1065d27000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f10676f7000)

But as you can see there is another library that can be provided by Buildroot
liblzma.so.5.

If host-xz is build before host-gdb the result is slightly different :

ldd test/random/host/usr/bin/arm-linux-gdb
	linux-vdso.so.1 (0x00007ffebf9d8000)
	libz.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libz.so.1
(0x00007f7347802000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f73475fe000)
	libncurses.so.6 =>
/home/naourr/buildroot-test/test/random/host/lib/libncurses.so.6
(0x00007f73473a4000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f734709b000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f7346e7d000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f7346c7a000)
	libpython2.7.so.1.0 =>
/home/naourr/buildroot-test/test/random/host/lib/libpython2.7.so.1.0
(0x00007f7346860000)
	libexpat.so.1 => /home/naourr/buildroot-test/test/random/host/lib/libexpat.so.1
(0x00007f7346635000)
	*liblzma.so.5 => /home/naourr/buildroot-test/test/random/host/lib/liblzma.so.5
(0x00007f734640f000)*
	libc.so.6 => /lib64/libc.so.6 (0x00007f7346049000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f7347a19000)

Otherwise:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gdb/gdb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 73b0ea0..1fef0d4 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -203,6 +203,7 @@ HOST_GDB_CONF_OPTS = \
>  	--enable-threads \
>  	--disable-werror \
>  	--without-included-gettext \
> +	--with-curses \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
> 
