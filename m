From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Jul 2014 16:52:52 +0300
Subject: [Buildroot] [PATCH] atftp: fix static linking
In-Reply-To: <1404997647-12843-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404997647-12843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140710135252.GT3003@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jul 10, 2014 at 10:07:27AM -0300, Gustavo Zacarias wrote:
> Openssl uses libz hence pull it in,

I don't see openssl or libz in this patch. But...

> also needs to explicitly link
> against libpthread. Fixes:
> http://autobuild.buildroot.net/results/259/2592612be38a2c1dde21b44be2ecf25d1cc5211a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/atftp/atftp.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
> index 1d6a7c3..a018b9d 100644
> --- a/package/atftp/atftp.mk
> +++ b/package/atftp/atftp.mk
> @@ -9,10 +9,15 @@ ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
>  ATFTP_LICENSE = GPLv2+
>  ATFTP_LICENSE_FILES = LICENSE
>  ATFTP_CONF_OPT = --disable-libwrap --disable-mtftp
> +# For static we need to explicitly link against libpthread
> +ATFTP_LIBS = -lpthread
> +ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)"
>  
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  ATFTP_DEPENDENCIES += readline
>  ATFTP_CONF_OPT += --enable-libreadline
> +# For static, readline links with ncurses
> +ATFTP_LIBS += -lncurses

... ncurses in not mentioned in the commit log.

>  else
>  ATFTP_CONF_OPT += --disable-libreadline
>  endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
