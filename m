From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 20:24:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/gd: fix addition of -liconv in
 gdlib.pc.in
In-Reply-To: <20210427185347.158518-1-fontaine.fabrice@gmail.com>
References: <20210427185347.158518-1-fontaine.fabrice@gmail.com>
Message-ID: <2b619ce3-eb7e-9aea-db35-0716aff396b0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2021 20:53, Fabrice Fontaine wrote:
> Static build of gnuplot with gd and libiconv is broken since bump to
> version 2.3.1 in commit 970b2ca3cc3f927f679c871eeadb22ec110b0ed5:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libgd.a(gdkanji.o): in function `do_convert':
> gdkanji.c:(.text+0x148): undefined reference to `libiconv_open'
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gdkanji.c:(.text+0x1d0): undefined reference to `libiconv'
> 
> This build failure is raised because LIBS has been replaced by
> LIBS_PRIVATES in gdlib.pc.in since
> https://github.com/libgd/libgd/commit/28ecfe77c817aff8ce56422d3e4e8533a281bc76
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5ab5f4744adfd8d8be483204a9c7f59e34ce26c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gd/gd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gd/gd.mk b/package/gd/gd.mk
> index 97a1a143ec..2df81e6d37 100644
> --- a/package/gd/gd.mk
> +++ b/package/gd/gd.mk
> @@ -36,7 +36,7 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  GD_DEPENDENCIES += libiconv
>  # not strictly needed for gd, but ensures -liconv ends up in gdlib.pc
> -GD_CONF_ENV += LIBS="-liconv"
> +GD_CONF_ENV += LIBS_PRIVATES="-liconv"
>  endif
>  
>  ifeq ($(BR2_PACKAGE_JPEG),y)
> 
