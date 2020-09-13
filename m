From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Sep 2020 20:22:23 +0300
Subject: [Buildroot] [PATCH 1/1] package/libcap: needs MMU
In-Reply-To: <20200913165048.2685092-1-fontaine.fabrice@gmail.com>
References: <20200913165048.2685092-1-fontaine.fabrice@gmail.com>
Message-ID: <878sddwq0g.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabric,

On Sun, Sep 13 2020, Fabrice Fontaine wrote:
> libcap uses fork() since version 2.33 and
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ef485973d5547431782f9e5f4323eabfebb38622
>
> So add MMU dependency to avoid the following build failure on
> applications using libcap without MMU such as ntp:
>
> /tmp/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /tmp/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libcap.a(cap_proc.o): in function `cap_launch':
> /tmp/instance-0/output-1/build/libcap-2.42/libcap/cap_proc.c:912: undefined reference to `fork'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/89f39dae01c07977062b909079bfcd45a68060d3

It might be worth noting that all current libcap reverse dependencies
depend on MMU already.

baruch

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcap/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libcap/Config.in b/package/libcap/Config.in
> index 5b0c827191..1145ff0dd2 100644
> --- a/package/libcap/Config.in
> +++ b/package/libcap/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBCAP
>  	bool "libcap"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  This library implements the user-space interfaces to the
>  	  POSIX 1003.1e capabilities available in Linux kernels. These


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
