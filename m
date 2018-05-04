From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Fri, 4 May 2018 08:32:27 +0000
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <6d1f56f4-c708-9855-59e4-58df59a296c0@mind.be>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-2-stefan.sorensen@spectralink.com>
 <6d1f56f4-c708-9855-59e4-58df59a296c0@mind.be>
Message-ID: <a7a208243fe391b22171c9a67099814afb1d429a.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-05-04 at 00:13 +0200, Arnout Vandecappelle wrote:

> > +A lot of packages build with a mix of -fPIC and -fPIE, so bump
> > this down from a failure to just issuing a warning.
> 
> Is that really the case? I mean, if an executable contains code
> (directly, not in a shared library) that has not been compiled with
> -fPIE/-fpie, then the executable is not (or may not be) completely
> position-independent, right?

You are right, it does not fail on the mixed static+pic/pie case - it
turns out that the original script does not fail on the pure static
case. I will add a fix for this.

> TBH, I don't really understand how this position independent
> executable is used in the end. Does the kernel's ELF loader perform
> ASLR while loading it?

I believe so - I think that the executable it handled more or less like
a shared library.

> > +	bool "annobin"
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
> 
>  Can you add a comment explaining why 6 is the minimum, and not 4.5
> (first GCC supporting plugins)?

To be honest, I don't recall why this was added. I will test it and
drop  it if not needed.

> > +	  Enabling this will slightly (1-2%) increase the size of
> > +	  built binaries.
> 
>  Really? Isn't this info stripped off in the strip step?

No, this is not touched by strip. It is intended that you should be
able to verify the final binaries - though this is probably more
relevant on ordianry Linux distributions.

>  HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS +=
> > $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
> > +ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
> > +HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS +=
> > -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'
> 
>  Is there a reason to repeat this in gcc-final.mk and pkg-toolchain-
> external.mk, rather than specifying it once in toolchain/toolchain-
> wrapper.mk (like most of the wrapper options)?

Adding it in toolchain/toolchain-wrapper.mk will also cause it to be
added in the wrapper of gcc-initial, requiring that the annobin plugin
be built much earlier.

Stefan
