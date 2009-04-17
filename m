From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 17 Apr 2009 07:00:19 +0200
Subject: [Buildroot] tslib broken
In-Reply-To: <49E75DDE.60605@carallon.com>
References: <49E75DDE.60605@carallon.com>
Message-ID: <20090417070019.72d26189@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2009 17:33:34 +0100
Will Wagner <will_wagner@carallon.com> wrote:

<snipp>

> Index: package/tslib/tslib.mk
> ===================================================================
> --- package/tslib/tslib.mk	(revision 25500)
> +++ package/tslib/tslib.mk	(working copy)
> @@ -15,8 +15,25 @@
>  TSLIB_CONF_OPT = \
>  	--enable-shared	\
>  	--prefix=/usr	\
> -	--sysconfdir=/etc
> +	--sysconfdir=/etc \
> +	--disable-linear-h2200 \
> +	--disable-ucb1x00 \
> +	--disable-corgi \
> +	--disable-collie \
> +	--disable-h3600 \
> +	--disable-mk712 \
> +	--disable-arctic2 \
> +	--enable-input
> 

Looks sane, as long as nobody uses the specific old style touch
interfaces. AFAIK /dev/input/event is the way to go these days.
 
>  TSLIB_DEPENDENCIES = uclibc
>  
>  $(eval $(call AUTOTARGETS,package,tslib))
> +	
> +$(TSLIB_HOOK_POST_EXTRACT):
> +	-rm package/tslib/tslib-1.0-absbit.patch
> +	-rm
> package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch

Huh? This looks wrong. Do you mean to remove .orig patch files from the
extracted directory? If so, please refresh the patches using quilt:

QUILT_DIFF_OPTS="-p --ignore-blank-lines --strip-trailing-cr" quilt
refresh -p ab --no-timestamps --no-index

My preferred way of making patches for Buildroot that are smooth to
source control.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
