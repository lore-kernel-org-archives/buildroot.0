From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 11:09:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: handle b_pie
In-Reply-To: <20210528191748.1598384-1-fontaine.fabrice@gmail.com>
References: <20210528191748.1598384-1-fontaine.fabrice@gmail.com>
Message-ID: <20210529090943.GM2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

+Peter, +James

On 2021-05-28 21:17 +0200, Fabrice Fontaine spake thusly:
> pipewire unconditionally enables b_pie since version 0.3.20 and
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/abe73c9146cd223b40b22581b1fd58bc044c671e
> which will raise the following build failure on m68k since commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> 
> /srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> (.text+0x4): undefined reference to `__shared_flat_add_library'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c258a2736661af8ea73abeda2503d8682e65f1e2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkg-meson.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index a57820d4d2..a55063d58e 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -91,6 +91,7 @@ define $(2)_CONFIGURE_CMDS
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>  		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> +		-Db_pie=$(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),true,false) \

I was wondering if we should not also put that in the cross-compilation
file as well, or even only in the cross-compilation file.

I see, below, that strip is on the command line, and not in the
cross-compilation file. However, the meson documentation [0] states that
the precendence of options is:

  - command line
  - machine file
  - build-system definition

So, b providing the default in the cross-compilation file, we also
ensure it is available in the file (and the template) we install in
$(HOST_DIR)/etc/meson/cross-compilation.conf and in
$(HOST_DIR)/etc/meson/cross-compilation.conf.in, so that builds outside
of Buildroot (e.g. SDK) by default use the same values as the builds in
Buildroot, but that users can still override that on the command line.

Thoughts?

In the meantime, I think it is still correct to have b_pie on the
command line for our infra, like we have strip, so: applied to master,
thanks.

[0] https://mesonbuild.com/Machine-files.html#meson-builtin-options

>  		-Dstrip=false \

And strip should probably also go in the cross-compilation file, too,
nmaybe?

Or is there a rule that says "this type of option should go in the cross
file, anything else should go on the cokmmand line" ?

Regards,
Yann E. MORIN.

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
