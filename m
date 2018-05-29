From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 May 2018 23:36:10 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 5.12.0.226
In-Reply-To: <1527627003-6738-1-git-send-email-angelo@amarulasolutions.com>
References: <1527627003-6738-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180529233610.00892734@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 May 2018 22:50:03 +0200, Angelo Compagnucci wrote:
> This patch bumps mono to version 5.12.0.226 and it's monolite dependency
> to version 1051200002, doing so it removes also a couple of upstreamed
> patches.
> This new mono version requires also a different option for
> managing aot, so this patch refactors also the configure options.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks for this package update.


> -# Disable managed code (mcs folder) from building
> -MONO_CONF_OPTS = --with-mcs-docs=no \
> +MONO_SHARED_CONF_OPTS = --with-mcs-docs=no \
>  	--with-ikvm-native=no \
> -	--enable-minimal=profiler,debug,aot \
> -	--disable-mcs-build \
> +	--enable-minimal=profiler,debug \
>  	--enable-static \
> -	--disable-btls
> +	--disable-btls \
> +	--disable-system-aot
> +
> +# Disable managed code (mcs folder) from building
> +MONO_CONF_OPTS = $(MONO_SHARED_CONF_OPTS) --disable-mcs-build
>  
>  # The libraries have been built by the host-mono build. Since they are
>  # architecture-independent, we simply copy them to the target.
> @@ -42,12 +44,7 @@ MONO_DEPENDENCIES += host-mono
>  
>  ## Mono managed
>  
> -HOST_MONO_CONF_OPTS = --with-mcs-docs=no \
> -	--disable-libraries \
> -	--with-ikvm-native=no \
> -	--enable-minimal=profiler,debug,aot \
> -	--enable-static \
> -	--disable-btls
> +HOST_MONO_CONF_OPTS = $(MONO_SHARED_CONF_OPTS) --disable-libraries

We rarely share a common variable to define host and target configure
options, but OK let's do it here.

I've just changed from MONO_SHARED_CONF_OPTS to MONO_COMMON_CONF_OPTS
because in the context of Buildroot the word "shared" is very often
used to talk about "shared libraries" (as opposed to static libraries),
but it's not what we're talking about it. I believe using
MONO_COMMON_CONF_OPTS is less confusing.

Applied to next with this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
