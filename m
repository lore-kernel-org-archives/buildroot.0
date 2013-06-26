From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 26 Jun 2013 19:08:33 +0200
Subject: [Buildroot] [RFCv1 00/18] Convert the internal toolchain
 backend to packages
In-Reply-To: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LXU3fv0O5hu4hG7f9WaWe_SoAvK5Se=J63ZdHNkszwdOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 25, 2013 at 9:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the first RFC of the patch set that converts the internal
> Buildroot toolchain backend to the package infrastructure. It converts
> elf2flt, the kernel headers, the gcc and the uclibc build logic to
> packages.
>
> The code is also available from:
>
>    git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git toolchain-infra
>
> Summary of the patches:
>
>  * Patches 1 to 6 are cleanup / preparation patches. They can be
>    applied right now (which would help reduce the size of this patch
>    set).
>
>  * Patch 7 converts elf2flt to the package infrastructure.
>
>  * Patch 8 converts the kernel headers to the package infrastructure.
>
>  * Patch 9, 10 and 11 introduce the gcc-initial, gcc-intermediate and
>    gcc packages. At this point, they are not used by Buildroot.
>
>  * Patch 12 switches the toolchain build logic to use the gcc-initial,
>    gcc-intermediate and gcc packages, and removed the toolchain/gcc
>    code.
>
>  * Patch 13 makes a small optimization to the size of the sources
>    extracted for gcc.
>
>  * Patch 14 converts uClibc to the package infrastructure.
>
>  * Patch 15 to 18 make some followup cleanups.
>
> Some comments:
>
>  * This patch set completely removes the support for building the
>    toolchain on the target (i.e the new gcc package and uClibc package
>    do not support building/installing the target variant). A cleanup
>    patch at the end of the series removes BR2_HAVE_DEVFILES.
>
>  * The gcc-initial, gcc-intermediate and gcc packages each extract
>    their own copy of the gcc sources. With the previous code,
>    out-of-tree builds were used to share the tree, but moving to the
>    package infrastructure makes this more difficult. Since the build
>    is still done in a sub-directory called 'build' inside each source
>    directory (because gcc does not support in-tree build), I've tried
>    to symlink the source directories, and create separate build
>    sub-directories (build-initial, build-intermediate, build-final),
>    but the problem comes with the stamp files, that would have the
>    same name and location for the gcc-initial, gcc-intermediate and
>    gcc packages.
>
>    In order to mitigate this additional amount of work and disk space
>    consumption, I've added a little optimization to the gcc sources
>    extraction, by not extracting the libjava, libgo and gcc/testsuites
>    directories. This reduces approximately by half the size of the gcc
>    sources.
>
>  * The code of the gcc-initial, gcc-intermediate and gcc packages
>    could benefit from some factorization. For now, they are completely
>    independent from each other. I've tried doing some factorization
>    like GCC_INITIAL_SITE = $(GCC_SITE), but ran into issues (like
>    GCC_SITE not being defined by the time GCC_INITIAL_SITE uses it or
>    something like that). This is an area where a bit of
>    help/suggestions would be welcome.

What about putting all three gcc/gcc-initial/gcc-intermediate packages
in one directory (three .mk files) and then a common file. This common
file can contain common rules that can be used by all gcc packages.
You can make sure that the variables are defined by including the
common file explicitly from each .mk file (and making sure it doesn't
match the global 'include package/*/*.mk').

Best regards,
Thomas
