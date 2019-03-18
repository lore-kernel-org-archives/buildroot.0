From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Mar 2019 23:03:40 +0100
Subject: [Buildroot] [PATCH v10 1/6] binutils: install libiberty for
 host build
In-Reply-To: <20190206091531.104591-1-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
Message-ID: <20190318220340.GK14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2019-02-06 04:15 -0500, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
> prelink-cross to build properly.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

So we've had to revert this and the prelink-cross patches, because there
are problems we did not forsee.

First, with this very patch: it breaks hiost-gdb, which fails to build
because there is an inconsistency with how ti tries to link with
libiberty:

    http://autobuild.buildroot.org/results/109/1098d6380f12f5bbd6dbc69edb06bd953d1edc3d/build-end.log

    /usr/bin/ld: /home/buildroot/autobuild/instance-0/output/host/lib/libiberty.a(cplus-dem.o):
    relocation R_X86_64_PC32 against symbol `_sch_istable' can not be used when making a shared object; recompile with -fPIC
    /usr/bin/ld: final link failed: Bad value

To be noted, however, is that the target gdb does build nicely, even
though we do build the target binutils with libiberty too.

In any case, this is a regeression that must be addressed.

Second, and more problematic: prelink-crosss depends on host-binutils,
but host-binutils is not supposed to be built when using an external
toolchain, otherwise our host-binutls' built ar, ld, etc... would
collide and conflict with those of the toolchain.

Therefore, we must find a better solution to get that libiberty.

Third, about the qemu version check removal, Thomas and I believe this
should be replaced by a 'comment' in the Kconfig, like:

    if BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
    comment "WARNING! If the kernel headers of your toolchain are"
    comment "more recent than the kernel on your build machine,"
    comment "qemu-user may work unreliably. or even not at all."
    endif

Fourth, the FOO_GIR_EXTRA_LIBS_PATH is useless: packages can set it in
their FOO_MAKE_ENV (and possibly, FOO_CONF_ENV) instead, as those
variables *are* made for packages to pass extra environment variables.

Fifth, the gst1-plugins-base patch touches a Makefile.am so it should
require an autoreconf. However, it does not autoreconf nicely, and
requires macros from external packages, which is a pain to add. So
we could accept a patch that also touches Makefile.in as well.
Otherwise, on some systems, the build would try to run automake, and
would fail.

So yes, it took that long to eventually have a look, but here we are.

The qemu version check removal and the GIR_EXTRA_LIBS_PATH ar pretty
trivial. The gst1-plugins-base patch can be easily fixed.

The libiberty and gdb issue is probably not entirely trivial, but at
least he target gdb is in the same situation but builds.

The biggest problem is to get libiberty from host-binutils when using an
external toolchain.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v7:
>   - Add patch to series.
> 
> Changes v7 -> v10:
>   - None
> 
>  package/binutils/binutils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 4531b8d9c8..388e2192b4 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -84,6 +84,7 @@ HOST_BINUTILS_CONF_OPTS = \
>  	--target=$(GNU_TARGET_NAME) \
>  	--disable-shared \
>  	--enable-static \
> +	--enable-install-libiberty \
>  	--with-sysroot=$(STAGING_DIR) \
>  	--enable-poison-system-directories \
>  	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
> -- 
> 2.20.1
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
