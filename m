From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 09:30:39 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: allow
 packages to override download step
In-Reply-To: <4C34E1E7.6040605@lucaceresoli.net>
References: <20100701153712.9DCD6821E8@busybox.osuosl.org>
	<20100701180447.3477a6fa@surf> <4C34E1E7.6040605@lucaceresoli.net>
Message-ID: <20100708093039.7406f9d3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 07 Jul 2010 22:21:59 +0200
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> It's a good feature to have, but I agree with Thomas about the way to 
> implement it. As I proposed in the discussion about "Getting package 
> sources from git/svn/bzr", I'd rather make the DOWNLOAD command 
> overridable in package/Makefile.package.in, like this:
> 
> @@ -118,19 +118,19 @@
>  # Retrieve the archive
>  $(BUILD_DIR)/%/.stamp_downloaded:
>  # support make source-check/external-deps
>  ifeq ($(SPIDER),)
>  # Only show the download message if it isn't already downloaded
>  	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
>  		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
>  		$(call MESSAGE,"Downloading")
>  endif
> -	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
> +	$($(PKG)_DOWNLOAD_CMDS)
>  	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
> 
> 
> where of course $(PKG)_DOWNLOAD_CMDS would default to $(call DOWNLOAD,...).
> 
> Would such a patch be applied, if I wrote one?

There's another approach currently being developed: integrate support
for Git/SVN directly into the infrastructure. I hope to see the patch
for this coming pretty soon.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
