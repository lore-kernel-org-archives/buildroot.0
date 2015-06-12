From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:24:22 +0200
Subject: [Buildroot] [PATCH 1/4] core/pkg-kconfig: ensure kconfig file
 and fragments exist
In-Reply-To: <22cb4293142894b08d3103f39ceaa2351b0e357b.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <22cb4293142894b08d3103f39ceaa2351b0e357b.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <20150612232422.4a12fc2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat,  6 Jun 2015 13:54:23 +0200, Yann E. MORIN wrote:
> Because the base kconfig file has a dependency but no rule, make will
> always try to rebuild targets that depend on it:
> 
>     https://www.gnu.org/software/make/manual/make.html#Force-Targets
> 
> To complexify things yet a little bit more, missing kconfig fragments
> are properly caught,

What do you mean by "are properly caught" ? Also, I don't see the
interaction between this and the previous paragraph, and hence the "To
complexity things yet a little bit more"

> but since they could be bundled in the package,
> they should depend on it being extracted. And then we'd have the same
> issue as with the base kconfig file, above.

"then" what ?

> Furthermore, merge-config.sh does not check for the existence of the
> fragments, not even the existence of the base file.

How is this related to the previous paragraph ?

> So, this patch does more than one single thing, but they are clearly all
> pretty much inter-woven each with the others, and thus are done together:
> 
>   - make kconfig fragments depend on the package being patched, like the
>     base kconfig file,
> 
>   - manualy check that the base and fragments do exist.

manually

> -# The config file could be in-tree, so before depending on it the package should
> -# be extracted (and patched) first
> -$$($(2)_KCONFIG_FILE): | $(1)-patch
> +# The config file as well as the fragments could be in-tree, so before
> +# depending on them the package should be extracted (and patched) first
> +$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch

This part makes complete sense.

>  # The specified source configuration file and any additional configuration file
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
>  # full .config first. We use 'make oldconfig' because this can be safely
>  # done even when the package does not support defconfigs.
> +#
> +# merge-config.sh does not check for the existence of the fragments, not even
> +# the existence of the base file, so we do it manually.
> +#
>  $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> +	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
> +		if [ ! -f "$$$${f}" ]; then \
> +			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
> +			exit 1; \
> +		fi; \
> +	done

And this one as well.

So basically, I understand the code, but absolutely not the commit
log :-)

And also, I don't understand why those two things are so much
"inter-woven" that they cannot be done in two separate patches. It's
actually two very separate things: 1/ support kconfig fragments bundled
in the package source code (chunk 1) and 2/ check that they exist
(chunk 2).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
