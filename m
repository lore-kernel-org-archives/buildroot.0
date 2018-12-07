From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Dec 2018 12:30:55 +0100
Subject: [Buildroot] [PATCH 1/1] core/sdk: don't mangle symlinks with
 '.' or '..' at start
In-Reply-To: <20181207035052.316-1-JoelsonCarl@gmail.com>
References: <20181207035052.316-1-JoelsonCarl@gmail.com>
Message-ID: <20181207113055.GG2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel, All,

On 2018-12-06 20:50 -0700, Joel Carlson spake thusly:
> The previous transform of changing any '.' at the start of a line to
> $(BR2_SDK_PREFIX) mangles any symlinks with a relative path starting
> with '.' or '..' in the host folder, as --transform operates on the link
> target as opposed to the link name.
> 
> You might end up with something like:
> $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
> $(BR2_SDK_PREFIX)./opt/ext-toolchain/bin/aarch64-linux-gnu-ar

Dang right... :-/

> when it should be:
> $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
> ../opt/ext-toolchain/bin/aarch64-linux-gnu-ar
> 
> Instead, don't change to HOST_DIR when creating the tarball, and pass
> the path to HOST_DIR. Tar will strip the leading / from member names,
> so then transform that path (HOST_DIR with leading / removed) to
> BR2_SDK_PREFIX.
> 
> However hardlinks are still linking to HOST_DIR, so do an additional
> transform of $(HOST_DIR) (keeping the leading slash) to BR2_SDK_PREFIX
> in order to catch those.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
> If accepted, this should probably get put on 2018.11.x.
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 37df98520e..668c3e09e0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -591,6 +591,7 @@ prepare-sdk: world
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>  
>  BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
> +HOST_DIR_NO_LEAD_SLASH=$(shell echo $(HOST_DIR) | tail -c +2)
>  .PHONY: sdk
>  sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
>  	@$(call MESSAGE,"Generating SDK tarball")
> @@ -598,8 +599,8 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
>  	$(Q)mkdir -p $(BINARIES_DIR)
>  	$(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
>  		--owner=0 --group=0 --numeric-owner \
> -		--transform='s#^\.#$(BR2_SDK_PREFIX)#' \
> -		-C $(HOST_DIR) "."
> +		--transform='s#^$(HOST_DIR_NO_LEAD_SLASH)#$(BR2_SDK_PREFIX)#' \
> +		--transform='s#^$(HOST_DIR)#$(BR2_SDK_PREFIX)#' $(HOST_DIR)

Well, I am not too fond of this new HOST_DIR_NO_LEAD_SLASH variable,
since it is used in a single location. And calling to the shell is not
nice either.

What about replaciong that with just:

    $(patsubst /%,%,$(HOST_DIR))

Now, this fixup is not enough, in fact, because thisleaves symlinks to
absolute paths borked, e.g.:

    /path/to/host/bin/foo -> /path/to/host/bin/bar

is turned into:

    /path/to/new/host/bin/foo -> sdkprefix/bin/bar

which obviously is incorrect.

So we need more work in this area, and the first thing we should do is
to transform absolute symlinks into relative ones, to be done in the
prepare-sdk rule, I suppose...

Regards,
Yann E. MORIN.

>  RSYNC_VCS_EXCLUSIONS = \
>  	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
