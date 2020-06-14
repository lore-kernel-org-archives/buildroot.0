From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 17:00:21 +0200
Subject: [Buildroot] [PATCH] uclibc: add simlinks from
 libdl/libm/libpthread/librt
In-Reply-To: <20200613162001.154280-1-paul@crapouillou.net>
References: <20200613162001.154280-1-paul@crapouillou.net>
Message-ID: <20200614150021.GU2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2020-06-13 18:20 +0200, Paul Cercueil spake thusly:
> All the symbols that were previously present in libdl.so.0, libm.so.0,
> libpthread.so.0 and librt.so.0 are now all packed within uClibc.
> 
> In order to keep binary compatibility with old executables, which were
> dynamically linked with one of the libraries above, add symbolic links
> to the uClibc shared library.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/uclibc/uclibc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 3ba4589672..73664d5b0b 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -424,6 +424,10 @@ define UCLIBC_INSTALL_TARGET_CMDS
>  		RUNTIME_PREFIX=/ \
>  		install_runtime
>  	$(UCLIBC_INSTALL_UTILS_TARGET)
> +	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libdl.so.0
> +	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libm.so.0
> +	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libpthread.so.0
> +	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/librt.so.0

This does not account for external toolchains.

I wonder how good those symlinks are anyway: uClibc has no ABI/API
stability anyway, so there are no guarantee that a program linked
against a version of uClibc will work against another version, or even
the same version that was compiled with another configuration...

And I am not sure we want to condone such a case.

My opinion would be that, if you really need those legacy symlinks,
then you should create them in a post-build script.

I'm leaving this patch opened in patchwork, so other maintainers may
reverse my position.

Regards,
Yann E. MORIN.

>  endef
>  
>  # STATIC has no ld* tools, only getconf
> -- 
> 2.27.0
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
