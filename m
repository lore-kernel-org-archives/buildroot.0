From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Oct 2008 21:52:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
In-Reply-To: <20081006191441.EF9D33C7C5@busybox.net> (wberrier@uclibc.org's
	message of "Mon\, 6 Oct 2008 12\:14\:41 -0700 \(PDT\)")
References: <20081006191441.EF9D33C7C5@busybox.net>
Message-ID: <871vyt1oxs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "wberrier" == wberrier  <wberrier@uclibc.org> writes:

 wberrier> Author: wberrier
 wberrier> Date: 2008-10-06 12:14:41 -0700 (Mon, 06 Oct 2008)
 wberrier> New Revision: 23604

 wberrier> Log:
 wberrier> ccache:
 wberrier> -Allow user to specify custom ccache location.


...


 wberrier> +config BR2_CCACHE_DIR
 wberrier> +	string "ccache dir location?"
 wberrier> +	depends on BR2_CCACHE
 wberrier> +	default "$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
 wberrier> +	help
 wberrier> +	    Where ccache should store cached files.
 wberrier> +
 wberrier> +comment "ccache dir location?       - disabled (requires ccache support)"
 wberrier> +	depends on !BR2_CCACHE
 wberrier> +


Do we really need that comment line? Would anyone go looking for
something like this if they weren't using ccache in the first place?


 wberrier> Modified: trunk/buildroot/toolchain/ccache/ccache.mk
 wberrier> ===================================================================
 wberrier> --- trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-06 19:09:14 UTC (rev 23603)
 wberrier> +++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-06 19:14:41 UTC (rev 23604)
 wberrier> @@ -24,8 +24,9 @@
 wberrier>  	# Should probably patch things to use a relative path.
 wberrier>  	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
 wberrier>  		$(CCACHE_DIR1)/execute.c
 wberrier> -	# WARNING - this will break if the toolchain build dir is deleted.
 wberrier> -	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
 wberrier> +	# WARNING - this will break if the toolchain build dir is deleted
 wberrier> +	#	when using the default cache dir location.
 wberrier> +	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(BR2_CCACHE_DIR)\",g" \


Why do we even do this in the first place? What's wrong with the user
simply setting CCACHE_DIR like they expect to do for ccache?

-- 
Bye, Peter Korsgaard
