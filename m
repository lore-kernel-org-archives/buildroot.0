From: John Moon <johncarlmoon@gmail.com>
Date: Mon, 23 Jan 2017 08:56:45 -0800
Subject: [Buildroot] Extra package libraries not resolved on target
	system (Xilinx aarch64)
In-Reply-To: <871svxsd98.fsf@dell.be.48ers.dk>
References: <CAKuvFvRqf6BomOx5exQHCeC=g61bOD_zJNYF-sw2G9YEr+UtHA@mail.gmail.com>
 <871svxsd98.fsf@dell.be.48ers.dk>
Message-ID: <CAKuvFvSGbXBCxOWfrwzjJqntBDaV_=dvjcT-3yc8SaMQ7irE2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for noting that the toolchain versions were kind of old - we
found that Xilinx had released a newer version of the toolchain with
GCC 5.x and headers 4.6.x. Using this toolchain, the Debian style
/lib/<tuple> paths are gone and the programs are resolving their libs
correctly. Thank you!

John

On Fri, Jan 20, 2017 at 12:11 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "John" == John Moon <johncarlmoon@gmail.com> writes:
>
> Hi,
>
>  > Using the Xilinx SDK aarch64 toolchain with Buildroot, extra packages are
>  > having trouble resolving their libraries on the target system. For example,
>  > openssh requires libcrypto.so.1.0.0, but can't find that library when
>  > running ssh-keygen:
>
> Is this toolchain publicly available somewhere?
>
>
>  > # LD_DEBUG=libs ssh-keygen
>
>  >       1653:     find library=libcrypto.so.1.0.0 [0]; searching
>
>  >       1653:      search cache=/etc/ld.so.cache
>
>  >       1653:      search
>  > path=/lib/aarch64-linux-gnu/tls/aarch64:/lib/aarch64-linux-gnu/tls:/lib/aarch64-linux-gnu/aarch64:/lib/aarch64-linux-gnu:/usr/lib/aarch)
>
> So it seems to be using Debian style /lib/<tuple> library paths.
>
>
>  > ssh-keygen: error while loading shared libraries: libcrypto.so.1.0.0:
>  > cannot open shared object file: No such file or directory
>
>
>  > However, the library *does* exist in /usr/lib. If I create a symlink on the
>  > target (ln -s /usr/lib/* /lib/aarch64-linux-gnu/), then everything resolves
>  > correctly.
>
> What Buildroot version are you using? The logic in
> toolchain/external/pkg-toolchain-external.mk should normally create such
> a symlink for you if it is able to detect the ARCH_LIB_DIR with this
> logic:
>
> # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
> # Note: the skeleton package additionally creates lib32->lib or lib64->lib
> # (as appropriate)
> #
> # $1: destination directory (TARGET_DIR / STAGING_DIR)
> create_lib_symlinks = \
>        $(Q)DESTDIR="$(strip $1)" ; \
>        ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>        if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
>                ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
>                ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
>        fi
>
> Perhaps you can add some echo statements here to see what goes wrong?
>
>  > Why are the binaries looking for their libraries in /lib/<tuple>
>  > and /usr/lib/<tuple> instead of just /lib and /usr/lib?
>
> Because the toolchain is configured to do so.
>
>
>  > The toolchain has GCC version 4.9.x, kernel headers 4.4.x, and I'm using
>  > glibc/eglibc.
>
> That's quite old for aarch64. Is there any specific reason why you are
> using this toolchain?
>
>  > Thank you - this is my first post to the mailing list - hopefully I'm not
>  > making any faux pas's.
>
> No no, don't worry ;)
>
> --
> Bye, Peter Korsgaard
