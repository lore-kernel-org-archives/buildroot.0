From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 26 Oct 2019 07:28:04 -0500
Subject: [Buildroot] [PATCH] doc/manual/configure.txt: add a short
 tutorial to reuse a Buildroot toolchain as external toolchain
In-Reply-To: <20190802203051.22350-1-romain.naour@smile.fr>
References: <20190802203051.22350-1-romain.naour@smile.fr>
Message-ID: <CANQCQpaFicQxGU7pe3A=CvFzUSfbD4Vq3MYZYRXQAdH2ekti3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Fri, Aug 2, 2019 at 3:33 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> Laurent reported that a short tutorial was missing in the manual to
> explain how to reuse a Buildroot toolchain as external toolchain.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Laurent Guillier <laurent.guillier@smile.fr>

A few spelling and rewordings below.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  docs/manual/configure.txt | 91 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 008813c9b4..a6416675e4 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -210,6 +210,97 @@ definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
>  recommend to build the toolchain separately from Buildroot, and then
>  _import_ it in Buildroot using the external toolchain backend.
>
> +Here are steps to build a Buildroot toolchain and reuse it as an
> +external toolchain:

I'd replace the above initial statement with the following.
"The Buildroot internal toolchain option can be used to create an
external toolchain. Here are a series of steps to build an internal
toolchain and package it up for reuse."

> +
> +* From a project directory, start by cloning the buildroot git tree.
> +
> +-----
> +/path/to/project/ $ git clone git://git.buildroot.net/buildroot
> +-----
> +
> +* Run a out of tree build to create the Buildroot project that will

Run a   --> Next run a

> +  build the toolchain. Then select the *target options* and the
> +  toolchain componants for an *internal toolchain backend*.

componants  --> components

> +  Eventually, you can removing *Busybox* from the default defconfig by
> +  not installing an *init system* (select none) and removing the
> +  default *shell* (select none). By doing this, Buildroot will allow
> +  you to disable the *Busybox* package.

Suggest rewording the above to something like this:

At this point, you can remove the *Busybox* init system from the default
defconfig by first not installing an *init system* (select none) and second,
removing the default *shell* (select none).  With those two options disabled,
Buildroot will allow you to disable the *Busybox* package.

> +  Finally, you can avoid building a *tar* archive of the filesystem
> +  image (rootfs.tar) since it not useful.

Maybe something like this:

Buildroot will by default include a filesystem which can be disabled
as it won't be used as part of the toolchain.

> +
> +-----
> +/path/to/project/ $ make -C buildroot O=toolchain menuconfig
> +-----
> +
> +* At this step, you should have this directory tree:
> +
> +----
> +/path/to/project/
> +  |- buildroot
> +  |- toolchain
> +  |     |build
> +  |     |host
> +  |     `----
> +----
> +
> +Keep the full path to the *host* directory for the next step.

"The path to this *host* directory may be important later if you are
planning to not relocate the toolchain but use it locally.  There is
an example of this below."

> +
> +----
> +/path/to/project/toolchain/host
> +----
> +
> +Eventually, you can run *sdk* to be able to relocate the toolchain
> +to another build machine. This allow to sanitize the *rpath* of the
> +toolchain binaires.

Buildroot supports allowing you to relocate the *sdk*(internal
toolchain) to another build machine.  The *sdk* target sanitizes the
*rpath* of the toolchain binaries.  Once the sanitize complete the
host folder could be turned into a tarball and moved to another build
machine.

> +
> +-----
> +/path/to/project/ $ make -C buildroot O=toolchain sdk
> +-----
> +
> +* Run a out of tree build to create the Buildroot project that will
> +  build the target image using an *external toolchain*.

As an example, lets setup an out of tree build to create a Buildroot
project that uses the new *external toolchain* we just built.

> +
> +-----
> +/path/to/project/ $ make -C buildroot O=output menuconfig
> +-----
> +
> +Select the same *target options* as the one used to create the

one --> ones

> +toolchain. In the toolchain menu, select the *external toolchain

toolchain --> previous internal toolchain

> +backend*, select an external *custom toolchain* and select toolchain
> +origin *Pre-installed toolchain*.
> +
> +Now you can set the *Toolchain path* with the path to the toolchain
> +previously built (including host directory).
> +
> +----
> +BR2_TOOLCHAIN_EXTERNAL_PATH=/path/to/project/toolchain/host
> +----
> +
> +Then you have to select the toolchain caracteristics like gcc version,

caracteristics  ---> characteristics

> +the libc implementation etc... As for other external custom toolchain.

"the libc implementation, linux headers, etc."

I'd drop "As for other external custom toolchain."

Thanks for sending this!
Matt
