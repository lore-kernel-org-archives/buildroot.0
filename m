From: Daniel J Laird <daniel.j.laird@nxp.com>
Date: Wed, 29 Oct 2008 16:33:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <87skqf7bja.fsf@macbook.be.48ers.dk>
References: <20081029124939.6BC543C368@busybox.net>
	<87skqf7bja.fsf@macbook.be.48ers.dk>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B20D9A20@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_AC_CV_FUNC_MALLOC_0_NONNULL value seems to depend up a value called MALLOC_GLIBC_COMPAT.  This is only set in the uClibC config files.  This means GLIBC based external toolchains cant use this BR2_AC_CV_FUNC_MALLOC_0_NONNULL if they want it set to yes like libpng does.  

1. We could add the calloc stuff
2. We could have
ac_cv_have_decl_malloc=yes \
gl_cv_func_malloc_0_nonnull=yes \
ac_cv_func_malloc_0_nonnull=yes \
ac_cv_func_calloc_0_nonnull=yes \
ac_cv_func_realloc_0_nonnull=yes

When using an external toolchain as well

Any thoughts?

Cheers
Dan


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Peter Korsgaard
Sent: 2008 Oct 29 13:53
To: buildroot at uclibc.org
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/libpng

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-10-29 05:49:38 -0700 (Wed, 29 Oct 2008)
 laird> New Revision: 23851

 laird> Log:
 laird> package/libpng/libpng.mk: Change to autotools.in format

 laird> Move libpng into the new era.....

Cool.

 laird> +LIBPNG_CONF_ENV = \
 laird>  		ac_cv_have_decl_malloc=yes \
 laird>  		gl_cv_func_malloc_0_nonnull=yes \
 laird>  		ac_cv_func_malloc_0_nonnull=yes \
 laird>  		ac_cv_func_calloc_0_nonnull=yes \
 laird> -		ac_cv_func_realloc_0_nonnull=yes \

We have a BR2_AC_CV_FUNC_MALLOC_0_NONNULL for this (it seems to be
missing calloc though).

 laird> +LIBPNG_CONF_OPT = \
 laird>  		--without-libpng-compat \
 laird> -		--without-x \
 laird> -	)
 laird> -	touch $@
 laird> +		--without-x

Does libpng configure really have a --without-x option? I'm pretty
sure it doesn't.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
