From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 15:23:33 +0200
Subject: [Buildroot] [PATCH] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
References: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161023152333.3f9d3f64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Sep 2016 14:56:11 +0200, Yann E. MORIN wrote:
> Finding the packages that select another one in a specific configuration
> is not very trivial:
> 
>   - when optional, the dependency is not expressed in Kconfig
> 
>   - looking at the .mk files is not very nice.
> 
> Introduce a way to dump reverse dependencies of packages, i.e. the list
> of packages that directly depend on that package. Like for direct
> dependencies, we limit the list to the first-order reverse dependencies.
> 
> Document it in the main help; use the opportunity to also docuemnt
> foo-show-depends.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I was about to apply this patch, but after testing it, I'm a little bit
skeptical.

The current <foo>-show-depends only shows the dependencies according to
the current configuration. So, if a package A has:

A_DEPENDENCIES = B

ifeq ($(BR2_PACKAGE_C),y)
A_DEPENDENCNIES += C
endif

and BR2_PACKAGE_C is not enabled, then "make A-show-depends" will only
show "B" but not C.

However, make <foo>-show-rdepends shows all possible reverse
dependencies, even the ones that are not enabled in the current
configuration. So let's say you have packages A, B, C and D.

a.mk:
A_DEPENDENCIES = D

b.mk:
B_DEPENDENCIES = D

c.mk:
ifeq ($(BR2_PACKAGE_C_SUPPORT_FOR_D),y)
C_DEPENDENCIES += D
endif

with:

 BR2_PACKAGE_A=y
 # BR2_PACKAGE_B is not set
 # BR2_PACKAGE_C is not set
 BR2_PACKAGE_D=y

Then, doing:

  make D-show-rdepends

will list both A and B, even if:

 1/ B is not enabled in the current configuration

 2/ C could potentially be a reverse dependency of A

So in the end, I find the semantic of this "show-rdepends" a bit weird.
It shows reverse dependencies, some according to the current
configuration, some not.

It feels a bit weird :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
