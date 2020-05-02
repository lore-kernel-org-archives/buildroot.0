From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 19:08:46 +0200
Subject: [Buildroot] [PATCH] package/qemu: disable curl for the host
 variant
In-Reply-To: <20200429225654.1864957-1-romain.naour@gmail.com>
References: <20200429225654.1864957-1-romain.naour@gmail.com>
Message-ID: <20200502170846.GP15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-30 00:56 +0200, Romain Naour spake thusly:
> Under certain circumstances (host distribution, openssl version),
> the qemu-system binary fail to start:
> 
> qemu-system-aarch64: symbol lookup error: /lib64/libssh.so.4: undefined symbol: EVP_KDF_ctrl, version OPENSSL_1_1_1b
> 
> There is no problem when only host-qemu is built, but it's linked with /lib64/libcurl.so.4
> $ make host-qemu
> $ ldd output/host/bin/qemu-system-aarch64
>         [...]
> 	libcurl.so.4 => /lib64/libcurl.so.4 (0x00007fb21cb57000)
> 	libssh.so.4 => /lib64/libssh.so.4 (0x00007fb21c35d000)
> 	libpsl.so.5 => /lib64/libpsl.so.5 (0x00007fb21c34a000)
> 	libssl.so.1.1 => /lib64/libssl.so.1.1 (0x00007fb21c2b4000)
> 
> Note: /lib64/libcurl.so.4 is linked with libssh and libssl:
> $ ldd /lib64/libcurl.so.4
> 	[...]
> 	libssh.so.4 => /lib64/libssh.so.4 (0x00007f90d8efd000)
> 	libpsl.so.5 => /lib64/libpsl.so.5 (0x00007f90d8eea000)
> 	libssl.so.1.1 => /lib64/libssl.so.1.1 (0x00007f90d8e54000)
> 
> Continue the build.
> $ make
> 
> We can notice that qemu_aarch64_virt_defconfig set
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> 
> So host-openssl package is built and this is the problem:
> 
> $ ldd output/host/bin/qemu-system-aarch64
> 	[...]
> 	libcurl.so.4 => /lib64/libcurl.so.4 (0x00007f3adb444000)
> 	libssh.so.4 => /lib64/libssh.so.4 (0x00007f3adac4a000)
> 	libpsl.so.5 => /lib64/libpsl.so.5 (0x00007f3adac37000)
> 	libssl.so.1.1 => /home/naourr/buildroot/test/qemu_aarch64_virt_defconfig-master/host/lib/libssl.so.1.1 (0x00007f3adaba8000)
> 
> qemu-system-aarch64: symbol lookup error: /lib64/libssh.so.4: undefined symbol: EVP_KDF_ctrl, version OPENSSL_1_1_1b
> 
> This is due to the build system trying to find libcurl using
> pkg-config or curl-config.
> 
> libcurl is used by the QEMU Block driver for CURL images and
> elf2dmp tool which is not needed.
> Instead of adding host-libcurl dependency, we can disable it
> entierely.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> There are a lot more build options that are not handled by
> the qemu package...
> ---
>  package/qemu/qemu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index e8b43d3b36..0bb29f9369 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -305,6 +305,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--extra-ldflags="$(HOST_LDFLAGS)" \
>  		--python=$(HOST_DIR)/bin/python3 \
>  		--disable-bzip2 \
> +		--disable-curl \
>  		--disable-libssh \
>  		--disable-sdl \
>  		--disable-vnc-jpeg \
> -- 
> 2.25.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
