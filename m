From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Sep 2018 08:05:22 +0300
Subject: [Buildroot] [PATCH 1/1] linuxptp: needs NPTL
In-Reply-To: <20180915192005.29373-1-fontaine.fabrice@gmail.com>
References: <20180915192005.29373-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916050522.bldd73xzol5nryte@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sat, Sep 15, 2018 at 09:20:05PM +0200, Fabrice Fontaine wrote:
> /home/buildroot/autobuild/run/instance-1/output/host/bin/or1k-linux-gcc   phc_ctl.o phc.o sk.o util.o clockadj.o sysoff.o print.o version.o  -lm -lrt  -o phc_ctl
> phc2sys.o: In function `do_loop':
> phc2sys.c:(.text+0x18bc): undefined reference to `clock_nanosleep'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a31e0a5ae15e1164115e4e5981ef5fb3c3284bcc

This should only affect 2018.02.x. The latest uClibc-ng version provides 
clock_nanosleep() even for non NPTL configurations.

baruch

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linuxptp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
> index 3e18a0cb13..a32dbde2e1 100644
> --- a/package/linuxptp/Config.in
> +++ b/package/linuxptp/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LINUXPTP
>  	bool "linuxptp"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
>  	help
>  	  The Linux PTP Project is the Precision Time Protocol
>  	  implementation according to IEEE standard 1588 for Linux.
> @@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
>  	  not a goal.
>  
>  	  http://linuxptp.sourceforge.net/
> +
> +comment "linuxptp needs a toolchain w/ NPTL"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
