From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 08:03:15 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <20180609210607.13259-1-yann.morin.1998@free.fr>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
Message-ID: <20180610080315.11cf122b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jun 2018 23:06:07 +0200, Yann E. MORIN wrote:
> Currently, the wording in the manual instructs the user to generate
> tarball from "the contents of the +output/host+ directory".
> 
> This is pretty confusing, because taken literally, this would amount to
> runing a command like:
> 
>     tar cf my-sdk.tar -C output/host/ .
> 
> This creates a tarbomb [0], which is very bad practice, because when
> extracted, it creates mutiple files in the current directory.
> 
> One one really want to do, is create a tarball of the host/ directory,

"One one"

> with something like:
> 
>     tar cf my-sdk.tar -C output host/
> 
> However, this is not much better, because the top-most dirdctory would

directory

> have a very common name, host/, which is pretty easy to get conflict
> with.
> 
> So, we fix that mess by creating the archive ourselves, giving it and

remove the final "and"

> the top-most directory a recogniseable name, based on the target tuple
> and the Buildroot version.
> 
> Since this is an output file, we located it in the images/ directory.

located -> locate

or maybe "place", "store" ?

> 
> Update the manual accordignly.

accordingly

> 
> Speaking of the manual.. It was referring to "output/host/", but that
> is only valid for in-tree builds. For out-of-tree builds, this is just
> "host/". To avoid confusion, use the name of the vairiable $(HOST_DIR),

variable

> which, fortunately, happens to be valid in both cases.

>  .PHONY: sdk
> -sdk: world
> +sdk: world $(BR2_TAR_HOST_DEPENDENCY)
>  	@$(call MESSAGE,"Rendering the SDK relocatable")
>  	$(TOPDIR)/support/scripts/fix-rpath host
>  	$(TOPDIR)/support/scripts/fix-rpath staging
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>  	mkdir -p $(HOST_DIR)/share/buildroot
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> +	$(Q)mkdir -p $(BINARIES_DIR)
> +	$(TAR) czf $(BINARIES_DIR)/buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL).tar.gz \
> +		-C $(HOST_DIR) \
> +		--transform='s#^\.#buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)#' \
> +		.

Generally, I am fine with the principle, I believe it indeed makes
sense to provide a tarball that is ready to use.

I was a bit concerned about backward compatibility behavior for people
already using "make sdk". But in fact your change is fine from this
point of view: if people have scripts today that run "make sdk" and
create a tarball from output/host, they will still work fine.

> -It is possible to relocate the toolchain, this allows to distribute
> -the toolchain to other developers to build applications for your
> -target. To achieve this:
> +Alternatively, Buildroot can also export the toolchain and all the
> +development files of all selected packages,

"all the development files" -> "the development files", otherwise the
repetition of "all" is a bit annoying.

> as an SDK, by running the
> +command +make sdk+. This generates a tarball of the content of the host
> +directory +$(HOST_DIR)+, named +buildroot-sdk.<TARGET-TUPLE>-<BR-VERSION>.tar.gz+
> +and located in the output directory +$(BINARIES_DIR)+.
>  
> -* run +make sdk+, which prepares the toolchain to be relocatable;
> -* tarball the contents of the +output/host+ directory;
> -* distribute the resulting tarball.
> +This tarball can then be distributed to application developpers, when
> +they want to develop their applications that are not (yet) packaged as
> +a Buildroot package.
>  
> -Once the toolchain is installed to the new location, the user must run
> -the +relocate-sdk.sh+ script to make sure all paths are updated with
> -the new location.
> +Upon extracting the SDK tarball, the user must run the script
> ++relocate-sdk.sh+, to make sure all paths are updated with the new
> +location.
>  
> +.Note
> +This SDK can not be re-used as an external toolchain, because it
> +contains pre-built libraries that could be conflicting with the ones
> +packaged in Buildroot (e.g. when an old SDK would be re-used with a
> +newer Buildroot version), unless it was built from a configuration
> +with no package enabled.

Looks good otherwise. Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
