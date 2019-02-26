From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Feb 2019 22:15:47 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: speed up
 RECURSIVE_FINAL_DEPENDENCIES
In-Reply-To: <20190225235504.486-1-tpiepho@impinj.com>
References: <20190225235504.486-1-tpiepho@impinj.com>
Message-ID: <20190226211547.GC15265@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Teent, All,

On 2019-02-25 23:55 +0000, Trent Piepho spake thusly:
> Evaluating all the <PKG>_RECURSIVE_FINAL_DEPENDENCIES variables
> (abbreviated RFD hereafter) ends up being quite slow.  Enough, on a
> reasonable modern workstation, to increase the time it takes to run
> "make printvars" from 13 seconds in 2018.02 to 371 seconds in 2019.02.
> 
> This patch improves this by using dynamic programming to speed the
> evaluation of RFD, reducing the before mentioned printvars time to about
> 14.6 seconds.
> 
> The evaluation of PKG1_RFD requires recursively evaluating each of
> PKG1's dependencies' RFDs, then their dependencies' RFDs, and so on.
> The same is done for PKG2_RFD.  But it's likely that many of the
> dependencies of PKG2 are the same as PKG1.  And when we consider all
> packages, the dependencies are re-computed many thousands of times.
> 
> To avoid this re-computation we memoize, or save, the computed value of
> each RFD variable when it found the first time.  Subsequent evaluations
> re-use the memoized value.
> 
> Surprisingly, this ends up being not all the hard to implement in make.
> The basic construct is this:
> 
> VAR = $(if !defined(VAR__X),$(eval VAR__X := value))$(VAR__X)

Thanks for this: I learnt a very interesting piece of makefile code. I'm
eager to re-use it everywhere, now! ;-]

> The first time VAR is evaluated VAR__X will not be defined, and code to
> set VAR__X to the computed value is eval'd.  Then the now defined value
> of VAR__X is returned.  Subsequent evaluations can just return VAR__X.
> 
> It is important to note that VAR is defined with '=', as not enough
> information (namely, all packages' dependencies) is know when it is
> parsed to find the correct value.  VAR will be evaluated each time it is
> used.  But VAR__X is defined with ":=", so that it is evaluated once
> when defined, and not each time it is used.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
> 
> I did 20 runs of printvars VARS="%_RFD" of this version vs the one that
> used strip + sort.  Mean was 3.19730 vs 3.13765 seconds, in favor of
> this one being faster.

Here, the timings were slightly reversed, with the strip + sort being a
bit faster than just sort. I think it might be due to you and I using
different config files, where the dependency depths and widths [0] are
different, and thus favour one or the other in intricate manners.

So I did a few randconfigs, and it turns out that indeed the order
fluctuates slightly, with sort+strip sometimes wining, sometimes losing.

And either way, the delta is in the sub-second range, now. So I think
one is as good as the other, so:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thank you! :-)

Regards,
Yann E. MORIN.

>  More importantly, the p-value for a one sided
> t-test was 0.007353, so the difference is statistically significant.  I
> also compared the time to run "make help", to measure the parse time,
> and there was not a statistically significant difference.
> 
> 
>  package/pkg-generic.mk | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f4c9148d8b..8cd156afdb 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -678,14 +678,17 @@ $(2)_FINAL_ALL_DEPENDENCIES = \
>  		$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES) \
>  		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
>  		$$($(2)_FINAL_PATCH_DEPENDENCIES))
> -$(2)_FINAL_RECURSIVE_DEPENDENCIES = \
> -	$$(sort \
> -		$$(foreach p,\
> -			$$($(2)_FINAL_ALL_DEPENDENCIES),\
> -			$$(p)\
> -			$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES)\
> -		)\
> -	)
> +$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
> +	$$(if $$(filter undefined,$$(origin $(2)_FINAL_RECURSIVE_DEPENDENCIES__X)), \
> +		$$(eval $(2)_FINAL_RECURSIVE_DEPENDENCIES__X := \
> +			$$(foreach p, \
> +				$$($(2)_FINAL_ALL_DEPENDENCIES), \
> +				$$(p) \
> +				$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES) \
> +			) \
> +		) \
> +	) \
> +	$$($(2)_FINAL_RECURSIVE_DEPENDENCIES__X))
>  
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
> -- 
> 2.14.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
