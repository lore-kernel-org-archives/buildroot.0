From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jun 2021 17:56:18 +0200
Subject: [Buildroot] [PATCH v1 1/1] python: use system libffi for
 host-python
In-Reply-To: <20210621055351.3958011-1-christian@paral.in>
References: <20210621055351.3958011-1-christian@paral.in>
Message-ID: <20210627155618.GB2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christain, All,

On 2021-06-20 22:53 -0700, Christian Stewart spake thusly:
> From: Erico Nunes <nunes.erico@gmail.com>
> 
> python2 contains a bundled copy of libffi which is currently out of sync with
> the latest libffi release. There is an option to use a system libffi, buildroot
> already uses it for the target python2 build and for python3. In python3, the
> bundled copy doesn't exist anymore and the system-provided libffi is required.
> 
> The bundled copy currently fails to build on aarch64 host due to a missing
> definition of AARCH64_CALL_CONTEXT_SIZE. This define was removed from the
> headers in recent libffi releases and the host compiler might be including the
> system headers before the bundled headers.
> 
> To solve this and since buildroot already relies on system libffi for target
> python2 and python3 anyway, switch host python2 to use system libffi.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Reviewed-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1:
> 
> Submitted on behalf of author from BugZilla:
> 
> https://bugs.busybox.net/show_bug.cgi?id=13661#c4
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/python/python.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index f4f9f8563b..ae99f382f9 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -24,6 +24,7 @@ HOST_PYTHON_CONF_OPTS += \
>  	--disable-sqlite3 \
>  	--disable-tk \
>  	--with-expat=system \
> +	--with-system-ffi \
>  	--disable-curses \
>  	--disable-codecs-cjk \
>  	--disable-nis \
> @@ -56,7 +57,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
>  
>  PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
>  
> -HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
> +HOST_PYTHON_DEPENDENCIES = host-expat host-libffi host-zlib
>  
>  ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
>  HOST_PYTHON_DEPENDENCIES += host-openssl
> -- 
> 2.32.0
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
