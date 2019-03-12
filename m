From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2019 19:42:37 +0100
Subject: [Buildroot] [PATCH 1/2] printvars: don't print anything when
 VARS is not set
In-Reply-To: <20190312175535.18152-1-arnout@mind.be>
References: <20190312173602.GE25009@scaer>
 <20190312175535.18152-1-arnout@mind.be>
Message-ID: <20190312184237.GF25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 18:55 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Using 'make printvars' for printing all variables is not very useful.
> E.g. all macros will output some bogus value. In addition, the same can
> be achieved with 'make -p'.
> 
> We can simply remove the condition on $(VARS). If VARS is not set, the
> filter expression will be empty which matches nothing, so nothing is
> printed.
> 
> Note that the old behaviour can still be achieved with:
> make printvars VARS=%

... with a very minor difference: now, the VARS variable is present when
it was not for a simple 'printavrs'.

I also wondered if we should not just error out now when VARS is empty
(or unset, which is the same in make), or people used to using printvars
and parsing the output, could get confused somehow. But oh well, that
case was already broken anyway...

> Update the 'make help' text to match the new behaviour.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a64196f9c3..6af8923892 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1031,7 +1031,7 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
>  printvars:
>  	@:
>  	$(foreach V, \
> -		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
> +		$(sort $(filter $(VARS),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
>  		$(if $(QUOTED_VARS),\
> @@ -1124,7 +1124,7 @@ help:
>  	@echo '  source                 - download all sources needed for offline-build'
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
> -	@echo '  printvars              - dump all the internal variables'
> +	@echo '  printvars              - dump internal variables selected with VARS=...'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
