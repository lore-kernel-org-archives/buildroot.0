From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jul 2015 19:03:46 +0200
Subject: [Buildroot] [PATCH v3 1/2] Add
	TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS
In-Reply-To: <1437693007-13320-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1437693007-13320-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150724170346.GA3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-07-24 01:10 +0200, Vicente Olivert Riera spake thusly:
> ...for toolchains with non-standard tarballs.
> 
> Following the same logic as <PKG>_STRIP_COMPONENTS (commit 73b9a5e), we

Not only is it the same logic, but toolchain-external are treated like
all other packages. The fact that _STRIP_COMPONENT did not work for
external toolchains is because the _EXTRACT_CMDS are overriden and
we're not using the "generic" one.

If we did not have the extract commands override, it would have already
been handled.

Thus, adding TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS is only re-instating
the default behaviour.

> also allow the posibility to specify a --strip-components level for
> external toolchains by setting the TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS
> variable.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 5ce4d33..2254248 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -408,6 +408,10 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
>  TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
>  
> +ifeq ($(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS),)
> +TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 1
> +endif

This should not be needed, as toolchain-external is itself a standard
package. This variable, if not already set, is automatically set to 1
in the generic infra.

>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
>  # Special handling for Blackfin toolchain, because of the split in two
>  # tarballs, and the organization of tarball contents. The tarballs
> @@ -426,7 +430,7 @@ else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
>  define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
>  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
> -		$(TAR) --strip-components=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> +		$(TAR) --strip-components=$(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS) --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -

So, we have our custom extract commands just to exclude the locale
stuff? And I even reviewed that! ;-)

So, if we had a way to pass those exclude patterns to the generic infra,
we would no longer need to override the extract command. Hmm... But only
two packages (toolchain-external and gcc) need to exclude stuff, so
maybe it is not worth the effort. Thomas?

Regards,
Yann E. MORIN.

>  	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
>  endef
>  endif
> -- 
> 2.3.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
