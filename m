From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 6 Oct 2008 14:29:20 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
In-Reply-To: <871vyt1oxs.fsf@macbook.be.48ers.dk>
References: <20081006191441.EF9D33C7C5@busybox.net>
	<871vyt1oxs.fsf@macbook.be.48ers.dk>
Message-ID: <bbbeeccd0810061329yc5b7c4av1e01fc8cc580f724@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 6, 2008 at 1:52 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "wberrier" == wberrier  <wberrier@uclibc.org> writes:
>
>  wberrier> Author: wberrier
>  wberrier> Date: 2008-10-06 12:14:41 -0700 (Mon, 06 Oct 2008)
>  wberrier> New Revision: 23604
>
>  wberrier> Log:
>  wberrier> ccache:
>  wberrier> -Allow user to specify custom ccache location.
>
>
> ...
>
>
>  wberrier> +config BR2_CCACHE_DIR
>  wberrier> +    string "ccache dir location?"
>  wberrier> +    depends on BR2_CCACHE
>  wberrier> +    default "$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
>  wberrier> +    help
>  wberrier> +        Where ccache should store cached files.
>  wberrier> +
>  wberrier> +comment "ccache dir location?       - disabled (requires ccache support)"
>  wberrier> +    depends on !BR2_CCACHE
>  wberrier> +
>
>
> Do we really need that comment line? Would anyone go looking for
> something like this if they weren't using ccache in the first place?

Good point.  Fixed.

>
>
>  wberrier> Modified: trunk/buildroot/toolchain/ccache/ccache.mk
>  wberrier> ===================================================================
>  wberrier> --- trunk/buildroot/toolchain/ccache/ccache.mk       2008-10-06 19:09:14 UTC (rev 23603)
>  wberrier> +++ trunk/buildroot/toolchain/ccache/ccache.mk       2008-10-06 19:14:41 UTC (rev 23604)
>  wberrier> @@ -24,8 +24,9 @@
>  wberrier>      # Should probably patch things to use a relative path.
>  wberrier>      $(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
>  wberrier>              $(CCACHE_DIR1)/execute.c
>  wberrier> -    # WARNING - this will break if the toolchain build dir is deleted.
>  wberrier> -    $(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
>  wberrier> +    # WARNING - this will break if the toolchain build dir is deleted
>  wberrier> +    #       when using the default cache dir location.
>  wberrier> +    $(SED) "s,getenv(\"CCACHE_DIR\"),\"$(BR2_CCACHE_DIR)\",g" \
>
>
> Why do we even do this in the first place? What's wrong with the user
> simply setting CCACHE_DIR like they expect to do for ccache?

I'm not sure why it was done originally, but the intent was to make it
configurable without ruffling too many feathers.

Wade
