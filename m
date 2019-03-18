From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 17 Mar 2019 22:50:14 -0600
Subject: [Buildroot] [PATCH v10 1/6] binutils: install libiberty for
 host build
In-Reply-To: <20190206091531.104591-1-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
Message-ID: <CADvTj4qctL8a789f=Xr4NdSToLiK5RPg7D2iHYncvkJE2KqubA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 6, 2019 at 2:15 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
> prelink-cross to build properly.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
>         --target=$(GNU_TARGET_NAME) \
>         --disable-shared \
>         --enable-static \
> +       --enable-install-libiberty \
This appears to break host-gdb due to this incompatible non-pic
libiberty.a being in the library search path before the correct pic
version:
 -L/home/buildroot/buildroot/output/host/lib
-L/home/buildroot/buildroot/output/build/host-gdb-8.2.1/bfd/../libiberty/pic

build error for host-gdb:
/usr/bin/ld: /home/buildroot/buildroot/output/host/lib/libiberty.a(cp-demangle.o):
relocation R_X86_64_PC32 against symbol `cplus_demangle_builtin_types'
can not be used when making a shared object; recompile with -fPIC

Deleting the incompatible
/home/buildroot/buildroot/output/host/lib/libiberty.a allows host-gdb
to build successfully.
>         --with-sysroot=$(STAGING_DIR) \
>         --enable-poison-system-directories \
>         $(BINUTILS_DISABLE_GDB_CONF_OPTS) \
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
