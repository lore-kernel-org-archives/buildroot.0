From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 11:35:14 +0200
Subject: [Buildroot] ccache dependency issues
In-Reply-To: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
References: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
Message-ID: <20130801113514.495c3b0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 1 Aug 2013 11:26:33 +0200, Thomas De Schampheleire wrote:

> I have tested following patch successfully:
> > http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar
> 
> This patch changes package/tar/tar.mk to set the host compiler to
> HOSTCC_NOCCACHE. Thinking further however, I think there could be a
> better solution.
> 
> host-ccache is built is part of BASE_PKGS, which comes after the

I guess you meant BASE_TARGETS.

> 'dependencies' target. This means that when the dependencies are
> built, there will never be a ccache yet. Hence, a more global solution
> looks to be:
> 
> diff --git a/support/dependencies/dependencies.mk
> b/support/dependencies/dependencies.mk
> index a2d229c..6fd1df1 100644
> --- a/support/dependencies/dependencies.mk
> +++ b/support/dependencies/dependencies.mk
> @@ -25,6 +25,7 @@ core-dependencies:
>                 DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
>                 $(TOPDIR)/support/dependencies/dependencies.sh
> 
> +dependencies: HOSTCC=$(HOSTCC_NOCCACHE) HOSTCXX=$(HOSTCXX_NOCCACHE)
>  dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
> 
>  dependencies-source:
> 
> Here we force HOSTCC and HOSTCXX to the no-ccache version, only during
> the dependencies step. This also fixes the host-tar/ccache chicken-egg
> problem (tested), and will also help with other dependencies (for
> example I assume that the host-xzcat will suffer from the same issue
> when ccache is enabled).
> 
> What do you think of this solution?

This indeed looks like a much better solution. I think it would be even
better if host-ccache was moved from BASE_TARGETS to
DEPENDENCIES_HOST_PREREQ. I.e, the main Makefile chunk

ifeq ($(BR2_CCACHE),y)
BASE_TARGETS += host-ccache
endif

would be moved to support/dependencies/dependencies.mk as:

ifeq ($(BR2_CCACHE),y)
DEPENDENCIES_HOST_PREREQ += host-ccache
endif

and then we can also remove the usage of HOSTCC_NOCCACHE from
package/ccache/ccache.mk.

This way, all the package that should not rely on ccache availability
are built as part of the 'dependencies' target, and as soon as we enter
$(BASE_TARGETS), we now that we have ccache available.

> Loosely related to this: it seems there also is a HOSTCPP variable,
> but it is never changed in the context of ccache settings (see e.g.
> Makefile), while it is passed to configure scripts of autotools
> packages. Shouldn't there be a HOSTCPP_NOCCACHE as well, to be
> correct?

Does executing cpp through ccache makes sense? For now, HOSTCPP is
always 'cpp', regardless of whether ccache is enabled or not, so there
should not be any problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
