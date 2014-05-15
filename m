From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 23:23:55 +0200
Subject: [Buildroot] [PATCH] lsof: don't use host toolchain to determine
 target libc
In-Reply-To: <106644d5ef8b1b8a9cfeba005079957f63702757.1400071508.git.baruch@tkos.co.il>
References: <106644d5ef8b1b8a9cfeba005079957f63702757.1400071508.git.baruch@tkos.co.il>
Message-ID: <20140515212355.GE3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-05-14 15:45 +0300, Baruch Siach spake thusly:
> The lsof Configure script builds a test program using the host toolchain to
> test whether glibc is used. This test is broken in cross compilation
> environment. Set LINUX_CLIB to avoid the test. This should give the correct
> result even for non glibc toolchains, since all libc variants we support have
> the netinet/tcp.h header.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a1f/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
> 
> Cc: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/lsof/lsof.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index f4b1b4cb8f86..332d1f83a5df 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -49,7 +49,8 @@ endef
>  define LSOF_CONFIGURE_CMDS
>  	(cd $(@D) ; \
>  		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
> -		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
> +		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
> +		LINUX_CLIB=-DGLIBCV=2 ./Configure linux)
>  	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
>  	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
>  endef
> -- 
> 2.0.0.rc0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
