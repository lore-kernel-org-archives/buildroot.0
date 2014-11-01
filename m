From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 17:39:52 +0100
Subject: [Buildroot] [PATCH v2 1/3] skeleton: add support for
 /etc/ld.so.conf.d/*.conf files
In-Reply-To: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141101163952.GA10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-10-31 16:19 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  toolchain/toolchain.mk | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 3f9900b..cd65cfc 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -13,6 +13,31 @@ endef
>  TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
>  endif
>  
> +# - glibc can include configuration files at runtime
> +# - uclibc does not support "include" feature
> +# - musl use /etc/ld-musl-${ARCH}.path file. This file use same syntax
> +#     than $LD_LIBRARY_PATH. Since there are plenty of corner cases in
> +#     generation of this file, we prefer to not support it. User can
> +#     fix the problem by providing file manualy (in a an overlay).
> +#
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> +define GENERATE_LD_SO_CONF_FILE
> +	echo 'include /etc/ld.so.conf.d/*.conf' > $(TARGET_DIR)/etc/ld.so.conf
> +endef
> +else
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +define GENERATE_LD_SO_CONF_FILE
> +	ls $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > /dev/null 2>&1 && \
> +	    echo "Usage of /etc/ld.so.conf.d/*.conf files with musl libc is not supported"
> +endef
> +else # UCLIBC
> +define GENERATE_LD_SO_CONF_FILE
> +	cat $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > $(TARGET_DIR)/etc/ld.so.conf
> +endef
> +endif
> +endif
> +TARGET_FINALIZE_HOOKS += GENERATE_LD_SO_CONF_FILE

I think it would be much better to not support this glibcism.

I can only see one use-case for that:

  - the package installs such a file in its install procedure
    => we should provide a post-install hook to move the content of
       this file into /etc/ld.so.conf

As Thomas P. said, we can provide a macro to ease doing that. I propose
something slightly different, because 'grep -q' is not portable and I do
not like 'echo':

    # Add a path in $(1) to /etc/ld.so.conf
    define UPDATE_LD_SO_CONF
        grep -E '^$(1)$$' $(TARGET_DIR)/etc/ld.so.conf >/dev/null 2>&1 || \
        printf '%s\n' '$(1)' >>$(TARGET_DIR)/etc/ld.so.conf
    endef

which you could then call like that:

    define FOO_UPDATE_LD_SO_CONF
        $(call UPDATE_LD_SO_CONF,/usr/lib/foo)
    endef
    FOO_POST_TARGET_INSTALL_HOOKS += FOO_UPDATE_LD_SO_CONF

Alternatively, we could include that in the pakage infra:

    FOO_LD_SO_CONF_PATHS = /usr/lib/foo /usr/lib/foo/bar

and the infra would look at that variable, and if set, add all the paths
to /et/ld/so/conf.

I thionk the pkg-infra solution is a bit overkill, given we currently do
not have that much packages that use that (well, only mysql needs it),
but the macro would not be very much justified either.

So, I just NAK this feature.

Regards,
Yann E. MORIN.

>  # Install the gconv modules
>  ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
>  GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
