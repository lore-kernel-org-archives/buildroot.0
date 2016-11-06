From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 16:43:27 +0100
Subject: [Buildroot] [PATCH] package/qemu: disable Qemu user-land
 emulation for musl toolchains
In-Reply-To: <1478441720-7653-1-git-send-email-romain.naour@gmail.com>
References: <1478441720-7653-1-git-send-email-romain.naour@gmail.com>
Message-ID: <ea162f2b-4b5a-5b87-3a4a-41c863e7aa2a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 15:15, Romain Naour wrote:
> Like for cyclictest (rt-test)[1], linux-user/syscall.c use the
> definition of the "struct sigevent" from Glibc/uClibc which doesn't
> build with musl libc.
> 
> So, disable Qemu user-land emulation for musl toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b27/b277e668d9e22b624416bf46f6ccba802acd257e
> 
> [1] 43bffa59e7359610c8f00038ddd97795c0ca35e1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/qemu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index ea6b946..138d96a 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -69,6 +69,8 @@ comment "systems emulation needs a toolchain w/ dynamic library"
>  
>  config BR2_PACKAGE_QEMU_LINUX_USER
>  	bool "Enable all Linux user-land emulation"
> +	# Incompatible "struct sigevent" definition on musl
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	help
>  	  Say 'y' to build all Linux user-land emulators that QEMU supports.
>  

 Shouldn't a comment be added?

 Regards,
 Arnout

> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
