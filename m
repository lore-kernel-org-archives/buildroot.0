From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 21:42:10 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/pkg-meson: always set b_pie to false
In-Reply-To: <20210529084836.2472641-1-fontaine.fabrice@gmail.com>
References: <20210529084836.2472641-1-fontaine.fabrice@gmail.com>
Message-ID: <20210529194210.GB3858765@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-29 10:48 +0200, Fabrice Fontaine spake thusly:
> pipewire unconditionally enables b_pie since version 0.3.20 and
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/abe73c9146cd223b40b22581b1fd58bc044c671e
> which will raise the following build failure on m68k since commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> 
> /srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> (.text+0x4): undefined reference to `__shared_flat_add_library'
> 
> To fix this build failure, always set b_pie to false as PIE will be
> enabled by toolchain/toolchain-wrapper.mk if needed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c258a2736661af8ea73abeda2503d8682e65f1e2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Moving the options to the cross-compilation file can be done in a later
patch, possibly to be applied after the release to avoid introducing too
much unknown so close to the release...

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Always set b_pie to false
> 
>  package/pkg-meson.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index a57820d4d2..1857450564 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -91,6 +91,7 @@ define $(2)_CONFIGURE_CMDS
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>  		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> +		-Db_pie=false \
>  		-Dstrip=false \
>  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
>  		$$($$(PKG)_CONF_OPTS) \
> -- 
> 2.30.2
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
