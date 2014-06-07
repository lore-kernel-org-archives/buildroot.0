From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 10:49:59 +0200
Subject: [Buildroot] [PATCH 1 of 7 v3] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <b1861ead49778767b075.1402085577@localhost>
References: <patchbomb.1402085576@localhost>
 <b1861ead49778767b075.1402085577@localhost>
Message-ID: <20140607104959.70b268b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 06 Jun 2014 22:12:57 +0200, Thomas De Schampheleire wrote:

> In some cases, this would potentially cause circular references, in
> particular when the value of HOST_FOO_VAR would be obtained from the
> corresponding FOO_VAR if HOST_FOO_VAR is not defined. In these cases, a test
> is added to check for a host package (the only case where such constructions
> are relevant; these are not circular).

I'm not sure to understand this part really well.

>  ifndef $(2)_LIBTOOL_PATCH
>   ifdef $(3)_LIBTOOL_PATCH
> -  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
> +  $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
>   else
>    $(2)_LIBTOOL_PATCH ?= YES
>   endif

In this chunk, we are defining HOST_FOO_BAR depending on FOO_BAR, and
it's not enclosed in a ifeq ($(4),host) test.

But here:

> +ifeq ($(4),host)
> + $(2)_AUTORECONF_OPT ?= $$($(3)_AUTORECONF_OPT)
> +endif

and here:

> -$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
> +ifeq ($(4),host)
> +$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
>  				host-toolchain $(1),\

You're adding this ifeq ($(4),host). Can you explain a little bit more
what the problem is, and why it isn't solved in the same way in all
places?

Other than that, I looked through the patch and couldn't spot any other
thing that looked problematic or raised questions.

Thanks for doing this work, quite certainly a bit boring to do, but
definitely very useful! We'll have to be careful in the future when
changes are made to the 'inner' functions, but I'm sure you'll be there
to point out the mistakes made in patches contributed by others!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
