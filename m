From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:29:37 +0100
Subject: [Buildroot] [PATCH v2] ejabberd: Bump to version 17.11
In-Reply-To: <20180119162931.27721-1-johan.oudinet@gmail.com>
References: <20180119162931.27721-1-johan.oudinet@gmail.com>
Message-ID: <20180129222937.31264d2d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jan 2018 17:29:31 +0100, Johan Oudinet wrote:
> * Adapt all patches.
> * Use the new configure option enable-system-deps even though there is
>   still a patch needed to correct includes.
> * Disable graphics to not depends on X libraries. Disable also
>   mod_avatar from the default loaded modules, since this module
>   requires graphics enabled.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Thanks for this new version, I've applied to master. However, I have
one question below.


> -EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
> +# Install check-erlang-lib script to the directory in which the
> +# package has been uncompressed, so it is available during the
> +# configure step.
> +define EJABBERD_INSTALL_CHECK_ERLANG_LIB
> +	$(INSTALL) -m 0755 $(EJABBERD_PKGDIR)/check-erlang-lib \
> +		$(@D)/check-erlang-lib
> +endef
> +
> +EJABBERD_POST_EXTRACT_HOOKS += EJABBERD_INSTALL_CHECK_ERLANG_LIB
> +
> +EJABBERD_ERLANG_LIBS = sasl public_key mnesia inets compiler
>  
>  # Guess answers for these tests, configure will bail out otherwise
>  # saying error: cannot run test program while cross compiling.
>  EJABBERD_CONF_ENV = \
>  	ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
>  	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
> -		ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
> +		ac_cv_erlang_lib_dir_$(lib)="`./check-erlang-lib $(lib)`")

Why did you change the location of check-erlang-lib ? What was the
problem ? It looked like a good idea to directly used it from
package/ejabberd/ instead of copying it.

Could you explain this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
