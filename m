From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Oct 2009 16:42:53 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091025224056.59c9a6ef@surf>
References: <20091025224056.59c9a6ef@surf>
Message-ID: <20091029164253.5ffa870c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 25 Oct 2009 22:40:56 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

>  1. Use make variables, such as :

FWIW, since only Lionel gave his opinion and because as him I was more
convinced by make variables, I followed this path.

>     This approach is the one used by OpenWRT. The only drawback of
> this approach is that since the variables are defined *before* calling
>     the generating function $(eval $(call ...)), we don't have access
>     to any variable that could be defined by the generating function.
>     So, for example, the ICU_COMPILE variable must use
>     $(@D)/$(ICU_SUBDIR) as the directory for the sources, instead of
>     something like $(ICU_SRCDIR) that could be defined by the package
>     infrastructure. In OpenWRT, they solved this problem by having a
>     "include package.mk" after the package definition (name, version,
>     URL, etc.), but before the definition of the different steps. But
>     in our case, this means having two $(eval $(call ...)).

In fact this is not true. By escaping the variable expansions, it is
possible to post-pone the moment at which variables are expanded.

If you do :

======================================================================
define PKG_COMPILE
 make -C $($(PKG)_SRCDIR)
endef

$(eval $(call PKGTARGETS,package,foo,target))
======================================================================

Then it doesn't work since $(PKG)_SRCDIR is defined while evaluating
PKGTARGETS. But if you do:

======================================================================
define PKG_COMPILE
 make -C $$($$(PKG)_SRCDIR)
endef

$(eval $(call PKGTARGETS,package,foo,target))
======================================================================

Then things work as expected. Therefore, I've solved what I thought to
be the main drawback of the "make variables" solution, which is also
why I've choosen to go deeper into this direction.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
