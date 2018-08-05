From: Stefan Becker <chemobejk@gmail.com>
Date: Sun, 5 Aug 2018 16:04:35 +0300
Subject: [Buildroot] [PATCHv3] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <20180804082741.10783-1-yann.morin.1998@free.fr>
References: <20180804082741.10783-1-yann.morin.1998@free.fr>
Message-ID: <CAOJ2eMf7jyr=aw8T49+hPxxPw0Lk__vwdfvVr7Kg_Wb+rqNQng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

looks OK to me.

On Sat, Aug 4, 2018 at 11:27 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Currently, the wording in the manual instructs the user to generate a
> tarball from "the contents of the +output/host+ directory".
>
> This is pretty confusing, because taken literally, this would amount to
> running a command like:
>
>     tar cf my-sdk.tar -C output/host/ .
>
> This creates a tarbomb [0], which is very bad practice, because when
> extracted, it creates multiple files in the current directory.
>
> What one really wants to do, is create a tarball of the host/ directory,
> with something like:
>
>     tar cf my-sdk.tar -C output host/
>
> However, this is not much better, because the top-most directory would
> have a very common name, host/, which is pretty easy to get conflict
> with when it gets extracted.
>
> So, we fix that mess by giving the top-most directory a recognisable
> name, based on the target tuple, which we also use as the name of the
> archive (suffixed with the usual +.tar.gz+.) We offer the user the
> possibility to override that default by specifying the +BR2_SDK_PREFIX+
> variable on the command line.
>
> Since this is an output file, we place it in the images/ directory.
>
> As some users expressed a very strong feeling that they do not want to
> generate a tarball at all, and that doing so would badly hurt their
> workflows [1], we actually prepare the SDK as was previously done, but
> under the new, intermediate rule 'prepare-sdk'. The existing 'sdk' rule
> obviously depend on that before generating the tarball.
>
> We choose to make the existing rule to generate the tarball, and
> introduce a new rule to just prepare the SDK, rather than keep the
> existing rule as-is and introduce a new one to generate the tarball,
> because it makes sense to have the simplest rule do the correct thing,
> leaving advanced, power users use the longest command. If someone
> already had a wrapper that called 'sdk' and expected just the host
> directory to be prepared, then this is not broken; it just takes a bit
> longer (gzip is pretty fast).
>
> Update the manual accordingly.
>
> [0] https://en.wikipedia.org/wiki/Tar_(computing)#Tarbomb
> [1]
> http://lists.busybox.net/pipermail/buildroot/2018-June/thread.html#223377
>     and some messages in the ensuing thread...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Stefan Becker <chemobejk@gmail.com>
> Cc: Trent Piepho <tpiepho@impinj.com>
>
> ---
> Changes v2 -> v3:
>   - drop the version from the prefix  (Stefan, Thomas)
>   - actually have 'sdk' depend on 'prepare-sdk'
>   - anonymise the generated tarball
>
> Changes v1 -> v2:
>   - drop the part of the manual stating this can't be re-used as a
>     pre-built toolchain  (Arnout)
>   - make the top-level directory and tarball name configurable
>     (Trent, Thomas)
>   - change the default name  (Arnout)
>   - allow just preparing the SDK (Stefan, Trent)
>   - typoes  (Thomas)
> ---
>  Makefile                                  | 15 +++++++++++++--
>  docs/manual/using-buildroot-toolchain.txt | 26 +++++++++++++++++---------
>  2 files changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 37c7072c7c..e13e5eaefa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -573,8 +573,8 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  .PHONY: world
>  world: target-post-image
>
> -.PHONY: sdk
> -sdk: world
> +.PHONY: prepare-sdk
> +prepare-sdk: world
>         @$(call MESSAGE,"Rendering the SDK relocatable")
>         $(TOPDIR)/support/scripts/fix-rpath host
>         $(TOPDIR)/support/scripts/fix-rpath staging
> @@ -582,6 +582,17 @@ sdk: world
>         mkdir -p $(HOST_DIR)/share/buildroot
>         echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>
> +BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
> +.PHONY: sdk
> +sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
> +       @$(call MESSAGE,"Generating SDK tarball")
> +       $(if $(BR2_SDK_PREFIX),,$(error BR2_SDK_PREFIX can not be empty))
> +       $(Q)mkdir -p $(BINARIES_DIR)
> +       $(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
> +               --owner=0 --group=0 --numeric-owner \
> +               --transform='s#^\.#$(BR2_SDK_PREFIX)#' \
> +               -C $(HOST_DIR) "."
> +
>  # Populating the staging with the base directories is handled by the
> skeleton package
>  $(STAGING_DIR):
>         @mkdir -p $(STAGING_DIR)
> diff --git a/docs/manual/using-buildroot-toolchain.txt
> b/docs/manual/using-buildroot-toolchain.txt
> index 3246dc2411..0c0c35fced 100644
> --- a/docs/manual/using-buildroot-toolchain.txt
> +++ b/docs/manual/using-buildroot-toolchain.txt
> @@ -12,15 +12,23 @@ The toolchain generated by Buildroot is located by
> default in
>  +output/host/bin/+ to your PATH environment variable and then to
>  use +ARCH-linux-gcc+, +ARCH-linux-objdump+, +ARCH-linux-ld+, etc.
>
> -It is possible to relocate the toolchain, this allows to distribute
> -the toolchain to other developers to build applications for your
> -target. To achieve this:
> +Alternatively, Buildroot can also export the toolchain and the development
> +files of all selected packages, as an SDK, by running the command
> ++make sdk+. This generates a tarball of the content of the host directory
> ++output/host/+, named +<TARGET-TUPLE>_sdk-buildroot.tar.gz+ (which can be
> +overriden by setting the environment variable +BR2_SDK_PREFIX+) and
> +located in the output directory +output/images/+.
>
> -* run +make sdk+, which prepares the toolchain to be relocatable;
> -* tarball the contents of the +output/host+ directory;
> -* distribute the resulting tarball.
> +This tarball can then be distributed to application developers, when
> +they want to develop their applications that are not (yet) packaged as
> +a Buildroot package.
>
> -Once the toolchain is installed to the new location, the user must run
> -the +relocate-sdk.sh+ script to make sure all paths are updated with
> -the new location.
> +Upon extracting the SDK tarball, the user must run the script
> ++relocate-sdk.sh+ (located at the top directory of the SDK), to make
> +sure all paths are updated with the new location.
>
> +Alternatively, if you just want to prepare the SDK without generating
> +the tarball (e.g. because you will just be moving the +host+ directory,
> +or will be generating the tarball on your own), Buildroot also allows
> +you to just prepare the SDK with +make prepare-sdk+ without actually
> +generating a tarball.
> --
> 2.14.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180805/525a7d2c/attachment.html>
